Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66A5B25A2D8
	for <lists+linux-media@lfdr.de>; Wed,  2 Sep 2020 04:05:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726384AbgIBCFM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Sep 2020 22:05:12 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:8545 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726144AbgIBCFK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Sep 2020 22:05:10 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f4efda70000>; Tue, 01 Sep 2020 19:04:23 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 01 Sep 2020 19:05:09 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 01 Sep 2020 19:05:09 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 2 Sep
 2020 02:05:09 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 2 Sep 2020 02:05:09 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.173.243]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f4efdd40001>; Tue, 01 Sep 2020 19:05:09 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <sakari.ailus@iki.fi>,
        <hverkuil@xs4all.nl>, <jacopo+renesas@jmondi.org>,
        <luca@lucaceresoli.net>, <leonl@leopardimaging.com>,
        <robh+dt@kernel.org>, <lgirdwood@gmail.com>, <broonie@kernel.org>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 1/3] media: i2c: imx274: Fix Y_OUT_SIZE register setting
Date:   Tue, 1 Sep 2020 19:04:36 -0700
Message-ID: <1599012278-10203-2-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599012278-10203-1-git-send-email-skomatineni@nvidia.com>
References: <1599012278-10203-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1599012263; bh=7eG8er5DakEQLU4K41aXrq57p9hJvRNjoRAVrC46VL0=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=eA6FiMWENOEOhGZTfxQgjt0Al+wgmtWJCsyd1f/5MdcMSBKYzXf7J91ruQny/MUxj
         XPKgSQvUB69MMWdCW/cWPxcw1n7d6aMrjPusp1n1d9v7k4lIslOiVFuYWp/SxQ8WEM
         kUOehVpxIQMeHXS/BZI4KsjDGt846jbjYsrg2w17jVomdUJ93pE6DDDhgUYpuB40BP
         /WqKFRqEvSU8LzoBJMWvPTJMDQ2GIlLcKnSF26PQfoKZGtHSuCwBANOJFNUFd6wIio
         wz3elWpA0rfRrtA/Ux0g0p7SmUaqIrvbErAgHhvKRfiIISEN+r7V8FSV5cpqsF+4sC
         tu+X8qrAlVhJw==
Sender: linux-media-owner@vger.kernel.org
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

