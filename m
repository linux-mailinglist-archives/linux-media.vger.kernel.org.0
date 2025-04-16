Return-Path: <linux-media+bounces-30361-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E6625A90741
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 17:03:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8FFA23BE5E7
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 15:03:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E7651FC7D2;
	Wed, 16 Apr 2025 15:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eqB8TPaV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F3118A6AE
	for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 15:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744815813; cv=none; b=jQcJl0l4/yduBhfQ9mSdh4tXGiq7+yHuYZSIsUMpDeMYkPx2Rfsx/zAYWYM4cgBCdI3vlkjVf5d6x33yXnw7JTdwdMtTVJmETgvi3I460b12MURTj9QA+mIWQABq4IKHL33z+HnKdE/2s1NrqgOQWO/tBBTPqzmhMDB8i2MlYHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744815813; c=relaxed/simple;
	bh=kHSfPEdOAablu2/umHYs7gUz3zVv4oy4q52ZGY3brag=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ys+nk/CkPcDairCtk8QofdUZm6EWGOdQ5mH0JzmQHv2TbIudmcnV82DN5B3MtNR3X7Fn+mZvuix61i3ilIcXySay/re/ZhSAsUkDaOZCEaZ+kii2P13EF/3BNQ3AcuD0lnM8iD6dQROkPPz8mBzTGwhLukvSc88rs+s1joyQ0S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eqB8TPaV; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso6582765e9.0
        for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 08:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744815810; x=1745420610; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ssHY3+dEnlsEExNuhQ9HefHsurneHKSySj1u60YgUXQ=;
        b=eqB8TPaVjtXsQeJ5F1AOjcfXgwN2pXCt2PpFfN7UJJMWiwgVjNgGsv6JYRqqAN13KF
         5z7b4LvBMzgsCPWbiN6qPNMMJzIFbwCY8WclZ0d93zwZiRYIzfEp5tmlhBI7GPNkXcC3
         w6F0H1uJHDnxLrUEBgqxICaIWuZOAnQ/eRTG30RvbXglx3GSCUMrS4nnYIbUXvPuII+d
         vg6ansSjdJV3etUOopge97JTe+MvCn7BfIm8Qh2VkTNEoKCgQR6PuMSrJIt/VIa5j2Vu
         ADU10jEkeEr/hulrOhFh5aHpGcQGyVkMMv3U5ZVC/T4DIKuKDVwyjrtK/AKFfEYHGHw4
         YYpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744815810; x=1745420610;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ssHY3+dEnlsEExNuhQ9HefHsurneHKSySj1u60YgUXQ=;
        b=nQNVSIh2waZD4ZscE4a/KbqU8Ku4Tise7L8RqZ8YpU+JGtgetqZSfQIHWv00R8tWo4
         Tn4H7h9vMD/Bt5UtDHlyC9kSvr3fX3od/ztOPKY0SsS6siazwXFCMFI4zy3jW15Cb+zj
         lksJtuTIbKdGWOrrIKLZpx4sDGuLAG2EkY/EsYAb4Dgi+2eWFP+NKeZ5YtpANZUuzrRn
         mq/X1Rq0OGeUWso7KTa7mXeh4nNXdk1JIrrJeKMbPqVLfTWa6r+PDQn4clIq6qvdc2Yt
         /8CxI09vrE+LvH1ZGsVZSu0+z/J5EGUQ83lGwakVBqoi49InryVsuSbt03447KS1tzt8
         H65g==
X-Forwarded-Encrypted: i=1; AJvYcCVTFyXOOzjq1rZRvXgwTC/R4ee3IS2IfZB1vBbAm/sUn85w9DU7VIrpLJ+bAeXtbUM88GrxgVJdWPnq7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyiB2mDxKmlk9lKEpNkX209VG6BFgqotCSx/8v5SnNZ7TzT8dx6
	BCwWwqY15vLoKOA9rEfC+m/ZsdVyTavTqCtxamsHA7muiObGXoquiO0yH049QfA=
X-Gm-Gg: ASbGncu/yHtmk134jVB6CheltgYV4xT21HA0SoMaM/WQdUBxROivCfx/6keqzDOS8Zx
	AHluS1rcVcqQM4ipJca8pKM3zmLlmucKNXUkDSPbnIqNnR2W1g8Git2j+wXndJ8AqhXaIJyLD+r
	/lFrqR9qnrCbuhdw+EazmZCUpR0CSXAB6M022ONugNCNzn+1T58A8CBx7nqZYEyTPfTcsQvDzRF
	wbdsC3rUybw8UgZi+C4TR0IyLsIkcsj25UEetlFkEPc7zXkCt13R5jpJKD0aJSyaI1fExz5hYHy
	8hFHgA2Cr5LW1kCMEEvXKgypx5TAWAEZpKzm3iubTLIPHha/eiv3Q38tfqXcXvsLvWHWM5+fYDu
	MspX90w==
X-Google-Smtp-Source: AGHT+IE3cwf5hpOj2aPXcTsIAKSRPhYCx8GnqPD2BU0dBf37NTxtHVMsyy+iGKWeeJ/KQXpH2Fj4aw==
X-Received: by 2002:a05:600c:1910:b0:43c:f680:5c2e with SMTP id 5b1f17b1804b1-4405d7d31a2mr24342655e9.13.1744815808120;
        Wed, 16 Apr 2025 08:03:28 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b4f2b72sm23291795e9.19.2025.04.16.08.03.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 08:03:27 -0700 (PDT)
Message-ID: <80a994f6-c46d-40c2-aaec-33d960cd0dac@linaro.org>
Date: Wed, 16 Apr 2025 16:03:26 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: qcm2290: Add CAMSS node
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: rfoss@kernel.org, konradybcio@kernel.org, andersson@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20250416120908.206873-1-loic.poulain@oss.qualcomm.com>
 <20250416120908.206873-6-loic.poulain@oss.qualcomm.com>
 <c57084c4-189a-484f-af2f-8e4181f547fb@oss.qualcomm.com>
 <CAFEp6-0tZQowmDrEsHgU1Ncx6jR2f=Lp259vaj3mefc-9BfUbg@mail.gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <CAFEp6-0tZQowmDrEsHgU1Ncx6jR2f=Lp259vaj3mefc-9BfUbg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/04/2025 16:01, Loic Poulain wrote:
>> @5c6e000
>> (first reg entry)
> Ah right, I reordered reg to be aligned with other camss drivers.
> Should I keep that order (and update node name) or reorder with phy
> lower addresses first (PHYs)?
> 
>>> +                     compatible = "qcom,qcm2290-camss";
>>> +
>>> +                     reg = <0 0x5c6e000 0 0x1000>,
>>> +                           <0 0x5c75000 0 0x1000>,
>>> +                           <0 0x5c52000 0 0x1000>,
>>> +                           <0 0x5c53000 0 0x1000>,
>>> +                           <0 0x5c6f000 0 0x4000>,
>>> +                           <0 0x5c76000 0 0x4000>;
>>> +                     reg-names = "csid0",
>>> +                                 "csid1",
>>> +                                 "csiphy0",
>>> +                                 "csiphy1",
>>> +                                 "vfe0",
>>> +                                 "vfe1";

Please keep consistent with the last committed yaml for CAMSS.

---
bod

