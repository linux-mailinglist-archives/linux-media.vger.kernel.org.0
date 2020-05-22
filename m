Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7BF61DE0D6
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2020 09:26:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728734AbgEVHZc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 May 2020 03:25:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728409AbgEVHZb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 May 2020 03:25:31 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21258C061A0E;
        Fri, 22 May 2020 00:25:31 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id u188so8854217wmu.1;
        Fri, 22 May 2020 00:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DHgeS900C8sjZPSNqdj5fllI3ugne42uY2C7wCBS5Gc=;
        b=lD8c4JEKWp4wF+rIFa4eB53uzn67CvhVIXCJdVVeXQami4aGZ9RQI+9IC7Q56X9Vxp
         o35EnfKJOJE2FxKUDHkBZXVHu3dt5Mds4QGISSRoPaXCsRivc/sKiC9/K4y5V2svIlA8
         7cESVc1bQfp4oBkny2cx7z7MH31BO7Hyi2vQsIIf7qG+DzWBKej+wTexUk8VSeqdFppN
         Hz9rdN1eY00OtieXvWRiwGNFFYjUw1yVoJzqKM7WBvSoNHkAf6cMoHA9FYAeHxEQgN89
         gAdK75z09uo6bbtcFf6tjWgk0WlNy6rFg7FM/SWtjgL4/ACRUJZmk+k2MWswrAtbyNfz
         Bwbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DHgeS900C8sjZPSNqdj5fllI3ugne42uY2C7wCBS5Gc=;
        b=CfZw0EbS5rH6qU6F7RJlWY5DvSa7/U9Rap3pwLLaGdNuY3p/1k/Kxsiqr7F697+fsz
         mBMCzM5eRMSwakNc+PatunG4ObQEmvir+4GCYKOzZuHsrAzOFA0gMMTYGi+XeF+cMBvi
         3oZk1P/6C7MJWQjuRL+fmv3BjfEVt3eZdjtJvUqZBcpqGJ5GKoUjxwS1Lg8U6TuiEmVu
         VDmVIoJM48UJ/Wf9Kr9nEbwCa8yCbz/6djV15dkqEO4SjOwZK0ocAwjST+wTtMjTV3tu
         nynlGmLWfofo4BfkAVAPKpvV0Uz1hJnenRouTy1qkDLzh42rfqqZUJ+bxwgvRDN27sAs
         rifQ==
X-Gm-Message-State: AOAM531pDXjITbm6bzt4cuCqG/2AEPf07BPeQZf/S/MEPrxKyLU+fqBP
        w9wjipHg6ewI3QR0uiqW3Qh/zDaFpRA=
X-Google-Smtp-Source: ABdhPJzZtAzIjrObPOreEvfAVtffck8CKlAUsXZQXdOeijTaDTKBgecBn4czPLCpDMJ3+PcRdNzZUA==
X-Received: by 2002:a05:600c:d7:: with SMTP id u23mr13114869wmm.155.1590132329602;
        Fri, 22 May 2020 00:25:29 -0700 (PDT)
Received: from skynet.lan (159.red-83-44-12.dynamicip.rima-tde.net. [83.44.12.159])
        by smtp.gmail.com with ESMTPSA id f128sm9299898wme.1.2020.05.22.00.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2020 00:25:29 -0700 (PDT)
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
Subject: [PATCH v3 1/5] mtd: rawnand: brcmnand: rename v4 registers
Date:   Fri, 22 May 2020 09:25:21 +0200
Message-Id: <20200522072525.3919332-2-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200522072525.3919332-1-noltari@gmail.com>
References: <20200512073329.742893-1-noltari@gmail.com>
 <20200522072525.3919332-1-noltari@gmail.com>
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

