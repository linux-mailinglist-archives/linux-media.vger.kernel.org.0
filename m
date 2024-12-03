Return-Path: <linux-media+bounces-22574-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9927C9E2E4D
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 22:41:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2637282637
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 21:41:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E90C3209686;
	Tue,  3 Dec 2024 21:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="WsilrPNc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60DF1D7E21;
	Tue,  3 Dec 2024 21:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733262108; cv=none; b=F+fqNfuv1LnEYYNtrbpK+I6aBBqdubZAABGH/t8cjMPsJRlRcXLJtzw2UqpPknELGB+lieN1uUXqVi+jmauP2dOKCqpAppROngY4klS9/xHCRO5/WgdM2NCEKb2APY1HTc50emXJw06OsLoekY5rq8zHi4o/4YRAyhlDuIOpC4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733262108; c=relaxed/simple;
	bh=mJTlG4jpTCmiK6fEVcR7tHj73Bkf/NFxMipc5s54ScY=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=J1YXrmanCqDlcoGXt+/4BQCAS8Zei4OGTspgt6SZGOA5EedwELagzKCUZyI5chZtymC0EMKuAxu51tW7yhzLSSor9wShOJ4cow1oyrLjYUIwZjTME4lR9DVUUZGqYEUm99MiD0JISnKC7FTRcPwdxWdJ9lLLLhHDA0FIEZZJ7I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=WsilrPNc; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from localhost (docker-mailserver-web-1.docker-mailserver_default [172.22.0.5])
	by mail.mainlining.org (Postfix) with ESMTPSA id 20E02E44BC;
	Tue,  3 Dec 2024 21:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1733262103;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VnFVYT1OLdVfc61KkjEJX5OvKSVBzXlz9de9BBok/Sw=;
	b=WsilrPNcj8qLwyJI+vy/KA9SCcnOfUzOgyxW2JA/mP9154JCN80zXESFmnDjpGKjr/J90d
	wxionYPum0XnPDtBSRee1Wv4wAuWbYVUeaoKTIeUgh2B+fbyGhdCvWPyRWICKk1sc8CtWM
	L7ZK24kNkn/EgPmooMpv6HDlAJtNJU2IhXtbdcLMPlz2ASgefIokCpzx5t0LvlpCCCZqZC
	rSIPg09qe5JBpVT89MNxGNniQKBPFfmtwLfhilWeQWuTbLJhNurZ48impUITCQH+5rNtfc
	e4yXTZ8Ey78WAAIMrpBNtGiVhMZ57jLiWcRQgbktD3w4CqnKU/Ws3odYdrk1jg==
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 03 Dec 2024 22:41:43 +0100
From: barnabas.czeman@mainlining.org
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Yassine Oudjana
 <y.oudjana@protonmail.com>
Subject: Re: [PATCH v2] media: qcom: camss: fix VFE pm domain off
In-Reply-To: <13fc0174-8d47-4863-8a5f-5f6f7a0f7a2f@linaro.org>
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
 <13fc0174-8d47-4863-8a5f-5f6f7a0f7a2f@linaro.org>
Message-ID: <7cdee378351bf5909c10299c36ac5848@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2024-12-03 17:49, Bryan O'Donoghue wrote:
> On 03/12/2024 01:02, barnabas.czeman@mainlining.org wrote:
>> On 2024-12-03 00:10, Bryan O'Donoghue wrote:
>>> On 30/11/2024 22:58, barnabas.czeman@mainlining.org wrote:
>>>> On 2024-11-30 22:48, Bryan O'Donoghue wrote:
>>>>> On 29/11/2024 23:52, barnabas.czeman@mainlining.org wrote:
>>>>>> On 2024-11-30 00:07, Bryan O'Donoghue wrote:
>>>>>>> On 29/11/2024 22:45, barnabas.czeman@mainlining.org wrote:
>>>>>>>> On 2024-11-29 23:08, Bryan O'Donoghue wrote:
>>>>>>>>> On 29/11/2024 13:46, barnabas.czeman@mainlining.org wrote:
>>>>>>>>>> On 2024-11-29 13:25, Bryan O'Donoghue wrote:
>>>>>>>>>>> On 29/11/2024 11:44, barnabas.czeman@mainlining.org wrote:
>>>>>>>>>>>>> The change does not describe how to reproduce the problem, 
>>>>>>>>>>>>> which commit
>>>>>>>>>>>>> base is tested, which platform is testes, there is no 
>>>>>>>>>>>>> enough information,
>>>>>>>>>>>>> unfortunately.
>>>>>>>>>>>> I can reproduce the problem with megapixels-sensorprofile on 
>>>>>>>>>>>> msm8953 and
>>>>>>>>>>>> it can be reproduced with megapixels on msm8996.
>>>>>>>>>>>> The base is the last commit on next.
>>>>>>>>>>> 
>>>>>>>>>>> Can you verify if vfe_domain_on has run and if so whether or 
>>>>>>>>>>> not genpd_link is NULL when that function exists.
>>>>>>>>>>> 
>>>>>>>>>> I have added some debug logs it seems pm_domain_on and 
>>>>>>>>>> pm_domain_off is called twice on the same object.
>>>>>>>>>> [   63.473360] qcom-camss 1b00020.camss: pm_domain_on 19842ce8 
>>>>>>>>>> link 42973800
>>>>>>>>>> [   63.481524] qcom-camss 1b00020.camss: pm_domain_on 19840080 
>>>>>>>>>> link 4e413800
>>>>>>>>>> [   63.481555] qcom-camss 1b00020.camss: pm_domain_on 19842ce8 
>>>>>>>>>> link 42973800
>>>>>>>>>> [   63.481632] qcom-camss 1b00020.camss: pm_domain_off 
>>>>>>>>>> 19840080 link 4e413800
>>>>>>>>>> [   63.481641] qcom-camss 1b00020.camss: pm_domain_off 
>>>>>>>>>> 19842ce8 link 42973800
>>>>>>>>>> [   63.654004] qcom-camss 1b00020.camss: pm_domain_off 
>>>>>>>>>> 19842ce8 link 0
>>>>>>>>>>> That's the question.
>>>>>>>>>>> 
>>>>>>>>>>> ---
>>>>>>>>>>> bod
>>>>>>>>> 
>>>>>>>>> Could you provide this output ?
>>>>>>>>> 
>>>>>>>>> index 80a62ba112950..b25b8f6b00be1 100644
>>>>>>>>> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
>>>>>>>>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
>>>>>>>>> @@ -595,6 +595,9 @@ void vfe_isr_reset_ack(struct vfe_device 
>>>>>>>>> *vfe)
>>>>>>>>>   */
>>>>>>>>>  void vfe_pm_domain_off(struct vfe_device *vfe)
>>>>>>>>>  {
>>>>>>>>> +dev_info(camss->dev, "%s VFE %d genpd %pK genpd_link %pK\n",
>>>>>>>>> +        __func__, vfe->id, vfe->genpd, vfe->genpd_link);
>>>>>>>>> +
>>>>>>>>>         if (!vfe->genpd)
>>>>>>>>>                 return;
>>>>>>>>> 
>>>>>>>>> @@ -609,7 +612,8 @@ void vfe_pm_domain_off(struct vfe_device 
>>>>>>>>> *vfe)
>>>>>>>>>  int vfe_pm_domain_on(struct vfe_device *vfe)
>>>>>>>>>  {
>>>>>>>>>         struct camss *camss = vfe->camss;
>>>>>>>>> -
>>>>>>>>> +dev_info(camss->dev, "%s VFE %d genpd %pK genpd_link %pK\n",
>>>>>>>>> +        __func__, vfe->id, vfe->genpd, vfe->genpd_link);
>>>>>>>>>         if (!vfe->genpd)
>>>>>>>>>                 return 0;
>>>>>>>>> 
>>>>>>>>> ---
>>>>>>>>> bod
>>>>>>>> I think logging in pm_domain_on should be placed after 
>>>>>>>> device_link_add because only NULL
>>>>>>>> will be visible.
>>>>>>>> [   83.040694] qcom-camss 1b00020.camss: vfe_pm_domain_on VFE 1 
>>>>>>>> genpd 000000009bd8355f genpd_link 0000000000000000
>>>>>>>> [   83.049293] qcom-camss 1b00020.camss: vfe_pm_domain_on VFE 0 
>>>>>>>> genpd 00000000bfb65e7c genpd_link 0000000000000000
>>>>>>>> [   83.049353] qcom-camss 1b00020.camss: vfe_pm_domain_on VFE 1 
>>>>>>>> genpd 000000009bd8355f genpd_link 00000000ccb0acd9
>>>>>>>> [   83.049641] qcom-camss 1b00020.camss: vfe_pm_domain_off VFE 0 
>>>>>>>> genpd 00000000bfb65e7c genpd_link 00000000348ac3c1
>>>>>>>> [   83.049654] qcom-camss 1b00020.camss: vfe_pm_domain_off VFE 1 
>>>>>>>> genpd 000000009bd8355f genpd_link 00000000ccb0acd9
>>>>>>>> [   83.241498] qcom-camss 1b00020.camss: vfe_pm_domain_off VFE 1 
>>>>>>>> genpd 000000009bd8355f genpd_link 0000000000000000
>>>>>>> 
>>>>>>> Could you add
>>>>>>> 
>>>>>>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
>>>>>>> @@ -786,7 +786,7 @@ int vfe_get(struct vfe_device *vfe)
>>>>>>>         int ret;
>>>>>>> 
>>>>>>>         mutex_lock(&vfe->power_lock);
>>>>>>> -
>>>>>>> +dev_info(vfe->camss->dev, "%s vfe %d power_count %d\n", 
>>>>>>> __func__, vfe->id, vfe->power_count);
>>>>>>>         if (vfe->power_count == 0) {
>>>>>>>                 ret = vfe->res->hw_ops->pm_domain_on(vfe);
>>>>>>>                 if (ret < 0)
>>>>>>> @@ -823,6 +823,7 @@ int vfe_get(struct vfe_device *vfe)
>>>>>>> 
>>>>>>>         mutex_unlock(&vfe->power_lock);
>>>>>>> 
>>>>>>> +dev_info(camss->vfe->dev, "%s vfe %d err=%d\n", __func__, camss- 
>>>>>>> >vfe- >id, 0);
>>>>>>>         return 0;
>>>>>>> 
>>>>>>>  error_reset:
>>>>>>> @@ -835,7 +836,7 @@ int vfe_get(struct vfe_device *vfe)
>>>>>>> 
>>>>>>>  error_pm_domain:
>>>>>>>         mutex_unlock(&vfe->power_lock);
>>>>>>> -
>>>>>>> +dev_info(camss->vfe->dev, "%s vfe %d err=%d\n", __func__, camss- 
>>>>>>> >vfe- >id, ret);
>>>>>>>         return ret;
>>>>>>>  }
>>>>>>> 
>>>>>>> ?
>>>>>>> 
>>>>>>> ---
>>>>>>> bod
>>>>>> I have added little more from the logs because it is only failing 
>>>>>> in edge cases megapixels-sensorprofile failing by
>>>>>> different reason quickly and trying to release the device.
>>>>>> [   54.719030] qcom-camss 1b00020.camss: vfe_get vfe 0 err=0
>>>>>> [   54.750124] qcom-camss 1b00020.camss: vfe_get vfe 0 power_count 
>>>>>> 1
>>>>>> [   54.750236] qcom-camss 1b00020.camss: vfe_get vfe 0 err=0
>>>>>> [   54.751270] qcom-camss 1b00020.camss: vfe_pm_domain_on VFE 0 
>>>>>> genpd 00000000beaef03c genpd_link 00000000251644d9
>>>>> 
>>>>>> [   54.751433] qcom-camss 1b00020.camss: vfe_pm_domain_on VFE 1 
>>>>>> genpd 000000007ce2da53 genpd_link 0000000000000000
>>>>>> [   54.755531] qcom-camss 1b00020.camss: vfe_pm_domain_off VFE 1 
>>>>>> genpd 000000007ce2da53 genpd_link 0000000058dcd4d6
>>>>> 
>>>>> that's a bug genpd_link should be NULL unless power_count != 0
>>>>> 
>>>>>> [  143.922868] qcom-camss 1b00020.camss: vfe_pm_domain_off VFE 1 
>>>>>> genpd 000000007ce2da53 genpd_link 00000000d1fcd54b
>>>>>> [  144.126535] qcom-camss 1b00020.camss: vfe_pm_domain_off VFE 1 
>>>>>> genpd 000000007ce2da53 genpd_link 0000000000000000
>>>>> 
>>>>> this is the corollary of the bug
>>>>> 
>>>>> can you provide the output of the attached please ?
>>>> [   50.787730] qcom-camss 1b00020.camss: vfe_get/806 vfe 1 
>>>> power_count 0
>>>> [   50.794888] qcom-camss 1b00020.camss: vfe_get/811 vfe 1 
>>>> power_count 0
>>>> [   50.795040] qcom-camss 1b00020.camss: vfe_get/816 vfe 1 
>>>> power_count 0
>>>> [   50.795131] qcom-camss 1b00020.camss: vfe_get/822 vfe 1 
>>>> power_count 0
>>>> [   50.795172] qcom-camss 1b00020.camss: vfe_get/827 vfe 1 
>>>> power_count 0
>>>> [   50.795180] qcom-camss 1b00020.camss: vfe_get/830 vfe 1 
>>>> power_count 0
>>>> [   50.795188] qcom-camss 1b00020.camss: vfe_get/841 vfe 1 
>>>> power_count 1
>>>> [   50.795413] qcom-camss 1b00020.camss: vfe_put/868 vfe 1 
>>>> power_count 1
>>>> [   50.795422] qcom-camss 1b00020.camss: vfe_put/874 vfe 1 
>>>> power_count 1
>>>> [   50.795429] qcom-camss 1b00020.camss: vfe_put/882 vfe 1 
>>>> power_count 1
>>>> [   50.795468] qcom-camss 1b00020.camss: vfe_put/884 vfe 1 
>>>> power_count 1
>>>> [   50.799936] qcom-camss 1b00020.camss: vfe_put/886 vfe 1 
>>>> power_count 1
>>>> [   50.800247] qcom-camss 1b00020.camss: vfe_put/888 vfe 1 
>>>> power_count 1
>>>> [   50.800257] qcom-camss 1b00020.camss: vfe_put/891 vfe 1 
>>>> power_count 1
>>>> [   50.800263] qcom-camss 1b00020.camss: vfe_put/893 vfe 1 
>>>> power_count 0
>>>> [   51.086159] qcom-camss 1b00020.camss: vfe_get/801 vfe 0 
>>>> power_count 0
>>>> [   51.088158] qcom-camss 1b00020.camss: vfe_get/806 vfe 0 
>>>> power_count 0
>>>> [   51.092782] qcom-camss 1b00020.camss: vfe_get/811 vfe 0 
>>>> power_count 0
>>>> [   51.092872] qcom-camss 1b00020.camss: vfe_get/816 vfe 0 
>>>> power_count 0
>>>> [   51.092945] qcom-camss 1b00020.camss: vfe_get/822 vfe 0 
>>>> power_count 0
>>>> [   51.092980] qcom-camss 1b00020.camss: vfe_get/827 vfe 0 
>>>> power_count 0
>>>> [   51.092987] qcom-camss 1b00020.camss: vfe_get/830 vfe 0 
>>>> power_count 0
>>>> [   51.092994] qcom-camss 1b00020.camss: vfe_get/841 vfe 0 
>>>> power_count 1
>>>> [   51.117104] qcom-camss 1b00020.camss: vfe_get/841 vfe 0 
>>>> power_count 2
>>>> [   52.181802] qcom-camss 1b00020.camss: vfe_put/868 vfe 0 
>>>> power_count 2
>>>> [   52.181828] qcom-camss 1b00020.camss: vfe_put/891 vfe 0 
>>>> power_count 2
>>>> [   52.181834] qcom-camss 1b00020.camss: vfe_put/893 vfe 0 
>>>> power_count 1
>>>> [   52.189017] qcom-camss 1b00020.camss: vfe_get/841 vfe 0 
>>>> power_count 2
>>>> [   64.920259] qcom-camss 1b00020.camss: vfe_get/841 vfe 0 
>>>> power_count 3
>>>> [   64.920337] qcom-camss 1b00020.camss: vfe_get/841 vfe 0 
>>>> power_count 4
>>>> [   64.920368] qcom-camss 1b00020.camss: vfe_get/801 vfe 1 
>>>> power_count 0
>>>> [   64.920656] qcom-camss 1b00020.camss: vfe_get/806 vfe 1 
>>>> power_count 0
>>>> [   64.920667] qcom-camss 1b00020.camss: vfe_get/811 vfe 1 
>>>> power_count 0
>>>> [   64.920706] qcom-camss 1b00020.camss: vfe_get/816 vfe 1 
>>>> power_count 0
>>>> [   64.920734] qcom-camss 1b00020.camss: vfe_get/822 vfe 1 
>>>> power_count 0
>>>> [   64.920868] qcom-camss 1b00020.camss: vfe_get/827 vfe 1 
>>>> power_count 0
>>>> [   64.920877] qcom-camss 1b00020.camss: vfe_get/830 vfe 1 
>>>> power_count 0
>>>> [   64.920886] qcom-camss 1b00020.camss: vfe_get/841 vfe 1 
>>>> power_count 1
>>>> [   64.920963] qcom-camss 1b00020.camss: vfe_get/841 vfe 1 
>>>> power_count 2
>>>> [   64.921008] qcom-camss 1b00020.camss: vfe_get/841 vfe 1 
>>>> power_count 3
>>>> [   64.921871] qcom-camss 1b00020.camss: vfe_put/868 vfe 0 
>>>> power_count 4
>>>> [   64.921896] qcom-camss 1b00020.camss: vfe_put/891 vfe 0 
>>>> power_count 4
>>>> [   64.921904] qcom-camss 1b00020.camss: vfe_put/893 vfe 0 
>>>> power_count 3
>>>> [   64.927278] qcom-camss 1b00020.camss: vfe_get/841 vfe 0 
>>>> power_count 4
>>>> [   65.096857] qcom-camss 1b00020.camss: vfe_put/868 vfe 1 
>>>> power_count 3
>>>> [   65.096883] qcom-camss 1b00020.camss: vfe_put/891 vfe 1 
>>>> power_count 3
>>>> [   65.096889] qcom-camss 1b00020.camss: vfe_put/893 vfe 1 
>>>> power_count 2
>>>> [   65.096903] qcom-camss 1b00020.camss: vfe_put/868 vfe 1 
>>>> power_count 2
>>>> [   65.096908] qcom-camss 1b00020.camss: vfe_put/891 vfe 1 
>>>> power_count 2
>>>> [   65.096914] qcom-camss 1b00020.camss: vfe_put/893 vfe 1 
>>>> power_count 1
>>>> [   65.096927] qcom-camss 1b00020.camss: vfe_put/868 vfe 1 
>>>> power_count 1
>>>> [   65.096933] qcom-camss 1b00020.camss: vfe_put/874 vfe 1 
>>>> power_count 1
>>>> [   65.096938] qcom-camss 1b00020.camss: vfe_put/882 vfe 1 
>>>> power_count 1
>>>> [   65.096958] qcom-camss 1b00020.camss: vfe_put/884 vfe 1 
>>>> power_count 1
>>>> [   65.096964] qcom-camss 1b00020.camss: vfe_put/886 vfe 1 
>>>> power_count 1
>>> 
>>> Ah could you supply this output along with the output from the 
>>> previous ?
>> [   55.993565] qcom-camss 1b00020.camss: vfe_pm_domain_on VFE 0 genpd 
>> 0000000003dcc927 genpd_link 00000000b216e0c0
>> [   55.993886] qcom-camss 1b00020.camss: vfe_pm_domain_on VFE 1 genpd 
>> 0000000012d2fc9c genpd_link 00000000e1d78ab3
>> [   55.993956] qcom-camss 1b00020.camss: vfe_pm_domain_off VFE 0 genpd 
>> 0000000003dcc927 genpd_link 00000000b216e0c0
>> [   55.993966] qcom-camss 1b00020.camss: vfe_pm_domain_off VFE 1 genpd 
>> 0000000012d2fc9c genpd_link 00000000e1d78ab3
>> [   95.804026] qcom-camss 1b00020.camss: vfe_get vfe 0 power_count 2
>> [   95.804092] qcom-camss 1b00020.camss: vfe_get/845 vfe 0 power_count 
>> 3
>> [   95.804104] qcom-camss 1b00020.camss: vfe_get vfe 0 err=0
>> [   95.804138] qcom-camss 1b00020.camss: vfe_get vfe 0 power_count 3
>> [   95.804158] qcom-camss 1b00020.camss: vfe_get/845 vfe 0 power_count 
>> 4
>> [   95.804169] qcom-camss 1b00020.camss: vfe_get vfe 0 err=0
>> [   95.804203] qcom-camss 1b00020.camss: vfe_get vfe 1 power_count 0
>> [   95.804214] qcom-camss 1b00020.camss: vfe_get/805 vfe 1 power_count 
>> 0
>> [   95.804526] qcom-camss 1b00020.camss: vfe_pm_domain_on VFE 1 genpd 
>> 0000000012d2fc9c genpd_link 00000000cf5c896a
>> [   95.804543] qcom-camss 1b00020.camss: vfe_get/810 vfe 1 power_count 
>> 0
>> [   95.804555] qcom-camss 1b00020.camss: vfe_get/815 vfe 1 power_count 
>> 0
>> [   95.804593] qcom-camss 1b00020.camss: vfe_get/820 vfe 1 power_count 
>> 0
>> [   95.804629] qcom-camss 1b00020.camss: vfe_get/826 vfe 1 power_count 
>> 0
>> [   95.804951] qcom-camss 1b00020.camss: vfe_get/831 vfe 1 power_count 
>> 0
>> [   95.804964] qcom-camss 1b00020.camss: vfe_get/834 vfe 1 power_count 
>> 0
>> [   95.804976] qcom-camss 1b00020.camss: vfe_get/845 vfe 1 power_count 
>> 1
>> [   95.804987] qcom-camss 1b00020.camss: vfe_get vfe 1 err=0
>> [   95.805028] qcom-camss 1b00020.camss: vfe_get vfe 1 power_count 1
>> [   95.805048] qcom-camss 1b00020.camss: vfe_get/845 vfe 1 power_count 
>> 2
>> [   95.805058] qcom-camss 1b00020.camss: vfe_get vfe 1 err=0
>> [   95.805094] qcom-camss 1b00020.camss: vfe_get vfe 1 power_count 2
>> [   95.805113] qcom-camss 1b00020.camss: vfe_get/845 vfe 1 power_count 
>> 3
>> [   95.805123] qcom-camss 1b00020.camss: vfe_get vfe 1 err=0
>> [   95.806117] qcom-camss 1b00020.camss: vfe_put/873 vfe 0 power_count 
>> 4
>> [   95.806131] qcom-camss 1b00020.camss: vfe_put/894 vfe 0 power_count 
>> 4
>> [   95.806142] qcom-camss 1b00020.camss: vfe_put/896 vfe 0 power_count 
>> 3
>> [   95.814108] qcom-camss 1b00020.camss: vfe_get vfe 0 power_count 3
>> [   95.814134] qcom-camss 1b00020.camss: vfe_get/845 vfe 0 power_count 
>> 4
>> [   95.814143] qcom-camss 1b00020.camss: vfe_get vfe 0 err=0
>> [   95.814886] qcom-camss 1b00020.camss: vfe_pm_domain_on VFE 0 genpd 
>> 0000000003dcc927 genpd_link 00000000b216e0c0
>> [   95.814910] qcom-camss 1b00020.camss: vfe_pm_domain_on VFE 1 genpd 
>> 0000000012d2fc9c genpd_link 00000000cf5c896a
>> [   95.815176] qcom-camss 1b00020.camss: vfe_pm_domain_off VFE 0 genpd 
>> 0000000003dcc927 genpd_link 00000000b216e0c0
>> [   95.815190] qcom-camss 1b00020.camss: vfe_pm_domain_off VFE 1 genpd 
>> 0000000012d2fc9c genpd_link 00000000cf5c896a
>> [   96.025733] qcom-camss 1b00020.camss: vfe_put/873 vfe 1 power_count 
>> 3
>> [   96.025756] qcom-camss 1b00020.camss: vfe_put/894 vfe 1 power_count 
>> 3
>> [   96.025762] qcom-camss 1b00020.camss: vfe_put/896 vfe 1 power_count 
>> 2
>> [   96.025775] qcom-camss 1b00020.camss: vfe_put/873 vfe 1 power_count 
>> 2
>> [   96.025790] qcom-camss 1b00020.camss: vfe_put/894 vfe 1 power_count 
>> 2
>> [   96.025806] qcom-camss 1b00020.camss: vfe_put/896 vfe 1 power_count 
>> 1
>> [   96.025839] qcom-camss 1b00020.camss: vfe_put/873 vfe 1 power_count 
>> 1
>> [   96.025856] qcom-camss 1b00020.camss: vfe_put/879 vfe 1 power_count 
>> 1
>> [   96.025907] qcom-camss 1b00020.camss: vfe_put/886 vfe 1 power_count 
>> 1
>> [   96.025952] qcom-camss 1b00020.camss: vfe_put/888 vfe 1 power_count 
>> 1
>> [   96.025972] qcom-camss 1b00020.camss: vfe_pm_domain_off VFE 1 genpd 
>> 0000000012d2fc9c genpd_link 0000000000000000
>>> 
>>> I'm thinking we are calling get() from inside of get().
>>> 
>>> ---
>>> bod
> 
> Pardon me and once more - your full demsg this time.
https://paste.mainlining.org/barni2000/448395820cdb4506beaa43b34df3310a/raw/HEAD/dmesg

