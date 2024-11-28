Return-Path: <linux-media+bounces-22212-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCC59DB5B7
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 11:29:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EA61CB29602
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 10:28:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34D721922EE;
	Thu, 28 Nov 2024 10:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="T5j9YVLd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847D015383C;
	Thu, 28 Nov 2024 10:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732789689; cv=none; b=QF2QYaYcq6BH9HMA2gRSkfAoR7NIDfqaLFxiTKDtwog5Lc81ZGEYf3dDGEfG/TNu41MZUgXG5G+rzQgWVnIREm1QxluED0yY8rhkK7/bSQqb/ZdskV46MZsVeMb/hKiwZLTw8ISUEMdN4BKGooYbFpC4XqhsWz9RxZ49ldh+SAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732789689; c=relaxed/simple;
	bh=YrEo5hehgAEAGN3An5RDZ8sEkRwHqN1nj1OTu3/1DDw=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=VvzzuYxKFMIJKeaog8wNR3n24/4mq6TudZXBl4uT/wlJV/c/qGqXh/ltV4SmYxA9d55WpaXATjhXIpTkBkYS/6ynwvBte/fseRK7Bx085FIuEM5+l+F5VgUCQJ5EMU6Ax3v1nGmfXYcd6SLLiEq/jOpQ2mkB64fCvPnhoUCwqak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=T5j9YVLd; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from localhost (docker-mailserver-web-1.docker-mailserver_default [172.22.0.5])
	by mail.mainlining.org (Postfix) with ESMTPSA id 9DCC0E4804;
	Thu, 28 Nov 2024 10:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1732789679;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NvPH+Cxn3YTWJ5yYm5x6uzA7lBdDubk+cIR4Yqe5/ak=;
	b=T5j9YVLdGtjLXKZSfm/USRTbB4P2MHihoKieRZWdeA0ZBicDTA9KcK5nGvLY2rbboSzbVd
	qRo4owW2HH1CE5jPKV6QGS1+LzRAQ5zlUlyK1sWQYJVofp30392F27Eg9c+pu43r7gaXLK
	aCFWZ1pk7OYfbiyANxAWe1BnnM/4j1hSmcU6s8ttV1v7ch/r9IFl6AssgqZYXukvIglO+w
	3LEZkEmTKNu0YYWVmqGac5vVDq69TLLS4/bgWfPT42mmwRdfShtAhHeLnqokbbG9VRZKL4
	8y82BibxEvCijPZiu74buVQhD416bPqNNiGFjnKWnmfbwd7YZG0vu+uF7tVQ0Q==
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 28 Nov 2024 11:27:59 +0100
From: barnabas.czeman@mainlining.org
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, Bryan O'Donoghue
 <bryan.odonoghue@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: qcom: camss: fix VFE pm domain off
In-Reply-To: <acb6366a-aa6b-4c84-a3b2-cad03ae02ee7@linaro.org>
References: <a0a41b77-ee63-4d55-8c91-baf667c25cba@protonmail.com>
 <acb6366a-aa6b-4c84-a3b2-cad03ae02ee7@linaro.org>
Message-ID: <43be9872149cc60d2c5c21294cd69f07@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2024-11-28 10:10, Vladimir Zapolskiy wrote:
> On 11/27/24 12:01, Yassine Oudjana wrote:
>> On 22/11/2024 5:06 am, Barnabás Czémán wrote:
>>> Fix NULL pointer check before device_link_del
>>> is called.
> 
> The intention is clear, but the context of the change is completely 
> lost.
> 
>>> Fixes: eb73facec2c2 ("media: qcom: camss: Use common VFE 
>>> pm_domain_on/pm_domain_off where applicable")
> 
> It's invalid, the change is not a fix.
I don't agree this patch is fixing NULL pointer dereference.

[   92.989120] Unable to handle kernel NULL pointer dereference at 
virtual address 000000000000032c
[   92.989170] Mem abort info:
[   92.989186]   ESR = 0x0000000096000004
[   92.989203]   EC = 0x25: DABT (current EL), IL = 32 bits
[   92.989221]   SET = 0, FnV = 0
[   92.989237]   EA = 0, S1PTW = 0
[   92.989253]   FSC = 0x04: level 0 translation fault
[   92.989270] Data abort info:
[   92.989284]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
[   92.989300]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
[   92.989317]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[   92.989335] user pgtable: 4k pages, 48-bit VAs, pgdp=00000001218a8000
[   92.989354] [000000000000032c] pgd=0000000000000000, 
p4d=0000000000000000
[   92.989389] Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
[   92.989408] Modules linked in: q6afe_dai q6asm_dai q6routing q6adm 
q6asm q6afe snd_q6dsp_common panel_lgphilips_sw43101 q6core venus_enc 
venus_dec videobuf2_dma_contig imx318 ak7375 snd_soc_wcd9335 
regmap_slimbus snd_soc_wcd_classh apr snd_soc_apq8096 
snd_soc_qcom_common snd_soc_core qcom_camss msm v4l2_fwnode snd_compress 
ath10k_pci v4l2_async ath10k_core snd_pcm nxp_nci_i2c drm_exec nxp_nci 
venus_core videobuf2_dma_sg snd_timer ath v4l2_mem2mem videobuf2_memops 
mac80211 drm_dp_aux_bus snd gpu_sched nci videobuf2_v4l2 libarc4 
soundcore videodev nfc slim_qcom_ngd_ctrl drm_display_helper hci_uart 
pdr_interface videobuf2_common btqca drm_kms_helper slimbus i2c_qcom_cci 
bluetooth mc qcom_q6v5_pas qcom_q6v5_mss qcom_pil_info qcom_q6v5 
qcom_sysmon qcom_common qmi_helpers mdt_loader socinfo rmtfs_mem 
pwm_ir_tx cfg80211 rfkill zram zsmalloc atmel_mxt_ts drm 
drm_panel_orientation_quirks dm_mod ip_tables
[   92.989981] CPU: 2 PID: 1365 Comm: pool-megapixels Not tainted 
6.9.0-rc3+ #10
[   92.990003] Hardware name: Xiaomi Mi Note 2 (DT)
[   92.990020] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS 
BTYPE=--)
[   92.990042] pc : device_link_put_kref+0xc/0xb8
[   92.990071] lr : device_link_del+0x30/0x48
[   92.990089] sp : ffff80008a5db9d0
[   92.990105] x29: ffff80008a5db9d0 x28: 0000000000000001 x27: 
0000000000000000
[   92.990143] x26: 0000000000000000 x25: ffff0000e79d9100 x24: 
ffff0000e79d9500
[   92.990180] x23: ffff0000943f8568 x22: 00000000ffffffff x21: 
0000000000000000
[   92.990217] x20: 0000000000000000 x19: ffff800081352498 x18: 
0000000000000000
[   92.990253] x17: 0000000000000000 x16: 0000000000000000 x15: 
0000000000000168
[   92.990288] x14: 0000000000000000 x13: 0000000000000191 x12: 
ffff800081259d58
[   92.990324] x11: 0000000000000001 x10: 0000000000000a60 x9 : 
ffff80008a5db7e0
[   92.990359] x8 : ffff0000e79d9bc0 x7 : 0000000000000004 x6 : 
0000000000000190
[   92.990396] x5 : 0000000000000057 x4 : 0000000000000000 x3 : 
0000000000000000
[   92.990430] x2 : ffff0000e79d9100 x1 : 0000000000000000 x0 : 
0000000000000000
[   92.990466] Call trace:
[   92.990482]  device_link_put_kref+0xc/0xb8
[   92.990503]  device_link_del+0x30/0x48
[   92.990522]  vfe_pm_domain_off+0x24/0x38 [qcom_camss]
[   92.990566]  vfe_put+0x9c/0xd0 [qcom_camss]
[   92.990601]  vfe_set_power+0x48/0x58 [qcom_camss]
[   92.990636]  pipeline_pm_power_one+0x154/0x158 [videodev]
[   92.990683]  pipeline_pm_power+0x74/0xfc [videodev]
[   92.990720]  v4l2_pipeline_pm_use+0x54/0x90 [videodev]
[   92.990757]  v4l2_pipeline_pm_put+0x14/0x34 [videodev]
[   92.990793]  video_release+0x2c/0x44 [qcom_camss]
[   92.990828]  v4l2_release+0xe4/0xec [videodev]
[   92.990865]  __fput+0x78/0x2c4
[   92.990892]  ____fput+0x10/0x1c
[   92.990915]  task_work_run+0x74/0xcc
[   92.990936]  do_exit+0x2c4/0x8fc
[   92.990961]  do_group_exit+0x34/0x90
[   92.990984]  get_signal+0x870/0x880
[   92.991008]  do_signal+0x8c/0x12b8
[   92.991034]  do_notify_resume+0xc8/0x140
[   92.991054]  el0_svc+0xc4/0xd8
[   92.991079]  el0t_64_sync_handler+0x120/0x12c
[   92.991102]  el0t_64_sync+0x190/0x194
[   92.991127] Code: 17ffffda d503233f a9bf7bfd 910003fd (b9432c01)
[   92.991150] ---[ end trace 0000000000000000 ]---

Here is a similar example from camss:
static void camss_genpd_cleanup(struct camss *camss)
{
         if (camss->genpd_num == 1)
                 return;

         camss_genpd_subdevice_cleanup(camss);

         if (camss->genpd_link)
                 device_link_del(camss->genpd_link);

         dev_pm_domain_detach(camss->genpd, true);
}
> 
>>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>> ---
>>>    drivers/media/platform/qcom/camss/camss-vfe.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>> 
>>> 
>>> ---
>>> base-commit: decc701f41d07481893fdea942c0ac6b226e84cd
>>> change-id: 20241122-vfe_pm_domain_off-c57008e54167
>>> 
>>> Best regards,
>>> 
>>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c 
>>> b/drivers/media/platform/qcom/camss/camss-vfe.c
>>> index 
>>> 80a62ba11295042802cbaec617fb87c492ea6a55..1bf1473331f63b9ab106d21ea263c84d851c8a31 
>>> 100644
>>> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
>>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
>>> @@ -595,7 +595,7 @@ void vfe_isr_reset_ack(struct vfe_device *vfe)
>>>     */
>>>    void vfe_pm_domain_off(struct vfe_device *vfe)
>>>    {
>>> -	if (!vfe->genpd)
>>> +	if (!vfe->genpd_link)
>>>    		return;
>>>       	device_link_del(vfe->genpd_link);
>> 
>> Tested-by: Yassine Oudjana <y.oudjana@protonmail.com>
>> 
> 
> The change is useless and it shall be dropped.
> 
> --
> Best wishes,
> Vladimir

