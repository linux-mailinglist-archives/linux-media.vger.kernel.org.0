Return-Path: <linux-media+bounces-41823-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F91B45425
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 12:11:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 235731BC6DDE
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 10:11:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6975C2C11ED;
	Fri,  5 Sep 2025 10:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="lLsXw72F"
X-Original-To: linux-media@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B672BE63F;
	Fri,  5 Sep 2025 10:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757067084; cv=none; b=avRLlnF0icqsPpwewWtueC7hhV/5xXjJQb8iXDU46xO6VmX8dhcRKl9zX8LCgTmOq+jC9ubWx8d+obNQXBNIcAUBfK5wo4W86ypBQG7nbkbF3w/REQmwWwUivXgyH7MMMsKFrdc5RTGM/+dz7J08nt8USc3xXSNDbYV8wZO6HGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757067084; c=relaxed/simple;
	bh=ThBn18nAS7wJ7vMOdpeb1ZxEp1+peLlkusB0r1MRcuY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=B1lp7pbcZMs5BSSQvNH7fqdodgIzElKELqc86l5SsWRUrnZgkpzm+AxotPP8gUXKIPcabZoSmc6IKepryXc0FXQf27v4Rtww180VHi9zXndgcVRyiSz1lDDTZU1sPTPat1jTtSSnBIOHZAIPwAgLCS4M6Lp9mQllZbbaGDfYw8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=lLsXw72F; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 585AAlq73690348;
	Fri, 5 Sep 2025 05:10:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757067047;
	bh=Pm6PWBRGwS3wo5s1g4KMnXdseJb2mzIZCAFL9ZdKaO8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=lLsXw72FaEZsJs3ufzxwB2VJbL5/MMudEd8WBULnPSp9vVWBuas1kr3Q1rsclVPj5
	 4QLyxviVKCdDue205V5jk2I4Ab00RiA40nGskneh4prg4Y2Qs53W6eKJg2++MScNSS
	 fZUVQLl3LFNbY1Aj4oOhqeDRgisLYsygZYimMUXU=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 585AAlJ61569668
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 5 Sep 2025 05:10:47 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 5
 Sep 2025 05:10:47 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 5 Sep 2025 05:10:47 -0500
Received: from [10.24.68.198] (abhilash-hp.dhcp.ti.com [10.24.68.198])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 585AAfTC284138;
	Fri, 5 Sep 2025 05:10:42 -0500
Message-ID: <3bb314a8-2ce0-4c54-bab0-e0af70bf22b9@ti.com>
Date: Fri, 5 Sep 2025 15:40:40 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/14] media: ti: j721e-csi2rx: Remove word size
 alignment on frame width
To: Rishikesh Donadkar <r-donadkar@ti.com>, <jai.luthra@linux.dev>,
        <laurent.pinchart@ideasonboard.com>, <mripard@kernel.org>
CC: <devarsht@ti.com>, <vaishnav.a@ti.com>, <s-jain1@ti.com>,
        <vigneshr@ti.com>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <sakari.ailus@linux.intel.com>, <hverkuil-cisco@xs4all.nl>,
        <tomi.valkeinen@ideasonboard.com>, <jai.luthra@ideasonboard.com>,
        <changhuang.liang@starfivetech.com>, <jack.zhu@starfivetech.com>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20250825142522.1826188-1-r-donadkar@ti.com>
 <20250825142522.1826188-2-r-donadkar@ti.com>
Content-Language: en-US
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
In-Reply-To: <20250825142522.1826188-2-r-donadkar@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Rishikesh,

Thanks for the patches.

On 25/08/25 19:55, Rishikesh Donadkar wrote:
> j721e-csi2rx driver has a limitation of frame width being a multiple
> word size. However, there is no such limitation imposed by the
> hardware [1].
> 
> Remove this limitation from the driver.
> 
> Link: https://www.ti.com/lit/pdf/spruj16
> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> ---

Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>

>   .../platform/ti/j721e-csi2rx/j721e-csi2rx.c     | 17 +++--------------
>   1 file changed, 3 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> index 3992f8b754b7..b3a27f4c3210 100644
> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> @@ -260,9 +260,6 @@ static void ti_csi2rx_fill_fmt(const struct ti_csi2rx_fmt *csi_fmt,
>   			     MAX_WIDTH_BYTES * 8 / csi_fmt->bpp);
>   	pix->height = clamp_t(unsigned int, pix->height, 1, MAX_HEIGHT_LINES);
>   
> -	/* Width should be a multiple of transfer word-size */
> -	pix->width = rounddown(pix->width, pixels_in_word);
> -
>   	v4l2_fmt->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
>   	pix->pixelformat = csi_fmt->fourcc;
>   	pix->bytesperline = pix->width * (csi_fmt->bpp / 8);
> @@ -360,23 +357,15 @@ static int ti_csi2rx_enum_framesizes(struct file *file, void *fh,
>   				     struct v4l2_frmsizeenum *fsize)
>   {
>   	const struct ti_csi2rx_fmt *fmt;
> -	unsigned int pixels_in_word;
>   
>   	fmt = find_format_by_fourcc(fsize->pixel_format);
>   	if (!fmt || fsize->index != 0)
>   		return -EINVAL;
>   
> -	/*
> -	 * Number of pixels in one PSI-L word. The transfer happens in multiples
> -	 * of PSI-L word sizes.
> -	 */
> -	pixels_in_word = PSIL_WORD_SIZE_BYTES * 8 / fmt->bpp;
> -
>   	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
> -	fsize->stepwise.min_width = pixels_in_word;
> -	fsize->stepwise.max_width = rounddown(MAX_WIDTH_BYTES * 8 / fmt->bpp,
> -					      pixels_in_word);
> -	fsize->stepwise.step_width = pixels_in_word;
> +	fsize->stepwise.min_width = 1;
> +	fsize->stepwise.max_width = MAX_WIDTH_BYTES * 8 / fmt->bpp;
> +	fsize->stepwise.step_width = 1;
>   	fsize->stepwise.min_height = 1;
>   	fsize->stepwise.max_height = MAX_HEIGHT_LINES;
>   	fsize->stepwise.step_height = 1;


