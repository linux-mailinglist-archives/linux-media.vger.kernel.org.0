Return-Path: <linux-media+bounces-45-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 111AE7E7F1B
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 18:49:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8D9DAB21851
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 17:49:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E75003D966;
	Fri, 10 Nov 2023 17:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ahpsUV+y"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5305F3C695
	for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 17:46:56 +0000 (UTC)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95B252B7B3
	for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 03:09:33 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4083ac51d8aso14249745e9.2
        for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 03:09:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699614572; x=1700219372; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x0pADGJn0q6Hogb4HKG0TCZ/m/pzEDmxFAPr5TzrN0s=;
        b=ahpsUV+yGii1Mbzz7EZoH8qUfw9v5o9HCaRHCh6WEiJo9vwPSK2lTyaS5m/JcqhpGh
         rTVOF5KH3VSjlnmHVlbkRfOS1Izv1RE8yWlQvs2STdy57hdIVChigV9D4HgNG8REGOQs
         kSaPffZXY2MUs6HDamSyk8E/zuAQM6/UIzYPvThWYIZEd7auc9Cg3BPtImZx0czGA75f
         H1ea4Cr5PJauE+fveHVdZ/J7f+3xKoAQ9ZzcLH2+uPoOPWjnMc7/Ij+Dl8XNd3x3Fy1f
         xBLjcqEsL07MsXUF+WreXAEe0fNQphUzpq9yQoDJD3buFmjO0sQLpcMFv9Q2E9Ijw2io
         u9Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699614572; x=1700219372;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x0pADGJn0q6Hogb4HKG0TCZ/m/pzEDmxFAPr5TzrN0s=;
        b=fpxdSlV8C3M6cPhZHizLRxmBDN0ESibfpvJunv+cuM9btphBSZZnIWaWZMgvrB0FnP
         8Kafomaug/ZguwYIhUW3ZqN4LZB5gLPpoLBBCrxhIQJyurqJ3t/kYa1ziCgjYmI3CiPC
         6ou46dNHqNMwq5/oCrUUARCquw6rq9NWarKNeBKC1sHHMS8DDzkoTz3YNgXEmTKWejm6
         385La41xQIf/GlAabhAtf2vx4Hw3Do2gW1wvI1t1J2lhIPeiKznh+a3fwpZHznYhduQa
         3oPVX0dM0gWa24peype870QBQ7MciXHi/A+HfqOnRSpJFep4yIF3UDpg+I2WT+EU/HKH
         ui/Q==
X-Gm-Message-State: AOJu0YwGJDkFYZl3JXLqnl+wfo17oDZEG6rBBXWgSFYbEZxoOe5Ac7Af
	qoq8ZGF5k7R2bhneU1m+snhmEg==
X-Google-Smtp-Source: AGHT+IGmC5Ai27yr496WtLN9GxMx8T4pEXQsdGZQKhCHPdnlNxA6SGjI5+iIDeSrR3auzeZjl5v3UA==
X-Received: by 2002:a05:600c:a44:b0:40a:3e41:a258 with SMTP id c4-20020a05600c0a4400b0040a3e41a258mr4066695wmq.17.1699614571963;
        Fri, 10 Nov 2023 03:09:31 -0800 (PST)
Received: from [192.168.100.102] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id jg25-20020a05600ca01900b00405718cbeadsm794518wmb.1.2023.11.10.03.09.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Nov 2023 03:09:31 -0800 (PST)
Message-ID: <6d083c38-8807-47ad-8a05-37e89731de4f@linaro.org>
Date: Fri, 10 Nov 2023 11:09:29 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v3 4/5] clk: qcom: Use HW_CTRL_TRIGGER flag to
 switch video GDSC to HW mode
Content-Language: en-US
To: Jagadeesh Kona <quic_jkona@quicinc.com>, Abel Vesa
 <abel.vesa@linaro.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Kevin Hilman <khilman@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Pavel Machek <pavel@ucw.cz>, Len Brown <len.brown@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Taniya Das <tdas@qti.qualcomm.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-media@vger.kernel.org
References: <20231101-gdsc-hwctrl-v3-0-0740ae6b2b04@linaro.org>
 <20231101-gdsc-hwctrl-v3-4-0740ae6b2b04@linaro.org>
 <835a6add-81e9-42e4-abbe-91632aaa6bc9@linaro.org>
 <dfc56206-6e8d-d932-6493-e74162855298@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <dfc56206-6e8d-d932-6493-e74162855298@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/11/2023 08:29, Jagadeesh Kona wrote:
> 
> 
> On 11/7/2023 6:35 PM, Bryan O'Donoghue wrote:
>> On 01/11/2023 09:04, Abel Vesa wrote:
>>> From: Jagadeesh Kona <quic_jkona@quicinc.com>
>>>
>>> The current HW_CTRL flag switches the video GDSC to HW control mode as
>>> part of GDSC enable itself, instead of that use HW_CTRL_TRIGGER flag to
>>> give consumer drivers more control and switch the GDSC mode as and when
>>> required.
>>>
>>> HW_CTRL_TRIGGER flag allows consumer drivers to switch the video GDSC to
>>> HW/SW control modes at runtime using dev_pm_genpd_set_hwmode API.
>>>
>>> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
>>> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
>>> ---
>>>   drivers/clk/qcom/videocc-sc7180.c | 2 +-
>>>   drivers/clk/qcom/videocc-sc7280.c | 2 +-
>>>   drivers/clk/qcom/videocc-sdm845.c | 4 ++--
>>>   drivers/clk/qcom/videocc-sm8250.c | 4 ++--
>>>   drivers/clk/qcom/videocc-sm8550.c | 4 ++--
>>>   5 files changed, 8 insertions(+), 8 deletions(-)
>>
>> So.
>>
>> I'm assuming the rest of this series works however for sc8250 at least 
>> this is a NAK, breaks venus on rb5.
>>
>> Reproduction:
>>
>> - Debian trixie rb5
>> - Linux 6.6-rc3 + this patch
>> - Attached defconfig
>> - This file:
>>    https://download.samplelib.com/mp4/sample-30s.mp4
>> - This command:
>>    ffplay -loglevel debug -code:video h264_v4l2m2m -i sample-30s.mp4
>>
>> Second play of file shows stuck gdsc as below
>>
>> I didn't try on rb3, I'd expect similar results. Does this work on 8550 ?
>>
>> [ 1601.581204] ------------[ cut here ]------------
>> [ 1601.585983] mvs0_gdsc status stuck at 'off'
>> [ 1601.586015] WARNING: CPU: 1 PID: 13372 at 
>> drivers/clk/qcom/gdsc.c:178 gdsc_toggle_logic+0x16c/0x174
>> [ 1601.599627] Modules linked in: nf_tables libcrc32c nfnetlink 
>> snd_soc_hdmi_codec q6asm_dai q6routing q6afe_dai q6asm q6adm 
>> q6afe_clocks snd_q6dsp_common q6afe q6core apr pdr_interface venus_enc 
>> venus_dec qcom_camss videobuf2_dma_contig mcp251xfd imx412 
>> videobuf2_dma_sg venus_core xhci_plat_hcd v4l2_fwnode fastrpc xhci_hcd 
>> can_dev qrtr_smd lontium_lt9611uxc msm v4l2_async v4l2_mem2mem 
>> qcom_spmi_adc_tm5 rtc_pm8xxx qcom_spmi_adc5 qcom_pon videobuf2_memops 
>> crct10dif_ce qcom_spmi_temp_alarm videobuf2_v4l2 qcom_vadc_common 
>> gpu_sched drm_dp_aux_bus videodev snd_soc_sm8250 drm_display_helper 
>> snd_soc_qcom_sdw videobuf2_common snd_soc_qcom_common qrtr 
>> i2c_qcom_cci soundwire_qcom mc i2c_qcom_geni spi_geni_qcom 
>> phy_qcom_qmp_combo qcom_q6v5_pas qcom_rng soundwire_bus qcom_pil_info 
>> snd_soc_lpass_va_macro qcom_q6v5 slimbus snd_soc_lpass_macro_common 
>> qcom_sysmon snd_soc_lpass_wsa_macro display_connector qcom_common 
>> socinfo qcom_glink_smem qmi_helpers drm_kms_helper mdt_loader qcom_wdt 
>> icc_osm_l3 qnoc_sm8250 fuse drm backlight dm_mod
>> [ 1601.599859]  ip_tables x_tables
>> [ 1601.695314] CPU: 1 PID: 13372 Comm: video_decoder Not tainted 
>> 6.6.0-rc3-00396-gdbc0d9fa7641-dirty #1
>> [ 1601.704694] Hardware name: Qualcomm Technologies, Inc. Robotics RB5 
>> (DT)
>> [ 1601.711582] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS 
>> BTYPE=--)
>> [ 1601.718740] pc : gdsc_toggle_logic+0x16c/0x174
>> [ 1601.723317] lr : gdsc_toggle_logic+0x16c/0x174
>> [ 1601.727888] sp : ffff80008adab800
>> [ 1601.731296] x29: ffff80008adab800 x28: ffffb661e8596210 x27: 
>> ffffb661e855ad88
>> [ 1601.738629] x26: 0000000000000000 x25: ffff100c0b5a0d28 x24: 
>> ffffb6620fd92118
>> [ 1601.745960] x23: ffffb6620fe1d3d8 x22: 0000000000000000 x21: 
>> 0000000000000001
>> [ 1601.753292] x20: 00000000ffffff92 x19: ffffb6620fd92118 x18: 
>> ffffffffffc0d3e8
>> [ 1601.760631] x17: 0000000000000000 x16: ffffb6620e269e14 x15: 
>> 0000000000000028
>> [ 1601.767973] x14: 0000000000000000 x13: ffff100d75c00000 x12: 
>> 0000000000000894
>> [ 1601.775304] x11: 00000000000002dc x10: ffff100d767044a0 x9 : 
>> ffff100d75c00000
>> [ 1601.782636] x8 : 00000000fffdffff x7 : ffff100d76700000 x6 : 
>> 00000000000002dc
>> [ 1601.789976] x5 : ffff100d7ef40d48 x4 : 40000000fffe02dc x3 : 
>> ffff59ab6fa21000
>> [ 1601.797306] x2 : 0000000000000000 x1 : 0000000000000000 x0 : 
>> ffff100cdacdec80
>> [ 1601.804638] Call trace:
>> [ 1601.807161]  gdsc_toggle_logic+0x16c/0x174
>> [ 1601.811383]  gdsc_enable+0x60/0x27c
>> [ 1601.814982]  _genpd_power_on+0x94/0x184
>> [ 1601.818931]  genpd_power_on+0xa8/0x16c
>> [ 1601.822791]  genpd_runtime_resume+0xd4/0x2a4
>> [ 1601.827184]  __rpm_callback+0x48/0x1dc
>> [ 1601.831045]  rpm_callback+0x6c/0x78
>> [ 1601.834638]  rpm_resume+0x45c/0x6c8
>> [ 1601.838231]  __pm_runtime_resume+0x4c/0x90
>> [ 1601.842443]  coreid_power_v4+0x378/0x58c [venus_core]
>> [ 1601.847695]  vdec_start_streaming+0xc0/0x4e8 [venus_dec]
>> [ 1601.853169]  vb2_start_streaming+0x68/0x15c [videobuf2_common]
>> [ 1601.859199]  vb2_core_streamon+0xf8/0x1bc [videobuf2_common]
>> [ 1601.865032]  vb2_streamon+0x18/0x64 [videobuf2_v4l2]
>> [ 1601.870174]  v4l2_m2m_ioctl_streamon+0x38/0x98 [v4l2_mem2mem]
>> [ 1601.876134]  v4l_streamon+0x24/0x30 [videodev]
>> [ 1601.880759]  __video_do_ioctl+0x15c/0x3c0 [videodev]
>> [ 1601.885905]  video_usercopy+0x1f0/0x658 [videodev]
>> [ 1601.890868]  video_ioctl2+0x18/0x28 [videodev]
>> [ 1601.895481]  v4l2_ioctl+0x40/0x60 [videodev]
>> [ 1601.899911]  __arm64_sys_ioctl+0xac/0xf0
>> [ 1601.903958]  invoke_syscall+0x48/0x114
>> [ 1601.907829]  el0_svc_common.constprop.0+0x40/0xe0
>> [ 1601.912672]  do_el0_svc+0x1c/0x28
>> [ 1601.916085]  el0_svc+0x40/0xe8
>> [ 1601.919243]  el0t_64_sync_handler+0x100/0x12c
>> [ 1601.923730]  el0t_64_sync+0x190/0x194
>> [ 1601.927505] ---[ end trace 0000000000000000 ]---
>> [ 1608.121533] ------------[ cut here ]------------
>>
>> And just reverting the one patch - yields
>>
>> [  157.083287] qcom-venus aa00000.video-codec: Failed to switch 
>> power-domain:1 to SW mode
>> [  162.004630] qcom-venus aa00000.video-codec: Failed to switch 
>> power-domain:1 to SW mode
>>
>> I'll leave the testing here. Please fix !
>>
> 
> Thanks Bryan for reporting this, this could be happening since GDSC 
> might be left in HW control mode during power off sequence, so the 
> subsequent GDSC enable is failing since GDSC is still in HW mode. I am 
> checking internally on this and will get back.

Great,

Please remember to check for rb3 / sdm845 too.

---
bod


