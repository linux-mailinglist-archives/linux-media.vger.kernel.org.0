Return-Path: <linux-media+bounces-22324-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 145D79DC284
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 12:07:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 698DCB22168
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 11:07:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAEBF1990BB;
	Fri, 29 Nov 2024 11:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qxxpXQsA"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8C3155726;
	Fri, 29 Nov 2024 11:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732878414; cv=none; b=WAqwSevw0g43u+rV4CTgMl4InYf2QN+FBwquRfgQQTFgpPpMxQRNpfu8Sag4v4h6Jxj6Jw00ptc9HHH+OcJh+Iij+P70iYE7+U+GJD3xEIGBCd2Amq61KTQXJiJhsY3/x5UZGelpKeAwns6k5cGMiXqEj5SYQ5o45T6vDfc7e1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732878414; c=relaxed/simple;
	bh=TwdrBaS4qYS6OdOtx8q9Yeagwt8UgVRcTEqq9YSfMBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n1uhqG7BbsI4f9GQcd76mq+yGSSogNALnj5GSoFuJmnXJa0LpD+rYVdgT+/+ZpSihgYueTse9qxMqzPW5XezX+GOQZruxUqTvT2oEJpoMfBwk/jBSEf3xOf5cIPiQUC6Vu1e1nHnBvMiJxuoi2anib/7yscEJNZtRVCsA5SjiEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qxxpXQsA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 469E7A8F;
	Fri, 29 Nov 2024 12:06:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732878386;
	bh=TwdrBaS4qYS6OdOtx8q9Yeagwt8UgVRcTEqq9YSfMBc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qxxpXQsA+neGZrBhgXAjDjR7ecZQv87V4hi+PuFEC0EtZC4tTdf/sEmYL5SKXenKc
	 dCyPI9qK9WzNVqmhOs/ZtDFWNeTbJhj0u5OIPUlmoI0ATGmHk1gp7l2lcrT06H7Vez
	 KwcIIDX+QcV3IFgKX2CluVcPheiAQ09ItDPhcvFY=
Date: Fri, 29 Nov 2024 13:06:40 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 2/4] media: uvcvideo: Do not set an async control
 owned by other fh
Message-ID: <20241129110640.GB4108@pendragon.ideasonboard.com>
References: <20241127-uvc-fix-async-v2-0-510aab9570dd@chromium.org>
 <20241127-uvc-fix-async-v2-2-510aab9570dd@chromium.org>
 <20241128222232.GF25731@pendragon.ideasonboard.com>
 <CANiDSCvyMbAffdyi7_TrA0tpjbHe3V_D_VkTKiW-fNDnwQfpGA@mail.gmail.com>
 <20241128223343.GH25731@pendragon.ideasonboard.com>
 <7eeab6bd-ce02-41a6-bcc1-7c2750ce0359@xs4all.nl>
 <CANiDSCseF3fsufMc-Ovoy-bQH85PqfKDM+zmfoisLw+Kq1biAw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCseF3fsufMc-Ovoy-bQH85PqfKDM+zmfoisLw+Kq1biAw@mail.gmail.com>

On Fri, Nov 29, 2024 at 11:59:27AM +0100, Ricardo Ribalda wrote:
> On Fri, 29 Nov 2024 at 11:36, Hans Verkuil wrote:
> > On 28/11/2024 23:33, Laurent Pinchart wrote:
> > > On Thu, Nov 28, 2024 at 11:28:29PM +0100, Ricardo Ribalda wrote:
> > >> On Thu, 28 Nov 2024 at 23:22, Laurent Pinchart wrote:
> > >>>
> > >>> Hi Ricardo,
> > >>>
> > >>> (CC'ing Hans Verkuil)
> > >>>
> > >>> Thank you for the patch.
> > >>>
> > >>> On Wed, Nov 27, 2024 at 12:14:50PM +0000, Ricardo Ribalda wrote:
> > >>>> If a file handle is waiting for a response from an async control, avoid
> > >>>> that other file handle operate with it.
> > >>>>
> > >>>> Without this patch, the first file handle will never get the event
> > >>>> associated with that operation, which can lead to endless loops in
> > >>>> applications. Eg:
> > >>>> If an application A wants to change the zoom and to know when the
> > >>>> operation has completed:
> > >>>> it will open the video node, subscribe to the zoom event, change the
> > >>>> control and wait for zoom to finish.
> > >>>> If before the zoom operation finishes, another application B changes
> > >>>> the zoom, the first app A will loop forever.
> > >>>
> > >>> Hans, the V4L2 specification isn't very clear on this. I see pros and
> > >>> cons for both behaviours, with a preference for the current behaviour,
> > >>> as with this patch the control will remain busy until the file handle is
> > >>> closed if the device doesn't send the control event for any reason. What
> > >>> do you think ?
> > >>
> > >> Just one small clarification. The same file handler can change the
> > >> value of the async control as many times as it wants, even if the
> > >> operation has not finished.
> > >>
> > >> It will be other file handles that will get -EBUSY if they try to use
> > >> an async control with an unfinished operation started by another fh.
> > >
> > > Yes, I should have been more precised. If the device doesn't send the
> > > control event, then all other file handles will be prevented from
> > > setting the control until the file handle that set it first gets closed.
> >
> > I think I need a bit more background here:
> >
> > First of all, what is an asynchronous control in UVC? I think that means
> > you can set it, but it takes time for that operation to finish, so you
> > get an event later when the operation is done. So zoom and similar operations
> > are examples of that.
> >
> > And only when the operation finishes will the control event be sent, correct?
> 
> You are correct.  This diagrams from the spec is more or less clear:
> https://ibb.co/MDGn7F3
> 
> > While the operation is ongoing, if you query the control value, is that reporting
> > the current position or the final position?
> 
> I'd expect hardware will return either the current position, the start
> position or the final position. I could not find anything in the spec
> that points in one direction or the others.

Figure 2-21 in UVC 1.5 indicates that the device should STALL the
GET_CUR and SET_CUR requests if a state change is in progress.

> And in the driver I believe that we might have a bug handling this
> case (will send a patch if I can confirm it)
> the zoom is at 0 and you set it 10
> if you read the value 2 times before the camera reaches value 10:
> - First value will come from the hardware and the response will be cached

Only if the control doesn't have the auto-update flag set, so it will be
device-dependent. As GET_CUR should stall that's not really relevant,
except for the fact that devices may not stall the request.

> - Second value will be the cached one
> 
> now the camera  is at zoom 10
> If you read the value, you will read the cached value
>
> > E.g.: the zoom control is at value 0 and I set it to 10, then I poll the zoom control
> > value: will that report the intermediate values until it reaches 10? And when it is
> > at 10, the control event is sent?
> >
> > >>>> Cc: stable@vger.kernel.org
> > >>>> Fixes: e5225c820c05 ("media: uvcvideo: Send a control event when a Control Change interrupt arrives")
> > >>>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > >>>> ---
> > >>>>  drivers/media/usb/uvc/uvc_ctrl.c | 4 ++++
> > >>>>  1 file changed, 4 insertions(+)
> > >>>>
> > >>>> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > >>>> index b6af4ff92cbd..3f8ae35cb3bc 100644
> > >>>> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > >>>> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > >>>> @@ -1955,6 +1955,10 @@ int uvc_ctrl_set(struct uvc_fh *handle,
> > >>>>       if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR))
> > >>>>               return -EACCES;
> > >>>>
> > >>>> +     /* Other file handle is waiting a response from this async control. */
> > >>>> +     if (ctrl->handle && ctrl->handle != handle)
> > >>>> +             return -EBUSY;
> > >>>> +
> > >>>>       /* Clamp out of range values. */
> > >>>>       switch (mapping->v4l2_type) {
> > >>>>       case V4L2_CTRL_TYPE_INTEGER:

-- 
Regards,

Laurent Pinchart

