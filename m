Return-Path: <linux-media+bounces-9933-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BED8AE6DF
	for <lists+linux-media@lfdr.de>; Tue, 23 Apr 2024 14:50:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF95A286ECC
	for <lists+linux-media@lfdr.de>; Tue, 23 Apr 2024 12:50:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C823F137760;
	Tue, 23 Apr 2024 12:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D7agsy/6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96081369B5
	for <linux-media@vger.kernel.org>; Tue, 23 Apr 2024 12:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713876399; cv=none; b=a2ZhVgi+lnGXpw6uM9VnSvx/mU2jF8w2OM/dkifRRDdRKYgE8IbCPnPx+nJ9dLZXJjd8kwp1f7yvzqyV/2qlhPU5RQP8TWIKZd8e65fwyDMuZwJ5fNI2s+elhwlq6SEcNVgJYzH8/fwVKbV2yikIkw61FlYnW4SxiDbZV8siD/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713876399; c=relaxed/simple;
	bh=UXbyOuSKUk6g1FCuzFbmBH4NJztxq0P/VMUY9kPJrvg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r3shYfDUgK6yLrwGDUViXTg4xIKnN5qyixMUstrjLxfiDcDPwKH7vzIAazef81v5Pp/CndL9+GRl4Lh7rmjDVi3qAgn9MXmto52xtQxXxbdvOmzZmR4S/Sypyyzs2pVFf4M7HqtgY0jJjOgJO5YFmJoIXa5psMoN+k1lgNifMgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D7agsy/6; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-34b029296f5so2302364f8f.2
        for <linux-media@vger.kernel.org>; Tue, 23 Apr 2024 05:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713876396; x=1714481196; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SnPvo8X71/HjmVfrFSADYDRaBhD7wOKAzatHqFXk968=;
        b=D7agsy/6VViR4cX0MBsxJWoxCdbK4LkQqyXnPZYAGxzQuEnnK6jwoZLaWs5VYaqEg9
         +RZC3nhf+xX+MjQS0WRnHh40La+h3VeWrfKLJR6zXjommaHQXEKLjbnL/jygZD95hAOq
         Fp0dpRZmCwDJQrJZbStccz+FJ2tgODU4uxl20wksz5iZwao2KhJDUy9zUO5WiZRlDC1w
         U6QQgAURIu6nGztYhguYZ83Fq74JN7cGv1Fv4Eg20rLMsEkchAN4Ec9RcN+f2c6+ayDA
         wB0Q/DdOjEUewW8k20X1ZLsrjmLJ+Bq0bFO88kXcArBpJ3p8uJMSBUN2F2gxBD+SE9+Y
         tlEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713876396; x=1714481196;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SnPvo8X71/HjmVfrFSADYDRaBhD7wOKAzatHqFXk968=;
        b=g6DNYc/Z9ZQy+fOdHrzXItgK/nZhX0AVCbXb+3TcK7CrJXOI3wdWt0012tUCYNDoMC
         b8hBWLlriVmzg6dr+dpbgWgfoHLoxTlYxeEvO7ags5I/+7pwXoBBye44WvwNgqP4/CHo
         Azpskh4D+TlMF7liVd06SmQm/wcnp4H/fRkEkzYeycxf4LosPhDRnMDPcPjeXiESzC47
         MaGxZAPbjOoA1mpxB4DozTFBHhb7+nBtk78uQRc4YHVrc4mfzzhVrusJnCXVRiKv/jWv
         7UtSI+KSUZ5SAWYe1wT4NkgK6eHgl9+3Y7D3j2L4pB7LPAXkvzRWRs/Qb41levHYvMDO
         diUQ==
X-Gm-Message-State: AOJu0YxMxdzE6Avn2sWuEmIusiErCXjAjzFWR6grTpSfM2jVlWRO4VYE
	/MkWa97SO7geeatWtF9tD67++Q0es3kgnO0P+n+W7HDgbq/d+omtE41d+6HxR0I=
X-Google-Smtp-Source: AGHT+IG+1vx5mJkN+16nkw6DrmjKX/bCAbSI7iHWCeWcx9NCAuHfmO/i6PUYzl4PV0Sl6Y/Ow1sbhA==
X-Received: by 2002:adf:b197:0:b0:349:f83f:9ebf with SMTP id q23-20020adfb197000000b00349f83f9ebfmr11081490wra.5.1713876396189;
        Tue, 23 Apr 2024 05:46:36 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id y7-20020a5d6207000000b00346f9071405sm14531796wru.21.2024.04.23.05.46.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 05:46:35 -0700 (PDT)
Message-ID: <44d6ab8c-3810-46ac-8e54-c125b5c29199@linaro.org>
Date: Tue, 23 Apr 2024 13:46:33 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/35] media: platform: mtk-mdp3: Use refcount_t for
 job_count
To: Ricardo Ribalda <ribalda@chromium.org>,
 Martin Tuma <martin.tuma@digiteqautomotive.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
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
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Pavel Machek <pavel@ucw.cz>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <20240415-fix-cocci-v1-12-477afb23728b@chromium.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240415-fix-cocci-v1-12-477afb23728b@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/04/2024 20:34, Ricardo Ribalda wrote:
> Use an API that resembles more the actual use of job_count.
> 
> Found by cocci:
> drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c:527:5-24: WARNING: atomic_dec_and_test variation before object free at line 541.
> drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c:578:6-25: WARNING: atomic_dec_and_test variation before object free at line 581.

Same comment here as per the previous patch.

You should explain in terms of the memory ordering that refcount_t gives 
so that the intention of the WARNING and the API change is well 
communicated.

---
bod


