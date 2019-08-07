Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F5DB8484B
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2019 10:55:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726902AbfHGIzn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Aug 2019 04:55:43 -0400
Received: from mga18.intel.com ([134.134.136.126]:25359 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726244AbfHGIzn (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 7 Aug 2019 04:55:43 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 07 Aug 2019 01:55:42 -0700
X-IronPort-AV: E=Sophos;i="5.64,357,1559545200"; 
   d="scan'208";a="192866432"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 07 Aug 2019 01:55:42 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 2795F201AF
        for <linux-media@vger.kernel.org>; Wed,  7 Aug 2019 11:56:16 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1hvHjz-0002Fe-Do
        for linux-media@vger.kernel.org; Wed, 07 Aug 2019 11:56:15 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 1/1] ov8856: Check reading clock frequency succeeded
Date:   Wed,  7 Aug 2019 11:56:15 +0300
Message-Id: <20190807085615.8612-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of blindly trusting getting the clock frequency succeeded end then
testing it against a pre-defined value, verify reading the value
succeeded.

Fixes: 879347f0c258 ("media: ov8856: Add support for OV8856 sensor")

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov8856.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
index cd347d6b7b9da..8655842af2755 100644
--- a/drivers/media/i2c/ov8856.c
+++ b/drivers/media/i2c/ov8856.c
@@ -1106,7 +1106,10 @@ static int ov8856_check_hwcfg(struct device *dev)
 	if (!fwnode)
 		return -ENXIO;
 
-	fwnode_property_read_u32(fwnode, "clock-frequency", &mclk);
+	ret = fwnode_property_read_u32(fwnode, "clock-frequency", &mclk);
+	if (ret)
+		return ret;
+
 	if (mclk != OV8856_MCLK) {
 		dev_err(dev, "external clock %d is not supported", mclk);
 		return -EINVAL;
-- 
2.20.1

