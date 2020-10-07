Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59710285CF5
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 12:35:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727741AbgJGKfz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 06:35:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727737AbgJGKfz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Oct 2020 06:35:55 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0245BC061755
        for <linux-media@vger.kernel.org>; Wed,  7 Oct 2020 03:35:55 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 3FB4228A747
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>, cphealy@gmail.com,
        Benjamin.Bara@skidata.com, l.stach@pengutronix.de,
        Ezequiel Garcia <ezequiel@collabora.com>, kernel@collabora.com
Subject: [PATCH v2 0/6] CODA timeout fix & assorted changes
Date:   Wed,  7 Oct 2020 07:35:38 -0300
Message-Id: <20201007103544.22807-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

The main motivation for this series is to address a PIC_RUN
timeout, which we managed to link with a hardware bitstream
buffer underrun condition.

Upon further investigation we discovered that the underrun
was produced by a subtle issue in the way buffer_meta's were
being tracked.

The issue is fixed by patch "5/6 coda: coda_buffer_meta housekeeping fix".

Patches 1 to 4 are mostly cleanups and minor cosmetic changes.

Finally, while testing with corrupted bitstreams we realized
the driver was logging too verbosely, so patch 6 addresses
this by introducing a private control to read an macroblock-error
counter.

These patches have been tested against media's upstream
and v5.4-based, on i.MX6 (Wandboard) with H.264 and MPEG-2
streams.

In particular, this series manages to fix the PIC_RUN
timeout reported by Benjamin Bara [1].

I believe this timeout can be systematically reproduced with
a video containing small black frames, which can be generated with:

gst-launch-1.0 videotestsrc pattern=black num-buffers=300 ! \
video/x-raw,format=I420,width=176,height=120 ! avenc_mpeg2video ! \
mpegvideoparse ! mpegtsmux ! filesink location=black-qcif-10s.ts

Reviews and feedback are appreciated, as always.

[1] https://lkml.org/lkml/2020/8/21/495

Changelog
---------

v2:
* Keep the error MB message, but move it to coda_dbg(1, ctx).
* Add per-device rate limitting for the error MB message.
* Rename V4L2_CID_CODA_ERR_MB description.
* s/__coda_decoder_drop_used_metas/coda_decoder_drop_used_metas

Ezequiel Garcia (6):
  coda: Remove redundant ctx->initialized setting
  coda: Simplify H.264 small buffer padding logic
  coda: Clarify device registered log
  coda: Clarify interrupt registered name
  coda: coda_buffer_meta housekeeping fix
  coda: Add a V4L2 user for control error macroblocks count

 MAINTAINERS                               |  1 +
 drivers/media/platform/coda/coda-bit.c    | 72 ++++++++++++++++-------
 drivers/media/platform/coda/coda-common.c | 57 +++++++++++++++---
 drivers/media/platform/coda/coda.h        |  5 ++
 include/media/drv-intf/coda.h             | 13 ++++
 include/uapi/linux/v4l2-controls.h        |  4 ++
 6 files changed, 122 insertions(+), 30 deletions(-)
 create mode 100644 include/media/drv-intf/coda.h

-- 
2.27.0

