Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EA1C2FD613
	for <lists+linux-media@lfdr.de>; Wed, 20 Jan 2021 17:53:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403808AbhATQwS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jan 2021 11:52:18 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:50552 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389342AbhATQpn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jan 2021 11:45:43 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 944DD1F44F86
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, heiko.stuebner@theobroma-systems.com,
        heiko@sntech.de
Cc:     laurent.pinchart@ideasonboard.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
Subject: [PATCH v7 0/5] Fix the rkisp1 userspace API for later IP versions
Date:   Wed, 20 Jan 2021 17:44:41 +0100
Message-Id: <20210120164446.1220-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,
This is v7 of the rkisp1 fixes set sent by Heiko Stuebner. [0]

In addition to prepare the support to px30 (V12 in the uapi)
This version of the set adds more fixes to the code in params/stats
according to the changes in the uapi and also change the
hist_bins to be u32 instead of u16.

More details about the patchset can be found in v6's cover-letter [1]

[0] https://patchwork.kernel.org/project/linux-media/list/?series=416647
[1] https://patchwork.kernel.org/project/linux-media/cover/20210118110448.275389-1-heiko@sntech.de/

changes since v6:
- add a patch to change the hist_bins array type to __u32 and extend the
documentation of how the histogram measurements are taken
- remove a wrong u8 cast when filling the hist_bins array
- when reducing the number of elements in the weight grid array,
the code in rkisp1-params.c should be adjusted to iterate it 25 times
- some minor typo and checkpatch fixes.

changes since v5:
- move grid reduction for V10 to separate patch (Hans)
- fix commit message (histogram size 28 -> 25) in patch4 (Hans)

changes since v4:
- set GAMMA_OUT to the real 25 instead of the 28 with 3 spares (Dafna)
- start RKISP_Vxx enum with 10 for RKISP_V10 to make output
  easier and also allow userspace to differentiate between old (= 0)
  and newer driver variants (Dafna, Laurent)

changes since v3:
- add patch fixing the original histogram size comment
- make comments in uapi more verbose (Hans)
- fix wording in admin guide (Hans)
- document version <-> soc in uapi as well (easier for people) (Dafna)

changes since v2:
- actually zero the correct sizes for u16 values (hist-bins)
  (kernel-test-robot)

changes since v1:
- drop duplicate isp_ver storage, hw_revision is enough (Dafna)
- document multiple maximum sizes in uapi (Hans)
- document usage of hw_revision field (Hans)
- zero fields transmitted to userspace before adding data (Hans)
- use _V10 field sizes when filling fields, as there is only v10 for now

changes since rfc:
- move rkisp1_version enum into uapo
- show version in media-api hw_revision
- introduce constants for versions and make max use the biggest

Dafna Hirschfeld (2):
  media: rkisp1: uapi: change hist_bins array type from __u16 to __u32
  media: rkisp1: stats: remove a wrong cast to u8

Heiko Stuebner (3):
  media: rockchip: rkisp1: reduce number of histogram grid elements in
    uapi
  media: rockchip: rkisp1: carry ip version information
  media: rockchip: rkisp1: extend uapi array sizes

 Documentation/admin-guide/media/rkisp1.rst    | 16 ++++
 .../platform/rockchip/rkisp1/rkisp1-dev.c     | 21 +++--
 .../platform/rockchip/rkisp1/rkisp1-params.c  |  5 +-
 .../platform/rockchip/rkisp1/rkisp1-stats.c   | 15 +++-
 include/uapi/linux/rkisp1-config.h            | 84 ++++++++++++++++---
 5 files changed, 116 insertions(+), 25 deletions(-)

-- 
2.17.1

