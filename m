Return-Path: <linux-media+bounces-6384-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5AB87107B
	for <lists+linux-media@lfdr.de>; Mon,  4 Mar 2024 23:53:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 91100B2486A
	for <lists+linux-media@lfdr.de>; Mon,  4 Mar 2024 22:53:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20C587C0A8;
	Mon,  4 Mar 2024 22:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fSDidsuR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADFB7C088
	for <linux-media@vger.kernel.org>; Mon,  4 Mar 2024 22:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709592786; cv=none; b=dmXh9dhqu7PSRI+0PZ+zQDm/H9Pk5gA95PktOa+cg7CtNZg9j3r0NUeUeJ+RuQ0QrXiQykAnMHFisdC+FyX43Ipa04uupESY4uFRmXbybo2gX22jX2CVYhjhzcYF10GY2wNG/b45WigbYtCcTvP/5G+l1odGREutNc7n8wuMXms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709592786; c=relaxed/simple;
	bh=uOmNJyftoQiWMBwtZjjEk5oazk42oiXZB0+69cEngE4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i7YtTpMhJivcp9xw4N7g6dMvFzGVfrSS8qua501kO5iW9YkrpVLD0EJunVCnuG3zUV5EfqHRTEyZu0xW0UbrhzFyqWHQNYUL+63UmDmp8OCWGtPQGIcz+Ssj5nps/f/mOKKcWcQhW0FUsF89Q75EEkcaT7onGwftvL75Au9bpCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fSDidsuR; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-412dda84216so15751775e9.3
        for <linux-media@vger.kernel.org>; Mon, 04 Mar 2024 14:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709592783; x=1710197583; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=btWynTf3xFFc3JW3PLqmWTjuLdoAa7Aj4yAc6WIdAsM=;
        b=fSDidsuRb/fJIChlTqzSZiqzRASaUAjwx66r8Wtd3lt6Xr4vrhfMtYjzE1XLiQRm5I
         Juk8U65YTFVeJTmrJ3CIbsUVwJXp75fxp5BSG9cRGHWT4QXoVpWlgUJcCPwk0fdTodnd
         PyzniKmtxh5ezNjpOU5TmOmM/fTukigihkDz+Oz7WiWXwCzon02CgjLgdm9E+cQ+o+hB
         v0Gto+5ag/YH7U2vGP8C3T1gkGeBCPwe1XNpDo8unGPXLZJmryfYd8MhOVHPl+S906cC
         TDJCWZIW5fGWxpCg+3c709bvw+ShpGzrBhL22ALht/DCoVcssYPqz+fjdMVUf3wiiDBk
         UaYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709592783; x=1710197583;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=btWynTf3xFFc3JW3PLqmWTjuLdoAa7Aj4yAc6WIdAsM=;
        b=YboRoJBiX4FCSV07g6ovNnNdDnDPZVN6exwA+x6e5SmqjfjjmjOTvBiseqvLLqT1qW
         eaqWFtjbxlkfzENQRzA+RTM+LrLVQtNCtoDCcCIvZBe+TEYwnp28eifK1Pfh3VorVt1s
         92o/5xiX2rAQs7FDwhnEMx1beDxy1JzUF86jJp4vB+sDYJnjbZDrtoESUIGoxTlLekrw
         +bqs3goQEElSlT3YsaSC5PabpbE8j5t6j8FV7i7k080ehi1NF+PJ4uYb1DW13xhQShXD
         NXTP0zKGhWnwowW3qSpCellzbkWoAB/kOZwUQU4pkXz3ySI1lYAhySx0NFSbcINNgfeG
         qidg==
X-Forwarded-Encrypted: i=1; AJvYcCVOpkTN8TgB79ty3QmHChYVsjHz7zxZ3F/OxB6aNvHS64vXuW3S3raGePDWzAeqUqhLeFP0YS+53I0jwBa6xoSFP8WLBLPTbyyMoqI=
X-Gm-Message-State: AOJu0YwP0im7pmoZrqKN9qJ8Vnq9zNHkevlYo/lzaUKN8RlS64ghf2h4
	qtCht+fpQposVsJs6iLAOaPdjp3WMY3j5vc4s6PAA0b8tImS/0dcqqgk0Kdp0vE=
X-Google-Smtp-Source: AGHT+IFuHz8KuYiUldcamRZfnck6yCpPU0D3qbH8MnGNSebMlrRChLNBuPmNutjEvsdtyjLBHd+6Xw==
X-Received: by 2002:a05:600c:4e8e:b0:412:de1f:dd23 with SMTP id f14-20020a05600c4e8e00b00412de1fdd23mr3813219wmq.7.1709592783279;
        Mon, 04 Mar 2024 14:53:03 -0800 (PST)
Received: from [10.66.66.2] (9.ip-51-91-159.eu. [51.91.159.9])
        by smtp.gmail.com with ESMTPSA id bi7-20020a05600c3d8700b00412e5f876adsm3186236wmb.3.2024.03.04.14.53.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 14:53:02 -0800 (PST)
Message-ID: <d19bd56c-dc85-46ee-831d-e67768ccf6ed@linaro.org>
Date: Mon, 4 Mar 2024 23:52:58 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/20] media: venus: pm_helpers: Remove
 pm_ops->core_put
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20230911-topic-mars-v2-0-3dac84b88c4b@linaro.org>
 <20230911-topic-mars-v2-14-3dac84b88c4b@linaro.org>
 <ec239f69-6ace-c4a4-409c-771f1d24ce81@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <ec239f69-6ace-c4a4-409c-771f1d24ce81@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/4/24 07:57, Dikshita Agarwal wrote:
> 
> 
> On 2/10/2024 2:39 AM, Konrad Dybcio wrote:
>> Without an OPP table and with vcodec_pmdomains_num (so, v1, v3 and
>> sdm845_legacy targets), core_put_v4 is a NOP, jut like core_put_v1.
>> Unify them!
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---

[...]


>> -static void vcodec_domains_put(struct venus_core *core)
>> +void vcodec_domains_put(struct venus_core *core)
>>   {
>>   	dev_pm_domain_detach_list(core->pmdomains);
>>   
> what is the base of this change?
> I don't see dev_pm_domain_detach_list in mainline code.
> Am I missing anything here?

The base is specified in the cover letter.

The code in question is indeed here since January, perhaps
you're looking at something older than -next.

Konrad


