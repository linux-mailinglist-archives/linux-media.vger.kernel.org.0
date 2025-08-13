Return-Path: <linux-media+bounces-39839-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D7996B255A6
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 23:39:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E7B91C8540F
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 21:36:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58E452F39A2;
	Wed, 13 Aug 2025 21:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OFH2tCi9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013632F39A4
	for <linux-media@vger.kernel.org>; Wed, 13 Aug 2025 21:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755120830; cv=none; b=C/RBOE36sK1atEcK1JJS/f8fpExElZJoHOV4GZqcb96CNeghqGSajlv3NjhYJ90LHvuQxJAKleI+4DGjxUzaFxRUc0uSmCnYr1SieMjP5GiaE4/say74ZfyycE8B0zLlhfaTTBPe6Xcynsbs9OUB9ruqMix6tV0wzGmrJUYB5CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755120830; c=relaxed/simple;
	bh=uTx6cOJQtxOfCRA/41WV7CyIUJyXISfLg3bbXqEPSrw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HlEOQIola0wbVRLMAuLPUeRHgjA8vpj11AY2iRDOhgpcZmo9rQmT1Dv/bdo6GVwfIhbnwmpinnWmFBDteJJBHObI4MqsEg2AUVo4Ub6jLkTQl3ed4oVMIBr7hRKxgQSgA3GSNspRTkmFJDrAoGYTU6DCILWRVBMwbjqFbrg2o24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OFH2tCi9; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45a1b066b5eso1087495e9.1
        for <linux-media@vger.kernel.org>; Wed, 13 Aug 2025 14:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755120826; x=1755725626; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mcsR2lpNDjubFi27+my/+Mvy0uMimCUXPssMeKK9hBQ=;
        b=OFH2tCi9mQ1+W/+FczKPse7GMceU9IVGVn+0B+31sqL91iWd0eruGawnbmGTEmK5gs
         957nVTD80EwQQNA8HSeRNqJA60K2OVqc+9sJvY3Q5EzllRFSQEgK8xGLt1FOwHyq6fdL
         xZXVERSySw6OSj2/MGnowBvA5+McRuG6VeH4EnXA9sfWQjkprjRO/W9rzs8mLnEqz7gt
         1WkCzGoNlXuY0wJnho5q6HGK6LR/DMDTXeyfsgcXORTQYl/yOKxoTGOFyoVPBhWdwgSs
         YQvjfYqaA9KG6o/oWlorwvPm8dFaJYOhZp8/s8DY6xVV4XEbRQFzbP6DFuEUMPXoPCLH
         QhnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755120826; x=1755725626;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mcsR2lpNDjubFi27+my/+Mvy0uMimCUXPssMeKK9hBQ=;
        b=oPZ3jNJq6KY74YcJNyrabXgfFcgbnH+uIJYq/on0b074VEZyfr68HRBsi2q1b2r0Ps
         ojBs4QhZRvklXAy4IgKBLwzeIohLNN8GcZUHvilUhfGPsR2gcZoN3EfxT4IPzvPzLkz1
         BlFQv0KXX61jTW6x1LVtZe6HM5y6WL/T69HGA7KMGHkGzu8akYfgBTD5245B6JbICalO
         JH+dZYcwF6cS+Msu3hWeTy3EsKzyfgVpC5pdxpacltUO6IKLEUrlf9E6/6N5PSsdH29d
         bdEF3kmIbrYYvbj0qm/XL1SIWYHG3cxtgGthz5VUHHflXGFiX7IdiYJLE5gsdZeSM6xJ
         gOCw==
X-Forwarded-Encrypted: i=1; AJvYcCVN3Mfn/0gKongDhWpjXl1Jhxf5Dh6L4Kzl3VE1uY4tnIyaRmB7F9nfkiglxdoo1+t+Xkw6YlQcn90XOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJpzQTi5NVtji3lIMKoyQRBVen/4pI18N1hwwJSivijN23zvHB
	gUIf7etK03JikWaKx8miZKMH92etA/GTS3hmUXo0/J1jPP07+DPhzIrTpjxZpV8mTbQ=
X-Gm-Gg: ASbGncvBW+hKTpM37+Y7aNXVWb7So+yedFtYgsaoDfMiYEFFXEGSUj8C930Iq4R8zqV
	ZR8uffVGi70ihYK+WQggM0VCUy0+vL9lX6aN4QG9opfTgWpH9KTekd02Bvt1ALyP4LHKdNKIJWc
	KN+pr3g7inOqiI03o1rPv2CyMcsetFbXWmTYdLeUzVa9dSwZ2uVjsC/uAW06TQTKRsUTpDhPHox
	ty5DlP8lIt4hDxZPHokkZIfFVbmEFsXpp8wNeFh9QJrv1w4clTkOIAVm0N4xOazVZhvVYuQNWbC
	dRBKDwvWeZ/XXBeGmxY5ldnGV5pggNJFX+YqJ8xkla+w8GKMCaTU2yvfudHias2zEehohPmir+q
	te1FH/DBcfoSBpb2iuQsEfkBhAaqGu1XS4dwdZ5R/up9RcU768IMW43fkFWaxR9+m
X-Google-Smtp-Source: AGHT+IFQrbl5wtElBhTcltssVqQElSDpYxXU1Tfejew44z/pIJJpOOHXcbKrIs4k71QsMA33PxUImg==
X-Received: by 2002:a05:600c:4708:b0:459:e025:8c5b with SMTP id 5b1f17b1804b1-45a1b674677mr2714735e9.30.1755120826249;
        Wed, 13 Aug 2025 14:33:46 -0700 (PDT)
Received: from [192.168.0.13] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1a53a5e3sm15602925e9.24.2025.08.13.14.33.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 14:33:45 -0700 (PDT)
Message-ID: <c467e3a9-2c67-4231-9d64-d64de08ec2ce@linaro.org>
Date: Wed, 13 Aug 2025 22:33:44 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] media: qcom: camss: enable csid 690 for qcs8300
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250813053724.232494-1-quic_vikramsa@quicinc.com>
 <20250813053724.232494-5-quic_vikramsa@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250813053724.232494-5-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/08/2025 06:37, Vikram Sharma wrote:
> The CSID in qcs8300 is version 690, it is same as csid used in
> lemans(sa8775p). csid gen3 have support for csid 690.
> 
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   drivers/media/platform/qcom/camss/camss-csid-gen3.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> index fc6a9787febe..664245cf6eb0 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> @@ -45,7 +45,8 @@
>   #define CSID_CSI2_RX_IRQ_CLEAR		0xA4
>   #define CSID_CSI2_RX_IRQ_SET		0xA8
>   
> -#define IS_CSID_690(csid)	(csid->camss->res->version == CAMSS_8775P)
> +#define IS_CSID_690(csid)	((csid->camss->res->version == CAMSS_8775P) \
> +				 || (csid->camss->res->version == CAMSS_8300))
>   #define CSID_BUF_DONE_IRQ_STATUS	0x8C
>   #define BUF_DONE_IRQ_STATUS_RDI_OFFSET  (csid_is_lite(csid) ?\
>   						1 : (IS_CSID_690(csid) ?\

This really feels like it should be a property of the CSID not of the 
SoC but... anyway it'll do for now.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

