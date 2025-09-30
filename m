Return-Path: <linux-media+bounces-43411-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E2BBABD50
	for <lists+linux-media@lfdr.de>; Tue, 30 Sep 2025 09:31:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D19B1189DB54
	for <lists+linux-media@lfdr.de>; Tue, 30 Sep 2025 07:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 954322BEC53;
	Tue, 30 Sep 2025 07:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hs/u04B5"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9AD32BE7A7;
	Tue, 30 Sep 2025 07:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759217460; cv=none; b=hvM3SS+Yj6LEVY8KlXY179fBgv2kSoa2E8YhPJVfZdbyiudKrMzkb4tWQQzNvcW844lD/3znJ/jdbsMAhltFFISazm+Ulya8cqlP4dAQCAVkgyx3gN7xY4fgAZmJdI0YFr+9DLlxij5z9lz57fvjCv4F+mEVDQpKq5iEc0dVa/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759217460; c=relaxed/simple;
	bh=ViYV65AZcIp1SdYamrftx+FDdb1Xx0jipTI6UYaCuf0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=G4peUf3f4tfzzeMjIgStqWkOvP8tEVaxJrMFFfNPRJ4+fdicklL2LIg900XLI/lMwoLxKYIn5Ez+80RvD6jg4m8VjhQ5CcBWS/lfLLi3zg1AAIHMfljU15/3HROx9N/2KXra/i0k5NDgqo0QjGlIN0JZvwOD2RdCeYwPzeS6U34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hs/u04B5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4492EC4CEF0;
	Tue, 30 Sep 2025 07:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759217459;
	bh=ViYV65AZcIp1SdYamrftx+FDdb1Xx0jipTI6UYaCuf0=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=Hs/u04B5gasxxeQWSu/TKDI0cn1EA6jKRL4QCmDEMNEC/jCupmRQ5DFOzlXLsP5N3
	 Si2MDPZ8UdbEQ0e8RTrDEN7wONVTPnzOIpITiZec3ghZtJbeUqUdMm4X07AyrwpymF
	 Y50C4EKH5VQykf6DDpfzsAubW4mL5O3xgnFr4VKRbtg30MhDMr0ausLTAeqKVskiqv
	 lxE/rpY/XDvmyq0FfWYnUqjv8vhRNaQdmLaLo9TIrPTYAPvtGCesO2DBUIvQvc1NHV
	 UbU4ankKxlHwUGhxjLZhVqnFQXFTJ3rNHBRUK/F1TSHFqrSC79FYIQ9lsJIkAfhSK2
	 JY++8moJFSbyQ==
Message-ID: <006000c4-7ecd-474f-ac0c-90c7b0606506@kernel.org>
Date: Tue, 30 Sep 2025 09:30:55 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v2 02/10] media: v4l2-dev: Add support for try state
To: Jai Luthra <jai.luthra@ideasonboard.com>,
 Hans Verkuil <hverkuil@kernel.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, linux-media@vger.kernel.org
Cc: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Ma Ke <make24@iscas.ac.cn>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-kernel@vger.kernel.org
References: <20250919-vdev-state-v2-0-b2c42426965c@ideasonboard.com>
 <20250919-vdev-state-v2-2-b2c42426965c@ideasonboard.com>
 <3eef0f98-c34a-4b67-97f4-d60cd1eab8ad@kernel.org>
 <16f45860-923b-4b5d-995e-0729d0479752@kernel.org>
 <175916253442.2234821.5624749898039510125@freya>
Content-Language: en-US, nl
In-Reply-To: <175916253442.2234821.5624749898039510125@freya>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/09/2025 18:15, Jai Luthra wrote:
> Hi Hans,
> 
> Quoting Hans Verkuil (2025-09-22 13:28:26)
>> On 22/09/2025 09:52, Hans Verkuil wrote:
>>> On 19/09/2025 11:55, Jai Luthra wrote:
>>>> Format negotiation performed via the TRY_FMT ioctl should only affect
>>>> the temporary context of a specific filehandle, not the active state
>>>> stored in the video device structure. To support this distinction, we
>>>> need separate storage for try and active states.
>>>>
>>>> Introduce an enum to distinguish between these two state types and store
>>>> the try state in struct v4l2_fh instead of the video device structure.
>>>> The try state is allocated during file handle initialization in
>>>> v4l2_fh_init() and released in v4l2_fh_exit().
>>>
>>> There is a major difference between TRY in video devices and TRY in subdev
>>> devices: TRY for video devices is not persistent, i.e. it doesn't need to
>>> be stored anywhere since nobody will be using that information.
>>>
> 
> Yes, the v4l2 format sent with VIDIOC_TRY_FMT is currently not stored by
> the drivers, but simply modified and returned back to userspace. From the
> userspace point of view, that should still work the same way with this
> series.
> 
> The drivers will get access to the correct state (active) for internal use
> through framework helpers (that will be introduced in next revision), so
> the try state doesn't have any real "use" today.
> 
>>> If the plan is to change that in later patch series, then that should be
>>> very clearly stated. And I think I would need to know the details of those
>>> future plans before I can OK this.
>>>
>>> So how is this try state intended to be used in the future?
>>
>> Follow-up: if there are no plans to change/enhance the VIDIOC_TRY_FMT semantics,
>> then I don't really see the point of this since there is no need to store this
>> information.
> 
> There are no plans to change the userspace side of this. The main
> motivation to allocate and keep a try state in the framework is to simplify
> the driver implementation. A single function can serve as both s_fmt and
> try_fmt ioctl handler, and operate on the passed state argument without
> caring if it will be applied on the device or just for negotiation.
> 
> In future, drivers may subclass the state with their device specific data,
> so that nothing tied to the hardware state is stored in the driver
> structures directly, but I don't see why drivers will need to inspect TRY
> formats.

I think having an unused try state is a bad idea and really confusing.

Especially because for subdevices the try state is actually used, so
for normal devices you would automatically expect the same thing when
you see a try state.

You should reconsider this approach.

Regards,

	Hans

