Return-Path: <linux-media+bounces-9122-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 665E68A20C2
	for <lists+linux-media@lfdr.de>; Thu, 11 Apr 2024 23:18:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22C9D286210
	for <lists+linux-media@lfdr.de>; Thu, 11 Apr 2024 21:18:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 980433E470;
	Thu, 11 Apr 2024 21:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Rn5BPnCb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44AE3AC2B
	for <linux-media@vger.kernel.org>; Thu, 11 Apr 2024 21:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712870278; cv=none; b=raN9Ni3wvwbz/VTr3cHOPWmgDw3O7js0HNykSeQ5JynJRky4Mt779g2VKGsMILrheW3nbO+gP9czpD1Nub5B5otZaBPBkV8zsLAQwL0h013f2iClhkCxAEm780xXb68d6RjDb7/8wGw/w5kvHLe0Xf4hfxVJSMa6T6+h0VCUbvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712870278; c=relaxed/simple;
	bh=hqC8XsEkIIDvzCq8ORFwWKB0b/ku6Day+SYeCNMIfRs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y8SzUNJeLCOLZJsQgfLl4ydy3c+vxi9jdcjWMHLrE3WNk4PZ+dlcYVYlxk2MM8Y3SQS2g0w9JKhAFsccD/iGPMKMs97KAM3WELeAGgajrPaCe4ryOuzP9SuIGR9IJFJAz2VmspHV2JIAp62UhbsVNxB7xKjR/KUY9kAk4opw++Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Rn5BPnCb; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5aa25e99414so191539eaf.3
        for <linux-media@vger.kernel.org>; Thu, 11 Apr 2024 14:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712870276; x=1713475076; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lp9xnoohaSw2cIC3dXNX7smv9LqAayoL7R0pHvEFgA4=;
        b=Rn5BPnCbOscHe0u3kHyjlv9o2Jn0Zntz4D2J0C18f0NWorJ6IkhhdenO98E4uDPmyE
         5BVeDPyrYzxNaKqc5SxJFosUHQfpriYOHi5VBC68RrVN/6QLTCHu/PvCG9yXF0wxmU4m
         guXWLU9a5FNuJnEL1g8JRJ2Cfst1eeQ23JXns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712870276; x=1713475076;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lp9xnoohaSw2cIC3dXNX7smv9LqAayoL7R0pHvEFgA4=;
        b=Cauv1jrbc1Y6e7kX5s617B/jBlWoLYWE43Y0LpNPCaFFPOt0I+dbnCiklrRyu9q/51
         PC3ttWESTuMASBdm646TQ7c4NY2sPeyJUkrRMV3LCOu3Se4SA6a8v+S/EiwlN2+/KezE
         GUlH8r2rmzP2XrlkbHZxgx86IYnex2LZRg0atZ6Y6qM7oWc/ixtncWz6mjNVAKjlpQ0U
         iwhUV4/R97a+uHzJoum/U7cQ/boQVReQz8lolSm5ryz3Og2NOPQ0XM9mDFQZVKAW7I5J
         DYEDaHjaoUEBMlbAT0D+frLesdGcCFFvpFXmqpSB++iuEFk/y4nJMk1gFtx6PgmxM4d1
         0cTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWM5eU/p6V4wVHUxYxVKg62yiRsivi6mezLBFeCPtct+YEeYc+N0yiDB6sO/N57Xx4skfpTGu8XvMevwzNURXoKrY2Bj+hffdQs2EY=
X-Gm-Message-State: AOJu0YxumI7PQEiDcxTSAtyZPk+D7LhjkajcnBJMD54C7x90euBEIu0y
	G2KblI9bASD/1EhpHQ37Marub5ArywBo6459StH63ohBp0F1TgHb36yBn5wqiw==
X-Google-Smtp-Source: AGHT+IH3PJPjNl18QWxefWFNkOVbJgNcIMMPhh3UNIigB6AYGmwgvHF3AHr6NydkhiUfqoz4uLkfNA==
X-Received: by 2002:a05:6358:838c:b0:183:7f41:8c10 with SMTP id c12-20020a056358838c00b001837f418c10mr339839rwk.31.1712870275864;
        Thu, 11 Apr 2024 14:17:55 -0700 (PDT)
Received: from denia.c.googlers.com (200.234.86.34.bc.googleusercontent.com. [34.86.234.200])
        by smtp.gmail.com with ESMTPSA id k20-20020ac84794000000b00434d7c4f9fasm1373362qtq.8.2024.04.11.14.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 14:17:55 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 11 Apr 2024 21:17:52 +0000
Subject: [PATCH 3/7] media: saa7134: Use devm_request_irq
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240411-fix-smatch-v1-3-045f92467937@chromium.org>
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

The handled version of request_irq let us remove the free_irq and makes
smatch happier:

drivers/media/pci/saa7134/saa7134-alsa.c:1186 alsa_card_saa7134_create() warn: 'dev->pci->irq' from request_irq() not released on lines: 1186

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/saa7134/saa7134-alsa.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/media/pci/saa7134/saa7134-alsa.c b/drivers/media/pci/saa7134/saa7134-alsa.c
index d3cde05a6ebab..dd2236c5c4a17 100644
--- a/drivers/media/pci/saa7134/saa7134-alsa.c
+++ b/drivers/media/pci/saa7134/saa7134-alsa.c
@@ -1096,9 +1096,6 @@ static void snd_saa7134_free(struct snd_card * card)
 	if (chip->dev->dmasound.priv_data == NULL)
 		return;
 
-	if (chip->irq >= 0)
-		free_irq(chip->irq, &chip->dev->dmasound);
-
 	chip->dev->dmasound.priv_data = NULL;
 
 }
@@ -1147,10 +1144,8 @@ static int alsa_card_saa7134_create(struct saa7134_dev *dev, int devnum)
 	chip->iobase = pci_resource_start(dev->pci, 0);
 
 
-	err = request_irq(dev->pci->irq, saa7134_alsa_irq,
-				IRQF_SHARED, dev->name,
-				(void*) &dev->dmasound);
-
+	err = devm_request_irq(&dev->pci->dev, dev->pci->irq, saa7134_alsa_irq,
+			       IRQF_SHARED, dev->name, &dev->dmasound);
 	if (err < 0) {
 		pr_err("%s: can't get IRQ %d for ALSA\n",
 			dev->name, dev->pci->irq);

-- 
2.44.0.683.g7961c838ac-goog


