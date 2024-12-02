Return-Path: <linux-media+bounces-22482-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B56359E0F3C
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 00:10:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 64480164B78
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 23:10:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D8371DFDB7;
	Mon,  2 Dec 2024 23:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qiu4C1Cv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A561DF98D
	for <linux-media@vger.kernel.org>; Mon,  2 Dec 2024 23:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733181033; cv=none; b=mSQSAD92/F71e2+/Ls9VnPoVr8jhGrBUvTVrbqYdR92w4gw3kMLAVsaBRMT9vHXzZdCvCUaFVfgpKF8Kf5qwIi9o/VSXZ2tv/0yMSgOUHidPWxv5xN07mVbeLIHCaTAmQVnoFqhNi/9DgP9WxBDHVBu1+FeAlxroBpSMRcPC9HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733181033; c=relaxed/simple;
	bh=6Y5KxP9zFePN79Grjoz9I5USdGdrOoURfpttrwdXEG4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mkFCYs2iX4Pp2n52ux5x8NrGW4mvy0rvgUzufysdVNmJqbCiE8qzK3tAwfITQMlouE1XXbd65O4JmniLAX9+AMosZRRLHhsIfLCCVjUsJFod8vcg+RrA6oRq+nCLWcxwHtsex20K+6Osil+CPiTPrMhRSnhcfkLUcmBKoopxQeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qiu4C1Cv; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-434a9f2da82so42198635e9.2
        for <linux-media@vger.kernel.org>; Mon, 02 Dec 2024 15:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733181029; x=1733785829; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I7zzDiiLvKNGR5LJNWnfe3zCd7fwiBzR7rOVnpt98ac=;
        b=qiu4C1CvaIOuln2ZttxUOjpfU+N51tcKtedq6sq7b3NX+J/kTNipSk5avyvHu4820+
         Yn4eoevjpy4likk6mTYT8utZ6uiDUreoGHV11GTNboNQvG4OYNZZSF7kREWi4iw3KmmK
         c9VPCNqsRoQvSOo9JKabpxtBtrE/wWZH9g9dwbE13a9K8xk/cyLPJ3tVaaGYA6un+jvt
         2LzO8T6KXYub9GffTRUBDcFgkgr2Sn9brYy5dltVkH5xA3yuI4UHeDP3bT+6OJkUY8Qb
         6uHQ+oxyt3bNvsWF5yVSOxo006/JajADoeJFMOA9+rI8zHdF1ocFJw8IhjAtGqSHKl4B
         Dcsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733181029; x=1733785829;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I7zzDiiLvKNGR5LJNWnfe3zCd7fwiBzR7rOVnpt98ac=;
        b=pzRW3ISbjdl/C/7CkDeFqVWJYJ8lmouPsQUV7F5P9dWJZZa815p+qEjj1dvZ9mvp2z
         NCRhbX7F6YsfR61Ue1xUgjUE7iAXmqwNPfvbr8CgNeUn6LW7+4JijIcroj8fywJYhhO1
         1P9YyhhF18o/ZkZ5aHGf0fNwd5fiNdIP02fs7evvZM/N+lmJfz+RdHMqTLQWTACUmIla
         slM5omMKie7altPXM+jGzGIwgBKbCTIcvOGqvxhMpc0bLxjb3Y0bAtmr+CdDIShrIv41
         RgyhwjnXC0IirULMIQOxCmKaFPwvp2dIFWMzhosedKdtL6GettrqpyvAYr7ji1fJPGeb
         GeoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaigJCaMSQXvlBs7JwmZO+xLDJr263B6nGxIy329YCjugqdqk1Vqsxe5TrRl66Xu7lba3X/+BUmh7xsg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWPK4r3ctmemkTb1PVf7a2swQtY1s7hLvPs/cxGgT0Zb0k8NHC
	hbuvilWiFduEeorV22ed9EYJwqOlzpczPP1BcCDnzNxpSk/IN1n5q8Vl8ux4VFA=
X-Gm-Gg: ASbGncsw8Xs3ES/wTHMZJ+T1+x95dMs1BGzf0+1s/yiQo50XiZgwh0/9D66D50oB2yk
	NO6AZ/XFH/vWKB6pXq9XHoR7EYsXF0sNwXyA8PadLYBpcSaxjx+B0yVHcsstlELATikxxdxT36m
	VJFSuUnhXEiAMUPwDhbMjOd4NsEifoHl8oKuXVqqP4iAxfTagrCTVkeedVGSvVdZCzctgwSVx3g
	dUY0lu6MyFAlMjgzTsDDFSKlnWSNh8nDbTKv048AxM3IAnhXRTA23Qb6QHUCis=
X-Google-Smtp-Source: AGHT+IHtLq+j1oNptKzWQsiHUc+CSsSSrV/DI4s1HrsdQNABF0GVVobl24VqpC4MuQxILfmKlXtIMw==
X-Received: by 2002:a05:6000:1885:b0:385:f1f2:13ae with SMTP id ffacd0b85a97d-385fd437640mr203495f8f.41.1733181028500;
        Mon, 02 Dec 2024 15:10:28 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385e30c54bfsm8667298f8f.110.2024.12.02.15.10.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 15:10:28 -0800 (PST)
Message-ID: <1d3650f9-fe4d-4972-968a-aaab6fed1044@linaro.org>
Date: Mon, 2 Dec 2024 23:10:27 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: qcom: camss: fix VFE pm domain off
To: barnabas.czeman@mainlining.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yassine Oudjana <y.oudjana@protonmail.com>
References: <20241128-vfe_pm_domain_off-v2-1-0bcbbe7daaaf@mainlining.org>
 <3a5fd596-b442-4d3f-aae2-f454d0cd8e5c@linaro.org>
 <5cccec71-0cc7-492a-9fb9-903970da05c5@linaro.org>
 <d3a8d38c-9129-4fbd-8bd6-c91131d950ad@linaro.org>
 <a08e95fc03fce6cb0809a06900982c6c@mainlining.org>
 <8dfd2ee1-9baf-441f-8eb9-fa11e830334a@linaro.org>
 <ac765a062e94d549f4c34cf4c8b2c199@mainlining.org>
 <f4e47953-5a68-4ec5-860b-820b8eff2a2a@linaro.org>
 <05e91ae70902f0cd9c47bb4197d8fef1@mainlining.org>
 <93028653-9919-460e-83d3-84bf5ade56d4@linaro.org>
 <c7a9a43eea8bd1e6302ae4fa2d79dd80@mainlining.org>
 <c8020803-ecbd-4496-9361-f19352ddf462@linaro.org>
 <02282c0d493153c633e7eccf5559452a@mainlining.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <02282c0d493153c633e7eccf5559452a@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 30/11/2024 22:58, barnabas.czeman@mainlining.org wrote:
> On 2024-11-30 22:48, Bryan O'Donoghue wrote:
>> On 29/11/2024 23:52, barnabas.czeman@mainlining.org wrote:
>>> On 2024-11-30 00:07, Bryan O'Donoghue wrote:
>>>> On 29/11/2024 22:45, barnabas.czeman@mainlining.org wrote:
>>>>> On 2024-11-29 23:08, Bryan O'Donoghue wrote:
>>>>>> On 29/11/2024 13:46, barnabas.czeman@mainlining.org wrote:
>>>>>>> On 2024-11-29 13:25, Bryan O'Donoghue wrote:
>>>>>>>> On 29/11/2024 11:44, barnabas.czeman@mainlining.org wrote:
>>>>>>>>>> The change does not describe how to reproduce the problem, 
>>>>>>>>>> which commit
>>>>>>>>>> base is tested, which platform is testes, there is no enough 
>>>>>>>>>> information,
>>>>>>>>>> unfortunately.
>>>>>>>>> I can reproduce the problem with megapixels-sensorprofile on 
>>>>>>>>> msm8953 and
>>>>>>>>> it can be reproduced with megapixels on msm8996.
>>>>>>>>> The base is the last commit on next.
>>>>>>>>
>>>>>>>> Can you verify if vfe_domain_on has run and if so whether or not 
>>>>>>>> genpd_link is NULL when that function exists.
>>>>>>>>
>>>>>>> I have added some debug logs it seems pm_domain_on and 
>>>>>>> pm_domain_off is called twice on the same object.
>>>>>>> [   63.473360] qcom-camss 1b00020.camss: pm_domain_on 19842ce8 
>>>>>>> link 42973800
>>>>>>> [   63.481524] qcom-camss 1b00020.camss: pm_domain_on 19840080 
>>>>>>> link 4e413800
>>>>>>> [   63.481555] qcom-camss 1b00020.camss: pm_domain_on 19842ce8 
>>>>>>> link 42973800
>>>>>>> [   63.481632] qcom-camss 1b00020.camss: pm_domain_off 19840080 
>>>>>>> link 4e413800
>>>>>>> [   63.481641] qcom-camss 1b00020.camss: pm_domain_off 19842ce8 
>>>>>>> link 42973800
>>>>>>> [   63.654004] qcom-camss 1b00020.camss: pm_domain_off 19842ce8 
>>>>>>> link 0
>>>>>>>> That's the question.
>>>>>>>>
>>>>>>>> ---
>>>>>>>> bod
>>>>>>
>>>>>> Could you provide this output ?
>>>>>>
>>>>>> index 80a62ba112950..b25b8f6b00be1 100644
>>>>>> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
>>>>>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
>>>>>> @@ -595,6 +595,9 @@ void vfe_isr_reset_ack(struct vfe_device *vfe)
>>>>>>   */
>>>>>>  void vfe_pm_domain_off(struct vfe_device *vfe)
>>>>>>  {
>>>>>> +dev_info(camss->dev, "%s VFE %d genpd %pK genpd_link %pK\n",
>>>>>> +        __func__, vfe->id, vfe->genpd, vfe->genpd_link);
>>>>>> +
>>>>>>         if (!vfe->genpd)
>>>>>>                 return;
>>>>>>
>>>>>> @@ -609,7 +612,8 @@ void vfe_pm_domain_off(struct vfe_device *vfe)
>>>>>>  int vfe_pm_domain_on(struct vfe_device *vfe)
>>>>>>  {
>>>>>>         struct camss *camss = vfe->camss;
>>>>>> -
>>>>>> +dev_info(camss->dev, "%s VFE %d genpd %pK genpd_link %pK\n",
>>>>>> +        __func__, vfe->id, vfe->genpd, vfe->genpd_link);
>>>>>>         if (!vfe->genpd)
>>>>>>                 return 0;
>>>>>>
>>>>>> ---
>>>>>> bod
>>>>> I think logging in pm_domain_on should be placed after 
>>>>> device_link_add because only NULL
>>>>> will be visible.
>>>>> [   83.040694] qcom-camss 1b00020.camss: vfe_pm_domain_on VFE 1 
>>>>> genpd 000000009bd8355f genpd_link 0000000000000000
>>>>> [   83.049293] qcom-camss 1b00020.camss: vfe_pm_domain_on VFE 0 
>>>>> genpd 00000000bfb65e7c genpd_link 0000000000000000
>>>>> [   83.049353] qcom-camss 1b00020.camss: vfe_pm_domain_on VFE 1 
>>>>> genpd 000000009bd8355f genpd_link 00000000ccb0acd9
>>>>> [   83.049641] qcom-camss 1b00020.camss: vfe_pm_domain_off VFE 0 
>>>>> genpd 00000000bfb65e7c genpd_link 00000000348ac3c1
>>>>> [   83.049654] qcom-camss 1b00020.camss: vfe_pm_domain_off VFE 1 
>>>>> genpd 000000009bd8355f genpd_link 00000000ccb0acd9
>>>>> [   83.241498] qcom-camss 1b00020.camss: vfe_pm_domain_off VFE 1 
>>>>> genpd 000000009bd8355f genpd_link 0000000000000000
>>>>
>>>> Could you add
>>>>
>>>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
>>>> @@ -786,7 +786,7 @@ int vfe_get(struct vfe_device *vfe)
>>>>         int ret;
>>>>
>>>>         mutex_lock(&vfe->power_lock);
>>>> -
>>>> +dev_info(vfe->camss->dev, "%s vfe %d power_count %d\n", __func__, 
>>>> vfe->id, vfe->power_count);
>>>>         if (vfe->power_count == 0) {
>>>>                 ret = vfe->res->hw_ops->pm_domain_on(vfe);
>>>>                 if (ret < 0)
>>>> @@ -823,6 +823,7 @@ int vfe_get(struct vfe_device *vfe)
>>>>
>>>>         mutex_unlock(&vfe->power_lock);
>>>>
>>>> +dev_info(camss->vfe->dev, "%s vfe %d err=%d\n", __func__, camss- 
>>>> >vfe- >id, 0);
>>>>         return 0;
>>>>
>>>>  error_reset:
>>>> @@ -835,7 +836,7 @@ int vfe_get(struct vfe_device *vfe)
>>>>
>>>>  error_pm_domain:
>>>>         mutex_unlock(&vfe->power_lock);
>>>> -
>>>> +dev_info(camss->vfe->dev, "%s vfe %d err=%d\n", __func__, camss- 
>>>> >vfe- >id, ret);
>>>>         return ret;
>>>>  }
>>>>
>>>> ?
>>>>
>>>> ---
>>>> bod
>>> I have added little more from the logs because it is only failing in 
>>> edge cases megapixels-sensorprofile failing by
>>> different reason quickly and trying to release the device.
>>> [   54.719030] qcom-camss 1b00020.camss: vfe_get vfe 0 err=0
>>> [   54.750124] qcom-camss 1b00020.camss: vfe_get vfe 0 power_count 1
>>> [   54.750236] qcom-camss 1b00020.camss: vfe_get vfe 0 err=0
>>> [   54.751270] qcom-camss 1b00020.camss: vfe_pm_domain_on VFE 0 genpd 
>>> 00000000beaef03c genpd_link 00000000251644d9
>>
>>> [   54.751433] qcom-camss 1b00020.camss: vfe_pm_domain_on VFE 1 genpd 
>>> 000000007ce2da53 genpd_link 0000000000000000
>>> [   54.755531] qcom-camss 1b00020.camss: vfe_pm_domain_off VFE 1 
>>> genpd 000000007ce2da53 genpd_link 0000000058dcd4d6
>>
>> that's a bug genpd_link should be NULL unless power_count != 0
>>
>>> [  143.922868] qcom-camss 1b00020.camss: vfe_pm_domain_off VFE 1 
>>> genpd 000000007ce2da53 genpd_link 00000000d1fcd54b
>>> [  144.126535] qcom-camss 1b00020.camss: vfe_pm_domain_off VFE 1 
>>> genpd 000000007ce2da53 genpd_link 0000000000000000
>>
>> this is the corollary of the bug
>>
>> can you provide the output of the attached please ?
> [   50.787730] qcom-camss 1b00020.camss: vfe_get/806 vfe 1 power_count 0
> [   50.794888] qcom-camss 1b00020.camss: vfe_get/811 vfe 1 power_count 0
> [   50.795040] qcom-camss 1b00020.camss: vfe_get/816 vfe 1 power_count 0
> [   50.795131] qcom-camss 1b00020.camss: vfe_get/822 vfe 1 power_count 0
> [   50.795172] qcom-camss 1b00020.camss: vfe_get/827 vfe 1 power_count 0
> [   50.795180] qcom-camss 1b00020.camss: vfe_get/830 vfe 1 power_count 0
> [   50.795188] qcom-camss 1b00020.camss: vfe_get/841 vfe 1 power_count 1
> [   50.795413] qcom-camss 1b00020.camss: vfe_put/868 vfe 1 power_count 1
> [   50.795422] qcom-camss 1b00020.camss: vfe_put/874 vfe 1 power_count 1
> [   50.795429] qcom-camss 1b00020.camss: vfe_put/882 vfe 1 power_count 1
> [   50.795468] qcom-camss 1b00020.camss: vfe_put/884 vfe 1 power_count 1
> [   50.799936] qcom-camss 1b00020.camss: vfe_put/886 vfe 1 power_count 1
> [   50.800247] qcom-camss 1b00020.camss: vfe_put/888 vfe 1 power_count 1
> [   50.800257] qcom-camss 1b00020.camss: vfe_put/891 vfe 1 power_count 1
> [   50.800263] qcom-camss 1b00020.camss: vfe_put/893 vfe 1 power_count 0
> [   51.086159] qcom-camss 1b00020.camss: vfe_get/801 vfe 0 power_count 0
> [   51.088158] qcom-camss 1b00020.camss: vfe_get/806 vfe 0 power_count 0
> [   51.092782] qcom-camss 1b00020.camss: vfe_get/811 vfe 0 power_count 0
> [   51.092872] qcom-camss 1b00020.camss: vfe_get/816 vfe 0 power_count 0
> [   51.092945] qcom-camss 1b00020.camss: vfe_get/822 vfe 0 power_count 0
> [   51.092980] qcom-camss 1b00020.camss: vfe_get/827 vfe 0 power_count 0
> [   51.092987] qcom-camss 1b00020.camss: vfe_get/830 vfe 0 power_count 0
> [   51.092994] qcom-camss 1b00020.camss: vfe_get/841 vfe 0 power_count 1
> [   51.117104] qcom-camss 1b00020.camss: vfe_get/841 vfe 0 power_count 2
> [   52.181802] qcom-camss 1b00020.camss: vfe_put/868 vfe 0 power_count 2
> [   52.181828] qcom-camss 1b00020.camss: vfe_put/891 vfe 0 power_count 2
> [   52.181834] qcom-camss 1b00020.camss: vfe_put/893 vfe 0 power_count 1
> [   52.189017] qcom-camss 1b00020.camss: vfe_get/841 vfe 0 power_count 2
> [   64.920259] qcom-camss 1b00020.camss: vfe_get/841 vfe 0 power_count 3
> [   64.920337] qcom-camss 1b00020.camss: vfe_get/841 vfe 0 power_count 4
> [   64.920368] qcom-camss 1b00020.camss: vfe_get/801 vfe 1 power_count 0
> [   64.920656] qcom-camss 1b00020.camss: vfe_get/806 vfe 1 power_count 0
> [   64.920667] qcom-camss 1b00020.camss: vfe_get/811 vfe 1 power_count 0
> [   64.920706] qcom-camss 1b00020.camss: vfe_get/816 vfe 1 power_count 0
> [   64.920734] qcom-camss 1b00020.camss: vfe_get/822 vfe 1 power_count 0
> [   64.920868] qcom-camss 1b00020.camss: vfe_get/827 vfe 1 power_count 0
> [   64.920877] qcom-camss 1b00020.camss: vfe_get/830 vfe 1 power_count 0
> [   64.920886] qcom-camss 1b00020.camss: vfe_get/841 vfe 1 power_count 1
> [   64.920963] qcom-camss 1b00020.camss: vfe_get/841 vfe 1 power_count 2
> [   64.921008] qcom-camss 1b00020.camss: vfe_get/841 vfe 1 power_count 3
> [   64.921871] qcom-camss 1b00020.camss: vfe_put/868 vfe 0 power_count 4
> [   64.921896] qcom-camss 1b00020.camss: vfe_put/891 vfe 0 power_count 4
> [   64.921904] qcom-camss 1b00020.camss: vfe_put/893 vfe 0 power_count 3
> [   64.927278] qcom-camss 1b00020.camss: vfe_get/841 vfe 0 power_count 4
> [   65.096857] qcom-camss 1b00020.camss: vfe_put/868 vfe 1 power_count 3
> [   65.096883] qcom-camss 1b00020.camss: vfe_put/891 vfe 1 power_count 3
> [   65.096889] qcom-camss 1b00020.camss: vfe_put/893 vfe 1 power_count 2
> [   65.096903] qcom-camss 1b00020.camss: vfe_put/868 vfe 1 power_count 2
> [   65.096908] qcom-camss 1b00020.camss: vfe_put/891 vfe 1 power_count 2
> [   65.096914] qcom-camss 1b00020.camss: vfe_put/893 vfe 1 power_count 1
> [   65.096927] qcom-camss 1b00020.camss: vfe_put/868 vfe 1 power_count 1
> [   65.096933] qcom-camss 1b00020.camss: vfe_put/874 vfe 1 power_count 1
> [   65.096938] qcom-camss 1b00020.camss: vfe_put/882 vfe 1 power_count 1
> [   65.096958] qcom-camss 1b00020.camss: vfe_put/884 vfe 1 power_count 1
> [   65.096964] qcom-camss 1b00020.camss: vfe_put/886 vfe 1 power_count 1

Ah could you supply this output along with the output from the previous ?

I'm thinking we are calling get() from inside of get().

---
bod

