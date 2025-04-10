Return-Path: <linux-media+bounces-29911-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A65A9A840BA
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 12:32:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78C179E7703
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 10:27:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A66E284B50;
	Thu, 10 Apr 2025 10:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jgASZwpO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A61280CEE;
	Thu, 10 Apr 2025 10:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744280712; cv=none; b=vC/wIrPSFYQrx6d+WWEcdM7b2vmPTkoIr5W+coN7nVngqU0JqtyzRYLsd1Lscyda+P/aLrj4vJVqR9t4n5D8rejulEs9rMDXj+LI3LrA3V8MD4zwHXa6g12lauEUfkMmNiLl/m7CjylgaaD51j6TxIz/iCp29c02vhNrbaAEaMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744280712; c=relaxed/simple;
	bh=ojvsqPJMH10Y8wTUS0jE9WvNAqr1SQfDTcZQoS3T2to=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DZql26yCqcKO+bUVylWOdbgclEbBqrt+/iqXwWZH8/A2Aj5bctf1yN0P6dva9863Rilvno+8L6QJesbisymJFA1h+fgxavdzZRbJLd2Ubk6nxdxABDmgISKHHXi+V6G02EiJDcfNvv0WwXKRL3U+UiGIFY4t/+EV6CPTger4gVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jgASZwpO; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-548409cd2a8so811512e87.3;
        Thu, 10 Apr 2025 03:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744280709; x=1744885509; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a8auZmcSStHaFyZmeRyJlcHZ5L0m1cOxAuHCz1LgQ8A=;
        b=jgASZwpOYg3+AF2/rUh8yq34zcClUSfC4QYELwU7t48hEJN0uwLoz66lmk2h2Ed6Gf
         qbZXCVT65M2aAC8kVE0juYKfduKSVRQeGr2RnoL1qSOVyhEAcFZpKZvkhPyKPGoEy6EH
         nGS/gen3+AQeMFO0+Yt7cwKVEGu9pL2ZX1FwaEPhcEUceaK6pqgrLbijO9jMgAyLTwhL
         8Dk8mlVP7TDAA97isM7g4wiMBlJAK0wIYnICqyNGHRyMZM+EZFtxnMWgrAwd3WA38F2w
         Dq531NLFtLOe81GvdVMonbApR2duTPveYAtclJCL4+/iEScjTrGes8/d+UCm18r+kNIG
         MWiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744280709; x=1744885509;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a8auZmcSStHaFyZmeRyJlcHZ5L0m1cOxAuHCz1LgQ8A=;
        b=GOgpw4JGsYwot4wnA4/eHTtZhvr62oJQOipnOXoEkx0ujLOiJi4m/HnUz/+sOMwqkn
         8QVbX5SXRLswKSOKrsPYqtsbE5tN89wfs/zbtCoeGZZyg7t2IVQ/btepevvGIP6lNXi1
         aQlY+iUx081rVoYp8lNuKNyAI21B37pK1D1YBtpm04F/2EgvwQL495AdGT0BPs9aR/tj
         SkJn3Xwlw5NjsYn3ELW9Dgm/S0ubsCPMjVVVolyIwIHxN9fGaqp2PO2DZw0T0xDkdKda
         BHGEYqq4lC6tNV+2V/cvLv3+Kcr6fKkF0yizWoTdz5lliL+/ap8XbtWVayHrfjt5f/Y5
         tNTg==
X-Forwarded-Encrypted: i=1; AJvYcCUYwBJ2Ja5h1CYSkfEUh1Vrc4PCFvmvFWj2CbvRTKE5OYx3WTX4YiCG7Tka5509narIeCkojNaRt2Sxe4A=@vger.kernel.org, AJvYcCW8tXFtE33wXVFZTL1Ds2mdk97uZNmeAOVVoxqw8n02DcuIW+GxAZdNahEYVf3qZv00OhKvfndq/9IjwWrf@vger.kernel.org, AJvYcCXqAFLVefcuesrwletIBsao9pAjYi6fLmdNfrmSR6evrHTFJBrMLL9o6Ud/zMWdEOcfvHVdANyo+reoOhi5@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+gHjedeqvcXKkupRxwH/kUS6rfXxYSrQupmrC95ncoTQXxM0Z
	3ertZmfW6eXjepBboqzq1akJPmnS0Us+r16sAq0WmwFa4aCi1/Jd
X-Gm-Gg: ASbGncu7s7frlz6DE/8GgtvA30WyEdM3hOIO19jVnBuF7qDe7JcXbsPvu9cxDoIm93Z
	TMIFexo74ITrcPyyUneLNLxAvk7u/F7/C0aCw3VxwcLcFGxJNfFGxpOcB8sbyiJCFqYMhUhLGId
	Q1MGSRWClqk5DccpS68TIxEUieHLjvC8TC/PHy8elGcehmOvK9v+ukhkxuHxcPzeMr5uaOjLdfg
	azHKPl4kLfLk6J5Md+h5KgMQ7stGGX5FIFWh0Jv5v2CQGCou2H+QXFcUiWfPKP6gmo+zPju3FDs
	oFB8AH3e7JuVmPfkKd81qkhR3jCP0DIavwYN+aRDGnt7BMXmD+QYRUq+zH6zXKLL/NuMGOZLH/9
	El26vAsI4DVc=
X-Google-Smtp-Source: AGHT+IEwVGKKFkCzb+1V2/2bVJ3HFsoAUJbqQMpsvmmbIr3Uj/Py/Tz5fCl2Plbl8TB01lRqRr7nDg==
X-Received: by 2002:a05:6512:4027:b0:54b:ed9:2cf6 with SMTP id 2adb3069b0e04-54cb6844d88mr702100e87.32.1744280709001;
        Thu, 10 Apr 2025 03:25:09 -0700 (PDT)
Received: from [192.168.1.19] (79-100-236-126.ip.btc-net.bg. [79.100.236.126])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d50f794sm105392e87.167.2025.04.10.03.25.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 03:25:08 -0700 (PDT)
Message-ID: <9d89f87f-ff30-4ae9-9545-08d222e96561@gmail.com>
Date: Thu, 10 Apr 2025 13:25:06 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] media: MAINTAINERS: Amend venus Maintainers and
 Reviewers
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, hverkuil@xs4all.nl,
 quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com, mchehab@kernel.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>
References: <20250402-b4-25-03-29-media-committers-venus-iris-maintainers-v3-0-2b2434807ece@linaro.org>
 <20250402-b4-25-03-29-media-committers-venus-iris-maintainers-v3-1-2b2434807ece@linaro.org>
Content-Language: en-US, bg-BG
From: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
In-Reply-To: <20250402-b4-25-03-29-media-committers-venus-iris-maintainers-v3-1-2b2434807ece@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2.04.25 г. 15:24 ч., Bryan O'Donoghue wrote:
> Stan has stepped back from active venus development as a result I'd like to
> volunteer my help in keeping venus maintained upstream.
> 
> Discussing with the qcom team on this we agreed
> 
> +M for Dikshita
> +R for me
> 
> Many thanks to Stan for his hard work over the years from originating this
> driver upstream to his many years of maintenance of it too.
> 
> Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 29b4471574982bf3f8d03158cd5edcb94bc9fab9..1d03530f3298703c5f3d025010511451f878f822 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19590,8 +19590,8 @@ F:	Documentation/devicetree/bindings/usb/qcom,pmic-*.yaml
>   F:	drivers/usb/typec/tcpm/qcom/
>   
>   QUALCOMM VENUS VIDEO ACCELERATOR DRIVER
> -M:	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>

Acked-by: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>

>   M:	Vikash Garodia <quic_vgarodia@quicinc.com>
> +M:	Dikshita Agarwal <quic_dikshita@quicinc.com>
>   R:	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>   L:	linux-media@vger.kernel.org
>   L:	linux-arm-msm@vger.kernel.org
> 

-- 
regards,
Stan

