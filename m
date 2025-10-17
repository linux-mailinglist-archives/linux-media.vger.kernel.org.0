Return-Path: <linux-media+bounces-44784-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A77FBE6577
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 06:54:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 059ED4E5596
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 04:54:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED7C230C617;
	Fri, 17 Oct 2025 04:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="rbUWxdW4"
X-Original-To: linux-media@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B2923278D;
	Fri, 17 Oct 2025 04:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760676868; cv=none; b=G4Ul8sZ0symMOtQf09FWQ72cbskTBMZC1B8VErQOdZkqkb4vXO0KAO3UvOGwQFuv2ZrTbo6aYWioMRCkaZZ8ozFvId6CiM0ENi1RoLR8nXlvSt9rJsQZaX+LwKmzOzi8PdZS8dasdRVhNNsshpFHxVy/HXY8SAfySELWkZjRoAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760676868; c=relaxed/simple;
	bh=RySiuSJq582Kj49QG8p+043sVEzbpqAv1VT35EMQJG8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=NEhKDHGyDR/XN3CJZJCmOkjXIrLc4hnoMOg46eTYDQ2wm9h6yuVP98WTV0holhWXpSiiTcmzQm+9gD/kkXM/HGySSiJAnaa6wHcLhP6GDmcWM7KMY4OjgVVirw/TsgSBU7cUimN8QxlOdw69yKM1jyiQoNhSN0hJ+fgIgXPcIpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=rbUWxdW4; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59H4rlmL185163;
	Thu, 16 Oct 2025 23:53:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760676827;
	bh=WEfkvhel4ThB/iO0axrDdI7cNx6uCy73DOW86j1v+DE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=rbUWxdW40eFQBdFjXWpLh2PcHUvsTtcltzqbmSE1PI851GaLV7rMTF2wr3M9Utpqt
	 I/rQB2F+siY0tA62P4CuTQJMdqlZVNWhksUJvwbBdQovUZosCCIVAsUN6lBvO+0Nrg
	 4SySFnJkHBAm1twUahVs9uUz9aFqoFfImGuz9K4U=
Received: from DFLE205.ent.ti.com (dfle205.ent.ti.com [10.64.6.63])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59H4rjiD1733600
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 16 Oct 2025 23:53:45 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 16 Oct
 2025 23:53:45 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 16 Oct 2025 23:53:45 -0500
Received: from [10.249.134.35] ([10.249.134.35])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59H4rVkX713882;
	Thu, 16 Oct 2025 23:53:32 -0500
Message-ID: <ac3a8ca1-634d-40eb-8449-f79054fa385a@ti.com>
Date: Fri, 17 Oct 2025 10:23:31 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 01/16] media: ti: j721e-csi2rx: Remove word size
 alignment on frame width
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, <jai.luthra@linux.dev>,
        <laurent.pinchart@ideasonboard.com>, <mripard@kernel.org>
CC: <y-abhilashchandra@ti.com>, <devarsht@ti.com>, <s-jain1@ti.com>,
        <vigneshr@ti.com>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <p.zabel@pengutronix.de>, <conor+dt@kernel.org>,
        <sakari.ailus@linux.intel.com>, <hverkuil-cisco@xs4all.nl>,
        <jai.luthra@ideasonboard.com>, <changhuang.liang@starfivetech.com>,
        <jack.zhu@starfivetech.com>, <sjoerd@collabora.com>,
        <hverkuil+cisco@kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20250911102832.1583440-1-r-donadkar@ti.com>
 <20250911102832.1583440-2-r-donadkar@ti.com>
 <4becc7fc-fe25-4f7c-9434-399b1c2c3cce@ideasonboard.com>
Content-Language: en-US
From: "Donadkar, Rishikesh" <r-donadkar@ti.com>
In-Reply-To: <4becc7fc-fe25-4f7c-9434-399b1c2c3cce@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea


On 22-09-2025 17:26, Tomi Valkeinen wrote:
> Hi,


Hi Tomi,


>
> On 11/09/2025 13:28, Rishikesh Donadkar wrote:
>> j721e-csi2rx driver has a limitation of frame width being a multiple
>> word size. However, there is no such limitation imposed by the
>> hardware [1].
>>
>> Remove this limitation from the driver.
>>
>> Link: https://www.ti.com/lit/pdf/spruj16
>> Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
>> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
>> ---
>>   .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 23 ++++---------------
>>   1 file changed, 4 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
>> index 3992f8b754b7..6a981b5f5d51 100644
>> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
>> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
>> @@ -250,19 +250,12 @@ static void ti_csi2rx_fill_fmt(const struct ti_csi2rx_fmt *csi_fmt,
>>   			       struct v4l2_format *v4l2_fmt)
>>   {
>>   	struct v4l2_pix_format *pix = &v4l2_fmt->fmt.pix;
>> -	unsigned int pixels_in_word;
>> -
>> -	pixels_in_word = PSIL_WORD_SIZE_BYTES * 8 / csi_fmt->bpp;
> The define for PSIL_WORD_SIZE_BYTES can also be removed, if I'm not
> mistaken.


Yes, Thanks for pointing out !


>
> I assume this has been tested, but I'm still a bit curious. Usually
> these kind of lines of code don't just appear out of nowhere. You linked
> to AM62Ax docs. None of the other SoCs have any limitations here either?


This has been tested with IMX219 : 1640x1232 -f SRGGB8. Looking at the 
docs, I don't see such limitation mentioned anywhere for the other SoC 
as well.


Regards,

Rishikesh

>
> PSIL_WORD_SIZE_BYTES hints to a system DMA level limit, not CSI-2 RX
> limit, so I wonder if some earlier SoCs had such limitations in the DMA?
>
>   Tomi
>
>>   
>>   	/* Clamp width and height to sensible maximums (16K x 16K) */
>>   	pix->width = clamp_t(unsigned int, pix->width,
>> -			     pixels_in_word,
>> -			     MAX_WIDTH_BYTES * 8 / csi_fmt->bpp);
>> +			     1, MAX_WIDTH_BYTES * 8 / csi_fmt->bpp);
>>   	pix->height = clamp_t(unsigned int, pix->height, 1, MAX_HEIGHT_LINES);
>>   
>> -	/* Width should be a multiple of transfer word-size */
>> -	pix->width = rounddown(pix->width, pixels_in_word);
>> -
>>   	v4l2_fmt->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
>>   	pix->pixelformat = csi_fmt->fourcc;
>>   	pix->bytesperline = pix->width * (csi_fmt->bpp / 8);
>> @@ -360,23 +353,15 @@ static int ti_csi2rx_enum_framesizes(struct file *file, void *fh,
>>   				     struct v4l2_frmsizeenum *fsize)
>>   {
>>   	const struct ti_csi2rx_fmt *fmt;
>> -	unsigned int pixels_in_word;
>>   
>>   	fmt = find_format_by_fourcc(fsize->pixel_format);
>>   	if (!fmt || fsize->index != 0)
>>   		return -EINVAL;
>>   
>> -	/*
>> -	 * Number of pixels in one PSI-L word. The transfer happens in multiples
>> -	 * of PSI-L word sizes.
>> -	 */
>> -	pixels_in_word = PSIL_WORD_SIZE_BYTES * 8 / fmt->bpp;
>> -
>>   	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
>> -	fsize->stepwise.min_width = pixels_in_word;
>> -	fsize->stepwise.max_width = rounddown(MAX_WIDTH_BYTES * 8 / fmt->bpp,
>> -					      pixels_in_word);
>> -	fsize->stepwise.step_width = pixels_in_word;
>> +	fsize->stepwise.min_width = 1;
>> +	fsize->stepwise.max_width = MAX_WIDTH_BYTES * 8 / fmt->bpp;
>> +	fsize->stepwise.step_width = 1;
>>   	fsize->stepwise.min_height = 1;
>>   	fsize->stepwise.max_height = MAX_HEIGHT_LINES;
>>   	fsize->stepwise.step_height = 1;

