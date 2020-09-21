Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2646273500
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 23:39:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727793AbgIUVju (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 17:39:50 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:2108 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727447AbgIUVjt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 17:39:49 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f691d470000>; Mon, 21 Sep 2020 14:38:15 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 21 Sep
 2020 21:39:48 +0000
Received: from skomatineni-linux.nvidia.com (172.20.13.39) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server id
 15.0.1473.3 via Frontend Transport; Mon, 21 Sep 2020 21:39:47 +0000
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <sakari.ailus@iki.fi>,
        <hverkuil@xs4all.nl>, <jacopo+renesas@jmondi.org>,
        <luca@lucaceresoli.net>, <leonl@leopardimaging.com>,
        <robh+dt@kernel.org>, <lgirdwood@gmail.com>, <broonie@kernel.org>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 2/3] media: i2c: imx274: Remove stop stream i2c writes during remove
Date:   Mon, 21 Sep 2020 14:39:38 -0700
Message-ID: <1600724379-7324-3-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600724379-7324-1-git-send-email-skomatineni@nvidia.com>
References: <1600724379-7324-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1600724295; bh=83lTY4cH8oBZYswFf947v8pbO/z/cXEoBiKxHsPEkDs=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:X-NVConfidentiality:MIME-Version:Content-Type;
        b=lvpUjWoQjbVxiZmGe+yBKqRNRV2pC33seZzm1zlPoT6lNzZbj9Esc9dbYfRtO8vzi
         XGJo32coln7Gt3xdi1Hm4X8Nuc85vDiwugMjBAYrCThPpATPSF0XKLbY3g5GpHZ0fk
         okLtWgW3tiN8t9ViDHzfEO81EvG+mt3gnNzoO1C067LBMfa/ZUZD8So3tx8BIslJSP
         lE3tEKcXKa5wt/+7qNuVpoNfJAIS28cziPZRrOS5TlVcGm8qMYGCcQCuHW7tml+J9q
         HA9TyEvLG4ZvGOlJeRPbNen3sliCJYDlgOejVJ3Tze9Z91Dvq4XK7hLdmer6NAAK4g
         kF31MWrKBGUbA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sensor should already be in standby during remove and there is no
need to configure sensor registers for stream stop.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/media/i2c/imx274.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
index a4b9dfd..5e515f0 100644
--- a/drivers/media/i2c/imx274.c
+++ b/drivers/media/i2c/imx274.c
@@ -1968,9 +1968,6 @@ static int imx274_remove(struct i2c_client *client)
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
 	struct stimx274 *imx274 = to_imx274(sd);
 
-	/* stop stream */
-	imx274_write_table(imx274, imx274_stop);
-
 	v4l2_async_unregister_subdev(sd);
 	v4l2_ctrl_handler_free(&imx274->ctrls.handler);
 	media_entity_cleanup(&sd->entity);
-- 
2.7.4

