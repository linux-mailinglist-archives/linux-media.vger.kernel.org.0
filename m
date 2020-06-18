Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 379661FF0BB
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2020 13:36:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729685AbgFRLfi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Jun 2020 07:35:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729594AbgFRLfh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Jun 2020 07:35:37 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 376D1C0613ED
        for <linux-media@vger.kernel.org>; Thu, 18 Jun 2020 04:35:36 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 5F5EE2A36A5
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org
Subject: [PATCH v4 0/4] media: staging: rkisp1: bugs fixes and vars renames
Date:   Thu, 18 Jun 2020 13:35:14 +0200
Message-Id: <20200618113518.30057-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patchset contains two bug fixes related to the enumeration and
settings of the sink format of the resizer entity.
It also contains two patches, one that rename macros and one
that removes a macro for better readability.

changes from v3:
- reordering the patches, so that the patches that rename/remove macros
come before the the patch "rsz: set default format if the given format is
    not RKISP1_ISP_SD_SRC"
- removing the last two patches from v3 that rename the field 'direction'
and add documentation

changes from v2:
- patch 3 is new - remove macro RKISP1_DIR_SINK_SRC since the code is more readable without it.
- patch 5 - rename 'direction' to 'isp_pads_mask' instead of 'isp_pads_flags'
- patch 6 is new - add documentation of the struct 'rkisp1_isp_mbus_info'

changes from v1:
- added "Fixes: 56e3b29f9f6b "media: staging: rkisp1: add streaming paths"
to the commit log of the first two patches.
- added two patches. One patch rename the macros "RKISP1_DIR_*"
to "RKISP1_ISP_SD_*", another that rename the field 'direction'
in 'struct rkisp1_isp_mbus_info' to 'isp_pads_flags'


Dafna Hirschfeld (4):
  media: staging: rkisp1: rsz: supported formats are the isp's src
    formats, not sink formats
  media: staging: rkisp1: remove macro RKISP1_DIR_SINK_SRC
  media: staging: rkisp1: rename macros 'RKISP1_DIR_*' to
    'RKISP1_ISP_SD_*'
  media: staging: rkisp1: rsz: set default format if the given format is
    not RKISP1_ISP_SD_SRC

 drivers/staging/media/rkisp1/rkisp1-common.h  |  3 ++
 drivers/staging/media/rkisp1/rkisp1-isp.c     | 46 +++++++++----------
 drivers/staging/media/rkisp1/rkisp1-resizer.c |  6 +--
 3 files changed, 27 insertions(+), 28 deletions(-)

-- 
2.17.1

