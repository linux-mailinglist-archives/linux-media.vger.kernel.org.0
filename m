Return-Path: <linux-media+bounces-7919-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D16C88DA9F
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 10:56:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0FE55293969
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 09:56:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF32145031;
	Wed, 27 Mar 2024 09:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexus-software-ie.20230601.gappssmtp.com header.i=@nexus-software-ie.20230601.gappssmtp.com header.b="O9YMWmJx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BB01CA9C
	for <linux-media@vger.kernel.org>; Wed, 27 Mar 2024 09:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711533362; cv=none; b=F5PPNa4Y2OckuSrbUoxbnlXMAeLYstukfhV6yh0nBA0wOv3hwf1PbW9i0Y6W4AGWUJSdI7rPWPO/xJ4a2YcrgMV3IIqQmv/w7Xhv7TPnlma6Eh9Ajiz4xw7t8it8XbDWlnxe6gsmGuXF4uzViDp9Z5YLGEUot/mCSGnUiiZw50U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711533362; c=relaxed/simple;
	bh=bsl5mlaY8cNqyw4oUG32H7euTa4u8AfSfG4rvl5y9Qw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NgLPeeHETiiyttdJ+WdYtP0GKuqpCU4SyV0feGKG2BasMrJuWDS/Tedc/kyoyes7b8BU2hK7lzE3VoDdwYUC7TuxK2YtGL5qJWfoEKZ8O5m0RTu+0an3EiRJAbdEu2TQnUFOB4yxZXyOzpPgN7CgpaNYrx71F5bfY4+1PmW+zuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexus-software.ie; spf=none smtp.mailfrom=nexus-software.ie; dkim=pass (2048-bit key) header.d=nexus-software-ie.20230601.gappssmtp.com header.i=@nexus-software-ie.20230601.gappssmtp.com header.b=O9YMWmJx; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexus-software.ie
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=nexus-software.ie
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2d4a8bddc21so85750231fa.0
        for <linux-media@vger.kernel.org>; Wed, 27 Mar 2024 02:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20230601.gappssmtp.com; s=20230601; t=1711533357; x=1712138157; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jSvnWidHd7x1wPI9eyKH1ULMOk/MMh1qH/IqJxdxFNI=;
        b=O9YMWmJxyTmLmP4Q8HFMVUUm5LcC+0Z7AxIJToprD9IMmfh/KN2dsIdgnSAayv7Zx1
         BrzSvWTykeYyGJgqHRM3mzLgLH6Qr7V0mZun6bkLCFybHLS7EB6rK08c6GK4gkPHmO95
         w+5Z82RhLPmP/AcElwFRx/Pu0tnIWugG4dRbAuj1WSKtME4IWtbb8WLcsLlRrGeAM1u8
         lAo9Xfy18nkxG82mYA3Jr+LuCkoOkOqrG0qzAb6+vuWRBRlNs0a0DKxNC/c/emBbcGtP
         8gdSHT+qSrHCUUA0WlhCMGLA94d0j04nJoBgIxrvcL11n5AgR1KOGwDaJwqILQ2kosjN
         z3HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711533357; x=1712138157;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jSvnWidHd7x1wPI9eyKH1ULMOk/MMh1qH/IqJxdxFNI=;
        b=osaWsrnZVEwS7CQ8sKM8Jcky6jLF8FyS65GcbGhrhVPi7ylI7w0mNr4uk+2V2hEbAc
         2z6q/WpkQSEHocq8kEitsgs7WcJLB4KWq4hwZoFWBvrcpZ/rwptlz/izNgKGrnc6Duad
         fOoprceBB+GxLUwTu5k19QZXKciT8w73UfFc5Z4QVCG4rx3U9oK2r72VnodASe+soSwp
         /VypfH4pXhrErOZMC+z7ex6tQhdYHFrG1u1Pfk1kOMlUAf5OXzYlr/kuFsxvnfNYCrYB
         e3zceiwiTY0r28bayEfDhd2sP86Y3sxMtAZJCuEWxIpxN4WF5JB9WQGD5wlhq2p1nC0y
         0GSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFNHzTnVWwILziWgn8c3vefSt/DntD5EPv5uE32JxgP2elF49GpRRymHlv7rfygnnMSh6NbDKOdQp3sSJZJlfT98o8p0085hYg6aA=
X-Gm-Message-State: AOJu0Yzl2jmWvCnptrwC46ACCiLTcFumUHdZO3QHn6VcrLO1+Ip6z+4i
	dOA5G9mo86D0gSdnIQsdUu6rGAFlNT87Q0H8JyfrYpQhX0y1YqaDCMFeQa3n7/k=
X-Google-Smtp-Source: AGHT+IFw/7ZLAi36bN7TwpWrmHEI/IaB3nTNikltKHCbY/u3xwMKPK8WN26Ir2ty+IvIQZGG0TLPYA==
X-Received: by 2002:a2e:b5ae:0:b0:2d6:f67a:cca9 with SMTP id f14-20020a2eb5ae000000b002d6f67acca9mr1150752ljn.33.1711533357297;
        Wed, 27 Mar 2024 02:55:57 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id d8-20020a05600c3ac800b004149455335csm1532653wms.12.2024.03.27.02.55.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Mar 2024 02:55:56 -0700 (PDT)
Message-ID: <072aacd2-fedf-485a-970e-a705748cc92e@nexus-software.ie>
Date: Wed, 27 Mar 2024 09:55:55 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/20] media: venus: pm_helpers: Add kerneldoc to
 venus_clks_get()
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20230911-topic-mars-v2-0-3dac84b88c4b@linaro.org>
 <20230911-topic-mars-v2-3-3dac84b88c4b@linaro.org>
 <b6d6beab-39f5-4f00-8427-52b662181864@linaro.org>
 <30945f7a-b18b-483a-bc43-99f913fb98c3@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <30945f7a-b18b-483a-bc43-99f913fb98c3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 26/03/2024 21:23, Konrad Dybcio wrote:
> On 6.03.2024 1:20 PM, Bryan O'Donoghue wrote:
>> On 09/02/2024 21:09, Konrad Dybcio wrote:
>>> To make it easier to understand the various clock requirements within
>>> this driver, add kerneldoc to venus_clk_get() explaining the fluff.
>>>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>> ---
>>>    drivers/media/platform/qcom/venus/pm_helpers.c | 28 ++++++++++++++++++++++++++
>>>    1 file changed, 28 insertions(+)
>>>
>>> diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
>>> index ac7c83404c6e..ea0a7d4601e2 100644
>>> --- a/drivers/media/platform/qcom/venus/pm_helpers.c
>>> +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
>>> @@ -23,6 +23,34 @@
>>>      static bool legacy_binding;
>>>    +/**
>>> + * venus_clks_get() - Get Venus clocks that are not bound to a vcodec
>>
>> Get non-codec Venus clocks.
> 
> No, this is not necessarily the case.. these may still include
> vcodec clocks, that are specified under the root venus node (which
> is the only way we'd like to keep)
> 
> I applied the rest of your suggestions, do I keep your rb?
> 
> Konrad
> 

Sure

BTW, I plan to test this series when I can - do you have a working tree ?

---
bod

