Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB5D024E790
	for <lists+linux-media@lfdr.de>; Sat, 22 Aug 2020 15:11:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728020AbgHVNLq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 22 Aug 2020 09:11:46 -0400
Received: from smtp09.smtpout.orange.fr ([80.12.242.131]:17505 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727994AbgHVNLp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 22 Aug 2020 09:11:45 -0400
Received: from localhost.localdomain ([92.140.170.113])
        by mwinf5d17 with ME
        id JdBT230072T8iuL03dBYex; Sat, 22 Aug 2020 15:11:43 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 22 Aug 2020 15:11:43 +0200
X-ME-IP: 92.140.170.113
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
        tian.shu.qiu@intel.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org, yong.zhi@intel.com
Cc:     linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] media: staging/intel-ipu3: css: Correctly reset some memory
Date:   Sat, 22 Aug 2020 15:11:24 +0200
Message-Id: <20200822131124.157917-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The intent here is to reset the whole 'scaler_coeffs_luma' array, not just
the first element.

Fixes: 	e11110a5b744 ("media: staging/intel-ipu3: css: Compute and program ccs")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/staging/media/ipu3/ipu3-css-params.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/ipu3/ipu3-css-params.c b/drivers/staging/media/ipu3/ipu3-css-params.c
index fbd53d7c097c..e9d6bd9e9332 100644
--- a/drivers/staging/media/ipu3/ipu3-css-params.c
+++ b/drivers/staging/media/ipu3/ipu3-css-params.c
@@ -159,7 +159,7 @@ imgu_css_scaler_calc(u32 input_width, u32 input_height, u32 target_width,
 
 	memset(&cfg->scaler_coeffs_chroma, 0,
 	       sizeof(cfg->scaler_coeffs_chroma));
-	memset(&cfg->scaler_coeffs_luma, 0, sizeof(*cfg->scaler_coeffs_luma));
+	memset(&cfg->scaler_coeffs_luma, 0, sizeof(cfg->scaler_coeffs_luma));
 	do {
 		phase_step_correction++;
 
-- 
2.25.1

