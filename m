Return-Path: <linux-media+bounces-28243-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A89DA614E9
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 16:31:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B86441B63BEB
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 15:31:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4989920127E;
	Fri, 14 Mar 2025 15:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eXvhkw4S"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E28D2040B6;
	Fri, 14 Mar 2025 15:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741966198; cv=none; b=kjMgUNZEImpt19NSaB13vGTTjpO/nu8GwCC9f+a7I9YqieKxGA0jPde9nBPq2KRIBoKa0b8FQCgxSKVGzS9LzWoTjcejXBaf7exJAXhOZ5KLVFu32gt54haxFYD96gR9LPUf80l0UKpikO0fElgEy02QFuAMCg5K33NIxTLRQqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741966198; c=relaxed/simple;
	bh=8Zs+PBPoC3kb51uPMTZx9kF+EHe8w/CWDSAq9WtTXUc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BlcbPG6FBnRvwgz9Y8kIgoGFKJ1gaDAbtkQSH5kP2kib51rvMY/p8KF/YE+wyPNNXnZ+RlCe6gQ9BtfsKht1WugdoJWVvtN4s9t4CR8zfZzzMfcwYlEnzHhyhJkb7OLas392jJdaCXXoKM8K0LfGOC3iDDHCVAiyC+d+6XFDifU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eXvhkw4S; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30bd11bfec6so22166221fa.0;
        Fri, 14 Mar 2025 08:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741966195; x=1742570995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gZs3N8nD9IyHy2mlq2aBpd6e9l7WhiS0ugLxFyieQjY=;
        b=eXvhkw4SgeNDvAmyEmMmCvEx00b36zPgt9kvQDqOHwFX3J3fGmLqqGz+FrsfvU1ynb
         3hfMNUX48TOUx+XPP9sqxLMtRc2u9QKNv/A1CxmebNFQbEb30U0F6K+BjJMQ1h6B8iO+
         amGx/BQzmhQbWGBEobZvkqC3nAxozJVejnPV9HiyN18+ezXYexGhOqS4Le4HHLH2STLq
         z429LJf34p7XSmCXCfVA281nHNghbmI/LM25n+eP29jSudnJeR/QBXReCXxdJhFqjz6C
         Uu4lNVwB/8KEqOgDxcuv8BKUGx96BlzSqHf13nq34EHnbpEiR4eiNHQsxNetTEOggFoC
         KJ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741966195; x=1742570995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gZs3N8nD9IyHy2mlq2aBpd6e9l7WhiS0ugLxFyieQjY=;
        b=Yvm83LeXrItBah1ISIlwk/RIoeWImAKDn86Xy8IT153THVKYxZnJ8bjvv7N1bCjJbm
         Rog+R0ORXS0CX4QCJ8dx8U91r5Bh4ZzpzM4PR2FnG9BFf2yUx7bYIes3NLgHdIO6x2Ta
         1UEIwvN6CaNNA6BRazSvZ7bS2n+vDPuS+XD60RZkfQ6KiQQSVyghQQ+WsI8ykl9dHmgV
         dQw8A3gVfL7DjXhdgQsJd3G12w7l//EQi6nisJEoGIFNds4KFZaSklUMbAbDHI3aMOfY
         njonvVvSIfiwYMM0rLX8g+K5ummckp2eLJImZk3ijkM0OMLco4psB4RcNoWbCDdXWOFr
         DlFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJc4mHrQxwMCSO6zJblICYJy00mPZVi5sV9Oeu4jctbu6+2U1u/h52tEqNAxOkC9lNMT4ftN51WSGRV98=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTCPYrbvVoRef2PdS1mnQ1cVs19toXxNYj8vjXhr0rM/QPpbJe
	rc5DrdwO7F52XyatQuowU4WPzXLxcJkWqGB3gqKbdyFmjKljCarUnzioy+olkz4=
X-Gm-Gg: ASbGnctUMLLpf9yTL/bKOD0ENFGjTGkAvHDHurQeE97LYf0NioZQZFJJGG/HrO2oDXX
	e2cKJVmAL/ryzobJdLqVHFHEJs9tB3P6Qnhptx1Kx/DE8JRjruOTcSGaZsoeYPXwYAXu8N8s9PT
	0RYBffArcak2Qt/nSCjjWSr4SSRax3qwy8JAjS35nVv5cYOlxVtZX+LiJn4QH06Kku9PjTMHtrM
	9/B2dEhMASHU08l8yRbe0LeTHDjVqFu+WUF5uvtg/X2LTYGycElRXpaGLjFzX4xrVtZhHUa0IM1
	TEr3UbQC1BEiXaWB7DJpuGcxZEy7mIpNu2BqgeHZ3Sbh6x133gBCv6A3kOROblrZO5dE
X-Google-Smtp-Source: AGHT+IE0B79UjQTJCfosyZDkT+YEYMdzxmpO/fO9UDyb4+Y8A0mio3D+ERyuty9yNBHepX0NeVrfZw==
X-Received: by 2002:a05:651c:19ab:b0:30a:448a:467 with SMTP id 38308e7fff4ca-30c4a877e56mr10558261fa.21.1741966194631;
        Fri, 14 Mar 2025 08:29:54 -0700 (PDT)
Received: from skhimich.dev.yadro.com (avpn02.yadro.com. [89.207.88.245])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f0e99f6sm6253581fa.37.2025.03.14.08.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 08:29:54 -0700 (PDT)
From: Sergey Khimich <serghox@gmail.com>
To: linux-media@vger.kernel.org
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org,
	Vladimir Yakovlev <vovchkir@gmail.com>,
	Maksim Turok <turok.m7@gmail.com>
Subject: [PATCH 06/18] media: coda: Add reset device before getting interrupt
Date: Fri, 14 Mar 2025 18:29:27 +0300
Message-Id: <20250314152939.2759573-7-serghox@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250314152939.2759573-1-serghox@gmail.com>
References: <20250314152939.2759573-1-serghox@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vladimir Yakovlev <vovchkir@gmail.com>

Get access to the reset and reset the Coda HW before getting
interrupt because sometimes after hot boot(reboot) irq can remain
from previous session.

Co-developed-by: Sergey Khimich <serghox@gmail.com>
Signed-off-by: Sergey Khimich <serghox@gmail.com>
Signed-off-by: Vladimir Yakovlev <vovchkir@gmail.com>
---
 .../platform/chips-media/coda/coda-common.c      | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/chips-media/coda/coda-common.c b/drivers/media/platform/chips-media/coda/coda-common.c
index b240091cdc9d..33c7e8398f31 100644
--- a/drivers/media/platform/chips-media/coda/coda-common.c
+++ b/drivers/media/platform/chips-media/coda/coda-common.c
@@ -3177,6 +3177,15 @@ static int coda_probe(struct platform_device *pdev)
 	if (IS_ERR(dev->regs_base))
 		return PTR_ERR(dev->regs_base);
 
+	dev->rstc = devm_reset_control_array_get_optional_exclusive(&pdev->dev);
+	if (IS_ERR(dev->rstc)) {
+		ret = PTR_ERR(dev->rstc);
+		dev_err(&pdev->dev, "failed get reset control: %d\n", ret);
+		return ret;
+	}
+
+	reset_control_reset(dev->rstc);
+
 	/* IRQ */
 	irq = platform_get_irq_byname(pdev, "bit");
 	if (irq < 0)
@@ -3209,13 +3218,6 @@ static int coda_probe(struct platform_device *pdev)
 		}
 	}
 
-	dev->rstc = devm_reset_control_array_get_optional_exclusive(&pdev->dev);
-	if (IS_ERR(dev->rstc)) {
-		ret = PTR_ERR(dev->rstc);
-		dev_err(&pdev->dev, "failed get reset control: %d\n", ret);
-		return ret;
-	}
-
 	/* Get IRAM pool from device tree */
 	pool = of_gen_pool_get(np, "iram", 0);
 	if (!pool) {
-- 
2.30.2


