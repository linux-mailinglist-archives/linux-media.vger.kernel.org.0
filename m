Return-Path: <linux-media+bounces-9736-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E278AABED
	for <lists+linux-media@lfdr.de>; Fri, 19 Apr 2024 11:50:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 775D61C21323
	for <lists+linux-media@lfdr.de>; Fri, 19 Apr 2024 09:50:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B1837FBDD;
	Fri, 19 Apr 2024 09:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="J/We44Jy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FE77F471
	for <linux-media@vger.kernel.org>; Fri, 19 Apr 2024 09:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713520167; cv=none; b=Xob4dINUsbNJ3SUGEBDyGhcpW2HG1tn2VJgiBcvSNnX3Mxb9lrfC6Hdu3i9NCjweODBchmo+SGhUJfFV0k/bNp1G3k/h4pr8E76I9Z1z7JyhFX6Ja5Hjj/YoyRqOzWRWEg52LnHxvPVsQFQh824hcpsMRpn5NNt7zsuiHBUr/I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713520167; c=relaxed/simple;
	bh=4VxVD/ZvDgbL8FzmgqVV94mI8OoBWP6NSF7Mr+JIpbc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K70uUO1aBWzvSWyXbQGaGGGKnwKB5cgtdy87AQSvndaaxxRUpAEmmiAL+X8GS+bIjCv6nxnDhskdnrNS4SocHmGo9yu3KXgEkI3TjRgCwdTvOiPGh80UAaVw2sN/irEzkf5laOHmMd8GS9WHctASwdsyjtDnGdlX3JIVSzG7xlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=J/We44Jy; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-78f043eaee9so106761385a.3
        for <linux-media@vger.kernel.org>; Fri, 19 Apr 2024 02:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713520165; x=1714124965; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2ANA0Ymw4Lt0Uz9R7FMbv4c7Ba86EanvWiJ79X90fJk=;
        b=J/We44JyLH8NjvzFa549SP63qth6k6rboYWuhhVgP5mGZ/ouvSRsLTkDjolDpXyOki
         ef+P3G4w12ZlaF4MIZN6OKsTG5e7WHYWQCfg8J7dNMH06eyidEmIRRqokMESSc4px+XV
         W1hKCY99b5dbfmKKJrv1S0mp9Xayu0wKyLz3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713520165; x=1714124965;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ANA0Ymw4Lt0Uz9R7FMbv4c7Ba86EanvWiJ79X90fJk=;
        b=BuaAJW/uCnFYZdGXNp+t+HArJvUniGbt4KdxNJwLONLpFx7+Kd+19iTUmQufVLTR5b
         fqf0yoWNoMQ1HpCuq1QMtRwFN/QM2RnQT3kVIunJSc2yK/6L6NqS3b9gbhoMOMrFrqHU
         JK/I4xB6WqiMCle0ymmkh1mQJp2GpPSgtFOHGeEogc4qDDqxv+aBcZouiqpvkYdFh4Jx
         Y2syneBTSHJChx0vM9XsWkITP9lZKEClkC1ycxCwPXJYaT4fWi3X6BB/CwIjf9N2qFHy
         nK4Y4z4gzktPPq23YoMQGXLGD/AF+MOvKa0dy3wjSHE7TQEJf4ORTSucDDiHtrH6y8S+
         Jsfg==
X-Gm-Message-State: AOJu0YzoA1dSRcx9RSbl5W+uThdSwldDZCleA7n76WGeJNAJ0uyjkeB+
	u0s25eL3YU+jcENWxTEzwHCVG6SI4t8rrpCgYiuweShti2EU8EJeHZbzUejiGID1OZoIui49KbY
	7Ng==
X-Google-Smtp-Source: AGHT+IHomIgtJUPKBWZHNjcgUxdMC59m2s0CnNC81cRH7k5Yf23XSr3oTpLeoFOU8oA9VPTqHwEHeQ==
X-Received: by 2002:a05:620a:984:b0:78d:6b8e:18d with SMTP id x4-20020a05620a098400b0078d6b8e018dmr1691369qkx.64.1713520164849;
        Fri, 19 Apr 2024 02:49:24 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id dt14-20020a05620a478e00b0078d735ca917sm1434532qkb.123.2024.04.19.02.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 02:49:23 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 19 Apr 2024 09:47:50 +0000
Subject: [PATCH v2 04/26] media: uvcvideo: Use max() macro
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240419-fix-cocci-v2-4-2119e692309c@chromium.org>
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
 Ricardo Ribalda <ribalda@chromium.org>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
X-Mailer: b4 0.12.4

It makes the code slightly more clear and makes cocci incredibly happy:

drivers/media/usb/uvc/uvc_ctrl.c:839:22-23: WARNING opportunity for max()

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index a4a987913430..4b685f883e4d 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -836,7 +836,7 @@ static s32 uvc_get_le_value(struct uvc_control_mapping *mapping,
 	while (1) {
 		u8 byte = *data & mask;
 		value |= offset > 0 ? (byte >> offset) : (byte << (-offset));
-		bits -= 8 - (offset > 0 ? offset : 0);
+		bits -= 8 - max(offset, 0);
 		if (bits <= 0)
 			break;
 

-- 
2.44.0.769.g3c40516874-goog


