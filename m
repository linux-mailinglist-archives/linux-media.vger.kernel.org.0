Return-Path: <linux-media+bounces-26757-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEA1A415CF
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 08:05:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 635A83B647E
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 07:04:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A224424166D;
	Mon, 24 Feb 2025 07:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MrlsSQcZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F99923A9B7
	for <linux-media@vger.kernel.org>; Mon, 24 Feb 2025 07:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740380642; cv=none; b=W9I3RzQodNgl8Uovojg5pb/CjRh8PfxmTi0gZbV1tJJWu6ZUjEa3Dwy6jfQT3QbauFT2Dz2rhwtxmmtT6H+isjXgC68VFBkVfvfC3LiO25qJkbKmuU4dVkDouIDTEJqubuahkHEziSeYwPD9gjr/sGb3WyxeijYxtsz4OZUjJ6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740380642; c=relaxed/simple;
	bh=gxhapjJ2V7VmgaU4ygU27WoYv9liMFZHBLfXA9uaLac=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m5AxCRZd4EtvbUYkAlPSSERuXl1mwu0Za1Ct5rbQxUupzRaDwn/6qapHs4Gg0+yMjYYn/w2ftKvPwLvX3OJj0nFLRx5pdCj8szQQ2Q+hTV/skbQBJyHgaqm+5pFFH1bR2IDPbRYVTH306dN5L8E9PYCQsqNnRAYO59Bi9Kfdxx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MrlsSQcZ; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7c0e135e953so139276085a.2
        for <linux-media@vger.kernel.org>; Sun, 23 Feb 2025 23:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740380639; x=1740985439; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+zNBSiNN48vAuN3f6QiTHcLYM/YjS/mOVk8GlAcAGX0=;
        b=MrlsSQcZYiQPKGDyNH4bQfoY5eUpyg0fJk+ViixTJ8pRRnwQ6hQFWzK1U8yrVIMJ+H
         GUOsysBQGsWM2huhXAikce7Ne33qE9HoH0/7lh6EfNhMdhlp/8VdSpm13T+HevnEOEuB
         T+e5BrS7ntkCVfOY2qhPgK4IjT+TZitoNQV94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740380639; x=1740985439;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+zNBSiNN48vAuN3f6QiTHcLYM/YjS/mOVk8GlAcAGX0=;
        b=hvFvvgV+JMfP5y2fLc9zkw+HsBs3IqEPIWL6bVSrpBJRPPk7c+bf5DoI7AgIK7hPIM
         vuVbp61EfaixGK3hNDvcGInxy9ViadIWOvCk3jQIFzuUnQPKWKzal1WpBSL47mRQr+v3
         UAf9uc3ELloAetAm5W9iMNumCI5WahNVo6e3pJVtfVutrKRuEzS3mh98UW5X5ZgTKaId
         Os6ElrtRFJJHH2AD7teXfi0PgIZkDy4rOED2tdYCuXBXhOC84SH5EPzW6yRqTJQiNO6W
         Uc2qatxM4X/wLTrg0FXwFTCG45FMsVKPOJG0AF3cO4x/s5dJPdXcivagKHq9JsjmXbD0
         c8sQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsjMdU+ua23VpJjt70qoXBt57UPDe6bPH+G+bKPQJo4MaRg+iF+EVf8xM//ZgRmIUt1LFbdcnmznbA/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmblX2MhqktCY03W5cgVkU8baa3cH6YxtqBIBMUYhlKD8l3fIa
	hwuZkyCVkHI0raO21vRXf1XN/96gINZ4ZW8EcrsxetmgF8DeS6sOfBTa0XP1FQ==
X-Gm-Gg: ASbGncuzQSLpHUCyEppEeAzQtTNjwBQKQa7EdfmYe7j8G23IE1DoxjZwKVoPSWPcDeN
	KoiLMbrJ4QCUsLHDHfzR8qvFvxtHHIasIcNjiPccES16pd3cApwvz771kd3gB6a7FMYqqtcKC5I
	DQHrMV+YYg0Q2GZMhg2QD4/ToeFCjjpMgVUJZ2pX8LUN7EKv5PHJdQTIhkaKdBztR/WXeWEBCme
	uCDM48D9sRV9vq3Rsc2qNRGxRhIY6lMrUeHqUnhnPSi2WJ+xK/oLnPjj+kx2s9OnQGYKEztvcd+
	/7tJEvZj1kHlcBvIiB2CFczlwc2wV8/nT/1zxKoAXUsotNMvJ5GjHfJfM/wE6C6B66qnq6fcp9T
	/a7o=
X-Google-Smtp-Source: AGHT+IHcm5l4vj+qLy5nO1kcV2ISxYp1Ig6V5tDSH+3S1QoU9rYnKzcGaZk0NeL01r9155s+2saw4Q==
X-Received: by 2002:a05:620a:488f:b0:7c0:b018:5928 with SMTP id af79cd13be357-7c0cf96eeacmr1637963085a.47.1740380639403;
        Sun, 23 Feb 2025 23:03:59 -0800 (PST)
Received: from denia.c.googlers.com (15.237.245.35.bc.googleusercontent.com. [35.245.237.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c09bf81253sm977920485a.47.2025.02.23.23.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 23:03:58 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 24 Feb 2025 07:03:54 +0000
Subject: [PATCH v2 1/2] media: nuvoton: Fix reference handling of ece_node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250224-nuvoton-v2-1-8faaa606be01@chromium.org>
References: <20250224-nuvoton-v2-0-8faaa606be01@chromium.org>
In-Reply-To: <20250224-nuvoton-v2-0-8faaa606be01@chromium.org>
To: Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Marvin Lin <milkfafa@gmail.com>, linux-media@vger.kernel.org, 
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.1

Make sure all the code paths call of_node_put().

Instead of manually calling of_node_put, use the __free macros/helpers.

Cc: stable@vger.kernel.org
Fixes: 46c15a4ff1f4 ("media: nuvoton: Add driver for NPCM video capture and encoding engine")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/nuvoton/npcm-video.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/nuvoton/npcm-video.c b/drivers/media/platform/nuvoton/npcm-video.c
index 024cd8ee1709..0547f119c38f 100644
--- a/drivers/media/platform/nuvoton/npcm-video.c
+++ b/drivers/media/platform/nuvoton/npcm-video.c
@@ -1648,8 +1648,8 @@ static int npcm_video_setup_video(struct npcm_video *video)
 
 static int npcm_video_ece_init(struct npcm_video *video)
 {
+	struct device_node *ece_node __free(device_node) = NULL;
 	struct device *dev = video->dev;
-	struct device_node *ece_node;
 	struct platform_device *ece_pdev;
 	void __iomem *regs;
 
@@ -1669,7 +1669,6 @@ static int npcm_video_ece_init(struct npcm_video *video)
 			dev_err(dev, "Failed to find ECE device\n");
 			return -ENODEV;
 		}
-		of_node_put(ece_node);
 
 		regs = devm_platform_ioremap_resource(ece_pdev, 0);
 		if (IS_ERR(regs)) {

-- 
2.48.1.601.g30ceb7b040-goog


