Return-Path: <linux-media+bounces-22218-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 372CA9DB98F
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 15:25:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7925BB22426
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 14:25:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDF1B1AF0A3;
	Thu, 28 Nov 2024 14:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="fFnuQ3Fb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A417192D77;
	Thu, 28 Nov 2024 14:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732803903; cv=none; b=HRdYE+1KNCFeCC6tpxxgiOlxZbc2MXEOY2spxHNVCh1BAaZ2zuxmULunnU8x3awNvLWpFYcEeYjTwTIMgWyNfRQe6ncsyiBiVidgPKEFu1Qqo1jfD7BH/pRAtp24bCGep19N2kEeQBf8tRA8zFRv1NpZHEm0krjbH+DgdaA38BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732803903; c=relaxed/simple;
	bh=fdHxtNj422UoKWLv3QvML6sSjy8dNKenAT6YQfKoT3k=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=AzZ7kLmVggbxXzIFEhC4DkjA54+9gpwcs/9NYHTcC1FNX6NJMkfM20ADez3Ret10t7dAH/fVQyDrD9+y0BFkwDAZlyA3myX9HF+t0+eq6eT2vN0RuTm7ffkyOcK2T85RazE8zX/g5CGxmvOjRfjnPKxcuuBgzADjocI1K0FtFtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=fFnuQ3Fb; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from localhost (docker-mailserver-web-1.docker-mailserver_default [172.22.0.5])
	by mail.mainlining.org (Postfix) with ESMTPSA id 827CFE4804;
	Thu, 28 Nov 2024 14:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1732803898;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GpXcJ7SsT/I9I6T2nG6xcD8KuRD4m/4UXD1TYsISI24=;
	b=fFnuQ3FbKvbbUND+qYkBMzWxrt4EEzBhjzQ1b0OLNjYxTIn2Ea6RKlNmzIKnKTWLNWfWtE
	dtzlrhVx+/f9WbgbQ3ANG2LhgpvP4T9Yyf+9GALdfoc9F4HTqTAbGS7vWkSbdGdSVVJ0JE
	hTjCGuL6SOgL8h8rWNTq2fKuEuxEuQUZGpMWxttS9fB6HUsoTAbt1urkMiX95RCIZSGKMz
	AsGIqGHsr/QS7+prvrpZH8rC+O2YDQf2XgAlkj1q+uaccPisAriS92HdFtF1BvZNRCcodj
	0eFFDSXYZkfwsgMqp8fWd8n0R1w74BxMB1Kf2imyOCgr2u2SHIuR46jVM7DgcQ==
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 28 Nov 2024 15:24:58 +0100
From: barnabas.czeman@mainlining.org
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, Bryan O'Donoghue
 <bryan.odonoghue@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: qcom: camss: fix VFE pm domain off
In-Reply-To: <38003f90-4b0b-4a7a-86f5-ec75e227777a@linaro.org>
References: <a0a41b77-ee63-4d55-8c91-baf667c25cba@protonmail.com>
 <acb6366a-aa6b-4c84-a3b2-cad03ae02ee7@linaro.org>
 <43be9872149cc60d2c5c21294cd69f07@mainlining.org>
 <38003f90-4b0b-4a7a-86f5-ec75e227777a@linaro.org>
Message-ID: <9a2b01c9e00fee0b3f359e7289effa29@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2024-11-28 14:22, Vladimir Zapolskiy wrote:
> On 11/28/24 12:27, barnabas.czeman@mainlining.org wrote:
>> On 2024-11-28 10:10, Vladimir Zapolskiy wrote:
>>> On 11/27/24 12:01, Yassine Oudjana wrote:
>>>> On 22/11/2024 5:06 am, Barnabás Czémán wrote:
>>>>> Fix NULL pointer check before device_link_del
>>>>> is called.
>>> 
>>> The intention is clear, but the context of the change is completely
>>> lost.
>>> 
>>>>> Fixes: eb73facec2c2 ("media: qcom: camss: Use common VFE
>>>>> pm_domain_on/pm_domain_off where applicable")
>>> 
>>> It's invalid, the change is not a fix.
>> I don't agree this patch is fixing NULL pointer dereference.
>> 
>> [   92.989120] Unable to handle kernel NULL pointer dereference at
>> virtual address 000000000000032c
>> [   92.989170] Mem abort info:
>> [   92.989186]   ESR = 0x0000000096000004
>> [   92.989203]   EC = 0x25: DABT (current EL), IL = 32 bits
>> [   92.989221]   SET = 0, FnV = 0
>> [   92.989237]   EA = 0, S1PTW = 0
>> [   92.989253]   FSC = 0x04: level 0 translation fault
>> [   92.989270] Data abort info:
>> [   92.989284]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
>> [   92.989300]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
>> [   92.989317]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
>> [   92.989335] user pgtable: 4k pages, 48-bit VAs, 
>> pgdp=00000001218a8000
>> [   92.989354] [000000000000032c] pgd=0000000000000000,
>> p4d=0000000000000000
>> [   92.989389] Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
>> [   92.989408] Modules linked in: q6afe_dai q6asm_dai q6routing q6adm
>> q6asm q6afe snd_q6dsp_common panel_lgphilips_sw43101 q6core venus_enc
>> venus_dec videobuf2_dma_contig imx318 ak7375 snd_soc_wcd9335
>> regmap_slimbus snd_soc_wcd_classh apr snd_soc_apq8096
>> snd_soc_qcom_common snd_soc_core qcom_camss msm v4l2_fwnode 
>> snd_compress
>> ath10k_pci v4l2_async ath10k_core snd_pcm nxp_nci_i2c drm_exec nxp_nci
>> venus_core videobuf2_dma_sg snd_timer ath v4l2_mem2mem 
>> videobuf2_memops
>> mac80211 drm_dp_aux_bus snd gpu_sched nci videobuf2_v4l2 libarc4
>> soundcore videodev nfc slim_qcom_ngd_ctrl drm_display_helper hci_uart
>> pdr_interface videobuf2_common btqca drm_kms_helper slimbus 
>> i2c_qcom_cci
>> bluetooth mc qcom_q6v5_pas qcom_q6v5_mss qcom_pil_info qcom_q6v5
>> qcom_sysmon qcom_common qmi_helpers mdt_loader socinfo rmtfs_mem
>> pwm_ir_tx cfg80211 rfkill zram zsmalloc atmel_mxt_ts drm
>> drm_panel_orientation_quirks dm_mod ip_tables
>> [   92.989981] CPU: 2 PID: 1365 Comm: pool-megapixels Not tainted
>> 6.9.0-rc3+ #10
>> [   92.990003] Hardware name: Xiaomi Mi Note 2 (DT)
>> [   92.990020] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS
>> BTYPE=--)
>> [   92.990042] pc : device_link_put_kref+0xc/0xb8
>> [   92.990071] lr : device_link_del+0x30/0x48
>> [   92.990089] sp : ffff80008a5db9d0
>> [   92.990105] x29: ffff80008a5db9d0 x28: 0000000000000001 x27:
>> 0000000000000000
>> [   92.990143] x26: 0000000000000000 x25: ffff0000e79d9100 x24:
>> ffff0000e79d9500
>> [   92.990180] x23: ffff0000943f8568 x22: 00000000ffffffff x21:
>> 0000000000000000
>> [   92.990217] x20: 0000000000000000 x19: ffff800081352498 x18:
>> 0000000000000000
>> [   92.990253] x17: 0000000000000000 x16: 0000000000000000 x15:
>> 0000000000000168
>> [   92.990288] x14: 0000000000000000 x13: 0000000000000191 x12:
>> ffff800081259d58
>> [   92.990324] x11: 0000000000000001 x10: 0000000000000a60 x9 :
>> ffff80008a5db7e0
>> [   92.990359] x8 : ffff0000e79d9bc0 x7 : 0000000000000004 x6 :
>> 0000000000000190
>> [   92.990396] x5 : 0000000000000057 x4 : 0000000000000000 x3 :
>> 0000000000000000
>> [   92.990430] x2 : ffff0000e79d9100 x1 : 0000000000000000 x0 :
>> 0000000000000000
>> [   92.990466] Call trace:
>> [   92.990482]  device_link_put_kref+0xc/0xb8
>> [   92.990503]  device_link_del+0x30/0x48
>> [   92.990522]  vfe_pm_domain_off+0x24/0x38 [qcom_camss]
> 
> vfe_pm_domain_off() shall not be called before vfe_pm_domain_on() call.
> 
> If vfe_pm_domain_on() is called and returns failure, then a media 
> pipeline
> shall not be started, and vfe_pm_domain_off() shall not be called.
> 
> If vfe_pm_domain_on() is called and returns success, then 
> vfe->genpd_link
> is not NULL.
It can be null if the pm_domain_off is called twice somehow or it is 
called
before pm_domain_on.
This is the original function, it sets genpd_link to NULL:

void vfe_pm_domain_off(struct vfe_device *vfe)
{
         if (!vfe->genpd)
                 return;

         device_link_del(vfe->genpd_link);
         vfe->genpd_link = NULL;
}
Other possible case:
genpd_link can be NULL when pm_domain_on is failing or
when genpd is NULL

By the way pm_domain_on checks if genpd_link is NULL:
         vfe->genpd_link = device_link_add(camss->dev, vfe->genpd,
                                           DL_FLAG_STATELESS |
                                           DL_FLAG_PM_RUNTIME |
                                           DL_FLAG_RPM_ACTIVE);
         if (!vfe->genpd_link)
                 return -EINVAL;
It is not calling pm_domain_off on fail:

ret = vfe->res->hw_ops->pm_domain_on(vfe);
                 if (ret < 0)
                         goto error_pm_domain;

[...]

error_domain_off:
         vfe->res->hw_ops->pm_domain_off(vfe);

error_pm_domain:
         mutex_unlock(&vfe->power_lock);


camss_pm_domain_off also calls vfe_pm_domain_off what is used in 
camss-ispif
void camss_pm_domain_off(struct camss *camss, int id)
{
         if (id < camss->res->vfe_num) {
                 struct vfe_device *vfe = &camss->vfe[id];

                 vfe->res->hw_ops->pm_domain_off(vfe);
         }
}
> 
> Are there any perceptable flaws within the given above reasoning?
The camss will be broken and system also can recover correctly (only 
force reboot works.).
> 
> Since you've encountered a bug and taking the reasoning from above as
> correct, I believe the bug is present somewhere else, and if so, it 
> will
> remain unfixed by this change.
> 
>> [   92.990566]  vfe_put+0x9c/0xd0 [qcom_camss]
>> [   92.990601]  vfe_set_power+0x48/0x58 [qcom_camss]
>> [   92.990636]  pipeline_pm_power_one+0x154/0x158 [videodev]
>> [   92.990683]  pipeline_pm_power+0x74/0xfc [videodev]
>> [   92.990720]  v4l2_pipeline_pm_use+0x54/0x90 [videodev]
>> [   92.990757]  v4l2_pipeline_pm_put+0x14/0x34 [videodev]
>> [   92.990793]  video_release+0x2c/0x44 [qcom_camss]
>> [   92.990828]  v4l2_release+0xe4/0xec [videodev]
> 
> Please include the backtrace up to this point into the commit message.
> 
> --
> Best wishes,
> Vladimir

