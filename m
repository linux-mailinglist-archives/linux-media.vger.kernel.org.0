Return-Path: <linux-media+bounces-52030-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aORULLi+gGl3AgMAu9opvQ
	(envelope-from <linux-media+bounces-52030-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 16:11:52 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7C1CDF64
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 16:11:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 83FE5303740D
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 15:09:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 012AD3783D5;
	Mon,  2 Feb 2026 15:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RqNvkwlY"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627AC376BE2;
	Mon,  2 Feb 2026 15:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770044973; cv=none; b=BABt617b+Msb5FAAFczXipQ5yJM4TX8Sv41yD85ETE0IZLtq8FaWIv9MssYXoSN3ZgD5RKkYJKBlURhy3PLm+nK20VWruW2RaXlCNbsG+iPVCOSwcqAVfhF/g65fDWP/XrIlR5wU7wBIWQio+KOymUm7T3BFmoQNT3dzbqo1fgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770044973; c=relaxed/simple;
	bh=9E/FR4q3vtIyA3a+HHqzla9sze5VoEKNZY/ceoasSoQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sZHfG3YRK3Hu4k0wiA/PePuXn+cvVRXToBkvhCOHGVWG8cUx11JsiSgYgWY9PHGcvH39GAwzxMtmfWS4nzHEq7MWk1gtRcnShe90gvamqqZIYbDqdStoWK1LKausVAgyqvzQUjhZA+ep+ZUXD+dkz8kSTZHDArxWy35i2kwiPpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RqNvkwlY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DC77C116C6;
	Mon,  2 Feb 2026 15:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770044972;
	bh=9E/FR4q3vtIyA3a+HHqzla9sze5VoEKNZY/ceoasSoQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RqNvkwlYbu8R3ZhmeIcbfdABgYW/Ixgl0H2RCG2H3VCw6+UuLpm4ft8FnJ9aX6XGS
	 fOyC1KMy9O9ngHbdOVQwrWwoU8vqfjPNgBAnVOTsCw+NXdRfHZCvKho20yQTikW2A1
	 Ym2mKI9k7MVvpxf7t4uMDH7DsrsnIobTqgGGRPRIjZsuOXp65xsVtHvGCSNYYcyxnl
	 F40FDv0AHYxu1IyekVSENCaUI5w+QCClD3/4dPLNmeg/PlB54oBT/5mY1HZaZ4sNYb
	 tUdAg7eMObt+AEi+jb3ZawLbrZQDmbMpdZCoHHvjzWY9ZZUSRQsTkWSX85eysdOLD5
	 AoCKMqtBuRzgQ==
Message-ID: <dd36c365-cffb-4fac-bf11-40e4896cbab5@kernel.org>
Date: Mon, 2 Feb 2026 15:09:26 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] media: iris: Switch to hardware mode after firmware
 boot
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Stefan Schmidt <stefan.schmidt@linaro.org>,
 Hans Verkuil <hverkuil@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260126-kaanapali-iris-v1-0-e2646246bfc1@oss.qualcomm.com>
 <fLxe2FUgx2tsLsXWrEdDq_iHxUUnVhy0BT_zzO3t3rmpLau36zhbLaZFyH5tQZJRO-uLVcHm4RsG_x1PEVOnKw==@protonmail.internalid>
 <20260126-kaanapali-iris-v1-4-e2646246bfc1@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20260126-kaanapali-iris-v1-4-e2646246bfc1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52030-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 0D7C1CDF64
X-Rspamd-Action: no action

On 26/01/2026 12:25, Vikash Garodia wrote:
> Currently the driver switches the vcodec GDSC to hardware (HW) mode
> before firmware load and boot sequence. GDSC can be powered off,
> keeping in hw mode, thereby the vcodec registers programmed in TrustZone
> (TZ) carry default (reset) values.
> Move the transition to HW mode after firmware load and boot sequence.
> 
> The bug was exposed with driver configuring different stream ids to
> different devices via iommu-map. With registers carrying reset values,
> VPU would not generate desired stream-id, thereby leading to SMMU fault.
> 
> Fixes: dde659d37036 ("media: iris: Introduce vpu ops for vpu4 with necessary hooks")
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_core.c       |  4 ++++
>   drivers/media/platform/qcom/iris/iris_hfi_common.c |  4 ++++
>   drivers/media/platform/qcom/iris/iris_vpu2.c       |  1 +
>   drivers/media/platform/qcom/iris/iris_vpu3x.c      |  9 +++-----
>   drivers/media/platform/qcom/iris/iris_vpu4x.c      | 24 ++++++++++++----------
>   drivers/media/platform/qcom/iris/iris_vpu_common.c | 16 +++++++++------
>   drivers/media/platform/qcom/iris/iris_vpu_common.h |  3 +++
>   7 files changed, 38 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
> index 8406c48d635b6eba0879396ce9f9ae2292743f09..dbaac01eb15a0e622e85635fddd29c1f7fc18662 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.c
> +++ b/drivers/media/platform/qcom/iris/iris_core.c
> @@ -75,6 +75,10 @@ int iris_core_init(struct iris_core *core)
>   	if (ret)
>   		goto error_unload_fw;
> 
> +	ret = iris_vpu_switch_to_hwmode(core);
> +	if (ret)
> +		goto error_unload_fw;
> +
>   	ret = iris_hfi_core_init(core);
>   	if (ret)
>   		goto error_unload_fw;
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.c b/drivers/media/platform/qcom/iris/iris_hfi_common.c
> index 92112eb16c11048e28230a2926dfb46e3163aada..621c66593d88d47ef3438c98a07cb29421c4e375 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_common.c
> @@ -159,6 +159,10 @@ int iris_hfi_pm_resume(struct iris_core *core)
>   	if (ret)
>   		goto err_suspend_hw;
> 
> +	ret = iris_vpu_switch_to_hwmode(core);
> +	if (ret)
> +		goto err_suspend_hw;
> +
>   	ret = ops->sys_interframe_powercollapse(core);
>   	if (ret)
>   		goto err_suspend_hw;
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu2.c b/drivers/media/platform/qcom/iris/iris_vpu2.c
> index 9c103a2e4e4eafee101a8a9b168fdc8ca76e277d..01ef40f3895743b3784464e2d5ba2de1aeca5a4a 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu2.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu2.c
> @@ -44,4 +44,5 @@ const struct vpu_ops iris_vpu2_ops = {
>   	.power_off_controller = iris_vpu_power_off_controller,
>   	.power_on_controller = iris_vpu_power_on_controller,
>   	.calc_freq = iris_vpu2_calc_freq,
> +	.set_hwmode = iris_vpu_set_hwmode,
>   };
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> index fe4423b951b1e9e31d06dffc69d18071cc985731..3dad47be78b58f6cd5ed6f333b3376571a04dbf0 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> @@ -234,14 +234,8 @@ static int iris_vpu35_power_on_hw(struct iris_core *core)
>   	if (ret)
>   		goto err_disable_hw_free_clk;
> 
> -	ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], true);
> -	if (ret)
> -		goto err_disable_hw_clk;
> -
>   	return 0;
> 
> -err_disable_hw_clk:
> -	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
>   err_disable_hw_free_clk:
>   	iris_disable_unprepare_clock(core, IRIS_HW_FREERUN_CLK);
>   err_disable_axi_clk:
> @@ -266,6 +260,7 @@ const struct vpu_ops iris_vpu3_ops = {
>   	.power_off_controller = iris_vpu_power_off_controller,
>   	.power_on_controller = iris_vpu_power_on_controller,
>   	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
> +	.set_hwmode = iris_vpu_set_hwmode,
>   };
> 
>   const struct vpu_ops iris_vpu33_ops = {
> @@ -274,6 +269,7 @@ const struct vpu_ops iris_vpu33_ops = {
>   	.power_off_controller = iris_vpu33_power_off_controller,
>   	.power_on_controller = iris_vpu_power_on_controller,
>   	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
> +	.set_hwmode = iris_vpu_set_hwmode,
>   };
> 
>   const struct vpu_ops iris_vpu35_ops = {
> @@ -283,4 +279,5 @@ const struct vpu_ops iris_vpu35_ops = {
>   	.power_on_controller = iris_vpu35_vpu4x_power_on_controller,
>   	.program_bootup_registers = iris_vpu35_vpu4x_program_bootup_registers,
>   	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
> +	.set_hwmode = iris_vpu_set_hwmode,
>   };
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu4x.c b/drivers/media/platform/qcom/iris/iris_vpu4x.c
> index a8db02ce5c5ec583c4027166b34ce51d3d683b4e..02e100a4045fced33d7a3545b632cc5f0955233f 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu4x.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu4x.c
> @@ -252,21 +252,10 @@ static int iris_vpu4x_power_on_hardware(struct iris_core *core)
>   		ret = iris_vpu4x_power_on_apv(core);
>   		if (ret)
>   			goto disable_hw_clocks;
> -
> -		iris_vpu4x_ahb_sync_reset_apv(core);
>   	}
> 
> -	iris_vpu4x_ahb_sync_reset_hardware(core);
> -
> -	ret = iris_vpu4x_genpd_set_hwmode(core, true, efuse_value);
> -	if (ret)
> -		goto disable_apv_power_domain;
> -
>   	return 0;
> 
> -disable_apv_power_domain:
> -	if (!(efuse_value & DISABLE_VIDEO_APV_BIT))
> -		iris_vpu4x_power_off_apv(core);
>   disable_hw_clocks:
>   	iris_vpu4x_disable_hardware_clocks(core, efuse_value);
>   disable_vpp1_power_domain:
> @@ -359,6 +348,18 @@ static void iris_vpu4x_power_off_hardware(struct iris_core *core)
>   	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
>   }
> 
> +static int iris_vpu4x_set_hwmode(struct iris_core *core)
> +{
> +	u32 efuse_value = readl(core->reg_base + WRAPPER_EFUSE_MONITOR);
> +
> +	if (!(efuse_value & DISABLE_VIDEO_APV_BIT))
> +		iris_vpu4x_ahb_sync_reset_apv(core);
> +
> +	iris_vpu4x_ahb_sync_reset_hardware(core);
> +
> +	return iris_vpu4x_genpd_set_hwmode(core, true, efuse_value);
I'd like to see something in the commit log about the efuse value. What 
is it, why does it appear etc.

Because just to be difficult you are not doing a 1:1 switch to hw_mode 
here, you're also introducing contingent logic.

---
bod

