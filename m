Return-Path: <linux-media+bounces-48087-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CAE2C9BCE5
	for <lists+linux-media@lfdr.de>; Tue, 02 Dec 2025 15:37:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 383D03A4499
	for <lists+linux-media@lfdr.de>; Tue,  2 Dec 2025 14:37:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D418A238171;
	Tue,  2 Dec 2025 14:36:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9857D221F0A
	for <linux-media@vger.kernel.org>; Tue,  2 Dec 2025 14:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764686218; cv=none; b=qwOb1ZZCD9LeRty4cOvI0a/CJLuxwHUtZV31Wtu/hcho2f5nJHkEMFoTzVhZU8tGOOr8KL6qEbB9r2saVXbRx5jRvSqds2FlIviMFSFA1v2GUEIcWSitBc2k76mPB4WwdjCWHC6JaffCpbDJLq1frU4cZ2VhRQ0mX6bjlkSKuuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764686218; c=relaxed/simple;
	bh=+EeVH2acrEQebb7pmkKa4F50vfoIxeK7NnaPgJHaqgs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BsO/B1h38+sCkGLBZu3B4noUtWq/DEM0vvZhC+QH+K3ltyjyDhr1J6ZQA/RGvLU5pOcdi0WoCZkGIWlDl/JcSVKWvxUnb0RO9Kvoas1+MO8+oU+mcn5ei3fBwoT+8VLL12Dv6ykCbfe5Ahszqvou1slZhl1YMWjCjYzyuFj8RNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1vQRUa-0004ex-Pi; Tue, 02 Dec 2025 15:36:36 +0100
Message-ID: <2dc6c675-9c69-40a1-b2ed-ff1d22157228@pengutronix.de>
Date: Tue, 2 Dec 2025 15:36:33 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/16] media: rockchip: rga: align stride to 16 bytes
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
 Jacob Chen <jacob-chen@iotwrt.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
References: <20251007-spu-rga3-v1-0-36ad85570402@pengutronix.de>
 <20251007-spu-rga3-v1-3-36ad85570402@pengutronix.de>
 <db7030790063d0ebe6d254c7053e758184b9d7cc.camel@ndufresne.ca>
Content-Language: en-US
From: =?UTF-8?Q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
In-Reply-To: <db7030790063d0ebe6d254c7053e758184b9d7cc.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

Hi Nicolas,

On 10/7/25 8:19 PM, Nicolas Dufresne wrote:
> Hi,
>
>
> Le mardi 07 octobre 2025 à 10:31 +0200, Sven Püschel a écrit :
>> Align the stride to a multiple of 16 according to the RGA3 requirements
>> mentioned in the datasheet. This also ensures that the stride of the RGA2
>> is aligned to 4 bytes, as it needs to divide the value by 4 (one word)
>> before storing it in the register.
>>
>> Increasing the stride for the alignment also requires to increase the
>> sizeimage value. This is usually handled by v4l2_fill_pixfmt_mp, but
>> it doesn't allow to set a stride alignment. Therefore use the generated
>> values to calculate the total number of lines to properly update the
>> sizeimage value after the bytesperline has been aligned.
>>
>> Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
>> ---
>>   drivers/media/platform/rockchip/rga/rga.c | 21 +++++++++++++++++++++
>>   1 file changed, 21 insertions(+)
>>
>> diff --git a/drivers/media/platform/rockchip/rga/rga.c
>> b/drivers/media/platform/rockchip/rga/rga.c
>> index
>> 6438119a6c7aeff1e89e7aa95dcd5d2921fefa08..3cb7ce470c47e39d694e8176875a75fad271
>> 7f96 100644
>> --- a/drivers/media/platform/rockchip/rga/rga.c
>> +++ b/drivers/media/platform/rockchip/rga/rga.c
>> @@ -459,6 +459,25 @@ static int vidioc_enum_fmt(struct file *file, void *priv,
>> struct v4l2_fmtdesc *f
>>   	return 0;
>>   }
>>   
>> +static void align_pixfmt(struct v4l2_pix_format_mplane *pix_fmt)
>> +{
>> +	int lines;
>> +	struct v4l2_plane_pix_format *fmt;
>> +
>> +	/*
>> +	 * Align stride to 16 for the RGA3 (based on the datasheet)
>> +	 * To not dismiss the v4l2_fill_pixfmt_mp helper
>> +	 * (and manually write it again), we're approximating the new
>> sizeimage
>> +	 */
>> +	for (fmt = pix_fmt->plane_fmt;
>> +	     fmt < pix_fmt->plane_fmt + pix_fmt->num_planes;
>> +	     fmt++) {
>> +		lines = DIV_ROUND_UP(fmt->sizeimage, fmt->bytesperline);
>> +		fmt->bytesperline = (fmt->bytesperline + 0xf) & ~0xf;
>> +		fmt->sizeimage = fmt->bytesperline * lines;
> Instead of open coding this, describe this with struct v4l2_frmsize_stepwise and
> then use v4l2_apply_frmsize_constraints().
Looking into v4l2_frmsize_stepwise, it only applies to the width/height 
values, whereas I'm interested to control the stride 
byte-alignment/stepping (allowing free range widths/heights).

Do you intent that I (mis)use it like this: 
v4l2_apply_frmsize_constraints(&fmt->bytesperline, &lines, &constraints)  ?

This only replaces one of the three lines in the for loop (where i 
manually do the alignment with & ~0xf) and would also look odd, as i use 
a value in bytes as a width parameter (expected to be in pixels).

Technically the core problem is that the v4l2_fill_pixfmt_mp helper 
doesn't allow to specify a stride byte alignment and just aligns the 
stride based on the format requirements. Therefore I think that maybe 
creating a new v4l2_fill_pixfmt_mp_aligned helper would probably be the 
better solution to get the correct bytesperline value right from the 
start instead of adjusting it afterwards.

Sincerely
     Sven
>
> Nicolas
>
>> +	}
>> +}
>> +
>>   static int vidioc_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
>>   {
>>   	struct v4l2_pix_format_mplane *pix_fmt = &f->fmt.pix_mp;
>> @@ -474,6 +493,7 @@ static int vidioc_g_fmt(struct file *file, void *priv,
>> struct v4l2_format *f)
>>   		return PTR_ERR(frm);
>>   
>>   	v4l2_fill_pixfmt_mp(pix_fmt, frm->fmt->fourcc, frm->width, frm-
>>> height);
>> +	align_pixfmt(pix_fmt);
>>   
>>   	pix_fmt->field = V4L2_FIELD_NONE;
>>   	pix_fmt->colorspace = frm->colorspace;
>> @@ -496,6 +516,7 @@ static int vidioc_try_fmt(struct file *file, void *priv,
>> struct v4l2_format *f)
>>   				(u32)MIN_HEIGHT, (u32)MAX_HEIGHT);
>>   
>>   	v4l2_fill_pixfmt_mp(pix_fmt, fmt->fourcc, pix_fmt->width, pix_fmt-
>>> height);
>> +	align_pixfmt(pix_fmt);
>>   	pix_fmt->field = V4L2_FIELD_NONE;
>>   
>>   	return 0;

