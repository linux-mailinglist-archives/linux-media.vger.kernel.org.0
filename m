Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A47F2C2AC9
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 16:06:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389323AbgKXPE2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 10:04:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731164AbgKXPE1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 10:04:27 -0500
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81882C0617A6
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2020 07:04:27 -0800 (PST)
Received: by mail-ed1-x544.google.com with SMTP id q16so21188572edv.10
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2020 07:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FMsNpVCudvnHhrIfcp69mx9tmena6eOGC4SENzmO+vs=;
        b=cTlhkviOPSymYgvmeCxiXfv5TIKNdt0xdL7oon15McZ509kDYK5qLwIbCp5pjUEonx
         Wih9y+6S6bfJYhqt7w7a937qIWUnkLmbuJGZuKTtmOvJCqGoA1KEuplutdK87QuPnOiI
         qstUv2iZOt43CrrO6iP5pJLzHiLi4L/3kMvUK7JAdqb2hgizBoU6f1BryBg/AoH9jM9B
         6aMsy+iTmv5BYOfFCEApLb5PDWrPanZCOPjZpyaqTf9HJmbdhJJbuXNFwALTUXkhRR8L
         tYSo2dW0Wh7xE0Z3DTLT5orQ/+IxNSnsFl0+CbsZy6QoEZYQw0OVquTYLnSWLzvfk8bu
         fiVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FMsNpVCudvnHhrIfcp69mx9tmena6eOGC4SENzmO+vs=;
        b=TtChlpYK93EkQD6J0OP7hm9dGa7nIk74QP52D9YiWz4/H6WxjIOV9WiDhHyODiL5P7
         migxgFrGl97aI1uWVcSsnbdyIW6xhSjmfSP+teBhfSTx2ivOVKkhif8tAY6PZjd6bR9c
         h14/wt1/c4wXDV775J6pAZAkgnedorLwxfBMO6gZ95F8eHFL5V5enedZBPWrYmwxpVsP
         rUULnB9qqdB5omQVvYGDaokWcfjephp1sNyhBJU/8RfvAbXWN9OiYrH/9mFl8ebSDmsB
         zjAn4iX3atWm0Ky4D1O+WPJCeaEv5fPsMx0ZmD7XSD95ovqLj57g/8AS5jB0YRd+h3zM
         mIuA==
X-Gm-Message-State: AOAM532ig6zrpimwyXxV0GF7rG5UfkJ8M1t5dGFZg3r7y9MJ7hWvI9q0
        ip1SJLdfoG6J1q2ODo4JVzA16Q==
X-Google-Smtp-Source: ABdhPJwXNaF9FtWbffr3nBXFtNQpb0miuYdCPxpskU/ZJ5PlOa1e0eZi6vKTPhcX5pCEyPB74EXZBA==
X-Received: by 2002:a05:6402:2373:: with SMTP id a19mr4214847eda.212.1606230266150;
        Tue, 24 Nov 2020 07:04:26 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:5100:777e:1a1:d26c])
        by smtp.gmail.com with ESMTPSA id i21sm7088729edt.92.2020.11.24.07.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 07:04:25 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     dongchun.zhu@mediatek.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tomasz Figa <tfiga@google.com>,
        Dongchun Zhu <Dongchun.Zhu@mediatek.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@linux.intel.com>
Cc:     Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v1] media: ov8856: Fix Bayer format dependance on mode
Date:   Tue, 24 Nov 2020 16:03:32 +0100
Message-Id: <20201124150332.3026752-1-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Bayer GRBG10 mode used for earlier modes 3280x2460 and
1640x1232 isn't the mode output by the sensor for the
3264x2448 and 1632x1224 modes.

Switch from MEDIA_BUS_FMT_SGRBG10_1X10 to MEDIA_BUS_FMT_SBGGR10_1X10
for 3264x2448 & 1632x1224 modes.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---

This patch is sent out after Dongchun Zhu clarified the Bayer
modes used by different sensor configuration in the below thread.

https://lkml.org/lkml/2020/11/24/335

 drivers/media/i2c/ov8856.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
index 2f4ceaa80593..a2dcbece558c 100644
--- a/drivers/media/i2c/ov8856.c
+++ b/drivers/media/i2c/ov8856.c
@@ -1281,8 +1281,13 @@ static void ov8856_update_pad_format(const struct ov8856_mode *mode,
 {
 	fmt->width = mode->width;
 	fmt->height = mode->height;
-	fmt->code = MEDIA_BUS_FMT_SGRBG10_1X10;
 	fmt->field = V4L2_FIELD_NONE;
+
+	if (mode->reg_list.regs == mode_3264x2448_regs ||
+	    mode->reg_list.regs == mode_1632x1224_regs)
+		fmt->code = MEDIA_BUS_FMT_SBGGR10_1X10;
+	else
+		fmt->code = MEDIA_BUS_FMT_SGRBG10_1X10;
 }
 
 static int ov8856_start_streaming(struct ov8856 *ov8856)
-- 
2.27.0

