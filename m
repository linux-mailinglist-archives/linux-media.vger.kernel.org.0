Return-Path: <linux-media+bounces-9821-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F71D8ABDBE
	for <lists+linux-media@lfdr.de>; Sun, 21 Apr 2024 01:16:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 03B8B280F88
	for <lists+linux-media@lfdr.de>; Sat, 20 Apr 2024 23:16:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A70504DA14;
	Sat, 20 Apr 2024 23:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v6+3JRzm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7500482EA
	for <linux-media@vger.kernel.org>; Sat, 20 Apr 2024 23:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713654960; cv=none; b=SVeh5NWZQAOiZm0YZKCHCQZY/KbcZn4su2tSDe7eF2yqmat9lTVo2rBsBey4jMXspij0vSFXb+cP7cnxY9Ay1qXLh4Q4MsVIplIda4ei4mn3dvB/TcmNGNDM5jqjMdTbxo+42pPOSBNoll+ea97Bmhd4B2tZkcJC9+pTHsPynfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713654960; c=relaxed/simple;
	bh=NUrvewJBcU9hHyp8pm+RCmXt1n//pDwbkcHy0aq0J3A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RToEJGL84eCsgxc6Q3gOgphlrYrGE3KdN8nmB4PEdG6JEvCW5iNaMlhW8PNMdBwzrJJzLM1U4zDCGbNK4fRiWPQHlaktkfAIo4cb6r/gnqdpAwMS8GyoNq5sYcOLkZLI5U8z4vPNnvuMZQFZa9ckuLq5YG31M5drOGecI+MGquk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v6+3JRzm; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-41a225fbf64so1779905e9.3
        for <linux-media@vger.kernel.org>; Sat, 20 Apr 2024 16:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713654957; x=1714259757; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kQknuL+r9cbmTtmVlTx7T5fh7q9KKWBimZWASaRekHw=;
        b=v6+3JRzmtZlF+fMxn4yPWdPkxe9+IDYvgKjQsqCMLIqLJTN0zNjmgfIW4f7uTgO2mg
         pKKX3wYdzXHmJvwqOoGVxwkQsCV5eNprtZAPwZrONK6v3vYsBeVqQLIwX7DmaMDLO5R4
         p9JENYQ9nTmaPsgPWd1nNpVsAjl8hQvH3+nOqzjx6ZHaT5qamlOkIjMAM65wtTFzCNBo
         CaoQPhPG9+BmB9gYZbMdsbIhhY/afD8YvGVwzvyb5RjegAqY/8MEsFjK0Yk2+lSICIE0
         MkmsUPXSJ1Kex6Qc+Mu/IsTyi1tzkED8FyZFfhKRWnpD0YseWwkyyU8PCmD2ZfnzR8T3
         7DEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713654957; x=1714259757;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kQknuL+r9cbmTtmVlTx7T5fh7q9KKWBimZWASaRekHw=;
        b=hKopMUK5vegwOWsQiyARqhgRckVUDCv1EqC8qMH6DJPSENoj1QDKkoDS6sq0ePWqN+
         sfi3HeoPpGnch2MfRj11uJ2jy9XHC1Q+OvFiNZF4d9vIndXuBFW8fc2bbpIF07QiAv7H
         RXqg9m5jrlVFe+VDHSp31KSEX3NoQ6JketxXZvbIVrHFEOmlOjNujXhph4hpzAEi5WTu
         TUei619fTDNWJ95Z5R+iJy4uJVo1CZU+Vny3astZYu8u80QR/0w2ij/TIqwWeO/w0UkU
         5JAGW+ctbzcu9EHCsWSpTCqma6Vtbj1pdCgtMb3PvYQyX4bfJBa4qHa1asvWAclDlG8B
         VaRQ==
X-Gm-Message-State: AOJu0YxAzcv8pQp28rD/uvySNLraSzvp6mU9+F8tsUIp2TjxXuX+ZpIC
	6xaN3S0DB5BLTNEYs8KkFmxe8niaCJ+ysMbweAzG1oSW0H1m1FVVNQRB6xaa1Ts=
X-Google-Smtp-Source: AGHT+IEJ0pmo+Vbh8mjcD98mOO7pRnAuIGNTQ6Q1qc2nTTg8q3KESPbMSdkxwInYUTYo3kcHGC3OsQ==
X-Received: by 2002:a05:600c:5486:b0:419:f497:632f with SMTP id iv6-20020a05600c548600b00419f497632fmr1710464wmb.29.1713654957220;
        Sat, 20 Apr 2024 16:15:57 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id q2-20020adfab02000000b00349d8717feasm7913040wrc.56.2024.04.20.16.15.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Apr 2024 16:15:56 -0700 (PDT)
Message-ID: <124e35b3-5b0d-4bd7-848a-5c848b339157@linaro.org>
Date: Sun, 21 Apr 2024 00:15:55 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/26] media: stm32-dcmipp: Remove redundant printk
To: Ricardo Ribalda <ribalda@chromium.org>,
 Martin Tuma <martin.tuma@digiteqautomotive.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
 <20240419-fix-cocci-v2-6-2119e692309c@chromium.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240419-fix-cocci-v2-6-2119e692309c@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/04/2024 10:47, Ricardo Ribalda wrote:
> -	if (irq <= 0) {
<snip>
> -		return irq ? irq : -ENXIO;
> -	}

You're dropping the original intent of the driver author there no ? when 
irq == 0 they want to return -ENXIO.

---
bod

