Return-Path: <linux-media+bounces-9120-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 401188A20BE
	for <lists+linux-media@lfdr.de>; Thu, 11 Apr 2024 23:18:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C264AB21DD7
	for <lists+linux-media@lfdr.de>; Thu, 11 Apr 2024 21:18:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4CE83A8FF;
	Thu, 11 Apr 2024 21:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UMJglONx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45122E40D
	for <linux-media@vger.kernel.org>; Thu, 11 Apr 2024 21:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712870276; cv=none; b=LxBUsuhpPAj1xwwXNJ/hYEy/oSqHT/Pu39JMlleNCSCrcM3cHpD79ZM2rs1TV7BlvIo7eu6Qk3qAizo0NpOFX3XN68B0wbVcw8fLOZ4/nGSnFgY2Qo9usGBXSqjpqLc30RtLTplQfcRDpJDGOO2S7eTOjKsfra/nKQdpecDdKlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712870276; c=relaxed/simple;
	bh=ulv1JL7xWZsExyNUt9ao2hlmY9qTFZqMDhceV7YHm44=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kddPEyTyuLQ4sdCqPBxl+Tc8q+6jt0kN9EONJo5GInw+/vPuOvRZgWW5YuLjJz7w6MvZ2W5slycsYwEydEcqtOuirNgFxdxmUOeedfhDxpFRlEtLENO94Q8QhdemXynVo4OAAnfV6tjPUxm71manng4OLiAdG+x79aRxX+Uspyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UMJglONx; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4347dadc2cfso1483011cf.3
        for <linux-media@vger.kernel.org>; Thu, 11 Apr 2024 14:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712870274; x=1713475074; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KJkkcaX8CIYhd9XR8ScMRJRxMuN5zFK8kc96J/lpLIM=;
        b=UMJglONx7J8e4urvd2gDSLQDRIBrZp7O+Vx3DRJ8eoB2BWOQUMOHmxIFdq4iTFbwfv
         cS5iPNta+LHLy3EZNaeVeYip+AHjYoiRqkKkOCdRGrDW1PhV2NrxXdLcAVC1T+UJ7HYL
         iNbFgxps236tOIgf31Fpjm4GAXnR+GN3POcnI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712870274; x=1713475074;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KJkkcaX8CIYhd9XR8ScMRJRxMuN5zFK8kc96J/lpLIM=;
        b=YWqnlfxEcTcMUkpxXUS/lVn7NdSgRzP9wtjHAIhvGmSIOD+N8p50TrzAVjSm+vuHoY
         jZHkD6ZOeij8WneFomLDbhmHKE1r8zJnaFpHTYVvYhRtdENWq2aCnO9Wt45yhkJicngx
         GXja0XTdx6js84FX13llsPGbNmiafmEMw5+IoKIyojsIBlb6Rmq/dIx0kBcvHXuGJCMU
         rozpnlNiHx5QG7DM9rgmIZu9rcqAt3zQfQRM7NZdHIhZlU4vG3PFmDUIlMyL4YqBBpTU
         YVpXkj84Ik+SOyk8XB787GrQPe07nHanLL0Y4gyfnSe/4cnxGSJgWuPtBEcgdw1Y31GD
         GgyA==
X-Forwarded-Encrypted: i=1; AJvYcCWu9bcN6JE0VU9VZxf+VoQ6T7TL0ds1Pyz3YUlO6oEMtL4sqoQQC9100PqwQzStfDbgzAzC+UdI+HApEjPJMv+eCw+hDGZB1i8bO48=
X-Gm-Message-State: AOJu0YwPGPzlrlMmp0nK1Oix0GXAdbFOghfMK780sne/aGpM4swX7dGz
	ZCB8lZ5u+kJ1//jopi42+u41YDmAG4cbWq8HEOF8pzI+J7y2rstQLu0QWJvj5Q==
X-Google-Smtp-Source: AGHT+IFTnqRZcteRINuntinTUGBmdgsxI+3hZuPuD7cseAqS47blu7YOY7bCkvUON9r8YSt9U/Nl/Q==
X-Received: by 2002:a05:622a:107:b0:434:68f6:ae2a with SMTP id u7-20020a05622a010700b0043468f6ae2amr1066381qtw.16.1712870273700;
        Thu, 11 Apr 2024 14:17:53 -0700 (PDT)
Received: from denia.c.googlers.com (200.234.86.34.bc.googleusercontent.com. [34.86.234.200])
        by smtp.gmail.com with ESMTPSA id k20-20020ac84794000000b00434d7c4f9fasm1373362qtq.8.2024.04.11.14.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 14:17:52 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 11 Apr 2024 21:17:50 +0000
Subject: [PATCH 1/7] media: solo6x10: Use pcim functions
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240411-fix-smatch-v1-1-045f92467937@chromium.org>
References: <20240411-fix-smatch-v1-0-045f92467937@chromium.org>
In-Reply-To: <20240411-fix-smatch-v1-0-045f92467937@chromium.org>
To: Bluecherry Maintainers <maintainers@bluecherrydvr.com>, 
 Anton Sviridenko <anton@corp.bluecherry.net>, 
 Andrey Utkin <andrey_utkin@fastmail.com>, 
 Ismael Luceno <ismael@iodev.co.uk>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

Instead of handling manually the release of the memory regions let devm
do that for us.

Makes smatch happy:
drivers/media/pci/solo6x10/solo6x10-core.c:631 solo_pci_probe() warn: 'pdev' from pci_request_regions() not released on lines: 631.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/solo6x10/solo6x10-core.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/media/pci/solo6x10/solo6x10-core.c b/drivers/media/pci/solo6x10/solo6x10-core.c
index 6d87fbb0ee04a..abf30b7609e17 100644
--- a/drivers/media/pci/solo6x10/solo6x10-core.c
+++ b/drivers/media/pci/solo6x10/solo6x10-core.c
@@ -145,10 +145,8 @@ static void free_solo_dev(struct solo_dev *solo_dev)
 		/* Now cleanup the PCI device */
 		solo_irq_off(solo_dev, ~0);
 		free_irq(pdev->irq, solo_dev);
-		pci_iounmap(pdev, solo_dev->reg_base);
 	}
 
-	pci_release_regions(pdev);
 	pci_disable_device(pdev);
 	v4l2_device_unregister(&solo_dev->v4l2_dev);
 	pci_set_drvdata(pdev, NULL);
@@ -480,15 +478,10 @@ static int solo_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	pci_write_config_byte(pdev, 0x40, 0x00);
 	pci_write_config_byte(pdev, 0x41, 0x00);
 
-	ret = pci_request_regions(pdev, SOLO6X10_NAME);
+	ret = pcim_iomap_regions(pdev, BIT(0), SOLO6X10_NAME);
 	if (ret)
 		goto fail_probe;
-
-	solo_dev->reg_base = pci_ioremap_bar(pdev, 0);
-	if (solo_dev->reg_base == NULL) {
-		ret = -ENOMEM;
-		goto fail_probe;
-	}
+	solo_dev->reg_base = pcim_iomap_table(pdev)[0];
 
 	chip_id = solo_reg_read(solo_dev, SOLO_CHIP_OPTION) &
 				SOLO_CHIP_ID_MASK;

-- 
2.44.0.683.g7961c838ac-goog


