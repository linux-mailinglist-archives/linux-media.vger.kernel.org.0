Return-Path: <linux-media+bounces-29113-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 59026A776A2
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 10:40:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 513793A974F
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 08:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1DEF1EB5CF;
	Tue,  1 Apr 2025 08:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hl70XH19"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF7A1E834F
	for <linux-media@vger.kernel.org>; Tue,  1 Apr 2025 08:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743496837; cv=none; b=Sfd4FpThaRSPoJgIYHV3FicRZyIgokEgLHCK73OO/pq3o+7Vsq0bk7OuuuMpkrDZ/jFEmjHk+hztlbjHsyRvf/KjAmb4GcPYwIInjG0qjWA1D1wOA+Bl1+6BIEGlKrEfmvuB0u+8nVt3DCvy4dbirE86AnFTEJYibHmB8mIp6fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743496837; c=relaxed/simple;
	bh=XN7QInH4oZtUqk5DB14x/7ud6otDLi5WJCgAWF/KC5c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ojRSvj3yr5VxQZezvtxzXTtaD9DlEviGCzkB4psgNgfyZSmaflF/rVml7TsksDvhcntoU8iH8Jo8LtjNKYN12WUWWESkmt8jaBJ5arcC2Vng4tzFn6spkKR8fX7ikukDENOdUOsA27KcmayHmiAPwByVnkkG+McKksjJJ0kjYxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Hl70XH19; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3996af42857so4142323f8f.0
        for <linux-media@vger.kernel.org>; Tue, 01 Apr 2025 01:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743496833; x=1744101633; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QAK5bGqbHLPZStc3akH3qUwD0OFzOTA3rRJ3Mg3wBUA=;
        b=Hl70XH195giJugC0j9Qx0xVCTs/0bA5+lCaAiQXlOB3rW7MBuGl8ZCeZl4D5saOXUA
         ORekelsa61ABae4ohSM3cu248lAsZvzSExb6UXs3ltS0WJSOxWtMMhxUQIxMeVVbfmJQ
         67VCBh3iYb6EhgBj9YdxYyyzUGDDVVTmPqAKl8cdyxdBzmPrZ1ZnhhpJ4WHxSexg5FrQ
         jzdxNviHzRx14eXd1CxD91WYGuoq+/IElVG9y89uPoSvB5/cH0fULiHfRCrNBmtuxjnn
         /syoHW6tBLWFdyOhD1/oYbkT3UvBjPTdLt/RSdH2LdBPZwlmB96XtZLtdNflXFhttzNC
         onRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743496833; x=1744101633;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QAK5bGqbHLPZStc3akH3qUwD0OFzOTA3rRJ3Mg3wBUA=;
        b=cTzYU/62AtWmTDdnlq6YUVBsGTDvou0N4R2IsueY/EbWcGfAHKbgZPMTq71y4dpPVT
         wwYphtzK8UX+GuFrtjlvmPpDayQmzxqFtsQ3ZqP1vzQoSoG0PqUstNgXZbT9DZkxx/02
         3WqvKIeSs3+E1GuefNy85mmngTT01AmMj6YcsBmK4cPbRYp6EwnOOEduwszYb2WENjwC
         /L9NYRJEm0Zny4ECJGVKTZyyZ+yM82SI1C3L7SYhg2rQw89hP/1QCLp2ZIW/YRrrvDYe
         ojiUhmXcLHshQmjyqkikJojb2qw+SKgeqDwJvxQv/C8RapySh1pcP8y897nX0DEoQjwI
         I5LQ==
X-Forwarded-Encrypted: i=1; AJvYcCUD5t+ZOTcfpVrEtXO0Yqnz/SQu7pC4YFKRRtMICdoFuBIApXivgUXys32zjMxDz5r2NuV0WSSXIYquCw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXmO2cQRRNJQftbLR0sINMsGbZSxBdDd8I2WkpOLByJWrUX0Vk
	kiN4o4RPxvsN+Un/2E65X0EAI5W4GNl+BcmDOkSOdfRFT6TBUNoVP6NiFLXy+hg=
X-Gm-Gg: ASbGncusmC6PFQkdF9UCg2j202Bd8NccYhuwjCuQzCNhJs4Fd9xLWhcjH+mknAAzD21
	EXXFKdK7Zc00uke03Y9KH7PyIYciIXJqouBUgFoy9b6rL5iy3ZqrEjKUzHd5Y8UDHrLvAcGrzOC
	fA0uBfoTJuwtxBE5FRcIdvP4HJR0rO7v8J1MZdBvBvEVUkYdM/Lzsey8vZyF0CIjNZ4OC1oVWvk
	XqiPGu8LvMcfagfkDltk71z/0cbekQnbJoTaXeSelCv7G6vHkz6j9/UFF9Mh/nb6SqSK0ACFJlP
	nZS0o6EZ8zOZctFo6VuliVAlfzaTSOfs2rHtttqu1E4SDTzBoIhg4hNkvG9bdzbSwBiSMtEtkIf
	WznMiASEBYxNZmR2jLwnA
X-Google-Smtp-Source: AGHT+IGsGLZEWhtkiVdbEty9JUgRguBjdThHJUgiYsWeC0RRt/L2+R/RFctKxKdLxoC212I4HzJVSg==
X-Received: by 2002:a05:6000:4188:b0:39c:12ce:105c with SMTP id ffacd0b85a97d-39c12ce10f0mr5887061f8f.6.1743496832719;
        Tue, 01 Apr 2025 01:40:32 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b6588dbsm13291530f8f.2.2025.04.01.01.40.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 01:40:32 -0700 (PDT)
Message-ID: <2d2e64cf-2bc9-403d-98ed-c9150d1973c4@linaro.org>
Date: Tue, 1 Apr 2025 09:40:31 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: csiphy-3ph: Make non-Gen2 PHY work
 again
To: Yassine Oudjana <y.oudjana@protonmail.com>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Depeng Shao <quic_depengs@quicinc.com>
Cc: Yassine Oudjana <yassine.oudjana@gmail.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250401083329.314863-1-y.oudjana@protonmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250401083329.314863-1-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/04/2025 09:33, Yassine Oudjana wrote:
> Commit fbce0ca24c3a ("media: qcom: camss: csiphy-3ph: Move CSIPHY variables
> to data field inside csiphy struct") moved a version check that was
> previously guarded by a check for Gen2 to csiphy_init without moving the
> Gen2 check along with it. Since it was guarded by the Gen2 check, it was
> only handling versions that were Gen2 and returned -ENODEV for others since
> they shouldn't pass the Gen2 check to begin with.
> 
> Check if the CSIPHY is Gen2 before running this version check and assigning
> Gen2 lane regs array.
> 
> Fixes: fbce0ca24c3a ("media: qcom: camss: csiphy-3ph: Move CSIPHY variables to data field inside csiphy struct")
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>   drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index a6cc957b986e..17762aee6dba 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -700,6 +700,9 @@ static int csiphy_init(struct csiphy_device *csiphy)
>   	csiphy->regs = regs;
>   	regs->offset = 0x800;
>   
> +	if (!csiphy_is_gen2(csiphy->camss->res->version))
> +		return 0;
> +
>   	switch (csiphy->camss->res->version) {
>   	case CAMSS_845:
>   		regs->lane_regs = &lane_regs_sdm845[0];

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

