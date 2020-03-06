Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2084717BA4A
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2020 11:33:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726397AbgCFKc6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Mar 2020 05:32:58 -0500
Received: from mail-wr1-f50.google.com ([209.85.221.50]:44715 "EHLO
        mail-wr1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726010AbgCFKc6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Mar 2020 05:32:58 -0500
Received: by mail-wr1-f50.google.com with SMTP id n7so1699049wrt.11;
        Fri, 06 Mar 2020 02:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bHB1Xy6VOidIGsnleJqs9EIJkLYHbOLvhPuZrlcbUu8=;
        b=Gy4P4bU4rbiuS43UuostQiXF/kYw56KYYnF+O7TrPNf32Kagjibmp341v+XaR498za
         X7ePpvqr+iXEwX+wkPK1OMwgsGjaZ4YWACCduGH4eKPvUxaECu5nMkTxVkAzaO3Fwny/
         N72T1NI6mt+9VhUr9y0mIGnMltoJh5pSLcleJYC6wmFFsGjz25o0uBqKoiZeogf3VZbK
         WF9vEEOQIbRHlWIF/gqROVj/SLP37GzV2SJnAnZ2loYKk71pDlSCyOm8mUnr++Yu+M6Q
         F2sGIFODpJBRAlsVZNO/lf0T7US7CTveoMtH8powyKzVQbLFTxmGwhvW+4Xhp5KIHRwv
         IVAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bHB1Xy6VOidIGsnleJqs9EIJkLYHbOLvhPuZrlcbUu8=;
        b=Tr7/eTEDEgGkAxkMz0ZM1JFU6myJQfjfyxzWv3ScEdZQUUPkSV2fikVbJ1ZGd35Qrc
         qnRaw52htV8FNid6ITdhRaFiU0phT8VDorgRjWnAnA/pYrS+VeeYqKlfo71ug8MuEafV
         QrqNBBiQCYPE47VqVcofztzQf8lUFtkbRS4DBnSD0j8O9FLuhUFfR8UXQcxfpULOetch
         xqVOUIlVG1haBjdKX/jbkUaGUDBiGxIzUfbQUTnduW2orFJkKWnaT1UAzbDT8fgDC5gB
         ixjYZnW4UsChFs6W5n7JoR35P1RNF0fg+JW5PuE01EY2mHdkHTkOwltjIWLGs+S48XQf
         P8Ng==
X-Gm-Message-State: ANhLgQ3cGtlgG44nXBXqDC0QDXLFRP0UutNlXPUgFA7Ef64Pnb0QqJ/6
        8l1Qz8X7Tjl7V4JWXXbc9/o=
X-Google-Smtp-Source: ADFU+vsJam9jl66mjSXv2NlXjJ93lPRsHpgAcMdzpBH5dmAdY0Z4Op3KPBYrM0hTg5jSU2JX7v6SBw==
X-Received: by 2002:adf:f84d:: with SMTP id d13mr3457858wrq.92.1583490775590;
        Fri, 06 Mar 2020 02:32:55 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2510:d000:7009:9d38:36e8:7030])
        by smtp.gmail.com with ESMTPSA id t1sm1251111wrq.36.2020.03.06.02.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2020 02:32:55 -0800 (PST)
From:   Lad Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 1/3] media: i2c: imx219: Fix power sequence
Date:   Fri,  6 Mar 2020 10:32:44 +0000
Message-Id: <20200306103246.22213-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200306103246.22213-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20200306103246.22213-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When supporting Rpi Camera v2 Module on the RZ/G2E, found the driver had
some issues with rcar mipi-csi driver. The sensor never entered into LP-11
state.

The powerup sequence in the datasheet[1] shows the sensor entering into
LP-11 in streaming mode, so to fix this issue transitions are performed
from "streaming -> standby" in the probe() after power up.

With this commit the sensor is able to enter LP-11 mode during power up,
as expected by some CSI-2 controllers.

[1] https://publiclab.org/system/images/photos/000/023/294/original/
RASPBERRY_PI_CAMERA_V2_DATASHEET_IMX219PQH5_7.0.0_Datasheet_XXX.PDF

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/media/i2c/imx219.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index f1effb5a5f66..16010ca1781a 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -1224,6 +1224,23 @@ static int imx219_probe(struct i2c_client *client)
 	/* Set default mode to max resolution */
 	imx219->mode = &supported_modes[0];
 
+	/* sensor doesn't enter LP-11 state upon power up until and unless
+	 * streaming is started, so upon power up switch the modes to:
+	 * streaming -> standby
+	 */
+	ret = imx219_write_reg(imx219, IMX219_REG_MODE_SELECT,
+			       IMX219_REG_VALUE_08BIT, IMX219_MODE_STREAMING);
+	if (ret < 0)
+		goto error_power_off;
+	usleep_range(100, 110);
+
+	/* put sensor back to standby mode */
+	ret = imx219_write_reg(imx219, IMX219_REG_MODE_SELECT,
+			       IMX219_REG_VALUE_08BIT, IMX219_MODE_STANDBY);
+	if (ret < 0)
+		goto error_power_off;
+	usleep_range(100, 110);
+
 	ret = imx219_init_controls(imx219);
 	if (ret)
 		goto error_power_off;
-- 
2.20.1

