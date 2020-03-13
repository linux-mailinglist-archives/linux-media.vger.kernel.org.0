Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 194D018457D
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2020 12:04:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726633AbgCMLES (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Mar 2020 07:04:18 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:32999 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726669AbgCMLEO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Mar 2020 07:04:14 -0400
Received: by mail-wm1-f68.google.com with SMTP id r7so7579284wmg.0
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2020 04:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KmK9rPbQ7ZkiTZPfd7jr8oEpxHT6uehvlGdRiVCfa9E=;
        b=bHeV3oZzGpOJp9X2/+ayJxINfN/+cGoX+D+XUhTs6Q4RfuCAcephVcJEMljWUqg0oY
         TfV385qnmaVVyq5bXflo/xOe/PW6CJyP7UWZx+Ile8m8rEY48+pmBcBK7vOK/frIvihh
         jJWxEC/zdw6oE6+NhGS7Y8H/sqWrUhsmqilh55QnUxolhvqTSVDJV67t24HGXxksGqmo
         2TVgjbWh3d5khSKPFOyWy8L3nXOtL/siZ07IAxXHCcZioSLCFldpaNLx30kHkN2IATKe
         /kZo0Av80UuI6B3c6Kja3n+wEg4K5XwWh/TC8zULaBHxtjGmpRFxf0aoN+y7As+iRpRe
         wUig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KmK9rPbQ7ZkiTZPfd7jr8oEpxHT6uehvlGdRiVCfa9E=;
        b=pgyEa9xo/3DXUVhQSb/6V2hqKxHpewX4FelRdKIOPaHvKNEhfFCUZm1iZ50Bw4NMX0
         astd+2q/nigvnYimVjWppmtn1bn33+vAqXEnqVyrbzt2NCh9WtJAHkYDc2S5ef6c/+vn
         U2B9FkKKxgedJrrahFKhFSpOXnvJtj6VcFFtDko4GXQoW0TbJc0Ktk998vD7Sdt/5i6S
         XucWpEOGzcBoDrneVi6CMGM6wxMFaooyrGmiPILEHYlo9U0quZDLsRL8Kl5h8qwFwSR5
         J1FhGryHUMhfjP/SEg1mwZfa10HycVAZHvUHFr19a5p+n7q7/toArzS5UQaybTACGzPn
         D79Q==
X-Gm-Message-State: ANhLgQ0lyiS8OkRXbwZrRL9Hb/tg0MtPd0KT6+wgyLgsB6rMlkoPNIl0
        0kJbm+qhxkrNQxdNKb9uF3rs2A==
X-Google-Smtp-Source: ADFU+vsecmaXEqCn3VzdzRxpowdlFf1VRTVp8EqTIdciEiR4i/mJkERoqke1oLtWuG4/wpapMep3Bw==
X-Received: by 2002:a7b:cb17:: with SMTP id u23mr10778712wmj.12.1584097452112;
        Fri, 13 Mar 2020 04:04:12 -0700 (PDT)
Received: from xps7590.local ([2a02:2450:102f:13b8:c814:5be4:577e:3bd5])
        by smtp.gmail.com with ESMTPSA id r23sm23578052wrr.93.2020.03.13.04.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2020 04:04:11 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Fabio Estevam <festevam@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Robert Foss <robert.foss@linaro.org>
Subject: [v2 3/3] media: ov8856: Implement sensor module revision identification
Date:   Fri, 13 Mar 2020 12:03:50 +0100
Message-Id: <20200313110350.10864-4-robert.foss@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200313110350.10864-1-robert.foss@linaro.org>
References: <20200313110350.10864-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Query the sensor for its module revision, and compare it
to known revisions.
Currently only the '1B' revision has been added.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 drivers/media/i2c/ov8856.c | 54 +++++++++++++++++++++++++++++++++-----
 1 file changed, 48 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
index db61eed223e8..39662d3d86dd 100644
--- a/drivers/media/i2c/ov8856.c
+++ b/drivers/media/i2c/ov8856.c
@@ -34,6 +34,18 @@
 #define OV8856_MODE_STANDBY		0x00
 #define OV8856_MODE_STREAMING		0x01
 
+/* define 1B module revision */
+#define OV8856_1B_MODULE		0x02
+
+/* the OTP read-out buffer is at 0x7000 and 0xf is the offset
+ * of the byte in the OTP that means the module revision
+ */
+#define OV8856_MODULE_REVISION		0x700f
+#define OV8856_OTP_MODE_CTRL		0x3d84
+#define OV8856_OTP_LOAD_CTRL		0x3d81
+#define OV8856_OTP_MODE_AUTO		0x00
+#define OV8856_OTP_LOAD_CTRL_ENABLE	BIT(0)
+
 /* vertical-timings from sensor */
 #define OV8856_REG_VTS			0x380e
 #define OV8856_VTS_MAX			0x7fff
@@ -711,6 +723,25 @@ static int ov8856_test_pattern(struct ov8856 *ov8856, u32 pattern)
 				OV8856_REG_VALUE_08BIT, pattern);
 }
 
+static int ov8856_check_revision(struct ov8856 *ov8856)
+{
+	int ret;
+
+	ret = ov8856_write_reg(ov8856, OV8856_REG_MODE_SELECT,
+			       OV8856_REG_VALUE_08BIT, OV8856_MODE_STREAMING);
+	if (ret)
+		return ret;
+
+	ret = ov8856_write_reg(ov8856, OV8856_OTP_MODE_CTRL,
+			       OV8856_REG_VALUE_08BIT, OV8856_OTP_MODE_AUTO);
+	if (ret)
+		return ret;
+
+	return ov8856_write_reg(ov8856, OV8856_OTP_LOAD_CTRL,
+				OV8856_REG_VALUE_08BIT,
+				OV8856_OTP_LOAD_CTRL_ENABLE);
+}
+
 static int ov8856_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct ov8856 *ov8856 = container_of(ctrl->handler,
@@ -1144,6 +1175,23 @@ static int ov8856_identify_module(struct ov8856 *ov8856)
 		return -ENXIO;
 	}
 
+	/* check sensor hardware revision */
+	ret = ov8856_check_revision(ov8856);
+	if (ret) {
+		dev_err(&client->dev, "failed to check sensor revision");
+		return ret;
+	}
+
+	ret = ov8856_read_reg(ov8856, OV8856_MODULE_REVISION,
+			      OV8856_REG_VALUE_08BIT, &val);
+	if (ret)
+		return ret;
+
+	dev_info(&client->dev, "OV8856 revision %x (%s) at address 0x%02x\n",
+		val,
+		val == OV8856_1B_MODULE ? "1B" : "unknown revision",
+		client->addr);
+
 	return 0;
 }
 
@@ -1254,12 +1302,6 @@ static int ov8856_probe(struct i2c_client *client)
 		return PTR_ERR(ov8856->xvclk);
 	}
 
-	ret = clk_set_rate(ov8856->xvclk, OV8856_XVCLK_24);
-	if (ret < 0) {
-		dev_err(&client->dev, "failed to set xvclk rate (24MHz)\n");
-		return ret;
-	}
-
 	ov8856->reset_gpio = devm_gpiod_get(&client->dev, "reset",
 					       GPIOD_OUT_HIGH);
 	if (IS_ERR(ov8856->reset_gpio)) {
-- 
2.20.1

