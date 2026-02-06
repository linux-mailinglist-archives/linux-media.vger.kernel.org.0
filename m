Return-Path: <linux-media+bounces-52287-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id II+YEgfQhWlBGwQAu9opvQ
	(envelope-from <linux-media+bounces-52287-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 12:27:03 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E24A4FD3AB
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 12:27:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5DF96300D0CB
	for <lists+linux-media@lfdr.de>; Fri,  6 Feb 2026 11:27:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2C493A0B13;
	Fri,  6 Feb 2026 11:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ONImB0ez"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE095376481
	for <linux-media@vger.kernel.org>; Fri,  6 Feb 2026 11:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770377220; cv=none; b=a/qGB0WZ7od6TvYjCB2sdMLLs8PPLi9wuLGkmSceAcTyRCtK0uzv8EiumD39OnkFpXwHliuYvDj2KOMwliyBgvGZDEBy2ctWvYdj+ChrXCHRWeJcMVcXlA50EwTmMB39caxkB21pIABNAEdmzm0HqAhvEOOK7+Q0222S7l5owtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770377220; c=relaxed/simple;
	bh=Pv+4mxHOkuQGdUlGt/TWxFbKeqDqXomI1Q3G96+VfbU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M8kS5fZiG8VwXdWA+ZmOums3xUt1RH7dg/R7lLfTEp3V5MtUDoG+VvQdxv6H9A1FBq9rOzKE70cOQD+72YM7UO2YgqH1XK8W0iH365a0/CqUx5BFL1L+IdkjiWukZZBJbaJuEmdIZqunQKLY/afhDLAmmjfS/g8Cc7EhmIqk4mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ONImB0ez; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47ee937ecf2so19248575e9.0
        for <linux-media@vger.kernel.org>; Fri, 06 Feb 2026 03:26:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770377218; x=1770982018; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kwf4O/lyGf9gvN08ToIQWPbaXEEjGuvKl+rS2tkfhIo=;
        b=ONImB0ezxDkENZoi5K6K4rjKByrChUJ6OJpRljv+GkC2kuVz5cXbpHJ0JI3TOigkRH
         uwOsxVH/5DbX8KODdlbYz7kc7uOaKyE15TyjCkqXDaq56P5mLjz/3l/Cp0fMvqmaokm+
         PJ4SfffxeXcRQ7Dgt0UkfCyubvdh6VaVmB4xaGLtM+m25b+YB18aUGkMZLGk5HapIhWS
         Scz4FQ0NOUOSHB2oiHJqqksH8v/lheMhbPdTpDDMrcjWlfOErXXFxmEfqVttwP3H61w9
         QA59cmEPPaqgQaVpWdRT3O4UZIvOZow4BNxKDUpd6pq0Y/I+D1KnFsdWJiwxfed2ITTr
         PC4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770377218; x=1770982018;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kwf4O/lyGf9gvN08ToIQWPbaXEEjGuvKl+rS2tkfhIo=;
        b=XfdU+M1kUG83AmTJP72XWBSgpZvDJWK+6qYHD8wVWsX1eUkRG4LzWW2CZ0YLg68miy
         +Fsqil6MAR86BvHN1NiC7i5DWF+c7NVjY9c1DU9miZgmJaJEiG9Ctvm1K/f7ecqaO1zw
         rWXYEgAiMUPAcl0OaE5CPR4BhaeBMiMwRKhtA+F685vHiYMbEN6PRpJvWQzZSrbfX6bf
         /bK0KQYbYZSv57/0Ox+L4t3QiWtxz5YaXCtiG/UI/o+0ug0THWjakdE+mwDqMtCJ1ROq
         hNkpE/WVeA6VXYbf2gfWPH6IpHq5tap1mxymCIes6atXOy2KIwJ1wUMCkVH3+fU86VQo
         tOtw==
X-Forwarded-Encrypted: i=1; AJvYcCUT30F8IaumWByKhk+nqzTKISc6APWkhj5ZGYsCcNORSoNNvfyqLlCoi0GPPn/IzOcanAAuaEDlTBIF0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNwhn3gM+zcM2CA73eFMViHfUI6O66wb7iEif8ix/7jYnBR2jt
	GahU7RNdaZXeoldqD2BuZQt2o96LviNjdhek1fV6Yqgl9wHHStt3M5ZqnrGma9D6q6Y=
X-Gm-Gg: AZuq6aKD/xGkYOrvXBoVBadbaiYV/uSc5rTy7jkV44iSzIX9dpsrYUU/LM/3XdIC5Cx
	3muCxMLCV7IQxay9Y8jtCmkdeK5LOk9+oCvq/tvhxIZzfKDTBv+ICUSesfDOr5/Si7iAzuiuNrQ
	RGcTo4+TpwFvPfuxUuyG0dQtlVm+tDvicVk2cfKeAI9I3YpPdTXH6ySOc6Ulp/B4wxEdsqC0HBU
	x4/ik6jV140G4SciiDvAltx0t66KB9DOcyq/6xXYRDdRDp9j4mW8t7cIqtd6nnx1VgHTG07eluu
	/LB9XdhcVMHBvX+Xl+6Z2pLJDKfXh1e0IHR6osU2QNFXFt5gfe8bK61gAYgAxv9mHJgKAj8QQY6
	RSfDrxbQK8/eIadCPDFtymvuxIM6WWdzoHUUk7yBcwqIFn6pMlQJsxZkDyDrAJfYlQhj6IwHOlA
	/i+kL3XlQchB90fZuVhCt1nk4iy4VLx39i64dSFOBRDLt8So49C1UK
X-Received: by 2002:a7b:c3d5:0:b0:47e:e38b:a83 with SMTP id 5b1f17b1804b1-483178ebf8emr55909675e9.7.1770377218103;
        Fri, 06 Feb 2026 03:26:58 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48317d299bfsm111548255e9.2.2026.02.06.03.26.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Feb 2026 03:26:57 -0800 (PST)
Message-ID: <302a655c-ba75-4fe5-80ce-2a38941e25bc@linaro.org>
Date: Fri, 6 Feb 2026 11:26:55 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: iris: fix QCOM_MDT_LOADER dependency
To: Arnd Bergmann <arnd@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Hans Verkuil <hverkuil@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <oRAGaDzYfKTWx8kKFDLQCghV3xwo2mXzA_JDjN9wyNZDdL1X33zlO7mPy2Nwx1aDr1-jdIe8WGE4iJDVwtw2tA==@protonmail.internalid>
 <20260205145623.1360105-1-arnd@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260205145623.1360105-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52287-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:email,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Queue-Id: E24A4FD3AB
X-Rspamd-Action: no action

On 05/02/2026 14:56, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> When build-testined with CONFIG_QCOM_MDT_LOADER=m and VIDEO_QCOM_IRIS=y,
> the kernel fails to link:
> 
> x86_64-linux-ld: drivers/media/platform/qcom/iris/iris_firmware.o: in function `iris_fw_load':
> iris_firmware.c:(.text+0xb0): undefined reference to `qcom_mdt_get_size'
> iris_firmware.c:(.text+0xfd): undefined reference to `qcom_mdt_load'
> 
> The problem is the conditional 'select' statement. Change this to
> make the driver built-in here regardless of CONFIG_ARCH_QCOM.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/media/platform/qcom/iris/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/Kconfig b/drivers/media/platform/qcom/iris/Kconfig
> index 3c803a05305a..5498f48362d1 100644
> --- a/drivers/media/platform/qcom/iris/Kconfig
> +++ b/drivers/media/platform/qcom/iris/Kconfig
> @@ -3,7 +3,7 @@ config VIDEO_QCOM_IRIS
>           depends on VIDEO_DEV
>           depends on ARCH_QCOM || COMPILE_TEST
>           select V4L2_MEM2MEM_DEV
> -        select QCOM_MDT_LOADER if ARCH_QCOM
> +        select QCOM_MDT_LOADER
>           select QCOM_SCM
>           select VIDEOBUF2_DMA_CONTIG
>           help
> --
> 2.39.5
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

