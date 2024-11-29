Return-Path: <linux-media+bounces-22380-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E55C29DEDAD
	for <lists+linux-media@lfdr.de>; Sat, 30 Nov 2024 00:52:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5479281C2A
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 23:52:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE6C71A01BD;
	Fri, 29 Nov 2024 23:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="LICjCR73"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFCAF176FB4;
	Fri, 29 Nov 2024 23:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732924343; cv=none; b=GsjuMDHTZJspZ14rze1XHZZftWJnF4fsIO1jJq+TVO/omGzS90ByzvuSRaWrItibtqRrg7wW6DIKkFpN1iPvucdfAhcZkiPleW9+mA25gE2PTJy13WbdXwV0xg//TdedxT2iuAXk55Am13uRASaD8Dj0z2LfICbvO+Ro7VNMnSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732924343; c=relaxed/simple;
	bh=oSfmQXGCDTZ0/nRPFijCQ2yxYx4THq27wmZCjGeCgMQ=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=WwCCmefhvmzbvgaXFzknNMYjy3zDJxbpeTX7Cb6POfavVA5yWKiZv4NnmNRqVzX49GSBa0aswKgvi7TNi8aWoC8rBsWIjkIj7tGE4xU32IAtKbQA88a4YqLZMB22F3xWJLjRH5Cir4eZo9qTF8EJekxkDGxIt217g4PTI+Xfr44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=LICjCR73; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from localhost (docker-mailserver-web-1.docker-mailserver_default [172.22.0.5])
	by mail.mainlining.org (Postfix) with ESMTPSA id 312A5E4804;
	Fri, 29 Nov 2024 23:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1732924338;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xg2lwF+3JBp/+AqQy4lofy085EgqGXOyCoznyoiH4L0=;
	b=LICjCR73D1YpRvPKE4e9QovwNMMKaogI2K/0h58IyiXUOdfaGpVFTFA2awhXMc7MejUi+r
	ol9DbGhNPq+VuLeJwPpiyKpwUHBHKe+0mgwCgOxAid/mKPUMG9AfvrKoKLj8Fa0z5nn9TV
	nTK4bOCg8SoA8DeBDdp4il0bKgE1DVqVqpY7D4AFRdxxvLJJ1J0Sf4VDLfk8z7gfLgAZBh
	3zo1D/L/2aYpgBkrGZ+eAjQON1oubmgiOhgfE7cOSCBamGyTDno6kGfxWd1xyB6bsaCseV
	X+pmU5aEg6/cPRtboKmgl2ZP9hgCpvO/h+jeO11Pj1Tv8EcTXt+4iWo1U4244A==
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sat, 30 Nov 2024 00:52:18 +0100
From: barnabas.czeman@mainlining.org
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Yassine Oudjana
 <y.oudjana@protonmail.com>
Subject: Re: [PATCH v2] media: qcom: camss: fix VFE pm domain off
In-Reply-To: <93028653-9919-460e-83d3-84bf5ade56d4@linaro.org>
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
Message-ID: <c7a9a43eea8bd1e6302ae4fa2d79dd80@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2024-11-30 00:07, Bryan O'Donoghue wrote:
> On 29/11/2024 22:45, barnabas.czeman@mainlining.org wrote:
>> On 2024-11-29 23:08, Bryan O'Donoghue wrote:
>>> On 29/11/2024 13:46, barnabas.czeman@mainlining.org wrote:
>>>> On 2024-11-29 13:25, Bryan O'Donoghue wrote:
>>>>> On 29/11/2024 11:44, barnabas.czeman@mainlining.org wrote:
>>>>>>> The change does not describe how to reproduce the problem, which 
>>>>>>> commit
>>>>>>> base is tested, which platform is testes, there is no enough 
>>>>>>> information,
>>>>>>> unfortunately.
>>>>>> I can reproduce the problem with megapixels-sensorprofile on 
>>>>>> msm8953 and
>>>>>> it can be reproduced with megapixels on msm8996.
>>>>>> The base is the last commit on next.
>>>>> 
>>>>> Can you verify if vfe_domain_on has run and if so whether or not 
>>>>> genpd_link is NULL when that function exists.
>>>>> 
>>>> I have added some debug logs it seems pm_domain_on and pm_domain_off 
>>>> is called twice on the same object.
>>>> [   63.473360] qcom-camss 1b00020.camss: pm_domain_on 19842ce8 link 
>>>> 42973800
>>>> [   63.481524] qcom-camss 1b00020.camss: pm_domain_on 19840080 link 
>>>> 4e413800
>>>> [   63.481555] qcom-camss 1b00020.camss: pm_domain_on 19842ce8 link 
>>>> 42973800
>>>> [   63.481632] qcom-camss 1b00020.camss: pm_domain_off 19840080 link 
>>>> 4e413800
>>>> [   63.481641] qcom-camss 1b00020.camss: pm_domain_off 19842ce8 link 
>>>> 42973800
>>>> [   63.654004] qcom-camss 1b00020.camss: pm_domain_off 19842ce8 link 
>>>> 0
>>>>> That's the question.
>>>>> 
>>>>> ---
>>>>> bod
>>> 
>>> Could you provide this output ?
>>> 
>>> index 80a62ba112950..b25b8f6b00be1 100644
>>> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
>>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
>>> @@ -595,6 +595,9 @@ void vfe_isr_reset_ack(struct vfe_device *vfe)
>>>   */
>>>  void vfe_pm_domain_off(struct vfe_device *vfe)
>>>  {
>>> +dev_info(camss->dev, "%s VFE %d genpd %pK genpd_link %pK\n",
>>> +        __func__, vfe->id, vfe->genpd, vfe->genpd_link);
>>> +
>>>         if (!vfe->genpd)
>>>                 return;
>>> 
>>> @@ -609,7 +612,8 @@ void vfe_pm_domain_off(struct vfe_device *vfe)
>>>  int vfe_pm_domain_on(struct vfe_device *vfe)
>>>  {
>>>         struct camss *camss = vfe->camss;
>>> -
>>> +dev_info(camss->dev, "%s VFE %d genpd %pK genpd_link %pK\n",
>>> +        __func__, vfe->id, vfe->genpd, vfe->genpd_link);
>>>         if (!vfe->genpd)
>>>                 return 0;
>>> 
>>> ---
>>> bod
>> I think logging in pm_domain_on should be placed after device_link_add 
>> because only NULL
>> will be visible.
>> [   83.040694] qcom-camss 1b00020.camss: vfe_pm_domain_on VFE 1 genpd 
>> 000000009bd8355f genpd_link 0000000000000000
>> [   83.049293] qcom-camss 1b00020.camss: vfe_pm_domain_on VFE 0 genpd 
>> 00000000bfb65e7c genpd_link 0000000000000000
>> [   83.049353] qcom-camss 1b00020.camss: vfe_pm_domain_on VFE 1 genpd 
>> 000000009bd8355f genpd_link 00000000ccb0acd9
>> [   83.049641] qcom-camss 1b00020.camss: vfe_pm_domain_off VFE 0 genpd 
>> 00000000bfb65e7c genpd_link 00000000348ac3c1
>> [   83.049654] qcom-camss 1b00020.camss: vfe_pm_domain_off VFE 1 genpd 
>> 000000009bd8355f genpd_link 00000000ccb0acd9
>> [   83.241498] qcom-camss 1b00020.camss: vfe_pm_domain_off VFE 1 genpd 
>> 000000009bd8355f genpd_link 0000000000000000
> 
> Could you add
> 
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -786,7 +786,7 @@ int vfe_get(struct vfe_device *vfe)
>         int ret;
> 
>         mutex_lock(&vfe->power_lock);
> -
> +dev_info(vfe->camss->dev, "%s vfe %d power_count %d\n", __func__, 
> vfe->id, vfe->power_count);
>         if (vfe->power_count == 0) {
>                 ret = vfe->res->hw_ops->pm_domain_on(vfe);
>                 if (ret < 0)
> @@ -823,6 +823,7 @@ int vfe_get(struct vfe_device *vfe)
> 
>         mutex_unlock(&vfe->power_lock);
> 
> +dev_info(camss->vfe->dev, "%s vfe %d err=%d\n", __func__, 
> camss->vfe->id, 0);
>         return 0;
> 
>  error_reset:
> @@ -835,7 +836,7 @@ int vfe_get(struct vfe_device *vfe)
> 
>  error_pm_domain:
>         mutex_unlock(&vfe->power_lock);
> -
> +dev_info(camss->vfe->dev, "%s vfe %d err=%d\n", __func__, 
> camss->vfe->id, ret);
>         return ret;
>  }
> 
> ?
> 
> ---
> bod
I have added little more from the logs because it is only failing in 
edge cases megapixels-sensorprofile failing by
different reason quickly and trying to release the device.
[   54.719030] qcom-camss 1b00020.camss: vfe_get vfe 0 err=0
[   54.750124] qcom-camss 1b00020.camss: vfe_get vfe 0 power_count 1
[   54.750236] qcom-camss 1b00020.camss: vfe_get vfe 0 err=0
[   54.751270] qcom-camss 1b00020.camss: vfe_pm_domain_on VFE 0 genpd 
00000000beaef03c genpd_link 00000000251644d9
[   54.751433] qcom-camss 1b00020.camss: vfe_pm_domain_on VFE 1 genpd 
000000007ce2da53 genpd_link 0000000000000000
[   54.755463] qcom-camss 1b00020.camss: vfe_pm_domain_off VFE 0 genpd 
00000000beaef03c genpd_link 00000000251644d9
[   54.755531] qcom-camss 1b00020.camss: vfe_pm_domain_off VFE 1 genpd 
000000007ce2da53 genpd_link 0000000058dcd4d6
[   55.861084] qcom-camss 1b00020.camss: vfe_get vfe 0 power_count 1
[   55.861177] qcom-camss 1b00020.camss: vfe_get vfe 0 err=0
[   55.861778] qcom-camss 1b00020.camss: vfe_pm_domain_on VFE 0 genpd 
00000000beaef03c genpd_link 0000000000000000
[   55.861860] qcom-camss 1b00020.camss: vfe_pm_domain_on VFE 1 genpd 
000000007ce2da53 genpd_link 0000000000000000
[   55.862242] qcom-camss 1b00020.camss: vfe_pm_domain_off VFE 0 genpd 
00000000beaef03c genpd_link 00000000251644d9
[   55.862258] qcom-camss 1b00020.camss: vfe_pm_domain_off VFE 1 genpd 
000000007ce2da53 genpd_link 00000000e41c1881
[  143.911690] qcom-camss 1b00020.camss: vfe_get vfe 0 power_count 2
[  143.911762] qcom-camss 1b00020.camss: vfe_get vfe 0 err=0
[  143.911800] qcom-camss 1b00020.camss: vfe_get vfe 0 power_count 3
[  143.911821] qcom-camss 1b00020.camss: vfe_get vfe 0 err=0
[  143.911858] qcom-camss 1b00020.camss: vfe_get vfe 1 power_count 0
[  143.911871] qcom-camss 1b00020.camss: vfe_pm_domain_on VFE 1 genpd 
000000007ce2da53 genpd_link 0000000000000000
[  143.912393] qcom-camss 1b00020.camss: vfe_get vfe 1 err=0
[  143.912489] qcom-camss 1b00020.camss: vfe_get vfe 1 power_count 1
[  143.912513] qcom-camss 1b00020.camss: vfe_get vfe 1 err=0
[  143.912553] qcom-camss 1b00020.camss: vfe_get vfe 1 power_count 2
[  143.912572] qcom-camss 1b00020.camss: vfe_get vfe 1 err=0
[  143.921750] qcom-camss 1b00020.camss: vfe_get vfe 0 power_count 3
[  143.921802] qcom-camss 1b00020.camss: vfe_get vfe 0 err=0
[  143.922670] qcom-camss 1b00020.camss: vfe_pm_domain_on VFE 0 genpd 
00000000beaef03c genpd_link 0000000000000000
[  143.922725] qcom-camss 1b00020.camss: vfe_pm_domain_on VFE 1 genpd 
000000007ce2da53 genpd_link 00000000d1fcd54b
[  143.922853] qcom-camss 1b00020.camss: vfe_pm_domain_off VFE 0 genpd 
00000000beaef03c genpd_link 00000000251644d9
[  143.922868] qcom-camss 1b00020.camss: vfe_pm_domain_off VFE 1 genpd 
000000007ce2da53 genpd_link 00000000d1fcd54b
[  144.126535] qcom-camss 1b00020.camss: vfe_pm_domain_off VFE 1 genpd 
000000007ce2da53 genpd_link 0000000000000000

