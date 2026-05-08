Return-Path: <linux-media+bounces-60906-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNjNEXer/WlOhgAAu9opvQ
	(envelope-from <linux-media+bounces-60906-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 11:23:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C602E4F433E
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 11:23:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DC3F13049292
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2026 09:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2D80390230;
	Fri,  8 May 2026 09:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wur1K3h5"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145DB35CB87;
	Fri,  8 May 2026 09:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778231965; cv=none; b=gFwGWVu8js/jpcxj/HOvEsioIz1SNeI2LrC9TS11lDn2kw/i0PyNUy49J+KFc4zLYO0MGndmzLq9ShLu+IkRJ9emiMo5r8bG67hyDhBNFl+fv8/zgTnnMuT5HKoRU0j9tygQJU4yUouI/bbrOzNoPv2ZAF0zxFQFQ+Ne9P4N9R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778231965; c=relaxed/simple;
	bh=CDOYZldxweR+3QhtIXhYzYkx634ZtPQBXyhNM5n0ctw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uG6aOynApHcs3/uQ8hmTGF0Le8Je5Q8eKVkuWnGIofE7q/YIVIKYwShGhsU1qeLIsJQmjjlr3mNyvCdR7cuWb5jqVbSTUsjpdBos0K9FxxNCd8gkLqNul6N9IRJDsSdx1l8INSzpEZ82Sj1Ny0YkT9h/arnTcEUzewnI94ShAOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wur1K3h5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC523C2BCB0;
	Fri,  8 May 2026 09:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778231964;
	bh=CDOYZldxweR+3QhtIXhYzYkx634ZtPQBXyhNM5n0ctw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Wur1K3h5D4ISzBp5rj0gk1FHf4DIQFw8C+yskYV6ZzfeYjPGETcbQhBcKuHlvNNxu
	 jKUUU5l7w0qn6/Au2wUugWCdb5YkTLXj/Wv2dxgcB2AlgEckjH7YNxT523rWRuOW4b
	 I2NU9cpC5w1U265TSyMkAxmqfC3ZQx0u3+lsn/Vbiac19ZyNMdw3U6vOLPWbxrUI8b
	 Srgs5e/QKue9sLoEeYysBBrOnjzIOSF/hgoNT22f99st3pOWBIaVcTrSD/c+lVpY9Z
	 T3dIsGhZYednZHrnvm3txxEFzaYgLxUnmqqMBGys/txDnNpo8oCxBhlAvj8lRLcmpz
	 ilqktPfe98vEw==
Message-ID: <c6e3237e-7752-4768-9cdf-3f3e89c1b98c@kernel.org>
Date: Fri, 8 May 2026 10:19:18 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/15] media: uapi: Add CAMSS ISP configuration
 definition
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 kieran.bingham@ideasonboard.com, johannes.goede@oss.qualcomm.com
References: <20260508-camss-isp-ope-v3-0-bb1055274603@oss.qualcomm.com>
 <_M7wAThdPN69377jGZSjtTkw52TQVFLRr2noYJinHH3dhvPAQhP_1OfeGBltDz3bYydN737y5AbI7GBdn-qh9w==@protonmail.internalid>
 <20260508-camss-isp-ope-v3-12-bb1055274603@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <20260508-camss-isp-ope-v3-12-bb1055274603@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: C602E4F433E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60906-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Action: no action

On 07/05/2026 23:49, Loic Poulain wrote:
> Add the uapi header camss-config.h defining the ISP parameter
> structures used by the CAMSS Offline Processing Engine (OPE) driver.
> This includes structures for white balance, chroma enhancement and
> color correction configuration.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>   include/uapi/linux/camss-config.h | 115 ++++++++++++++++++++++++++++++++++++++
>   1 file changed, 115 insertions(+)
> 
> diff --git a/include/uapi/linux/camss-config.h b/include/uapi/linux/camss-config.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..665406969e66927e8bce83afaa9a3aae53ba2803
> --- /dev/null
> +++ b/include/uapi/linux/camss-config.h
> @@ -0,0 +1,115 @@
> +/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
> +/*
> + * Qualcomm CAMSS ISP parameters UAPI
> + *
> + * Uses the generic V4L2 extensible ISP parameters buffer format defined in
> + * <uapi/linux/media/v4l2-isp.h>.
> + *
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef _UAPI_LINUX_CAMSS_CONFIG_H
> +#define _UAPI_LINUX_CAMSS_CONFIG_H
> +
> +#include <linux/types.h>
> +#include <linux/media/v4l2-isp.h>
> +/**
> + * enum camss_params_block_type - CAMSS ISP parameter block identifiers
> + *
> + * Each value identifies one ISP processing block.  The value is placed in
> + * the @type field of &struct v4l2_isp_params_block_header.
> + */
> +enum camss_params_block_type {
> +	CAMSS_PARAMS_WB_GAIN = 1,
> +	CAMSS_PARAMS_CHROMA_ENHAN = 2,
> +	CAMSS_PARAMS_COLOR_CORRECT = 3,
> +	CAMSS_PARAMS_MAX,
> +};
> +
> +/**
> + * struct camss_params_wb_gain - White Balance gains
> + *
> + * @header:   generic block header; @header.type = CAMSS_PARAMS_WB_GAIN
> + * @g_gain:   green channel gain (15uQ10)
> + * @b_gain:   blue channel gain (15uQ10)
> + * @r_gain:   red channel gain (15uQ10)
> + */
> +struct camss_params_wb_gain {
> +	struct v4l2_isp_params_block_header header;
> +	__u16 g_gain;
> +	__u16 b_gain;
> +	__u16 r_gain;
> +	__u16 _pad;
> +} __aligned(8);
> +
> +/**
> + * struct camss_params_chroma_enhan - RGB to YUV colour matrix
> + *
> + * Implements the CLC_CHROMA_ENHAN pipeline module. All coefficients are
> + * signed 12-bit fixed-point Q3.8 (range roughly -8.0 to +7.996).
> + *
> + * Luma (Y) row of the matrix:
> + * @luma_v0:  R-to-Y coefficient (12sQ8, e.g. 0x04d = 0.299)
> + * @luma_v1:  G-to-Y coefficient (12sQ8, e.g. 0x096 = 0.587)
> + * @luma_v2:  B-to-Y coefficient (12sQ8, e.g. 0x01d = 0.114)
> + * @luma_k:   Y output offset    (9s,  0 = no offset)
> + *
> + * Chroma (Cb) row:
> + * @coeff_ap: Cb positive coefficient (12sQ8, e.g. 0x0e6 =  0.886)
> + * @coeff_am: Cb negative coefficient (12sQ8, e.g. 0xfb3 = -0.338)
> + * @kcb:      Cb output offset        (11s,   128 = +128)
> + *
> + * Chroma (Cr) row:
> + * @coeff_cp: Cr positive coefficient (12sQ8, e.g. 0x0b3 =  0.701)
> + * @coeff_cm: Cr negative coefficient (12sQ8, e.g. 0xfe3 = -0.114)
> + * @coeff_dp: Cr positive coefficient (12sQ8)
> + * @coeff_dm: Cr negative coefficient (12sQ8)
> + * @kcr:      Cr output offset        (11s,   128 = +128)
> + *
> + * @header: generic block header; @header.type = CAMSS_PARAMS_CHROMA_ENHAN
> + */
> +struct camss_params_chroma_enhan {
> +	struct v4l2_isp_params_block_header header;
> +	__u16 luma_v0;
> +	__u16 luma_v1;
> +	__u16 luma_v2;
> +	__u16 luma_k;
> +	__u16 coeff_ap;
> +	__u16 coeff_am;
> +	__u16 coeff_cp;
> +	__u16 coeff_cm;
> +	__u16 coeff_dp;
> +	__u16 coeff_dm;
> +	__u16 kcb;
> +	__u16 kcr;
> +} __aligned(8);
> +
> +/**
> + * struct camss_params_color_correct - colour correction matrix
> + *
> + * signed 12-bit fixed-point (Qm)
> + *
> + * Out_ch0 (g) = A0*G+B0*B+C0*R + K0
> + * Out_ch1 (b) = A1*G+B1*B+C1*R + K1
> + * Out_ch2 (r) = A2*G+B2*B+C2*R + K2
> + *
> + * m = 0x0 - Coefficients are signed 12sQ7 numbers
> + * m = 0x1 - Coefficients are signed 12sQ8 numbers
> + * m = 0x2 - Coefficients are signed 12sQ9 numbers
> + * m = 0x3 - Coefficients are signed 12sQ10 numbers
> + */
> +struct camss_params_color_correct {
> +	struct v4l2_isp_params_block_header header;
> +	__u16 a[3];
> +	__u16 b[3];
> +	__u16 c[3];
> +	__u16 k[3];
> +	__u16 m;
> +} __aligned(8);
> +
> +#define CAMSS_PARAMS_MAX_PAYLOAD		\
> +	(sizeof(struct camss_params_wb_gain)	+\
> +	 sizeof(struct camss_params_chroma_enhan)	+\
> +	 sizeof(struct camss_params_color_correct))
> +
> +#endif /* _UAPI_LINUX_CAMSS_CONFIG_H */
> 
> --
> 2.34.1
> 

I think this should instead be the comprehensive list from HFI I 
published recently.

There's no point in circumscribing it and HFI is way more widely 
available than OPE - so if there are adaptations to be done it should be 
on the OPE side not the HFI/IPE side.

---
bod

