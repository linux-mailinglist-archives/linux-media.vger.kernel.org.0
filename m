Return-Path: <linux-media+bounces-60269-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2H1wFi93+GlavgIAu9opvQ
	(envelope-from <linux-media+bounces-60269-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 12:38:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9423F4BBD72
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 12:38:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 89AA9306FC23
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2026 10:26:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5756139A7E1;
	Mon,  4 May 2026 10:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="m+ahxMvQ"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119F537703B;
	Mon,  4 May 2026 10:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777890358; cv=none; b=GbPsQf+MFz8i0NZiSKfdtnMYB6ldrPSU+YI3ag4VZHb89flAoU+9yacNO1YnXP9MZ7oz4+61B7/LOzYdPO1XMjZmhAXCtdTePld3Jd+7sv0IlhWNNnCuQ82KVjj8muVVUnpeXG3uIYfsroExdjRdB85uvljepO83gbAKWRBdqhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777890358; c=relaxed/simple;
	bh=fjaSYhZE4oRr9d4UaGHL4ThyVOGWeqOjO28JE4crRLo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZUHHrjeOZcsOtbwqGJ8B5ADV2An8xrS3BMLcGSBYxxcGMYgvw06gRW8qDRln6t3v17/i1vWZbzMTcoyMdqXdDwKxa1JJivysExLWpwThRsIxSPqsH+ocv9T9RI3OfPhTbCPQqpZ+GQOeHHc1PCq5QY9ouXfh/ubQQPk3sm0mxdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=m+ahxMvQ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777890355;
	bh=fjaSYhZE4oRr9d4UaGHL4ThyVOGWeqOjO28JE4crRLo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=m+ahxMvQWuVt3kHngI21TEZjivfCGliowz1eIGVTxtsJJvR/gc7NVYlM35vbMI8Bx
	 i+7JQuNoOnD78k61oLohXy7UIqvuTvbRxbW1QHKORRwOmNf/XJyLP4azeZ6ObLXWFo
	 ekujQFqDnhQwKhUSxOTlI/FuS0mcpLr+ySOYAQPCX8Let6t4Qkmnc5c55bM1q3zs+y
	 qhxtZwdqqapMWvnSFSkZcZKAOLCZLZtBOHGnOiBbgEzTdVh6IaixVqoTlz6637GWzj
	 cz64JExVd2/4RMr13BWiHXo+AbAA9nWfEUA3JnVYdzmF/DAWxahrAULEeuy2DF/W9s
	 GXw81I9KOEP4w==
Received: from [100.64.1.43] (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CD2E217E12EB;
	Mon,  4 May 2026 12:25:54 +0200 (CEST)
Message-ID: <da591ba8-9563-4e89-88c2-bf18d41d1bee@collabora.com>
Date: Mon, 4 May 2026 12:25:54 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] media: verisilicon: Create AV1 helper library
To: Hans Verkuil <hverkuil+cisco@kernel.org>, nicolas.dufresne@collabora.com,
 p.zabel@pengutronix.de, mchehab@kernel.org, heiko@sntech.de
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com
References: <20260415073801.58369-1-benjamin.gaignard@collabora.com>
 <8f29d271-da7d-4456-9427-2fb66136747a@kernel.org>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <8f29d271-da7d-4456-9427-2fb66136747a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 9423F4BBD72
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [8.84 / 15.00];
	URIBL_BLACK(7.50)[aomediacodec.github.io:url];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60269-lists,linux-media=lfdr.de];
	R_DKIM_ALLOW(0.00)[collabora.com:s=mail];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[collabora.com,none];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,body];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.504];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[benjamin.gaignard@collabora.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c0a:e001:db::/64:c];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,collabora.com:dkim,collabora.com:mid,aomediacodec.github.io:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Spam: Yes


Le 04/05/2026 à 09:20, Hans Verkuil a écrit :
> Hi Benjamin,
>
> I have a few comments about this:
>
> On 15/04/2026 09:38, Benjamin Gaignard wrote:
>> Regroup all none hardware related AV1 functions into a helper library.
>> The goal is to avoid code duplication for futur AV1 codecs.
> futur -> future
>
>> Tested on rock 5b board Fluster score remains the same 204/241.
>>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>> ---
>> changes in version 3:
>>   - Remove useless wrapper functions.
>>
>>   drivers/media/platform/verisilicon/Makefile   |   7 +-
>>   .../media/platform/verisilicon/hantro_av1.c   | 780 +++++++++++++++
>>   .../media/platform/verisilicon/hantro_av1.h   |  62 ++
>>   ...entropymode.c => hantro_av1_entropymode.c} |  18 +-
>>   ...entropymode.h => hantro_av1_entropymode.h} |  18 +-
>>   ...av1_filmgrain.c => hantro_av1_filmgrain.c} |  82 +-
>>   .../verisilicon/hantro_av1_filmgrain.h        |  44 +
>>   .../media/platform/verisilicon/hantro_hw.h    |   7 +-
>>   .../verisilicon/rockchip_av1_filmgrain.h      |  36 -
>>   .../verisilicon/rockchip_vpu981_hw_av1_dec.c  | 935 ++----------------
>>   .../platform/verisilicon/rockchip_vpu_hw.c    |   7 +-
>>   11 files changed, 1041 insertions(+), 955 deletions(-)
>>   create mode 100644 drivers/media/platform/verisilicon/hantro_av1.c
>>   create mode 100644 drivers/media/platform/verisilicon/hantro_av1.h
>>   rename drivers/media/platform/verisilicon/{rockchip_av1_entropymode.c => hantro_av1_entropymode.c} (99%)
>>   rename drivers/media/platform/verisilicon/{rockchip_av1_entropymode.h => hantro_av1_entropymode.h} (95%)
>>   rename drivers/media/platform/verisilicon/{rockchip_av1_filmgrain.c => hantro_av1_filmgrain.c} (92%)
>>   create mode 100644 drivers/media/platform/verisilicon/hantro_av1_filmgrain.h
>>   delete mode 100644 drivers/media/platform/verisilicon/rockchip_av1_filmgrain.h
>>
> <snip>
>
>> diff --git a/drivers/media/platform/verisilicon/hantro_av1.c b/drivers/media/platform/verisilicon/hantro_av1.c
>> new file mode 100644
>> index 000000000000..5a51ac877c9c
>> --- /dev/null
>> +++ b/drivers/media/platform/verisilicon/hantro_av1.c
>> @@ -0,0 +1,780 @@
> <snip>
>
>> +
>> +int hantro_av1_tile_log2(int target)
>> +{
>> +	int k;
>> +
>> +	/*
>> +	 * returns the smallest value for k such that 1 << k is greater
>> +	 * than or equal to target
>> +	 */
>> +	for (k = 0; (1 << k) < target; k++);
> Checkpatch gives:
>
> ERROR: trailing statements should be on next line
> #637: FILE: drivers/media/platform/verisilicon/hantro_av1.c:568:
> +       for (k = 0; (1 << k) < target; k++);
>
> Just move the ';' to the next line.

OK I will do that.

>
>> +
>> +	return k;
>> +}
>> +
> <snip>
>
>> diff --git a/drivers/media/platform/verisilicon/hantro_av1_filmgrain.h b/drivers/media/platform/verisilicon/hantro_av1_filmgrain.h
>> new file mode 100644
>> index 000000000000..5593e84114d0
>> --- /dev/null
>> +++ b/drivers/media/platform/verisilicon/hantro_av1_filmgrain.h
>> @@ -0,0 +1,44 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +
>> +#ifndef _HANTRO_AV1_FILMGRAIN_H_
>> +#define _HANTRO_AV1_FILMGRAIN_H_
>> +
>> +#include <linux/types.h>
>> +
>> +struct hantro_av1_film_grain {
>> +	u8 scaling_lut_y[256];
>> +	u8 scaling_lut_cb[256];
>> +	u8 scaling_lut_cr[256];
>> +	s16 cropped_luma_grain_block[4096];
>> +	s16 cropped_chroma_grain_block[1024 * 2];
>> +};
> This struct is not used in hantro_av1_filmgrain.c/h.
>
> Does this belong here?

The same structure can used for future Verisilicon hardware block so I would prefer to
keep it here.

>
>> +
>> +void hantro_av1_generate_luma_grain_block(s32 (*luma_grain_block)[73][82],
>> +					  s32 bitdepth,
>> +					  u8 num_y_points,
>> +					  s32 grain_scale_shift,
>> +					  s32 ar_coeff_lag,
>> +					  s32 (*ar_coeffs_y)[24],
>> +					  s32 ar_coeff_shift,
>> +					  s32 grain_min,
>> +					  s32 grain_max,
>> +					  u16 random_seed);
>> +
>> +void hantro_av1_generate_chroma_grain_block(s32 (*luma_grain_block)[73][82],
>> +					    s32 (*cb_grain_block)[38][44],
>> +					    s32 (*cr_grain_block)[38][44],
>> +					    s32 bitdepth,
>> +					    u8 num_y_points,
>> +					    u8 num_cb_points,
>> +					    u8 num_cr_points,
>> +					    s32 grain_scale_shift,
>> +					    s32 ar_coeff_lag,
>> +					    s32 (*ar_coeffs_cb)[25],
>> +					    s32 (*ar_coeffs_cr)[25],
>> +					    s32 ar_coeff_shift,
>> +					    s32 grain_min,
>> +					    s32 grain_max,
>> +					    u8 chroma_scaling_from_luma,
>> +					    u16 random_seed);
>> +
> I get a lot of checkpatch warnings of this type:
>
> WARNING: function definition argument 's32' should also have an identifier name
> #1205: FILE: drivers/media/platform/verisilicon/hantro_av1_filmgrain.h:16:
> +void hantro_av1_generate_luma_grain_block(s32 (*luma_grain_block)[73][82],
> Looking at how it is used in rockchip_vpu981_av1_dec_set_fgs() I think this
> can be done a lot easier if you add a new struct here containing those
> arrays. E.g.:
>
> struct hantro_av1_coeffs_grain_block {
>          s32 ar_coeffs_y[24];
>          s32 ar_coeffs_cb[25];
>          s32 ar_coeffs_cr[25];
>          s32 luma_grain_block[73][82];
>          s32 cb_grain_block[38][44];
>          s32 cr_grain_block[38][44];
> };
>
> Then in rockchip_vpu981_av1_dec_set_fgs you can just kzalloc that struct
> and pass it to these filmgrain functions.

I will do that.

>
> Also consider using #defines for the array sizes.

Chapter "7.18.3.3. Generate grain process" of AV1 spec doesn't define/name
these values so keep them like this make the code more easy to review with
the spec.

https://aomediacodec.github.io/av1-spec/#generate-grain-process

That said I'm always for naming values so good suggestion are welcome.

Thanks,
Benjamin

>
> If you decide not to use a struct, then you can at least change simply use
> 's32 luma_grain_block[73][82]' as arguments to these helper functions. There
> is no need to complicate the function prototypes.
>
> But I think creating a struct is a cleaner approach.
>
> Regards,
>
> 	Hans
>

