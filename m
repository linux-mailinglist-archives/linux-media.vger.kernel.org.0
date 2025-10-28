Return-Path: <linux-media+bounces-45879-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F23C16BF5
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 21:19:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E26724E0754
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 20:19:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2509D29A309;
	Tue, 28 Oct 2025 20:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cBAAMRZT"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825F01917F1
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 20:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761682759; cv=none; b=flY8zUkTo73KoFoZBSg31gRlNMlWzkanyusl8mqnO5i2HkMUdQfWN+EAWQDokemge9ackn9wAEsL58rmT5lBgtZ+Dae2/vxvXoWgVKK9L50rS+X5ehaV9xIV+S+T7CoBXRr92UJYZ78GU3FfrHjmut97mCYJWAKBKeJMOGIP22Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761682759; c=relaxed/simple;
	bh=V7S7hJ5eb3uwKd5f4oVZjy04fDvcM2s2xY5C/+83Xw4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WtGnJ41/yjCplW1W3oc59I33E0DwYwyyQBqFj3Klfzob58oR5LUobhwue/sND8oIQi+qfl+pdIr/Rdp57iey75w/1iBa2utoQdYJ1GgrxsnEofwy7pqY8laJPPvedDMVC1qvmkK/hY9grgRR3NcuRDACLNdDxMZ6AG2B5EBV7sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cBAAMRZT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46A72C4CEE7;
	Tue, 28 Oct 2025 20:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761682759;
	bh=V7S7hJ5eb3uwKd5f4oVZjy04fDvcM2s2xY5C/+83Xw4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cBAAMRZTwRyrBQufhgLQ/wzeE4Ik2iUOknw9cjNDIiIfh5tIAJzBDi1v17DxZR0Ox
	 QzzdOUPpP8A1wAG7uIUwdbUbL+PG5ZNnnXji6bPAblT1iOgfOgRSg2xfJpL1Ifwqew
	 XtHhEzE3oT4CRqouqEU/a0lQmeK0L7SiFQXHdqbjqdjJeMtKITBftXD7v9vfYEt1BG
	 SaLc1YDx25ABN9gt9BxmLTOCKEENTuraNBO+k2rGM8+dZG7XlgennxP3JdJ7UO3vyA
	 qI+6alKmK2UE38YDL2TJAmu4LL5sLQoBvOsBgwVA/Il0MclCpxETY2i/IjjeOdTyWe
	 P5CznZmgGOm0Q==
Message-ID: <84ba8111-fe54-47f2-a485-1194e50327aa@kernel.org>
Date: Tue, 28 Oct 2025 21:19:16 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/25] media: i2c: ov01a10: Use native and default for
 pixel-array size names
To: Mehdi Djait <mehdi.djait@linux.intel.com>
Cc: Bingbu Cao <bingbu.cao@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
References: <20251014174033.20534-1-hansg@kernel.org>
 <20251014174033.20534-16-hansg@kernel.org>
 <vkghoohncxnmnuy3zitob62huopp5hpklefgknmc2iuz672hct@f3eebr4emy3n>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <vkghoohncxnmnuy3zitob62huopp5hpklefgknmc2iuz672hct@f3eebr4emy3n>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mehdi,

On 28-Oct-25 8:01 PM, Mehdi Djait wrote:
> Hi Hans,
> 
> On Tue, Oct 14, 2025 at 07:40:23PM +0200, Hans de Goede wrote:
>> According to the OV01A10 product-brief PDF the OV01A10 has an active pixel
>> array size of 1296x816. In otherwords the native and active sizes are
>> the same.
> 
> Isn't that an error in the product-brief ?
> 
> I understood the following:
> 
> The native pixel array size is 1296x816
> The active pixel array size is 1280x800 = these are the active pixels that can
> be output.
> 
> 1296x816 is not lised under the supported image sizes, so it
> is not the active pixel array size.

The list of supported image sizes typically is just plain non-sense.

As the later patch adding arbitrary output sizes shows there really
is nothing special about the listed supported image sizes.

Typically the vendor will provide a set of register values
for the supported image sizes, which is why we see various sensor
drivers with a fixed list of modes/output-sizes with then a long
register-list per mode.

That does not mean those are the only modes the sensor can actually
do since most sensors can do cropping at at least a 2x2 pixel precision
making any mode possible (although cropping away a lot will significantly
change the field-of-view).

Sometimes there may be some rows of dark pixels which are covered
with something which does not allow light to pass through for blacklevel
measurement but that does not appear to be the case here.

If you run the libcamera+softISP stack anmd specifically qcam with this
series then you will get 1292x816 as resolution and there are no black
borders or artifacts at the borders so it can really do 1296x816.

Also see the out of tree ov01a1s driver:

https://github.com/intel/ipu6-drivers/blob/master/drivers/media/i2c/ov01a1s.c

which also has an output width of 1296 pixels.

> I think in most sensors the active pixel array size is smaller than the
> native one.

Sometimes it is because there are e.g. a few rows of pixels
for blacklevel measuring. But often the entire array can be used.

Even if there are extra pixels for blacklevel measurement then
the actual active area typically is still bigger then a standard
resolution like e.hg. 1280x800 as many hardware ISPs typically
also need some extra pixels at the border for Bayer pattern
interpolation / demosaicing.

Regards,

Hans



>>
>> Replace the (misspelled) ACTIVE defines for the default resolution of
>> 1280x800 with DEFAULT to avoid giving the impression that the active pixel
>> array size is only 1280x800.
>>
>> And replace PIXEL_ARRAY with NATIVE to make clear this is the native pixel
>> array size / to match the V4L2_SEL_TGT_NATIVE_SIZE naming.
>>
>> Signed-off-by: Hans de Goede <hansg@kernel.org>
>> ---
>>  drivers/media/i2c/ov01a10.c | 32 ++++++++++++++++----------------
>>  1 file changed, 16 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
>> index d0153e606c9a..f3bcb61c88dd 100644
>> --- a/drivers/media/i2c/ov01a10.c
>> +++ b/drivers/media/i2c/ov01a10.c
>> @@ -34,10 +34,10 @@
>>  #define OV01A10_MODE_STREAMING		0x01
>>  
>>  /* pixel array */
>> -#define OV01A10_PIXEL_ARRAY_WIDTH	1296
>> -#define OV01A10_PIXEL_ARRAY_HEIGHT	816
>> -#define OV01A10_ACITVE_WIDTH		1280
>> -#define OV01A10_ACITVE_HEIGHT		800
>> +#define OV01A10_NATIVE_WIDTH		1296
>> +#define OV01A10_NATIVE_HEIGHT		816
>> +#define OV01A10_DEFAULT_WIDTH		1280
>> +#define OV01A10_DEFAULT_HEIGHT		800
> 
> --
> Kind Regards
> Mehdi Djait


