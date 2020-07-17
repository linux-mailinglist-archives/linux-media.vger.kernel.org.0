Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 715642243F5
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 21:13:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728632AbgGQTL7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jul 2020 15:11:59 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:1396 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728607AbgGQTL6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jul 2020 15:11:58 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f11f7c20006>; Fri, 17 Jul 2020 12:10:58 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Fri, 17 Jul 2020 12:11:57 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Fri, 17 Jul 2020 12:11:57 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 17 Jul
 2020 19:11:57 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 17 Jul 2020 19:11:57 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.163.115]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f11f7fc0001>; Fri, 17 Jul 2020 12:11:56 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <luca@lucaceresoli.net>, <leonl@leopardimaging.com>,
        <robh+dt@kernel.org>, <lgirdwood@gmail.com>, <broonie@kernel.org>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/3] media: i2c: imx274: Fix Y_OUT_SIZE register setting
Date:   Fri, 17 Jul 2020 12:15:20 -0700
Message-ID: <1595013322-15077-1-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1595013058; bh=DLvQ6chRzbjeKicuQdxuqVcpH3d1W/1R1Kay/NtRj70=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type;
        b=dNkIccMwSkcpJVG9TVvN1c8DqptyYAYHC0pojdxtG/ndu8jD1Aqq8KySS2156GZQm
         yngeqITKvsHwtyC2mPMbgIoU7I6NAAfkIR3cQD8BtywDat7iYArxf0NoScpyi9SlbM
         pMUY7U4PFSmgDiu39pU9LqEhyukAf2VhxjdYKUi1jFtIlymWLn7Y7HB3wUpYAZWJqk
         FLVNwWvdAlmJXbXy5zeU63P91/RarxpLqS8hNorSv25iXnI3FefRBmWj3t7FxlFbd4
         1wR3HRZfgqhbsY6XDaelo7suvoDrmjeTShv0B0YG9M7chZ5jXhYugVQ6fVhFetF03x
         lfT3lqnadGRRg==
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
index e6aa9f3..55869ff 100644
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

