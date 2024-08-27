Return-Path: <linux-media+bounces-16925-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF30960B98
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 15:16:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9946C1F213B6
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 13:16:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A7F41A2C3D;
	Tue, 27 Aug 2024 13:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eLm/3AN6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205431A0B1D
	for <linux-media@vger.kernel.org>; Tue, 27 Aug 2024 13:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724764591; cv=none; b=BUsj0yw84/szvn4F6bO9XPiaVh600bfZ6zuVNahhnxMmv9sqKC9nejJiOZeKEBxpLe9qM6+DsP5kkeSl2V33r2jEgkRfQ5SKYW+N1jJuP5Qo/ZgiRvr5jyVK7XKH0/cMA+H2oXH59i4QG+qTJV31dki8elLLv1YhIimv8m1+hBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724764591; c=relaxed/simple;
	bh=zSDs4BUV3METdXmko0hl60ogxseD+zNrseh74ORAvDo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cT07uQtOvWh2fmWmCnLvBQq2tlkf8jmqyroRZAhYEmxjastXSUD26ntkNjCLYUGz3ssQ1kA9POH+AShdGNVUChDueKclVPDt+9+aWzaw7aRtVBYGp8bx8GvcoFxiA/GxScHkgbfQbP9H9qWjHoBlyoOdoq8J93B0Nkc5QD3i7Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eLm/3AN6; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5befe420fc2so6811778a12.3
        for <linux-media@vger.kernel.org>; Tue, 27 Aug 2024 06:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724764588; x=1725369388; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GrhMuYl4d9v0h/UP5/GJa9EJkPhfXO+uMjBnq3JFZdI=;
        b=eLm/3AN69Jm7eIp6BT7VIJGvq9JewO7/2i5AtUByUlCzR4/dlanauEgn5vgc1xCBhS
         GNs5E2bOWHE2Ys4XvahjpbdFEb1uQapcqiWYcnDHeFaRI/NuSB3XbBN4kj/OTBmrIYiy
         Ffomrz5FypB2WDKR378dYXD+/r8+FQhRHVWWqa+dWm47IAqQD4JK4/Eq3VOke+2xPFyE
         zUhyiILR+IKt51PClTjTYsktm5faNHgO/pMRpNH02b74M/OesGnI4DVmB/nLM2vVk0Bn
         gnZRWKVwnbFChNi1CY5bMTHkYJ2WXJinpNF/MAEeiRH/WviB8Mf83xqefhJYZ8HXRkkI
         o/3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724764588; x=1725369388;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GrhMuYl4d9v0h/UP5/GJa9EJkPhfXO+uMjBnq3JFZdI=;
        b=wiAbchk2nhzG5cFtK/LNq6ohJsOb/ZfLiwPqx3kfx648gadRmQ4BwIudPwQ2AwZM1C
         2aDY/WiDrZ8TAgCQVWS8zhzOBGKo41BKQD09EDbvZ4+B3RbriCzEFBFMCASR4EywWvuC
         UsevzBhTndnExWze5Q3/pqkpSJODoCgpDgqlvDL52HsRVPIwLEallSMGhpa6pKKdkoBI
         f/0bcM3Ca+Dgbi7Oe/3Lrid9beovF1lAl+9MMO5qLlZ7YkCUCzQ1XbW4WkGxjgpuIcFw
         iNRpyd0OBZkMJUuN6o0kMjTwKk2ehqSYb118fnrFoGVkE/VWlHieS2PaUrmMsK4ep96i
         P2Og==
X-Forwarded-Encrypted: i=1; AJvYcCU3F3m/n8FscxTEdeKuE+bcD7bY/m++AfBsdcjpHeXKl5OMsEGySqBs5GsHsuXccWtuQWxgklCkZdS57g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxTqrNCmXLfADiEHkBrlV0hPR0tx9NbzEktc9j4heKqjoAZbEu
	UWSBya2KQ4iyE0rr0iqHJvwAcrqVacsKP29q8EYKjoohRjO8C/0Eo0Lnmj8xfbI=
X-Google-Smtp-Source: AGHT+IFnrrYt1pcEShR0jArLWyB07KU328muSxhdaWUNjW24ILMrZgVMlT+ASlmP8Ql2d4/j2jfvkg==
X-Received: by 2002:a05:6402:42c7:b0:5b8:5851:66cd with SMTP id 4fb4d7f45d1cf-5c089159d17mr8851171a12.2.1724764588304;
        Tue, 27 Aug 2024 06:16:28 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c0bb1c2b8fsm1004146a12.1.2024.08.27.06.16.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Aug 2024 06:16:27 -0700 (PDT)
Message-ID: <63844f8e-4564-4528-b81c-27e973fb36c8@linaro.org>
Date: Tue, 27 Aug 2024 14:16:26 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/13] media: qcom: camss: Add support for VFE hardware
 version Titan 780
To: Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@quicinc.com, Yongsheng Li <quic_yon@quicinc.com>
References: <20240812144131.369378-1-quic_depengs@quicinc.com>
 <20240812144131.369378-14-quic_depengs@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240812144131.369378-14-quic_depengs@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/08/2024 15:41, Depeng Shao wrote:
> +static void vfe_reg_update(struct vfe_device *vfe, enum vfe_line_id line_id)
> +{
> +	int port_id = line_id;
> +
> +	/* RUP(register update) registers has beem moved to CSID in Titan 780.
> +	 * Notify the event of trigger RUP.
> +	 */
> +	camss_reg_update(vfe->camss, vfe->id, port_id, false);
> +}
> +
> +static inline void vfe_reg_update_clear(struct vfe_device *vfe,
> +					enum vfe_line_id line_id)
> +{
> +	int port_id = line_id;
> +
> +	/* RUP(register update) registers has beem moved to CSID in Titan 780.
> +	 * Notify the event of trigger RUP clear.
> +	 */
> +	camss_reg_update(vfe->camss, vfe->id, port_id, true);
> +}

I think I tend to agree with Vlad here, that this is a needless layer of 
wrappering.

I'm not sure that's exactly what you guys where talking about but, I 
rebased my x1e80100 stuff on top of your stuff

https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/linux-next-24-08-15-x1e80100-camss-debufsoff-cleanup?ref_type=heads

and anyway the above wrapper didn't make alot of sense to me.

---
bod

