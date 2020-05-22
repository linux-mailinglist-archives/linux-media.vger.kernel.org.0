Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F0101DE0DB
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2020 09:26:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728816AbgEVHZo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 May 2020 03:25:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728760AbgEVHZe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 May 2020 03:25:34 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ED87C05BD43;
        Fri, 22 May 2020 00:25:33 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id z4so7728973wmi.2;
        Fri, 22 May 2020 00:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XDvP7skNJs4tKTlKtdt9bUJvJfxMC8gHW2dP050hlR0=;
        b=rnwBD9Yxv/bc1SSHOCuVjW/0ZvN3Ty/t/Mfk+cHmcAelakXqHg7HQFhklxBkxpo0JJ
         4dmBdVqVyA3qgd83irkTn/vuX6biNTbWd9trr8Gp6HSnhdSmV9ivc0zLSTaP5WPcZXRw
         Av+LtYDLRLg/+kFc/DkMI2v/zeDzBk0F4Q4iw2XR18usJstbFFpj+4YGJwx0wcfirhMS
         cYNWE+Pf+VbegZFTY0jZ5O0BSACeuQz7KWCkyXlMEi/PPhsTkxgXh/q9OrnQtVxpN2l1
         CX25wHDdS49OV3flVdLBAgWY1NDAzRBDZ9Kjau1IzdLnVpJGQOg3PrLh+cwsapUbL3YH
         cyVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XDvP7skNJs4tKTlKtdt9bUJvJfxMC8gHW2dP050hlR0=;
        b=iXNNu3HSDESk5SXI64Erj1J82tOjAKjly86WMcWTTc2FLAi/wz1dP+DAxIj/pUJ5hl
         4Tv5cDweU6GryhgGMdkylIFjeIqY/hYyoh1QFfsrahVhipHMMNoEMGvTTMifU/6DppVX
         O/BrAK0/uf1WMqx5WhPnM1LmWkOAmEWTHqBSzejjKHF5WDTmswPZlKC34SDuaW4f1m0Y
         Tdh+vGwr0Rc4OJAkSmFe7zlrOuIaJngLBT0LpbJitSyvdiT2vFhMgCzV3xQmiItNsOAS
         FmzNazr/B6KxPo0Iu6uNGKd9T/nMGHKzMR7Vx9rylBdq6hVumhJbn33dIlRV2k/igzWH
         aOkA==
X-Gm-Message-State: AOAM530IJoEA6JAyI8hdhuTHT4o09ugnh+dtt8js2VVXsACWG50LbC5u
        n24dadnhvnLLvhmvFHIWe4A=
X-Google-Smtp-Source: ABdhPJwLXPwMKkymEIty2nNVw6xiBfgdwwliFlwar3iAAZ9oqW1R/L+QdfQIxeDvNHspsL3mGaOtpg==
X-Received: by 2002:a05:600c:2146:: with SMTP id v6mr12656827wml.142.1590132331609;
        Fri, 22 May 2020 00:25:31 -0700 (PDT)
Received: from skynet.lan (159.red-83-44-12.dynamicip.rima-tde.net. [83.44.12.159])
        by smtp.gmail.com with ESMTPSA id f128sm9299898wme.1.2020.05.22.00.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2020 00:25:31 -0700 (PDT)
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
Subject: [PATCH v3 3/5] mtd: rawnand: brcmnand: rename page sizes
Date:   Fri, 22 May 2020 09:25:23 +0200
Message-Id: <20200522072525.3919332-4-noltari@gmail.com>
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

Current pages sizes apply to controllers after v3.4

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 v3: no changes.
 v2: add new patch.

 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 72b268d8e3a4..ef60dbbeac2b 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -571,7 +571,7 @@ static int brcmnand_revision_init(struct brcmnand_controller *ctrl)
 {
 	static const unsigned int block_sizes_v6[] = { 8, 16, 128, 256, 512, 1024, 2048, 0 };
 	static const unsigned int block_sizes_v4[] = { 16, 128, 8, 512, 256, 1024, 2048, 0 };
-	static const unsigned int page_sizes[] = { 512, 2048, 4096, 8192, 0 };
+	static const unsigned int page_sizes_v3_4[] = { 512, 2048, 4096, 8192, 0 };
 
 	ctrl->nand_version = nand_readreg(ctrl, 0) & 0xffff;
 
@@ -618,7 +618,7 @@ static int brcmnand_revision_init(struct brcmnand_controller *ctrl)
 		ctrl->max_page_size = 16 * 1024;
 		ctrl->max_block_size = 2 * 1024 * 1024;
 	} else {
-		ctrl->page_sizes = page_sizes;
+		ctrl->page_sizes = page_sizes_v3_4;
 		if (ctrl->nand_version >= 0x0600)
 			ctrl->block_sizes = block_sizes_v6;
 		else
-- 
2.26.2

