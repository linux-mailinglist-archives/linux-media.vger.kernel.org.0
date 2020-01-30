Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E285114E419
	for <lists+linux-media@lfdr.de>; Thu, 30 Jan 2020 21:36:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727826AbgA3UgJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jan 2020 15:36:09 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:43395 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727485AbgA3UgI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jan 2020 15:36:08 -0500
Received: by mail-pl1-f193.google.com with SMTP id p11so1781855plq.10
        for <linux-media@vger.kernel.org>; Thu, 30 Jan 2020 12:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bm4YzehtYvCtm+QPiWtk/5LZt32vGs8W5AoWJFGUkv8=;
        b=YcXTlLf9EK4kMX7y9+Kv2Enpr4KpPX5XdXR9xzNVpzvCS1ierMjfJnPEmcISwf62bz
         49UOpx1dWtAl9LVw9AX0rd8G5oRfzTfnEsWeG1Ty800rno3rEvAyLklxJrOYR26sOnYt
         gNHKae6iWSy6+Lb92c+z9407B80Pxt8wm6snI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bm4YzehtYvCtm+QPiWtk/5LZt32vGs8W5AoWJFGUkv8=;
        b=TKMnz8LiGxrwTgZs0tKjE7YsXVG1aA2I3rl3/r8zBJb5bXzoWs44oJeYpiEpqmniha
         V9oDbnosuRkYSXO3mY0LXSckEG3NxbvOIFFgU1uyGd/Me5+d+8F0CzaX9YCHyKQYlUgn
         thZrV4DvOS29Dh5Lw+WWl+JXHLm7Nnq3mmMsn+M6nWi/SFvIFUPp+c76sMPTTBE4ZDN+
         0Z0YTOCaM9IK0ZUo6svEuLLWuXhY3nas2R71KKQ1/PkGJeTwEGIzrk1RXkj+kCAx/597
         pRqVAK+s3wZrOC+AVPK7ExERS0oJ8IgYtgrqo5oZKxmCAajQ8LDRkoCQuVu2OY7vRudT
         SsQA==
X-Gm-Message-State: APjAAAUicIQ/siKTGfeYGonCj2BzmsZ9SoNS+r7W0uOBOi/WX7/SJDUX
        TatdrPXW+MUNGguzBN3orXJrSg==
X-Google-Smtp-Source: APXvYqwlrr3nFu91vdEM3yoKLJV96UxroluhruTPCyhooGDX15GI6iMRabMhFzrDA06h+oMvUze8mA==
X-Received: by 2002:a17:90a:a60c:: with SMTP id c12mr8244503pjq.28.1580416566898;
        Thu, 30 Jan 2020 12:36:06 -0800 (PST)
Received: from pmalani2.mtv.corp.google.com ([2620:15c:202:201:172e:4646:c089:ce59])
        by smtp.gmail.com with ESMTPSA id q12sm7469321pfh.158.2020.01.30.12.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2020 12:36:06 -0800 (PST)
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     Prashant Malani <pmalani@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Gwendal Grignou <gwendal@chromium.org>,
        linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
        (V4L/DVB))
Subject: [PATCH 15/17] media: cros-ec-cec: Use cros_ec_send_cmd_msg()
Date:   Thu, 30 Jan 2020 12:31:06 -0800
Message-Id: <20200130203106.201894-16-pmalani@chromium.org>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200130203106.201894-1-pmalani@chromium.org>
References: <20200130203106.201894-1-pmalani@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Replace cros_ec_cmd_xfer_status() with cros_ec_send_cmd_msg() which does
the message buffer setup and cleanup, but is located in platform/chrome
and used by other drivers.

Signed-off-by: Prashant Malani <pmalani@chromium.org>
---
 .../media/platform/cros-ec-cec/cros-ec-cec.c  | 39 +++++++------------
 1 file changed, 14 insertions(+), 25 deletions(-)

diff --git a/drivers/media/platform/cros-ec-cec/cros-ec-cec.c b/drivers/media/platform/cros-ec-cec/cros-ec-cec.c
index f048e89947850e..0ee7354dca9724 100644
--- a/drivers/media/platform/cros-ec-cec/cros-ec-cec.c
+++ b/drivers/media/platform/cros-ec-cec/cros-ec-cec.c
@@ -94,18 +94,14 @@ static int cros_ec_cec_set_log_addr(struct cec_adapter *adap, u8 logical_addr)
 {
 	struct cros_ec_cec *cros_ec_cec = adap->priv;
 	struct cros_ec_device *cros_ec = cros_ec_cec->cros_ec;
-	struct {
-		struct cros_ec_command msg;
-		struct ec_params_cec_set data;
-	} __packed msg = {};
+	struct ec_params_cec_set data;
 	int ret;
 
-	msg.msg.command = EC_CMD_CEC_SET;
-	msg.msg.outsize = sizeof(msg.data);
-	msg.data.cmd = CEC_CMD_LOGICAL_ADDRESS;
-	msg.data.val = logical_addr;
+	data.cmd = CEC_CMD_LOGICAL_ADDRESS;
+	data.val = logical_addr;
 
-	ret = cros_ec_cmd_xfer_status(cros_ec, &msg.msg);
+	ret = cros_ec_send_cmd_msg(cros_ec, 0, EC_CMD_CEC_SET, &data,
+				   sizeof(data), NULL, 0);
 	if (ret < 0) {
 		dev_err(cros_ec->dev,
 			"error setting CEC logical address on EC: %d\n", ret);
@@ -120,17 +116,14 @@ static int cros_ec_cec_transmit(struct cec_adapter *adap, u8 attempts,
 {
 	struct cros_ec_cec *cros_ec_cec = adap->priv;
 	struct cros_ec_device *cros_ec = cros_ec_cec->cros_ec;
-	struct {
-		struct cros_ec_command msg;
-		struct ec_params_cec_write data;
-	} __packed msg = {};
+	struct ec_params_cec_write data = {};
 	int ret;
 
-	msg.msg.command = EC_CMD_CEC_WRITE_MSG;
 	msg.msg.outsize = cec_msg->len;
-	memcpy(msg.data.msg, cec_msg->msg, cec_msg->len);
+	memcpy(data.msg, cec_msg->msg, cec_msg->len);
 
-	ret = cros_ec_cmd_xfer_status(cros_ec, &msg.msg);
+	ret = cros_ec_send_cmd_msg(cros_ec, 0, EC_CMD_CEC_WRITE_MSG,
+				   &data, sizeof(cec_msg->len), NULL, 0);
 	if (ret < 0) {
 		dev_err(cros_ec->dev,
 			"error writing CEC msg on EC: %d\n", ret);
@@ -144,18 +137,14 @@ static int cros_ec_cec_adap_enable(struct cec_adapter *adap, bool enable)
 {
 	struct cros_ec_cec *cros_ec_cec = adap->priv;
 	struct cros_ec_device *cros_ec = cros_ec_cec->cros_ec;
-	struct {
-		struct cros_ec_command msg;
-		struct ec_params_cec_set data;
-	} __packed msg = {};
+	struct ec_params_cec_set data = {0};
 	int ret;
 
-	msg.msg.command = EC_CMD_CEC_SET;
-	msg.msg.outsize = sizeof(msg.data);
-	msg.data.cmd = CEC_CMD_ENABLE;
-	msg.data.val = enable;
+	data.cmd = CEC_CMD_ENABLE;
+	data.val = enable;
 
-	ret = cros_ec_cmd_xfer_status(cros_ec, &msg.msg);
+	ret = cros_ec_send_cmd_msg(cros_ec, 0, EC_CMD_CEC_SET, &data,
+				   sizeof(data), NULL, 0);
 	if (ret < 0) {
 		dev_err(cros_ec->dev,
 			"error %sabling CEC on EC: %d\n",
-- 
2.25.0.341.g760bfbb309-goog

