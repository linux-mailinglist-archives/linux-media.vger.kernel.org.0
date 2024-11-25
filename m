Return-Path: <linux-media+bounces-21978-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B30149D84E9
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 12:57:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 531BF163025
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 11:57:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9968C199EB7;
	Mon, 25 Nov 2024 11:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YSjOOpef"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A0B376E0
	for <linux-media@vger.kernel.org>; Mon, 25 Nov 2024 11:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732535843; cv=none; b=sT+0WofowZSwPBsjJImXFusfRTf1ugzeVGUHH0/jeOev/dOP0vlkTDsP+HrImU9oJS1kYKA5R1uAgWTOMS/2GZvD0b4SEpQe2eEI8EL8xvqXx4oWoRixrW8GoSnZZQi92YZJmnu9LdltwD1wjUT+iBF5gXTjcvH76Z3Hn28RQRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732535843; c=relaxed/simple;
	bh=kILxfPL3dcoFTEgvPSkAfQOYtmQ0dsIeqD86prk+2I0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FZqyASAUL0bTBAQhrqvgmtDLCnCBxfibOAHqLiYakXjn3YCql2Wx+bHuBaBEP2ruclYEW0B1NFab8VjXCn+VIY2+4PyZ/tvrs3ylGvk96uAMJFpMkY74rmU91Rftwx4YZrl7+DY2qT8WDBmKUUbb4jBxqX2aTnSlgmyEo+LGK3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YSjOOpef; arc=none smtp.client-ip=209.85.208.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f193.google.com with SMTP id 38308e7fff4ca-2fb5cdabac0so2063351fa.0
        for <linux-media@vger.kernel.org>; Mon, 25 Nov 2024 03:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732535839; x=1733140639; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+KtFQm4yfSYkfhhIvB8KFwyzOv3qtl4+nYPNp2E79ho=;
        b=YSjOOpefg6dAE9GktTl6ZKktdSE3Ks5OOWDHPdtKyyaORZnVz7cPHZ9ZWvzZnT7TuT
         YObqDE0EpKIxQ6Zz8g5L86JcqhHQmaEZfEFBP5EcnW6SjKeVxYICUtpu9ykdC5MQX3M1
         QrNRLS2mNY/jFdYR3up/xk85Zz7DnyHIApgyrhjfKz+aLW3SpcLqHPoTUPG4KpWYcFl4
         CQbfVJ1fyEicU/zNYMO/y1H22wl2MZLxaWgpc7y8jU6Qork5LB6GrojyiIF6nUUjSoe8
         2lwDqd60haY3Lp1hYYd098n6jJNk6YrI8yrzGWH28CwZCcnAU+4U/zdOpmVpjjT+Gc/4
         WRzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732535839; x=1733140639;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+KtFQm4yfSYkfhhIvB8KFwyzOv3qtl4+nYPNp2E79ho=;
        b=okzWp2uQ7SjfevVXK8ZtPMWpqcT0JHHwWhzVps3jwYnfku2PwSBRp74eCCDT/KYoHZ
         NrBJ0vX2sLjgw5jr8ifMTWf1RNoA+rvMQiPLRHUAzjwcKBnWRaLFUTptlJuPp+LSOK6E
         np1E3FF00RS6s4SLdzIQzmR837OImjZKsIJYctKTHiLAJK/VAEGjDXmGVm+nD/sKwSNc
         xCP1RckgM09pOgcRQYsUiffA3YH54j6Re5dXCV7tp3/XAlfAMpdBPFdxuSFwpOOotV2m
         I6+t2iXpTA25jA43c7aBy5l1NdN24AfMT+4juAMSjOeJLTQ4VORz1wyJsOFkjhgygYAS
         6uXA==
X-Gm-Message-State: AOJu0YxdgCED2LryhfVb7arqsGbkXOv6tjHM9iqcDOYdXXQgj/CHMrje
	i9D7H/Djzrq3aQMGuyiYyJhPC19v9sy1YnSgMBjptBPIFvfHkp4VYcFNqQXPPnw=
X-Gm-Gg: ASbGncup/EVdjwliZ5RDAIHA5GcWqDN1tnc8J3SvmWyMJqwLRxleOq83lQAX7/KoWUY
	1ex8tbp604gsEEyVVOhtVcfnFp9JRw0vvtqObm1hzuAbyTgb4ALkoDZCERiJT/bQ09yupHp3FMA
	2AiBBVutGWmUhuHGrP3+G42m3jkRWu1jVyEGKjaK3/fuzyMDFUDpUNiyIgGdDa7z1jiuynE6JId
	xuml5ln4YOHc909kPAL7xpITKNpILHn6x+smvgYyE9kY0wwduGG3Yd/6C2gIZCpYSaj/3iRuJQO
	njXQfEt1TfkFLmma2dhtyaOwR3HF
X-Google-Smtp-Source: AGHT+IHNiHpUib9cbIEp9vFtClnvik1BHvDf3MMHQDLa/wfG5jjn9JO3VfQWjVKdCea/NjqKmbaD9g==
X-Received: by 2002:a2e:b891:0:b0:2fb:4ad6:a5fb with SMTP id 38308e7fff4ca-2ffa711f089mr18571851fa.6.1732535839297;
        Mon, 25 Nov 2024 03:57:19 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffb8180bddsm7991461fa.96.2024.11.25.03.57.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 03:57:18 -0800 (PST)
Message-ID: <b27fe267-c722-4133-ad7c-bdb1ff573ee7@linaro.org>
Date: Mon, 25 Nov 2024 13:57:09 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] media: qcom: camss: Re-structure
 camss_link_entities
Content-Language: en-US
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, bryan.odonoghue@linaro.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@quicinc.com
References: <20241125103457.1970608-1-quic_vikramsa@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20241125103457.1970608-1-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Vikram,

On 11/25/24 12:34, Vikram Sharma wrote:
> Refactor the camss_link_entities function by breaking it down into
> three distinct functions. Each function will handle the linking of
> a specific entity separately, enhancing readability.
> 
> Changes in V3:
> - Broke down the change in 2 patches. first one to functionally
> decompose link error message. second to restrcture the link
> function.
> - Removed the declarion of camss_link_error from header file.
> - Link to v2: https://lore.kernel.org/linux-arm-msm/20241112133846.2397017-1-quic_vikramsa@quicinc.com/

as I said last time I don't see the value of these changes.

Since the changes are non-functional, then hopefully there should be
no issues with them, however I really miss the point of adding 65
lines of code for a questionable reason and at the price of increased
complexity.

Is there a good reason not to drop the series?

> Changes in V2:
> - Declared variables in reverse christmas tree order.
> - Functionally decomposed link error message.
> - Link to v1: https://lore.kernel.org/linux-arm-msm/20241111173845.1773553-1-quic_vikramsa@quicinc.com/
> 
>    To: Robert Foss <rfoss@kernel.org>
>    To: Todor Tomov <todor.too@gmail.com>
>    To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>    Cc: linux-media@vger.kernel.org
>    Cc: linux-kernel@vger.kernel.org
> 
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> 
> Vikram Sharma (2):
>    media: qcom: camss: reducing the repitious error message string
>    media: qcom: camss: Restructure camss_link_entities
> 
>   drivers/media/platform/qcom/camss/camss.c | 195 ++++++++++++++--------
>   1 file changed, 130 insertions(+), 65 deletions(-)
> 

--
Best wishes,
Vladimir

