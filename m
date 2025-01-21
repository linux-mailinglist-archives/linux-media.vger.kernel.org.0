Return-Path: <linux-media+bounces-25074-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75632A18732
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2025 22:18:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FCB23AC201
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2025 21:17:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 868081F9F7D;
	Tue, 21 Jan 2025 21:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AV9z6Ioo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4FE1F8F1C
	for <linux-media@vger.kernel.org>; Tue, 21 Jan 2025 21:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737494102; cv=none; b=MzQNtZXt1rALydoQQ7r9qYvWdotv+ZF3wM1CO8Ir+uynSxKmYF4rne7HKTi7wbB7a/LlCWl2p06lq+ItYLgFp5J9WMBowX4Pyf/TVBHXkwRrzUnGNU70hn3dLFSWfyDWZxh0RGaG0KTWUdJF6pClHd8j+tm+6dxACMKKa2nVh9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737494102; c=relaxed/simple;
	bh=tTQ8/1UIysiIGtRN5N7AVFPeTUIFvnP7hdQDtHKur8k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DCKc3ZSqfRRwDx98r6iqBX/AZtwTo5oS6hjgshV3R4BUPvQ72Cjc15NaZaB2Ydt6DF4HjWZNjEGv188fmXEYcsYh5ffkAmTE3lXzzjFqFw2PKJs+DEUhWxksIx8XeBnCD4crX35gPUYSP7qfgQl/NBnOOLkcGiNhF+/21XJbYrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AV9z6Ioo; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-467918c360aso66734241cf.0
        for <linux-media@vger.kernel.org>; Tue, 21 Jan 2025 13:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1737494100; x=1738098900; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EDypBRxJvQaUqQoINiNHn6E1UtSb53KvENj6pqF6igs=;
        b=AV9z6IooxOHEPYoslE/9nMiJz3HRP3EGcoVDBq5TMRSuYhu3pHbzSkHLKYoN3wiJBr
         OU1fXlSWSmvmuxknEjz8MFZFHMi7jrlbxFeV0yu++h41eWj/3WYvgpUXy1yzDLhDIXas
         ym7VYm+DLeHpCMsWxN+nHq9+FAsO05kaSuEUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737494100; x=1738098900;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EDypBRxJvQaUqQoINiNHn6E1UtSb53KvENj6pqF6igs=;
        b=xTGZby22PkDWkUcu5t2o9UkRFLXT+3Enol/NIqC5yvT2qNXsb4vXLZg7HNQgllNQIQ
         d69sIHoSNo+8U1yxuuJdkXgfhJRTw28hEvL+ywAxSazlPC2BQftc5DXlC+IZRHS5IiqD
         6HwNDrnFeID3+yMlifUlr6IU0Qb+F2cCvVbpTNOlLgjkRbRDn+8yvn9VuZATgurfxn6c
         7sHRNkiAsXq3FgOBDJicTql6tQKT6OqI/hiVIyjDO0A3yvyTjncLnrm29kN6iRzqbm5v
         6LQpn1q2fq273kNY70do1JwZzrxkHYEJuLVIX6S37thy7x+jocRLLbnBdeshUuKCd8XU
         GuXw==
X-Forwarded-Encrypted: i=1; AJvYcCUDRGipPKz7DVgCmfbQ/X8ykU75q1NopDvIrxcTf3z4BSQLHoGJ21UJH357OnqGe5cl/umYtCmk5gdzbg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyuOLglsSMyAmbbATPquWd5yfX66Qzy1qwZIMzblBg855iWCWFq
	bEp4r5+JB8sXwVRIgm6EvHJ4AcIlNZzRQRf9XZUybCDfS4bLpVw2hh6zZjYtEQ==
X-Gm-Gg: ASbGncsx80XxVRVPLe5h4EkGnY+9XpbBND+dWxusP8Xvgwyl4nvVZ056Vzjwu8IJ5ET
	iS52b76mTE+eqpNKczF2tmH1VW6KgGm31HFgeVMbW51hgbUAZAaCriixBlRusbGPHwkOUgtQHH2
	HR217VAAZaRBwPGWA9f2I6mWoMTfFR4OK3MovwWG845iQeI0nsMflfmbk09s9Ew+uyBfFY0OfzO
	kAn+Y6Tqt4/DMbpPZLKyWdeu7BZSEC1hN68ggwkr55Hejmiq55kkATH5pHh9+Veu+YBjHaWVXYx
	6GWWt7wIp6xl1oZfKSD5t+RS6snJ1Qb3+eTek9SD4vEzf4Em9A==
X-Google-Smtp-Source: AGHT+IH2nW3HKiyhk/ib7bj/aH6TJVLtiNxwx87MHvq1Ur/SwGzlc6RDNTd7PprtRI9dniJmJVuT3A==
X-Received: by 2002:ad4:5d6a:0:b0:6d4:215d:91c3 with SMTP id 6a1803df08f44-6e1b220e572mr291236936d6.28.1737494100024;
        Tue, 21 Jan 2025 13:15:00 -0800 (PST)
Received: from denia.c.googlers.com (172.174.245.35.bc.googleusercontent.com. [35.245.174.172])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e1afc28f84sm54790186d6.63.2025.01.21.13.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 13:14:59 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 21 Jan 2025 21:14:52 +0000
Subject: [PATCH 3/4] media: nuvoton: Use cleanup.h macros for device_node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250121-nuvoton-v1-3-1ea4f0cdbda2@chromium.org>
References: <20250121-nuvoton-v1-0-1ea4f0cdbda2@chromium.org>
In-Reply-To: <20250121-nuvoton-v1-0-1ea4f0cdbda2@chromium.org>
To: Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Marvin Lin <milkfafa@gmail.com>, linux-media@vger.kernel.org, 
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

Instead of manually calling of_node_put, use the __free macros/helpers.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/nuvoton/npcm-video.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/platform/nuvoton/npcm-video.c b/drivers/media/platform/nuvoton/npcm-video.c
index f6cba17a7924..8e69fa14433a 100644
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
 
@@ -1665,7 +1665,6 @@ static int npcm_video_ece_init(struct npcm_video *video)
 		dev_info(dev, "Support HEXTILE pixel format\n");
 
 		ece_pdev = of_find_device_by_node(ece_node);
-		of_node_put(ece_node);
 		if (!ece_pdev) {
 			dev_err(dev, "Failed to find ECE device\n");
 			return -ENODEV;
@@ -1692,8 +1691,6 @@ static int npcm_video_ece_init(struct npcm_video *video)
 			dev_err(dev, "Failed to get ECE reset control in DTS\n");
 			return PTR_ERR(video->ece.reset);
 		}
-	} else {
-		of_node_put(ece_node);
 	}
 
 	return 0;

-- 
2.48.0.rc2.279.g1de40edade-goog


