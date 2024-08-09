Return-Path: <linux-media+bounces-16049-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE63194CCA7
	for <lists+linux-media@lfdr.de>; Fri,  9 Aug 2024 10:48:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D28B1C21047
	for <lists+linux-media@lfdr.de>; Fri,  9 Aug 2024 08:48:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 260D2190492;
	Fri,  9 Aug 2024 08:48:22 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A222418CC16;
	Fri,  9 Aug 2024 08:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723193301; cv=none; b=VLdYVjUknA39M1XRTaLJ1dttAHivIq+LvVUt9mghzrA91es32857h3C+G6TlYr2dz1F5y8TKiCVrOWIEJ+SDW0HGtrGeblO/b6JKChtObyo+mmx2h0mvBbyF19s3p3oBsOPYdHY9F2nBUVJIlYGniQ4C7x+5WHp7lsvJtGv4zdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723193301; c=relaxed/simple;
	bh=OEI9WONUscusJHaOfTyKUkXf7bLFBYHMLZxYcf+WgMw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KAeqK2miPkOirdaye3JymFERImNTpP9cmi6liMQnuHUn2+JtSrVlEiCouMwNosUVBp+ia8MvVHKD/idBTnzeMPVTmiadyToFsbLz7LeiIzQZTQ6yz+RYbFd3SIXQAlbDIAGkJqYUDB0M69zIhpiCznrix1yywb7QeZCkxTZa2p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC645C4AF09;
	Fri,  9 Aug 2024 08:48:19 +0000 (UTC)
Message-ID: <1c5ad030-86dc-4971-b14c-07e9a38f938e@xs4all.nl>
Date: Fri, 9 Aug 2024 10:48:18 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOWbnuWkjTogW1BBVENIXSBzdGFnaW5nOiBtZWRpYTogc3RhcmZp?=
 =?UTF-8?Q?ve=3A_Add_multiple_resolution_support?=
To: Changhuang Liang <changhuang.liang@starfivetech.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jack Zhu <jack.zhu@starfivetech.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>
References: <20240419081955.5140-1-changhuang.liang@starfivetech.com>
 <ZQ0PR01MB1302A3ABE95897046ED4F502F2BA2@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <ZQ0PR01MB1302A3ABE95897046ED4F502F2BA2@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/08/2024 10:29, Changhuang Liang wrote:
> Hi, Hans
> 
>> Add multiple resolution support for video "capture_raw" device. Otherwise it
>> will capture the wrong image data if the width is not 1920.
>>
> 
> Can you help to review this patch, Thanks for your times.

Patch looks OK, it will be part of my next 'various fixes' Pull Request.

Regards,

	Hans

> 
> Regards,
> Changhuang
> 
>> Fixes: e080f339c80a ("media: staging: media: starfive: camss: Add capture
>> driver")
>>
>> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
>> ---
>>  drivers/staging/media/starfive/camss/stf-capture.c | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/staging/media/starfive/camss/stf-capture.c
>> b/drivers/staging/media/starfive/camss/stf-capture.c
>> index ec5169e7b391..9e853ff2596a 100644
>> --- a/drivers/staging/media/starfive/camss/stf-capture.c
>> +++ b/drivers/staging/media/starfive/camss/stf-capture.c
>> @@ -177,9 +177,12 @@ static void stf_channel_set(struct stfcamss_video
>> *video)  {
>>  	struct stf_capture *cap = to_stf_capture(video);
>>  	struct stfcamss *stfcamss = cap->video.stfcamss;
>> +	struct v4l2_pix_format *pix;
>>  	u32 val;
>>
>>  	if (cap->type == STF_CAPTURE_RAW) {
>> +		pix = &video->active_fmt.fmt.pix;
>> +
>>  		val = stf_syscon_reg_read(stfcamss, VIN_CHANNEL_SEL_EN);
>>  		val &= ~U0_VIN_CHANNEL_SEL_MASK;
>>  		val |= CHANNEL(0);
>> @@ -193,7 +196,7 @@ static void stf_channel_set(struct stfcamss_video
>> *video)
>>  		val |= PIXEL_HEIGH_BIT_SEL(0);
>>
>>  		val &= ~U0_VIN_PIX_CNT_END_MASK;
>> -		val |= PIX_CNT_END(IMAGE_MAX_WIDTH / 4 - 1);
>> +		val |= PIX_CNT_END(pix->width / 4 - 1);
>>
>>  		stf_syscon_reg_write(stfcamss, VIN_INRT_PIX_CFG, val);
>>  	} else if (cap->type == STF_CAPTURE_YUV) {
>> --
>> 2.25.1


