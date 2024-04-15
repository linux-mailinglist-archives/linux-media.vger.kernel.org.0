Return-Path: <linux-media+bounces-9439-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D2C8A5B0B
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 21:42:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97143282C76
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 19:42:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25B4615FD04;
	Mon, 15 Apr 2024 19:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MJiBhinO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F5415F3FD
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 19:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713209694; cv=none; b=rQWnQB6fq9vAOib8sZMbf72/mBoYk5t6AXrMZ4upYsODF+A9EjfjAoS/+TUAJ7gPT3jFb1aWQiTSAh9cRQHgKuRZAuOR4da7pxSxVEdYtOwBvv1jJv93DRqlqjFUWNadScd6a/MlzJGpcxYyDK6ZnKyTcytgDYAkKg0HWIMDJoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713209694; c=relaxed/simple;
	bh=YPNZ8kVmJqYj3aJ9reXbJjAI4Lm1Fxh7hl3qKl9KMYI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EONq/TxwdSv6MwMyj1E/MYoxE2AozKN4I2Lbo1+A2hobHkM4PD4BbGpJdHHYSYLAWkLSnq39nbh4d5x7vytsdHgGHVXmMTcqVI58+4HpDwuzk6j9smbiYE7at5nsnz+Y8i62cJTxWC8soP5NcU8bNDFZybaPNRJ0P/ugYViiyP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MJiBhinO; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6eb8ae9b14eso369874a34.0
        for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 12:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713209691; x=1713814491; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9xYCSct9boZ0BOkqN2tXVepjBV7/8cHg/+IKo1joAc4=;
        b=MJiBhinOMK2NZCgzlz6n0eNszbWFRpS03Z6pXSqvk7JjSeYnh1YimSwJGxNaXUX+yz
         yx2Id+jmGGymvL86cZy5tgxObAQ3+SIR6hOa7p1wBzpLlJGsP5lUtT1l0gNUGp7p60ti
         PXoM25H2GTZY2jUFVE6RGlJ9QbmnE8Xi+hrUM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713209691; x=1713814491;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9xYCSct9boZ0BOkqN2tXVepjBV7/8cHg/+IKo1joAc4=;
        b=KS013qWUxUwbbShmcUAA7555PsgDBi4TAURHS/FTasc5nbb9QuO2vYNM/u15eejtGx
         f8vHYiyAFrHYMyx7ERxVvZBXK0u6V2LFVsczgfzkbReVzzWbSIliGNtn6KY/Vj3U7qmC
         wbBRX3zgeRVvrP5KF9zINZHVaCqNmTusl5pumUq22AuAq8LyxVPIUVtU2Ep5hiICdnZD
         B2lywG2nxDbH2NWfMVarkysjKL+fbnQFjJ9ChQQpr1aGIuoonsce53VsB8UULggEPo/B
         F+JiPw/m5+KqIJip7BKXZ17HCu62we2xOCvdlzMlge0ZJ+1j7xQHMEPinKANbsmeTEHp
         SA2Q==
X-Gm-Message-State: AOJu0YxoyjsjNde1i89+k++Pop1E5pU8ZDizQmPntMkAJEmZjkAc0tBk
	RZ/YCkORZvn36lGutGgLmHkaktaF2yy0rHXTvO6nEj9d1OATbglsPRi9Kw2VCw==
X-Google-Smtp-Source: AGHT+IH6vSvyyYYzExFejV09di7HyPhtKMxRA7xlKo8y+g1ouireMhE+BqwQkFqVSegum+jG+Rz+Iw==
X-Received: by 2002:a9d:6ac8:0:b0:6eb:75b6:4245 with SMTP id m8-20020a9d6ac8000000b006eb75b64245mr6116943otq.15.1713209691286;
        Mon, 15 Apr 2024 12:34:51 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:34:50 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:37 +0000
Subject: [PATCH 20/35] media: tegra-vde: Refactor timeout handling
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-fix-cocci-v1-20-477afb23728b@chromium.org>
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

Reorder the branches a bit, so cocci stops complaining about the code.

drivers/media/platform/nvidia/tegra-vde/h264.c:645:20-21: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/nvidia/tegra-vde/h264.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/nvidia/tegra-vde/h264.c b/drivers/media/platform/nvidia/tegra-vde/h264.c
index 204e474d57f7..cfea5572a1b8 100644
--- a/drivers/media/platform/nvidia/tegra-vde/h264.c
+++ b/drivers/media/platform/nvidia/tegra-vde/h264.c
@@ -633,7 +633,9 @@ static int tegra_vde_decode_end(struct tegra_vde *vde)
 
 	timeout = wait_for_completion_interruptible_timeout(
 			&vde->decode_completion, msecs_to_jiffies(1000));
-	if (timeout == 0) {
+	if (timeout < 0) {
+		ret = timeout;
+	} else if (timeout == 0) {
 		bsev_ptr = tegra_vde_readl(vde, vde->bsev, 0x10);
 		macroblocks_nb = tegra_vde_readl(vde, vde->sxe, 0xC8) & 0x1FFF;
 		read_bytes = bsev_ptr ? bsev_ptr - vde->bitstream_data_addr : 0;
@@ -642,8 +644,6 @@ static int tegra_vde_decode_end(struct tegra_vde *vde)
 			read_bytes, macroblocks_nb);
 
 		ret = -EIO;
-	} else if (timeout < 0) {
-		ret = timeout;
 	} else {
 		ret = 0;
 	}

-- 
2.44.0.683.g7961c838ac-goog


