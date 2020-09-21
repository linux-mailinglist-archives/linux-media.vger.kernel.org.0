Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2277A273506
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 23:40:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727448AbgIUVjt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 17:39:49 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:14308 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726452AbgIUVjs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 17:39:48 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f691d970000>; Mon, 21 Sep 2020 14:39:35 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 21 Sep
 2020 21:39:47 +0000
Received: from skomatineni-linux.nvidia.com (172.20.13.39) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server id
 15.0.1473.3 via Frontend Transport; Mon, 21 Sep 2020 21:39:46 +0000
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <sakari.ailus@iki.fi>,
        <hverkuil@xs4all.nl>, <jacopo+renesas@jmondi.org>,
        <luca@lucaceresoli.net>, <leonl@leopardimaging.com>,
        <robh+dt@kernel.org>, <lgirdwood@gmail.com>, <broonie@kernel.org>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 1/3] media: i2c: imx274: Fix Y_OUT_SIZE register setting
Date:   Mon, 21 Sep 2020 14:39:37 -0700
Message-ID: <1600724379-7324-2-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600724379-7324-1-git-send-email-skomatineni@nvidia.com>
References: <1600724379-7324-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1600724375; bh=7eG8er5DakEQLU4K41aXrq57p9hJvRNjoRAVrC46VL0=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:X-NVConfidentiality:MIME-Version:Content-Type;
        b=gVAOExMjumXyLu50PLkCCZDmsxHy2Y0yDBn2eITXve2gDR7AoPICfZdyZz0KbcOYc
         8rY8SDz7S8UyJFv9C3co6EudINdhF/sr/1JjBpuEUzu/t5WDPo6nezHpMQkJEryTy4
         C/zZsk+byHolIN7ZuQTiD51UcrSPaSCX0Rnsyjj8Qx+yIJuYknuwhV2SVGeOSYO4Be
         M5D4vUET29dCwUFwhjKEeRrzEq/zZXsWtsXQoy4YxMlAnUTUgYtznb93iR/QKl7oZ6
         4hmuD7Zkcdzw4sIAcuu1+G9GIaYtYC1LBpljt3Oxhidnj7Et7R+1Uvi2HYvMuLBM/O
         Xuuq4ZR2iFgaw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As per Sony IMX274 Y_OUT_SIZE should be the height of effective
image output from the sensor which are the actual total lines
sent over MIPI CSI to receiver.

So, Y_OUT_SIZE should be same as crop height and this patch fixes it.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/media/i2c/imx274.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
index 6011cec..a4b9dfd 100644
--- a/drivers/media/i2c/imx274.c
+++ b/drivers/media/i2c/imx274.c
@@ -1163,7 +1163,7 @@ static int imx274_apply_trimming(struct stimx274 *imx274)
 		(-imx274->crop.top / 2) : (imx274->crop.top / 2);
 	v_cut = (IMX274_MAX_HEIGHT - imx274->crop.height) / 2;
 	write_v_size = imx274->crop.height + 22;
-	y_out_size   = imx274->crop.height + 14;
+	y_out_size   = imx274->crop.height;
 
 	err = imx274_write_mbreg(imx274, IMX274_HMAX_REG_LSB, hmax, 2);
 	if (!err)
-- 
2.7.4

