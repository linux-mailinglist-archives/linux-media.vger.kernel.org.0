Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C426658DBD
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2019 00:14:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726539AbfF0WOX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jun 2019 18:14:23 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:46070 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726445AbfF0WOX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jun 2019 18:14:23 -0400
Received: by mail-qt1-f193.google.com with SMTP id j19so4200085qtr.12
        for <linux-media@vger.kernel.org>; Thu, 27 Jun 2019 15:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=4dH4PMBD3ZOoTOLxXx+f9fbBXC0czLNISf3VKnc9bUQ=;
        b=Wf7cxZJAB/bWrkT4LbEUpd36F0SZHChHIqFvdtXz0sQZBzVatY0ojU0jlGJjPe5HD7
         caJf3aHicd8gnlC6W2ALc1YpmlSHtte7CmMImWMBvP5vHf/GEGuOIr4nTBZJV4tp9JdX
         wWklMNWXXC4TD9W8EVVGSV+K0Gg2MtmhR8ZiUDHSzKT8fU95IODxG00tecqoFfuIxKER
         TkL5YgqSlk5e5WjtLgTzUYJEsLhvp7nVHJS1RndU7aIEuQAW3hWSPZOvJZ+Y/Jhr3u94
         C8u7p5/g3vHSHrRm+xHDbkT9RngoCJk5OS0WNwOcCUjozZClybCBod/L7tWpYiGLSG/h
         FXHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=4dH4PMBD3ZOoTOLxXx+f9fbBXC0czLNISf3VKnc9bUQ=;
        b=POcsIOsitEQMNXD4GJpXg5OOUeseSt5XCGRrEOAU/UwjlkA60e8R2ZO/n0vJ+X1AIR
         zI8DrIa/hCSL4pyhpepnJbywRSdoWmdb9nOZLVHT5NoJLqKNu7OnYypQ0FLxfqFWwUTq
         2xzhef2WoEz9A3jFjKm6y0B3PGuhZikqOeOLrgn+VuJ6bzIsvu3DkBcp1jpRmtc1Ky8U
         BHy0b2bwClO5wMHlqcu5SzDg33YufWy1d1NE0RMvdGWszQAkDLo6/rELlxEUdIGjOnht
         UC4zssAXtjmt4u4KfQwbCHPb9cn/Nos7HhjTdJco71a699QanI76voGfkz7Zc1w3WVEP
         nTOw==
X-Gm-Message-State: APjAAAUjQMC9mjEMiGuaVg1F/n4Nlx3xfIE/VfD6oN0sKO+8+3PjVYbQ
        i9ha1+rDcJuhv8TUTqlXgMw=
X-Google-Smtp-Source: APXvYqz3rA6eFuEEsGo8eMhlmkgnekuuUhu5TdUwh5vYIxM7hVPOPOYavaurOeFHHvjE6MZ0b464Zg==
X-Received: by 2002:a0c:bd1d:: with SMTP id m29mr5343988qvg.181.1561673662623;
        Thu, 27 Jun 2019 15:14:22 -0700 (PDT)
Received: from fabio-Latitude-E5450.am.freescale.net ([2804:14c:482:3c8:56cb:1049:60d2:137b])
        by smtp.gmail.com with ESMTPSA id y6sm177520qki.67.2019.06.27.15.14.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Jun 2019 15:14:21 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     hverkuil@xs4all.nl
Cc:     slongerbeam@gmail.com, p.zabel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, kernel@pengutronix.de,
        shawnguo@kernel.org, mchehab@kernel.org, ezequiel@collabora.com,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2] media: imx: mipi csi-2: Don't fail if initial state times-out
Date:   Thu, 27 Jun 2019 19:13:59 -0300
Message-Id: <20190627221359.18960-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Ezequiel Garcia <ezequiel@collabora.com>

Not all sensors will be able to guarantee a proper initial state.
This may be either because the driver is not properly written,
or (probably unlikely) because the hardware won't support it.

While the right solution in the former case is to fix the sensor
driver, the real world not always allows right solutions, due to lack
of available documentation and support on these sensors.

Let's relax this requirement, and allow the driver to support stream start,
even if the sensor initial sequence wasn't the expected.

Also improve the warning message to better explain the problem and provide
a hint that the sensor driver needs to be fixed.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- Changed the warning message to better explain the problem and provide
a hint that the sensor driver needs to be fixed. (Phillip)
- Keep printing the phy_state information (Phillip)
- Do not change csi2_dphy_wait_clock_lane() (Phillip/Steve)

 drivers/staging/media/imx/imx6-mipi-csi2.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
index f29e28df36ed..240f992ad2ef 100644
--- a/drivers/staging/media/imx/imx6-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
@@ -243,7 +243,7 @@ static int __maybe_unused csi2_dphy_wait_ulp(struct csi2_dev *csi2)
 }
 
 /* Waits for low-power LP-11 state on data and clock lanes. */
-static int csi2_dphy_wait_stopstate(struct csi2_dev *csi2)
+static void csi2_dphy_wait_stopstate(struct csi2_dev *csi2)
 {
 	u32 mask, reg;
 	int ret;
@@ -254,11 +254,11 @@ static int csi2_dphy_wait_stopstate(struct csi2_dev *csi2)
 	ret = readl_poll_timeout(csi2->base + CSI2_PHY_STATE, reg,
 				 (reg & mask) == mask, 0, 500000);
 	if (ret) {
-		v4l2_err(&csi2->sd, "LP-11 timeout, phy_state = 0x%08x\n", reg);
-		return ret;
+		v4l2_warn(&csi2->sd, "Timeout waiting for LP-11 state on all active lanes.\n");
+		v4l2_warn(&csi2->sd, "This is most likely caused by a bug in the sensor driver.\n");
+		v4l2_warn(&csi2->sd, "Capture might fail or contain visual artifacts.\n");
+		v4l2_warn(&csi2->sd, "phy_state = 0x%08x\n", reg);
 	}
-
-	return 0;
 }
 
 /* Wait for active clock on the clock lane. */
@@ -316,9 +316,7 @@ static int csi2_start(struct csi2_dev *csi2)
 	csi2_enable(csi2, true);
 
 	/* Step 5 */
-	ret = csi2_dphy_wait_stopstate(csi2);
-	if (ret)
-		goto err_assert_reset;
+	csi2_dphy_wait_stopstate(csi2);
 
 	/* Step 6 */
 	ret = v4l2_subdev_call(csi2->src_sd, video, s_stream, 1);
-- 
2.17.1

