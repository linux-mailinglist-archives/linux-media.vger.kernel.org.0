Return-Path: <linux-media+bounces-9932-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E158AE6BD
	for <lists+linux-media@lfdr.de>; Tue, 23 Apr 2024 14:47:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DC078B24D31
	for <lists+linux-media@lfdr.de>; Tue, 23 Apr 2024 12:47:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1549C13B7A0;
	Tue, 23 Apr 2024 12:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LsDtwhLs"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4186C1386D3
	for <linux-media@vger.kernel.org>; Tue, 23 Apr 2024 12:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713876236; cv=none; b=Ohkpj8/M9EupEaa+vYwI1J0Sl0BsvcNq845KSfWlnlf32lR+nFGr8/wo0S3Ah2ESJZpCAb6OfH5yWIob/UAn5kTAFQqMw+ZzVMc55343Rt5Ou5aK6KMBtvbPnG8UESHcc4KFjpgosP+L2wFzgrlJCHZOd7akHOAhepUnQeKzqio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713876236; c=relaxed/simple;
	bh=r0UmnNWiljWy3w/DWQQ7Ic6mYcT+iVhIRMPUeFTh3tM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bcvSD8eUAXgZScskmb1XsPx/NxaDynXVOXF9Cl5i6Pgzel3hFhmHC3isx+joTrUq241haNzBqP9Ih876JZswzI8355QCKdq+6pHh6wclE18kVXsyE2xJTTHc1I+NBGaR/nMEDiVm1zM2GMUZaA+sr9+czAS0ewaOc1OXAQW0XHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LsDtwhLs; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-349c4505058so4379109f8f.3
        for <linux-media@vger.kernel.org>; Tue, 23 Apr 2024 05:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713876232; x=1714481032; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+qnKAwgvBHM35XCDpuBit4GUKItb+LTK0jOfybUvb7k=;
        b=LsDtwhLsTNd6Xj4IasfsiBLv0XCxeO5W0KCfSdmEBX0mBZZ8Va5xBp6xIET1gjS1n0
         KIuZyJU23Kpz2iG/R9a8ipbCFFT8k6crZEWKKeawXUwSMADN8d9hSjv6Kn5fuu3ozd9H
         u3NE13xcerUjPm0X6W03R32V3lvQAuxGzy6MkBMRgDqSAPtLzQfOKB0cx5pfJgA0koBR
         ZWx4qRcPVut3AZt9pvjdMdetMtCo6sQBBtvWE3yFHcYuouA8OSbf9Xc0jewmJ7gIdNLX
         8BP5meLrW5GWUf6oH+etu9o9/8XxqoNu3vUFzhjYLxGzxlHGepwTDxp3AQxUZJIyhX4z
         h6MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713876232; x=1714481032;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+qnKAwgvBHM35XCDpuBit4GUKItb+LTK0jOfybUvb7k=;
        b=LBixnDQziL3dgm98B+Ib09OegE0d4j4BPbrNbxmPDlP0bB9/zU3z15vjXv97bEWgAo
         K/kPbBLwts87R7kGs0iOkbgMDQFwECRR6+z/tOYeFLRwcOjrBy6vB5hsFtWm53iYOZ3b
         1waJod6Ukiwgc97m+fkSVOFw25f8pc3HoszcVgaW9Owd6ksbbPNeCRf+GynBCOao8Oy3
         5qlyheIaZsOcDfYC94LZv/lhh5kciMIHLLqjmCU7vh91T9bJnp/9DQpsuaFeI3UR+8tS
         AQPPJxNsKHR76VLJ3TYh92b1sG8pnRr8Oj/lB7cRc3NKoFdKk88zmlnIaBG/8caj5V7S
         sc9Q==
X-Gm-Message-State: AOJu0YzcNik/97JizXi+dknRCSP/dupo0izOVtAyyk0yxvFwK5nD4jJJ
	3/atjQOuAwc5Vl9ll/mbZA5PRRVs3YSp7+x2N2Js2TmrjHgyDDKbi5D1k8r/cX4=
X-Google-Smtp-Source: AGHT+IHx5NN+z23VludiFeHTrKmrJCe4gLG+r1lTx6C4j7QEMysWQLMdtEpvLnQqAlOL1NQMbBj3Zg==
X-Received: by 2002:a5d:6a8d:0:b0:34b:5caf:6342 with SMTP id s13-20020a5d6a8d000000b0034b5caf6342mr2073298wru.67.1713876232556;
        Tue, 23 Apr 2024 05:43:52 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id r16-20020a5d6950000000b003477d26736dsm14506412wrw.94.2024.04.23.05.43.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 05:43:52 -0700 (PDT)
Message-ID: <d13fd47e-1ecd-4aa8-844b-cd260e9fa437@linaro.org>
Date: Tue, 23 Apr 2024 13:43:49 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/35] media: s2255: Use refcount_t instead of atomic_t
 for num_channels
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
 <20240415-fix-cocci-v1-11-477afb23728b@chromium.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240415-fix-cocci-v1-11-477afb23728b@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/04/2024 20:34, Ricardo Ribalda wrote:
> Use an API that resembles more the actual use of num_channels.
> 
> Found by cocci:
> drivers/media/usb/s2255/s2255drv.c:2362:5-24: WARNING: atomic_dec_and_test variation before object free at line 2363.
> drivers/media/usb/s2255/s2255drv.c:1557:5-24: WARNING: atomic_dec_and_test variation before object free at line 1558.

Hmm, that commit log needs more detail.

"Convert from atomic_t to refcount_t because refcount_t has memory 
ordering guarantees which atomic does not, hence the WARNING for the 
free after the atomic dec."

Something like that.

I'll leave it up to yourself to decide if this warrants a Fixes:

I don't think so myself because the previous code doesn't seem to matter 
to the decrement and free.

---
bod

