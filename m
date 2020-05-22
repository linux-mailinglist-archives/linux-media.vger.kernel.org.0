Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FBF91DE67D
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2020 14:15:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729403AbgEVMPa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 May 2020 08:15:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728889AbgEVMPa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 May 2020 08:15:30 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFDE5C061A0E;
        Fri, 22 May 2020 05:15:29 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id h4so8438625wmb.4;
        Fri, 22 May 2020 05:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BKAL92q0Ci52kZCwbvnlfVSuzATsT4BlcolHSe2kRwA=;
        b=Ma0iYnPOu18BXyUM2shyVIEPYAFkkDlzr4V0aTIoaJMJu2X0bZtj1x1MiTOvGqa0JJ
         zbe9aFR1z083hhwx2sYPPpD6K9MDaa0JNYDfZPYkWb6+ZQRnKlKKvUwB3jiJzxk96bTg
         AMaQW8IYqJnKo6PBH1UilzfJGZB7TjcrcfZHu+9CuPAr200CyRAcfMd1oU0q0x5Y9oO3
         Im1+W9qaZ4mikvdB91CP83kXAywPrthNh0duQHX+hVNot/MxYoWc9r03BvS2nx7iIUlu
         k+fVjm1ZPvi9cYlCfBraVVSAz6BN9dIQR3xGAz68B1GQg37++HQNgvYF4dH1w8egnrh3
         6CRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BKAL92q0Ci52kZCwbvnlfVSuzATsT4BlcolHSe2kRwA=;
        b=n2kkMs4B2yMglaGjzEjRnS53Q6CnlFUbpI1w0KaXy37255XATG+ddEjDoELE4zmWpR
         hDeX6l1/zmDdwhq5BT7V7P7xiM6UQ0l1pbpH1HPxFxpXcENQxHC3Q36NM3GMj5nq/fWJ
         /orG1hXYs++MyUfwdnJyZ4f+ZU9huiNRPcUcL8xm/LPn3cX3Bbe+Bu9TLHIxebenKELm
         1xEzCKbgmXZv93AZZoAhZO6UXBVZj+eQO5qc2/d9xXui0xjH1n8X06mlw29crGKqD4t4
         T3WsFzeH8EgQRMBJrw55UNiIZhXcbipbvGM7EMxZZUIJiMuRAQItNcQs0FQcp8n5Ugfr
         SVZQ==
X-Gm-Message-State: AOAM532vp96S5WnfHqKu0TGOevyhXCm8iZxStbY5DsBiFnESJsiWvhHr
        exgztkJ2XmbdpaMwsSKSD5Y=
X-Google-Smtp-Source: ABdhPJxfxLCgrUYA6xryeUMaIeXfb1eR8QQ5Ia19IxIsjWiD/P2PTMcWNjzdcSkchlscqpb3L5SE7w==
X-Received: by 2002:a05:600c:2dd0:: with SMTP id e16mr14105746wmh.121.1590149728253;
        Fri, 22 May 2020 05:15:28 -0700 (PDT)
Received: from skynet.lan (159.red-83-44-12.dynamicip.rima-tde.net. [83.44.12.159])
        by smtp.gmail.com with ESMTPSA id g6sm9293784wrp.75.2020.05.22.05.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2020 05:15:27 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     computersforpeace@gmail.com, kdasu.kdev@gmail.com,
        miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v4 1/5] mtd: rawnand: brcmnand: rename v4 registers
Date:   Fri, 22 May 2020 14:15:20 +0200
Message-Id: <20200522121524.4161539-2-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200522121524.4161539-1-noltari@gmail.com>
References: <20200522072525.3919332-1-noltari@gmail.com>
 <20200522121524.4161539-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

These registers are also used on v3.3.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 v4: no changes.
 v3: no changes.
 v2: fix commit title.

 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index e4e3ceeac38f..6a08dd07b058 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -338,8 +338,8 @@ enum brcmnand_reg {
 	BRCMNAND_FC_BASE,
 };
 
-/* BRCMNAND v4.0 */
-static const u16 brcmnand_regs_v40[] = {
+/* BRCMNAND v3.3-v4.0 */
+static const u16 brcmnand_regs_v33[] = {
 	[BRCMNAND_CMD_START]		=  0x04,
 	[BRCMNAND_CMD_EXT_ADDRESS]	=  0x08,
 	[BRCMNAND_CMD_ADDRESS]		=  0x0c,
@@ -591,8 +591,8 @@ static int brcmnand_revision_init(struct brcmnand_controller *ctrl)
 		ctrl->reg_offsets = brcmnand_regs_v60;
 	else if (ctrl->nand_version >= 0x0500)
 		ctrl->reg_offsets = brcmnand_regs_v50;
-	else if (ctrl->nand_version >= 0x0400)
-		ctrl->reg_offsets = brcmnand_regs_v40;
+	else if (ctrl->nand_version >= 0x0303)
+		ctrl->reg_offsets = brcmnand_regs_v33;
 
 	/* Chip-select stride */
 	if (ctrl->nand_version >= 0x0701)
-- 
2.26.2

