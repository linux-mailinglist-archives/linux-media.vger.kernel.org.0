Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15D4417FF55
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2020 14:46:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727810AbgCJNqN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Mar 2020 09:46:13 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:54599 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727496AbgCJNqM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Mar 2020 09:46:12 -0400
Received: by mail-wm1-f67.google.com with SMTP id n8so1467810wmc.4
        for <linux-media@vger.kernel.org>; Tue, 10 Mar 2020 06:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kcpWwT5ZMggrjSQT2EvWM0uaER77QpGrPnMzAFtSYRI=;
        b=O0Lf67OGqFwaUzOUsqZhpfQommqipqakOP9ukqiFMtg84raIJ1xhcu/+IgDx8RPV4K
         8sGGmwfwEyYWBBoLnALcEFHKAsJlvAR8AUBpDDqc1Lm9EUF3aj8f7fJiWrR5gjg7/gOq
         rdNrwGEwNZ8+iSNiWm7vrM5TV/rGUxpbIlBB19KI26agGyBQPCxL4shzzBLaVw8hvc6O
         yn46Z2IoT5cJV5/IuNrLSFADdgk4BeMcIJ4nrD5ct0TQkHaaqBx2pUE5uUWDhhhqIQ+S
         FZBv0A9zwwV1RIpj9EtiM8kK3u/WzWN55CqcszpUCNMng529s3Ad0kGSVdzklXIqn1VK
         dfTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kcpWwT5ZMggrjSQT2EvWM0uaER77QpGrPnMzAFtSYRI=;
        b=QMyXXlVcBWMbycDLXs55dZdhMRywMSLUtDgAObKFC3MNnaKR7zamcZbevNak47K/RZ
         QI4IXQ64/dUr8cWCwlEvCyJVrBOH25gD8WSsAf93uFJbx0D+3zlDwsDPJd4++qyS9qch
         O2DogPRtHCtmRLOlSfFDzTrppgRz2UQGlKo4QIoZEwcYNy6uzjxMk6vbQfJceIO4MGI+
         bLgU2VgQMFRYKTe4Eo3StTu24RaYdZ5bgwBObBuk9DYhVPiopvHiqlR3Ti7huTW4DfS/
         6JU8JS+PiLbYpQCwTgYcYV/Kq78+Fc+yb9TcanhLQOYugw8kzQfxLMn7VSXCdC8tx5YU
         rTPA==
X-Gm-Message-State: ANhLgQ2R/JsUYEQv0DPNW4Qhaf6/UtPhZrY6wj8HM3pbbKI7t4Xx90ac
        dR77NZ8TEUvl5W8f98u+8hvnmQ==
X-Google-Smtp-Source: ADFU+vstHBlerJtLLKmV0eIsOMnYH7m2KgACCake91JX7v1/q8QTpqLwfBfjOjRY02P/EWh99NEaCA==
X-Received: by 2002:a05:600c:22cd:: with SMTP id 13mr2257121wmg.186.1583847971629;
        Tue, 10 Mar 2020 06:46:11 -0700 (PDT)
Received: from xps7590.local ([2a02:2450:102f:13b8:e50c:c780:9a1:8b61])
        by smtp.gmail.com with ESMTPSA id d63sm4074009wmd.44.2020.03.10.06.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 06:46:11 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     ben.kao@intel.com, mchehab@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, matthias.bgg@gmail.com, davem@davemloft.net,
        gregkh@linuxfoundation.org, Jonathan.Cameron@huawei.com,
        andriy.shevchenko@linux.intel.com, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Robert Foss <robert.foss@linaro.org>
Subject: [v1 3/3] media: ov8856: Implement sensor module revision identification
Date:   Tue, 10 Mar 2020 14:46:03 +0100
Message-Id: <20200310134603.30260-4-robert.foss@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200310134603.30260-1-robert.foss@linaro.org>
References: <20200310134603.30260-1-robert.foss@linaro.org>
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
 drivers/media/i2c/ov8856.c | 48 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
index 1769acdfaa44..48e8f4b997d6 100644
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
@@ -713,6 +725,25 @@ static int ov8856_test_pattern(struct ov8856 *ov8856, u32 pattern)
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
@@ -1145,6 +1176,23 @@ static int ov8856_identify_module(struct ov8856 *ov8856)
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
 
-- 
2.20.1

