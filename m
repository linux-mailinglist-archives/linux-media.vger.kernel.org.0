Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CED66399CDC
	for <lists+linux-media@lfdr.de>; Thu,  3 Jun 2021 10:42:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230039AbhFCIoF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Jun 2021 04:44:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230033AbhFCIoF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Jun 2021 04:44:05 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98C31C06174A
        for <linux-media@vger.kernel.org>; Thu,  3 Jun 2021 01:42:20 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id a11so3087338wrt.13
        for <linux-media@vger.kernel.org>; Thu, 03 Jun 2021 01:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SNU7JKX7aSeTK7xjNMO/CkhBcJ6lCl+AhfJOU6hzNns=;
        b=UcYf/2lHKlayXrEaOKqNHbasHUf900ovmhEA4V0P1Wk+dboPkf+FzAxPxvGpW20HfP
         E9Lsg9z2e/fUjxqj/kWVjzzJot9pWBGJA5FhHZVRD3JIYrD/vr/SxIvR3nX5tOGm1iww
         5wznIGTaU/IafI8pnf7Kqn/+xJfnzs6kCRPAzfEsISk/ZVQ5gcEl0jC9AlRfKTadyPo/
         qgXba2AMoZN4TbYq3EbT9TM/F1NnsaF8jLGCBL76eS/68b6EXEvJi+Qxm8iiEhp+tI7t
         PfF3UDvcMS27xUTx7XYMuVZ4jov1tvOUN4xFF3UgZpFrBLdYgo+UuJpNPREsDfk96YKH
         KQVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SNU7JKX7aSeTK7xjNMO/CkhBcJ6lCl+AhfJOU6hzNns=;
        b=T7l/0/K/5JcC7Yx0BEGxg1KukjQjoBtSJJZlKDdtPHWBHlOtWEgX/vDIQqPAMuNhmC
         gtkdLQZnpYI2hTeCIaD5MEHcg7gB3VMDdrk4DKlBHiBIq+Gk62b6MEk/7zsov4aw9k+0
         M/6b+J6INoM2C2SO5eNn8k+LF+J0pNlA0kGKSaIFqaa4tlaEp2ApBcTFdhM6R1ishmDc
         iacQFBroGIiOJi/QdPSXaSmhS03JGSrs+prM0cJIa/6hTKkkU1HhkimBbGsfYpnUtCW1
         wkrGzudN7O8Clq5sLkBC3k1Rjdrbf35ZBmXcW75nN4z4kITiNpC4BSmsi4PRU3cD9isI
         5yuQ==
X-Gm-Message-State: AOAM531Hp+b0IvLCTJlW0Ai8eNwbP/xkNdrabbue1k0LGW4bm3fq3G04
        LD9xiqL5BGCrkXOpTRqGBSzOeQ==
X-Google-Smtp-Source: ABdhPJy7qovuJNSsahe4jvLCLnwO65bY2WkvJC3lTYs5vxvgnCuu7RfBP7fkELCrdwjh4mvAOlep/Q==
X-Received: by 2002:adf:c38a:: with SMTP id p10mr23301663wrf.138.1622709739038;
        Thu, 03 Jun 2021 01:42:19 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:c7bb:ed8:463c:e094])
        by smtp.gmail.com with ESMTPSA id l3sm2075176wmh.2.2021.06.03.01.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 01:42:18 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     hverkuil-cisco@xs4all.nl
Cc:     linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH] media: mexon-ge2d: fixup frames size in registers
Date:   Thu,  3 Jun 2021 10:42:15 +0200
Message-Id: <20210603084215.368764-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3555; h=from:subject; bh=fDG0y2ajd4sQMyG0ttCCWx537eEFDH2CjN5zlWNa1zc=; b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBguJXDk1ouZJkvROuDyWlgJHb+IMnkKLSjCy8YlusE quTE+ByJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYLiVwwAKCRB33NvayMhJ0VhnEA COQ2pz5dPikIjqm1jDCwLx8nhXSLBFdWmsZY1qlZqYEd/NQP5xMY9dmAZvrhkMmQAxOM9UtbTw22Mv Y9SxNTE54KP4MHFCXKDjze5N9R1d0LFsx2IQo3N10+2Bz2YIV81zzWJX5XnGY2rkcKKtugUi3oOa1f ey0ZzNTZCW0t1qxTCx66gu+5rjYgXGomojS8bypnjSLk8n62wKvEhM/N/T8GcRHV6nPRusIPL4Co7m 37hbQbmko1SaMyvai7mOUwM/rN9dTz5dAxxjCYsDR+AN1VnSHgx+2Xsabk50ika5EY9FlCyT8B9kVX xY87plF1bFPFGxV7fjobtBxVmF5Pg/Gh9/JuqHGNJxitrPa94q0jKB3LBn3XjBp9CQcbNVjv8BuiNj WS+VSvpaFvJi90vrTrCcjHSnKf0nPieHrcyl6h/X/KJxDudYzKhiM05BZeI7mQqM3Mspphg9j8OKPS /SuO9ig5f+qVNUrh43JkI+NcB2T304g1M6v85VMoklON/E1P/5YAoUsrssrwdtzpO/wxe4/P1DFdWj wvOlWjgDokwriuHM8FCbgpTGl3mfRrlIBbTBO3sFJdodtpdB855S58hVAhl1JXO6d0FkZswKYB4ou1 idH+alnWju8Wqb539mGDpxjKgVuBWuXVbQUxB0/Q5W1VOt+Zkrj270KVTgVA==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp; fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The CLIP, SRC & DST registers are coded to take the pixel/line start & end,
starting from 0. Thus the end should be the width/height minus 1.

It can be an issue with clipping and rotation, where it will add spurious
lines from uninitialized or unwanted data with a shift in the result.

Fixes: 59a635327ca7 ("media: meson: Add M2M driver for the Amlogic GE2D Accelerator Unit")
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/media/platform/meson/ge2d/ge2d.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/meson/ge2d/ge2d.c b/drivers/media/platform/meson/ge2d/ge2d.c
index a1393fefa8ae..45b99964ea0a 100644
--- a/drivers/media/platform/meson/ge2d/ge2d.c
+++ b/drivers/media/platform/meson/ge2d/ge2d.c
@@ -215,35 +215,35 @@ static void ge2d_hw_start(struct meson_ge2d *ge2d)
 
 	regmap_write(ge2d->map, GE2D_SRC1_CLIPY_START_END,
 		     FIELD_PREP(GE2D_START, ctx->in.crop.top) |
-		     FIELD_PREP(GE2D_END, ctx->in.crop.top + ctx->in.crop.height));
+		     FIELD_PREP(GE2D_END, ctx->in.crop.top + ctx->in.crop.height - 1));
 	regmap_write(ge2d->map, GE2D_SRC1_CLIPX_START_END,
 		     FIELD_PREP(GE2D_START, ctx->in.crop.left) |
-		     FIELD_PREP(GE2D_END, ctx->in.crop.left + ctx->in.crop.width));
+		     FIELD_PREP(GE2D_END, ctx->in.crop.left + ctx->in.crop.width - 1));
 	regmap_write(ge2d->map, GE2D_SRC2_CLIPY_START_END,
 		     FIELD_PREP(GE2D_START, ctx->out.crop.top) |
-		     FIELD_PREP(GE2D_END, ctx->out.crop.top + ctx->out.crop.height));
+		     FIELD_PREP(GE2D_END, ctx->out.crop.top + ctx->out.crop.height - 1));
 	regmap_write(ge2d->map, GE2D_SRC2_CLIPX_START_END,
 		     FIELD_PREP(GE2D_START, ctx->out.crop.left) |
-		     FIELD_PREP(GE2D_END, ctx->out.crop.left + ctx->out.crop.width));
+		     FIELD_PREP(GE2D_END, ctx->out.crop.left + ctx->out.crop.width - 1));
 	regmap_write(ge2d->map, GE2D_DST_CLIPY_START_END,
 		     FIELD_PREP(GE2D_START, ctx->out.crop.top) |
-		     FIELD_PREP(GE2D_END, ctx->out.crop.top + ctx->out.crop.height));
+		     FIELD_PREP(GE2D_END, ctx->out.crop.top + ctx->out.crop.height - 1));
 	regmap_write(ge2d->map, GE2D_DST_CLIPX_START_END,
 		     FIELD_PREP(GE2D_START, ctx->out.crop.left) |
-		     FIELD_PREP(GE2D_END, ctx->out.crop.left + ctx->out.crop.width));
+		     FIELD_PREP(GE2D_END, ctx->out.crop.left + ctx->out.crop.width - 1));
 
 	regmap_write(ge2d->map, GE2D_SRC1_Y_START_END,
-		     FIELD_PREP(GE2D_END, ctx->in.pix_fmt.height));
+		     FIELD_PREP(GE2D_END, ctx->in.pix_fmt.height - 1));
 	regmap_write(ge2d->map, GE2D_SRC1_X_START_END,
-		     FIELD_PREP(GE2D_END, ctx->in.pix_fmt.width));
+		     FIELD_PREP(GE2D_END, ctx->in.pix_fmt.width - 1));
 	regmap_write(ge2d->map, GE2D_SRC2_Y_START_END,
-		     FIELD_PREP(GE2D_END, ctx->out.pix_fmt.height));
+		     FIELD_PREP(GE2D_END, ctx->out.pix_fmt.height - 1));
 	regmap_write(ge2d->map, GE2D_SRC2_X_START_END,
-		     FIELD_PREP(GE2D_END, ctx->out.pix_fmt.width));
+		     FIELD_PREP(GE2D_END, ctx->out.pix_fmt.width - 1));
 	regmap_write(ge2d->map, GE2D_DST_Y_START_END,
-		     FIELD_PREP(GE2D_END, ctx->out.pix_fmt.height));
+		     FIELD_PREP(GE2D_END, ctx->out.pix_fmt.height - 1));
 	regmap_write(ge2d->map, GE2D_DST_X_START_END,
-		     FIELD_PREP(GE2D_END, ctx->out.pix_fmt.width));
+		     FIELD_PREP(GE2D_END, ctx->out.pix_fmt.width - 1));
 
 	/* Color, no blend, use source color */
 	reg = GE2D_ALU_DO_COLOR_OPERATION_LOGIC(LOGIC_OPERATION_COPY,
-- 
2.25.1

