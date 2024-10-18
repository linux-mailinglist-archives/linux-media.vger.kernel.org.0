Return-Path: <linux-media+bounces-19885-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C629A4114
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 16:25:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A32A31C2131C
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 14:25:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAE261DFDB2;
	Fri, 18 Oct 2024 14:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="E5fpE67A"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE1618E351
	for <linux-media@vger.kernel.org>; Fri, 18 Oct 2024 14:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729261505; cv=none; b=XFZj8gf5j8W68dGU1gWrYG4uGYZ3CCZ9LXUfO8qIfqPZe7jTcrNNqe+9gnLwAWxu/p7sXMuLPY70hKe3MBnrXffmSbt2T2shbI8GEMSi3c/ULubMEP3RjvhK/01OzziJMLvaX1VKyiKZs8M+CpvAOKxjq55SyYXldQKx0YdLJEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729261505; c=relaxed/simple;
	bh=1vHVy9hi6vUA/eK5T3wKQkLm+Sb95+8JoCyrN4xYjKc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ba2Nh404UP2cNvoNiMenJWel3je6kV2qamKf0tJLOGMkFalN9azLZ2LwUUfMfmyeUxzYBsafDMRORZ1/ZOxfByc+x+Xw1LNUUhk3W310PcQH0uQZTsfgC2dQBb/ToIPbIz3FFINM5/6UVvTvSaYI4mLBlH66PSN9tGoKwc+yf5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=E5fpE67A; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-460ab1bc2aeso8533751cf.3
        for <linux-media@vger.kernel.org>; Fri, 18 Oct 2024 07:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729261502; x=1729866302; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U2B9vhc2SFVP3CT/mLHkci3az6bQEYsfmzgWk2Lo2Lw=;
        b=E5fpE67AXktyruaNcDrekfDEGylGoVcwrTrReRM/dokcLy3OlRHCE9nGcuZ0yWks2P
         JZqiVNTmHLU7pdtd0KosW7/ueKM/4zGYKPWHHhdqsae0x+LAJUYJyF8R3p/actxxO5Bj
         rMlc524RETM4vfegEuARABOJRStacZEHZRR7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729261502; x=1729866302;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U2B9vhc2SFVP3CT/mLHkci3az6bQEYsfmzgWk2Lo2Lw=;
        b=W7oBhMfIQkRhEaiNZqy5qtHGDhbZENNloQPSTxagNWm3InAkjSZ9GOEhGZCuPe8NeJ
         W+lLsghrOzqbWM3tCegQl94K9jKZFk8jxphEURqpFoQS1l8kYOpWkkRVjjkVy3aKgKMi
         o0LkyES/+Zgs2L5F3cQaQAfJBpS2Tggu6zJSTMjgF3vWl/pFKjBciBWyNYL2VW1K57sK
         rAwEC/Kn62xoydDlEFJJGHTeGwNg5eRl+G4oK8RzWLLoSi3cFxxtluEYGFuHMu43+FYv
         buN38NVZ9BKYUCQtv44esp1okT6eQaba1kUBR4LVhNALxy+Nl6599llVbdcqFhc5BhEW
         RJCQ==
X-Gm-Message-State: AOJu0YzhILhxhIrnPhGVpqGR0ncD3uhU60WRqX7/refCNBaR7FZAKhOj
	DdzUb9DO65LNPDgx9TZwnQGHelplHl4p7jX2cpGzaDLwkhtB/sSb/agZKDJGFA==
X-Google-Smtp-Source: AGHT+IHDGxra/LweNKvZFVWUD4hpitjKLmeEVaZjlfP7UeY0EwsgTk0wfCZVTGsM8eLhvrIywbSFWA==
X-Received: by 2002:a05:622a:1790:b0:460:9cb8:9d84 with SMTP id d75a77b69052e-460aed5934fmr40485081cf.24.1729261501759;
        Fri, 18 Oct 2024 07:25:01 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-460aea455f9sm7596101cf.64.2024.10.18.07.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 07:25:01 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 18 Oct 2024 14:24:59 +0000
Subject: [PATCH] media: raspberrypi: Remove redundant "no IRQ" message
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241018-rpi-irq-cocci-v1-1-b597595e98e4@chromium.org>
X-B4-Tracking: v=1; b=H4sIALpvEmcC/x3MQQqAIBBA0avErBtQEZKuEi1kmmo2WiNEIN49a
 fkW/1corMIF5qGC8iNFcuqw4wB0xnQwytYNzjhvjQ2ol6DojZSJBMMU2MfgODqC3lzKu7z/b1l
 b+wArjufeXwAAAA==
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

platform_get_irq() already provides a error message.

This fixes the following cocci error:
drivers/media/platform/raspberrypi/rp1-cfe/cfe.c:2326:2-9: line 2326 is redundant because platform_get_irq() already prints an error

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/raspberrypi/rp1-cfe/cfe.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
index 045910de6c57..4e99cccd9a20 100644
--- a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
+++ b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
@@ -2323,7 +2323,6 @@ static int cfe_probe(struct platform_device *pdev)
 
 	ret = platform_get_irq(pdev, 0);
 	if (ret <= 0) {
-		dev_err(&pdev->dev, "No IRQ resource\n");
 		ret = -EINVAL;
 		goto err_cfe_put;
 	}

---
base-commit: 698b6e3163bafd61e1b7d13572e2c42974ac85ec
change-id: 20241018-rpi-irq-cocci-878e4a82ea2c

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


