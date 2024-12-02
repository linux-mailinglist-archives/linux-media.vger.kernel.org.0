Return-Path: <linux-media+bounces-22395-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8CF9DF783
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 01:19:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10A352818F7
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 00:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 989D68F62;
	Mon,  2 Dec 2024 00:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LoDpXO/f"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40514A01;
	Mon,  2 Dec 2024 00:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733098748; cv=none; b=jl0u/G0hsFbV2Ac/kZW06f4etwiPPJpqJjEzZVM69J4KaIdDDkZ9l03VnMp3c+5rUVif7uyMWEF2usWl2vQEwWgtUTfNWcVrWwHhI0cg3IA2jiLgPHIhmf/kTmPnEvApXklX7H+hb89/sapNYJp/RTfwsDy0US9pREkDIpEEfBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733098748; c=relaxed/simple;
	bh=uKByVRGJnnD8SRISLfagtyDrkyUPbnDvC+iinYG8u/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BbW/9EGb50h0yLl//vLUorMmY0SObCHvbDb9vD0vzC3fganoc2V9MqtB0I5WWTvK9liOy3AdXKjH1BNCSixa8qF3kgurAwluETo6jbvjoGCY3BA1fuAMkdoqCYEsQmPBlTyK+YycgxfIlvAQRPhHEnqTcDj/PNUW5MbdlJeHpQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LoDpXO/f; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9096E827;
	Mon,  2 Dec 2024 01:18:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733098711;
	bh=uKByVRGJnnD8SRISLfagtyDrkyUPbnDvC+iinYG8u/Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LoDpXO/fAdtjl6KsyvTZ0gKNlzB66XsWgwm658uIF9cpe4JelQC9frf1th3Tq2Kiy
	 ASzl3KDxZWDnn/RWFmiB8YODWhbPbd1y/wmAUs7ihh6z5DB6UcrXu7whLu6iUoxhQV
	 C+gzXWPDm4SJGQOg0iJAiRX+5x3kIw4Q2jutIzcY=
Date: Mon, 2 Dec 2024 02:18:46 +0200
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
Message-ID: <20241202001846.GD6105@pendragon.ideasonboard.com>
References: <20241128223343.GH25731@pendragon.ideasonboard.com>
 <7eeab6bd-ce02-41a6-bcc1-7c2750ce0359@xs4all.nl>
 <CANiDSCseF3fsufMc-Ovoy-bQH85PqfKDM+zmfoisLw+Kq1biAw@mail.gmail.com>
 <20241129110640.GB4108@pendragon.ideasonboard.com>
 <CANiDSCvdjioy-OgC+dHde2zHAAbyfN2+MAY+YsLNdUSawjQFHw@mail.gmail.com>
 <e95b7d74-2c56-4f5a-a2f2-9c460d52fdb4@xs4all.nl>
 <CANiDSCvj4VVAcQOpR-u-BcnKA+2ifcuq_8ZML=BNOHT_55fBog@mail.gmail.com>
 <CANiDSCvwzY3DJ+U3EyzA7TCQu2qMUL6L1eTmZYbM+_Tk6DsPaA@mail.gmail.com>
 <20241129220339.GD2652@pendragon.ideasonboard.com>
 <CANiDSCsXi-WQLpbeXMat5FoM8AnYoJ0nVeCkTDMvEus8pXCC3w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCsXi-WQLpbeXMat5FoM8AnYoJ0nVeCkTDMvEus8pXCC3w@mail.gmail.com>

On Fri, Nov 29, 2024 at 11:18:54PM +0100, Ricardo Ribalda wrote:
> On Fri, 29 Nov 2024 at 23:03, Laurent Pinchart wrote:
> > On Fri, Nov 29, 2024 at 07:47:31PM +0100, Ricardo Ribalda wrote:
> > > Before we all go on a well deserved weekend, let me recap what we
> > > know. If I did not get something correctly, let me know.
> > >
> > > 1) Well behaved devices do not allow to set or get an incomplete async
> > > control. They will stall instead (ref: Figure 2-21 in UVC 1.5 )
> > > 2) Both Laurent and Ricardo consider that there is a big chance that
> > > some camera modules do not implement this properly. (ref: years of
> > > crying over broken module firmware :) )
> > >
> > > 3) ctrl->handle is designed to point to the fh that originated the
> > > control. So the logic can decide if the originator needs to be
> > > notified or not. (ref: uvc_ctrl_send_event() )
> > > 4) Right now we replace the originator in ctrl->handle for unfinished
> > > async controls.  (ref:
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/usb/uvc/uvc_ctrl.c#n2050)
> > >
> > > My interpretation is that:
> > > A) We need to change 4). We shall not change the originator of
> > > unfinished ctrl->handle.
> > > B) Well behaved cameras do not need the patch "Do not set an async
> > > control owned by another fh"
> > > C) For badly behaved cameras, it is fine if we slightly break the
> > > v4l2-compliance in corner cases, if we do not break any internal data
> > > structure.
> >
> > The fact that some devices may not implement the documented behaviour
> > correctly may not be a problem. Well-behaved devices will stall, which
> > means we shouldn't query the device while as async update is in
> > progress. Badly-behaved devices, whatever they do when queried, should
> > not cause any issue if we don't query them.
> 
> I thought we could detect the stall and return safely. Isn't that the case?

We could, but if we know the device will stall anyway, is there a reason
not to avoid issuing the request in the first place ?

> Why we have not seen issues with this?

I haven't tested a PTZ device for a very long time, and you would need
to hit a small time window to see the issue.

> > We should not send GET_CUR and SET_CUR requests to the device while an
> > async update is in progress, and use cached values instead. When we
> > receive the async update event, we should clear the cache. This will be
> > the same for both well-behaved and badly-behaved devices, so we can
> > expose the same behaviour towards userspace.
> 
> seting ctrl->loaded = 0 when we get an event sounds like a good idea
> and something we can implement right away.
> If I have to resend the set I will add it to the end.
> 
> > We possibly also need some kind of timeout mechanism to cope with the
> > async update event not being delivered by the device.
> 
> This is the part that worries me the most:
> - timeouts make the code fragile
> - What is a good value for timeout? 1 second, 30, 300? I do not think
> that we can find a value.

I've been thinking about the implementation of uvc_fh cleanup over the
weekend, and having a timeout would have the nice advantage that we
could reference-count uvc_fh instead of implementing a cleanup that
walks over all controls when closing a file handle. I think it would
make the code simpler, and possibly safer too.

> > Regarding the userspace behaviour during an auto-update, we have
> > multiple options:
> >
> > For control get,
> >
> > - We can return -EBUSY
> > - We can return the old value from the cache
> > - We can return the new value fromt he cache
> >
> > Returning -EBUSY would be simpler to implement.
>
> Not only easy, I think it is the most correct,
> 
> > I don't think the behaviour should depend on whether the control is read
> > on the file handle that initiated the async operation or on a different
> > file handle.
> >
> > For control set, I don't think we can do much else than returning
> > -EBUSY, regardless of which file handle the control is set on.
> 
> ACK.
> 
> > > I will send a new version with my interpretation.
> > >
> > > Thanks for a great discussion
> 
> Looking with some perspective... I believe that we should look into
> the "userspace behaviour for auto controls" in a different patchset.
> It is slightly unrelated to this discussion.

-- 
Regards,

Laurent Pinchart

