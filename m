Return-Path: <linux-media+bounces-22552-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF629E2815
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 17:50:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C67F28C1A5
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 16:50:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6AB51FAC4E;
	Tue,  3 Dec 2024 16:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cfiq3Hbj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8AF1F8F1D
	for <linux-media@vger.kernel.org>; Tue,  3 Dec 2024 16:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733244595; cv=none; b=ro6aPRexhAUrX6ckxzLSMn6mdQMtwDv7z7fnIBGXxrHCNn/Fe8q32PZKCXWlbM/wvsJWVick/tZHsjKS6swg/XSQkyegvvoXPNbmwqnD5jL0ZR7xGE8BnIQGyk4KbPIZPyk5kdIa7u3p2Qq9p4zHRKbcMA1v+ZyR//t/HLlVZXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733244595; c=relaxed/simple;
	bh=7DpNYavETN2GjTvatWXWYBF1KoMu2GdCiT4meUFxbWY=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=Tr8+p3Vid4yes4Qu1yQVHmEs5s+N6XctbpRe/DJsDw6MErjr9g/3TBj7wshxSyne5ai9oE6K9l+quyFALeqyFE4vRLZvKa4jMZiIN6TGVi+buFer/OJfcAf0WIxFFxAv66WVwECsFUL+pVeeevLpzQHSmMArv0rBO+Fr95jvHtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cfiq3Hbj; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a9a0ef5179dso838651766b.1
        for <linux-media@vger.kernel.org>; Tue, 03 Dec 2024 08:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733244591; x=1733849391; darn=vger.kernel.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zMfCcuMn564j015FqFPplbnrfdjiJRXe3+6HwWrf1v8=;
        b=cfiq3Hbj5+qHBIFNANSkEy7/oB2p2B1DHE8NqcGSfEYBFdIv/N0E1ID02pM3L+9Akc
         xmnHXmdiyy0Y14QNwv1OerUeanE3oodHeZ5565Zoya+RX/NjR1WZvJth2oKOGnCSuMpT
         n86LbsbDM+1wSXVgtI+tGXVIiFbaYpOcEqDnpl+qFzL2iobmKrjjvAaErsNtqVPQKAL7
         d1xIJAU5CTOeceAla4DJdueF6aRbqi3v+0NUkqPx/l5wbE/XoSMNR0F/9jXYQlv+gWNg
         /5utM74jDtD+a+qz2IACW8oSYs1bBx4SGHVQX0BntSNcaw1cXYf8/1bX/FgHtZoGzaGA
         CIXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733244591; x=1733849391;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zMfCcuMn564j015FqFPplbnrfdjiJRXe3+6HwWrf1v8=;
        b=ffiJngBeCUx/C723sMkrY1Q5nQDxC5FL1C4E4lPSbWm8DsPpG2fJ683LMmJow56uLW
         E0o+2HWPFQYF5S6/RpU9hZHDbq4eQ7LnyDMjV4o3+vM03u7v6miN5snZoLKm3hyUs4fB
         HfpGFexA9JMPgmY1O+NO/j0DX+s3/Q3uTnONl7otKSvk9AkZg8BVXWN7WND/Vs5fffVB
         ObjzTLEkY+vujZCOPGkfXuRALt6jfRBj9tTT+mBYrbSPInFUh44PE2BIZyZWL9v7jAye
         UBq8Y8uFIqz+01sSyknFo2IFGqC8mVNpwrIjkgTs/VdrJLN68shEpVTnIdDDiLDpHviO
         dAyw==
X-Forwarded-Encrypted: i=1; AJvYcCW7aA3TaUsMybH3WPjR9DtAEVg/aBlK5PzlrivTlWnou5D7dBlJcjsQu4+sxHypBCiZ90L0hmBiYKsW1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3FT4mPGsWPgD82C6qjqvHM6e65UrMnWemxy2+R65SV7HnySi9
	/5R3xSxW3hLTgOD6AFN8aOc7h4b30lTlsDw7PivBYVOL/X4tXjZWauKhsnQVue8=
X-Gm-Gg: ASbGncu6wOa/oah3sRg6MZlj4lHhG6kJBOpgR4p9ke/P/e/PqrnLGTvpmV5CH9MCxIP
	pYlnYWnsfeiBil2OJpbLoxi7XLIW1xR9nQzp7isjiHJTPxuDKXXSRqSW2OOe0dsao/BfO5YO7sX
	Dm3valTUqccL19NbWQze5jnlRDU5oo+7ij/0zGSoAJU+I5vPJzzvAM97sty8M6CpkUoyd2RimZ+
	EXzwi/VbphRz93eyScmE72SfZoCfjiwq/w2hAT7vjnn94iw6c6DpUU6DgcIhLU=
X-Google-Smtp-Source: AGHT+IFD3Arl8AmcgUDQ3Lj1pQpvjiOwhhih1TjlphLpshL3+0cadHOB7alLC91/6k1J8o0UCXIAKg==
X-Received: by 2002:a17:906:1db2:b0:aa5:d7c:2ad0 with SMTP id a640c23a62f3a-aa5f7d4f3camr198086466b.23.1733244590828;
        Tue, 03 Dec 2024 08:49:50 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5998e6a1asm633188366b.98.2024.12.03.08.49.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 08:49:50 -0800 (PST)
Content-Type: multipart/mixed; boundary="------------a0xltVuvLhEkCIBL8XCdaP1F"
Message-ID: <13fc0174-8d47-4863-8a5f-5f6f7a0f7a2f@linaro.org>
Date: Tue, 3 Dec 2024 16:49:49 +0000
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
 <1d3650f9-fe4d-4972-968a-aaab6fed1044@linaro.org>
 <f6c88d78c53f8a14c91677c90bfb0500@mainlining.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <f6c88d78c53f8a14c91677c90bfb0500@mainlining.org>

This is a multi-part message in MIME format.
--------------a0xltVuvLhEkCIBL8XCdaP1F
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 03/12/2024 01:02, barnabas.czeman@mainlining.org wrote:
> On 2024-12-03 00:10, Bryan O'Donoghue wrote:
>> On 30/11/2024 22:58, barnabas.czeman@mainlining.org wrote:
>>> On 2024-11-30 22:48, Bryan O'Donoghue wrote:
>>>> On 29/11/2024 23:52, barnabas.czeman@mainlining.org wrote:
>>>>> On 2024-11-30 00:07, Bryan O'Donoghue wrote:
>>>>>> On 29/11/2024 22:45, barnabas.czeman@mainlining.org wrote:
>>>>>>> On 2024-11-29 23:08, Bryan O'Donoghue wrote:
>>>>>>>> On 29/11/2024 13:46, barnabas.czeman@mainlining.org wrote:
>>>>>>>>> On 2024-11-29 13:25, Bryan O'Donoghue wrote:
>>>>>>>>>> On 29/11/2024 11:44, barnabas.czeman@mainlining.org wrote:
>>>>>>>>>>>> The change does not describe how to reproduce the problem, 
>>>>>>>>>>>> which commit
>>>>>>>>>>>> base is tested, which platform is testes, there is no enough 
>>>>>>>>>>>> information,
>>>>>>>>>>>> unfortunately.
>>>>>>>>>>> I can reproduce the problem with megapixels-sensorprofile on 
>>>>>>>>>>> msm8953 and
>>>>>>>>>>> it can be reproduced with megapixels on msm8996.
>>>>>>>>>>> The base is the last commit on next.
>>>>>>>>>>
>>>>>>>>>> Can you verify if vfe_domain_on has run and if so whether or 
>>>>>>>>>> not genpd_link is NULL when that function exists.
>>>>>>>>>>
>>>>>>>>> I have added some debug logs it seems pm_domain_on and 
>>>>>>>>> pm_domain_off is called twice on the same object.
>>>>>>>>> [   63.473360] qcom-camss 1b00020.camss: pm_domain_on 19842ce8 
>>>>>>>>> link 42973800
>>>>>>>>> [   63.481524] qcom-camss 1b00020.camss: pm_domain_on 19840080 
>>>>>>>>> link 4e413800
>>>>>>>>> [   63.481555] qcom-camss 1b00020.camss: pm_domain_on 19842ce8 
>>>>>>>>> link 42973800
>>>>>>>>> [   63.481632] qcom-camss 1b00020.camss: pm_domain_off 19840080 
>>>>>>>>> link 4e413800
>>>>>>>>> [   63.481641] qcom-camss 1b00020.camss: pm_domain_off 19842ce8 
>>>>>>>>> link 42973800
>>>>>>>>> [   63.654004] qcom-camss 1b00020.camss: pm_domain_off 19842ce8 
>>>>>>>>> link 0
>>>>>>>>>> That's the question.
>>>>>>>>>>
>>>>>>>>>> ---
>>>>>>>>>> bod
>>>>>>>>
>>>>>>>> Could you provide this output ?
>>>>>>>>
>>>>>>>> index 80a62ba112950..b25b8f6b00be1 100644
>>>>>>>> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
>>>>>>>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
>>>>>>>> @@ -595,6 +595,9 @@ void vfe_isr_reset_ack(struct vfe_device *vfe)
>>>>>>>>   */
>>>>>>>>  void vfe_pm_domain_off(struct vfe_device *vfe)
>>>>>>>>  {
>>>>>>>> +dev_info(camss->dev, "%s VFE %d genpd %pK genpd_link %pK\n",
>>>>>>>> +        __func__, vfe->id, vfe->genpd, vfe->genpd_link);
>>>>>>>> +
>>>>>>>>         if (!vfe->genpd)
>>>>>>>>                 return;
>>>>>>>>
>>>>>>>> @@ -609,7 +612,8 @@ void vfe_pm_domain_off(struct vfe_device *vfe)
>>>>>>>>  int vfe_pm_domain_on(struct vfe_device *vfe)
>>>>>>>>  {
>>>>>>>>         struct camss *camss = vfe->camss;
>>>>>>>> -
>>>>>>>> +dev_info(camss->dev, "%s VFE %d genpd %pK genpd_link %pK\n",
>>>>>>>> +        __func__, vfe->id, vfe->genpd, vfe->genpd_link);
>>>>>>>>         if (!vfe->genpd)
>>>>>>>>                 return 0;
>>>>>>>>
>>>>>>>> ---
>>>>>>>> bod
>>>>>>> I think logging in pm_domain_on should be placed after 
>>>>>>> device_link_add because only NULL
>>>>>>> will be visible.
>>>>>>> [   83.040694] qcom-camss 1b00020.camss: vfe_pm_domain_on VFE 1 
>>>>>>> genpd 000000009bd8355f genpd_link 0000000000000000
>>>>>>> [   83.049293] qcom-camss 1b00020.camss: vfe_pm_domain_on VFE 0 
>>>>>>> genpd 00000000bfb65e7c genpd_link 0000000000000000
>>>>>>> [   83.049353] qcom-camss 1b00020.camss: vfe_pm_domain_on VFE 1 
>>>>>>> genpd 000000009bd8355f genpd_link 00000000ccb0acd9
>>>>>>> [   83.049641] qcom-camss 1b00020.camss: vfe_pm_domain_off VFE 0 
>>>>>>> genpd 00000000bfb65e7c genpd_link 00000000348ac3c1
>>>>>>> [   83.049654] qcom-camss 1b00020.camss: vfe_pm_domain_off VFE 1 
>>>>>>> genpd 000000009bd8355f genpd_link 00000000ccb0acd9
>>>>>>> [   83.241498] qcom-camss 1b00020.camss: vfe_pm_domain_off VFE 1 
>>>>>>> genpd 000000009bd8355f genpd_link 0000000000000000
>>>>>>
>>>>>> Could you add
>>>>>>
>>>>>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
>>>>>> @@ -786,7 +786,7 @@ int vfe_get(struct vfe_device *vfe)
>>>>>>         int ret;
>>>>>>
>>>>>>         mutex_lock(&vfe->power_lock);
>>>>>> -
>>>>>> +dev_info(vfe->camss->dev, "%s vfe %d power_count %d\n", __func__, 
>>>>>> vfe->id, vfe->power_count);
>>>>>>         if (vfe->power_count == 0) {
>>>>>>                 ret = vfe->res->hw_ops->pm_domain_on(vfe);
>>>>>>                 if (ret < 0)
>>>>>> @@ -823,6 +823,7 @@ int vfe_get(struct vfe_device *vfe)
>>>>>>
>>>>>>         mutex_unlock(&vfe->power_lock);
>>>>>>
>>>>>> +dev_info(camss->vfe->dev, "%s vfe %d err=%d\n", __func__, camss- 
>>>>>> >vfe- >id, 0);
>>>>>>         return 0;
>>>>>>
>>>>>>  error_reset:
>>>>>> @@ -835,7 +836,7 @@ int vfe_get(struct vfe_device *vfe)
>>>>>>
>>>>>>  error_pm_domain:
>>>>>>         mutex_unlock(&vfe->power_lock);
>>>>>> -
>>>>>> +dev_info(camss->vfe->dev, "%s vfe %d err=%d\n", __func__, camss- 
>>>>>> >vfe- >id, ret);
>>>>>>         return ret;
>>>>>>  }
>>>>>>
>>>>>> ?
>>>>>>
>>>>>> ---
>>>>>> bod
>>>>> I have added little more from the logs because it is only failing 
>>>>> in edge cases megapixels-sensorprofile failing by
>>>>> different reason quickly and trying to release the device.
>>>>> [   54.719030] qcom-camss 1b00020.camss: vfe_get vfe 0 err=0
>>>>> [   54.750124] qcom-camss 1b00020.camss: vfe_get vfe 0 power_count 1
>>>>> [   54.750236] qcom-camss 1b00020.camss: vfe_get vfe 0 err=0
>>>>> [   54.751270] qcom-camss 1b00020.camss: vfe_pm_domain_on VFE 0 
>>>>> genpd 00000000beaef03c genpd_link 00000000251644d9
>>>>
>>>>> [   54.751433] qcom-camss 1b00020.camss: vfe_pm_domain_on VFE 1 
>>>>> genpd 000000007ce2da53 genpd_link 0000000000000000
>>>>> [   54.755531] qcom-camss 1b00020.camss: vfe_pm_domain_off VFE 1 
>>>>> genpd 000000007ce2da53 genpd_link 0000000058dcd4d6
>>>>
>>>> that's a bug genpd_link should be NULL unless power_count != 0
>>>>
>>>>> [  143.922868] qcom-camss 1b00020.camss: vfe_pm_domain_off VFE 1 
>>>>> genpd 000000007ce2da53 genpd_link 00000000d1fcd54b
>>>>> [  144.126535] qcom-camss 1b00020.camss: vfe_pm_domain_off VFE 1 
>>>>> genpd 000000007ce2da53 genpd_link 0000000000000000
>>>>
>>>> this is the corollary of the bug
>>>>
>>>> can you provide the output of the attached please ?
>>> [   50.787730] qcom-camss 1b00020.camss: vfe_get/806 vfe 1 power_count 0
>>> [   50.794888] qcom-camss 1b00020.camss: vfe_get/811 vfe 1 power_count 0
>>> [   50.795040] qcom-camss 1b00020.camss: vfe_get/816 vfe 1 power_count 0
>>> [   50.795131] qcom-camss 1b00020.camss: vfe_get/822 vfe 1 power_count 0
>>> [   50.795172] qcom-camss 1b00020.camss: vfe_get/827 vfe 1 power_count 0
>>> [   50.795180] qcom-camss 1b00020.camss: vfe_get/830 vfe 1 power_count 0
>>> [   50.795188] qcom-camss 1b00020.camss: vfe_get/841 vfe 1 power_count 1
>>> [   50.795413] qcom-camss 1b00020.camss: vfe_put/868 vfe 1 power_count 1
>>> [   50.795422] qcom-camss 1b00020.camss: vfe_put/874 vfe 1 power_count 1
>>> [   50.795429] qcom-camss 1b00020.camss: vfe_put/882 vfe 1 power_count 1
>>> [   50.795468] qcom-camss 1b00020.camss: vfe_put/884 vfe 1 power_count 1
>>> [   50.799936] qcom-camss 1b00020.camss: vfe_put/886 vfe 1 power_count 1
>>> [   50.800247] qcom-camss 1b00020.camss: vfe_put/888 vfe 1 power_count 1
>>> [   50.800257] qcom-camss 1b00020.camss: vfe_put/891 vfe 1 power_count 1
>>> [   50.800263] qcom-camss 1b00020.camss: vfe_put/893 vfe 1 power_count 0
>>> [   51.086159] qcom-camss 1b00020.camss: vfe_get/801 vfe 0 power_count 0
>>> [   51.088158] qcom-camss 1b00020.camss: vfe_get/806 vfe 0 power_count 0
>>> [   51.092782] qcom-camss 1b00020.camss: vfe_get/811 vfe 0 power_count 0
>>> [   51.092872] qcom-camss 1b00020.camss: vfe_get/816 vfe 0 power_count 0
>>> [   51.092945] qcom-camss 1b00020.camss: vfe_get/822 vfe 0 power_count 0
>>> [   51.092980] qcom-camss 1b00020.camss: vfe_get/827 vfe 0 power_count 0
>>> [   51.092987] qcom-camss 1b00020.camss: vfe_get/830 vfe 0 power_count 0
>>> [   51.092994] qcom-camss 1b00020.camss: vfe_get/841 vfe 0 power_count 1
>>> [   51.117104] qcom-camss 1b00020.camss: vfe_get/841 vfe 0 power_count 2
>>> [   52.181802] qcom-camss 1b00020.camss: vfe_put/868 vfe 0 power_count 2
>>> [   52.181828] qcom-camss 1b00020.camss: vfe_put/891 vfe 0 power_count 2
>>> [   52.181834] qcom-camss 1b00020.camss: vfe_put/893 vfe 0 power_count 1
>>> [   52.189017] qcom-camss 1b00020.camss: vfe_get/841 vfe 0 power_count 2
>>> [   64.920259] qcom-camss 1b00020.camss: vfe_get/841 vfe 0 power_count 3
>>> [   64.920337] qcom-camss 1b00020.camss: vfe_get/841 vfe 0 power_count 4
>>> [   64.920368] qcom-camss 1b00020.camss: vfe_get/801 vfe 1 power_count 0
>>> [   64.920656] qcom-camss 1b00020.camss: vfe_get/806 vfe 1 power_count 0
>>> [   64.920667] qcom-camss 1b00020.camss: vfe_get/811 vfe 1 power_count 0
>>> [   64.920706] qcom-camss 1b00020.camss: vfe_get/816 vfe 1 power_count 0
>>> [   64.920734] qcom-camss 1b00020.camss: vfe_get/822 vfe 1 power_count 0
>>> [   64.920868] qcom-camss 1b00020.camss: vfe_get/827 vfe 1 power_count 0
>>> [   64.920877] qcom-camss 1b00020.camss: vfe_get/830 vfe 1 power_count 0
>>> [   64.920886] qcom-camss 1b00020.camss: vfe_get/841 vfe 1 power_count 1
>>> [   64.920963] qcom-camss 1b00020.camss: vfe_get/841 vfe 1 power_count 2
>>> [   64.921008] qcom-camss 1b00020.camss: vfe_get/841 vfe 1 power_count 3
>>> [   64.921871] qcom-camss 1b00020.camss: vfe_put/868 vfe 0 power_count 4
>>> [   64.921896] qcom-camss 1b00020.camss: vfe_put/891 vfe 0 power_count 4
>>> [   64.921904] qcom-camss 1b00020.camss: vfe_put/893 vfe 0 power_count 3
>>> [   64.927278] qcom-camss 1b00020.camss: vfe_get/841 vfe 0 power_count 4
>>> [   65.096857] qcom-camss 1b00020.camss: vfe_put/868 vfe 1 power_count 3
>>> [   65.096883] qcom-camss 1b00020.camss: vfe_put/891 vfe 1 power_count 3
>>> [   65.096889] qcom-camss 1b00020.camss: vfe_put/893 vfe 1 power_count 2
>>> [   65.096903] qcom-camss 1b00020.camss: vfe_put/868 vfe 1 power_count 2
>>> [   65.096908] qcom-camss 1b00020.camss: vfe_put/891 vfe 1 power_count 2
>>> [   65.096914] qcom-camss 1b00020.camss: vfe_put/893 vfe 1 power_count 1
>>> [   65.096927] qcom-camss 1b00020.camss: vfe_put/868 vfe 1 power_count 1
>>> [   65.096933] qcom-camss 1b00020.camss: vfe_put/874 vfe 1 power_count 1
>>> [   65.096938] qcom-camss 1b00020.camss: vfe_put/882 vfe 1 power_count 1
>>> [   65.096958] qcom-camss 1b00020.camss: vfe_put/884 vfe 1 power_count 1
>>> [   65.096964] qcom-camss 1b00020.camss: vfe_put/886 vfe 1 power_count 1
>>
>> Ah could you supply this output along with the output from the previous ?
> [   55.993565] qcom-camss 1b00020.camss: vfe_pm_domain_on VFE 0 genpd 
> 0000000003dcc927 genpd_link 00000000b216e0c0
> [   55.993886] qcom-camss 1b00020.camss: vfe_pm_domain_on VFE 1 genpd 
> 0000000012d2fc9c genpd_link 00000000e1d78ab3
> [   55.993956] qcom-camss 1b00020.camss: vfe_pm_domain_off VFE 0 genpd 
> 0000000003dcc927 genpd_link 00000000b216e0c0
> [   55.993966] qcom-camss 1b00020.camss: vfe_pm_domain_off VFE 1 genpd 
> 0000000012d2fc9c genpd_link 00000000e1d78ab3
> [   95.804026] qcom-camss 1b00020.camss: vfe_get vfe 0 power_count 2
> [   95.804092] qcom-camss 1b00020.camss: vfe_get/845 vfe 0 power_count 3
> [   95.804104] qcom-camss 1b00020.camss: vfe_get vfe 0 err=0
> [   95.804138] qcom-camss 1b00020.camss: vfe_get vfe 0 power_count 3
> [   95.804158] qcom-camss 1b00020.camss: vfe_get/845 vfe 0 power_count 4
> [   95.804169] qcom-camss 1b00020.camss: vfe_get vfe 0 err=0
> [   95.804203] qcom-camss 1b00020.camss: vfe_get vfe 1 power_count 0
> [   95.804214] qcom-camss 1b00020.camss: vfe_get/805 vfe 1 power_count 0
> [   95.804526] qcom-camss 1b00020.camss: vfe_pm_domain_on VFE 1 genpd 
> 0000000012d2fc9c genpd_link 00000000cf5c896a
> [   95.804543] qcom-camss 1b00020.camss: vfe_get/810 vfe 1 power_count 0
> [   95.804555] qcom-camss 1b00020.camss: vfe_get/815 vfe 1 power_count 0
> [   95.804593] qcom-camss 1b00020.camss: vfe_get/820 vfe 1 power_count 0
> [   95.804629] qcom-camss 1b00020.camss: vfe_get/826 vfe 1 power_count 0
> [   95.804951] qcom-camss 1b00020.camss: vfe_get/831 vfe 1 power_count 0
> [   95.804964] qcom-camss 1b00020.camss: vfe_get/834 vfe 1 power_count 0
> [   95.804976] qcom-camss 1b00020.camss: vfe_get/845 vfe 1 power_count 1
> [   95.804987] qcom-camss 1b00020.camss: vfe_get vfe 1 err=0
> [   95.805028] qcom-camss 1b00020.camss: vfe_get vfe 1 power_count 1
> [   95.805048] qcom-camss 1b00020.camss: vfe_get/845 vfe 1 power_count 2
> [   95.805058] qcom-camss 1b00020.camss: vfe_get vfe 1 err=0
> [   95.805094] qcom-camss 1b00020.camss: vfe_get vfe 1 power_count 2
> [   95.805113] qcom-camss 1b00020.camss: vfe_get/845 vfe 1 power_count 3
> [   95.805123] qcom-camss 1b00020.camss: vfe_get vfe 1 err=0
> [   95.806117] qcom-camss 1b00020.camss: vfe_put/873 vfe 0 power_count 4
> [   95.806131] qcom-camss 1b00020.camss: vfe_put/894 vfe 0 power_count 4
> [   95.806142] qcom-camss 1b00020.camss: vfe_put/896 vfe 0 power_count 3
> [   95.814108] qcom-camss 1b00020.camss: vfe_get vfe 0 power_count 3
> [   95.814134] qcom-camss 1b00020.camss: vfe_get/845 vfe 0 power_count 4
> [   95.814143] qcom-camss 1b00020.camss: vfe_get vfe 0 err=0
> [   95.814886] qcom-camss 1b00020.camss: vfe_pm_domain_on VFE 0 genpd 
> 0000000003dcc927 genpd_link 00000000b216e0c0
> [   95.814910] qcom-camss 1b00020.camss: vfe_pm_domain_on VFE 1 genpd 
> 0000000012d2fc9c genpd_link 00000000cf5c896a
> [   95.815176] qcom-camss 1b00020.camss: vfe_pm_domain_off VFE 0 genpd 
> 0000000003dcc927 genpd_link 00000000b216e0c0
> [   95.815190] qcom-camss 1b00020.camss: vfe_pm_domain_off VFE 1 genpd 
> 0000000012d2fc9c genpd_link 00000000cf5c896a
> [   96.025733] qcom-camss 1b00020.camss: vfe_put/873 vfe 1 power_count 3
> [   96.025756] qcom-camss 1b00020.camss: vfe_put/894 vfe 1 power_count 3
> [   96.025762] qcom-camss 1b00020.camss: vfe_put/896 vfe 1 power_count 2
> [   96.025775] qcom-camss 1b00020.camss: vfe_put/873 vfe 1 power_count 2
> [   96.025790] qcom-camss 1b00020.camss: vfe_put/894 vfe 1 power_count 2
> [   96.025806] qcom-camss 1b00020.camss: vfe_put/896 vfe 1 power_count 1
> [   96.025839] qcom-camss 1b00020.camss: vfe_put/873 vfe 1 power_count 1
> [   96.025856] qcom-camss 1b00020.camss: vfe_put/879 vfe 1 power_count 1
> [   96.025907] qcom-camss 1b00020.camss: vfe_put/886 vfe 1 power_count 1
> [   96.025952] qcom-camss 1b00020.camss: vfe_put/888 vfe 1 power_count 1
> [   96.025972] qcom-camss 1b00020.camss: vfe_pm_domain_off VFE 1 genpd 
> 0000000012d2fc9c genpd_link 0000000000000000
>>
>> I'm thinking we are calling get() from inside of get().
>>
>> ---
>> bod

Pardon me and once more - your full demsg this time.


--------------a0xltVuvLhEkCIBL8XCdaP1F
Content-Type: text/x-patch; charset=UTF-8; name="debug.diff"
Content-Disposition: attachment; filename="debug.diff"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vcWNvbS9jYW1zcy9jYW1zcy12
ZmUuYyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vcWNvbS9jYW1zcy9jYW1zcy12ZmUuYwpp
bmRleCA4MGE2MmJhMTEyOTUwLi5mYTVkYTA1ZDAyY2YxIDEwMDY0NAotLS0gYS9kcml2ZXJz
L21lZGlhL3BsYXRmb3JtL3Fjb20vY2Ftc3MvY2Ftc3MtdmZlLmMKKysrIGIvZHJpdmVycy9t
ZWRpYS9wbGF0Zm9ybS9xY29tL2NhbXNzL2NhbXNzLXZmZS5jCkBAIC01OTUsOSArNTk1LDEy
IEBAIHZvaWQgdmZlX2lzcl9yZXNldF9hY2soc3RydWN0IHZmZV9kZXZpY2UgKnZmZSkKICAq
Lwogdm9pZCB2ZmVfcG1fZG9tYWluX29mZihzdHJ1Y3QgdmZlX2RldmljZSAqdmZlKQogewor
CVdBUk4oMSwgIm9mZiIpOworZGV2X2luZm8odmZlLT5jYW1zcy0+ZGV2LCAiJXMvJWQgdmZl
ICVkIHZmZS0+Z2VucGQgJXBLIGdlbnBkX2xpbmsgJXBLIHBvd2VyLWNvdW50ICVkXG4iLCBf
X2Z1bmNfXywgX19MSU5FX18sIHZmZS0+aWQsIHZmZS0+Z2VucGQsIHZmZS0+Z2VucGRfbGlu
aywgdmZlLT5wb3dlcl9jb3VudCk7CiAJaWYgKCF2ZmUtPmdlbnBkKQogCQlyZXR1cm47CiAK
K2Rldl9pbmZvKHZmZS0+Y2Ftc3MtPmRldiwgIiVzLyVkIHZmZSAlZCB2ZmUtPmdlbnBkICVw
SyBnZW5wZF9saW5rICVwSyBwb3dlci1jb3VudCAlZFxuIiwgX19mdW5jX18sIF9fTElORV9f
LCB2ZmUtPmlkLCB2ZmUtPmdlbnBkLCB2ZmUtPmdlbnBkX2xpbmssIHZmZS0+cG93ZXJfY291
bnQpOwogCWRldmljZV9saW5rX2RlbCh2ZmUtPmdlbnBkX2xpbmspOwogCXZmZS0+Z2VucGRf
bGluayA9IE5VTEw7CiB9CkBAIC02MDksMTQgKzYxMiwxNyBAQCB2b2lkIHZmZV9wbV9kb21h
aW5fb2ZmKHN0cnVjdCB2ZmVfZGV2aWNlICp2ZmUpCiBpbnQgdmZlX3BtX2RvbWFpbl9vbihz
dHJ1Y3QgdmZlX2RldmljZSAqdmZlKQogewogCXN0cnVjdCBjYW1zcyAqY2Ftc3MgPSB2ZmUt
PmNhbXNzOwotCisJV0FSTigxLCAib24iKTsKK2Rldl9pbmZvKHZmZS0+Y2Ftc3MtPmRldiwg
IiVzLyVkIHZmZSAlZCB2ZmUtPmdlbnBkICVwSyBnZW5wZF9saW5rICVwSyBwb3dlci1jb3Vu
dCAlZFxuIiwgX19mdW5jX18sIF9fTElORV9fLCB2ZmUtPmlkLCB2ZmUtPmdlbnBkLCB2ZmUt
PmdlbnBkX2xpbmssIHZmZS0+cG93ZXJfY291bnQpOwogCWlmICghdmZlLT5nZW5wZCkKIAkJ
cmV0dXJuIDA7CiAKK2Rldl9pbmZvKHZmZS0+Y2Ftc3MtPmRldiwgIiVzLyVkIHZmZSAlZCB2
ZmUtPmdlbnBkICVwSyBnZW5wZF9saW5rICVwSyBwb3dlci1jb3VudCAlZFxuIiwgX19mdW5j
X18sIF9fTElORV9fLCB2ZmUtPmlkLCB2ZmUtPmdlbnBkLCB2ZmUtPmdlbnBkX2xpbmssIHZm
ZS0+cG93ZXJfY291bnQpOwogCXZmZS0+Z2VucGRfbGluayA9IGRldmljZV9saW5rX2FkZChj
YW1zcy0+ZGV2LCB2ZmUtPmdlbnBkLAogCQkJCQkgIERMX0ZMQUdfU1RBVEVMRVNTIHwKIAkJ
CQkJICBETF9GTEFHX1BNX1JVTlRJTUUgfAogCQkJCQkgIERMX0ZMQUdfUlBNX0FDVElWRSk7
CitkZXZfaW5mbyh2ZmUtPmNhbXNzLT5kZXYsICIlcy8lZCB2ZmUgJWQgdmZlLT5nZW5wZCAl
cEsgZ2VucGRfbGluayAlcEsgcG93ZXItY291bnQgJWRcbiIsIF9fZnVuY19fLCBfX0xJTkVf
XywgdmZlLT5pZCwgdmZlLT5nZW5wZCwgdmZlLT5nZW5wZF9saW5rLCB2ZmUtPnBvd2VyX2Nv
dW50KTsKIAlpZiAoIXZmZS0+Z2VucGRfbGluaykKIAkJcmV0dXJuIC1FSU5WQUw7CiAKQEAg
LTc3NCw2ICs3ODAsNyBAQCBzdGF0aWMgaW50IHZmZV9jaGVja19jbG9ja19yYXRlcyhzdHJ1
Y3QgdmZlX2RldmljZSAqdmZlKQogCiAJcmV0dXJuIDA7CiB9CisjZGVmaW5lIHZmZV9idWdf
dHJhY2UodmZlKSBkZXZfaW5mbyh2ZmUtPmNhbXNzLT5kZXYsICIlcy8lZCB2ZmUgJWQgcG93
ZXJfY291bnQgJWRcbiIsIF9fZnVuY19fLCBfX0xJTkVfXywgdmZlLT5pZCwgdmZlLT5wb3dl
cl9jb3VudCk7CiAKIC8qCiAgKiB2ZmVfZ2V0IC0gUG93ZXIgdXAgYW5kIHJlc2V0IFZGRSBt
b2R1bGUKQEAgLTc4NiwzMSArNzkzLDM3IEBAIGludCB2ZmVfZ2V0KHN0cnVjdCB2ZmVfZGV2
aWNlICp2ZmUpCiAJaW50IHJldDsKIAogCW11dGV4X2xvY2soJnZmZS0+cG93ZXJfbG9jayk7
Ci0KIAlpZiAodmZlLT5wb3dlcl9jb3VudCA9PSAwKSB7CisJCXZmZV9idWdfdHJhY2UodmZl
KTsKIAkJcmV0ID0gdmZlLT5yZXMtPmh3X29wcy0+cG1fZG9tYWluX29uKHZmZSk7CiAJCWlm
IChyZXQgPCAwKQogCQkJZ290byBlcnJvcl9wbV9kb21haW47CiAKKwkJdmZlX2J1Z190cmFj
ZSh2ZmUpOwogCQlyZXQgPSBwbV9ydW50aW1lX3Jlc3VtZV9hbmRfZ2V0KHZmZS0+Y2Ftc3Mt
PmRldik7CiAJCWlmIChyZXQgPCAwKQogCQkJZ290byBlcnJvcl9kb21haW5fb2ZmOwogCisJ
CXZmZV9idWdfdHJhY2UodmZlKTsKIAkJcmV0ID0gdmZlX3NldF9jbG9ja19yYXRlcyh2ZmUp
OwogCQlpZiAocmV0IDwgMCkKIAkJCWdvdG8gZXJyb3JfcG1fcnVudGltZV9nZXQ7CiAKKwkJ
dmZlX2J1Z190cmFjZSh2ZmUpOwogCQlyZXQgPSBjYW1zc19lbmFibGVfY2xvY2tzKHZmZS0+
bmNsb2NrcywgdmZlLT5jbG9jaywKIAkJCQkJICB2ZmUtPmNhbXNzLT5kZXYpOwogCQlpZiAo
cmV0IDwgMCkKIAkJCWdvdG8gZXJyb3JfcG1fcnVudGltZV9nZXQ7CiAKKwkJdmZlX2J1Z190
cmFjZSh2ZmUpOwogCQlyZXQgPSB2ZmVfcmVzZXQodmZlKTsKIAkJaWYgKHJldCA8IDApCiAJ
CQlnb3RvIGVycm9yX3Jlc2V0OwogCisJCXZmZV9idWdfdHJhY2UodmZlKTsKIAkJdmZlX3Jl
c2V0X291dHB1dF9tYXBzKHZmZSk7CiAKKwkJdmZlX2J1Z190cmFjZSh2ZmUpOwogCQl2ZmVf
aW5pdF9vdXRwdXRzKHZmZSk7CiAKIAkJdmZlLT5yZXMtPmh3X29wcy0+aHdfdmVyc2lvbih2
ZmUpOwpAQCAtODIxLDYgKzgzNCw3IEBAIGludCB2ZmVfZ2V0KHN0cnVjdCB2ZmVfZGV2aWNl
ICp2ZmUpCiAJfQogCXZmZS0+cG93ZXJfY291bnQrKzsKIAorCXZmZV9idWdfdHJhY2UodmZl
KTsKIAltdXRleF91bmxvY2soJnZmZS0+cG93ZXJfbG9jayk7CiAKIAlyZXR1cm4gMDsKQEAg
LTgzNSw3ICs4NDksNyBAQCBpbnQgdmZlX2dldChzdHJ1Y3QgdmZlX2RldmljZSAqdmZlKQog
CiBlcnJvcl9wbV9kb21haW46CiAJbXV0ZXhfdW5sb2NrKCZ2ZmUtPnBvd2VyX2xvY2spOwot
CitkZXZfaW5mbyh2ZmUtPmNhbXNzLT5kZXYsICIlcyB2ZmUgJWQgZXJyPSVkXG4iLCBfX2Z1
bmNfXywgdmZlLT5pZCwgcmV0KTsKIAlyZXR1cm4gcmV0OwogfQogCkBAIC04NDcsMjAgKzg2
MSwzMiBAQCB2b2lkIHZmZV9wdXQoc3RydWN0IHZmZV9kZXZpY2UgKnZmZSkKIHsKIAltdXRl
eF9sb2NrKCZ2ZmUtPnBvd2VyX2xvY2spOwogCisJdmZlX2J1Z190cmFjZSh2ZmUpOwogCWlm
ICh2ZmUtPnBvd2VyX2NvdW50ID09IDApIHsKKwkJdmZlX2J1Z190cmFjZSh2ZmUpOwogCQlk
ZXZfZXJyKHZmZS0+Y2Ftc3MtPmRldiwgInZmZSBwb3dlciBvZmYgb24gcG93ZXJfY291bnQg
PT0gMFxuIik7CiAJCWdvdG8gZXhpdDsKIAl9IGVsc2UgaWYgKHZmZS0+cG93ZXJfY291bnQg
PT0gMSkgeworCQl2ZmVfYnVnX3RyYWNlKHZmZSk7CiAJCWlmICh2ZmUtPndhc19zdHJlYW1p
bmcpIHsKKwkJCXZmZV9idWdfdHJhY2UodmZlKTsKIAkJCXZmZS0+d2FzX3N0cmVhbWluZyA9
IDA7CisJCQl2ZmVfYnVnX3RyYWNlKHZmZSk7CiAJCQl2ZmUtPnJlcy0+aHdfb3BzLT52ZmVf
aGFsdCh2ZmUpOworCQkJdmZlX2J1Z190cmFjZSh2ZmUpOwogCQl9CisJCXZmZV9idWdfdHJh
Y2UodmZlKTsKIAkJY2Ftc3NfZGlzYWJsZV9jbG9ja3ModmZlLT5uY2xvY2tzLCB2ZmUtPmNs
b2NrKTsKKwkJdmZlX2J1Z190cmFjZSh2ZmUpOwogCQlwbV9ydW50aW1lX3B1dF9zeW5jKHZm
ZS0+Y2Ftc3MtPmRldik7CisJCXZmZV9idWdfdHJhY2UodmZlKTsKIAkJdmZlLT5yZXMtPmh3
X29wcy0+cG1fZG9tYWluX29mZih2ZmUpOworCQl2ZmVfYnVnX3RyYWNlKHZmZSk7CiAJfQog
CisJdmZlX2J1Z190cmFjZSh2ZmUpOwogCXZmZS0+cG93ZXJfY291bnQtLTsKKwl2ZmVfYnVn
X3RyYWNlKHZmZSk7CiAKIGV4aXQ6CiAJbXV0ZXhfdW5sb2NrKCZ2ZmUtPnBvd2VyX2xvY2sp
Owo=

--------------a0xltVuvLhEkCIBL8XCdaP1F--

