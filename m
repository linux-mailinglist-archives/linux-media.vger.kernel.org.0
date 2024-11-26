Return-Path: <linux-media+bounces-22106-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BADBB9D9BD2
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 17:51:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D3A7161CE3
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 16:51:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A69B81D90CB;
	Tue, 26 Nov 2024 16:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="biBcPkno"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3975137E;
	Tue, 26 Nov 2024 16:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732639864; cv=none; b=mTp1g7rLGUlYBhGNJEtx+kP33aLzzycShqMPzghxNVGNDp8457SBCn9qzvYX8+Dry893p3zNhteHqIQN6YDy3Eb5Q03rPOcVFf3MXR4XXMpjhclCys6JQoseoPExJb/a5HhMlL4CY+Sq4b+xdB7OlXvR4i3sMvehuS5HlTwJoF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732639864; c=relaxed/simple;
	bh=V+dH9H21RIpYrJrDfuVCvopbIIXZbfcyVzRClAabaAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DeKo1i4jCiKRXdSO6r+oW9IPHJe5tLiM8Q3kce0QOaXYsQEkthA3s6YROLwfKTMqBwn2G+CvGgurKsKKAtQEMo/NFw0F7HayJKkqKG95wfLh1nWSqdF2ZkbiQc/tGyV1rZQcxbOSZWQgLPjvjz292ZS85OM8fGo26te+w4SIccE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=biBcPkno; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4728E526;
	Tue, 26 Nov 2024 17:50:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732639836;
	bh=V+dH9H21RIpYrJrDfuVCvopbIIXZbfcyVzRClAabaAc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=biBcPknolI9T+EGcEhncpFgyMNDPdIKzkmlRE+8joh7faCWRjDkw+zafeHcs8CGkx
	 NufaQXryFJGRh1usjKqyoLjG5chjVB/SPMnPdE/NRnm5RsmgmstnXXoFTcUDzjFZAw
	 iN6Vd5OS7tWcrnuiPeqn1U8ezfFPW+R/zWikR9uI=
Date: Tue, 26 Nov 2024 18:50:49 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Armin Wolf <W_Armin@gmx.de>, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, Yunke Cao <yunkec@chromium.org>,
	Hans Verkuil <hverkuil@xs4all.nl>, stable@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH v3 0/8] media: uvcvideo: Implement the Privacy GPIO as a
 evdev
Message-ID: <20241126165049.GH5461@pendragon.ideasonboard.com>
References: <CANiDSCtjpPG3XzaEOEeczZWO5gL-V_sj_Fv5=w82D6zKC9hnpw@mail.gmail.com>
 <20241114230630.GE31681@pendragon.ideasonboard.com>
 <CANiDSCt_bQ=E1fkpH1SAft1UXiHc2WYZgKDa8sr5fggrd7aiJg@mail.gmail.com>
 <d0dd293e-550b-4377-8a73-90bcfe8c2386@redhat.com>
 <CANiDSCvS1qEfS9oY=R05YhdRQJZmAjDCxVXxfVO4-=v4W1jTDg@mail.gmail.com>
 <5a199058-edab-4f9d-9e09-52305824f3bf@redhat.com>
 <20241125131428.GD32280@pendragon.ideasonboard.com>
 <233eaf78-49f1-43c1-b320-c75cfc04103f@redhat.com>
 <20241125213521.GV19381@pendragon.ideasonboard.com>
 <CANiDSCvfnNKG8KUQEeBsr3JhWjUE+nBr4BTaR-sfaQQV9ZqSwQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCvfnNKG8KUQEeBsr3JhWjUE+nBr4BTaR-sfaQQV9ZqSwQ@mail.gmail.com>

On Tue, Nov 26, 2024 at 05:27:57PM +0100, Ricardo Ribalda wrote:
> On Mon, 25 Nov 2024 at 22:35, Laurent Pinchart wrote:
> > On Mon, Nov 25, 2024 at 03:41:19PM +0100, Hans de Goede wrote:
> > > On 25-Nov-24 2:14 PM, Laurent Pinchart wrote:
> > > > On Mon, Nov 25, 2024 at 01:01:14PM +0100, Hans de Goede wrote:
> > > >> On 18-Nov-24 5:47 PM, Ricardo Ribalda wrote:
> > > >>> On Mon, 18 Nov 2024 at 16:43, Hans de Goede wrote:
> > > >>>> On 15-Nov-24 9:20 AM, Ricardo Ribalda wrote:
> > > >>>>> On Fri, 15 Nov 2024 at 00:06, Laurent Pinchart wrote:
> > >
> > > <snip>
> > >
> > > >>>>>> Is there any ACPI- or WMI-provided information that could assist with
> > > >>>>>> associating a privacy GPIO with a camera ?
> > > >>
> > > >> I just realized I did not answer this question from Laurent
> > > >> in my previous reply.
> > > >>
> > > >> No unfortunately there is no ACPI- or WMI-provided information that
> > > >> could assist with associating ACPI/WMI camera privacy controls with
> > > >> a specific camera. Note that these are typically not exposed as a GPIO,
> > > >> but rather as some vendor firmware interface.
> > > >>
> > > >> Thinking more about this I'm starting to believe more and more
> > > >> that the privacy-control stuff should be handled by libcamera
> > > >> and then specifically by the pipeline-handler, with some helper
> > > >> code to share functionality where possible.
> > > >>
> > > >> E.g. on IPU6 equipped Windows laptops there may be some ACPI/WMI
> > > >> driver which provides a /dev/input/event# SW_CAMERA_LENS_COVER node.
> > > >
> > > > Using an event device means that the user would need permissions to
> > > > access it. Would distributions be able to tell the device apart from
> > > > other event devices such as mouse/keyboard, where a logged user may not
> > > > have permission to access all event devices in a multi-seat system ?
> > >
> > > input events modaliases contain a lot of info, including what sort
> > > of events they report, e.g. :
> > >
> > > [hans@shalem uvc]$ cat /sys/class/input/input36/modalias
> > > input:b0003v046Dp405Ee0111-e0,1,2,3,4,11,14,k71,72,73,74,75,77,78,79,7A,7B,7C,7D,7E,7F,80,81,82,83,84,85,86,87,88,89,8A,8B,8C,8E,8F,90,96,98,9B,9C,9E,9F,A1,A3,A4,A5,A6,A7,A8,A9,AB,AC,AD,AE,B0,B1,B2,B3,B4,B5,B6,B7,B8,B9,BA,BB,BC,BD,BE,BF,C0,C1,C2,CC,CE,CF,D0,D1,D2,D4,D8,D9,DB,DF,E0,E1,E4,E5,E6,E7,E8,E9,EA,EB,F0,F1,F4,100,110,111,112,113,114,115,116,117,118,119,11A,11B,11C,11D,11E,11F,161,162,166,16A,16E,172,174,176,177,178,179,17A,17B,17C,17D,17F,180,182,183,185,188,189,18C,18D,18E,18F,190,191,192,193,195,197,198,199,19A,19C,1A0,1A1,1A2,1A3,1A4,1A5,1A6,1A7,1A8,1A9,1AA,1AB,1AC,1AD,1AE,1AF,1B0,1B1,1B7,1BA,240,241,242,243,244,245,246,247,248,249,24A,24B,24C,24D,250,251,260,261,262,263,264,265,r0,1,6,8,B,C,a20,m4,l0,1,2,3,4,sfw
> > >
> > > So I believe that we can create a udev rule which matches on input
> > > devices with SW_CAMERA_LENS_COVER functionality and set a uaccess
> > > tag on those just like it is done for /dev/video# nodes.
> > >
> > > Or we can just use a specific input-device-name (sub) string
> > > and match on that.
> > >
> > > This may require using a separate input_device with just
> > > the SW_CAMERA_LENS_COVER functionality in some of the laptop
> > > ACPI / WMI drivers, but that is an acceptable compromise IMHO.
> >
> > As long as it's doable I'm OK with it.
> >
> > > (we don't want to report privacy sensitive input events on
> > > these nodes to avoid keylogging).
> > >
> > > > Would compositors be able to ignore the device to let libcamera handle
> > > > it ?
> > >
> > > input devices can be opened multiple times and we want the compositor
> > > to also open it to show camera on/off OSD icons / messages.
> >
> > I'm not sure we want that though, as the event should be associated with
> > a particular camera in messages. It would be better if it still went
> > through libcamera and pipewire.
> 
> For OSD we do not necessarily need to know what camera the GPIO is
> associated with.
> 
> We just want to give instant feedback about a button on their device.
> Eg in ChromeOS we just say: "camera off" not "user facing camera off"

That may be true of Chrome OS, but in general, other systems may want to
provide more detailed information. I wouldn't model the API and
architecture just on Chrome OS.

> > > If opened multiple times all listeners will get the events.
> > >
> > > >>>>>> We could include the evdev in the MC graph. That will of course only be
> > > >>>>>> possible if the kernel knows about that association in the first place.
> > > >>>>>> At least the 1st category of devices would benefit from this.
> > > >>>>
> > > >>>> Yes I was thinking about adding a link to the MC graph for this too.
> > > >>>>
> > > >>>> Ricardo I notice that in this v3 series you still create a v4l2-subdev
> > > >>>> for the GPIO handling and then add an ancillary link for the GPIO subdev
> > > >>>> to the mc-graph. But I'm not sure how that is helpful. Userspace would
> > > >>>> still need to do parent matching, but then match the evdev parent to
> > > >>>> the subdev after getting the subdev from the mc. In that case it might
> > > >>>> as well look at the physical (USB-interface) parent of the MC/video
> > > >>>> node and do parent matching on that avoiding the need to go through
> > > >>>> the MC at all.
> > > >>>>
> > > >>>> I think using the MC could still be useful by adding a new type of
> > > >>>> ancillary link to the MC API which provides a file-path as info to
> > > >>>> userspace rather then a mc-link and then just directly provide
> > > >>>> the /dev/input/event# path through this new API?
> > > >
> > > > I don't think we need that. MC can model any type of entity and report
> > > > the device major:minor. That plus ancillary links should give us most of
> > > > what we need, the only required addition should be a new MC entity
> > > > function.
> > >
> > > Ah interesting yes that should work nicely.

-- 
Regards,

Laurent Pinchart

