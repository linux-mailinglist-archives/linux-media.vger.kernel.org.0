Return-Path: <linux-media+bounces-56890-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6KOAAjW6wmlilAQAu9opvQ
	(envelope-from <linux-media+bounces-56890-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 17:22:13 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9332E318EBE
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 17:22:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 45AA33100693
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 16:14:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8787037B400;
	Tue, 24 Mar 2026 16:14:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9985A389DF0
	for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 16:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774368846; cv=none; b=nL5qpc0qFeDuf7WaN/E8WFkqEJN3RbEXqGJPJITRSIL1oxqDXvLNcPZ/RXoQ8HpLoRRVFPJs8sJhKiySA1l6YUZQ11CYJNXAsWIiNCAQDy6Rwf4/zT7lvHQ+hE1WH7Sycdky2twEV8lbfQJaGJuTCQz7npCXeHCUwVxSd4mPtgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774368846; c=relaxed/simple;
	bh=7AKvBSytO+0EDPLcfR7qFItoRg+qDA1zFe9xFObUDBw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dLwszqW2uq0hUvLVTpeQT58stDRX90zNTIob1lqMNZ6SNMcRkAB0KZJ3C5x81H8oa+hPNLqynU9sn74Iz0p/WM7NHD2PCteU8fTXhI0AZGQquM1bD1Nryse8eaWMbJKmANJVbo8q+ocSiQca4CLqaVu2MfN0jCiDevm6JJkAgNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1w54OA-0004bA-PA; Tue, 24 Mar 2026 17:13:54 +0100
Message-ID: <8af3e277-a901-4b31-9729-032df3c0d56c@pengutronix.de>
Date: Tue, 24 Mar 2026 17:13:51 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/27] media: rockchip: rga: avoid odd frame sizes for
 YUV formats
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
 Jacob Chen <jacob-chen@iotwrt.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, kernel@pengutronix.de
References: <20260127-spu-rga3-v3-0-77b273067beb@pengutronix.de>
 <20260127-spu-rga3-v3-11-77b273067beb@pengutronix.de>
 <c154098ce7fd5d6bfcb44066b7c1f0cde07ff81d.camel@ndufresne.ca>
Content-Language: en-US
From: =?UTF-8?Q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
In-Reply-To: <c154098ce7fd5d6bfcb44066b7c1f0cde07ff81d.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56890-lists,linux-media=lfdr.de];
	DMARC_NA(0.00)[pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[s.pueschel@pengutronix.de,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,codeberg.org:url]
X-Rspamd-Queue-Id: 9332E318EBE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Nicolas,

On 3/20/26 6:47 PM, Nicolas Dufresne wrote:
> Le mardi 27 janvier 2026 à 15:39 +0100, Sven Püschel a écrit :
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
>> index 21a3c6cd38dbc..4fa6adb10b7ee 100644
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
> For V4L2_PIX_FMT_YUV422P and NV16 this is 2/1. I believe you can generalize this
> with the format info, and skip this conditions:
>
> 		.step_with = info->vdiv,
> 		.step_height = info->hdiv
>
> Though, I'm saying that from a pixel format perspective, if the HW needs 2/2 for
> all YUV formats, let me know, I'll give my Rb.

I've introduced this limitation after running into the 129x129 hang and 
noticing that the librga just disallowed it. I've did a quick test with 
128x129 RK_FORMAT_YCbCr_422_SP (NV16) and the librga also doesn't allow it:

rga_api version 1.10.1_[4]
[  303.177480] rga: 1807   1807  : [tgid:1807] Destroy handle[1] when 
the user exits
101, check error! Invalid parameters: src, Error yuv not align to 2, 
rect[x,y,w,h] = [0, 0, 128, 129], wstride = 128, hstride = 129, format = 
0x800(cbcr422sp)

The librga docs [1] also indicate that for all YUV formats on all RGA 
versions the "height stride must be 2-aligned" (based on the librga 
error output "height stride" probably means "height in pixels"). 
Therefore I've copied this requirement globally into the driver to avoid 
potential problems (e.g. hangs or using memory outside of the actual image).

Sincerely
     Sven

[1] 
https://codeberg.org/airockchip/librga/src/branch/main/docs/Rockchip_Developer_Guide_RGA_EN.md#image-format-alignment-instructions

> Nicolas
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

