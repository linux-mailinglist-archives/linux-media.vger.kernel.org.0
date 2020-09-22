Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7534F2740E4
	for <lists+linux-media@lfdr.de>; Tue, 22 Sep 2020 13:34:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726597AbgIVLeO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Sep 2020 07:34:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726562AbgIVLeN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Sep 2020 07:34:13 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3C29C0613CF
        for <linux-media@vger.kernel.org>; Tue, 22 Sep 2020 04:34:12 -0700 (PDT)
Received: from guri.fritz.box (p200300c7cf13ec005877be1094b7a29d.dip0.t-ipconnect.de [IPv6:2003:c7:cf13:ec00:5877:be10:94b7:a29d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 6AB6429B485;
        Tue, 22 Sep 2020 12:34:09 +0100 (BST)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
Subject: [PATCH v3 00/12] media: staging: rkisp1: various bug fixes
Date:   Tue, 22 Sep 2020 13:33:50 +0200
Message-Id: <20200922113402.12442-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix various bugs mainly in params and stats. The patchset fixes
buffers synchronization issues discussed
https://patchwork.kernel.org/patch/11066513/#23544763

As discussed with Tomasz, we decide that in order to keep the code
simple, we assume that the v-start signal (RKISP1_CIF_ISP_V_START)
and the frame-out signal RKISP1_CIF_ISP_FRAME don't arrive together.
So when v-start arrives, the frame sequence is incremented and
when frame-out arrives, the stats and params isr are called.
Also the vb.sequence of the params buffer should be the frame to
which the params are applied.

The params node needs to apply the first params buffer when
the streaming from main/selfpath starts before the first frame arrives
so that the first params buffer will configure the first frame.

The way it is implemented is that the first buffer queued
to the params node is not added to the list but instead a local copy
is saved and the buffer returns to userspace immediately.
Then the local copy is applied when main/selfpath stream starts.
This implementation is buggy for the following reasons:

- The first params buffer is applied and returned to userspace even if
userspace never calls streamon on the params node.
- If the first params buffer is queued after the stream started on the
params node then it will return to userspace but will never be used.
- The frame_sequence of the first buffer is set to -1 if the main/selfpath
did not start streaming.

To fix this, params buffers are added to the buffers list on qbuf and
then when a stream start from selfpath/mainpath then the first buffer is removed
from the list, applied and returned to userspace. This is done only
if the params node is also streaming.

Testing:
I added a code to libcamera that sets the red, blue, and green gain
interchangeably. The frames are then saved to files.
To run the code:

git clone --single-branch --branch test-various-bug-fixes-v3 https://gitlab.collabora.com/dafna/libcamera.git
cd libcamera
ninja  -C build install
meson test rkisp1-ramzor -C build

Then adding debug prints in the params node in the kernel
that prints the gain values and the current frame
http://ix.io/2ue3

Then playing frames with

ffplay -f rawvideo -pixel_format nv12 -video_size 640x480 build/frame-bla-<FRAME-NUM>.bin

and looking that the frame color matches the debug prints.

changes from v2:
* patches 11,12 in v3 are new, they fix the TODO issue "review and comment every lock"
* patches 1,2,4 from v2 are already applied so remove from v3
* patch 13 from v2: "media: staging: rkisp1: call media_pipeline_start/stop from stats and params" - dropped from this version
* patch "media: staging: rkisp1: params: use the new effect value in cproc config"
was reorder to be just before patch "media: staging: rkisp1: params: avoid using buffer if params is not streaming"
* patch 4: declare function 'rkisp1_params_apply_params_cfg' as static to fix a warning reported by 'kernel test robot <lkp@intel.com>'
* patch 5: rephrase commit message and inline doc as suggested by Helen.
* patch 6: add a closing "}" to "if" condition and remove useless inline comment
* patch 7: remove unneeded closing "}" to "if"


changes from v1:
- patch 1 from v1 is removed
- patch 3 from v1 (now patch 5) which refactor the stop_streaming params cb
is changed according to discussion with Tomasz
- 12 new patches added

Dafna Hirschfeld (12):
  media: staging: rkisp1: params: upon stream stop, iterate a local list
    to return the buffers
  media: staging: rkisp1: params: in the isr, return if buffer list is
    empty
  media: staging: rkisp1: params: use the new effect value in cproc
    config
  media: staging: rkisp1: params: avoid using buffer if params is not
    streaming
  media: staging: rkisp1: params: set vb.sequence to be the isp's
    frame_sequence + 1
  media: staging: rkisp1: remove atomic operations for frame sequence
  media: staging: rkisp1: isp: add a warning and debugfs var for irq
    delay
  media: staging: rkisp1: isp: don't enable signal
    RKISP1_CIF_ISP_FRAME_IN
  media: staging: rkisp1: stats: protect write to 'is_streaming' in
    start_streaming cb
  media: staging: rkisp1: params: no need to lock default config
  media: staging: rkisp1: use the right variants of spin_lock
  media: staging: rkisp1: cap: protect access to buf with the spin lock

 drivers/staging/media/rkisp1/TODO             |   1 -
 drivers/staging/media/rkisp1/rkisp1-capture.c |  19 ++-
 drivers/staging/media/rkisp1/rkisp1-common.h  |   7 +-
 drivers/staging/media/rkisp1/rkisp1-dev.c     |   2 +
 drivers/staging/media/rkisp1/rkisp1-isp.c     |  22 ++--
 drivers/staging/media/rkisp1/rkisp1-params.c  | 118 ++++++++----------
 drivers/staging/media/rkisp1/rkisp1-stats.c   |   5 +-
 7 files changed, 76 insertions(+), 98 deletions(-)

-- 
2.17.1

