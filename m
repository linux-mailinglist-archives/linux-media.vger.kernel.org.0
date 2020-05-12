Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 867651CEE11
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2020 09:34:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728924AbgELHdg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 May 2020 03:33:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727859AbgELHdf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 May 2020 03:33:35 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 953E9C061A0C;
        Tue, 12 May 2020 00:33:35 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id n5so7174195wmd.0;
        Tue, 12 May 2020 00:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jqkgqmkJOKoKq9LVMSsdUKqLeUylhGstfJdiNW1m0pU=;
        b=sMw5Ou1DxQ0gDVShwnb+r0jVY9OgvPxlTdxCYMUjeHxnjkdnMZEHlB/ETLFPEyrQTV
         f3UPUtvn02e8incuNsrA11dODEo8ERiZctXWIS9t+3PUT1b2uMacgCg3/Ld5pqCI6iSS
         jHNB9PxINIhrl5lkZjVJuurycwFhX7NfNY5F1P7ObmQLDN6gOj+iBSUkifaxIlHcgIaV
         R3TvhWGCzwiwQ8CDEHA0GKqkXovGyr1DhUAs93B7lppeobuG6EQ+WncjtZN1nOtfxt01
         F1pfYC+jfYvXSiySnTpWSwVxAj0mPGkNxduwk6Jgf4NEyPx2ePn7ttz4TKL+dz5uhjQq
         pAzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jqkgqmkJOKoKq9LVMSsdUKqLeUylhGstfJdiNW1m0pU=;
        b=hNDZAGuAPuUgEAy741Xw+F4AP0e8XZj33tyFEIFZL88aAlVtsnxmTMmkYLe3eFgVbf
         741Rwy8Nb/2EPjCEuoI7TvQWlOZAPZjXI/yoK9gVz0hQzn5ym35IXpXkQOMGqc32Np3U
         ea47R387xxvW2GWAnfTGTwmIHCeFSHL61IoDXIgFjxJOYk4ecISv2KfYOmX0jHMoLuvR
         c0WwdQv6hgxxH+dcmdu5bIugxKg3RDsoT8ibwlhyyr4iRlOKAQzmqMROir+8B4WwqP9k
         dkSf1IL88mGTbfIMjzDVZU8eYIdI8USXpXodO1aJfmLW8z4QeifrumH3bD9BdAbxd2c2
         5Ggw==
X-Gm-Message-State: AGi0PubwujMnRYfafDGeQqx/5lBAMWZ2nTcPK3oYw5J0KlaonS4Az6BN
        b/q35YYXIMBxIp7StlQo63E=
X-Google-Smtp-Source: APiQypLLSffxSVovV7tqZUrpdXOgAzbPqHBnVWM76vtOVvD70huOXD6rxYEtuZXYxJgRz4MPLxVK8w==
X-Received: by 2002:a7b:c74d:: with SMTP id w13mr34531649wmk.36.1589268814233;
        Tue, 12 May 2020 00:33:34 -0700 (PDT)
Received: from skynet.lan (198.red-83-49-57.dynamicip.rima-tde.net. [83.49.57.198])
        by smtp.gmail.com with ESMTPSA id d9sm5961197wmd.10.2020.05.12.00.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 00:33:33 -0700 (PDT)
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
Subject: [PATCH v2 1/5] mtd: rawnand: brcmnand: rename v4 registers
Date:   Tue, 12 May 2020 09:33:25 +0200
Message-Id: <20200512073329.742893-2-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200512073329.742893-1-noltari@gmail.com>
References: <20200510151406.2527856-1-noltari@gmail.com>
 <20200512073329.742893-1-noltari@gmail.com>
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

