Return-Path: <linux-media+bounces-10406-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDA28B6C2B
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 09:51:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF6B9283655
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 07:51:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C6CF3FB87;
	Tue, 30 Apr 2024 07:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Cz1p0bF0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF873F9C2
	for <linux-media@vger.kernel.org>; Tue, 30 Apr 2024 07:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714463494; cv=none; b=LJ2QJyimF9gT3vAZsR2HHNAFy5d1H/PO9CZNqG+uhYXjgWRh+k+9gkR8tXhO/tHqQSW4v4Y0G0zZ+/LZMSjczEOux2liGZ0A+iX55JwpUQoz7O0Rqw3kZVXO/5Eu004tKIUldwhIebSbYaLBlD+B2A9q7lFip8KfIQZXohuLgIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714463494; c=relaxed/simple;
	bh=0jzk6sPYQEC59SApxornkivyRflmoI1pFn43nf2gouQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kDWzbbUYq61N3qbw7DUK/1gtQIEbRMGPl465hrUQ8Ot7SAL5BMhSWl8ARhwMcaao2lmPChJhc9pyWr9mLrNdaRCs3E8ZokrqbmmIQks4lLuZNdRcX7XZwY7KbkeGfdxBmTiy9fuuB8gNLA/I6tCBtQVUFOskj9S/vAX6Z4csXv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Cz1p0bF0; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-43ade9223c0so7755741cf.2
        for <linux-media@vger.kernel.org>; Tue, 30 Apr 2024 00:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714463492; x=1715068292; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R57CjkbkLkl8A/VUwKtkzF9x/otNALa5HeVqDryNHrA=;
        b=Cz1p0bF0cZvCsMjrTIPFVt1HLmBH2HIu0+NPp5S5+5XMPA6hq/jvHGd2sbCx3WW4Cw
         WayJuW+VPXpMjYTkZ8IckXhTb11K5TmkYfrZWHGhGHVrJ751HsA//31qXDOXEoijddfz
         fti++wGjM8MPX4Ysf9zMhlXke1d+6Mr1Urp7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714463492; x=1715068292;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R57CjkbkLkl8A/VUwKtkzF9x/otNALa5HeVqDryNHrA=;
        b=JB+biweenmKpnmTZS2Gz0ilZA54EyRldEkhXAK81kknV7AADYzbK0YTMNZdB/a8SA0
         Of5z/H4VKqSRjjHsYmiYdYHxTNX1FDxYfEi4h1Lv+OnhpH9jJqFtley64s71zAzE8HJi
         9Q/nGx7ffZbztbjsrekBUWwTD+GCCOlPS6mCYHBoYWgtiCubXlHppMPNF7iR5xcaBnTb
         Lfw0N+F4kBoznCy+tnefgqUQ5MCEgWY7DVQDrFLfNultu4ct6aHIhos9NkzYXWxQ0ITq
         xpdozEEtXZ/1vrfr79j3KSpUiWTafrvc31A8sidpE383GroZJgjokv2FYzUIirVWy2xe
         +EGA==
X-Gm-Message-State: AOJu0Yx074piHz4r8GU5LVMwzEnDXtxCZGXTbdIVV5wnxopnV0lPFXmA
	biW2KM2D+qp+LvUvM86F79d/yXC8gZbGCw/3Tc3iKsTDecROiRm99Esqo5bg8g==
X-Google-Smtp-Source: AGHT+IFox+JJPaIDfnbJPXdvKCOIVMCsX59wRzBpWnMawbJcnJD3u85NhlKUJm+Q/1EmXzvmqcrFDg==
X-Received: by 2002:a05:622a:1b86:b0:43b:dd6:82c0 with SMTP id bp6-20020a05622a1b8600b0043b0dd682c0mr3500422qtb.33.1714463492092;
        Tue, 30 Apr 2024 00:51:32 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id z11-20020a05622a124b00b00437b4048972sm10634547qtx.18.2024.04.30.00.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 00:51:31 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 30 Apr 2024 07:51:26 +0000
Subject: [PATCH 1/3] media: bcm2835-unicam: Fix error handling for
 platform_get_irq
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240430-fix-broad-v1-1-cf3b81bf97ff@chromium.org>
References: <20240430-fix-broad-v1-0-cf3b81bf97ff@chromium.org>
In-Reply-To: <20240430-fix-broad-v1-0-cf3b81bf97ff@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Cc: linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Hans Verkuil <hverkuil@xs4all.nl>, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

platform_get_irq() cannot return the value 0.

If it returns -EPROBE_DEFER, we need to populate the error code upwards
to retry probing once the irq handler is ready.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/broadcom/bcm2835-unicam.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
index bd2bbb53070e..2a3a27ac70ba 100644
--- a/drivers/media/platform/broadcom/bcm2835-unicam.c
+++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
@@ -2660,9 +2660,10 @@ static int unicam_probe(struct platform_device *pdev)
 	}
 
 	ret = platform_get_irq(pdev, 0);
-	if (ret <= 0) {
+	if (ret < 0) {
 		dev_err(&pdev->dev, "No IRQ resource\n");
-		ret = -EINVAL;
+		if (ret != -EPROBE_DEFER)
+			ret = -EINVAL;
 		goto err_unicam_put;
 	}
 

-- 
2.44.0.769.g3c40516874-goog


