Return-Path: <linux-media+bounces-60245-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +InOHehI+Gn+sAIAu9opvQ
	(envelope-from <linux-media+bounces-60245-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 09:21:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5864B9424
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 09:21:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 112E9300F50F
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2026 07:21:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DE722DCF45;
	Mon,  4 May 2026 07:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P10dqKw8"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868C8283FCF;
	Mon,  4 May 2026 07:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777879263; cv=none; b=LwTyBDZ6VV+otq0JduE/6nVmjij8W/R4u3xpo0VG2EQ2XIqZnzm3DS828sxGzacbuVntLpPAr2aSZdKCgYtE45EDI+5LLpSWdL8QoHGbFJAwD5XfSQoNthryqE8wqaCFWbMz1tCIh11GERrXThYI3iaY2dZa5hOHiPFUZnROCxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777879263; c=relaxed/simple;
	bh=oxZ5xE3hnOgV2qemIIXx4AHL9CvGZqqSqt4lMVdq0y8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=rGBtFqHG5YB5GK20Sxyfb9D6uN50KkIZH/a5CxrtkUOYhQU+yJ7eAmJOFALYru7vPtRlKHUFAvhL0CXx0imcwU0vfXKyotgi1R7C7sKX1J8fL7sR/1lKUfdHsXGoTyGm74UhBPBSkvsYEFWLsUdBfhHPJOp/uDGcH7HCMFFzPk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P10dqKw8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58871C2BCB8;
	Mon,  4 May 2026 07:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777879263;
	bh=oxZ5xE3hnOgV2qemIIXx4AHL9CvGZqqSqt4lMVdq0y8=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=P10dqKw85reUAS1+Xv6AphOAZ00jnttdCHGWLwTwEXxrIagE996uCJt/e7Ji0M9Gt
	 OQHzuzJgj4cyJqSgq0LZL/XDvo9ISxzU50XqNx7eGZcvCrz0fxa0rDBDPLslIP/GRx
	 eL9CGoBDCj2G9mownmCyJD/pUrdqfH3Vm0h4wujnUN2JQkkdE69flxZ0znMoUQF1Cd
	 YfCEyQHt+pvjJtExrKl1Sixzd5wGRLrsKgxG5SQfVgXllwzi5wjrs3P+pByqs96HL/
	 yaw+yY1LEfb3GYpblavn1f9PqLH7rbA9Ts/TJZ/TfN9xcSefVd4vXlxonbpT3+7zQa
	 Uj5SJdioX08Fg==
Message-ID: <8f29d271-da7d-4456-9427-2fb66136747a@kernel.org>
Date: Mon, 4 May 2026 09:20:59 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v3] media: verisilicon: Create AV1 helper library
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 nicolas.dufresne@collabora.com, p.zabel@pengutronix.de, mchehab@kernel.org,
 heiko@sntech.de
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com
References: <20260415073801.58369-1-benjamin.gaignard@collabora.com>
Content-Language: en-US, nl
In-Reply-To: <20260415073801.58369-1-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: CD5864B9424
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-60245-lists,linux-media=lfdr.de,cisco];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[]

Hi Benjamin,

I have a few comments about this:

On 15/04/2026 09:38, Benjamin Gaignard wrote:
> Regroup all none hardware related AV1 functions into a helper library.
> The goal is to avoid code duplication for futur AV1 codecs.

futur -> future

> 
> Tested on rock 5b board Fluster score remains the same 204/241.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> ---
> changes in version 3:
>  - Remove useless wrapper functions.
> 
>  drivers/media/platform/verisilicon/Makefile   |   7 +-
>  .../media/platform/verisilicon/hantro_av1.c   | 780 +++++++++++++++
>  .../media/platform/verisilicon/hantro_av1.h   |  62 ++
>  ...entropymode.c => hantro_av1_entropymode.c} |  18 +-
>  ...entropymode.h => hantro_av1_entropymode.h} |  18 +-
>  ...av1_filmgrain.c => hantro_av1_filmgrain.c} |  82 +-
>  .../verisilicon/hantro_av1_filmgrain.h        |  44 +
>  .../media/platform/verisilicon/hantro_hw.h    |   7 +-
>  .../verisilicon/rockchip_av1_filmgrain.h      |  36 -
>  .../verisilicon/rockchip_vpu981_hw_av1_dec.c  | 935 ++----------------
>  .../platform/verisilicon/rockchip_vpu_hw.c    |   7 +-
>  11 files changed, 1041 insertions(+), 955 deletions(-)
>  create mode 100644 drivers/media/platform/verisilicon/hantro_av1.c
>  create mode 100644 drivers/media/platform/verisilicon/hantro_av1.h
>  rename drivers/media/platform/verisilicon/{rockchip_av1_entropymode.c => hantro_av1_entropymode.c} (99%)
>  rename drivers/media/platform/verisilicon/{rockchip_av1_entropymode.h => hantro_av1_entropymode.h} (95%)
>  rename drivers/media/platform/verisilicon/{rockchip_av1_filmgrain.c => hantro_av1_filmgrain.c} (92%)
>  create mode 100644 drivers/media/platform/verisilicon/hantro_av1_filmgrain.h
>  delete mode 100644 drivers/media/platform/verisilicon/rockchip_av1_filmgrain.h
> 

<snip>

> diff --git a/drivers/media/platform/verisilicon/hantro_av1.c b/drivers/media/platform/verisilicon/hantro_av1.c
> new file mode 100644
> index 000000000000..5a51ac877c9c
> --- /dev/null
> +++ b/drivers/media/platform/verisilicon/hantro_av1.c
> @@ -0,0 +1,780 @@

<snip>

> +
> +int hantro_av1_tile_log2(int target)
> +{
> +	int k;
> +
> +	/*
> +	 * returns the smallest value for k such that 1 << k is greater
> +	 * than or equal to target
> +	 */
> +	for (k = 0; (1 << k) < target; k++);

Checkpatch gives:

ERROR: trailing statements should be on next line
#637: FILE: drivers/media/platform/verisilicon/hantro_av1.c:568:
+       for (k = 0; (1 << k) < target; k++);

Just move the ';' to the next line.

> +
> +	return k;
> +}
> +

<snip>

> diff --git a/drivers/media/platform/verisilicon/hantro_av1_filmgrain.h b/drivers/media/platform/verisilicon/hantro_av1_filmgrain.h
> new file mode 100644
> index 000000000000..5593e84114d0
> --- /dev/null
> +++ b/drivers/media/platform/verisilicon/hantro_av1_filmgrain.h
> @@ -0,0 +1,44 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef _HANTRO_AV1_FILMGRAIN_H_
> +#define _HANTRO_AV1_FILMGRAIN_H_
> +
> +#include <linux/types.h>
> +
> +struct hantro_av1_film_grain {
> +	u8 scaling_lut_y[256];
> +	u8 scaling_lut_cb[256];
> +	u8 scaling_lut_cr[256];
> +	s16 cropped_luma_grain_block[4096];
> +	s16 cropped_chroma_grain_block[1024 * 2];
> +};

This struct is not used in hantro_av1_filmgrain.c/h.

Does this belong here?

> +
> +void hantro_av1_generate_luma_grain_block(s32 (*luma_grain_block)[73][82],
> +					  s32 bitdepth,
> +					  u8 num_y_points,
> +					  s32 grain_scale_shift,
> +					  s32 ar_coeff_lag,
> +					  s32 (*ar_coeffs_y)[24],
> +					  s32 ar_coeff_shift,
> +					  s32 grain_min,
> +					  s32 grain_max,
> +					  u16 random_seed);
> +
> +void hantro_av1_generate_chroma_grain_block(s32 (*luma_grain_block)[73][82],
> +					    s32 (*cb_grain_block)[38][44],
> +					    s32 (*cr_grain_block)[38][44],
> +					    s32 bitdepth,
> +					    u8 num_y_points,
> +					    u8 num_cb_points,
> +					    u8 num_cr_points,
> +					    s32 grain_scale_shift,
> +					    s32 ar_coeff_lag,
> +					    s32 (*ar_coeffs_cb)[25],
> +					    s32 (*ar_coeffs_cr)[25],
> +					    s32 ar_coeff_shift,
> +					    s32 grain_min,
> +					    s32 grain_max,
> +					    u8 chroma_scaling_from_luma,
> +					    u16 random_seed);
> +

I get a lot of checkpatch warnings of this type:

WARNING: function definition argument 's32' should also have an identifier name
#1205: FILE: drivers/media/platform/verisilicon/hantro_av1_filmgrain.h:16:
+void hantro_av1_generate_luma_grain_block(s32 (*luma_grain_block)[73][82],
Looking at how it is used in rockchip_vpu981_av1_dec_set_fgs() I think this
can be done a lot easier if you add a new struct here containing those
arrays. E.g.:

struct hantro_av1_coeffs_grain_block {
        s32 ar_coeffs_y[24];
        s32 ar_coeffs_cb[25];
        s32 ar_coeffs_cr[25];
        s32 luma_grain_block[73][82];
        s32 cb_grain_block[38][44];
        s32 cr_grain_block[38][44];
};

Then in rockchip_vpu981_av1_dec_set_fgs you can just kzalloc that struct
and pass it to these filmgrain functions.

Also consider using #defines for the array sizes.

If you decide not to use a struct, then you can at least change simply use
's32 luma_grain_block[73][82]' as arguments to these helper functions. There
is no need to complicate the function prototypes.

But I think creating a struct is a cleaner approach.

Regards,

	Hans

