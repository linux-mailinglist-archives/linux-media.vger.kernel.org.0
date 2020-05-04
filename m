Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E91991C35B8
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2020 11:30:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728388AbgEDJ36 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 May 2020 05:29:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727781AbgEDJ35 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 4 May 2020 05:29:57 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 944B3C061A0E;
        Mon,  4 May 2020 02:29:57 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id e16so14948707wra.7;
        Mon, 04 May 2020 02:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l2YxkH/lWbx8jjAhy6XV0nL4qLMq1MOAjY7RA6k/WB4=;
        b=K/Ws8BmyoqGZGLQYHin3HwA+JMkgqMir7wNzB+pLnNTGxSTZUQHt0DLXMzAsIQEzcP
         9QJhcV4cq2WOOptbt+J4xCmszcY31/GvEuCAPr3uqFtzKXNVWE9T/Kza5Y0rT/KzbyaA
         hL9Sre8KAx8xY1lePcT+QeEx4d81BJyyb6c2/KPjBTx0YLLH0EjrYv/y0BcbiMjfluoR
         /coNr6jJ3H+bn0ZuQ+DREJfJeSjZ+oxvg21BqHTIWsOJVyJypNsL7X5HEHOoYc8ma5E/
         0ivUVZdwJXvWcE79pxbu0EAW9Gw1v5obnDV/lGVFG6/5I6LqZCBBtLvoTR3myFpzLxE7
         lKDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l2YxkH/lWbx8jjAhy6XV0nL4qLMq1MOAjY7RA6k/WB4=;
        b=rysfett1YnHUB8EevK4YlL9fwyRXojWrzUsmyyyMpCGW2yaPuB9xbYbk3PfBwyS50d
         /UE5ckicsTDVulmHFV1V17bkZzZXSeDuK9lua2nKnN3uO8cgsT7d+UWFMNG7wvfSKFL5
         0k6qMumR43cNkvgj96/6tlJ3+H360FAG1BUR4r57YXRlQk/R6nuyHtRe2zz8PNRhXU+S
         lOKtS7dXoTO7AeSp8YKRSua/gZ6qVLvxBeQwnB4k56nhBQrW8ukAWTwjo/lC4YGwd/UI
         wmpeL57J/tEQ7YNFRrm0eNLtIx1432ZZAxD+nijGffckMkOBzG0HLa5b2GlnQ3Q2XMoZ
         vCfw==
X-Gm-Message-State: AGi0PubKpangctsFpuZuB57EXbwDLUwNGYJN0dOgEbOfGUmzrUfOI4LS
        KOB6KRQ4D5yiggHFbN/NTc8=
X-Google-Smtp-Source: APiQypIkkbhC2pp71xWc4qJpvnWgeLLvCX9aOOoVg4impVPijmMMmbwo6MgNbyyZOaF+TmYb8rAXSw==
X-Received: by 2002:adf:ea09:: with SMTP id q9mr314819wrm.399.1588584596171;
        Mon, 04 May 2020 02:29:56 -0700 (PDT)
Received: from skynet.lan (246.red-83-44-9.dynamicip.rima-tde.net. [83.44.9.246])
        by smtp.gmail.com with ESMTPSA id s8sm17334965wru.38.2020.05.04.02.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 02:29:55 -0700 (PDT)
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
Subject: [PATCH] nand: brcmnand: correctly verify erased pages
Date:   Mon,  4 May 2020 11:29:43 +0200
Message-Id: <20200504092943.2739784-1-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The current code checks that the whole OOB area is erased.
This is a problem when JFFS2 cleanmarkers are added to the OOB, since it will
fail due to the usable OOB bytes not being 0xff.
Correct this by only checking that the ECC aren't 0xff.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index e4e3ceeac38f..546f0807b887 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -2018,6 +2018,7 @@ static int brcmnand_read_by_pio(struct mtd_info *mtd, struct nand_chip *chip,
 static int brcmstb_nand_verify_erased_page(struct mtd_info *mtd,
 		  struct nand_chip *chip, void *buf, u64 addr)
 {
+	struct mtd_oob_region oobecc;
 	int i, sas;
 	void *oob = chip->oob_poi;
 	int bitflips = 0;
@@ -2035,11 +2036,24 @@ static int brcmstb_nand_verify_erased_page(struct mtd_info *mtd,
 	if (ret)
 		return ret;
 
-	for (i = 0; i < chip->ecc.steps; i++, oob += sas) {
+	for (i = 0; i < chip->ecc.steps; i++) {
 		ecc_chunk = buf + chip->ecc.size * i;
-		ret = nand_check_erased_ecc_chunk(ecc_chunk,
-						  chip->ecc.size,
-						  oob, sas, NULL, 0,
+
+		ret = nand_check_erased_ecc_chunk(ecc_chunk, chip->ecc.size,
+						  NULL, 0, NULL, 0,
+						  chip->ecc.strength);
+		if (ret < 0)
+			return ret;
+
+		bitflips = max(bitflips, ret);
+	}
+
+	for (i = 0; mtd->ooblayout->ecc(mtd, i, &oobecc) != -ERANGE; i++)
+	{
+		ret = nand_check_erased_ecc_chunk(NULL, 0,
+						  oob + oobecc.offset,
+						  oobecc.length,
+						  NULL, 0,
 						  chip->ecc.strength);
 		if (ret < 0)
 			return ret;
-- 
2.26.2

