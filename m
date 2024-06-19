Return-Path: <linux-media+bounces-13706-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8F390F038
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 16:20:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 930961C24250
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 14:20:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37E871CAAD;
	Wed, 19 Jun 2024 14:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="WtWl/02f"
X-Original-To: linux-media@vger.kernel.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977301429B;
	Wed, 19 Jun 2024 14:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718806806; cv=none; b=evp5C+wYUm818uW8SR5FjN+MgdReGRpwoLB6lHeEBlt8QO27QfpqFcU2UC/JN/8f8WjMjX2vXzTZeZ7gU8pocgtIIanuwI4mJN+9LufDnMJ75Kc2IdQzBHsR8b+2zxNikzUwnrEM6xo5YGB75t1wWqMktsUf4qMGHQVlKUcZfzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718806806; c=relaxed/simple;
	bh=eTtWWZf9nTRx8VuJzDBx5MySPzRRLAOP8p8/HjudJUE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LWDoT7Y8qRfxMaSXoIhLsWFbS8m94W09MsKeX2WM9YqpU7gw4RYaLSPFkCq4yG+iFU5GpJGNxMFM0n9onCEUgR2OJmeGu7mWwuoI2qMYeTI58PPp/Q1kGd48B1VBFz33xj5VYGf4kj++qmOroPtTdDH3mDfj9AtQ86/BFB2GyYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=WtWl/02f; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45JEJoV9010660;
	Wed, 19 Jun 2024 09:19:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718806790;
	bh=FSQ2+Te3fS7cD7RsG1IQUWm/D6rsL32PP4gaD0cVRlo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=WtWl/02ft3dKjmHChoDiS9xE5kSMTnAwnWGjIpmQJIhcmPEkPKUij2iq8IVzCHMok
	 D7ffY9xvCsvTAe48T46lVGROg3C78HRYGt6Cwc6lalvrCMN2ftXPP7h5fhZ8Ddrn4O
	 OVg1n+dfMH69haUkESGvM97FjpMnS5fN4wJQ6zhw=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45JEJoM0073609
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 19 Jun 2024 09:19:50 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 19
 Jun 2024 09:19:50 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 19 Jun 2024 09:19:50 -0500
Received: from [172.24.227.193] (devarsht.dhcp.ti.com [172.24.227.193] (may be forged))
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45JEJiNL130016;
	Wed, 19 Jun 2024 09:19:45 -0500
Message-ID: <e948cea7-d5c7-a7e6-d921-ad7c2f93cd5a@ti.com>
Date: Wed, 19 Jun 2024 19:49:44 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v13 03/13] media: v4l2-jpeg: Export reference quantization
 and huffman tables
Content-Language: en-US
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <benjamin.gaignard@collabora.com>, <sebastian.fricke@collabora.com>
CC: <laurent.pinchart@ideasonboard.com>, <praneeth@ti.com>, <nm@ti.com>,
        <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>,
        <b-brnich@ti.com>, <detheridge@ti.com>, <p-mantena@ti.com>,
        <vijayp@ti.com>, <andrzej.p@collabora.com>, <nicolas@ndufresne.ca>,
        Markus Elfring
	<Markus.Elfring@web.de>
References: <20240607131900.3535250-1-devarsht@ti.com>
 <20240607132831.3551333-1-devarsht@ti.com>
 <59866428-342b-4ba4-a7c7-2df1477aa7e6@xs4all.nl>
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <59866428-342b-4ba4-a7c7-2df1477aa7e6@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Hi Hans, Sebastian,

Thanks for the review Hans.

On 13/06/24 15:38, Hans Verkuil wrote:
> Hi Devarsh,

[..]
> 
> Why make this so complicated?
> 
> Just do this:
> 
> const u8 v4l2_jpeg_table_luma_qt[V4L2_JPEG_PIXELS_IN_BLOCK] = {
> 	16, 11, 10, 16,  24,  40,  51,  61,
> 	12, 12, 14, 19,  26,  58,  60,  55,
> 	14, 13, 16, 24,  40,  57,  69,  56,
> 	14, 17, 22, 29,  51,  87,  80,  62,
> 	18, 22, 37, 56,  68, 109, 103,  77,
> 	24, 35, 55, 64,  81, 104, 113,  92,
> 	49, 64, 78, 87, 103, 121, 120, 101,
> 	72, 92, 95, 98, 112, 100, 103,  99
> };
> EXPORT_SYMBOL_GPL(v4l2_jpeg_table_luma_qt);
> 
> and in the header add:
> 
> extern const u8 v4l2_jpeg_table_luma_qt[V4L2_JPEG_PIXELS_IN_BLOCK];
> 
> Same for the other tables.
> 
> And in the header add:
> 
> extern const u8 v4l2_jpeg_table_luma_qt[V4L2_JPEG_PIXELS_IN_BLOCK];
> 
> It's similar to e.g. 'const u8 v4l2_vp9_kf_y_mode_prob[10][10][9];'
> in v4l2-vp9.c/h.
> 
> It also ensures that the compiler knows the size of each array,
> so it can detect out-of-bounds errors. And you can drop the accessor
> functions, as there is no longer any need for that.
> 
> I really want this out-of-bounds detection, the code as it is now is too
> risky. So please make a v14.
>

Yes agreed, initially I had a similar thought to use extern declared variables
but somehow couldn't find any good examples as you shared so thought to have
wrapper functions but anyways have fixed this in v14.
 >> +
>> +static const u8 chroma_qt[] = {
> 
> Just to make it clear: don't use [] here, use the actual define for the
> array size. That way you get a compiler warning if you missed an entry
> in the initialization.
> 
> Apologies for the late review, I only noticed this when I checked the
> pull request.
> 

No worries for the delay, these are good comments and I have fixed them in v14
[1] appreciate if it's possible to have a quick review and if it looks good
possible to pull it in this week's RC cycle ? This will help me plan to send
math.h and rounding related patches (patch 7/13 to patch 12/13) from v13 [2]
as separate series more quickly as aligned. Also there was a new suggestion
[3] to use guard(mutex) in remove method, I was thinking to evaluate that and
pull that in as a separate patchset after this series gets merged and include
as part of next set of patches involving math.h and rounding macros discussed
above so that I can test them all together all at once since I am running a
bunch of manual and automated tests so wanted to reduce the cycles, will that
be fine ?

Kindly let me know your opinion.

[1]: https://lore.kernel.org/all/20240618193651.2771478-1-devarsht@ti.com/
[2]: https://lore.kernel.org/all/20240607131900.3535250-1-devarsht@ti.com/
[3]: https://lore.kernel.org/all/2fed4937-e9ea-4635-a061-5c5a0533b152@web.de/

Regards
Devarsh

