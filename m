Return-Path: <linux-media+bounces-57858-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFMKDzL6zGnRYgYAu9opvQ
	(envelope-from <linux-media+bounces-57858-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 12:57:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E82378F12
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 12:57:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 507653069639
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2026 10:50:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5EA63BE155;
	Wed,  1 Apr 2026 10:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hm3JX4kL"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539B13F20FA;
	Wed,  1 Apr 2026 10:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775040603; cv=none; b=QPjubQLGj7oId1mDj+MFjI3dtrrktFTI0yNxqve40jDskSyGds6+VNg7dT4MRBJ2XwWUBOjONifc/6Y7xhV3NBLWw0tsAWWl3xU7o/Qx+D2AHb4UlU68XF5n0M7Cq55wk0u4IHQMXMlzQDx8YXbEVhxA0m3r5KCp6LrnUTbuUI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775040603; c=relaxed/simple;
	bh=SKkbT0Y7gKmUmfmpaLSgovjxOMrRTTCLtPzeQ2a1S+c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BVaDXJZ/AeSP43oTNliW576QqR3KZMRPOfbfumA8+4cDyhFe5lF7oussMFHr/+YDdesHjBrqfk0CK+R83ZoE87Nwf9V/4DeANYlFggm37WByknph97bAT2wPckpOf6LEHjB6jSd3wsP+JJaD7tCUsNdEadmKoQIbcQ2KC8U/3Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hm3JX4kL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98AB8C4CEF7;
	Wed,  1 Apr 2026 10:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775040602;
	bh=SKkbT0Y7gKmUmfmpaLSgovjxOMrRTTCLtPzeQ2a1S+c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Hm3JX4kLVItHm5AO8NkBKRnzQbaZI8bRdhGau8By+u3A7V1aRvUcmsXiXA6sViZcV
	 fahwL8lnXsf0ab6ePC/ImF0cIuVBYmzQGasfv14P//UMO+jExKSNq3ccUrPIwxvkCa
	 d1fmTNaeM5XH/95fkWmUQZ7m0LSSzQOegFHGWa47atv3yUc20b0t4wRucJS6lOANqh
	 O4pgj4r1j31aXpj4dPOzpR4KrW9UeFY2Z39LPmsngGzlY4zH3OQtE04qEPI7+XKTi8
	 FRkl4qyg2G8bNkR1qZ4JaIbOX51L84WVygmnbWdSZQBibCFPb4xWZRt6nOvoNcJnTV
	 XNHP3dXDYtLHQ==
Message-ID: <65946b6d-de58-439c-b3cb-cc4efd33e7ef@kernel.org>
Date: Wed, 1 Apr 2026 11:49:57 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] media: iris: Add hardware power on/off ops for
 X1P42100
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260401-enable_iris_on_purwa-v4-0-ca784552a3e9@oss.qualcomm.com>
 <UWGD4fZwS2JZvaM77Ofs-c7w5CiwdKc339HhCZl8h0INDCypRHqTfSBm3RjP6a-j6z73KQNJn37MK8-3wuwF_g==@protonmail.internalid>
 <20260401-enable_iris_on_purwa-v4-2-ca784552a3e9@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20260401-enable_iris_on_purwa-v4-2-ca784552a3e9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57858-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C8E82378F12
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 01/04/2026 11:24, Wangao Wang wrote:
> On X1P42100 the Iris block has an extra BSE clock. Wire this clock into
> the power on/off sequence.
> 
> The BSE clock is used to drive the Bin Stream Engine, which is a sub-block
> of the video codec hardware responsible for bitstream-level processing. It
> is required to be enabled separately from the core clock to ensure proper
> codec operation.
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_vpu3x.c      | 46 ++++++++++++++++++++++
>   drivers/media/platform/qcom/iris/iris_vpu_common.h |  1 +
>   2 files changed, 47 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> index fe4423b951b1e9e31d06dffc69d18071cc985731..e6a62b3ca78efeefa2eed267636789a6b405689f 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> @@ -71,6 +71,44 @@ static void iris_vpu3_power_off_hardware(struct iris_core *core)
>   	iris_vpu_power_off_hw(core);
>   }
> 
> +static int iris_vpu3_purwa_power_on_hw(struct iris_core *core)
> +{
> +	int ret;
> +
> +	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
> +	if (ret)
> +		return ret;
> +
> +	ret = iris_prepare_enable_clock(core, IRIS_HW_CLK);
> +	if (ret)
> +		goto err_disable_power;
> +
> +	ret = iris_prepare_enable_clock(core, IRIS_BSE_HW_CLK);
> +	if (ret)
> +		goto err_disable_hw_clock;
> +
> +	ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], true);
> +	if (ret)
> +		goto err_disable_bse_hw_clock;
> +
> +	return 0;
> +
> +err_disable_bse_hw_clock:
> +	iris_disable_unprepare_clock(core, IRIS_BSE_HW_CLK);
> +err_disable_hw_clock:
> +	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
> +err_disable_power:
> +	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
> +
> +	return ret;
> +}
> +
> +static void iris_vpu3_purwa_power_off_hardware(struct iris_core *core)
> +{
> +	iris_vpu3_power_off_hardware(core);
> +	iris_disable_unprepare_clock(core, IRIS_BSE_HW_CLK);
> +}
> +
>   static void iris_vpu33_power_off_hardware(struct iris_core *core)
>   {
>   	bool handshake_done = false, handshake_busy = false;
> @@ -268,6 +306,14 @@ const struct vpu_ops iris_vpu3_ops = {
>   	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
>   };
> 
> +const struct vpu_ops iris_vpu3_purwa_ops = {
> +	.power_off_hw = iris_vpu3_purwa_power_off_hardware,
> +	.power_on_hw = iris_vpu3_purwa_power_on_hw,
> +	.power_off_controller = iris_vpu_power_off_controller,
> +	.power_on_controller = iris_vpu_power_on_controller,
> +	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
> +};
> +
>   const struct vpu_ops iris_vpu33_ops = {
>   	.power_off_hw = iris_vpu33_power_off_hardware,
>   	.power_on_hw = iris_vpu_power_on_hw,
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
> index f6dffc613b822341fb21e12de6b1395202f62cde..88a23cbdc06c5b38b4c8db67718cbd538f0e0721 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
> @@ -10,6 +10,7 @@ struct iris_core;
> 
>   extern const struct vpu_ops iris_vpu2_ops;
>   extern const struct vpu_ops iris_vpu3_ops;
> +extern const struct vpu_ops iris_vpu3_purwa_ops;
>   extern const struct vpu_ops iris_vpu33_ops;
>   extern const struct vpu_ops iris_vpu35_ops;
>   extern const struct vpu_ops iris_vpu4x_ops;
> 
> --
> 2.43.0
> 

Where @ v4 has noone else reviewed this yet or have you forgotten to b4 
trailers --update ?

Anyway.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

