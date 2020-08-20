Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A15D024B14A
	for <lists+linux-media@lfdr.de>; Thu, 20 Aug 2020 10:50:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726718AbgHTIuP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Aug 2020 04:50:15 -0400
Received: from mga07.intel.com ([134.134.136.100]:10152 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726347AbgHTIuN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Aug 2020 04:50:13 -0400
IronPort-SDR: 81Trco9iCG/P1bok4KVVDB2e2b+/knfi/Qmhxz9CpO63sVo/QRF9pQiONR38k3BROoHC38jY0O
 2ok7ubaYx6Xg==
X-IronPort-AV: E=McAfee;i="6000,8403,9718"; a="219567611"
X-IronPort-AV: E=Sophos;i="5.76,332,1592895600"; 
   d="scan'208";a="219567611"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2020 01:50:12 -0700
IronPort-SDR: OC46V1cQJn/Z5JyMgwqj3pv8NzzuXmMZatzxIOXHjgTo3tuEbdRMK3xfBxIdcqEoocdMWW628v
 lKXqwrXf4u8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,332,1592895600"; 
   d="scan'208";a="498052272"
Received: from ipu5-build.bj.intel.com ([10.238.232.196])
  by fmsmga005.fm.intel.com with ESMTP; 20 Aug 2020 01:50:09 -0700
From:   Bingbu Cao <bingbu.cao@intel.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        shawnx.tu@intel.com
Cc:     senozhatsky@chromium.org, tfiga@chromium.org, bingbu.cao@intel.com,
        bingbu.cao@linux.intel.com, hongju.wang@intel.com
Subject: [PATCH] media: ov5675: correct the maximum exposure value
Date:   Thu, 20 Aug 2020 16:49:09 +0800
Message-Id: <1597913349-24609-1-git-send-email-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

current ov5675 driver did a wrong calculation for the maximum exposure
value, it will cause the auto-exposure can not work as expected, this
patch correct it.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/media/i2c/ov5675.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
index 8537cc4ca108..7592cd50807a 100644
--- a/drivers/media/i2c/ov5675.c
+++ b/drivers/media/i2c/ov5675.c
@@ -666,8 +666,8 @@ static int ov5675_set_ctrl(struct v4l2_ctrl *ctrl)
 	/* Propagate change of current control to all related controls */
 	if (ctrl->id == V4L2_CID_VBLANK) {
 		/* Update max exposure while meeting expected vblanking */
-		exposure_max = (ov5675->cur_mode->height + ctrl->val -
-			       OV5675_EXPOSURE_MAX_MARGIN) / 2;
+		exposure_max = ov5675->cur_mode->height + ctrl->val -
+			OV5675_EXPOSURE_MAX_MARGIN;
 		__v4l2_ctrl_modify_range(ov5675->exposure,
 					 ov5675->exposure->minimum,
 					 exposure_max, ov5675->exposure->step,
-- 
2.7.4

