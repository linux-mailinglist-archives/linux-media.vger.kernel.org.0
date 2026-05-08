Return-Path: <linux-media+bounces-60915-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMFNGJu1/WmAhwAAu9opvQ
	(envelope-from <linux-media+bounces-60915-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 12:06:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 058154F4BB5
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 12:06:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 937D83003351
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2026 10:06:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CD133CBE8F;
	Fri,  8 May 2026 10:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mKX3v2cy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1211388E6B
	for <linux-media@vger.kernel.org>; Fri,  8 May 2026 10:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778234765; cv=none; b=JDkl6q16bIkrU6Csqc7chxMhLNOIDdc2DtK+SkF0OJ+u8GaggUOSMq5KsYfXpXepzxvPeYXsJiFbqWXawcUI1zT/Xl4kHJWbtGRgUm5EUqPqrsFIv7COqsOlPJvWkVu6epxa1qYsOzz1umSxDzvnDB+kPnBFIiCd31vZGpq4X1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778234765; c=relaxed/simple;
	bh=7HtEkn1G6Gt+KqI9Inj3vguOrvstZekSSZzl3+vPWJY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RIV/YTh7f/l/N9ym1FF3bP2PgLi137f+/Xqv7F/2CBkk3xGN/s0ztekSQf1+/oTJkfKgW7FUaXNsiLBl5Diz6Ue78Bxj2Kiy9dCUdI3pDPoEEr/cmu1jB4XOSW9kED3g34WRUYGsc3IMqY16UZFyw1Qe73RqVGcDrGYOOPy25+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mKX3v2cy; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-67389cf78b0so3312172a12.2
        for <linux-media@vger.kernel.org>; Fri, 08 May 2026 03:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778234760; x=1778839560; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4hxarCXBu2q9FLo6gBfwZV7234oitg8nQDrnEw0Apq8=;
        b=mKX3v2cyUXfWRT5X5osfq2WBcZQATjRgkcPJfkaRqDd7Jxcxcvu1eCHXYuOtLrSzuP
         /uHIAOZEuZdDEsumX7xFK0exxOEh9BeBB/dz1iK3LI2xYClnX6PvHLyOsbZwX6SAgow6
         zTUdzKHj/QI0eqswypAEnd5kEc+IwWBMVxj1E93c4VxjHCD0lvYxFjlXD2KxF21azkCJ
         /+iMtseDkn5OLBKA9kgLSnv1shtQ6u2ho0P179u0jFl21E14BOk6PqgHQKISKlO4whXF
         Z5irl0CBpfpwN7HLPZwUqYSNO4a1o4m58hrOQ4QMU5oo8EagJUoYQWzbAFNmtJICFqAv
         h3jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778234760; x=1778839560;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4hxarCXBu2q9FLo6gBfwZV7234oitg8nQDrnEw0Apq8=;
        b=Y7Gwr14h4302aBamI83K8a4r4NN223Z6kfXHNhcxHW091+LDNp491F+aN3SqItBHlE
         espmTJm8/fQSEcvMh0ynwlBcWzJDPGRv3e0mVEFLlQcZNyPkNu+m5zlwyD188ZK/K8wv
         o0k8X+irGphcIWJ+zk9ii1AUAx0BCvF4gpU7RtFGKcPh+uskX77E7ViMTn1of+/SIsJ/
         qmnMV9lkNLylYGmGb4Y74rjDhaXAAOOsa7EDXLD0jdtpbFwve/GJ6W6HQfc0UEcuYEV5
         ueCPRIRDUXNZXCPujssK2ZkIBgssSjkNo6W9gZp3s/7BIQ9y60AGJx9IsWYk9rUAFA6F
         1l1w==
X-Gm-Message-State: AOJu0YwlpqY4Akk0dn+Gg32jaCk3M6RbBo/tfIyCsuF0Q4HL/SUZFrl/
	kpK9AYof23JDWmNYB0A4j4QgYERRtZPddDVLpQ0u1Yh1MsW3u5JEtjxXhAC6DnpmUu0=
X-Gm-Gg: Acq92OFv2TfExsC7Nm6+ArXufkIMQxPaTPXM7VZ4QkFxsbeY5hpfE3OKodaaFtgChU6
	/sppgxyDdWpZ4orWkthjxLq0o9BGWEqI8zIBSk9dLfnuZQN2jgcs+U5o6d7tk/8AwAYp2zzn0Mk
	5UOb32BZP4IetA8RpZGZw9a1vEcme1d390hlhxQHbguYeRJ+1x4seotg2wGhk34E+gf19Fruoip
	PcmLHcMG+Rb8l4+mnbr9s+zMnAhrkJEJyW0tU2LIWvaPekgpGetVwtms8McFnF8o1wz3f0GH0qE
	lwsfkagW08qxsn7Wy5LCesVg+dgwQ5LCPkxAK1lZ/5sw0xlhyjPRuQSiGxWB0GFQpwfnsyi2y5y
	1OrF6wtY8WG04MhM6DNPnieBrMqHniumw08EL0lHn8gSSvd3XSysG89kNhOIO4w7IRgxaYXz9sW
	cj/rM9+4895l13TcpJvtlnpQtl5I63qhNLkNQ=
X-Received: by 2002:a05:6402:5287:b0:674:b1b1:d039 with SMTP id 4fb4d7f45d1cf-67ef0787b80mr978564a12.11.1778234760387;
        Fri, 08 May 2026 03:06:00 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.20.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0b3bb2asm477788a12.6.2026.05.08.03.05.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 03:05:59 -0700 (PDT)
Message-ID: <f6121050-3b27-4651-9fa9-9300ad299df7@linaro.org>
Date: Fri, 8 May 2026 11:05:58 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/15] media: qcom: camss: Add camss-isp-sched helper
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 kieran.bingham@ideasonboard.com, johannes.goede@oss.qualcomm.com
References: <20260508-camss-isp-ope-v3-0-bb1055274603@oss.qualcomm.com>
 <20260508-camss-isp-ope-v3-5-bb1055274603@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260508-camss-isp-ope-v3-5-bb1055274603@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 058154F4BB5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-60915-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:mid,linaro.org:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On 07/05/2026 23:49, Loic Poulain wrote:
> +/**
> + * struct camss_isp_job_ops - per-job operation callbacks
> + *
> + * @ready:  Optional; return %true if the job can be submitted to hardware.
> + *          Called outside the scheduler spinlock.  May be NULL (always ready).
> + * @run:    Start the hardware for this job.  Called from workqueue context.
> + *          @ctx_changed is %true when this job differs from the previously
> + *          run job (i.e. first run ever, or a different context took over).
> + * @abort:  Optional; abort a running job (e.g. trigger a HW reset).
> + *          Called from process context during camss_isp_sched_cancel().
> + *          May be NULL.
> + */
> +struct camss_isp_job_ops {
> +	bool	(*ready)(void *priv);
> +	void	(*run)(void *priv, bool ctx_changed);
> +	void	(*abort)(void *priv);
> +};

I'll reiterate, I don't think this is needed and is overkill.

v4l2_m2m_ops already has device_run(), job_abort() and job_ready().

:g/ISP_SCHED_PAUSED/s//v4l2_m2m->suspend()/resume()/g

This seems like codebomb of a parallel implementation, which can be 
largely covered by existing v4l2 stuff and if not then should be 
justified in v4l2 as a new design paradigm.

---
bod

