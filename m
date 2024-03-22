Return-Path: <linux-media+bounces-7580-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4102188671F
	for <lists+linux-media@lfdr.de>; Fri, 22 Mar 2024 07:50:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA20328649F
	for <lists+linux-media@lfdr.de>; Fri, 22 Mar 2024 06:50:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6967510958;
	Fri, 22 Mar 2024 06:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QoE+e85I"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE6F111A9
	for <linux-media@vger.kernel.org>; Fri, 22 Mar 2024 06:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711090208; cv=none; b=KpPMEAiAfWqY05PHpEvyaJ4h1kdULnD0w+9aW72w7Pv2SQmo+BNEcrDECWUwUFEsKfBqcrx73si7NR5hN9NOIkH85fA9dy6FCjyFx2uTfWTE6TxrgZeqGeJL03Pr8nnjJffo660bUsJHaP50NOTWs3tOJeJzdCoQOztHHrz6akY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711090208; c=relaxed/simple;
	bh=EZ/1YGLEqh60Q8aXMkLSiDhphOKPnTNSDFAgtpetwtQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ffdskEWPBuGHiUyzgTuc9bjCXnthUerjxKuKFQYtJFds4s3l+kG5ttuShtjhEOrYtxvwuMf4ZmKMHakzs6aYgiSBL03Dk7jIEE3tYRx7bboOn8yMPv00IdKcrcOVuSMWMZgryvZmDdIANPIIz3gkRagWHHCpAoo9Zmm2Ql7fFqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QoE+e85I; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-154-34-181.elisa-laajakaista.fi [91.154.34.181])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 27BA6BEB;
	Fri, 22 Mar 2024 07:49:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711090175;
	bh=EZ/1YGLEqh60Q8aXMkLSiDhphOKPnTNSDFAgtpetwtQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QoE+e85IgSNYEaoKbJZcjuafJP0alj4KIQWtrfkH9KbFWoLyohjmKTKbnB6pc3ODY
	 kGxj/vvnyHF/kyneJm4NioyNcTc6m43rInCI+SQkBBjFS74wCKlQJFHOmyvf/gQulx
	 BWs1ZWInftewG75chadtfUOU7LO/fFXQ5pRlepgc=
Message-ID: <2fbd2ab3-afc8-4791-a83a-a91a8cdd7597@ideasonboard.com>
Date: Fri, 22 Mar 2024 08:50:00 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 03/38] media: uapi: Add generic serial metadata mbus
 formats
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, bingbu.cao@intel.com, hongju.wang@intel.com,
 hverkuil@xs4all.nl, Andrey Konovalov <andrey.konovalov@linaro.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Dmitry Perchanov <dmitry.perchanov@intel.com>,
 "Ng, Khai Wen" <khai.wen.ng@intel.com>,
 Alain Volmat <alain.volmat@foss.st.com>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-4-sakari.ailus@linux.intel.com>
 <ff9d63d0-528a-4afb-a85a-fcb8633fec07@ideasonboard.com>
 <ZfmSzM7kL_Si2pRW@kekkonen.localdomain>
 <4a20047b-559b-4877-8385-d22968499595@ideasonboard.com>
 <20240319223347.GF8501@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20240319223347.GF8501@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/03/2024 00:33, Laurent Pinchart wrote:
> On Tue, Mar 19, 2024 at 04:20:35PM +0200, Tomi Valkeinen wrote:
>> On 19/03/2024 15:27, Sakari Ailus wrote:
>>> On Thu, Mar 14, 2024 at 09:30:50AM +0200, Tomi Valkeinen wrote:
>>>> On 13/03/2024 09:24, Sakari Ailus wrote:
>>>>> Add generic serial metadata mbus formats. These formats describe data
>>>>> width and packing but not the content itself. The reason for specifying
>>>>> such formats is that the formats as such are fairly device specific but
>>>>> they are still handled by CSI-2 receiver drivers that should not be aware
>>>>> of device specific formats. What makes generic metadata formats possible
>>>>> is that these formats are parsed by software only, after capturing the
>>>>> data to system memory.
>>>>>
>>>>> Also add a definition for "Data unit" to cover what is essentially a pixel
>>>>> but is not image data.
>>>>
>>>> The CCS spec talks about legacy packing and optimized packing for 16+ bit
>>>> formats. You cover only the "legacy" ones here. Did you look at those?
>>>
>>> The reason is that the bus data layout of the new packing at higher bit
>>> depth matches with packing at lower bit depths (half to be precise). That's
>>> why there's no need to define formats for the new packing methods at higher
>>> bit depths (the driver simply uses the packing at half of the bit depth).
>>
>> Hmm. If we're capturing 10-bit raw format, say, with the width of 640
>> pixels, we'll configure the video stream format according to those. For
>> the embedded stream, we'll set it to V4L2_META_FMT_GENERIC_CSI2_10 and
>> 640 width, right?
>>
>> If we're capturing 20-bit raw, we'll configure the video stream format
>> again accordingly, width to 640, and 20 bit fourcc/mbus code. If the
>> embedded stream uses the "legacy" packing, we'll set the format to
>> V4L2_META_FMT_GENERIC_CSI2_20 with width of 640, right?
>>
>> But if it's using packed format for the embedded stream, we set the
>> format to V4L2_META_FMT_GENERIC_CSI2_10 and width to 1280?
>>
>> Considering that the video and (line-based) embedded data come from the
>> same source, I'd expect the widths to be the same.
> 
> I don't have a strong objection against multiplying the width, but we
> need to figure out the impact on other kernel space components, as well
> as on userspace. I suppose the media bus code for the embedded data
> stream on the sensor source pad when using optimized packing and
> capturing RAW20 images would be MEDIA_BUS_FMT_META_10 ? In that case I
> think the sensor driver should be able to handle the width calculations
> on its own, and the value would just be propagated by userspace.

Yes, I think it works. I just find it more logical if the widths of both 
the video and embedded streams are the same (which is the case for all 
other embedded formats).

However, even the CCS spec says "for RAW16, RAW20, and/or RAW24 Visible 
pixels, top-embedded data may instead be more optimally packed using 
RAW8, RAW10, and/or RAW12 pixels", so that's in line with what Sakari 
suggests. Although the spec specifically says "top-embedded", so does it 
mean that the optimized data is not allowed for bottom data?

  Tomi


