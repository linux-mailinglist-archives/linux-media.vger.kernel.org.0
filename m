Return-Path: <linux-media+bounces-22389-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5229DF35D
	for <lists+linux-media@lfdr.de>; Sat, 30 Nov 2024 22:48:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A655DB2158F
	for <lists+linux-media@lfdr.de>; Sat, 30 Nov 2024 21:48:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6A541AB6EF;
	Sat, 30 Nov 2024 21:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A3nF5Gyk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF111A7045
	for <linux-media@vger.kernel.org>; Sat, 30 Nov 2024 21:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733003287; cv=none; b=DGFU36D27wo7XzUsSWnvBBRexaUAYVEC8i8XIp+O8WBWlqY49wpjh4SkTPZz5qpA+KUd3shvdL0DWUD2BH0umQInTzTPjverZdMV8R5nAgGMXDKTSXc32drxPclBqAdgBuEhEgSrQMJcts27AB1Pf87pEu1dm32HhmikWM8YIjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733003287; c=relaxed/simple;
	bh=nlchDJTecWL4h04s00z0Wn9m519FoRsOMmkvYV8mAqM=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=TtHz4vJGZKf/7Ice99uh/5eoxhgQX9w/Q+s0tntxZPy89/danjf895a3MDr6brhb3WCfOpFitU9ZY8p6yJt+CI9v6mYEJR3k8Q3hm1G74ZKpYjSallql7QU4Y3xi2DPU+ZSYw9GNOH1uRZQc43gwbTNoxIwjnFZ0zZOUgEhtk+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A3nF5Gyk; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-434a95095efso23374105e9.0
        for <linux-media@vger.kernel.org>; Sat, 30 Nov 2024 13:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733003283; x=1733608083; darn=vger.kernel.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5kUctKLCXRtwVI3Jfqg7lc71isKX+hW2sSaZDvbuyzo=;
        b=A3nF5GykyfbYHzfBnzJc9WkeKKRZrmsQh0eG1NhR73Wmp0Tz5u240ZDbFGJb6F723u
         10RsbN4VPohsNwUoltHtpXzL7XWH7JsW+sECXLclVJpLz0g2bKakF8beEJK9nJwzx5k2
         Kb9O876sCngXSmZu+5Ve6eD6V3TL3nQJC3h0v69b7oGgpVKj5Lydn5nbRSR0GZY6TkYx
         Cul99H3x3mDGrpBY2VqpABbd4tVTQ4xSGNOOgvHaN26dvTCv5EcTop9fV803YgXLLSCs
         fn1XqRXTixofOo7JFZAhncDyFc6iA42UbvnNjGRAtNDcOh94ww3ldu2j+dBOUU/bUrdw
         fGlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733003283; x=1733608083;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5kUctKLCXRtwVI3Jfqg7lc71isKX+hW2sSaZDvbuyzo=;
        b=lT90zq4veq8hrvzKD0IFYXnWOqSjuDr7/HH+2rjDT0L8aaof4k0f4bR88c27mxCVGR
         JmJCDx7JN/Ta7uNbf5HYihVnQQz1fMkMKoz1PnSUe+M2ODh1PzOYl91sSezk8dKp+hrE
         PpVvuqLW5U6l1gVivH4Ekjj5AOtMrUYS+yL/Lvyq1Dvfgcj0Me7JbUCcLeTLcIAlCIOn
         46bQPKsiHDKLO9i6E7o5fjfN3kviFZvPw0ReqgB/g4VcahojxLGcbFKj+bW3QtUbhxR7
         2KO0Pl3hNrsZ7mIyWFzZ8XgbzkeEwmMM/SFLVEqBP9Ec5LstaS+cR1bDRfF1yEeUIfMk
         78ZA==
X-Forwarded-Encrypted: i=1; AJvYcCVj8YNbkfzOvFmlXGOlLzCJEPR/oqADjccSUd0znTq1dIq4Y+VB7OcDPE13cg07XwM3InGCOr/JztYpOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLcr2/Xs9yhDFyo+e2gl7xUU9u/qcGEJzt2+Txxt8PAYlW4LgT
	u/YV+BptqXESC+oIKnisv8Ldx2wK0vNUX6xHjtHjZrDomlxKYuJrJ3l7ZMfpIwY=
X-Gm-Gg: ASbGncuoP9r6SMkZmdME7AN67/bqSF3BJVD+PdCFzabcdF7N9/r42hDE/meLq9Bmkm+
	YR1Wz2YzRoxVZo/+A+pbP8NLUjb0eqSs8NUGBnxhL+QSop9mtEBupYBa4+Q8Z3bK5PGbtPgjM61
	nM9+9XID3VhhtsBCr+aRNYFFhG68vEquBmc3ealLbQ8S8MKJSSoP3i4YSdaZ2DMaKmLmrKh9uLs
	v6qEXbCeEbv+AfpK0lcH12P2BwWm1W80erQVbLQ82IyGhawBZZYYBk0Jgm2AkQ=
X-Google-Smtp-Source: AGHT+IFsFaPc61BH5IFJr2K4j5U2x210tRSF46eM926+9LrNarcfqAnCiCw04Zin2ZMz0xFRWGPFBQ==
X-Received: by 2002:a05:600c:1d0f:b0:434:9fc8:63a7 with SMTP id 5b1f17b1804b1-434afb9539dmr112754775e9.1.1733003283455;
        Sat, 30 Nov 2024 13:48:03 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434b0f325fdsm98901605e9.30.2024.11.30.13.48.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Nov 2024 13:48:02 -0800 (PST)
Content-Type: multipart/mixed; boundary="------------ZCraIeVNJvMB080IqVCK3Ofz"
Message-ID: <c8020803-ecbd-4496-9361-f19352ddf462@linaro.org>
Date: Sat, 30 Nov 2024 21:48:01 +0000
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
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <c7a9a43eea8bd1e6302ae4fa2d79dd80@mainlining.org>

This is a multi-part message in MIME format.
--------------ZCraIeVNJvMB080IqVCK3Ofz
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 29/11/2024 23:52, barnabas.czeman@mainlining.org wrote:
> On 2024-11-30 00:07, Bryan O'Donoghue wrote:
>> On 29/11/2024 22:45, barnabas.czeman@mainlining.org wrote:
>>> On 2024-11-29 23:08, Bryan O'Donoghue wrote:
>>>> On 29/11/2024 13:46, barnabas.czeman@mainlining.org wrote:
>>>>> On 2024-11-29 13:25, Bryan O'Donoghue wrote:
>>>>>> On 29/11/2024 11:44, barnabas.czeman@mainlining.org wrote:
>>>>>>>> The change does not describe how to reproduce the problem, which 
>>>>>>>> commit
>>>>>>>> base is tested, which platform is testes, there is no enough 
>>>>>>>> information,
>>>>>>>> unfortunately.
>>>>>>> I can reproduce the problem with megapixels-sensorprofile on 
>>>>>>> msm8953 and
>>>>>>> it can be reproduced with megapixels on msm8996.
>>>>>>> The base is the last commit on next.
>>>>>>
>>>>>> Can you verify if vfe_domain_on has run and if so whether or not 
>>>>>> genpd_link is NULL when that function exists.
>>>>>>
>>>>> I have added some debug logs it seems pm_domain_on and 
>>>>> pm_domain_off is called twice on the same object.
>>>>> [   63.473360] qcom-camss 1b00020.camss: pm_domain_on 19842ce8 link 
>>>>> 42973800
>>>>> [   63.481524] qcom-camss 1b00020.camss: pm_domain_on 19840080 link 
>>>>> 4e413800
>>>>> [   63.481555] qcom-camss 1b00020.camss: pm_domain_on 19842ce8 link 
>>>>> 42973800
>>>>> [   63.481632] qcom-camss 1b00020.camss: pm_domain_off 19840080 
>>>>> link 4e413800
>>>>> [   63.481641] qcom-camss 1b00020.camss: pm_domain_off 19842ce8 
>>>>> link 42973800
>>>>> [   63.654004] qcom-camss 1b00020.camss: pm_domain_off 19842ce8 link 0
>>>>>> That's the question.
>>>>>>
>>>>>> ---
>>>>>> bod
>>>>
>>>> Could you provide this output ?
>>>>
>>>> index 80a62ba112950..b25b8f6b00be1 100644
>>>> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
>>>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
>>>> @@ -595,6 +595,9 @@ void vfe_isr_reset_ack(struct vfe_device *vfe)
>>>>   */
>>>>  void vfe_pm_domain_off(struct vfe_device *vfe)
>>>>  {
>>>> +dev_info(camss->dev, "%s VFE %d genpd %pK genpd_link %pK\n",
>>>> +        __func__, vfe->id, vfe->genpd, vfe->genpd_link);
>>>> +
>>>>         if (!vfe->genpd)
>>>>                 return;
>>>>
>>>> @@ -609,7 +612,8 @@ void vfe_pm_domain_off(struct vfe_device *vfe)
>>>>  int vfe_pm_domain_on(struct vfe_device *vfe)
>>>>  {
>>>>         struct camss *camss = vfe->camss;
>>>> -
>>>> +dev_info(camss->dev, "%s VFE %d genpd %pK genpd_link %pK\n",
>>>> +        __func__, vfe->id, vfe->genpd, vfe->genpd_link);
>>>>         if (!vfe->genpd)
>>>>                 return 0;
>>>>
>>>> ---
>>>> bod
>>> I think logging in pm_domain_on should be placed after 
>>> device_link_add because only NULL
>>> will be visible.
>>> [   83.040694] qcom-camss 1b00020.camss: vfe_pm_domain_on VFE 1 genpd 
>>> 000000009bd8355f genpd_link 0000000000000000
>>> [   83.049293] qcom-camss 1b00020.camss: vfe_pm_domain_on VFE 0 genpd 
>>> 00000000bfb65e7c genpd_link 0000000000000000
>>> [   83.049353] qcom-camss 1b00020.camss: vfe_pm_domain_on VFE 1 genpd 
>>> 000000009bd8355f genpd_link 00000000ccb0acd9
>>> [   83.049641] qcom-camss 1b00020.camss: vfe_pm_domain_off VFE 0 
>>> genpd 00000000bfb65e7c genpd_link 00000000348ac3c1
>>> [   83.049654] qcom-camss 1b00020.camss: vfe_pm_domain_off VFE 1 
>>> genpd 000000009bd8355f genpd_link 00000000ccb0acd9
>>> [   83.241498] qcom-camss 1b00020.camss: vfe_pm_domain_off VFE 1 
>>> genpd 000000009bd8355f genpd_link 0000000000000000
>>
>> Could you add
>>
>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
>> @@ -786,7 +786,7 @@ int vfe_get(struct vfe_device *vfe)
>>         int ret;
>>
>>         mutex_lock(&vfe->power_lock);
>> -
>> +dev_info(vfe->camss->dev, "%s vfe %d power_count %d\n", __func__, 
>> vfe->id, vfe->power_count);
>>         if (vfe->power_count == 0) {
>>                 ret = vfe->res->hw_ops->pm_domain_on(vfe);
>>                 if (ret < 0)
>> @@ -823,6 +823,7 @@ int vfe_get(struct vfe_device *vfe)
>>
>>         mutex_unlock(&vfe->power_lock);
>>
>> +dev_info(camss->vfe->dev, "%s vfe %d err=%d\n", __func__, camss->vfe- 
>> >id, 0);
>>         return 0;
>>
>>  error_reset:
>> @@ -835,7 +836,7 @@ int vfe_get(struct vfe_device *vfe)
>>
>>  error_pm_domain:
>>         mutex_unlock(&vfe->power_lock);
>> -
>> +dev_info(camss->vfe->dev, "%s vfe %d err=%d\n", __func__, camss->vfe- 
>> >id, ret);
>>         return ret;
>>  }
>>
>> ?
>>
>> ---
>> bod
> I have added little more from the logs because it is only failing in 
> edge cases megapixels-sensorprofile failing by
> different reason quickly and trying to release the device.
> [   54.719030] qcom-camss 1b00020.camss: vfe_get vfe 0 err=0
> [   54.750124] qcom-camss 1b00020.camss: vfe_get vfe 0 power_count 1
> [   54.750236] qcom-camss 1b00020.camss: vfe_get vfe 0 err=0
> [   54.751270] qcom-camss 1b00020.camss: vfe_pm_domain_on VFE 0 genpd 
> 00000000beaef03c genpd_link 00000000251644d9

> [   54.751433] qcom-camss 1b00020.camss: vfe_pm_domain_on VFE 1 genpd 
> 000000007ce2da53 genpd_link 0000000000000000
> [   54.755531] qcom-camss 1b00020.camss: vfe_pm_domain_off VFE 1 genpd 
> 000000007ce2da53 genpd_link 0000000058dcd4d6

that's a bug genpd_link should be NULL unless power_count != 0

> [  143.922868] qcom-camss 1b00020.camss: vfe_pm_domain_off VFE 1 genpd 
> 000000007ce2da53 genpd_link 00000000d1fcd54b
> [  144.126535] qcom-camss 1b00020.camss: vfe_pm_domain_off VFE 1 genpd 
> 000000007ce2da53 genpd_link 0000000000000000

this is the corollary of the bug

can you provide the output of the attached please ?
--------------ZCraIeVNJvMB080IqVCK3Ofz
Content-Type: text/x-patch; charset=UTF-8; name="bug.diff"
Content-Disposition: attachment; filename="bug.diff"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vcWNvbS9jYW1zcy9jYW1zcy12
ZmUuYyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vcWNvbS9jYW1zcy9jYW1zcy12ZmUuYwpp
bmRleCA4MGE2MmJhMTEyOTUwLi40MzkwODVkZTFjOWFiIDEwMDY0NAotLS0gYS9kcml2ZXJz
L21lZGlhL3BsYXRmb3JtL3Fjb20vY2Ftc3MvY2Ftc3MtdmZlLmMKKysrIGIvZHJpdmVycy9t
ZWRpYS9wbGF0Zm9ybS9xY29tL2NhbXNzL2NhbXNzLXZmZS5jCkBAIC03NzQsNiArNzc0LDcg
QEAgc3RhdGljIGludCB2ZmVfY2hlY2tfY2xvY2tfcmF0ZXMoc3RydWN0IHZmZV9kZXZpY2Ug
KnZmZSkKIAogCXJldHVybiAwOwogfQorI2RlZmluZSB2ZmVfYnVnX3RyYWNlKHZmZSkgZGV2
X2luZm8odmZlLT5jYW1zcy0+ZGV2LCAiJXMvJWQgdmZlICVkIHBvd2VyX2NvdW50ICVkXG4i
LCBfX2Z1bmNfXywgX19MSU5FX18sIHZmZS0+aWQsIHZmZS0+cG93ZXJfY291bnQpOwogCiAv
KgogICogdmZlX2dldCAtIFBvd2VyIHVwIGFuZCByZXNldCBWRkUgbW9kdWxlCkBAIC03ODYs
MzEgKzc4NywzNyBAQCBpbnQgdmZlX2dldChzdHJ1Y3QgdmZlX2RldmljZSAqdmZlKQogCWlu
dCByZXQ7CiAKIAltdXRleF9sb2NrKCZ2ZmUtPnBvd2VyX2xvY2spOwotCiAJaWYgKHZmZS0+
cG93ZXJfY291bnQgPT0gMCkgeworCQl2ZmVfYnVnX3RyYWNlKHZmZSk7CiAJCXJldCA9IHZm
ZS0+cmVzLT5od19vcHMtPnBtX2RvbWFpbl9vbih2ZmUpOwogCQlpZiAocmV0IDwgMCkKIAkJ
CWdvdG8gZXJyb3JfcG1fZG9tYWluOwogCisJCXZmZV9idWdfdHJhY2UodmZlKTsKIAkJcmV0
ID0gcG1fcnVudGltZV9yZXN1bWVfYW5kX2dldCh2ZmUtPmNhbXNzLT5kZXYpOwogCQlpZiAo
cmV0IDwgMCkKIAkJCWdvdG8gZXJyb3JfZG9tYWluX29mZjsKIAorCQl2ZmVfYnVnX3RyYWNl
KHZmZSk7CiAJCXJldCA9IHZmZV9zZXRfY2xvY2tfcmF0ZXModmZlKTsKIAkJaWYgKHJldCA8
IDApCiAJCQlnb3RvIGVycm9yX3BtX3J1bnRpbWVfZ2V0OwogCisJCXZmZV9idWdfdHJhY2Uo
dmZlKTsKIAkJcmV0ID0gY2Ftc3NfZW5hYmxlX2Nsb2Nrcyh2ZmUtPm5jbG9ja3MsIHZmZS0+
Y2xvY2ssCiAJCQkJCSAgdmZlLT5jYW1zcy0+ZGV2KTsKIAkJaWYgKHJldCA8IDApCiAJCQln
b3RvIGVycm9yX3BtX3J1bnRpbWVfZ2V0OwogCisJCXZmZV9idWdfdHJhY2UodmZlKTsKIAkJ
cmV0ID0gdmZlX3Jlc2V0KHZmZSk7CiAJCWlmIChyZXQgPCAwKQogCQkJZ290byBlcnJvcl9y
ZXNldDsKIAorCQl2ZmVfYnVnX3RyYWNlKHZmZSk7CiAJCXZmZV9yZXNldF9vdXRwdXRfbWFw
cyh2ZmUpOwogCisJCXZmZV9idWdfdHJhY2UodmZlKTsKIAkJdmZlX2luaXRfb3V0cHV0cyh2
ZmUpOwogCiAJCXZmZS0+cmVzLT5od19vcHMtPmh3X3ZlcnNpb24odmZlKTsKQEAgLTgyMSw2
ICs4MjgsNyBAQCBpbnQgdmZlX2dldChzdHJ1Y3QgdmZlX2RldmljZSAqdmZlKQogCX0KIAl2
ZmUtPnBvd2VyX2NvdW50Kys7CiAKKwl2ZmVfYnVnX3RyYWNlKHZmZSk7CiAJbXV0ZXhfdW5s
b2NrKCZ2ZmUtPnBvd2VyX2xvY2spOwogCiAJcmV0dXJuIDA7CkBAIC04MzUsNyArODQzLDcg
QEAgaW50IHZmZV9nZXQoc3RydWN0IHZmZV9kZXZpY2UgKnZmZSkKIAogZXJyb3JfcG1fZG9t
YWluOgogCW11dGV4X3VubG9jaygmdmZlLT5wb3dlcl9sb2NrKTsKLQorZGV2X2luZm8oY2Ft
c3MtPnZmZS0+ZGV2LCAiJXMgdmZlICVkIGVycj0lZFxuIiwgX19mdW5jX18sIGNhbXNzLT52
ZmUtPmlkLCByZXQpOwogCXJldHVybiByZXQ7CiB9CiAKQEAgLTg0NywyMCArODU1LDMyIEBA
IHZvaWQgdmZlX3B1dChzdHJ1Y3QgdmZlX2RldmljZSAqdmZlKQogewogCW11dGV4X2xvY2so
JnZmZS0+cG93ZXJfbG9jayk7CiAKKwl2ZmVfYnVnX3RyYWNlKHZmZSk7CiAJaWYgKHZmZS0+
cG93ZXJfY291bnQgPT0gMCkgeworCQl2ZmVfYnVnX3RyYWNlKHZmZSk7CiAJCWRldl9lcnIo
dmZlLT5jYW1zcy0+ZGV2LCAidmZlIHBvd2VyIG9mZiBvbiBwb3dlcl9jb3VudCA9PSAwXG4i
KTsKIAkJZ290byBleGl0OwogCX0gZWxzZSBpZiAodmZlLT5wb3dlcl9jb3VudCA9PSAxKSB7
CisJCXZmZV9idWdfdHJhY2UodmZlKTsKIAkJaWYgKHZmZS0+d2FzX3N0cmVhbWluZykgewor
CQkJdmZlX2J1Z190cmFjZSh2ZmUpOwogCQkJdmZlLT53YXNfc3RyZWFtaW5nID0gMDsKKwkJ
CXZmZV9idWdfdHJhY2UodmZlKTsKIAkJCXZmZS0+cmVzLT5od19vcHMtPnZmZV9oYWx0KHZm
ZSk7CisJCQl2ZmVfYnVnX3RyYWNlKHZmZSk7CiAJCX0KKwkJdmZlX2J1Z190cmFjZSh2ZmUp
OwogCQljYW1zc19kaXNhYmxlX2Nsb2Nrcyh2ZmUtPm5jbG9ja3MsIHZmZS0+Y2xvY2spOwor
CQl2ZmVfYnVnX3RyYWNlKHZmZSk7CiAJCXBtX3J1bnRpbWVfcHV0X3N5bmModmZlLT5jYW1z
cy0+ZGV2KTsKKwkJdmZlX2J1Z190cmFjZSh2ZmUpOwogCQl2ZmUtPnJlcy0+aHdfb3BzLT5w
bV9kb21haW5fb2ZmKHZmZSk7CisJCXZmZV9idWdfdHJhY2UodmZlKTsKIAl9CiAKKwl2ZmVf
YnVnX3RyYWNlKHZmZSk7CiAJdmZlLT5wb3dlcl9jb3VudC0tOworCXZmZV9idWdfdHJhY2Uo
dmZlKTsKIAogZXhpdDoKIAltdXRleF91bmxvY2soJnZmZS0+cG93ZXJfbG9jayk7Cg==

--------------ZCraIeVNJvMB080IqVCK3Ofz--

