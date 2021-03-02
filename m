Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0DA532A86B
	for <lists+linux-media@lfdr.de>; Tue,  2 Mar 2021 18:44:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349837AbhCBRgy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Mar 2021 12:36:54 -0500
Received: from aer-iport-4.cisco.com ([173.38.203.54]:22485 "EHLO
        aer-iport-4.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350234AbhCBMDm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Mar 2021 07:03:42 -0500
X-Greylist: delayed 594 seconds by postgrey-1.27 at vger.kernel.org; Tue, 02 Mar 2021 07:03:41 EST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1887; q=dns/txt; s=iport;
  t=1614686621; x=1615896221;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=VYFWGUVFfJ9vqOldAjOd3gHOgqYYg8eK0KtkxZZdGZI=;
  b=a/WCRTM66VoQxhdR6NGRPlAwSUDvoTDCjlWhlVczEFQC0PBF3atExMo8
   5rI9MDpQSzKaH7pCnee4BDEPm1i6x4d5Vqc9ZLwt4+HMhwYhcPZQp5P7m
   vMTI3BiAQYBc8PXasSpwar0YjzMc3fCqWY1D2I6WmkcUBxH3AOMiZDQ81
   0=;
X-IronPort-AV: E=Sophos;i="5.81,216,1610409600"; 
   d="scan'208";a="33781837"
Received: from aer-iport-nat.cisco.com (HELO aer-core-1.cisco.com) ([173.38.203.22])
  by aer-iport-4.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 02 Mar 2021 11:51:03 +0000
Received: from jf-desktop.rd.cisco.com ([10.47.77.111])
        by aer-core-1.cisco.com (8.15.2/8.15.2) with ESMTP id 122Bp3Lk026163;
        Tue, 2 Mar 2021 11:51:03 GMT
From:   Johan Fjeldtvedt <johfjeld@cisco.com>
To:     linux-media@vger.kernel.org, hverkuil@xs4all.nl
Cc:     Johan Fjeldtvedt <johfjeld@cisco.com>
Subject: [PATCH] media: cec-notifier: also search for HDMI devices on I2C
Date:   Tue,  2 Mar 2021 12:50:56 +0100
Message-Id: <20210302115056.2106652-1-johfjeld@cisco.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.47.77.111, [10.47.77.111]
X-Outbound-Node: aer-core-1.cisco.com
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently the cec_notifier_parse_hdmi_phandle function can only be used
if the HDMI device associated with the CEC device is a platform device.
Extend the function to cover I2C devices as well, as there do exist
some I2C HDMI devices which don't handle CEC internally and need an
external CEC adapter.

Signed-off-by: Johan Fjeldtvedt <johfjeld@cisco.com>
---
 drivers/media/cec/core/cec-notifier.c | 30 +++++++++++++++++----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/drivers/media/cec/core/cec-notifier.c b/drivers/media/cec/core/cec-notifier.c
index 95f363bb1d19..eec114908c0f 100644
--- a/drivers/media/cec/core/cec-notifier.c
+++ b/drivers/media/cec/core/cec-notifier.c
@@ -221,19 +221,27 @@ struct device *cec_notifier_parse_hdmi_phandle(struct device *dev)
 		dev_err(dev, "Failed to find HDMI node in device tree\n");
 		return ERR_PTR(-ENODEV);
 	}
+
 	hdmi_pdev = of_find_device_by_node(np);
-	of_node_put(np);
-	if (hdmi_pdev) {
+	if (hdmi_pdev)
 		hdmi_dev = &hdmi_pdev->dev;
-		/*
-		 * Note that the device struct is only used as a key into the
-		 * cec_notifiers list, it is never actually accessed.
-		 * So we decrement the reference here so we don't leak
-		 * memory.
-		 */
-		put_device(hdmi_dev);
-		return hdmi_dev;
+	if (!hdmi_dev) {
+		struct i2c_client *hdmi_client = of_find_i2c_device_by_node(np);
+
+		if (hdmi_client)
+			hdmi_dev = &hdmi_client->dev;
 	}
-	return ERR_PTR(-EPROBE_DEFER);
+	of_node_put(np);
+	if (!hdmi_dev)
+		return ERR_PTR(-EPROBE_DEFER);
+
+	/*
+	 * Note that the device struct is only used as a key into the
+	 * cec_notifiers list, it is never actually accessed.
+	 * So we decrement the reference here so we don't leak
+	 * memory.
+	 */
+	put_device(hdmi_dev);
+	return hdmi_dev;
 }
 EXPORT_SYMBOL_GPL(cec_notifier_parse_hdmi_phandle);
-- 
2.25.1

