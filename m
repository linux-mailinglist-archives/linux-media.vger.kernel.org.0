Return-Path: <linux-media+bounces-18343-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7EE97B1C5
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2024 17:29:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3FBAE1F2120E
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2024 15:29:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A95B51953A9;
	Tue, 17 Sep 2024 15:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JOfmJQoa"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BEC8194A6B
	for <linux-media@vger.kernel.org>; Tue, 17 Sep 2024 15:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726585210; cv=none; b=tEbf6FqplKnu/tt0mgB5OKDfttx2BFwnN3mfOfMNmHzuGJiu6fikPwDdbkAHGPjNb+pqjc0Z9iw9yywYED4PHeAu4KhLiTyKE6oNhoFPUnghwkVZnmvja1sjv0br9jebtdhHfEBonMfXss421RKcCh1AUBDHYnIz6KVDV4DsC6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726585210; c=relaxed/simple;
	bh=VZ9bXCFnmkKpWobUfxgo+hPq8aub+xLZXdZcKPHlvEg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C/fG8hUADF7U4TvAykpdg+OFHJa5FvzUkI2whzBL2M8Ig32tOds4uVWaZb7Efh+ti/5S6EH0sGMMz29B/Jc8eakl/QGYyByVmh5UY7X+CmNAJepfsxhLM+jVpE7LrIXAYiWZlkgM2FSMnPmmMYRxF7uXD1e1QE7kmtpWuYJGMnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JOfmJQoa; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-156-87-48.elisa-laajakaista.fi [91.156.87.48])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C658A514;
	Tue, 17 Sep 2024 16:58:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1726585125;
	bh=VZ9bXCFnmkKpWobUfxgo+hPq8aub+xLZXdZcKPHlvEg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JOfmJQoaUq2QDm7sxDEBVqQRshEKvJBg0mrqEnJFPQM8rRoCQb/xCgFa3CE7wlIsP
	 i2sEDrT34pkAl8f72xGWONvpIB9h9w2jTrhF+7ht11MLSOgun2eTM3RbthwxiPeus3
	 Ir5vL1ukMwoe+Ngb0OB9Aw77V2QBXeU0ntSrWg6g=
Message-ID: <ed4a9eb3-c785-4382-a914-87f33c45acb1@ideasonboard.com>
Date: Tue, 17 Sep 2024 18:00:03 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: Documentation: Update {enable,disable}_streams
 documentation
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 Alain Volmat <alain.volmat@foss.st.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, hverkuil@xs4all.nl
References: <20240917124345.16681-1-sakari.ailus@linux.intel.com>
 <20240917124345.16681-2-sakari.ailus@linux.intel.com>
 <20240917130047.GC17350@pendragon.ideasonboard.com>
 <61a0d763-2a6f-48f7-9439-3cc8102cb803@ideasonboard.com>
 <20240917145735.GE17350@pendragon.ideasonboard.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20240917145735.GE17350@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/09/2024 17:57, Laurent Pinchart wrote:
> On Tue, Sep 17, 2024 at 05:16:25PM +0300, Tomi Valkeinen wrote:
>> On 17/09/2024 16:00, Laurent Pinchart wrote:
>>> On Tue, Sep 17, 2024 at 03:43:45PM +0300, Sakari Ailus wrote:
>>>> Document the expected {enable,disable}_streams callback behaviour for
>>>> drivers that are stream-unaware i.e. don't specify the
>>>> V4L2_SUBDEV_CAP_STREAMS sub-device capability flat. In this specific case,
>>>> the mask argument can be ignored.
>>>
>>> Wouldn't it be better to use BIT(0) in that case to simplifiy
>>> interoperability with stream-aware devices ?
>>
>> The caller has to set BIT(0), but I think here the documentation is
>> about the callee.
>>
>> If the driver is not stream aware and implements the callbacks, it will
>> get BIT(0) as the mask parameter (do we enforce this?), but as there's
>> nothing it can do with the parameter it "does not need to be concerned
>> with the mask argument".
> 
> Right. I had misunderstood the patch.
> 
>>>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>>>> ---
>>>>    include/media/v4l2-subdev.h | 8 ++++++++
>>>>    1 file changed, 8 insertions(+)
>>>>
>>>> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
>>>> index 3cc6b4a5935f..67a6e6ec58b8 100644
>>>> --- a/include/media/v4l2-subdev.h
>>>> +++ b/include/media/v4l2-subdev.h
>>>> @@ -834,11 +834,19 @@ struct v4l2_subdev_state {
>>>>     *	v4l2_subdev_init_finalize() at initialization time). Do not call
>>>>     *	directly, use v4l2_subdev_enable_streams() instead.
>>>>     *
>>>> + *	Drivers that support only a single stream without setting the
>>>> + *	V4L2_SUBDEV_CAP_STREAMS sub-device capatility flag do not need to
> 
> s/capatility/capability/
> 
> Same below.
> 
>>>> + *	be concerned with the mask argument.
> 
> How about "can ignore the mask argument" instead ? I interpreted as "not
> need to be concerned with" from the point of view of the caller.

Or maybe, to be transparent, "can ignore the mask argument as it is 
always 1".

  Tomi


