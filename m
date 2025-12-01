Return-Path: <linux-media+bounces-47920-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 08107C961B5
	for <lists+linux-media@lfdr.de>; Mon, 01 Dec 2025 09:28:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7AFE3A1D62
	for <lists+linux-media@lfdr.de>; Mon,  1 Dec 2025 08:28:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F3EE2E54DE;
	Mon,  1 Dec 2025 08:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VlNH2LRf"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8794222560
	for <linux-media@vger.kernel.org>; Mon,  1 Dec 2025 08:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764577678; cv=none; b=PC+6HnylA3o6ogOnzoVzrMsHMsSHsVF/AemuNCdaenczcsNIGerfszn44zQDQe7PsIMzkBBgcJy1EF58g/vLxSOo1Yzz1OyyxHgVh+WmMYmCF0x2F04ra+CAVpy6R469Cm1hmRfHVGSUYa9kD2NCPnUwNpjAN0ApKhnfUQ4qgW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764577678; c=relaxed/simple;
	bh=gk7+qvGJFTtBTdGnp6xMKDUYkLniOZKg96ntmeLeLlE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=m1LFL0rWWGWX/9WykUsg/J1y5wCTLCMKZ3OMyDw+fHNyl8a6YOUGPV+jtSCuuM1RiTKS81Jsir413dJ6NyiRwHPZCXdUcK77mzdU2RnXnkJiY+EG7Mahm7I2EiegN5g2kitIcv4Hcut3OX14vFvsQfC+KXsMNX6Lxzw8EOa/qfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VlNH2LRf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BB30C4CEF1;
	Mon,  1 Dec 2025 08:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764577677;
	bh=gk7+qvGJFTtBTdGnp6xMKDUYkLniOZKg96ntmeLeLlE=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=VlNH2LRfF2QGcyKF1yJWMtdGwACBek822rHxKiCcMkRp+YdkjkIPEU+LBFDZvsw7/
	 btzrXHBABvEVwByCQxEZzumE4p6jMsQntXABuIR9mL1G+sDgYgudfa/QRtkBxZkUz9
	 OKYU/sJuLucpSos6bT1Nr5xoMt30gAAgnjCEueolDT8WDEa4FCfw7URjyF3gCqWEMD
	 YQkwsgAeUfoqcIoBf4bt3xvBluVXyHyKZq7gA37umuaHOjF0K6DDEBJzWdOtt7re4U
	 x64RSxNKEO4zaegV878LRQTmGdvwW1Kx1efqeHBj+ET5J+YsBBDSsK+cSFdAKfKzBS
	 UZE5QbC8LUN9g==
Message-ID: <4788af27-120e-4e01-b3d1-f30e466b4980@kernel.org>
Date: Mon, 1 Dec 2025 09:27:55 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH 03/14] media: omap3isp: isp_video_mbus_to_pix/pix_to_mbus
 fixes
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
References: <cover.1760707611.git.hverkuil+cisco@kernel.org>
 <1e7330bdeb61565bef5254fa35717a260d9e4633.1760707611.git.hverkuil+cisco@kernel.org>
 <aPiMWDmqbYwBacpJ@kekkonen.localdomain>
Content-Language: en-US, nl
In-Reply-To: <aPiMWDmqbYwBacpJ@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Sakari,

On 22/10/2025 09:48, Sakari Ailus wrote:
> Hi Hans,
> 
> Thanks for the set.
> 
> On Fri, Oct 17, 2025 at 03:26:40PM +0200, Hans Verkuil wrote:
>> The isp_video_mbus_to_pix/pix_to_mbus functions did not take
>> the last empty entry { 0, } of the formats array into account.
>>
>> As a result, isp_video_mbus_to_pix would accept code 0 and
>> isp_video_pix_to_mbus would select code 0 if no match was found.
>>
>> Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
>> ---
>>  drivers/media/platform/ti/omap3isp/ispvideo.c | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/platform/ti/omap3isp/ispvideo.c b/drivers/media/platform/ti/omap3isp/ispvideo.c
>> index 46609045e2c8..864d38140b87 100644
>> --- a/drivers/media/platform/ti/omap3isp/ispvideo.c
>> +++ b/drivers/media/platform/ti/omap3isp/ispvideo.c
>> @@ -148,12 +148,12 @@ static unsigned int isp_video_mbus_to_pix(const struct isp_video *video,
>>  	pix->width = mbus->width;
>>  	pix->height = mbus->height;
>>  
>> -	for (i = 0; i < ARRAY_SIZE(formats); ++i) {
>> +	for (i = 0; i < ARRAY_SIZE(formats) - 1; ++i) {
> 
> As it seems all users of the formats array depend on the size of the array
> and not its contents, could we remove the sentinel entry from the array
> instead?

Probably, but see this comment just before the sentinel in the array:

        /* Empty entry to catch the unsupported pixel code (0) used by the CCDC
         * module and avoid NULL pointer dereferences.
         */
        { 0, }

Now, I wonder if this comment is out of date, since I don't see code 0 being used
by CDDC. If you can confirm that that's indeed the case, then I can drop the sentinel.

Regards,

	Hans

> 
>>  		if (formats[i].code == mbus->code)
>>  			break;
>>  	}
>>  
>> -	if (WARN_ON(i == ARRAY_SIZE(formats)))
>> +	if (WARN_ON(i == ARRAY_SIZE(formats) - 1))
>>  		return 0;
>>  
>>  	min_bpl = pix->width * formats[i].bpp;
>> @@ -191,7 +191,7 @@ static void isp_video_pix_to_mbus(const struct v4l2_pix_format *pix,
>>  	/* Skip the last format in the loop so that it will be selected if no
>>  	 * match is found.
>>  	 */
>> -	for (i = 0; i < ARRAY_SIZE(formats) - 1; ++i) {
>> +	for (i = 0; i < ARRAY_SIZE(formats) - 2; ++i) {
>>  		if (formats[i].pixelformat == pix->pixelformat)
>>  			break;
>>  	}
> 


