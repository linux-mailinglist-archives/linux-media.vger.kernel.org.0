Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC05D58DF2
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2019 00:29:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726561AbfF0W3V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jun 2019 18:29:21 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:36056 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726445AbfF0W3U (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jun 2019 18:29:20 -0400
Received: by mail-qt1-f194.google.com with SMTP id p15so4287298qtl.3
        for <linux-media@vger.kernel.org>; Thu, 27 Jun 2019 15:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=1HQv7Y2t9NWSTUumFc6ey/Qqds9w23nyG33etkfaVno=;
        b=nZIbeEaApQbwSNpCN9dUvldHDzPzYk4Rb94mT9ZnCV+dvHzMnmUIiX3vFnImPygZJ6
         CaHrj50gA9wGCf88ta5cpA7/2IM96ApFTcyhiCSoGLPggt4QAXxc8z+1EhZau4lT1jDQ
         YJj5O55RA+XECzpPQLnERzEsA7Mrba0/q7LGtugnhpQ/JVHV5TOlorSAjPCRM9A93Qbu
         ms2CBedtCeCftzqYzvWj0Xv/PYRq/MVXTejH9ds4KK/+DlVWIJH7pUok+wdEFJmrb+kp
         U1AlOuAhcE5ED7zZiIsnV3b1LnfZEKaRDGtaL4hQ0z+aam9tLjIkcQ3aS6q19C2FUnmb
         NDBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=1HQv7Y2t9NWSTUumFc6ey/Qqds9w23nyG33etkfaVno=;
        b=Ge1mjcXpNYMn/8IDVk8SZzZHhtNXjuKrkE8hUbyMMXBa8b5Hivgou8oHqoZc+KyGpf
         3hO1muL5nMzSE0HXl+QG2TT4GoT8YQVM1Q5hqGYHgiEmxg0aaDL3J7CAu7iqM4ae1EAD
         Js+AJ1Qjw+unhSVgx8BhPD6eOiDrvktBdzpmai7uac6rCF2UZTvNB+xWSZVuPXqsQhHu
         AMSh+XdNPnCtB77vLPVP03snGDcQaVDS4jvGJ3jjC9HSIiEOnX7jxsMKw7iyGMM1s7bm
         fXYx3onYxwoq9yICdpnfe0/V+W5hBqwEYaAj6VlFU3CiyW81c/3e5Z0KJ002judtPIdJ
         HDeg==
X-Gm-Message-State: APjAAAUt2run4qK8G+RWRxqjQWApIHsVQBdhTiMbqaK8WigBIKnKxeTe
        jkTIR/AsZ0YK6lIkgytXvRlEp1q1c7Y=
X-Google-Smtp-Source: APXvYqzW4zBLzZddNYIUahraycaCFCiUoSySdv7F0/JAENiXDDQ8v7v645A+749Cf4C8T4PA2i5EzA==
X-Received: by 2002:ac8:70cf:: with SMTP id g15mr5206177qtp.254.1561674559858;
        Thu, 27 Jun 2019 15:29:19 -0700 (PDT)
Received: from fabio-Latitude-E5450.am.freescale.net ([2804:14c:482:3c8:56cb:1049:60d2:137b])
        by smtp.gmail.com with ESMTPSA id l6sm172404qkc.89.2019.06.27.15.29.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Jun 2019 15:29:19 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     hverkuil@xs4all.nl
Cc:     slongerbeam@gmail.com, p.zabel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, kernel@pengutronix.de,
        shawnguo@kernel.org, mchehab@kernel.org, ezequiel@collabora.com,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3] media: imx: mipi csi-2: Don't fail if initial state times-out
Date:   Thu, 27 Jun 2019 19:29:12 -0300
Message-Id: <20190627222912.25485-1-festevam@gmail.com>
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
Changes since v2:
- Reduce the warning message (Steve)
Changes since v1:
- Changed the warning message to better explain the problem and provide
a hint that the sensor driver needs to be fixed. (Phillip)
- Keep printing the phy_state information (Phillip)
- Do not change csi2_dphy_wait_clock_lane() (Phillip/Steve)
 drivers/staging/media/imx/imx6-mipi-csi2.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
index f29e28df36ed..bfa4b254c4e4 100644
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
@@ -254,11 +254,9 @@ static int csi2_dphy_wait_stopstate(struct csi2_dev *csi2)
 	ret = readl_poll_timeout(csi2->base + CSI2_PHY_STATE, reg,
 				 (reg & mask) == mask, 0, 500000);
 	if (ret) {
-		v4l2_err(&csi2->sd, "LP-11 timeout, phy_state = 0x%08x\n", reg);
-		return ret;
+		v4l2_warn(&csi2->sd, "LP-11 wait timeout, likely a sensor driver bug, expect capture failures.\n");
+		v4l2_warn(&csi2->sd, "phy_state = 0x%08x\n", reg);
 	}
-
-	return 0;
 }
 
 /* Wait for active clock on the clock lane. */
@@ -316,9 +314,7 @@ static int csi2_start(struct csi2_dev *csi2)
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

