Return-Path: <linux-media+bounces-9951-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DCB8AF49B
	for <lists+linux-media@lfdr.de>; Tue, 23 Apr 2024 18:49:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0509328722D
	for <lists+linux-media@lfdr.de>; Tue, 23 Apr 2024 16:49:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE9C813D638;
	Tue, 23 Apr 2024 16:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LJqXzxJT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D3B13D512
	for <linux-media@vger.kernel.org>; Tue, 23 Apr 2024 16:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713890957; cv=none; b=ozKkfAzy/zB0LeXMwj2Tk4iraIiQjxwehU/gqWGeTd0/fCZSfL07eZoOTsIRuxK6z3RcgKEm3+ivZ2GEn39cP3pnbeDvQxfECy+/VFTaNTXCoaraJ3AGqMs6Gbk8gXFAgjmmK5gzSKgIJx33UjlVIPmZ+sJPhh5PQsQETP6YbN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713890957; c=relaxed/simple;
	bh=ldVzTwv3fwEiTXBi6dYuRPKuiRpDDdt1y7A0qo9Q2QA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oJym87Gjd9CUirc+9jZU0z5zgNvJ9oKLyomeXasq6SkY5sj4z6elqxGK9t27iWJCU4sy072Rr4gbrBepwff/6m14HtgdiDOf9qcBSaXFZRAHDkURdQ9P0KB7tlxhKAqqpXt/WGzNzAkkLFdAUlHpJnGw7J14TAxu+BWJML+6k7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LJqXzxJT; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-34b1e35155aso2510263f8f.3
        for <linux-media@vger.kernel.org>; Tue, 23 Apr 2024 09:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713890953; x=1714495753; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ldVzTwv3fwEiTXBi6dYuRPKuiRpDDdt1y7A0qo9Q2QA=;
        b=LJqXzxJTRNDrHx9LQ1+C+/IPem1dbVrCqOUDX5bhqfDgMtzHOoopq52gzWru11PHZ/
         1UnliwrVtmzmorsz5YPSU3SlPlDjLXaxVmY9KfLg7QvowFS9B7/z+wxKYdu8NQEzEwF4
         nn9kfLOemMNUn7TK1gtgKK6OLjwLe4xJ/8evQ8Kk3h/mj3BRWBPbZJyiAsfewxJyQBhm
         FuEFVsU+ZGDl7ozAfXnfBkz9g9JOdfOLFofaSYZM+EL1x6QT6tPrn9x9EtVVuKhFUwaI
         nmfe8UzhkxwLYPmNK4PSAe3QTgoAgeTI8TmJH7nWhav0FUP08AhckZ8KYiVidUEEes/c
         yChg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713890953; x=1714495753;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ldVzTwv3fwEiTXBi6dYuRPKuiRpDDdt1y7A0qo9Q2QA=;
        b=fUjUXP2tkaY1XvTv0W9z6FHpWwfVycdb2Au3KdcPQ8lhPE2iqK511bNwBT1FVu/QfG
         yEC7ybwEs8yviF9sYAnY2cGGdwxlvQ9w4rwymwS/KCOIttu3jPtVsb17YyM8rPlYHYG+
         vB7TWzpNUXZbhUrO/t05lZKvSpltsvMwfUb7V96aNP8ohkLuhiBfrCIWqKqmtcvUTATL
         w5yqE6iX41uzuiJ8vb0kEjMOMEEW3MVO7k50He6p5UclfV9XTym4/5Qbbtl5Kp6y1HD2
         AHEwhohq9TOW+qj5lAISUpjqZ8mVoqvITyV+bDM1Sj4AwOnTuAJWlvobjLnyuCFO07u6
         FNiA==
X-Gm-Message-State: AOJu0YyT4mjWtM7MxJnf4sW5TaEkuBh/atmW86LeJ7mbWnIbKFAld+ui
	JuhQQSjNQzvX8OPkRvEOb5DwSRM4Z51xpSEK1NxDV8IgfBJ40Ef8lWPinAJlRpo=
X-Google-Smtp-Source: AGHT+IFFjiX0lGTvRX6PkqniQZmmmeygPyoAEul4datqZN6BwlChbzsJP3H/9AAw03G7QKIB4ZDERg==
X-Received: by 2002:adf:fa88:0:b0:34a:d130:611b with SMTP id h8-20020adffa88000000b0034ad130611bmr7093753wrr.17.1713890953167;
        Tue, 23 Apr 2024 09:49:13 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id n12-20020a5d67cc000000b0034a51283404sm12576954wrw.72.2024.04.23.09.49.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 09:49:12 -0700 (PDT)
Message-ID: <81770681-7ddb-41b4-8202-8dd44014c5e8@linaro.org>
Date: Tue, 23 Apr 2024 17:49:10 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 26/35] media: venus: Refator return path
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
 <20240415-fix-cocci-v1-26-477afb23728b@chromium.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240415-fix-cocci-v1-26-477afb23728b@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/04/2024 20:34, Ricardo Ribalda wrote:
> This is a nop, but let cocci now that this is not a good candidate for

*know

> min()

But I think you should change the commit log ->

"Rewrite ternary return assignment to mitigate the following cocci WARNING."

> drivers/media/platform/qcom/venus/vdec.c:672:12-13: WARNING opportunity for min()
> drivers/media/platform/qcom/venus/vdec.c:650:12-13: WARNING opportunity for min()

then

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

