Return-Path: <linux-media+bounces-56860-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BfJIeFuwmmncwQAu9opvQ
	(envelope-from <linux-media+bounces-56860-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 12:00:49 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A588A306ECD
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 12:00:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8BE34303775C
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 11:00:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D20F3E9F67;
	Tue, 24 Mar 2026 11:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IBvF/wsK"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AE63E6DDB;
	Tue, 24 Mar 2026 11:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774350026; cv=none; b=HaSTEOskXQuSUT22vRhmry0v9vM/OMSYzsD2wT7HCpunygy7yIxOXB1WJhCFIeuZAV9Mcnyx4xTpFIA3hU9Tc9XLQ5wRxi0SVKxkbOMrXuPCW542xcsrL5KMeXVCWOsjgchpoJQNdNFBLLsBCN4wlzjNHWO0B1zEEs5Nj5dZIKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774350026; c=relaxed/simple;
	bh=ZmYd5NYG4lIHGzbYxjb65sovO6w7hI/WygWC8hGfIws=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lIIvN8uizuhBr6/k02Xo1uhJdBQ0RKRGU7U7tw1dTpFKo1LfbjQQB3CgPZhJ/bz+R9K2W0FDFOJdI4cvRg5nDBUQ4VshJx9AYnjPG6A0JsRYn33SzTIp1M+dvLnCGd8uraBl/rEMjtFHAkWEb9mn0pmMf703paKrh6dWL7qocRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IBvF/wsK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8FA0C19424;
	Tue, 24 Mar 2026 11:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774350025;
	bh=ZmYd5NYG4lIHGzbYxjb65sovO6w7hI/WygWC8hGfIws=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IBvF/wsKOL0V45hkg3Yl/TORRrIy70uW/uxnihu3MJO5sAniRqcCM4T4vUfKp9mOs
	 GGK6fjrdkU74Du63BmcheWJpLAOPGKh0znOlMm0lPA+yAOR1avQR2Ry9wwx4zZNnOB
	 wCZV7cPEnvFoTyRyXvgJApTkm4HjsX8N8fqMNcZNYbqfUch9tii2pxf+ZqyajXq0UM
	 sApUZFC7DeDowdhfAwcFY6WwHhlglnxobO89sovdu/OylVakxOYYrl0n3xkuuJgSne
	 R6T6QSRfSYxA/GuXWvRNfpA9JSIvBhjzYNQSowCwruuT7GL3ZoB66YffkBpLR3q+tL
	 0XLulgv39ftFA==
Message-ID: <12194cc0-0960-486c-be7e-1a22d95de340@kernel.org>
Date: Tue, 24 Mar 2026 11:00:21 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/3] media: qcom: camss: Add CAMSS Offline Processing
 Engine driver
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: vladimir.zapolskiy@linaro.org, laurent.pinchart@ideasonboard.com,
 kieran.bingham@ideasonboard.com, robh@kernel.org, krzk+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, johannes.goede@oss.qualcomm.com,
 mchehab@kernel.org
References: <20260323125824.211615-1-loic.poulain@oss.qualcomm.com>
 <m61yNNvSrw6AIq7_-g2h7VQLmGJ_5iCLg5JTlfQDcL5LlBq37ifAeXw-K3AlRBck5Mb4uVQq0pzeBNAybQNk4w==@protonmail.internalid>
 <20260323125824.211615-3-loic.poulain@oss.qualcomm.com>
 <1ba54ec0-be51-4694-a79b-f272e76303d2@kernel.org>
 <X-Lw_zi1o015-V1Cv4dY_ik6SfTB8TTcLmn1l-Ta7UviYTJ6gwMBn4B4ulYwjd_Aetul5xUt0T6ln9E-Hl5h4g==@protonmail.internalid>
 <CAFEp6-3ziXJTYADOFj--rZL5TumroXuW+=SnUQ9XakRxHT-ypg@mail.gmail.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <CAFEp6-3ziXJTYADOFj--rZL5TumroXuW+=SnUQ9XakRxHT-ypg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56860-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A588A306ECD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 23/03/2026 15:31, Loic Poulain wrote:
>>> +
>>> +static void ope_prog_bayer2rgb(struct ope_dev *ope)
>>> +{
>>> +     /* Fixed Settings */
>>> +     ope_write_pp(ope, 0x860, 0x4001);
>>> +     ope_write_pp(ope, 0x868, 128);
>>> +     ope_write_pp(ope, 0x86c, 128 << 20);
>>> +     ope_write_pp(ope, 0x870, 102);
>> What are the magic numbers about ? Please define bit-fields and offsets.
> There are some registers I can't disclose today, which have to be
> configured with working values,
> Similarly to some sensor configuration in media/i2c.

Not really the same thing, all of the offsets in upstream CAMSS and its 
CLC are documented. Sensor values are typically upstreamed by people who 
don't control the documentation, that is not the case with Qcom 
submitting this code upstream now.

Are you guys doing an upstream implementation or not ?

>> Parameters passed in from user-space/libcamera and then translated to
>> registers etc.
> The above fixed settings will not be part of the initial parameters.
> 
>>> +}
>>> +
>>> +static void ope_prog_wb(struct ope_dev *ope)
>>> +{
>>> +     /* Default white balance config */
>>> +     u32 g_gain = OPE_WB(1, 1);
>>> +     u32 b_gain = OPE_WB(3, 2);
>>> +     u32 r_gain = OPE_WB(3, 2);
>>> +
>>> +     ope_write_pp(ope, OPE_PP_CLC_WB_GAIN_WB_CFG(0), g_gain);
>>> +     ope_write_pp(ope, OPE_PP_CLC_WB_GAIN_WB_CFG(1), b_gain);
>>> +     ope_write_pp(ope, OPE_PP_CLC_WB_GAIN_WB_CFG(2), r_gain);
>>> +
>>> +     ope_write_pp(ope, OPE_PP_CLC_WB_GAIN_MODULE_CFG, OPE_PP_CLC_WB_GAIN_MODULE_CFG_EN);
>>> +}
>> Fixed gains will have to come from real data.
> These gains will indeed need to be configurable, most likely via ISP
> parameters, here, they have been adjusted based on colorbar test
> pattern from imx219 sensors but also tested with real capture.
> 
>>> +
>>> +static void ope_prog_stripe(struct ope_ctx *ctx, struct ope_stripe *stripe)
>>> +{
>>> +     struct ope_dev *ope = ctx->ope;
>>> +     int i;
>>> +
>>> +     dev_dbg(ope->dev, "Context %p - Programming S%u\n", ctx, ope_stripe_index(ctx, stripe));
>>> +
>>> +     /* Fetch Engine */
>>> +     ope_write_rd(ope, OPE_BUS_RD_CLIENT_0_UNPACK_CFG_0, stripe->src.format);
>>> +     ope_write_rd(ope, OPE_BUS_RD_CLIENT_0_RD_BUFFER_SIZE,
>>> +                  (stripe->src.width << 16) + stripe->src.height);
>>> +     ope_write_rd(ope, OPE_BUS_RD_CLIENT_0_ADDR_IMAGE, stripe->src.addr);
>>> +     ope_write_rd(ope, OPE_BUS_RD_CLIENT_0_RD_STRIDE, stripe->src.stride);
>>> +     ope_write_rd(ope, OPE_BUS_RD_CLIENT_0_CCIF_META_DATA,
>>> +                  FIELD_PREP(OPE_BUS_RD_CLIENT_0_CCIF_MD_PIX_PATTERN, stripe->src.pattern));
>>> +     ope_write_rd(ope, OPE_BUS_RD_CLIENT_0_CORE_CFG, OPE_BUS_RD_CLIENT_0_CORE_CFG_EN);
>>> +
>>> +     /* Write Engines */
>>> +     for (i = 0; i < OPE_WR_CLIENT_MAX; i++) {
>>> +             if (!stripe->dst[i].enabled) {
>>> +                     ope_write_wr(ope, OPE_BUS_WR_CLIENT_CFG(i), 0);
>>> +                     continue;
>>> +             }
>>> +
>>> +             ope_write_wr(ope, OPE_BUS_WR_CLIENT_ADDR_IMAGE(i), stripe->dst[i].addr);
>>> +             ope_write_wr(ope, OPE_BUS_WR_CLIENT_IMAGE_CFG_0(i),
>>> +                          (stripe->dst[i].height << 16) + stripe->dst[i].width);
>>> +             ope_write_wr(ope, OPE_BUS_WR_CLIENT_IMAGE_CFG_1(i), stripe->dst[i].x_init);
>>> +             ope_write_wr(ope, OPE_BUS_WR_CLIENT_IMAGE_CFG_2(i), stripe->dst[i].stride);
>>> +             ope_write_wr(ope, OPE_BUS_WR_CLIENT_PACKER_CFG(i), stripe->dst[i].format);
>>> +             ope_write_wr(ope, OPE_BUS_WR_CLIENT_CFG(i),
>>> +                          OPE_BUS_WR_CLIENT_CFG_EN + OPE_BUS_WR_CLIENT_CFG_AUTORECOVER);
>>> +     }
>>> +
>>> +     /* Downscalers */
>>> +     for (i = 0; i < OPE_DS_MAX; i++) {
>>> +             struct ope_dsc_config *dsc = &stripe->dsc[i];
>>> +             u32 base = ope_ds_base[i];
>>> +             u32 cfg = 0;
>>> +
>>> +             if (dsc->input_width != dsc->output_width) {
>>> +                     dsc->phase_step_h |= DS_RESOLUTION(dsc->input_width,
>>> +                                                        dsc->output_width) << 30;
>>> +                     cfg |= OPE_PP_CLC_DOWNSCALE_MN_DS_CFG_H_SCALE_EN;
>>> +             }
>>> +
>>> +             if (dsc->input_height != dsc->output_height) {
>>> +                     dsc->phase_step_v |= DS_RESOLUTION(dsc->input_height,
>>> +                                                        dsc->output_height) << 30;
>>> +                     cfg |= OPE_PP_CLC_DOWNSCALE_MN_DS_CFG_V_SCALE_EN;
>>> +             }
>>> +
>>> +             ope_write_pp(ope, OPE_PP_CLC_DOWNSCALE_MN_DS_CFG(base), cfg);
>>> +             ope_write_pp(ope, OPE_PP_CLC_DOWNSCALE_MN_DS_IMAGE_SIZE_CFG(base),
>>> +                          ((dsc->input_width - 1) << 16) + dsc->input_height - 1);
>>> +             ope_write_pp(ope, OPE_PP_CLC_DOWNSCALE_MN_DS_MN_H_CFG(base), dsc->phase_step_h);
>>> +             ope_write_pp(ope, OPE_PP_CLC_DOWNSCALE_MN_DS_MN_V_CFG(base), dsc->phase_step_v);
>>> +             ope_write_pp(ope, OPE_PP_CLC_DOWNSCALE_MN_CFG(base),
>>> +                          cfg ? OPE_PP_CLC_DOWNSCALE_MN_CFG_EN : 0);
>>> +     }
>>> +}
>> So - this is where the CDM should be used - so that you don't have to do
>> all of these MMIO writes inside of your ISR.
> Indeed, and that also the reason stripes are computed ahead of time,
> so that they can be further 'queued' in a CDM.
> 
>> Is that and additional step after the RFC ?
> The current implementation (without CDM) already provides good results
> and performance, so CDM can be viewed as a future enhancement.

That's true but then the number of MMIO writes per ISR is pretty small 
right now. You have about 50 writes here.

> As far as I understand, CDM could also be implemented in a generic way
> within CAMSS, since other CAMSS blocks make use of CDM as well.
> This is something we should discuss further.
My concern is even conservatively if each module adds another 10 ? 
writes by the time we get to denoising, sharpening, lens shade 
correction, those writes could easily look more like 100.

What user-space should submit is well documented data-structures which 
then get translated into CDM buffers by the OPE and IFE for the various 
bits of the pipeline.

---
bod

