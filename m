Return-Path: <linux-media+bounces-61276-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKTWL/RAA2ro2AEAu9opvQ
	(envelope-from <linux-media+bounces-61276-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 17:02:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD285232CA
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 17:02:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 99B9F3095D22
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 14:57:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CCC736A372;
	Tue, 12 May 2026 14:57:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D7723F40D
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 14:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778597832; cv=none; b=H1QJDmvgIZrnWTr8ytiSngfgmlu6zDAMQi+sqMakhYK/C4K5LkMvipGUg0C0q9Uc1QN8g+Try+ueqQyuEWisO9qJlLxf/EUhjdhwYMEi1bNusVajU4u66lH3sWK39KzcQkZwNMmgEKnGlnZXj0F5wTeVFUyih64uVmR1OpG2rOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778597832; c=relaxed/simple;
	bh=rel5XJ2Mx5CknVpnsr9cWDTzti7f512B94lQWKFxJPI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nIXyEvj7Py2PggptoV25Mr5dB0X+0AXIN1ZEV3mNebzrZUR+Sn3XO0tT3/Ugy2g2ecgqyhc1WWw98N51eVOT6cKfT8NCwWasqF1RxJZLUsp3BpjkbPIrLlQMSLekwXbkoC5+66pYM25RQg4gGwvfdx1LTOkC3c0Pb8nk6xMe8iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=fail smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1wMoXZ-0006ha-1B; Tue, 12 May 2026 16:56:57 +0200
Message-ID: <e6d562e7-a9d2-4a1a-a139-c6e05eb4aaef@pengutronix.de>
Date: Tue, 12 May 2026 16:56:53 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/29] media: rockchip: rga: avoid odd frame sizes for
 YUV formats
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
 Jacob Chen <jacob-chen@iotwrt.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, kernel@pengutronix.de,
 sebastian.reichel@collabora.com
References: <20260428-spu-rga3-v5-0-eb7f5d019d86@pengutronix.de>
 <20260428-spu-rga3-v5-12-eb7f5d019d86@pengutronix.de>
 <4f5e481c8883b358ee4cef64f26f3f00f0ac7304.camel@ndufresne.ca>
Content-Language: en-US
From: =?UTF-8?Q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
In-Reply-To: <4f5e481c8883b358ee4cef64f26f3f00f0ac7304.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Rspamd-Queue-Id: 5BD285232CA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[pengutronix.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RSPAMD_URIBL_FAIL(0.00)[pengutronix.de:query timed out,collabora.com:query timed out];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61276-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RSPAMD_EMAILBL_FAIL(0.00)[nicolas.dufresne.collabora.com:query timed out,s.pueschel.pengutronix.de:query timed out];
	NEURAL_HAM(-0.00)[-0.972];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[s.pueschel@pengutronix.de,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,collabora.com:email]
X-Rspamd-Action: no action

Hi Nicolas,

On 5/8/26 11:18 PM, Nicolas Dufresne wrote:
> Le mardi 28 avril 2026 à 11:00 +0200, Sven Püschel a écrit :
>> Avoid odd frame sizes for YUV formats, as they may cause undefined
>> behavior. This is done in preparation for the RGA3, which hangs when the
>> output format is set to 129x129 pixel YUV420 SP (NV12).
>>
>> This requirement is documented explicitly for the RGA3 in  section 5.6.3
>> of the RK3588 TRM Part 2. For the RGA2 the RK3588 TRM Part 2
>> (section 6.1.2) and RK3568 TRM Part 2 (section 14.2) only mentions the
>> x/y offsets and stride aligning requirements. But the vendor driver for
>> the RGA2 also contains checks for the width and height to be aligned to
>> 2 bytes.
>>
>> Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
>> ---
>>   drivers/media/platform/rockchip/rga/rga.c | 19 ++++++++++++++-----
>>   1 file changed, 14 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
>> index f599c992829dd..77b8c7ab74274 100644
>> --- a/drivers/media/platform/rockchip/rga/rga.c
>> +++ b/drivers/media/platform/rockchip/rga/rga.c
>> @@ -337,6 +337,19 @@ static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
>>   	struct rga_ctx *ctx = file_to_rga_ctx(file);
>>   	const struct rga_hw *hw = ctx->rga->hw;
>>   	struct rga_fmt *fmt;
>> +	struct v4l2_frmsize_stepwise frmsize = {
>> +		.min_width = hw->min_width,
>> +		.max_width = hw->max_width,
>> +		.min_height = hw->min_height,
>> +		.max_height = hw->max_height,
>> +		.step_width = 1,
>> +		.step_height = 1,
>> +	};
>> +
>> +	if (v4l2_is_format_yuv(v4l2_format_info(pix_fmt->pixelformat))) {
>> +		frmsize.step_width = 2;
>> +		frmsize.step_height = 2;
> I think its fine like this, so let's start with:
>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>
> But it does not feel like a hardware alignment to me. When we process in
> software these things, the minimum alignment is bound to the subsampling, since
> there is no way to store half or quarter pixels, the padded width/height
> requires a step that follow the subsampling, something like:
>
> 		frmsize.step_width = finfo->hdiv;
> 		frmsize.step_height = finfo->vdiv;

I agree that this looks better. My main intention is to be more 
conservative, as the Rockchip related code/docs seem to always ensure a 
2 pixel alignment in both directions even for formats like YUV422, where 
we shouldn't have an alignment requirement in the height. Besides the 
vendor driver and TRM mentioned in the datasheet, the librga and it's 
docs also mention an alignment of 2 (pixels?!) for all YUV formats (see 
format alignment list in [1] and Q2.5 in [2]).

Given that the driver currently doesn't have any way to get the cores 
unstuck/reset in case of a hang, I'd like to play it more safely by 
adhering to what the vendor does instead of trying to do more and 
therefore allowing some potential breaking format. E.g. I've also 
experimented with sizes of 68x2, which the librga allows as input/output 
of the RGA3 (whereas the TRM specifies a min size of 128x128), but 
quickly dropped it as it produced some interesting broken outputs.

Sincerely
     Sven


[1] 
https://codeberg.org/airockchip/librga/src/branch/main/docs/Rockchip_Developer_Guide_RGA_EN.md#image-format-alignment-instructions

[2] 
https://codeberg.org/airockchip/librga/src/branch/main/docs/Rockchip_FAQ_RGA_EN.md

>
> Nicolas
>
>
>> +	}
>>   
>>   	if (V4L2_TYPE_IS_CAPTURE(f->type)) {
>>   		const struct rga_frame *frm;
>> @@ -358,11 +371,7 @@ static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
>>   	if (!fmt)
>>   		fmt = &hw->formats[0];
>>   
>> -	pix_fmt->width = clamp(pix_fmt->width,
>> -			       hw->min_width, hw->max_width);
>> -	pix_fmt->height = clamp(pix_fmt->height,
>> -				hw->min_height, hw->max_height);
>> -
>> +	v4l2_apply_frmsize_constraints(&pix_fmt->width, &pix_fmt->height, &frmsize);
>>   	v4l2_fill_pixfmt_mp(pix_fmt, fmt->fourcc, pix_fmt->width, pix_fmt->height);
>>   	pix_fmt->field = V4L2_FIELD_NONE;
>>   

