Return-Path: <linux-media+bounces-59129-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJ8tCmf+5WlEqAEAu9opvQ
	(envelope-from <linux-media+bounces-59129-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 12:22:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 778434294F9
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 12:22:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF5663076176
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 10:20:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15C72398917;
	Mon, 20 Apr 2026 10:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k0Cejczh"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687A9397E9F;
	Mon, 20 Apr 2026 10:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776680448; cv=none; b=WYdorCAtZYf9vDTg9lGgsmCHjL2cnoPyae5JFoHCsGO9N4lBb/wozSk5OuoZRW43Qcmwtt7IwrrjS7Jk9KJkBkofYI1piz1fGe99FLtTdp29knBsaBFebuTaeexN4oEWCGnJwpFpvyWbATg4Beo3V8hdrA5rRZto6LeJcByL1HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776680448; c=relaxed/simple;
	bh=jEOZxkvycRBfcI74UvSRLCf/r3sC5rcqRPHdwFEx8UU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eLiM1APgV7kKHVBCDxkzWqC3RaNWtdakn0qMCq5kHyqts7ZuODPpbDoShOxFE6iU+XicL6Zs58Cdgn8k5pnXYU2EwgIuWIOPUFhluU3Yo6iOwxf1rMObaEAa4hzDupTIXuYMIxWt4si9f1ev4ogK1sdSg++CLOB+Q4eHnvj16vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k0Cejczh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB199C19425;
	Mon, 20 Apr 2026 10:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776680448;
	bh=jEOZxkvycRBfcI74UvSRLCf/r3sC5rcqRPHdwFEx8UU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=k0CejczhMPCV1cle5DqSGttgtBMhv4Q6WLGck+pk6rNINRP/gy6p5FYs3XWGiVE5Y
	 Izkcud3y5hMpMCyztRTCE6bJVkKmDO6Ie9bsID8uE7KzIQNLnUGeZKsEb0j3IHOtD7
	 BgoFUgCKarJ/p5ftExH2HlAV8LCnAAmCqY5hfWWI+IDuaXDhPYSI0l9geHvR+aJLLU
	 wC66BKsjH30ZdPmJ2Qe7Z8PC4pMhtQnE8Bsa3Kv8gD2WnzHVSW0Qstv+lrZs9UKONh
	 79hj3S0LR7oU+vOkDqpLrAXkUrZ5VTjxnGfByJhcU3zsdS7Z9uv/V8tKTRgSkaYxmT
	 j1qbgTgBQDYzQ==
Message-ID: <b18d5f20-4013-47a3-bf43-06162682a65a@kernel.org>
Date: Mon, 20 Apr 2026 11:20:44 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: venus: declare firmware files via MODULE_FIRMWARE
To: Christopher Obbard <christopher.obbard@linaro.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <5RSTHU5_nsLp9gy49GbhT_8mHBjtBeKDsC6F1ABHCU9ZdpW9A8692UruVYnsCexIJGWsWiW2R5WtPULge31Gyw==@protonmail.internalid>
 <20260419-wip-obbardc-qcom-venus-firmware-v1-1-08a0d3cf056f@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <20260419-wip-obbardc-qcom-venus-firmware-v1-1-08a0d3cf056f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59129-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.10:email,inspiron14p-linux:email,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 778434294F9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 19/04/2026 23:39, Christopher Obbard wrote:
> The driver loads firmware blobs at runtime via request_firmware()
> but does not currently advertise the possible filenames. Add
> MODULE_FIRMWARE() entries for all known firmware variants so they are
> visible via modinfo and can be picked up by user space tooling.
> 
> Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> ---
>   drivers/media/platform/qcom/venus/core.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index 7e639760c41d..7ed7cffb333b 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -1119,6 +1119,16 @@ static const struct venus_resources qcm2290_res = {
>   	.min_fw = &min_fw,
>   };
> 
> +MODULE_FIRMWARE("qcom/venus-1.8/venus.mbn");
> +MODULE_FIRMWARE("qcom/venus-4.2/venus.mbn");
> +MODULE_FIRMWARE("qcom/venus-4.4/venus.mbn");
> +MODULE_FIRMWARE("qcom/venus-4.4/venus.mdt");
> +MODULE_FIRMWARE("qcom/venus-5.2/venus.mbn");
> +MODULE_FIRMWARE("qcom/venus-5.4/venus.mbn");
> +MODULE_FIRMWARE("qcom/vpu-1.0/venus.mbn");
> +MODULE_FIRMWARE("qcom/vpu-2.0/venus.mbn");
> +MODULE_FIRMWARE("qcom/venus-6.0/venus.mbn");
> +
>   static const struct of_device_id venus_dt_match[] = {
>   	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
>   	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
> 
> ---
> base-commit: 4f5b4b748ac75683d61c304ee3ee0db235e8f312
> change-id: 20260419-wip-obbardc-qcom-venus-firmware-abdd35b05a22
> 
> Best regards,
> --
> Christopher Obbard <christopher.obbard@linaro.org>
> 
> 

What about the board dtsi files ?

#( 04/20/26@10:29 )( deckard@inspiron14p-linux 
):~/Development/linux@arm64-laptops-v7.1-rc6-camss✗✗✗
    grep -r "venus.mbn" *
arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi:	firmware-name 
= "qcom/sm8250/xiaomi/elish/venus.mbn";
arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts:	firmware-name = 
"qcom/qcm6490/fairphone5/venus.mbn";
arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts:	firmware-name = 
"qcom/msm8996/gemini/venus.mbn";
arch/arm64/boot/dts/qcom/msm8996-oneplus3.dts:	firmware-name = 
"qcom/msm8996/oneplus3/venus.mbn";
arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi:	firmware-name = 
"qcom/sdm845/Sony/tama/venus.mbn";
arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts:	firmware-name = 
"qcom/sdm845/Xiaomi/polaris/venus.mbn";
arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi:	firmware-name = 
"qcom/sm8250/Sony/edo/venus.mbn";
arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts:	firmware-name = 
"qcom/sm8250/xiaomi/pipa/venus.mbn";
arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi:	firmware-name = 
"qcom/sdm845/OnePlus/enchilada/venus.mbn";
arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dts:	firmware-name = 
"qcom/msm8996/scorpio/venus.mbn";
arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi:	firmware-name = 
"qcom/sdm845/Google/blueline/venus.mbn";
arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts:	firmware-name = 
"qcom/qcm6490/SHIFT/otter/venus.mbn";
arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts:	firmware-name = 
"qcom/sdm845/SHIFT/axolotl/venus.mbn";
arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dts:	firmware-name = 
"qcom/msm8996/oneplus3t/venus.mbn";
arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi: 
firmware-name = "qcom/sdm845/Xiaomi/beryllium/venus.mbn";
arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dts:	firmware-name = 
"qcom/msm8996/natrium/venus.mbn";
drivers/media/platform/qcom/venus/core.c:	.fwname = 
"qcom/venus-1.8/venus.mbn",
drivers/media/platform/qcom/venus/core.c:	.fwname = 
"qcom/venus-4.2/venus.mbn",
drivers/media/platform/qcom/venus/core.c:	.fwname = 
"qcom/venus-4.4/venus.mbn",
drivers/media/platform/qcom/venus/core.c:	.fwname = 
"qcom/venus-5.2/venus.mbn",
drivers/media/platform/qcom/venus/core.c:	.fwname = 
"qcom/venus-5.2/venus.mbn",
drivers/media/platform/qcom/venus/core.c:	.fwname = 
"qcom/venus-5.4/venus.mbn",
drivers/media/platform/qcom/venus/core.c:	.fwname = 
"qcom/vpu-1.0/venus.mbn",
drivers/media/platform/qcom/venus/core.c:	.fwname = 
"qcom/vpu-2.0/venus.mbn",
drivers/media/platform/qcom/venus/core.c:	.fwname = 
"qcom/vpu-2.0/venus.mbn",
drivers/media/platform/qcom/venus/core.c:	.fwname = 
"qcom/venus-6.0/venus.mbn",
drivers/media/platform/qcom/venus/core.c:	.fwname = 
"qcom/vpu-2.0/venus.mbn",
drivers/media/platform/qcom/iris/iris_platform_gen1.c:	.fwname = 
"qcom/vpu-1.0/venus.mbn",

---
bod

