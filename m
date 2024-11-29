Return-Path: <linux-media+bounces-22291-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA1E9DC0A9
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 09:44:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 78178B21539
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 08:44:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AC461684A0;
	Fri, 29 Nov 2024 08:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KEn3Vp5V"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58C8161321
	for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 08:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732869856; cv=none; b=ef4laKRgqGApKc5rxt7KeoDM/hdbQBGA9Qd+hPbOahPmspNi4HA70H0ML4VZRyZoV/AoV9fAx9J7BMpOM+4+GvHIzWfdMeyIqnwzL8W478lFZrt0efynYjL2pYgyywAHEsqrBozRDY1iGJzlO2SRQx5U3mRfvf1Buyw0FuDPQSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732869856; c=relaxed/simple;
	bh=TT5+RIHx1xuXgfqy9hE/Avt96/GK+N20arFL11M50sU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EYBCgaWGzqy2QcfTo43bVMItmTL08yiZvmztEur4eEFRFIoUBUssLMHQOPWpNIsjNCpT+iYMVIamJOODt+cw7lKCfSYib+MRGLwzYAEBTedO9QdemBkaZ1Q1yQ/jlJ3PNCj7U/Qx4PT19f9NtwsmdNmh6r9o+ahgdsTQBjRxGWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KEn3Vp5V; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53dd58ebccdso214682e87.3
        for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 00:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732869853; x=1733474653; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bt9DDOfs9JYKOtE18laVJNPP8yvKV7fk7BdMO0QU3tw=;
        b=KEn3Vp5VT1dUvDxBakJ8e02Em50Os/NcX5/SeLS+laQtbJFf29Ir47vLm0JkyBAVGj
         83CE2Ey7do6p2Jnxn7uxc9HKz6wgIwlnL+9hw9XRu5YPxs43AtV5jXcyIWiDFNTaD9Bd
         OBNCNVcKSLst5m3awF9YKHT5X45ljq3zLutfrkHUE25Bi0TaGPWV2vfi/y10c4k/TlZQ
         nmxOd/kTMtDiJvhx+dJDsb9PS9IxYaFZ2V+So33jz7Fm05h+/7I8nzUHuSMHTSC066G+
         +Kf/TYWGbqz6V5oZAP1rjeWLmCPJtge+w/vGomKbxmZCgMeG2CZFYDV3Ooo45ZK0aFjK
         vLOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732869853; x=1733474653;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bt9DDOfs9JYKOtE18laVJNPP8yvKV7fk7BdMO0QU3tw=;
        b=KMWo7JN8Yx1XQrnKVZgce29PWL+j00quXzA7GMSAiT4g/2PkE73pEEf5zbhp6R21xy
         LnZi+bckd/C9g5u9q7T9MX8v1ia+w377duL7eTITQmzkbr32zwijmOsVsAhOqmRgCqse
         h7+yPrYFFM+wTM1/RGwINQacvjBOKby4FNc56mSwZWoJa/O74ZxRduJwAovFQZXkEbqn
         FU/aWrZQPhsEPlffJ4LFwiAwyhWC9O1yipLX284vkg9yYDnX4lVwWRNH8jpkFF+0frJu
         Q6TFhHNQ8UJ2bjGjlpo0D4NBQ4YzC/X76y70Rkgflo6KE20/0SxFdjVU90pA5WzbLE1H
         Ye3A==
X-Forwarded-Encrypted: i=1; AJvYcCUD0DT/khP7NaV8+3ESfMPb0r0kIOztDUR5YkXOPGrD6GlFKLBGAeDLFLsV+53nU4jem9GQMuRSj5lThg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRDPqxLTWdrvPlfCcm+2VMXuiRixbe83imksH2YDfsYbZqUM04
	fVipQcsoZBLuNZZ/1bUstcsWpvHVx1kTz3nq0PY7hdqgSvDOf/XE/v8RRjjuvRY=
X-Gm-Gg: ASbGnct127vhTypTL7iyeJb79IRb2PXHe5i6CrPet2H2IL2k+CWx1fv0xGaQBaFe06p
	0tJxrHeUcqCmwAbNS1Lh89Ug5XsXyJ4yspw62o5fHiV4bKRFrivW+41XHsILAxes2Xl/cUgtmYJ
	oMbaOaPXvd3xMPWNq3w7AaDzYLEeMCRJWe+O5YeE0IWI35XrvgPnpyJTSv11ZduHxqTZwiTvps2
	DgE4O+6AV7lJnGwhjmpb3cuFufSpa7QH3jwJXIqXWw87fUW41NDc+m/fQhd8gARYntoxjVBjoXS
	vtjUpnDCqywUGiqvLMQ3An0ZS9jg
X-Google-Smtp-Source: AGHT+IHcURwgNyGfLPh20iVLAIgq5+kcYBHSmn/BfhMfCEJIr6Aoikjy3UF0JK6k0Gg+R+w7Fkq4zw==
X-Received: by 2002:a05:6512:e90:b0:53d:da85:9df0 with SMTP id 2adb3069b0e04-53df00c74bbmr1249914e87.2.1732869852814;
        Fri, 29 Nov 2024 00:44:12 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df6431007sm425297e87.54.2024.11.29.00.44.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Nov 2024 00:44:11 -0800 (PST)
Message-ID: <f8b51be2-9121-4313-a575-d7aea330b687@linaro.org>
Date: Fri, 29 Nov 2024 10:44:09 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: fix VFE pm domain off
Content-Language: en-US
To: barnabas.czeman@mainlining.org
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <a0a41b77-ee63-4d55-8c91-baf667c25cba@protonmail.com>
 <acb6366a-aa6b-4c84-a3b2-cad03ae02ee7@linaro.org>
 <43be9872149cc60d2c5c21294cd69f07@mainlining.org>
 <38003f90-4b0b-4a7a-86f5-ec75e227777a@linaro.org>
 <9a2b01c9e00fee0b3f359e7289effa29@mainlining.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <9a2b01c9e00fee0b3f359e7289effa29@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/28/24 16:24, barnabas.czeman@mainlining.org wrote:
> On 2024-11-28 14:22, Vladimir Zapolskiy wrote:
>> On 11/28/24 12:27, barnabas.czeman@mainlining.org wrote:
>>> On 2024-11-28 10:10, Vladimir Zapolskiy wrote:
>>>> On 11/27/24 12:01, Yassine Oudjana wrote:
>>>>> On 22/11/2024 5:06 am, Barnabás Czémán wrote:
>>>>>> Fix NULL pointer check before device_link_del
>>>>>> is called.
>>>>
>>>> The intention is clear, but the context of the change is completely
>>>> lost.
>>>>
>>>>>> Fixes: eb73facec2c2 ("media: qcom: camss: Use common VFE
>>>>>> pm_domain_on/pm_domain_off where applicable")
>>>>
>>>> It's invalid, the change is not a fix.
>>> I don't agree this patch is fixing NULL pointer dereference.
>>>
>>> [   92.989120] Unable to handle kernel NULL pointer dereference at
>>> virtual address 000000000000032c
>>> [   92.989170] Mem abort info:
>>> [   92.989186]   ESR = 0x0000000096000004
>>> [   92.989203]   EC = 0x25: DABT (current EL), IL = 32 bits
>>> [   92.989221]   SET = 0, FnV = 0
>>> [   92.989237]   EA = 0, S1PTW = 0
>>> [   92.989253]   FSC = 0x04: level 0 translation fault
>>> [   92.989270] Data abort info:
>>> [   92.989284]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
>>> [   92.989300]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
>>> [   92.989317]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
>>> [   92.989335] user pgtable: 4k pages, 48-bit VAs,
>>> pgdp=00000001218a8000
>>> [   92.989354] [000000000000032c] pgd=0000000000000000,
>>> p4d=0000000000000000
>>> [   92.989389] Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
>>> [   92.989408] Modules linked in: q6afe_dai q6asm_dai q6routing q6adm
>>> q6asm q6afe snd_q6dsp_common panel_lgphilips_sw43101 q6core venus_enc
>>> venus_dec videobuf2_dma_contig imx318 ak7375 snd_soc_wcd9335
>>> regmap_slimbus snd_soc_wcd_classh apr snd_soc_apq8096
>>> snd_soc_qcom_common snd_soc_core qcom_camss msm v4l2_fwnode
>>> snd_compress
>>> ath10k_pci v4l2_async ath10k_core snd_pcm nxp_nci_i2c drm_exec nxp_nci
>>> venus_core videobuf2_dma_sg snd_timer ath v4l2_mem2mem
>>> videobuf2_memops
>>> mac80211 drm_dp_aux_bus snd gpu_sched nci videobuf2_v4l2 libarc4
>>> soundcore videodev nfc slim_qcom_ngd_ctrl drm_display_helper hci_uart
>>> pdr_interface videobuf2_common btqca drm_kms_helper slimbus
>>> i2c_qcom_cci
>>> bluetooth mc qcom_q6v5_pas qcom_q6v5_mss qcom_pil_info qcom_q6v5
>>> qcom_sysmon qcom_common qmi_helpers mdt_loader socinfo rmtfs_mem
>>> pwm_ir_tx cfg80211 rfkill zram zsmalloc atmel_mxt_ts drm
>>> drm_panel_orientation_quirks dm_mod ip_tables
>>> [   92.989981] CPU: 2 PID: 1365 Comm: pool-megapixels Not tainted
>>> 6.9.0-rc3+ #10
>>> [   92.990003] Hardware name: Xiaomi Mi Note 2 (DT)
>>> [   92.990020] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS
>>> BTYPE=--)
>>> [   92.990042] pc : device_link_put_kref+0xc/0xb8
>>> [   92.990071] lr : device_link_del+0x30/0x48
>>> [   92.990089] sp : ffff80008a5db9d0
>>> [   92.990105] x29: ffff80008a5db9d0 x28: 0000000000000001 x27:
>>> 0000000000000000
>>> [   92.990143] x26: 0000000000000000 x25: ffff0000e79d9100 x24:
>>> ffff0000e79d9500
>>> [   92.990180] x23: ffff0000943f8568 x22: 00000000ffffffff x21:
>>> 0000000000000000
>>> [   92.990217] x20: 0000000000000000 x19: ffff800081352498 x18:
>>> 0000000000000000
>>> [   92.990253] x17: 0000000000000000 x16: 0000000000000000 x15:
>>> 0000000000000168
>>> [   92.990288] x14: 0000000000000000 x13: 0000000000000191 x12:
>>> ffff800081259d58
>>> [   92.990324] x11: 0000000000000001 x10: 0000000000000a60 x9 :
>>> ffff80008a5db7e0
>>> [   92.990359] x8 : ffff0000e79d9bc0 x7 : 0000000000000004 x6 :
>>> 0000000000000190
>>> [   92.990396] x5 : 0000000000000057 x4 : 0000000000000000 x3 :
>>> 0000000000000000
>>> [   92.990430] x2 : ffff0000e79d9100 x1 : 0000000000000000 x0 :
>>> 0000000000000000
>>> [   92.990466] Call trace:
>>> [   92.990482]  device_link_put_kref+0xc/0xb8
>>> [   92.990503]  device_link_del+0x30/0x48
>>> [   92.990522]  vfe_pm_domain_off+0x24/0x38 [qcom_camss]
>>
>> vfe_pm_domain_off() shall not be called before vfe_pm_domain_on() call.
>>
>> If vfe_pm_domain_on() is called and returns failure, then a media
>> pipeline
>> shall not be started, and vfe_pm_domain_off() shall not be called.
>>
>> If vfe_pm_domain_on() is called and returns success, then
>> vfe->genpd_link
>> is not NULL.
> It can be null if the pm_domain_off is called twice somehow or it is
> called
> before pm_domain_on.

Then this is the problem and this not yet identified problem shall be fixed.

The currently proposed change does not fix it, but hides more efficiently.

> This is the original function, it sets genpd_link to NULL:
> 
> void vfe_pm_domain_off(struct vfe_device *vfe)
> {
>           if (!vfe->genpd)
>                   return;
> 
>           device_link_del(vfe->genpd_link);
>           vfe->genpd_link = NULL;
> }
> Other possible case:
> genpd_link can be NULL when pm_domain_on is failing or
> when genpd is NULL



> By the way pm_domain_on checks if genpd_link is NULL:
>           vfe->genpd_link = device_link_add(camss->dev, vfe->genpd,
>                                             DL_FLAG_STATELESS |
>                                             DL_FLAG_PM_RUNTIME |
>                                             DL_FLAG_RPM_ACTIVE);
>           if (!vfe->genpd_link)
>                   return -EINVAL;
> It is not calling pm_domain_off on fail:
> 
> ret = vfe->res->hw_ops->pm_domain_on(vfe);
>                   if (ret < 0)
>                           goto error_pm_domain;
> 
> [...]
> 
> error_domain_off:
>           vfe->res->hw_ops->pm_domain_off(vfe);
> 
> error_pm_domain:
>           mutex_unlock(&vfe->power_lock);
> 
> 
> camss_pm_domain_off also calls vfe_pm_domain_off what is used in
> camss-ispif
> void camss_pm_domain_off(struct camss *camss, int id)
> {
>           if (id < camss->res->vfe_num) {
>                   struct vfe_device *vfe = &camss->vfe[id];
> 
>                   vfe->res->hw_ops->pm_domain_off(vfe);
>           }
> }
>>
>> Are there any perceptable flaws within the given above reasoning?
> The camss will be broken and system also can recover correctly (only
> force reboot works.).

Well, my question was about the reasoning, why there is another
problem.

I'm worried that the real bug will not be fixed by this change, and
I believe additional analysis is needed here.

>>
>> Since you've encountered a bug and taking the reasoning from above as
>> correct, I believe the bug is present somewhere else, and if so, it
>> will
>> remain unfixed by this change.
>>
>>> [   92.990566]  vfe_put+0x9c/0xd0 [qcom_camss]
>>> [   92.990601]  vfe_set_power+0x48/0x58 [qcom_camss]
>>> [   92.990636]  pipeline_pm_power_one+0x154/0x158 [videodev]
>>> [   92.990683]  pipeline_pm_power+0x74/0xfc [videodev]
>>> [   92.990720]  v4l2_pipeline_pm_use+0x54/0x90 [videodev]
>>> [   92.990757]  v4l2_pipeline_pm_put+0x14/0x34 [videodev]
>>> [   92.990793]  video_release+0x2c/0x44 [qcom_camss]
>>> [   92.990828]  v4l2_release+0xe4/0xec [videodev]
>>
>> Please include the backtrace up to this point into the commit message.
>>

--
Best wishes,
Vladimir


