Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3D5D1CEE16
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2020 09:34:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729022AbgELHdm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 May 2020 03:33:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727859AbgELHdi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 May 2020 03:33:38 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 537FDC061A0E;
        Tue, 12 May 2020 00:33:38 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id u16so22057904wmc.5;
        Tue, 12 May 2020 00:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=G5WeydaheRjYC65flS9VBT/GaukdHAjM5PopK1ROBpE=;
        b=uGzylulqminwzQ6povM6ovuuUBe0WiR4xU6SJn+/ZSYfSjJBCwlFQK0jgTnK48gceG
         BDESWCgsNMop/6BdmxKJRpgdT3qA6z/M4og5XoHwArvwSsUiVikxCWL9PR/d2Q3oJBKd
         4D4ag5Wj03XHA0MDGSxGSyso2qvooQRLfFHGagytBBiB0WhxpFyYrtC8cw9Ivc0xJFnJ
         PFp0FFvnX0h1gm8K85juN3SgJ0GpLAjMP0aEVxM8vLScYZd6dZNMwt0Oz6fSSqxoq7nA
         mB5n366zhZTIJpm4Pw+AAsQjkZ3mKxBcWuxqm2tLqFlhrYTVGJ8jTPiVU87inTwss5TP
         vJQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G5WeydaheRjYC65flS9VBT/GaukdHAjM5PopK1ROBpE=;
        b=X1PUV912lZiK6rc++Kjc3ywuATs4vKs+gtgiNhxOhsfYt98KfVVSsnhBAeflhBXuO7
         f1fmImxoL+MLmi4kMAiwJQt8jIT0HeFrp4KDZJPMyEyBkhtJ7JNbIRe/5IlWrw8uCrzS
         hQuqb3cr3ivk8/z5xWfGuVBf607FQMUz/KgIuu5U/f7BJDS++Akq/VTcA25zG/IzPf3I
         Hpd+O6FaZ6iDBPBV/FuvJxdOY8qAkguhjvKQfphSh1nnVo6bHzZcvu2VPX+ugCFEeAo/
         LZeULtoUeWrLnHwOlevSPDzNR+EAAkk1wSidYvtcOQk4DziiOP9AvdA9A2ot1SO7cjxw
         AnSA==
X-Gm-Message-State: AOAM5322yAjxDjvEucMn88sOmGKV+frfawAmiadgQGr4V6e6t94cl3cq
        mBNk2IS0TnVnd9MpaFnm704=
X-Google-Smtp-Source: ABdhPJy5oH7h1efIv7HKPXfxD75jowwabOsBtrEQiCX/KAWe4Acx+HNa053Yh3bIJDVBJsMfhrDqJg==
X-Received: by 2002:a05:600c:22c9:: with SMTP id 9mr1320114wmg.162.1589268817065;
        Tue, 12 May 2020 00:33:37 -0700 (PDT)
Received: from skynet.lan (198.red-83-49-57.dynamicip.rima-tde.net. [83.49.57.198])
        by smtp.gmail.com with ESMTPSA id d9sm5961197wmd.10.2020.05.12.00.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 00:33:36 -0700 (PDT)
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
Subject: [PATCH v2 3/5] mtd: rawnand: brcmnand: rename page sizes
Date:   Tue, 12 May 2020 09:33:27 +0200
Message-Id: <20200512073329.742893-4-noltari@gmail.com>
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

Current pages sizes apply to controllers after v3.4

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
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

