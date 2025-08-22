Return-Path: <linux-media+bounces-40743-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CAFB314A2
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 12:03:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 897A8B68373
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 10:02:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E640278E67;
	Fri, 22 Aug 2025 10:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g7AniGXc"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD5F1BFE00
	for <linux-media@vger.kernel.org>; Fri, 22 Aug 2025 10:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755857015; cv=none; b=XTlEnILl3d3rRMOSApDhCJGeVF60C5HC65KJyS8/vp08N4OYGxdDkgRfkJBn2BJH1NTZMjLi/LC++5H+RuCumVDtmU94ukBmj4N9q0CBqXBNS0Wy8sWX6YFRZ1IXnUCBiTmFbP0ly0zTBL0WpdeMeLj4iTokw7i6xMPk2+qHxEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755857015; c=relaxed/simple;
	bh=sUeQVDLp9gLQJYskhzIFO1Eo8besKQZVYj6z4R5KwII=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=GoyayDuYri8DCRqBAH/CR3qnCuRD434R/VWoXC2kAsrdtQaPxVsPH1uDWWukK4H+MXcSfp+dbuXByAbfaKrjARrRtEg+Dl95Ps9ZdjDfTV1+oXjW92zMlGjqqbUMSo3y+vZ1TBRq+ij5GNdezzat2cw36GSRYOcQNtVFFwZiunw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g7AniGXc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A496CC4CEED;
	Fri, 22 Aug 2025 10:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755857015;
	bh=sUeQVDLp9gLQJYskhzIFO1Eo8besKQZVYj6z4R5KwII=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=g7AniGXcuBy7sKTImvPlC9eV7GJ9noCnfejlYvZ1SLOU6Psn5nAzcZi2V6l8NP7DN
	 lKUASE6lqxO5svxl7ZGpg4FcKS+ttG9ewFwp+tPUOkLpXjoHW76gDijJU39iyhF7rb
	 +bVSNO2O2AonF3AjLhc71eRZEo23e3iMBC//HLv6E2bQUz1YE4eBST7KGe3bxFg7/D
	 snnmp4dv0wDQsxl2aQdBRRTJhpWnaEtfzVDYfFQVTOQB3GOnO/ILa19kSmNq0PXHAj
	 NpLUMLnLCNVhwR7XrvAKHzQxXTFRpgx/52Mt1JR7KVQHol+bPquNRQt5hY44Rb9Q1Q
	 Y+bhH/P/glnkA==
Message-ID: <7a7d411e-3baa-46eb-94e0-6d642b219580@kernel.org>
Date: Fri, 22 Aug 2025 12:03:31 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v2 0/3] Drop control handler argument support for
 v4l2_get_link_freq()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, Keke Li <keke.li@amlogic.com>,
 Hans Verkuil <hverkuil@kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Mehdi Djait <mehdi.djait@linux.intel.com>,
 Daniel Scally <dan.scally+renesas@ideasonboard.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
References: <20250821121207.552993-1-sakari.ailus@linux.intel.com>
 <20250821124148.GE8865@pendragon.ideasonboard.com>
 <aKcXdDDxzsNZ2Bq2@kekkonen.localdomain>
 <20250821130125.GF8865@pendragon.ideasonboard.com>
 <aKcd9DtPXy7j7yYQ@kekkonen.localdomain>
 <20250821132709.GA1484@pendragon.ideasonboard.com>
 <aKcfjNOvUqlSJ_IH@kekkonen.localdomain>
 <20250821134500.GB1484@pendragon.ideasonboard.com>
Content-Language: en-US, nl
In-Reply-To: <20250821134500.GB1484@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/08/2025 15:45, Laurent Pinchart wrote:
> On Thu, Aug 21, 2025 at 04:30:52PM +0300, Sakari Ailus wrote:
>> On Thu, Aug 21, 2025 at 04:27:09PM +0300, Laurent Pinchart wrote:
>>> On Thu, Aug 21, 2025 at 04:24:04PM +0300, Sakari Ailus wrote:
>>>> On Thu, Aug 21, 2025 at 04:01:25PM +0300, Laurent Pinchart wrote:
>>>>> On Thu, Aug 21, 2025 at 03:56:20PM +0300, Sakari Ailus wrote:
>>>>>> On Thu, Aug 21, 2025 at 03:41:48PM +0300, Laurent Pinchart wrote:
>>>>>>> On Thu, Aug 21, 2025 at 03:12:04PM +0300, Sakari Ailus wrote:
>>>>>>>> Hi folks,
>>>>>>>>
>>>>>>>> This set removes the workaround from v4l2_get_link_freq() that allowed
>>>>>>>> calling it on a control handler. The Amlogic c3-mipi-csi2 driver is
>>>>>>>> converted in the process as well.
>>>>>>>>
>>>>>>>> As a result there's also no definition of v4l2_get_link_freq() without
>>>>>>>> CONFIG_MEDIA_CONTROLLER but that should be fine now. The Amlogic patch is
>>>>>>>> untested.
>>>>>>>
>>>>>>> Could you please cherry-pick
>>>>>>> https://lore.kernel.org/linux-media/20250821000944.27849-2-laurent.pinchart@ideasonboard.com/
>>>>>>> and include it in this series ?
>>>>>>
>>>>>> If a pad is const, I'd expect the container sub-device would be, too. I'll
>>>>>> see if anything breaks if media_entity_to_v4l2_subdev() would switch to use
>>>>>> container_of_const().
>>>>>
>>>>> pad->entity will still not be const, so media_entity_to_v4l2_subdev()
>>>>> will return a non-const pointer anyway.
>>>>
>>>> It may be technically correct but const suggests the argument (and what is
>>>> referred from that) is const henceforth, but that's not the case.
>>>
>>> Yes, and that's why I'm adding a const here. The function retrieves the
>>> link frequency, it should not change the state of the pad, entity or
>>> subdev. That's the meaning conveyed by the API change. Internally, due
>>> to the nature of the C language, we go from a const struct media_pad to
>>> a non-const sturct media_entity. That's fine, it's inside the
>>> v4l2_get_link_freq() function, and it means the function must simply be
>>> careful not to break the API contract. It doesn't change the nature of
>>> the contract.
>>
>> I'd like to have a third opinion here. Hans?
> 
> To make things clear, what this patch does is change the API contract of
> the v4l2_get_link_freq() to tell callers that the function won't modify
> the state of the pad, entity or subdev. The C language doesn't fully
> enforce that, so the compiler won't catch attempts to modify the state
> of those objects inside the implementation of v4l2_get_link_freq().
> 
> It may be interesting to add helper macros to make V4L2 more
> const-correct with enforcement through the compiler. For instance,
> instead of accessing pad->entity directly, we would need a
> media_pad_to_entity() macro that propagates const. That's a separate
> effort though.

For what it is worth: I've no problem with adding the const patch from
Laurent to this series.

Regards,

	Hans

> 
>>>> I simply wouldn't change this. 
> 


