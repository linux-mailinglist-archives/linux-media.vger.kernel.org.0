Return-Path: <linux-media+bounces-9738-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBA98AABF4
	for <lists+linux-media@lfdr.de>; Fri, 19 Apr 2024 11:51:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C91491F22151
	for <lists+linux-media@lfdr.de>; Fri, 19 Apr 2024 09:51:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF9BE7C6D4;
	Fri, 19 Apr 2024 09:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JRKywdq7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254A17FBB9
	for <linux-media@vger.kernel.org>; Fri, 19 Apr 2024 09:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713520169; cv=none; b=PTHC+dOkYHKiSdoBLJcfWiJg1cXMO/YjYFXRrs5zMvEGNPq5GalKG1i42uKdPM4Xp4G2fgEV8C8t9mqExYEMTH8drKtWz4zUco/QdlSKGn/DNC45Jm06TinklYEo2qSaDw9k7Z5GpJMV00iVpQ2HmeLZPu/Fv7aMulJrQ94zlx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713520169; c=relaxed/simple;
	bh=RuxkwHpE4T4+RDbLbxVJFmdg2Ym7s4wlcnprbuxc08U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K+UmffWyb2DOuMQuhGVdorpbw/kmqhqk4fLTXe0ArMqju2nfWrYqDL9Ka24FkxaCOZEHECosj2W6Vzv0WYpKMCyYfARV0Lee0dldtTuaAnw+2KZnA8hDhbnB6PF+W+IIvljCdNUjhjCDSBsje/YEW9orqX1KRxSShs+L1bl6M9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JRKywdq7; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-78ebc7e1586so279933885a.1
        for <linux-media@vger.kernel.org>; Fri, 19 Apr 2024 02:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713520167; x=1714124967; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LtYl9w0rOEhkj26cvWhCGa7iaXgSAClc12fCrbixCRY=;
        b=JRKywdq7DzysSXFI7V2I7JJrLuiZesSiHSA3gjLktvZIiKo42ctcyf4xq+6s7JDwKP
         buvUd6z7FBGsRGgmIG4h0LJlukks1duyv+EeCZXErvV/ygzkxyznu9edQFMSZpyY5dhz
         uJmtRb1BQihl89Vct1lKVeoOmnotilqpT9GNI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713520167; x=1714124967;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LtYl9w0rOEhkj26cvWhCGa7iaXgSAClc12fCrbixCRY=;
        b=Qc/uLOCA5IK8S2oprO+in7SUUDLDzq5fDE17LDyG0/fTqcJ8Iias4lLbV3XB7d0SDW
         aIGh7s6xM0wSDIRwiEreVEKIm8dREAaVJbP9OzB7S/ayvnJsrS60RCIYuQLDM4yU7u7A
         1LuI8yWU0GCT7LJQSQeFzm4Tss5X+PkhgwydpxVnd4VDRyyaiMVVUE3FiKCC81x7v9uI
         esu2PYs/NmevgTu3WnxEWWCJUAQVw4CCzBCQh3cbBv06xey7k7BXXxNEBnKahHPMZkBG
         9sZcTOAYZIzMh1NgsjP/w9J0+UU3Hob5sCCDZJQHtM1gJ2NZzA3Eb2sBhzra/TcU3KVg
         l7lw==
X-Gm-Message-State: AOJu0YwokxxqvdJUJ6Vyqcnxmpaxc07/lddTkuNy8G+A3QbjVTK/0Fby
	nkD98JJvdlrpyxS9vwaxW47tvKmBemGSet5RZOEx6T0WgIS6o50KJXCHXoDOcA==
X-Google-Smtp-Source: AGHT+IHJxWxlXkvVgayg/8KmEPlEYrjGm6s2oAW8VlNrxH8CHO+X8RZjNxTD6ZWD86mZ22X+MElfTw==
X-Received: by 2002:a37:de0e:0:b0:78e:eb64:d91 with SMTP id h14-20020a37de0e000000b0078eeb640d91mr2763665qkj.1.1713520167230;
        Fri, 19 Apr 2024 02:49:27 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id dt14-20020a05620a478e00b0078d735ca917sm1434532qkb.123.2024.04.19.02.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 02:49:26 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 19 Apr 2024 09:47:52 +0000
Subject: [PATCH v2 06/26] media: stm32-dcmipp: Remove redundant printk
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240419-fix-cocci-v2-6-2119e692309c@chromium.org>
References: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
In-Reply-To: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
To: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hugues Fruchet <hugues.fruchet@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>, 
 Abylay Ospan <aospan@netup.ru>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Dmitry Osipenko <digetx@gmail.com>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

platform_get_irq() already prints an error message.

Found by cocci:
drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c:444:3-10: line 444 is redundant because platform_get_irq() already prints an error

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
index bce821eb71ce..4acc3b90d03a 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
@@ -439,11 +439,8 @@ static int dcmipp_probe(struct platform_device *pdev)
 				     "Could not get reset control\n");
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq <= 0) {
-		if (irq != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "Could not get irq\n");
-		return irq ? irq : -ENXIO;
-	}
+	if (irq < 0)
+		return irq;
 
 	dcmipp->regs = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
 	if (IS_ERR(dcmipp->regs)) {

-- 
2.44.0.769.g3c40516874-goog


