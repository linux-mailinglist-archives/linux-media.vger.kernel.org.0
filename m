Return-Path: <linux-media+bounces-41964-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D5BB486DE
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 10:26:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96B053420D2
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 08:25:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE7002EE268;
	Mon,  8 Sep 2025 08:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="wx06UQPd"
X-Original-To: linux-media@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2B52EAD0C;
	Mon,  8 Sep 2025 08:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757319700; cv=none; b=m2ubRtkxGcdubzXpc/2h11whm8uyv60ugQpmVGSxU4AO73Q1WnhU9IwllKOdiwLCex8PzfacReeKTXuluvJj440ezIA7UskTc512NY3tF9dzjN4MtDhOciwGmhTgm5z/tUstRxkor/B6iYR4e0h78/mRZELm4iaSvXFhGyuDLc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757319700; c=relaxed/simple;
	bh=vtRz936E6GVPVGI7842sta17vkvfsZGIcHXlBucsXhg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=CmtRF915eX0Ma5OLbZNkHOQYdlQuAXiGMbEhgf/SIolN3/wbvwoO9c/h7NEEPn66R/TvZkFpvpRmAer36h6BAG40447GqmhUi26MV8GfgXHFBRGZI7gv3GmGKYq15sX0R180g0v0DMbb1F4EIoGtr6WbFkHQeoQX0bWeolaW6VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=wx06UQPd; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5888LOmW013081;
	Mon, 8 Sep 2025 03:21:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757319684;
	bh=KkkM2yN8gMW26c/RcDrwj1uSTStAMwrJrYOVT8zxEiU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=wx06UQPdjyKsednqq0zVq7xqPreF5OR+pUWnnUgCKm2FfO8lDIlCc2u9yTlLS4LNa
	 8PfuLETWHpnoCPGGtWGmEICrsR4OyaZcGCmCH5uON4TIKchXWtYs9kmmM7xfbviR3K
	 uos/u58Z38JM9GGOgwIYyuL9OKGclYUw9WocHkw4=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5888LNLA3633110
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 8 Sep 2025 03:21:23 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 8
 Sep 2025 03:21:23 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 8 Sep 2025 03:21:23 -0500
Received: from [172.24.233.149] (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5888LHUw279770;
	Mon, 8 Sep 2025 03:21:17 -0500
Message-ID: <023cb278-9002-442c-bcfd-eac790024d0b@ti.com>
Date: Mon, 8 Sep 2025 13:51:16 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/14] media: ti: j721e-csi2rx: Remove word size
 alignment on frame width
To: Jai Luthra <jai.luthra@ideasonboard.com>, <jai.luthra@linux.dev>,
        <laurent.pinchart@ideasonboard.com>, <mripard@kernel.org>
CC: <y-abhilashchandra@ti.com>, <devarsht@ti.com>, <vaishnav.a@ti.com>,
        <s-jain1@ti.com>, <vigneshr@ti.com>, <mchehab@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <sakari.ailus@linux.intel.com>, <hverkuil-cisco@xs4all.nl>,
        <tomi.valkeinen@ideasonboard.com>, <changhuang.liang@starfivetech.com>,
        <jack.zhu@starfivetech.com>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20250825142522.1826188-1-r-donadkar@ti.com>
 <20250825142522.1826188-2-r-donadkar@ti.com>
 <175707045529.8095.7424566069689990352@freya>
Content-Language: en-US
From: Rishikesh Donadkar <r-donadkar@ti.com>
In-Reply-To: <175707045529.8095.7424566069689990352@freya>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea


On 05/09/25 16:37, Jai Luthra wrote:
> Hi Rishikesh,


Hi Jai,

Thank you for the comments


>
> Quoting Rishikesh Donadkar (2025-08-25 19:55:09)
>> j721e-csi2rx driver has a limitation of frame width being a multiple
>> word size. However, there is no such limitation imposed by the
>> hardware [1].
> Is there no limitation for the step size, or also not limitation for the
> minimum size of transfer?



I did not see any mention of restrictions on the step size and minimum 
size of transfer in the TRM and the CSI functional specifications.


>
>> Remove this limitation from the driver.
>>
>> Link: https://www.ti.com/lit/pdf/spruj16
>> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
>> ---
>>   .../platform/ti/j721e-csi2rx/j721e-csi2rx.c     | 17 +++--------------
>>   1 file changed, 3 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
>> index 3992f8b754b7..b3a27f4c3210 100644
>> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
>> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
>> @@ -260,9 +260,6 @@ static void ti_csi2rx_fill_fmt(const struct ti_csi2rx_fmt *csi_fmt,
>>                               MAX_WIDTH_BYTES * 8 / csi_fmt->bpp);
> Here the pix->width is restricted to be at minimum pixels_in_word.
> So TRY_FMT/S_FMT with a width = 1 will be clamped by the driver.
>
>>          pix->height = clamp_t(unsigned int, pix->height, 1, MAX_HEIGHT_LINES);
>>   
>> -       /* Width should be a multiple of transfer word-size */
>> -       pix->width = rounddown(pix->width, pixels_in_word);
>> -
>>          v4l2_fmt->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
>>          pix->pixelformat = csi_fmt->fourcc;
>>          pix->bytesperline = pix->width * (csi_fmt->bpp / 8);
>> @@ -360,23 +357,15 @@ static int ti_csi2rx_enum_framesizes(struct file *file, void *fh,
>>                                       struct v4l2_frmsizeenum *fsize)
>>   {
>>          const struct ti_csi2rx_fmt *fmt;
>> -       unsigned int pixels_in_word;
>>   
>>          fmt = find_format_by_fourcc(fsize->pixel_format);
>>          if (!fmt || fsize->index != 0)
>>                  return -EINVAL;
>>   
>> -       /*
>> -        * Number of pixels in one PSI-L word. The transfer happens in multiples
>> -        * of PSI-L word sizes.
>> -        */
>> -       pixels_in_word = PSIL_WORD_SIZE_BYTES * 8 / fmt->bpp;
>> -
>>          fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
>> -       fsize->stepwise.min_width = pixels_in_word;
>> -       fsize->stepwise.max_width = rounddown(MAX_WIDTH_BYTES * 8 / fmt->bpp,
>> -                                             pixels_in_word);
>> -       fsize->stepwise.step_width = pixels_in_word;
>> +       fsize->stepwise.min_width = 1;
> But here, in ENUM_FRAMESIZES we allow width to go as low as 1.
>
> Can you make sure both of them match whatever is correct (and possible by
> the hardware)?


Sure


>
>> +       fsize->stepwise.max_width = MAX_WIDTH_BYTES * 8 / fmt->bpp;
>> +       fsize->stepwise.step_width = 1;
>>          fsize->stepwise.min_height = 1;
>>          fsize->stepwise.max_height = MAX_HEIGHT_LINES;
>>          fsize->stepwise.step_height = 1;
>> -- 
>> 2.34.1
>>
> Thanks,
>      Jai


Regards,

Rishikesh


