Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB7972571DC
	for <lists+linux-media@lfdr.de>; Mon, 31 Aug 2020 04:29:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726927AbgHaC3L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 30 Aug 2020 22:29:11 -0400
Received: from mga05.intel.com ([192.55.52.43]:5524 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726573AbgHaC3K (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 30 Aug 2020 22:29:10 -0400
IronPort-SDR: pkFrq++0zwQce+LU4Fkq7OYe3dd54QfszaTP3S6tjZOHxEmRBBim/dLS2mMnsGNJPOgzkmHDsU
 2iBrdvZyNyLw==
X-IronPort-AV: E=McAfee;i="6000,8403,9729"; a="241714028"
X-IronPort-AV: E=Sophos;i="5.76,374,1592895600"; 
   d="scan'208";a="241714028"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2020 19:29:09 -0700
IronPort-SDR: bxnacq5NJLKCGp90GEPPP3g7HUdqNOBuUk+ehjeZ8Is+uEkDysxB6wVAcVXtZK5gKc3EwoJpCW
 /N92Vbcj4nhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,374,1592895600"; 
   d="scan'208";a="501181676"
Received: from ipu5-build.bj.intel.com ([10.238.232.196])
  by fmsmga006.fm.intel.com with ESMTP; 30 Aug 2020 19:29:08 -0700
From:   Bingbu Cao <bingbu.cao@intel.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com
Cc:     tfiga@chromium.org, bingbu.cao@intel.com,
        bingbu.cao@linux.intel.com
Subject: [PATCH v2] media: ov5675: fix typos in comments
Date:   Mon, 31 Aug 2020 10:28:21 +0800
Message-Id: <1598840901-13364-1-git-send-email-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This commit fix the typos in the comments that was involved by previous
commit <d960c75daf2a>.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/media/i2c/ov5675.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
index 9540ce8918f0..4343b2637078 100644
--- a/drivers/media/i2c/ov5675.c
+++ b/drivers/media/i2c/ov5675.c
@@ -689,9 +689,9 @@ static int ov5675_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 
 	case V4L2_CID_EXPOSURE:
-		/* 4 least significant bits of expsoure are fractional part
+		/* 4 least significant bits of exposure are fractional part
 		 * val = val << 4
-		 * for ov5675, the unit of exposure is differnt from other
+		 * for ov5675, the unit of exposure is different from other
 		 * OmniVision sensors, its exposure value is twice of the
 		 * register value, the exposure should be divided by 2 before
 		 * set register, e.g. val << 3.
-- 
2.7.4

