Return-Path: <linux-media+bounces-53380-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kNkuA/YTn2nWYwQAu9opvQ
	(envelope-from <linux-media+bounces-53380-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 16:23:34 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC53199899
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 16:23:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3664130A6142
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 15:16:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7FCD3D34B7;
	Wed, 25 Feb 2026 15:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UG4nMGJy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E264D280CFC
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 15:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772032589; cv=none; b=JjufTtpel3o7nYMRmW4nK75xUW/0NnFaFLGylMp0mY6jeo06Gn79/rDhrKOje+4/Hjyr/t6V4oz5qMBHlS4sVX9DmMBmmfFlQPOxNJmTQoYEiscJ1UtoJ9oxsWP+mN4PAmP265e4WnMXpBoiIhIAG6wPi9SGEtaeoF4t6FcitaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772032589; c=relaxed/simple;
	bh=ocU4Y/l518Pc4sKArfgXwcrdLSFf0/HYSH1ABiytzwI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ewq8iV3DhBAqW+EJnbTVd+PIBzD1+/E5QY9gdYuFMJ2mH8IcO/AKtvMHMZykKUVOMOUgDQcB77AYTlXa1ACe/OCHLoFcMqsX4MSoRt8I/Ri8aEIln2pnpMLUi/pZmMcfOpVh4aoY5An/XNSEjcBiFtcd5rqLcv5Hi37PNZc/WvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UG4nMGJy; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b8f992167dcso811320166b.1
        for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 07:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772032586; x=1772637386; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/xAJ94q3mztNHMjZc3jbiXtpBw09RymxFIGR/9sV+Kk=;
        b=UG4nMGJy8HhjO/KJUswXI7AYXtQMNR3hc7hWGKjNPEOyz5VXTDU6V3kjVbaNEDhgOi
         QTHIdZdTAjabs+ZEgfG/tTFSgS/GoR2X9CdfdkVGLsMIUNpP1s4N0DALu9eqWqwn9KSL
         kzRJ2lIx9BdkxFavnyRQSK+xjj5116QHaBSxzipTgYrN7Y3Jak5y6Prrj6HVonZPVIHI
         UqFD+Jd+8Rg5VANAc9YP5ey6HAl2mQ+9YxJMR/lj2k2c6GijUpcXai5AdnucjKMKX3XN
         BLFbuLDE5b9W3C70zNxBau4JRb3HoIHl60cB8tGQrcK1HH/7W1YZjmQo27XR+c+NlgUU
         rNxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772032586; x=1772637386;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/xAJ94q3mztNHMjZc3jbiXtpBw09RymxFIGR/9sV+Kk=;
        b=Y1FgPA8bYw+KYvNdyKX6csSpNYGAxfn4ZGTtvY3WspG9SBm/qCVe40gWNsV3sXM0zL
         kWDN3AnWrRV0t4jSF8Qu/Gv4yuCdsqYlRNiOHE9Kpjg+wSvP8Zl9PF1eqwpb5i2BP+o2
         GWSgrr7Ge3/rPg3aitaL9Xj7jNNqCynyUPUaH3UJLlPwawMFttM6/0ho6YwCACid7i/V
         eaoLuLIshgZENeRjkeDxsyi8kaRmPf+kjH16YJrjQKKhKD8Z6gjeeasWvtKUltZAdCjv
         FEUMrL0XT5hsgUeAWwJ8ufZn23z+7kqwyC/gGSNhlxzjNn1U2SOY0A6uhXc+FS94asVB
         P+MA==
X-Gm-Message-State: AOJu0Yxd7huEFupsYzqkxwgYm4HNL6hSjTeRK99fa5MkEcYlf3OG1mWn
	z78H+qxbVVfHq037C/gAMPv7TPlNClRl6TqoJZxpzTn1Q/gHrSfV/U4+floCcZ8usok=
X-Gm-Gg: ATEYQzzOEqwheRLfHei45MpImF4+S37OfLy/75spmfpdBnvUMRGPIYSFYqyEG+tPPSC
	9rXJqhR7gGUnQum/Ro/T4B/vj1/N4bI7ZnUgXGjYS9MxEhxgvnFTuYtq9vRe7D53EbYmzQMWBKQ
	MW1OIXs7pdC5/UiZmvhN4MpsGJe2izezQL+JHsWOnWJ8ZPGFqhnHd8M3ecN5VKpDhJqF36aQI3D
	/3/bOcegSYs5yXBVEJwp8ODYjqRLIjp51sjBCVuKzq7hWKYZt/h9Q8rCKjKGqufu+j40nd2Ewfl
	3X7CwN9RUBFv4hZv/qPYavcCr0O3+gptNfpCCFIslC/epIsAk9f9ll7InZk0TnVAhIAl4Naswew
	uRARjNzsOFuRPzbeevdOuZ10uXODHwVm+973blO4JkEW3yTcb8MvRuncNCQXXEWXcO+77zRZ9RX
	xC27iFd5V3+23WdPKuPn5wmTgzvPyEIRFnB/icPoBLBmw77FWW3qBKIcaHCaOwaxcR
X-Received: by 2002:a17:907:6094:b0:b93:3792:4b03 with SMTP id a640c23a62f3a-b933792588fmr337880066b.32.1772032586036;
        Wed, 25 Feb 2026 07:16:26 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9084cd4adbsm526776066b.29.2026.02.25.07.16.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 07:16:25 -0800 (PST)
Message-ID: <8e922546-ef8a-48ca-bb35-08d090097e28@linaro.org>
Date: Wed, 25 Feb 2026 15:16:23 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: add myself as a CAMSS patch reviewer
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, hans.verkuil@cisco.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260225151446.766586-1-loic.poulain@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260225151446.766586-1-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,cisco.com];
	TAGGED_FROM(0.00)[bounces-53380-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:mid,linaro.org:dkim,linaro.org:email]
X-Rspamd-Queue-Id: DEC53199899
X-Rspamd-Action: no action

On 25/02/2026 15:14, Loic Poulain wrote:
> Add myself as a reviewer of Qualcomm CAMSS subsystem patches
> and delete inactive maintainers (Todor & Robert).
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>   MAINTAINERS | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e08767323763..b7a79a8fd730 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21390,10 +21390,9 @@ F:	drivers/bluetooth/btqcomsmd.c
>   F:	drivers/bluetooth/hci_qca.c
>   
>   QUALCOMM CAMERA SUBSYSTEM DRIVER
> -M:	Robert Foss <rfoss@kernel.org>
> -M:	Todor Tomov <todor.too@gmail.com>
>   M:	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>   R:	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> +R:	Loic Poulain <loic.poulain@oss.qualcomm.com>
>   L:	linux-media@vger.kernel.org
>   S:	Maintained
>   F:	Documentation/admin-guide/media/qcom_camss.rst

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

