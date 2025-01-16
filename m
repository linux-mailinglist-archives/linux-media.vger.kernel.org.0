Return-Path: <linux-media+bounces-24833-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CC2A13760
	for <lists+linux-media@lfdr.de>; Thu, 16 Jan 2025 11:05:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C453A1646F0
	for <lists+linux-media@lfdr.de>; Thu, 16 Jan 2025 10:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E13BB1DD9AC;
	Thu, 16 Jan 2025 10:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YMvIePw4"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3978139566;
	Thu, 16 Jan 2025 10:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737021938; cv=none; b=gUosuLJnv33eYwcIjlNULr0kua+QGsnbPay7glcSYLEP+Bhnk2/aPjLDLxXZHWHcsmskdehzPWDCrCSZykITQJYdqY4JIT85xCCjk6oH9qTvTmz3ZepOruonc3gy2xZHcLzS0I/KtvMo6XLdSKA2W71HVjrPIFZ7KZgCX9PmKkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737021938; c=relaxed/simple;
	bh=z8wJtdOhffsKfj1mM3OHQ70mutizLA2iDQi4p9K/OJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OAyXPJSeMuzijWg9xngQIUgfvLnga0IM1POMtfxMSmcdaFgAyxrYWEBC+gMQZ+KJSVKm7//8Q7tyT2VWcmBd4PSvEwvrjhNWwnVjYBSkQ/TWg0haOWPJUbMZhNJgI0IhCfUjEyhKThOroJS5khmkF1KmqqQoBR4XtrbCJOXxJBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YMvIePw4; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C473C169;
	Thu, 16 Jan 2025 11:04:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1737021877;
	bh=z8wJtdOhffsKfj1mM3OHQ70mutizLA2iDQi4p9K/OJk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YMvIePw4pfy5Vv5FmTU8roCP1cUC+6mvLefmANBIaCr0a8AFwkYbBJBzVqIjOTvIY
	 +f21uvl5N/PcwmOGIa3TXlXJxDcNdWdLDKYlPXI5a6nPBE7p81TiAknMIAt5B5TkKh
	 z3U27r2iR7hEc6YaMOmF4M7DN9qdzPA4CJlkeGr4=
Message-ID: <d233005f-a43e-437c-ad8d-2e4505da3593@ideasonboard.com>
Date: Thu, 16 Jan 2025 12:05:31 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/19] media: i2c: ds90ub960: Enable SSCG for UB9702
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, Devarsh Thakkar <devarsht@ti.com>,
 Jai Luthra <jai.luthra@ideasonboard.com>
References: <20250110-ub9xx-improvements-v1-0-e0b9a1f644da@ideasonboard.com>
 <20250110-ub9xx-improvements-v1-16-e0b9a1f644da@ideasonboard.com>
 <Z4fFr-ZgCIFT_PTx@kekkonen.localdomain>
 <fcf3ae9c-37db-4c47-b0d2-800bb24e967d@ideasonboard.com>
 <Z4jYPHQx6C6rQw2U@kekkonen.localdomain>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <Z4jYPHQx6C6rQw2U@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 16/01/2025 11:58, Sakari Ailus wrote:
> Moi,
> 
> On Wed, Jan 15, 2025 at 06:04:40PM +0200, Tomi Valkeinen wrote:
>> On 15/01/2025 16:26, Sakari Ailus wrote:
>>> Moi,
>>>
>>> On Fri, Jan 10, 2025 at 11:14:16AM +0200, Tomi Valkeinen wrote:
>>>> From: Jai Luthra <jai.luthra@ideasonboard.com>
>>>>
>>>> UB9702 supports spread-spectrum clock generation for the back-channel
>>>> clock, which is futher used by serializers in synchronous mode to
>>>> generate the forward-channel clock, which can help reduce peak EMI
>>>> energy. The SSCG is common to all RX ports, so it can only be used if
>>>> all the ports are in the same mode.
>>>>
>>>> Add basic support for SSCG by adding a module parameter to enable the
>>>> SSCG. The SSCG uses hardcoded configurationg, with 0.5% center-spread at
>>>> 33kHz modulation rate. See datasheet if different configuration is
>>>> required.
>>>>
>>>> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
>>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>>>> ---
>>>>    drivers/media/i2c/ds90ub960.c | 102 ++++++++++++++++++++++++++++++++++++++++++
>>>>    1 file changed, 102 insertions(+)
>>>>
>>>> diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
>>>> index f6d6c2fe12cd..a534d077f045 100644
>>>> --- a/drivers/media/i2c/ds90ub960.c
>>>> +++ b/drivers/media/i2c/ds90ub960.c
>>>> @@ -52,6 +52,10 @@
>>>>    #include <media/v4l2-fwnode.h>
>>>>    #include <media/v4l2-subdev.h>
>>>> +static bool ub960_enable_sscg;
>>>> +module_param_named(enable_sscg, ub960_enable_sscg, bool, 0644);
>>>> +MODULE_PARM_DESC(enable_sscg, "Enable SSCG (if available)");
>>>
>>> Shouldn't this come from DT instead?
>>
>> SSCG is an option to use or not to use, based on what the user wants. DT
>> should describe the hardware.
>>
>> A module parameter is bad for this, though, as it's then used for all ub960
>> devices... But I'm not sure what other options we have. We need to have it
>> at probe time.
>>
>> Probably the whole driver could be changed to not connect the serializers at
>> probe, but instead would offer a set of userspace APIs to enable/disable
>> SSCG, and to enable the links. But that brings in its own set of problems,
>> as the links are used for i2c communication to the ser and sensor, not to
>> mention new userspace APIs which always complicates things.
> 
> Typically determining whether you need spread spectrum signalling is highly
> specific to the board. I wonder if this topic has been discussed (and
> possibly somehow resolved) for other subsystems. CSI-2 appears to allow for
> spread spectrum clocks but I don't think I've seen that implemeted
> anywhere, scrambling may be more popular (but also that is right now
> unsupported but could be supported, probably this would be best to consider
> in conjunction with other CSI-2 parameters).

Well, I personally would rather have this option in the DT, so I'm all 
for it =). We can change this to a DT parameter, and see how the DT 
maintainers react.

  Tomi


