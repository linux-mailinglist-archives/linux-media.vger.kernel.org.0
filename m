Return-Path: <linux-media+bounces-38995-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F74B1D28A
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 08:35:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 31BC9560F79
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 06:35:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1AAE221F38;
	Thu,  7 Aug 2025 06:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lIxgQMWr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FB6212FAA
	for <linux-media@vger.kernel.org>; Thu,  7 Aug 2025 06:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754548540; cv=none; b=VbuSXhae8K8kEW6iIraKGKjr1a2139M9s4GNJXPgesCTPVgqm/KnVVb7VJ5asMfo7ranXDemhFojoDcHWLeH6fSK6IYyxRzWzJRTYkYOe6BKlyhTA4HM1odYwktL1SGnKnS6qKb1TCoAORDhvg/b5CDK+40VaGWBwse5Sn2MsD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754548540; c=relaxed/simple;
	bh=BFDv8KwOdxE5b9FJvxGKqE2UTyIruoDsFRiENIG9Q+Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bhLy9gsrXOTIcyp9JCLHeN1m8uSwrs5mL1eKHQTrkMLx78liy34pPoSZPxb91r5DL+6mLrxUeIYvYvpfpGGIx7LsxOgGlHzodhcA9MHxAfEKUxNxBnMye5p09PdOlGmo1rgvExQ9zAcdg6XlTaVXstu4LtJ3ahsKoNRRmhakAKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lIxgQMWr; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45994a72356so4824495e9.0
        for <linux-media@vger.kernel.org>; Wed, 06 Aug 2025 23:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754548537; x=1755153337; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R87XAIEmPfqrUnpUN7cuFO3Ri3HR4f4oxIPKr+mmdB4=;
        b=lIxgQMWrE/7IJj45biPk+YrbgBjz/x9MOf9EQK8H7azA3vxio72tu3SHuQhJnzDWjq
         r6q/Ftyq7c3O2TuvysUGLgqfzR+N7wBLcA3boh0qnGvH8PzngM3UauEfOvJhb7FRJqvv
         eFZ264lC5fWS2NFJo/cdUmezrj8ir59fZqxLD1McOLCwW3qVzZcsU24nzPmBQpPShpDD
         kLrfpjo+B2P3I1ytu//kX4QvPLsn8QXuiuSSQERWh/7TDQ1oj4wc7e3kLyEfab8mVJem
         Mz0x8PrnQyEgVFp+iI4ODNv0fzC1oXVbs0PCkqD0y75LN9kjlxBVUQLWJ5bcHwBXdNQT
         D+Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754548537; x=1755153337;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R87XAIEmPfqrUnpUN7cuFO3Ri3HR4f4oxIPKr+mmdB4=;
        b=EN22pIBXpw+7kkZclrVwRKtRCHCAWWPWuX0vP3kMvDUgyjWrel1jaMQspemuKo8I/2
         ntjTk4rG0AYqNl31sXXWoCoCVETpnEe8o4ZNZFMSsDlCsZr51poRl6Zu7jjPMeachNVL
         UbWElRr9yG9nDPElg6L5+gis+z9Ap+BXiejjGCQEi1XE0XtjQo/1nFCnrZxnJPPeX+1j
         V/6LKjz+3wP8X6rRSZ3xGvMh1W+QTrGGQfiRJXYJM80gGyPzYzVTGs8T041CCV9ZSpkT
         ygBDDxV9a9HvGHN6ZWO/CsVKeFLR2ievCM/3bfkeEv/cwfmK1aCSkuIBLRdWD8fIixPN
         q1gg==
X-Forwarded-Encrypted: i=1; AJvYcCVpMkfPMirOVw4OZU3aMPKFL9EEfov5FBlN5rQwq2Pw8Da1VLXpnJr2ENwvJIuiJSWA2N2ZWupAdKs5OA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkyS7DFfj+5/hYRVhxk328iizbmZgszT6X7fyRLVwXobujdUHZ
	zqRV3QdaMWMEnyN1OEZqJVntIngIxT3PK6k8wkODh8DIaA7o2LYl0BkQ1+m9HCqGPsw=
X-Gm-Gg: ASbGncvrCaM1r9Sv8vpbT+dRv1uJTJO5zLoBv4t5wR4J68ul4BjKAMdxjIEdco+UKnM
	2qaOs0/vVb9lj8Vw/32ZnCyLa5yJhn9A5/fWJmgivE+REWvqe7FebEz/RMcH957T8uoxzRmnflH
	qgBhVh9nO2HykTfx/eEXBEiSUcln+r3XQSfVNljwFT/UjI5DEZK61rc8XqpF56FYokFsJLMIJ4a
	PKuCBnGCdwuig424Ienmhb1jdwjGkhXvUrYQqVmmsgLzc9u9H7VWtFSWbNkIy93xDEVA5oTzFmD
	SNhfKtc573yTmyl38BJ5xI2DlZO8qvwjJ3fcEnWgAoka6cPucwrOaN0mZijvWCLXyLtSt0HUYzq
	45sx61bwYi+xLdstcnNlHj8xRdytDlsDIL/Q4jINqwNDWeOR43aipkRjXVZPs1yUJ
X-Google-Smtp-Source: AGHT+IG/0hVZUCxEE95MZHpW6pcKniy4zaPb2rML34xuy+jP9E9jyGGasF0CZWrS36AX5D4SzgV2BQ==
X-Received: by 2002:a05:600c:8593:b0:459:e002:8b1e with SMTP id 5b1f17b1804b1-459ee0c729dmr16878855e9.13.1754548536626;
        Wed, 06 Aug 2025 23:35:36 -0700 (PDT)
Received: from [192.168.0.13] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459db13fc9fsm151255515e9.7.2025.08.06.23.35.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 23:35:36 -0700 (PDT)
Message-ID: <ce9cf017-5447-457c-9579-700782f9f0c2@linaro.org>
Date: Thu, 7 Aug 2025 07:35:35 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/7] media: venus: core: Add qcm2290 DT compatible and
 resource data
To: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: quic_dikshita@quicinc.com, quic_vgarodia@quicinc.com,
 konradybcio@kernel.org, krzk+dt@kernel.org, mchehab@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250805064430.782201-1-jorge.ramirez@oss.qualcomm.com>
 <20250805064430.782201-6-jorge.ramirez@oss.qualcomm.com>
 <4chbcvub4scnv4jxjaagbswl74tz4ygovn3vhktfodakysbgy3@kukktkwd2zsr>
 <aJHgh8mon9auOHzi@trex>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <aJHgh8mon9auOHzi@trex>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/08/2025 11:44, Jorge Ramirez wrote:
> yes, in V7 I did implement this functionality plus a fix for EOS
> handling (broken in pre 6.0.55 firmwares).
> 
> This added some complexity to the driver. And so in internal discussions
> it was agreed that it was not worth to carry it and that it should be dropped.
> 
> I'll let Vikash and Bryan comment on the decision.

TBH I think there's not alot of value in supporting a broken firmware 
which only does decode.

There's not alot of value to the user in that configuration.

Provided you have done the work to get the fixed firmware into 
linux-firmware just cut at that point and have the driver reject lesser 
versions.

I as a user have no use-case or value in a broken old firmware which 
supports decode only, I'd much rather have the full transcoder.

Its Vikash/Dikshita's call though.

---
bod

