Return-Path: <linux-media+bounces-528-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4877E7EFC90
	for <lists+linux-media@lfdr.de>; Sat, 18 Nov 2023 01:32:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1F6E281455
	for <lists+linux-media@lfdr.de>; Sat, 18 Nov 2023 00:32:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB033A3F;
	Sat, 18 Nov 2023 00:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lYqCknMv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B824A10C6
	for <linux-media@vger.kernel.org>; Fri, 17 Nov 2023 16:32:35 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-9e62f903e88so334353166b.2
        for <linux-media@vger.kernel.org>; Fri, 17 Nov 2023 16:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700267554; x=1700872354; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ACuE1Cjpg+/+S3TvL8RQf3mAriRh2LNm7WasFktjKbM=;
        b=lYqCknMvnM8+KV58ELIXQtx4h3aqdNuogmXFOwmrayV9kKnVc1P2WB8/sIkyXIYHdF
         wAOj5luskMzTNGGbNRLw3AS8QR+uJJHsnjrPdlw6iHfgsCc6t48L2GOuiSZHTNlxHRJM
         7iYgn7h87DllvW/7CXTg2JXT+jX/S2Ux6xreQSGeGLcuEbo0DZQ78u0VKapTy0rxN7uV
         ZmnTITe6dwFbeCS09EK5S6uhLPMG1/xtGfTR9Myt9WEvrVpg0NGmyQ4gqcmYHW0RfonQ
         Ao+S+ExoZ7Iz+zJklR0LtqGtK0d1ok+0OBC/GB5m9op8miaoj7KRMblBx2R86fFf+7Pr
         6+Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700267554; x=1700872354;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ACuE1Cjpg+/+S3TvL8RQf3mAriRh2LNm7WasFktjKbM=;
        b=NJ06WWIqr+Gmmo/MG8f9B8iolPgvAnlC4Ft2VpzBSMvf6hfoFvvrLyBobFIAcVUC9X
         ZXGsvODKknxkOSemgzeAoGIWDGJE1wCU1u6AYdxZS8yr1HbZsRAz/6BMqqL/GxNHL0kh
         BrKoaXLlaiziHdekDvTsKc4jOV4TcIiZoomkr8QQQOcv/U0gcsLIO4dIAT+rOXs7o6lr
         DE1n4Je/2xWSasFyHXQMC1XP1Rw8vyMrp7P80Dc1ZjFJnm1gaIOPAqVnGpc3f3K844y4
         z4iRgVxbpaTg6FeiCsCQZ9k7peKbf8lQ+CWFfUBHPXkD9FJQKne/Gy06BHRisgIQ/a9J
         MH8g==
X-Gm-Message-State: AOJu0YzM6TTeGy9h1erfO/LIh7lJfWuJP1NK/IOMu9kANWMQk08vIxEn
	PoDWXxESPcJZMCq7JHKLSO17yQ==
X-Google-Smtp-Source: AGHT+IH2neK8i+4Zeth3crgZdPw0mhXcfQVQqJTSVY6vp9EsHL0jduvcgyLBRLTSwNAQNErhC2Uk/A==
X-Received: by 2002:a17:906:5352:b0:9bf:70ea:6926 with SMTP id j18-20020a170906535200b009bf70ea6926mr662922ejo.2.1700267554094;
        Fri, 17 Nov 2023 16:32:34 -0800 (PST)
Received: from [192.168.201.100] (178235187040.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.40])
        by smtp.gmail.com with ESMTPSA id w22-20020a170906131600b009de11bcbbcasm1318413ejb.175.2023.11.17.16.32.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Nov 2023 16:32:33 -0800 (PST)
Message-ID: <0fbef967-62db-4c5f-8108-2c545c53a39e@linaro.org>
Date: Sat, 18 Nov 2023 01:32:31 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/7] media: qcom: camss: Move VFE power-domain
 specifics into vfe.c
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, hverkuil-cisco@xs4all.nl,
 laurent.pinchart@ideasonboard.com, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, matti.lehtimaki@gmail.com,
 quic_grosikop@quicinc.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20231103-b4-camss-named-power-domains-v4-0-33a905359dbc@linaro.org>
 <20231103-b4-camss-named-power-domains-v4-4-33a905359dbc@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20231103-b4-camss-named-power-domains-v4-4-33a905359dbc@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 3.11.2023 13:29, Bryan O'Donoghue wrote:
> Moving the location of the hooks to VFE power domains has several
> advantages.
> 
> 1. Separation of concerns and functional decomposition.
>    vfe.c should be responsible for and know best how manage
>    power-domains for a VFE, excising from camss.c follows this
>    principle.
> 
> 2. Embedding a pointer to genpd in struct camss_vfe{} meas that we can
>    dispense with a bunch of kmalloc array inside of camss.c.
> 
> 3. Splitting up titan top gdsc from vfe/ife gdsc provides a base for
>    breaking up magic indexes in dtsi.
> 
> Suggested-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> Tested-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
[...]

> +/*
> + * msm_vfe_genpd_cleanup - Cleanup VFE genpd linkages
> + * @vfe: VFE device
You can even give this an upgrade to kerneldoc! :)

[...]

> +	/* count the # of VFEs which have flagged power-domain */
[...]

Personal peeve, but this comment seems a bit excessive

> +	for (vfepd_num = i = 0; i < camss->vfe_total_num; i++) {
> +		if (res->vfe_res[i].has_pd)
> +			vfepd_num++;
> +	}
>  
> -	camss->genpd_link = devm_kmalloc_array(dev, camss->genpd_num,
> -					       sizeof(*camss->genpd_link),
> -					       GFP_KERNEL);
> -	if (!camss->genpd_link)
> -		return -ENOMEM;
> +	/*
> +	 * If the number of power-domains is greater than the number of VFEs
> +	 * then the additional power-domain is for the entire CAMSS block the
> +	 * 'top' power-domain.
the last 3 words seem out of place

> +	 */
> +	if (camss->genpd_num <= vfepd_num)
> +		return 0;
if (!(camss->genpd_num > vfepd_num))

would probably be easier to follow given your comment above

Konrad

