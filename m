Return-Path: <linux-media+bounces-25998-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6675EA30855
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 11:19:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EF61E7A39C9
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 10:18:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92EDE1F426C;
	Tue, 11 Feb 2025 10:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FbIZsUL0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A981F3FD1
	for <linux-media@vger.kernel.org>; Tue, 11 Feb 2025 10:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739269156; cv=none; b=YiM2REpBag/Zf2wiuJ+dgn1+r5vHZgBvL8CEudku0xlhpQWfOI9uIx0v305uEk0anN4Bsba5GDajn/uP9hNQXFT9sORLJGJ02y+Y657QRYrvapowSazAmsVP0trJKpveDJQcWosjluD6te51gFEldoDRVvlbOqX3dDFqrt9ij4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739269156; c=relaxed/simple;
	bh=mmYq0ka1rA31PoqSV1w1EnHuELlMe9cDQhIVsboEH4k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QvM7dMuPl5W1yqqqIydfbeovuhNG0g9XLU14lfMDmPlLXk8S+t8Ismdgh6mhhX0bf6QhpviFNZt9B7vxmtThN7CR0WtxjsA66bek0u89x41VYFD+KVHabl8MTIR+eBW23S9KdrvNawjQnxORTIMaRgrvEvoHvWB2KOdcLfpPLLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FbIZsUL0; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38dd935a267so2029388f8f.1
        for <linux-media@vger.kernel.org>; Tue, 11 Feb 2025 02:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739269152; x=1739873952; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d1+7CYo2GEpNNd6dJTgksWpYBgWB3H8P41Hw271gq6M=;
        b=FbIZsUL0E8B1mxv3MhwM5VVhhb8aivonj/oWvHc7eWMXRS6cREBKaKwbLbsVBJ3rCN
         FN5D3/qGfyyyFBjiSkmObVbzwdaritTR8bpi16EVsMeXVIYvftwGO3XaOkBuGfREzlv6
         6f+pAyEkTxy4bY1H9BZUpxWeU3pXXvfdn8PMVbbPvG7gtV8rwLf5wZUjMLZZiIf3wjX6
         Zzd0ZVw+5Mjvrm9DsiZKiOVeCDma7WY+mxOPQsuJso2xqZF3qgmrM2uuebEMe6VOkDBF
         SlCM4vzxY7gUARIUqlMJli7b9jynxtuxy5kU4OBgB4PVLgwBqjlrNVVWFMgylzsvN/Nx
         KlBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739269152; x=1739873952;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d1+7CYo2GEpNNd6dJTgksWpYBgWB3H8P41Hw271gq6M=;
        b=ndEJENSjVT0RBeLaiDFwkMTCFJz4smXOGcBVgcEVnovufCcUEMVVmhR4UZVqpFXHot
         nf3plt8P3r0MP4VxG9AXX3K+dCHTmiJkns7P9Gu0N4gw1vvV1sJxaBsbywCrFPUjmw9i
         zF00W0/saPDlg9Fb1m8kCI1Qb0L2ySWDJdBtxkNPVb812vjk5875uH3m4/GO3n/dsyr1
         TpNPRjhcG6DmNvPV4H7l6gGOfePYXkzKiZSotgSWoZ719TudA9QS8ORDR9bI5XhmFnv9
         Tq3dFC+3vuqrarpeRSDaZOAbgYNINvxVSgcrn/FECDqM/phlpQgOksjtrk13LzRUlkUS
         mKfQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3iBv9Bo8JOZaytnR4W7b+bx5BhY20tiH1gFvGB9mDGQftN++iJwCnwZP2fMaJB13iHhATZs9+fd7zbg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvsYto5pFFHLFyWJTS+ouplnKtd2zYiIkMNMryQt3noaCJFvOb
	F/el+cclZcPIFlr7GCGyR+8A8q7RJjtC54KBvsvNhvd9ycQqtJX/dTdKCC9djv8zGZVmro5vbIb
	LGpk=
X-Gm-Gg: ASbGnctl0DLysZWcUdSzcxN++N1eVun0SeC1GT+OB99re1P4C++IPPFmmItl4vEFwUU
	WngPUuvhHfS370Hk91orWVO3hJyHZVl3w6cGyzN5P6dVL3jbcaVrnX1IlBWfbBL/qQbpIBKGnQo
	Arhb2mdwGEifAWUubCCUQjphWJPWw1AAE/r1RU5bfripu7B4mxzp3SYwNRActmSOUOdeSMoJMx1
	6tz4oquQ33LU5MgDLYv/+jQSDGk32pVY7vYZaW0usnLszxDi8fOLh0ywh/WJpUspXH7AQEb7jzc
	F0LBVoJ6hvq8acG0T3nCfnhPLkAYHXUmpYElIcrhHScX1Ji2x0pmtNhErQ==
X-Google-Smtp-Source: AGHT+IHh4hDVGqmsMf5rJQ27Gh0Zf6r2TAYfUuWPHNsKZyYXSF39sDKmhxO9TOc6pLn17KWtWMv46Q==
X-Received: by 2002:a5d:6d87:0:b0:38d:d69e:1326 with SMTP id ffacd0b85a97d-38dd69e1b18mr7568941f8f.9.1739269152351;
        Tue, 11 Feb 2025 02:19:12 -0800 (PST)
Received: from [192.168.0.156] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd3dcca71sm9090007f8f.76.2025.02.11.02.19.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 02:19:12 -0800 (PST)
Message-ID: <012b0381-a5d1-49bc-aa59-aae0d35aa034@linaro.org>
Date: Tue, 11 Feb 2025 10:19:12 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] media: qcom: camss: Add sa8775p camss TPG support
To: Wenmeng Liu <quic_wenmliu@quicinc.com>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250211-sa8775p_tpg-v1-0-3f76c5f8431f@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250211-sa8775p_tpg-v1-0-3f76c5f8431f@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/02/2025 10:07, Wenmeng Liu wrote:
> SA8775P is a Qualcomm SoC. This series adds driver changes to
> bring up the TPG interfaces in SA8775P.
> 
> We have tested this on qcs9100-ride board with 'Test Pattern Generator'.
> Unlike CSID TPG, this TPG can be seen as a combination of CSIPHY and sensor.
> 
> Tested with following commands:
> - media-ctl --reset
> - v4l2-ctl -d /dev/v4l-subdev0 -c test_pattern=0
> - media-ctl -V '"msm_tpg0":0[fmt:SRGGB10/4608x2592 field:none]'
> - media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4608x2592 field:none]'
> - media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4608x2592 field:none]'
> - media-ctl -l '"msm_tpg0":1->"msm_csid0":0[1]'
> - media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> - v4l2-ctl -d /dev/v4l-subdev0 -c test_pattern=9
> - yavta -B capture-mplane -n 5 -f SRGGB10P -s 4608x2592 /dev/video0
>    --capture=7
> 
> Used following tools for the sanity check of these changes.
> 
> - make -j32 W=1
> - ./scripts/checkpatch.pl
> 
> ---
> This patch series depends on patch series:
> https://lore.kernel.org/linux-media/20250210162843.609337-1-quic_vikramsa@quicinc.com/
> ---
> 
> ---
> Wenmeng Liu (3):
>        media: qcom: camss: Add support for TPG common
>        media: qcom: camss: Add link support for TPG common
>        media: qcom: camss: tpg: Add TPG support for SA8775P
> 
>   drivers/media/platform/qcom/camss/Makefile         |   2 +
>   drivers/media/platform/qcom/camss/camss-csid-690.c |  15 +
>   drivers/media/platform/qcom/camss/camss-csid.c     |  44 +-
>   drivers/media/platform/qcom/camss/camss-tpg-gen1.c | 245 +++++++
>   drivers/media/platform/qcom/camss/camss-tpg.c      | 737 +++++++++++++++++++++
>   drivers/media/platform/qcom/camss/camss-tpg.h      | 130 ++++
>   drivers/media/platform/qcom/camss/camss.c          | 113 ++++
>   drivers/media/platform/qcom/camss/camss.h          |   5 +
>   8 files changed, 1282 insertions(+), 9 deletions(-)
> ---
> base-commit: c1696380f08cf7cc68560a11f2e8c51cb24aa7ba
> change-id: 20250211-sa8775p_tpg-7de227a82eb4
> 
> Best regards,

Great to see this work.

I think the TPG should be another type of PHY.

---
bod

