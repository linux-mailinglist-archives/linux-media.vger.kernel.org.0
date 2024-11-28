Return-Path: <linux-media+bounces-22216-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CD59DB872
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 14:22:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6BF52B228DC
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 13:22:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4949A1A9B2B;
	Thu, 28 Nov 2024 13:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gRRg2Oug"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83FE1A0BFD
	for <linux-media@vger.kernel.org>; Thu, 28 Nov 2024 13:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732800136; cv=none; b=FWZ2c3pGGxEyqJsWhKQ2dlzVdUh+Z9SgwKGPK48p29kz6BYYm2s7urF5kIsC4vd7JT8I7IzXdh0m0WUJXHaSg5xVGMc0xrZ2ZkPOBbBbikXzCPNmmERd+Z+nDV0QQyWO1klFkE05LG7jc8D9TsUSNLisNK/iZNfgTRJMSmUWjQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732800136; c=relaxed/simple;
	bh=81tpBEtit7Ep6iuYM1+ph8guSCdrW6Tkt4qnrcXpDdw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MNZX0seKl5lfEWF9WIcCYWi3YSYnjKzZE2lqKbLAqliy/rSS8QY4cSwv1jNv3lo3ERMnDAv6sR+ONlUXufrw/5VveOLZ65M3U5eOnGqXsZIbmju/hFCE6xA52iFdrRTWzbqd4CWgA2EHt/5001Om5yJiunB6UjIuG2qptimGGCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gRRg2Oug; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53ddb4c05d1so128643e87.0
        for <linux-media@vger.kernel.org>; Thu, 28 Nov 2024 05:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732800133; x=1733404933; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pojne1pl7gaoCPh5iHdXGFj23NFwW6nEfTFrC9mxVn4=;
        b=gRRg2Ougf6rJMOm9sT+rUQXVpskNOEAyHPwsep5ovJNohVfB3qdDzuy8KjV1rNjOlw
         d+C/dc22RYOSGkY9FQXGhX460uFB0y1h+ChA0Ki7qBzdFhs14qwr8M95G38V8JI7p/x3
         SUWXmH/RK+ZPz2R3Hm/rxyrZXcmwPQD9GWBPPlOB8e2XzRPp+Ji1TCBIcjKK8nhlACVa
         ffLzrYG18cPzoZT9Kj98O7IbzMCltAj565HumjrYbOiL63dIcC4OcGnslO6+bc7ACXkX
         dnQg2N55IJlwrkGvO52ZipXlpzQS3U5C9c5BTEn8g420kKpBD8K4LUXg/dmA6TJIGVnq
         JZEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732800133; x=1733404933;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pojne1pl7gaoCPh5iHdXGFj23NFwW6nEfTFrC9mxVn4=;
        b=cED2q4hLNO2gmVxkRFxEnkIAYwSxIXZ6JG/JAWI4tu1gBSlyWUy5BmvDAEFN1KpeSx
         nTN73gKjpL/RXvtNvhFoJXGDbsYBKJYMGtoYdbbyKRH6FxML7mopvFo9UvRsvCWN/zm0
         993VIVqDULGoVy8wzfyEDJ2J+qg8TI8VHTpfk5wudxfPhKJHLdCuPMEw+c/TImKnoRJH
         gvvaAtk8BazXJHblLDaeCcGWqzVjz7Dh9NMIsIB3vqYryCBiX0IPxf8fXWdtSwSYQdxL
         yx2o6Q6/i2pXz2homw2ZsKl6vEImiddl0E+s6FadoLpkgXvgOIUuymPe+T7HGxE+e9/h
         Y29w==
X-Forwarded-Encrypted: i=1; AJvYcCWYQODEYtGcc6CasdduTUxbm1tv2563/qTUVdlftLwLOdldxbntgfn3W0uNnPKnjmA4dqjsMm8efozbSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yza/iSQEIqVLXuhtXtckQaOUZd26X4SDsJHPWbWoswJMY70GTSu
	M4ai66xqSG8h/HpKpihZ4bjQBN3NBPxsje72ubY/OESmpg/xuBDdB3fvFX99iNI=
X-Gm-Gg: ASbGncvkDypq+2yg24/j8KBY7SMlWbl3CZ23ECt2uLWrZeuD57fiDRp8fwUiPuhytTJ
	WvtbWfEZB9jY/NuAX7b4iHZ+DZGE7uN5/oPMz7RFCBpfWGvS2QjYptVwJ4+wp3fP5m3KDVeEH2L
	4HbHUfUHMZUIyIUFRDHHjxholoWD1h+R86+RoQ1gHRvwwsu+DZjKzZJEOMHxx7aj+/YusLYtNa9
	31ANKS463pF2/zTikWwbXT9NknPKFJkyXmqMo3tOmI2HYdC1kQW0/1ipbj1VUyEEyR37w8ddWUO
	mzCr0uM6pa/NPZLOqbJGc6fTD8LD
X-Google-Smtp-Source: AGHT+IE2X7a62PWKPqNwWXSyxSfgCk3yAdTypq8MdbLX2c+CzDDESSw8T99K9wD6mD5EZ9FjV5qSVg==
X-Received: by 2002:a2e:9e42:0:b0:2ff:e3f0:b483 with SMTP id 38308e7fff4ca-2ffe3f0b5fcmr1102251fa.6.1732800132870;
        Thu, 28 Nov 2024 05:22:12 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffdfc750e8sm1908901fa.79.2024.11.28.05.22.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Nov 2024 05:22:12 -0800 (PST)
Message-ID: <38003f90-4b0b-4a7a-86f5-ec75e227777a@linaro.org>
Date: Thu, 28 Nov 2024 15:22:10 +0200
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
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <43be9872149cc60d2c5c21294cd69f07@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/28/24 12:27, barnabas.czeman@mainlining.org wrote:
> On 2024-11-28 10:10, Vladimir Zapolskiy wrote:
>> On 11/27/24 12:01, Yassine Oudjana wrote:
>>> On 22/11/2024 5:06 am, Barnabás Czémán wrote:
>>>> Fix NULL pointer check before device_link_del
>>>> is called.
>>
>> The intention is clear, but the context of the change is completely
>> lost.
>>
>>>> Fixes: eb73facec2c2 ("media: qcom: camss: Use common VFE
>>>> pm_domain_on/pm_domain_off where applicable")
>>
>> It's invalid, the change is not a fix.
> I don't agree this patch is fixing NULL pointer dereference.
> 
> [   92.989120] Unable to handle kernel NULL pointer dereference at
> virtual address 000000000000032c
> [   92.989170] Mem abort info:
> [   92.989186]   ESR = 0x0000000096000004
> [   92.989203]   EC = 0x25: DABT (current EL), IL = 32 bits
> [   92.989221]   SET = 0, FnV = 0
> [   92.989237]   EA = 0, S1PTW = 0
> [   92.989253]   FSC = 0x04: level 0 translation fault
> [   92.989270] Data abort info:
> [   92.989284]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
> [   92.989300]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> [   92.989317]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> [   92.989335] user pgtable: 4k pages, 48-bit VAs, pgdp=00000001218a8000
> [   92.989354] [000000000000032c] pgd=0000000000000000,
> p4d=0000000000000000
> [   92.989389] Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
> [   92.989408] Modules linked in: q6afe_dai q6asm_dai q6routing q6adm
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
> [   92.989981] CPU: 2 PID: 1365 Comm: pool-megapixels Not tainted
> 6.9.0-rc3+ #10
> [   92.990003] Hardware name: Xiaomi Mi Note 2 (DT)
> [   92.990020] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS
> BTYPE=--)
> [   92.990042] pc : device_link_put_kref+0xc/0xb8
> [   92.990071] lr : device_link_del+0x30/0x48
> [   92.990089] sp : ffff80008a5db9d0
> [   92.990105] x29: ffff80008a5db9d0 x28: 0000000000000001 x27:
> 0000000000000000
> [   92.990143] x26: 0000000000000000 x25: ffff0000e79d9100 x24:
> ffff0000e79d9500
> [   92.990180] x23: ffff0000943f8568 x22: 00000000ffffffff x21:
> 0000000000000000
> [   92.990217] x20: 0000000000000000 x19: ffff800081352498 x18:
> 0000000000000000
> [   92.990253] x17: 0000000000000000 x16: 0000000000000000 x15:
> 0000000000000168
> [   92.990288] x14: 0000000000000000 x13: 0000000000000191 x12:
> ffff800081259d58
> [   92.990324] x11: 0000000000000001 x10: 0000000000000a60 x9 :
> ffff80008a5db7e0
> [   92.990359] x8 : ffff0000e79d9bc0 x7 : 0000000000000004 x6 :
> 0000000000000190
> [   92.990396] x5 : 0000000000000057 x4 : 0000000000000000 x3 :
> 0000000000000000
> [   92.990430] x2 : ffff0000e79d9100 x1 : 0000000000000000 x0 :
> 0000000000000000
> [   92.990466] Call trace:
> [   92.990482]  device_link_put_kref+0xc/0xb8
> [   92.990503]  device_link_del+0x30/0x48
> [   92.990522]  vfe_pm_domain_off+0x24/0x38 [qcom_camss]

vfe_pm_domain_off() shall not be called before vfe_pm_domain_on() call.

If vfe_pm_domain_on() is called and returns failure, then a media pipeline
shall not be started, and vfe_pm_domain_off() shall not be called.

If vfe_pm_domain_on() is called and returns success, then vfe->genpd_link
is not NULL.

Are there any perceptable flaws within the given above reasoning?

Since you've encountered a bug and taking the reasoning from above as
correct, I believe the bug is present somewhere else, and if so, it will
remain unfixed by this change.

> [   92.990566]  vfe_put+0x9c/0xd0 [qcom_camss]
> [   92.990601]  vfe_set_power+0x48/0x58 [qcom_camss]
> [   92.990636]  pipeline_pm_power_one+0x154/0x158 [videodev]
> [   92.990683]  pipeline_pm_power+0x74/0xfc [videodev]
> [   92.990720]  v4l2_pipeline_pm_use+0x54/0x90 [videodev]
> [   92.990757]  v4l2_pipeline_pm_put+0x14/0x34 [videodev]
> [   92.990793]  video_release+0x2c/0x44 [qcom_camss]
> [   92.990828]  v4l2_release+0xe4/0xec [videodev]

Please include the backtrace up to this point into the commit message.

--
Best wishes,
Vladimir

