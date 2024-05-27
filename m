Return-Path: <linux-media+bounces-12043-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F53A8D1021
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 00:15:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 31A601C21A26
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 22:15:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7169A168C38;
	Mon, 27 May 2024 22:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="frghwIL4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50557168C02
	for <linux-media@vger.kernel.org>; Mon, 27 May 2024 22:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716848096; cv=none; b=eNW3OcqNJ5eVSapzgYz0qfcORl/xHc3P74z7ToLeZLV2RGBIHfBsBkOq8tDZfBpfB/yQWhtpl9u3qMgQ8s/HJoUSiWQ44WgSpBYowA2bKNrNFA+8hIL9IfTrVzWU1EDOlNoEtmu0MOmKyQWdE5IV3EWtDSadHYOfFoWKF47apU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716848096; c=relaxed/simple;
	bh=Fwd5tXA0UQLNv4eb1QzUSIOyA2aHWmaleAdJjHcH7xg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dw/FxTbvhYRf+kC1gR4Bx0XfQwKkOUzMhFSFE2yXXdQo0svDNCcGUssqR4JdbnYxpiEG+aK/cfd+M2R02sr9d6jZK0paPYua+MzByyNVpZNrZ36btONaUTBlXvINuuZk5c+8qIeWqOMK0K+3wOmmOj/rddnEwDBcUEGoltaWFOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=frghwIL4; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-792bdf626beso19078985a.1
        for <linux-media@vger.kernel.org>; Mon, 27 May 2024 15:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716848094; x=1717452894; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mhx0VHnzzMbEOw920oSrnPWneiMuNSd3zSFtO71ho5o=;
        b=frghwIL4k4So7kgynmme9gLrBOr6k9VbBm+47wYd9D4/R7Jx78e0k+m4wCqA1C7+kX
         +eTDHY+Sp0SCVd1S8PB49wy2u+v4mgRFLMWxTdK8SPf3rcpql7btDkvmTOPL2z3QtVtC
         bLtXt99ACdM628soY4Nn0fbO2mepHDOr6xy7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716848094; x=1717452894;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mhx0VHnzzMbEOw920oSrnPWneiMuNSd3zSFtO71ho5o=;
        b=uVesiDoWwjvlKtB8KWyGOc0hhYjvCGOFKkZlEgD9lQt+sjnD8NcIiH41pguu3bCs3A
         QCv+AW8W1xHEnCvooF3IfGnRgOXg2b6WgpJEqjrBo/xp/bALBxlQyPeBHMQ7kmd5yxIs
         pLNdrLsc61JvfGBlgRUSW7cc+mFxkmYy6X2eIi5x/zjSEFTF2OlGCQTTIVBd0QtmIKXU
         qy7fOdeGyO+FJYI8ZAJUQb+yPfB7lcqZkwBEGZndTLh59zSEOsHdGXMPgOyI+uGiLoO6
         OckwkZhKcjrO96I83AJ2p953Oa4sMT2WAESMDt0yNCSeSDgTnqXgxOo1kkaB2V0Nf0Sh
         jA8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWXMdmGz5O4CxnP7dJR20IO6w6P59dDD4ciiObOcWfpbcfHOh7a104e94tRkKQGKaJ0VPaxAW9pbX2qP8VqHxOSzKRoMFbCRauJC2c=
X-Gm-Message-State: AOJu0YzeFtb7CeYjLsWKRJxZpmWWif/KClEyORxNxlVEM/wEAvKOk1SO
	WWIfmGPcccgnRGrJZWbAepHnsi7zULjZ0sPNeID7m8uAn+FuwrqY1dNEx3y5jA==
X-Google-Smtp-Source: AGHT+IFWopuwkIVjiRp+xGrzzsUyD3QL/LbqrRwSBKnqvh3yDmw9hxx+rGn2c2Pdly7jYHbmDeJdtw==
X-Received: by 2002:a05:620a:3906:b0:790:ec77:4c1a with SMTP id af79cd13be357-794a0a568e5mr2414641385a.39.1716848094132;
        Mon, 27 May 2024 15:14:54 -0700 (PDT)
Received: from denia.c.googlers.com (125.135.86.34.bc.googleusercontent.com. [34.86.135.125])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-794abca58e6sm329740885a.18.2024.05.27.15.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 15:14:53 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 27 May 2024 22:14:45 +0000
Subject: [PATCH 1/3] media: pci/ivtv: Replace ioremap with devm_ variants
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240527-devm-itv-v1-1-f5829b8e7674@chromium.org>
References: <20240527-devm-itv-v1-0-f5829b8e7674@chromium.org>
In-Reply-To: <20240527-devm-itv-v1-0-f5829b8e7674@chromium.org>
To: Andy Walls <awalls@md.metrocast.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

With Managed Device Resources the error handling is simpler.

The following smatch warning is silenced:
drivers/media/pci/ivtv/ivtv-driver.c: drivers/media/pci/ivtv/ivtv-driver.c:1296 ivtv_probe() warn: 'itv->dec_mem' from ioremap() not released on lines: 1296.
drivers/media/pci/ivtv/ivtv-driver.c: drivers/media/pci/ivtv/ivtv-driver.c:1296 ivtv_probe() warn: 'itv->enc_mem' from ioremap() not released on lines: 1296.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/ivtv/ivtv-driver.c | 51 +++++++++---------------------------
 1 file changed, 12 insertions(+), 39 deletions(-)

diff --git a/drivers/media/pci/ivtv/ivtv-driver.c b/drivers/media/pci/ivtv/ivtv-driver.c
index ba503d820e48..7599fffb0c9d 100644
--- a/drivers/media/pci/ivtv/ivtv-driver.c
+++ b/drivers/media/pci/ivtv/ivtv-driver.c
@@ -371,33 +371,6 @@ int ivtv_msleep_timeout(unsigned int msecs, int intr)
 	return 0;
 }
 
-/* Release ioremapped memory */
-static void ivtv_iounmap(struct ivtv *itv)
-{
-	if (itv == NULL)
-		return;
-
-	/* Release registers memory */
-	if (itv->reg_mem != NULL) {
-		IVTV_DEBUG_INFO("releasing reg_mem\n");
-		iounmap(itv->reg_mem);
-		itv->reg_mem = NULL;
-	}
-	/* Release io memory */
-	if (itv->has_cx23415 && itv->dec_mem != NULL) {
-		IVTV_DEBUG_INFO("releasing dec_mem\n");
-		iounmap(itv->dec_mem);
-	}
-	itv->dec_mem = NULL;
-
-	/* Release io memory */
-	if (itv->enc_mem != NULL) {
-		IVTV_DEBUG_INFO("releasing enc_mem\n");
-		iounmap(itv->enc_mem);
-		itv->enc_mem = NULL;
-	}
-}
-
 /* Hauppauge card? get values from tveeprom */
 void ivtv_read_eeprom(struct ivtv *itv, struct tveeprom *tv)
 {
@@ -1041,8 +1014,9 @@ static int ivtv_probe(struct pci_dev *pdev, const struct pci_device_id *pci_id)
 	/* map io memory */
 	IVTV_DEBUG_INFO("attempting ioremap at 0x%llx len 0x%08x\n",
 		   (u64)itv->base_addr + IVTV_ENCODER_OFFSET, IVTV_ENCODER_SIZE);
-	itv->enc_mem = ioremap(itv->base_addr + IVTV_ENCODER_OFFSET,
-				       IVTV_ENCODER_SIZE);
+	itv->enc_mem = devm_ioremap(&pdev->dev,
+				    itv->base_addr + IVTV_ENCODER_OFFSET,
+				    IVTV_ENCODER_SIZE);
 	if (!itv->enc_mem) {
 		IVTV_ERR("ioremap failed. Can't get a window into CX23415/6 encoder memory\n");
 		IVTV_ERR("Each capture card with a CX23415/6 needs 8 MB of vmalloc address space for this window\n");
@@ -1055,8 +1029,9 @@ static int ivtv_probe(struct pci_dev *pdev, const struct pci_device_id *pci_id)
 	if (itv->has_cx23415) {
 		IVTV_DEBUG_INFO("attempting ioremap at 0x%llx len 0x%08x\n",
 				(u64)itv->base_addr + IVTV_DECODER_OFFSET, IVTV_DECODER_SIZE);
-		itv->dec_mem = ioremap(itv->base_addr + IVTV_DECODER_OFFSET,
-				IVTV_DECODER_SIZE);
+		itv->dec_mem = devm_ioremap(&pdev->dev,
+					    itv->base_addr + IVTV_DECODER_OFFSET,
+					    IVTV_DECODER_SIZE);
 		if (!itv->dec_mem) {
 			IVTV_ERR("ioremap failed. Can't get a window into CX23415 decoder memory\n");
 			IVTV_ERR("Each capture card with a CX23415 needs 8 MB of vmalloc address space for this window\n");
@@ -1073,26 +1048,27 @@ static int ivtv_probe(struct pci_dev *pdev, const struct pci_device_id *pci_id)
 	/* map registers memory */
 	IVTV_DEBUG_INFO("attempting ioremap at 0x%llx len 0x%08x\n",
 		   (u64)itv->base_addr + IVTV_REG_OFFSET, IVTV_REG_SIZE);
-	itv->reg_mem =
-	    ioremap(itv->base_addr + IVTV_REG_OFFSET, IVTV_REG_SIZE);
+	itv->reg_mem = devm_ioremap(&pdev->dev,
+				    itv->base_addr + IVTV_REG_OFFSET,
+				    IVTV_REG_SIZE);
 	if (!itv->reg_mem) {
 		IVTV_ERR("ioremap failed. Can't get a window into CX23415/6 register space\n");
 		IVTV_ERR("Each capture card with a CX23415/6 needs 64 kB of vmalloc address space for this window\n");
 		IVTV_ERR("Check the output of 'grep Vmalloc /proc/meminfo'\n");
 		IVTV_ERR("Use the vmalloc= kernel command line option to set VmallocTotal to a larger value\n");
 		retval = -ENOMEM;
-		goto free_io;
+		goto free_mem;
 	}
 
 	retval = ivtv_gpio_init(itv);
 	if (retval)
-		goto free_io;
+		goto free_mem;
 
 	/* active i2c  */
 	IVTV_DEBUG_INFO("activating i2c...\n");
 	if (init_ivtv_i2c(itv)) {
 		IVTV_ERR("Could not initialize i2c\n");
-		goto free_io;
+		goto free_mem;
 	}
 
 	if (itv->card->hw_all & IVTV_HW_TVEEPROM) {
@@ -1277,8 +1253,6 @@ static int ivtv_probe(struct pci_dev *pdev, const struct pci_device_id *pci_id)
 free_i2c:
 	v4l2_ctrl_handler_free(&itv->cxhdl.hdl);
 	exit_ivtv_i2c(itv);
-free_io:
-	ivtv_iounmap(itv);
 free_mem:
 	release_mem_region(itv->base_addr, IVTV_ENCODER_SIZE);
 	release_mem_region(itv->base_addr + IVTV_REG_OFFSET, IVTV_REG_SIZE);
@@ -1439,7 +1413,6 @@ static void ivtv_remove(struct pci_dev *pdev)
 	exit_ivtv_i2c(itv);
 
 	free_irq(itv->pdev->irq, (void *)itv);
-	ivtv_iounmap(itv);
 
 	release_mem_region(itv->base_addr, IVTV_ENCODER_SIZE);
 	release_mem_region(itv->base_addr + IVTV_REG_OFFSET, IVTV_REG_SIZE);

-- 
2.45.1.288.g0e0cd299f1-goog


