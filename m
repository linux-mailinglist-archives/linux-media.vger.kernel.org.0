Return-Path: <linux-media+bounces-9445-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F988A5B20
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 21:44:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 102A7283FE9
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 19:44:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A4241635DA;
	Mon, 15 Apr 2024 19:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GvwR0xWc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69981607BB
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 19:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713209701; cv=none; b=lrrYW3w7VpWX0kpkEklM5+2WfWt72u2B3w83iStw2sZetqjHhU0SWW0nfmePzROsxrPWNtOcqmEqH+CW/VViEAmSY/POIlnmPfhipprIlMUG9vf4MIh3j4wv2fCXUQi6v79RYquxj9ANZaEOBmnW/YvoJUp4VpETJoxr3n1RKL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713209701; c=relaxed/simple;
	bh=BTjaYD3gHSbLARomZDia3x39XYlnBKHtMxyPf9aygpU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZuY2k4gUKhAgywsJnzLs1Mln3V7gf8Qj0UpdNgofi5cP+osJmzXTxJh5J2WV3fB5hxsy6hIKGYOzUpbQZSKOiFozt+69OHbS5ohkyZeigQAOX97Vbwx6VQJhO7dT6FSdLyo2tKrfSJ57jfgcVO304UuVEmBy93pIEsoj84tJI6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GvwR0xWc; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6114c9b4d83so28625647b3.3
        for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 12:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713209696; x=1713814496; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uh3OglTS/dLlK8U5oP5C8O8FlJacnVYJb0xAej3AKiQ=;
        b=GvwR0xWc9E0msz5JtycIN+Pergm89MWhGombYhkLdtWqkyHaol5ACfNRdAfBuzF4iC
         br8Ilqqjjso3oCqDMFxrS2iwFW8e+1X9XLkpA58DHijQrX4mgJ3NFh6L1Itqya/p05aN
         lPUgHzGblbBM67vScNJnKneH/qx+kBEel+yek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713209696; x=1713814496;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uh3OglTS/dLlK8U5oP5C8O8FlJacnVYJb0xAej3AKiQ=;
        b=OyZA0KjLtTkgGhAyEHVRsj5tRIQo3S6DPOtuG6B86CBy/Xa1yQXQ72fjTlDpR/Mvoz
         KNT0vKZ4N56amQObKIeMQnbDqUyHwEI52sMNylCiK3H3wIh8duqBbnK+W7LgdZ9a+6Z7
         LpuIYzWom2+6B480e0+X7hvKvyTVOxeFcxo0mpFKPKXTqvunoiIV0Ydgl53T/+QO1zIX
         eLDcL/jcufRVe/RpzjhrnBQ4H7rvcEqz9ENHHftA2iAe75OSrBqCnUAAtZVmooXrYQrQ
         06TPW1m28gREabYll0z0OeWkK0BTPtq6KE0my07A5MuzjmDD+5fYOe5VF7MfangXBaex
         wVnw==
X-Gm-Message-State: AOJu0Yx3QNIHM2vJvfi92n4IeWE7WhJOlnNN4Ury8vCt5/T+s8PSqqmX
	XVsVOXOG27JCCAyN7MRuXGrTzQWKqlm/qr5MazQRNShU+Xrj4EG4q+ELt5ub6A==
X-Google-Smtp-Source: AGHT+IG9BJHIxhgRtiyDrmvRjmvCt0KkebPpr6qQTdSe7jE4SlMZNfcxa6IYFxpia/6VuZ7zYE1XoQ==
X-Received: by 2002:a05:690c:1c:b0:618:822a:e69a with SMTP id bc28-20020a05690c001c00b00618822ae69amr9192708ywb.9.1713209694201;
        Mon, 15 Apr 2024 12:34:54 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:34:53 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:40 +0000
Subject: [PATCH 23/35] media: dvb-frontends: tda10048: Use the right div
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-fix-cocci-v1-23-477afb23728b@chromium.org>
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

z does not fit in 32 bits.

Found by cocci:
drivers/media/dvb-frontends/tda10048.c:345:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/dvb-frontends/tda10048.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/dvb-frontends/tda10048.c b/drivers/media/dvb-frontends/tda10048.c
index 5d5e4e9e4422..b176e7803e5b 100644
--- a/drivers/media/dvb-frontends/tda10048.c
+++ b/drivers/media/dvb-frontends/tda10048.c
@@ -342,8 +342,7 @@ static int tda10048_set_wref(struct dvb_frontend *fe, u32 sample_freq_hz,
 	t *= (2048 * 1024);
 	t *= 1024;
 	z = 7 * sample_freq_hz;
-	do_div(t, z);
-	t += 5;
+	t = div64_u64(t, z) + 5;
 	do_div(t, 10);
 
 	tda10048_writereg(state, TDA10048_TIME_WREF_LSB, (u8)t);

-- 
2.44.0.683.g7961c838ac-goog


