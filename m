Return-Path: <linux-media+bounces-10348-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 40AFD8B5CB9
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2024 17:09:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0CF428599E
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2024 15:09:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D0CC12AAC8;
	Mon, 29 Apr 2024 15:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VIEfDDr9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B006128830
	for <linux-media@vger.kernel.org>; Mon, 29 Apr 2024 15:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714403107; cv=none; b=FRHku3p4qqahrxjVf74qVKlFf3Rlo1Q37Y0cc5Ba7ft1KWjt5Qj+9DOtCDs1fAwUpYesQR3esrzSr9L3hs7uPO1fOD7UTlEGCLjOy1xCM7jKNX8HLf6/bVVddwhRaF7B6hP4KGpRMGshrSOo4SHuGr3rERhDt6184np+N+7CgcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714403107; c=relaxed/simple;
	bh=NKspkx+WjefJTC0T9GdQgMYdznykMk+osWwLYrp0b/0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CZEZ0SYyf8fyz7kOMwWoK7182qlIGpszyu8HxhU3KqouRrNwpfKRZDfGvn1X/oGHgV3f1+vus241M0dKM/P8srrZ+sR8nSFQC3AF5YIvF/S+qjR4LWivm0ACREWGKnGwRhW1Cqz0dX9jW4BJnkdNf2TBGabAk37U37CBLe/MCpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VIEfDDr9; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-790e7c02430so152244685a.0
        for <linux-media@vger.kernel.org>; Mon, 29 Apr 2024 08:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714403101; x=1715007901; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kyue/FRqn/p1WnqrFE53P+Zy+G2t8IVLierFxkwHoc8=;
        b=VIEfDDr9Wba4En6N9jQIOSUKpRYyyiHx6LU5M7s+OSEwm96rNAlXTzsA6D2jWC83qg
         JPWT3rgZQQvg44Ldos7WBa0tCYlSuBu2hbTuhffszJ/c2woZr43Z4D4G3SvRn0MnXsP5
         /STEQ79jMIufvUe7sWmhUj77YusCokUqOGN44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714403101; x=1715007901;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kyue/FRqn/p1WnqrFE53P+Zy+G2t8IVLierFxkwHoc8=;
        b=YMhxKMzCHXQo4Gn5P68iUUKKcfmQbQi7nYY7Cd9/Nl4OcmvMjHQsk1dpgZWsiWze04
         pZbkshN2s24gbVOjfW6TlukDgJg/XCDIon44Bwshj1lda02fGcD8YrjAJYvGiiP1jpj7
         bM8MHDgY/Lusll0pbO5r/qXVF8sAVr+AE9ZfXLZ9PBCLU3LB02HsW6wmafHkWzXtINyS
         kkftd18EFBBIuLDfzQLbWgXUHSWZsEi7YN/4FWcA2ul3lw0RCf3J9UdC2SjWxxBFpTlf
         /BAaIlWvlS0Y5SdbVVAxkG2PZLqtDYrxA49YJaCCjuUCRXUj8cFj+ZP2lgyApdEb+5wD
         VHBg==
X-Gm-Message-State: AOJu0YwtC+kaPtu0WhTpa5+1dQ2M/+R9g2xMLQ24lI6ehyZ31VMrntJj
	oEpfaWdEXE6KzbKQ0lpMlcU/9Bni49we8MrjsfPMR3GtD+TgXSWjEIWmIKo8be8x8UQupdALtA4
	=
X-Google-Smtp-Source: AGHT+IGL4vooVVR+0mzZmPQqvYaly6q1aVJv7Kw4xqkfiCYuQPEweu/zlD5u/57ahvXotSjFXGqNNw==
X-Received: by 2002:a05:620a:2059:b0:790:a36b:477d with SMTP id d25-20020a05620a205900b00790a36b477dmr9906478qka.35.1714403101530;
        Mon, 29 Apr 2024 08:05:01 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id p7-20020a05620a056700b0078d3b9139edsm10568591qkp.97.2024.04.29.08.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 08:05:01 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Apr 2024 15:04:57 +0000
Subject: [PATCH v3 18/26] media: gspca: cpia1: Use min macro
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240429-fix-cocci-v3-18-3c4865f5a4b0@chromium.org>
References: <20240429-fix-cocci-v3-0-3c4865f5a4b0@chromium.org>
In-Reply-To: <20240429-fix-cocci-v3-0-3c4865f5a4b0@chromium.org>
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

Simplifies the code.

Found by cocci:
drivers/media/usb/gspca/cpia1.c:607:30-31: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/gspca/cpia1.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/gspca/cpia1.c b/drivers/media/usb/gspca/cpia1.c
index 5f5fa851ca64..14aaf36cde6e 100644
--- a/drivers/media/usb/gspca/cpia1.c
+++ b/drivers/media/usb/gspca/cpia1.c
@@ -604,10 +604,8 @@ static int find_over_exposure(int brightness)
 	MaxAllowableOverExposure = FLICKER_MAX_EXPOSURE - brightness -
 				   FLICKER_BRIGHTNESS_CONSTANT;
 
-	if (MaxAllowableOverExposure < FLICKER_ALLOWABLE_OVER_EXPOSURE)
-		OverExposure = MaxAllowableOverExposure;
-	else
-		OverExposure = FLICKER_ALLOWABLE_OVER_EXPOSURE;
+	OverExposure = min(MaxAllowableOverExposure,
+			   FLICKER_ALLOWABLE_OVER_EXPOSURE);
 
 	return OverExposure;
 }

-- 
2.44.0.769.g3c40516874-goog


