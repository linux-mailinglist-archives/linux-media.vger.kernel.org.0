Return-Path: <linux-media+bounces-13396-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E0490A7E0
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 09:56:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 74F551F247C6
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 07:56:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF1DA190045;
	Mon, 17 Jun 2024 07:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MvUV29Of"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78897186289;
	Mon, 17 Jun 2024 07:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718611009; cv=none; b=FDWV01oSoupgW4O0FYlh6CKt1Q+MUzSGTSb8Xh6Hutn6qrnLWUwLOtfhqQennoZAuheQ9NYTY+fcGnFvfhi9WGCygb+qjZspxy0oc9VvpLGNOaxXScOLWxRHzlOKmfyn6rnd8Ci3mss6hYriX2v88eFc5A4KPc2TphtDeWIH8jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718611009; c=relaxed/simple;
	bh=6zuUFowqbdrURbyvPyFjc2iRmnUSh60QHDoYynCVEA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G8gm0pYLPquMeNrIn0LlojN0YhTfP/AyQsmFV92q46WCVl70hPkI9F1shcVAQjkcwGaMz5LtQz0EvS8lLRu0kgi89euIoT+yOFMV1zZwYoGBXkgaclVcAzPhLyq4Ap21Vk4Qhbxf+dVKbHml7i0R0W6jd7Oq2mQuxl6Ao+YKStU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MvUV29Of; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718611007; x=1750147007;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=6zuUFowqbdrURbyvPyFjc2iRmnUSh60QHDoYynCVEA4=;
  b=MvUV29Ofi0Safg+brn+EqQdCPe7FxhTkeXLZgiSNh0NG4mH/p5Fyfw3d
   39vH5K2cj+Bk6H6Gzejw23ohnGuqfEOid8EObdefqMjY5BJbOOJTpgcSl
   IdmmiubH7qMzv3ruHPtEAottSomQzcY4C3dbxhARnYOdBsmPOZZXdydKV
   MnzuK40CV1j69jhPSmACRUL0QuynNBbhuY+zF9l6RkqnUVGW8R9CsOdPG
   UtrB9Ks56DyEaZsGJwKxPGIMt88rXUwV3ltdF3bPZMjIen77SXpg0tq/S
   xnbZiz8D6NG0f08RAEAm+4BxgDJu2u5GprdRWYkLn19lof5gPJO9Qte/e
   w==;
X-CSE-ConnectionGUID: qV9EqZVVSHu12gH/n7oyTQ==
X-CSE-MsgGUID: cy6RrmvASa+MHbsFPRlARg==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="26004293"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="26004293"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 00:56:46 -0700
X-CSE-ConnectionGUID: bznWuFOlRZ6yqKzPAk53FQ==
X-CSE-MsgGUID: q3yR2XmgR6uZevb4hUiMHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="46051128"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 00:56:43 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 096BC11F7E1;
	Mon, 17 Jun 2024 10:56:40 +0300 (EEST)
Date: Mon, 17 Jun 2024 07:56:39 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Tomasz Figa <tfiga@chromium.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Max Staudt <mstaudt@chromium.org>,
	Alan Stern <stern@rowland.harvard.edu>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, Sean Paul <seanpaul@chromium.org>
Subject: Re: [PATCH v4 1/4] media: uvcvideo: stop stream during unregister
Message-ID: <Zm_sN3Ta7MrjGrQL@kekkonen.localdomain>
References: <20240327-guenter-mini-v4-0-49955c198eae@chromium.org>
 <20240327-guenter-mini-v4-1-49955c198eae@chromium.org>
 <CAAFQd5BhJExCEA7_Ck2skWR52baSDH63-+oEZnpo4UiMc0C7=A@mail.gmail.com>
 <20240616235844.GO4782@pendragon.ideasonboard.com>
 <54cb2795-bcb3-40c8-841c-4570d857d366@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <54cb2795-bcb3-40c8-841c-4570d857d366@xs4all.nl>

Hi Hans,

On Mon, Jun 17, 2024 at 09:27:43AM +0200, Hans Verkuil wrote:
> On 17/06/2024 01:58, Laurent Pinchart wrote:
> > Hi Tomasz,
> > 
> > On Thu, Jun 06, 2024 at 06:57:50PM +0900, Tomasz Figa wrote:
> >> On Wed, Mar 27, 2024 at 5:24 PM Ricardo Ribalda wrote:
> >>>
> >>> uvc_unregister_video() can be called asynchronously from
> >>> uvc_disconnect(). If the device is still streaming when that happens, a
> >>> plethora of race conditions can happen.
> >>>
> >>> Make sure that the device has stopped streaming before exiting this
> >>> function.
> >>>
> >>> If the user still holds handles to the driver's file descriptors, any
> >>> ioctl will return -ENODEV from the v4l2 core.
> >>>
> >>> This change make uvc more consistent with the rest of the v4l2 drivers
> >>> using the vb2_fop_* and vb2_ioctl_* helpers.
> >>>
> >>> Suggested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> >>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> >>> ---
> >>>  drivers/media/usb/uvc/uvc_driver.c | 11 +++++++++++
> >>>  1 file changed, 11 insertions(+)
> >>
> >> First of all, thanks for the patch. I have a question about the
> >> problem being fixed here.
> >>
> >> Could you point out a specific race condition example that could
> >> happen without this change?
> >> From what I see in __video_do_ioctl((), no ioctls would be executed
> >> anymore after the video node is unregistered.
> >> Since the device is not present either, what asynchronous code paths
> >> could be still triggered?
> > 
> > I believe the issue is that some ioctls can be in progress while the
> > device is unregistered. I'll let Ricardo confirm.
> > 
> > I've tried to explain multiple times before that this should be handled
> > in the V4L2 core, ideally with fixes in the cdev core too, as this issue
> > affects all cdev drivers. I've pointed to related patches that have been
> > posted for the cdev core. They need to be wrapped in V4L2 functions to
> > make them easier to use for drivers. If we don't want to depend on those
> > cdev changes, we can implement the "wrappers" with fixes limited to
> > V4L2 until the cdev changes get merged (assuming someone would resurect
> > them).
> 
> But there is already a V4L2 wrapper for that: vb2_video_unregister_device().
> It safely unregisters the video device, ensuring any in-flight ioctls finish
> first, and it stops any video streaming.
> 
> The only reason it can't be used in uvc for the video stream is that that
> vb2_queue doesn't set the lock field (i.e. uses the core V4L2 serialization
> mechanism). The metadata stream *does* set that field, so for that stream this
> function can be used.
> 
> While it would be nice to have this fixed in the cdev core part, that will
> take very long, and we have a perfectly fine V4L2 helper for this already.

It might not take *that* long to get there but it won't happen unless
someone does it. Dan Williams posted a patch but his immediate problem was
solved differently so there it remains
<URL:https://lore.kernel.org/all/161117153248.2853729.2452425259045172318.stgit@dwillia2-desk3.amr.corp.intel.com/>.

In the meantime vb_video_unregister_device() would seem to be the best
choice.

-- 
Regards,

Sakari Ailus

