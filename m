Return-Path: <linux-media+bounces-22214-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 326659DB717
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 13:02:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9F2A6B21806
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 12:02:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D6AE19ADB0;
	Thu, 28 Nov 2024 12:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tCLcbUDO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC1819004B
	for <linux-media@vger.kernel.org>; Thu, 28 Nov 2024 12:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732795358; cv=none; b=dCOYtwvsZ3JJl4hXm9x5xbWkTGEjVpfCFfuAoZcey9lufZcBJQ7ND+aaqdTTi0EFv7VU2MMX7HfcxLMaZYiGAyLeotIa4EqYNwmLM54RfqUhrtLSPmfuURKGpHbfgCu1aKu9Awnr9U7EHcoU/DjzQpe9VrpABBzcgaan0PeT0R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732795358; c=relaxed/simple;
	bh=Q8GwYvPYuh4ulXG0TyYJPILno0E3xHMaYwHBgZNf434=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iK++V06H3rklN25Mbh0kY5ZSS9aNGAc3baMjG0SbdaqFQ5Haik12ufGAD4fkUG8nYQFrzowxwKe5Pb+VU7SDhOwsUQw0xcRtBLgYVl/8IMT1N1TCDVBFUN9UeVkTaqP+XfT1UNDMGgKRAqItp5b90N13vvEi3Pr2U432MyuIqvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tCLcbUDO; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-382610c7116so559476f8f.0
        for <linux-media@vger.kernel.org>; Thu, 28 Nov 2024 04:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732795355; x=1733400155; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qLDrVdTVZuvSrrfBD1A15SschCVFIPsZ6nGTk9yv7QI=;
        b=tCLcbUDO3hfxvxvSIQgbm8rABzMBZuU4kcH0YVL6r676WArq+1j1fryZ1oAEJXH9+S
         8PWLBBS1EaRWNGyIiZgXs5i3vn1t82pnRP7a3eOTcZJF3mshi6a86xjjF29Ds1XyfoxN
         JbxmWMFYn1G6JsLiWPd1yTnTkbvCBlwJbWwzVwH4rrBYAFDgLfy3aYMrfELoidTb1fWi
         4F/BBt7rgUJyKj0ouSI8nv85GJPxn1soDBwAt3gGKTgJ3W+Iy/U0r6kPrF52PjsJ1tpx
         mtVy4TEC5+nWxIL4BL2kah7RFUA7uRp88nLrMDrvQ/IAkll6kHcKjTs1qVOXF8Ol0FzO
         J2Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732795355; x=1733400155;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qLDrVdTVZuvSrrfBD1A15SschCVFIPsZ6nGTk9yv7QI=;
        b=BNJNxZ1KJj6e7leTuwZCqZ6KOACDVX0isOqaewqTk4H+/YCmiUsFoADHpQnY/H0Vb6
         pVAThRxlDOvkS/DALSh/bT2jKLOO+mD4UufIsq4KuMO0DsJXtfZ/V3GOHGtxmIFv2GPC
         VsmqbMC0WLW2jR9a/TqU9Cy3JfoHw4LrpUOQxGSTI4rEBRibyPBmth/WUoAZyt/FOx4k
         udS45HZ0KDMgBIP2PVHk1LqPH3e24uHi6caHtnJZ0S6Z/8ahqfi953beecvqqgoUmmDn
         4DOtjKBq6a0UzgLQTMAjKObtwQ9JZLnGKCZY+fz9DOStawdFRC+jcXlKY7imxM1u0EQh
         koXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUw4qHLp7ljJ6DpfO+NLbjXjyXhuKRxcCjN1NQ8qWhL9yTQslwhayRHTHvj0QVGNstRaCFiC0xiRoyHYw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzyg4nVsMR4qWH35SHB1vc23tAcP3tSS/AKpngPiXX04aH3eUNc
	0PB2qqXjufq1DQMP45rSWuEizWWjMWqwNOryDUWXL8KqzYvkPx3J7uSyGZrQpdA=
X-Gm-Gg: ASbGnctCfg/vkHyPvAvc2c4zZIhTecfRQ958lGJ3L9cv2d3Sz/pEyiu4D8WCORk7OjZ
	D2Zuc2ev4N3y+J17HHsKAbgdHeJcQzKP3hbcPn/cbmz9KjUxpY/XPukTYXb4ZIeouIC5nOeB14V
	Qb6HxJvPeBG20emFXHKs+/8fU38MSYRlZ9EC4w0NeJ6lxz/E4I+twWegu2jB91RQ1dNlUUeh8HS
	16DbMlmMO0cTdnrL8h9n3ua6z6zD5W02qWu91O5wX/S9Lmodjr4HU8QIGYssV4=
X-Google-Smtp-Source: AGHT+IH7+g8i0AZW77GR8tc/Kz7i58SqPqK+nRnz8W8wZUqSB21dh9TcAz/ojOTbYEhV3o/SwRZ4tg==
X-Received: by 2002:a5d:6d0b:0:b0:382:450c:25ee with SMTP id ffacd0b85a97d-385c6ed74c9mr5621206f8f.40.1732795354751;
        Thu, 28 Nov 2024 04:02:34 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd2e012sm1503515f8f.8.2024.11.28.04.02.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Nov 2024 04:02:34 -0800 (PST)
Message-ID: <a40286a5-ffa3-4884-bab6-1a0b5c216603@linaro.org>
Date: Thu, 28 Nov 2024 12:02:33 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: fix VFE pm domain off
To: barnabas.czeman@mainlining.org,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <a0a41b77-ee63-4d55-8c91-baf667c25cba@protonmail.com>
 <acb6366a-aa6b-4c84-a3b2-cad03ae02ee7@linaro.org>
 <43be9872149cc60d2c5c21294cd69f07@mainlining.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <43be9872149cc60d2c5c21294cd69f07@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 28/11/2024 10:27, barnabas.czeman@mainlining.org wrote:
> On 2024-11-28 10:10, Vladimir Zapolskiy wrote:
>> On 11/27/24 12:01, Yassine Oudjana wrote:
>>> On 22/11/2024 5:06 am, Barnabás Czémán wrote:
>>>> Fix NULL pointer check before device_link_del
>>>> is called.
>>
>> The intention is clear, but the context of the change is completely lost.
>>
>>>> Fixes: eb73facec2c2 ("media: qcom: camss: Use common VFE 
>>>> pm_domain_on/pm_domain_off where applicable")
>>
>> It's invalid, the change is not a fix.
> I don't agree this patch is fixing NULL pointer dereference.
> 
> [   92.989120] Unable to handle kernel NULL pointer dereference at 
> virtual address 000000000000032c
> [   92.989170] Mem abort info:
> [   92.989186]   ESR = 0x0000000096000004
> [   92.989203]   EC = 0x25: DABT (current EL), IL = 32 bits
> [   92.989221]   SET = 0, FnV = 0
> [   92.989237]   EA = 0, S1PTW = 0
> [   92.989253]   FSC = 0x04: level 0 translation fault
> [   92.989270] Data abort info:
> [   92.989284]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
> [   92.989300]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> [   92.989317]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> [   92.989335] user pgtable: 4k pages, 48-bit VAs, pgdp=00000001218a8000
> [   92.989354] [000000000000032c] pgd=0000000000000000, 
> p4d=0000000000000000
> [   92.989389] Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
> [   92.989408] Modules linked in: q6afe_dai q6asm_dai q6routing q6adm 
> q6asm q6afe snd_q6dsp_common panel_lgphilips_sw43101 q6core venus_enc 
> venus_dec videobuf2_dma_contig imx318 ak7375 snd_soc_wcd9335 
> regmap_slimbus snd_soc_wcd_classh apr snd_soc_apq8096 
> snd_soc_qcom_common snd_soc_core qcom_camss msm v4l2_fwnode snd_compress 
> ath10k_pci v4l2_async ath10k_core snd_pcm nxp_nci_i2c drm_exec nxp_nci 
> venus_core videobuf2_dma_sg snd_timer ath v4l2_mem2mem videobuf2_memops 
> mac80211 drm_dp_aux_bus snd gpu_sched nci videobuf2_v4l2 libarc4 
> soundcore videodev nfc slim_qcom_ngd_ctrl drm_display_helper hci_uart 
> pdr_interface videobuf2_common btqca drm_kms_helper slimbus i2c_qcom_cci 
> bluetooth mc qcom_q6v5_pas qcom_q6v5_mss qcom_pil_info qcom_q6v5 
> qcom_sysmon qcom_common qmi_helpers mdt_loader socinfo rmtfs_mem 
> pwm_ir_tx cfg80211 rfkill zram zsmalloc atmel_mxt_ts drm 
> drm_panel_orientation_quirks dm_mod ip_tables
> [   92.989981] CPU: 2 PID: 1365 Comm: pool-megapixels Not tainted 6.9.0- 
> rc3+ #10
> [   92.990003] Hardware name: Xiaomi Mi Note 2 (DT)
> [   92.990020] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS 
> BTYPE=--)
> [   92.990042] pc : device_link_put_kref+0xc/0xb8
> [   92.990071] lr : device_link_del+0x30/0x48
> [   92.990089] sp : ffff80008a5db9d0
> [   92.990105] x29: ffff80008a5db9d0 x28: 0000000000000001 x27: 
> 0000000000000000
> [   92.990143] x26: 0000000000000000 x25: ffff0000e79d9100 x24: 
> ffff0000e79d9500
> [   92.990180] x23: ffff0000943f8568 x22: 00000000ffffffff x21: 
> 0000000000000000
> [   92.990217] x20: 0000000000000000 x19: ffff800081352498 x18: 
> 0000000000000000
> [   92.990253] x17: 0000000000000000 x16: 0000000000000000 x15: 
> 0000000000000168
> [   92.990288] x14: 0000000000000000 x13: 0000000000000191 x12: 
> ffff800081259d58
> [   92.990324] x11: 0000000000000001 x10: 0000000000000a60 x9 : 
> ffff80008a5db7e0
> [   92.990359] x8 : ffff0000e79d9bc0 x7 : 0000000000000004 x6 : 
> 0000000000000190
> [   92.990396] x5 : 0000000000000057 x4 : 0000000000000000 x3 : 
> 0000000000000000
> [   92.990430] x2 : ffff0000e79d9100 x1 : 0000000000000000 x0 : 
> 0000000000000000
> [   92.990466] Call trace:
> [   92.990482]  device_link_put_kref+0xc/0xb8
> [   92.990503]  device_link_del+0x30/0x48
> [   92.990522]  vfe_pm_domain_off+0x24/0x38 [qcom_camss]
> [   92.990566]  vfe_put+0x9c/0xd0 [qcom_camss]
> [   92.990601]  vfe_set_power+0x48/0x58 [qcom_camss]
> [   92.990636]  pipeline_pm_power_one+0x154/0x158 [videodev]
> [   92.990683]  pipeline_pm_power+0x74/0xfc [videodev]
> [   92.990720]  v4l2_pipeline_pm_use+0x54/0x90 [videodev]
> [   92.990757]  v4l2_pipeline_pm_put+0x14/0x34 [videodev]
> [   92.990793]  video_release+0x2c/0x44 [qcom_camss]
> [   92.990828]  v4l2_release+0xe4/0xec [videodev]
> [   92.990865]  __fput+0x78/0x2c4
> [   92.990892]  ____fput+0x10/0x1c
> [   92.990915]  task_work_run+0x74/0xcc
> [   92.990936]  do_exit+0x2c4/0x8fc
> [   92.990961]  do_group_exit+0x34/0x90
> [   92.990984]  get_signal+0x870/0x880
> [   92.991008]  do_signal+0x8c/0x12b8
> [   92.991034]  do_notify_resume+0xc8/0x140
> [   92.991054]  el0_svc+0xc4/0xd8
> [   92.991079]  el0t_64_sync_handler+0x120/0x12c
> [   92.991102]  el0t_64_sync+0x190/0x194
> [   92.991127] Code: 17ffffda d503233f a9bf7bfd 910003fd (b9432c01)
> [   92.991150] ---[ end trace 0000000000000000 ]---
Please send a v2 of this patch including the backtrace, then add.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

