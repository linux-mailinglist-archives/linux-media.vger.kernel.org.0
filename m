Return-Path: <linux-media+bounces-44873-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2C5BE7E9F
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 11:56:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DDB3719C107D
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 09:57:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85B772DC357;
	Fri, 17 Oct 2025 09:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y+psuXfM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3057E2DAFD7
	for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 09:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760695005; cv=none; b=Z5mSK1OZaB/ZZdjpQZs6Xlx1AP543UiQV03XsaQ78cKlloB06JWo4Y8GlHi0DK8aHCG5sWE984ZL5H3Ej1tdS7pyoNM57luJwYsUfd8caqFPe5u/BxrRzndlxBWgHaVDYYMr7QcO8SuH4yHjSwhII15oOBgjvk1wPj8ZNDBHSog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760695005; c=relaxed/simple;
	bh=6qR0NuRYQ+bd1nXrohwHgTHeB2izojcTE3yTCQT3Hh8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A+N6ElMy6iC5ADM1ABj8Jwt6s364SRhxoTkZjAi9uNgQmeZLLhMOA1x29B+M3sNdE9/O2HIaM2wOeiEEj2UpHC5ClrsnDRj6TkvCorPBnQNkm0TgDzTc8I0A3HSpgRu46R5D1ySPD+Ke3cmActbEtqm/DF0L3TZZmTW7stcC9qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y+psuXfM; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-57a8b00108fso372313e87.3
        for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 02:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760695002; x=1761299802; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2GXi6Ax4xUuc/O76MAiPOqKbogCxizNvxptAHOFcxUM=;
        b=y+psuXfMNZTy3F5P5tY/hqQD0JdwzSa3bFPkHJlXsbGGwMxd/LSgb6moP8kPn2DpnS
         BrZQWjpoGsmKKBmeh1e03d4YByuK6VcnQPqCq2MpA0cHRL62u7d6Z6qy1Ly9NwgenjY4
         viW8d15p4wQP1LdyX4VfAs01j0kUyA9xOThB8tYisZpWsvsYGeTeQF6LGDyn6jR3LhvE
         eG3LeC9eDLA1ujeHLDM29LmqDudiBeKm60XxXlB5FEDCmkBF3StH6kqXh5FbipJb3BY+
         3OTTYYNtE1fcIRcQKqGtPFROhjcnVabzyQ2Os3URfwePpKaFIwga89L+Vc6iK8kw/o1H
         bbYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760695002; x=1761299802;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2GXi6Ax4xUuc/O76MAiPOqKbogCxizNvxptAHOFcxUM=;
        b=sJvTbgnkQUOnULkVDFz3K19GN2jdC80P/myzEv1nHQAmqLmcAnt4R1Uf/1np/cqH3J
         fvxXWQQiljL9gyKdpd0NMUc97qDq/CPG2TT0R2iwu96jxm0azoldhXkmMMLCOoXWsQ1R
         RKmrnNpk91EZEKFVL1F1HhhVGC/ngLJ1SWK2QTwNgFVmhaOJtVz3wXAqJvItNWa9LQ6c
         Sx4CGQYGbmONdRuMiS+tpPeCxqb/vUOeutfZJuwiFFTohjGotKoGREKnnypuNrxR1rR5
         mdBreu72cHsfmDV12+fxnK/hp0PHhog39gCRj/Ar0hR/AQ/7dMGlGPJtk9jZh6VR5PXd
         SVEA==
X-Forwarded-Encrypted: i=1; AJvYcCWb8a6llmRzy/Wk3BipHsOrDh/fK90cuZLYv0TGfwDeIJvcj7/uYrgv9vyohNkcMMpt2ykkhzq3Jk3UYw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxD+dGHeqI6BfjeXmEj0q6xber41our7k2gf40mKqdYo+p0qNxL
	Jeayu6Rmd4JWFuG+uh60aU9pJuRFKjH1Yg2hOxXsWYmF/6bcDYSNXVokGm+99Ha/1Zw=
X-Gm-Gg: ASbGncs4f6SxINy8qGtlwEgqEgCf3wWM2/Xmb1mXO7Wlp24EIO6yeSSeM4asXiUUBLb
	shHY8fA+2u9jgQoSrK8lcBD5jZYbyzCAi30Lhdpz5lhSwdhvsDt3UMn3kTrKKtHT4P1Oj7rBl3u
	EFVoA+OxvN3U3MZWEOzV1SRhsviDjb9huKilu3dP6d3bN7F+n9gcR2gZfm8jZ4uZnmT1nZhcrs/
	1JFBzdgF5Sp529iLsN6U2X6xEetwCzi9r6ji0XtWzO4lvsFrdJ5X3iqcz9imrvLrAODbqr0CVXQ
	CD3MIbPZb9IJ+m81OtdhaJy9rJ3G1NKwx1U2zDPeAQ7P7K/pRZHQ75wEfIwwiwuvp/lsFxJ0X/W
	si6M6AKDvPz7Uv9yE/1A/jI6ssZlXMtnX9aFPqYeigP4E3A1uK86VQKf4VJjwARUT51vdC/cndQ
	PkN1OZjPtIBHGpSKTE5GaIHVzz3cs9Edat9cqYXLPDy28tMI/WlH6rWjc=
X-Google-Smtp-Source: AGHT+IGAZ5CYugbUgk6P/NUNsSpjV1iSJD9ABIKrrzr/2GQtBVeEEAoj0LM3E1ItWcJjo0+VtHVCpA==
X-Received: by 2002:a05:6512:684:b0:585:805b:e3b0 with SMTP id 2adb3069b0e04-591d85ae86fmr686720e87.9.1760695002167;
        Fri, 17 Oct 2025 02:56:42 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e688dsm7747393e87.13.2025.10.17.02.56.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 02:56:40 -0700 (PDT)
Message-ID: <5cd4ad76-8aa1-42f8-81f7-e5fcc895f693@linaro.org>
Date: Fri, 17 Oct 2025 12:56:33 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: drop unused module alias
To: Johan Hovold <johan@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan ODonoghue <bryan.odonoghue@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251017060435.8524-1-johan@kernel.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251017060435.8524-1-johan@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/17/25 09:04, Johan Hovold wrote:
> The driver has never supported anything but OF probing so drop the
> unused platform module alias.
> 
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index d9d770e5e7c6..c93aeeb5ab20 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4545,7 +4545,6 @@ static struct platform_driver qcom_camss_driver = {
>   
>   module_platform_driver(qcom_camss_driver);
>   
> -MODULE_ALIAS("platform:qcom-camss");
>   MODULE_DESCRIPTION("Qualcomm Camera Subsystem driver");
>   MODULE_AUTHOR("Todor Tomov <todor.tomov@linaro.org>");
>   MODULE_LICENSE("GPL v2");

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

