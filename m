Return-Path: <linux-media+bounces-9436-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 121F58A5AFA
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 21:41:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 42F591C20F4B
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 19:41:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A238915E5DA;
	Mon, 15 Apr 2024 19:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YKYOL459"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E41915E7F7
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 19:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713209690; cv=none; b=JGQABNiP+W3yBYrdKo3UGjm+vIj40wKPLEjgSsB+VnhnVhL08HWrzkoG38hrztI2+V4fJIaf1AdMr6WYO2toEgKtIKyM7Vjr5Y4J8MXvMxubooIqlzppSH94QfspJmWZjZuvPmJ+p4mJpRIUshXf/w+WnRO+zI8/7GSdQT7rI5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713209690; c=relaxed/simple;
	bh=CPsjhfr0ipRuyWvLekJtBUPBvfW5sC455CD/yQi18EY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J76xp/xctTtOeg3wzIO29Tvbfx4ep9CI1KWzn8jx5OJzkWg2kDo6euvK61Tth749LCZLmgZ1OC4jUPHkzzPyldOlMUObRW97w1uA3i88jOTq+SodgE6QNX8QVe3ruoWrA3OnwNgAyXaz6wk+xkCy7eWUD3PzB3arUglWOFuIH44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YKYOL459; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-61816fc256dso31275857b3.0
        for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 12:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713209688; x=1713814488; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VYb6g5i4FA16yMs6Dul0lviXONeB+8pR0V9zyRVb51o=;
        b=YKYOL459xPZhH4tkkQ7nCmxndqC2eNMd7Xk9q21LWkDq6nsrYiHPN1zik0CqpeEEsI
         pqlmtl6EueL36+N47JvXqAIhYaNM8evVxHhcSE6m6rQE9M/e9784zeouG/C1/Rlqr5LS
         9nbuIa+oZkVT/qEJiUDrSI5XxG8wOpUGZT0/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713209688; x=1713814488;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VYb6g5i4FA16yMs6Dul0lviXONeB+8pR0V9zyRVb51o=;
        b=hP6AqezGG2NNvS2WRPSvWd7xPmDaXvrAnXKZtLCdVCZDp4ErZAa4LBvDRn38f+cQzA
         uRdp666shE8GfX3kdbCo8hF3Nzq2DHXdDGydDG0Vh76WRrZJOj50wixV7rcpfDAqdwYv
         rfeh/AT1wpFfHf58wF07GiF6eFrolrRPA3FzW6BD6YC2AwjSwl0bRDyBLcAqY8ub+0FO
         9jooL02K/Qq6O+Ghta/PsxY8nyZH5m+3jIYiAUMRf8tBTr1kgehfxXAhBzNxsosNTlSr
         37DtHIuG6QpYQzp1VPwrK2tn1vK+ONaBL2E9qDIscRVx4Y9PAw64FuIPBaXX5U5kuaCg
         gQ5Q==
X-Gm-Message-State: AOJu0Yx+TIgvEzJq8e35Ps6Vbo6s2Ch+F/J6wQfObb8aTLEamO4oJWVH
	fz/yleDD3zkCK7zWKNJZ1nEKO+n0WGgElyE8I7g6UlhXbP6tqiPd28W2E8sR2A==
X-Google-Smtp-Source: AGHT+IHXF7TrtarHgpunekvNDs6nvd1JJs+Lc0bh8dwb/yJrFpFk4KNuzD4FvIVwGteAAQA7ZBlIRw==
X-Received: by 2002:a0d:cd01:0:b0:618:875e:2bc1 with SMTP id p1-20020a0dcd01000000b00618875e2bc1mr8806798ywd.21.1713209686523;
        Mon, 15 Apr 2024 12:34:46 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:34:46 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:33 +0000
Subject: [PATCH 16/35] media: au0828: Use min macro
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-fix-cocci-v1-16-477afb23728b@chromium.org>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
In-Reply-To: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
To: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
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
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Pavel Machek <pavel@ucw.cz>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

Simplifies the code.

Found by cocci:
drivers/media/usb/au0828/au0828-video.c:605:11-12: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/au0828/au0828-video.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/usb/au0828/au0828-video.c b/drivers/media/usb/au0828/au0828-video.c
index fd9fc43d47e0..2ec49ea479d5 100644
--- a/drivers/media/usb/au0828/au0828-video.c
+++ b/drivers/media/usb/au0828/au0828-video.c
@@ -602,10 +602,7 @@ static inline int au0828_isoc_copy(struct au0828_dev *dev, struct urb *urb)
 		vbi_field_size = dev->vbi_width * dev->vbi_height * 2;
 		if (dev->vbi_read < vbi_field_size) {
 			remain  = vbi_field_size - dev->vbi_read;
-			if (len < remain)
-				lencopy = len;
-			else
-				lencopy = remain;
+			lencopy = umin(len, remain);
 
 			if (vbi_buf != NULL)
 				au0828_copy_vbi(dev, vbi_dma_q, vbi_buf, p,

-- 
2.44.0.683.g7961c838ac-goog


