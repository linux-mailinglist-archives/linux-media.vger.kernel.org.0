Return-Path: <linux-media+bounces-6855-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 37147878566
	for <lists+linux-media@lfdr.de>; Mon, 11 Mar 2024 17:29:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 693C91C21AF0
	for <lists+linux-media@lfdr.de>; Mon, 11 Mar 2024 16:29:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B681A481C0;
	Mon, 11 Mar 2024 16:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FGtO4CLI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABC6482C3
	for <linux-media@vger.kernel.org>; Mon, 11 Mar 2024 16:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710174218; cv=none; b=ndEraLOdZGUUnUIWXEcGaRugmEp+ORKQqN2lDJ8QxPrp714fGSc1xzbD/e61OaDpk4bCtbhyvSqR6dE+SArPfLl0SXu6LQEE6WQzJvDgxqIkIbiUsMq68AwAWe04MW5YuELFyxV5mLz1pG330v0IWoalcTihxNPSz/AFw4GSxo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710174218; c=relaxed/simple;
	bh=B4UjQ02vkF5MZVKlOVVO21yeG118Tat5CQgQ78lvxd8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=KFnTg8KMS+RxYU27FNsP1uf1C3lhP7OXXR6SxKUwE9Ud4qyIw3Srzgxtj2aIZoHva4vAwhBUQryjl1pIboTHBFveVa55+b70vb8ML9N1l3gGV7c7HT0YYGtHRnwTSPdJHA43gs0/WdSJCZTkrU8N2Zb3g6V35XlBTNTS/W+cri8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FGtO4CLI; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a462a1b7754so135355366b.2
        for <linux-media@vger.kernel.org>; Mon, 11 Mar 2024 09:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710174214; x=1710779014; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XCj1yZt/u8hIPMQRhcMCeiFDWVHTVd6VcNXpQPTiU/4=;
        b=FGtO4CLIvZrVJL+lAWQdn44LBuBwYJb3Pw9H1w8bMgmDXc2FZ1cuJEyH0y27F9v+za
         YvLNWhkuKJLvV8ssoLkm0oRLr6AUFST5cyjP/bfkx+vzmCpwIrdP0t3jv2BAWq/Y/6hV
         nswGKzk02TuoLT+UJVWJkwXHyXoLTN3DfpWbySRr2R14t8K8wL9UhZV1WmtBGZu5ARLi
         VZdA93JBbnv/DNDXvAVjGJm6JzUx/pDbIRHwJhVCO1vaQ7r60+PABc3Xe5sO1PNYcCIk
         0kKC77zXONfHLuznBo6PqREtvWB7emTbBIhqD+BKhY4zytXR1qAJD1S83YjVLAfzInEp
         kzaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710174214; x=1710779014;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XCj1yZt/u8hIPMQRhcMCeiFDWVHTVd6VcNXpQPTiU/4=;
        b=lZx8RVZy4YspMK2Nv+aCUn9EzD0yFyH0wGvfdFTctkXFGUeIT4plOP4XhBXrgzFc6A
         OnZb596juaUlqdqDA5Wnywl4TgIexIxyWhMYmpYPR+qZGCpmqlYFRlxcYD9o3gFRCiAv
         d/qn8khMN3HDL3H6gHMpGEogwSVScsGv8j8OOd7vYnZlkWOBNPyrSzDUehqeXxz4YpUQ
         TXUOJ2CUZv7Kfq5SBT54Wu8on2JPpOZlRgibFj23Qu35E1yPxy7yEt7t++6JgpZyt+6n
         oWYS1J36a+ipbPZax8ho2pE4v+iZM/RMV+6m1ik8tD/auFR5mQ1Xjg7X4guDppgNFlc4
         54iQ==
X-Gm-Message-State: AOJu0YxbyJMOl4MxkNvCs1h7PlzmfuzNQcObe3jd9HO0tzicLIkd3USE
	rHnWh7VOp1rwAoKAQHs7XaRIpst9YX1E9IAb4A4KtStGdrd7/snOLCX5eZlcrfc=
X-Google-Smtp-Source: AGHT+IEln6XX/dQ+mav4bnye2klH/Xim0EpdtZ6nOOUNG65yuCRJ/JrmmLqOpUR7F6JkrFoS/2blZw==
X-Received: by 2002:a17:906:eece:b0:a45:511:1533 with SMTP id wu14-20020a170906eece00b00a4505111533mr5625253ejb.75.1710174214711;
        Mon, 11 Mar 2024 09:23:34 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id gl8-20020a170906e0c800b00a43e8562566sm2960425ejb.203.2024.03.11.09.23.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Mar 2024 09:23:34 -0700 (PDT)
Message-ID: <65accffc-e9ec-49c4-867a-6fd51a44f1c7@linaro.org>
Date: Mon, 11 Mar 2024 16:23:33 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] Move camss version related defs in to resources
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, andersson@kernel.org, konrad.dybcio@linaro.org,
 mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 hverkuil-cisco@xs4all.nl, quic_hariramp@quicinc.com
References: <20240227122415.491-1-quic_grosikop@quicinc.com>
 <5800231f-633d-44f1-a056-58f87f1d5c67@linaro.org>
In-Reply-To: <5800231f-633d-44f1-a056-58f87f1d5c67@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/03/2024 16:22, Bryan O'Donoghue wrote:
> On 27/02/2024 12:24, Gjorgji Rosikopulos wrote:
>> The different resources required for different camss versions are
>> split in to two groups:
> 
> Pardon me for not getting back to you on this earlier.
> 
> Would appreciate if you could post this series rebased on sc8280xp 
> patches which are @ v6 and ready for merge already.
> 
> I will find time this week to test your patches on rb3, rb5 and x13s 
> with the SoftISP patches on libcamera.
> 
> ---
> bod
> 

These patches

https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/sc8280xp-v6.8-rc4-camss?ref_type=heads

---
bod

