Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F6881CD71E
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2020 13:04:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728402AbgEKLEN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 May 2020 07:04:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729358AbgEKLEA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 May 2020 07:04:00 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15474C05BD0B
        for <linux-media@vger.kernel.org>; Mon, 11 May 2020 04:04:00 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id e16so10389047wra.7
        for <linux-media@vger.kernel.org>; Mon, 11 May 2020 04:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wjZQiljUYlD33LUnV3Lrp+SSxrgP5GGsdxa2mXlVN0s=;
        b=xdDwNe5DKWOSnokNVlxSSaAnAn266MNyPB8XQaRemI+qdXulB4pdAf40Bg3E1gwDRI
         dQhKll9HDozQBuxfeDGq6EWaolwfXMZzPx7fA2TjrT3kRjs8XxP9lmkX4zpbULq+dQNC
         7pF8Sle/eXAB6Qq/49xffk93p0ro+TrQVx6tjhM4XgRadzOTETgc9VMYa8UCEDW+e9Dh
         n84T1xae73+FCY0nGSwktrencqzRwfULUUdSWa7sPkByONIhik3tIf2dQc05SuUMszlY
         AQ+z08mcQYVp73wDhNxRuoL7LZ0oNqrZ6sDdUtDQoHA7j0Bnf+Cr0Q4Oo5Bv9nDx19Or
         8WOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wjZQiljUYlD33LUnV3Lrp+SSxrgP5GGsdxa2mXlVN0s=;
        b=c1j4wgOq+MKeAYLxVAw1pA2h9TqNTN9BGXraYQCSuUJY970JWM9jE6qNt3/6UR8SiT
         xv8XbB6h7ZuEyrzxUQQ6Q6s+AAeZ/dwBFUQiWRRw9UalgH5+EatkyXC/hF+uPHM5Hy0x
         geykbdA8MQb5uWmFfOc5q35BFFAHVUhbpKZnn9yrL50h9sY3bXZrEemGHksiprvV3MEW
         iKOowgmavY7zuIhusS3r+y2Uo9ToRYsPpTvLWdO3Rb2syksLdd/YZZctbc4Z+lDtv4Ax
         v/xwruQ0e8eVEj/CMmFqHOgEZq1EjbwaV6qezIDDVk7tk//D672ZU3ihIJVjRGI42ZEI
         uOEQ==
X-Gm-Message-State: AGi0PuYkiViRi/ka77Y0ligIy0EcmEzH9+OYV46RkwHjmtuWXQwAd1pZ
        fnTBWvOULse2wk7+Dmn4PAsAtg==
X-Google-Smtp-Source: APiQypLkuk0QguA4T+0yy7di/0ztJ/wpeDgCX7kAIsO9jmlBqjYPQS9nKV5nkRg7LCJvi4UP3hIJDQ==
X-Received: by 2002:a5d:4389:: with SMTP id i9mr18918350wrq.374.1589195038813;
        Mon, 11 May 2020 04:03:58 -0700 (PDT)
Received: from localhost.localdomain ([37.120.63.158])
        by smtp.gmail.com with ESMTPSA id z18sm7046584wmk.46.2020.05.11.04.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 04:03:58 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Maxime Ripard <maxime@cerno.tech>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Fabio Estevam <festevam@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>, Ben Kao <ben.kao@intel.com>,
        Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v8 3/3] media: ov8856: Implement sensor module revision identification
Date:   Mon, 11 May 2020 13:03:50 +0200
Message-Id: <20200511110350.11565-4-robert.foss@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200511110350.11565-1-robert.foss@linaro.org>
References: <20200511110350.11565-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Query the sensor for its module revision, and compare it
to known revisions.

Currently 2A and 1B revision indentification is supported.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---

- Changes since v7:
  * Marco: Align broken line

- Changes since v3:
  * Actually add module revision 2A

- Changes since v2:
  * Add module revision 2A
  * Sakari: Remove ov8856_check_revision()
  * Sakari: Stop EEPROM streaming mode

 drivers/media/i2c/ov8856.c | 53 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
index 68cf2d6c5804..1657e03d9a9d 100644
--- a/drivers/media/i2c/ov8856.c
+++ b/drivers/media/i2c/ov8856.c
@@ -32,6 +32,19 @@
 #define OV8856_MODE_STANDBY		0x00
 #define OV8856_MODE_STREAMING		0x01
 
+/* module revisions */
+#define OV8856_2A_MODULE		0x01
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
@@ -1156,6 +1169,46 @@ static int ov8856_identify_module(struct ov8856 *ov8856)
 		return -ENXIO;
 	}
 
+	ret = ov8856_write_reg(ov8856, OV8856_REG_MODE_SELECT,
+			       OV8856_REG_VALUE_08BIT, OV8856_MODE_STREAMING);
+	if (ret)
+		return ret;
+
+	ret = ov8856_write_reg(ov8856, OV8856_OTP_MODE_CTRL,
+			       OV8856_REG_VALUE_08BIT, OV8856_OTP_MODE_AUTO);
+	if (ret) {
+		dev_err(&client->dev, "failed to set otp mode");
+		return ret;
+	}
+
+	ret = ov8856_write_reg(ov8856, OV8856_OTP_LOAD_CTRL,
+			       OV8856_REG_VALUE_08BIT,
+			       OV8856_OTP_LOAD_CTRL_ENABLE);
+	if (ret) {
+		dev_err(&client->dev, "failed to enable load control");
+		return ret;
+	}
+
+	ret = ov8856_read_reg(ov8856, OV8856_MODULE_REVISION,
+			      OV8856_REG_VALUE_08BIT, &val);
+	if (ret) {
+		dev_err(&client->dev, "failed to read module revision");
+		return ret;
+	}
+
+	dev_info(&client->dev, "OV8856 revision %x (%s) at address 0x%02x\n",
+		 val,
+		 val == OV8856_2A_MODULE ? "2A" :
+		 val == OV8856_1B_MODULE ? "1B" : "unknown revision",
+		 client->addr);
+
+	ret = ov8856_write_reg(ov8856, OV8856_REG_MODE_SELECT,
+			       OV8856_REG_VALUE_08BIT, OV8856_MODE_STANDBY);
+	if (ret) {
+		dev_err(&client->dev, "failed to exit streaming mode");
+		return ret;
+	}
+
 	return 0;
 }
 
-- 
2.25.1

