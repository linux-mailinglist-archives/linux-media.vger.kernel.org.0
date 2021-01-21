Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D5282FED3A
	for <lists+linux-media@lfdr.de>; Thu, 21 Jan 2021 15:45:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729720AbhAUOpJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jan 2021 09:45:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728590AbhAUOoz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jan 2021 09:44:55 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D3D8C06174A
        for <linux-media@vger.kernel.org>; Thu, 21 Jan 2021 06:44:15 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 4AD971F45EB6
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        hverkuil@xs4all.nl, sakari.ailus@linux.intel.com, heiko@sntech.de
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, kernel@collabora.com, dafna3@gmail.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org
Subject: [PATCH v8 0/6] Fix the rkisp1 userspace API for later IP versions
Date:   Thu, 21 Jan 2021 15:44:01 +0100
Message-Id: <20210121144407.9045-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is v8 of the rkisp1 fixes set sent by Heiko Stuebner. [0]

In addition to prepare the support to px30 (V12 in the uapi)
This version of the set adds more fixes to the code in params/stats
according to the changes in the uapi and also change the
hist_bins to be u32 instead of u16.

More details about the patchset can be found in v6's cover-letter [1]

[0] https://patchwork.kernel.org/project/linux-media/list/?series=416647
[1] https://patchwork.kernel.org/project/linux-media/cover/20210118110448.275389-1-heiko@sntech.de/

changes since v7:
- in patch 1, wrap long lines
- add a patch that masks out the unused bits in hist_bins enteries.
- in the last patch, in the last patch, remove unneeded memset of the stats arries
- no changes in other patches appart of rebase

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

Dafna Hirschfeld (3):
  media: rkisp1: uapi: change hist_bins array type from __u16 to __u32
  media: rkisp1: stats: remove a wrong cast to u8
  media: rkisp1: stats: mask the hist_bins values

Heiko Stuebner (3):
  media: rockchip: rkisp1: reduce number of histogram grid elements in
    uapi
  media: rockchip: rkisp1: carry ip version information
  media: rockchip: rkisp1: extend uapi array sizes

 Documentation/admin-guide/media/rkisp1.rst    | 16 ++++
 .../platform/rockchip/rkisp1/rkisp1-dev.c     | 21 +++--
 .../platform/rockchip/rkisp1/rkisp1-params.c  |  5 +-
 .../platform/rockchip/rkisp1/rkisp1-regs.h    |  1 +
 .../platform/rockchip/rkisp1/rkisp1-stats.c   | 11 +--
 include/uapi/linux/rkisp1-config.h            | 86 ++++++++++++++++---
 6 files changed, 114 insertions(+), 26 deletions(-)

-- 
2.17.1

