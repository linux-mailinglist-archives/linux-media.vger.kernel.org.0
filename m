Return-Path: <linux-media+bounces-22322-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E919DC276
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 12:02:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6004C2829E3
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 11:02:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C6AF1990C0;
	Fri, 29 Nov 2024 11:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fBKXnEy2"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3BF5155726;
	Fri, 29 Nov 2024 11:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732878123; cv=none; b=LWge2jiIZQkoffosYR9MQaw3oywiE3IpicwEUdu3xj+aSEizCpv+LT1Zjv2Mkb+Fpr1R1iEUecFEzPpScTNYmZuS7hTCTHrdPTTsP7SeMWW9CMQfT/F686RDBtRNB8qYkHt415fjudtMFLh7cSS7k46SUafmVeNe741q4IkvlaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732878123; c=relaxed/simple;
	bh=ixtB4ZmYvDoC7rWdLTO0CEmP6GC62rmPzNDUAyMrjuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KtMVou+ioDsXRwFAg2CSu/uEnsA0juv2kyQ5L++0OhG8Zdb7Yf2k5Q6X0ZBabmcubLrLHHnPsePi+tcf2kZJOul9Tr0Xy1x0PS5/2Bq9td5o88PakRtskFVAaQmwMzPQwqGfPBYQ9DtXmFcmB+jxfj18JzMPAefH/4jSA/5JwzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fBKXnEy2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 531A5A8F;
	Fri, 29 Nov 2024 12:01:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732878094;
	bh=ixtB4ZmYvDoC7rWdLTO0CEmP6GC62rmPzNDUAyMrjuk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fBKXnEy2dd3D1WLRPIT3l34keV7TMLp9RK9EmHtobEC8BJzHiacruxoepLVFrrYDE
	 r88nQ1meSr6vO+9KpkqJIx8uyD4KeEHGXWnxybfi25lRsygEN0aD1xszoxoP2Q756C
	 ILZKXCCSJg/P/91qPJRuAcZo4QFQnIU3tTER3UeM=
Date: Fri, 29 Nov 2024 13:01:48 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Ricardo Ribalda <ribalda@chromium.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 2/4] media: uvcvideo: Do not set an async control
 owned by other fh
Message-ID: <20241129110148.GA4108@pendragon.ideasonboard.com>
References: <20241127-uvc-fix-async-v2-0-510aab9570dd@chromium.org>
 <20241127-uvc-fix-async-v2-2-510aab9570dd@chromium.org>
 <20241128222232.GF25731@pendragon.ideasonboard.com>
 <CANiDSCvyMbAffdyi7_TrA0tpjbHe3V_D_VkTKiW-fNDnwQfpGA@mail.gmail.com>
 <20241128223343.GH25731@pendragon.ideasonboard.com>
 <7eeab6bd-ce02-41a6-bcc1-7c2750ce0359@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7eeab6bd-ce02-41a6-bcc1-7c2750ce0359@xs4all.nl>

On Fri, Nov 29, 2024 at 11:36:36AM +0100, Hans Verkuil wrote:
> Hi Laurent, Ricardo,
> 
> On 28/11/2024 23:33, Laurent Pinchart wrote:
> > On Thu, Nov 28, 2024 at 11:28:29PM +0100, Ricardo Ribalda wrote:
> >> On Thu, 28 Nov 2024 at 23:22, Laurent Pinchart wrote:
> >>>
> >>> Hi Ricardo,
> >>>
> >>> (CC'ing Hans Verkuil)
> >>>
> >>> Thank you for the patch.
> >>>
> >>> On Wed, Nov 27, 2024 at 12:14:50PM +0000, Ricardo Ribalda wrote:
> >>>> If a file handle is waiting for a response from an async control, avoid
> >>>> that other file handle operate with it.
> >>>>
> >>>> Without this patch, the first file handle will never get the event
> >>>> associated with that operation, which can lead to endless loops in
> >>>> applications. Eg:
> >>>> If an application A wants to change the zoom and to know when the
> >>>> operation has completed:
> >>>> it will open the video node, subscribe to the zoom event, change the
> >>>> control and wait for zoom to finish.
> >>>> If before the zoom operation finishes, another application B changes
> >>>> the zoom, the first app A will loop forever.
> >>>
> >>> Hans, the V4L2 specification isn't very clear on this. I see pros and
> >>> cons for both behaviours, with a preference for the current behaviour,
> >>> as with this patch the control will remain busy until the file handle is
> >>> closed if the device doesn't send the control event for any reason. What
> >>> do you think ?
> >>
> >> Just one small clarification. The same file handler can change the
> >> value of the async control as many times as it wants, even if the
> >> operation has not finished.
> >>
> >> It will be other file handles that will get -EBUSY if they try to use
> >> an async control with an unfinished operation started by another fh.
> > 
> > Yes, I should have been more precised. If the device doesn't send the
> > control event, then all other file handles will be prevented from
> > setting the control until the file handle that set it first gets closed.
> 
> I think I need a bit more background here:
> 
> First of all, what is an asynchronous control in UVC? I think that means
> you can set it, but it takes time for that operation to finish, so you
> get an event later when the operation is done. So zoom and similar operations
> are examples of that.

Correct. Physical PTZ (pan/tilt/zoom) is the prime use case. The UVC
specification states that any control that requires more than 10ms to
respond to a SET_CUR request must be reported by the device as an
asynchronous control, but does not tell which control must or must not
be asynchronous.

> And only when the operation finishes will the control event be sent, correct?

Correct.

> While the operation is ongoing, if you query the control value, is that reporting
> the current position or the final position?

The UVC specification indicates that a GET_CUR or SET_CUR request on an
asynchronous control will stall until the control value has been
applied. This means you won't be able to poll the control value.

In practice, devices often take liberties with the implementation of the
specification, so some may let you get or set the value of an
asynchronous control while a SET_CUR request is in progress.

> E.g.: the zoom control is at value 0 and I set it to 10, then I poll the zoom control
> value: will that report the intermediate values until it reaches 10? And when it is
> at 10, the control event is sent?
>
> >>>> Cc: stable@vger.kernel.org
> >>>> Fixes: e5225c820c05 ("media: uvcvideo: Send a control event when a Control Change interrupt arrives")
> >>>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> >>>> ---
> >>>>  drivers/media/usb/uvc/uvc_ctrl.c | 4 ++++
> >>>>  1 file changed, 4 insertions(+)
> >>>>
> >>>> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> >>>> index b6af4ff92cbd..3f8ae35cb3bc 100644
> >>>> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> >>>> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> >>>> @@ -1955,6 +1955,10 @@ int uvc_ctrl_set(struct uvc_fh *handle,
> >>>>       if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR))
> >>>>               return -EACCES;
> >>>>
> >>>> +     /* Other file handle is waiting a response from this async control. */
> >>>> +     if (ctrl->handle && ctrl->handle != handle)
> >>>> +             return -EBUSY;
> >>>> +
> >>>>       /* Clamp out of range values. */
> >>>>       switch (mapping->v4l2_type) {
> >>>>       case V4L2_CTRL_TYPE_INTEGER:

-- 
Regards,

Laurent Pinchart

