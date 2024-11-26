Return-Path: <linux-media+bounces-22110-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4909D9C83
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 18:27:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1D4A281225
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 17:27:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF2FA1DB52D;
	Tue, 26 Nov 2024 17:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bbrdJ3TA"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4821DA2E5;
	Tue, 26 Nov 2024 17:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732641955; cv=none; b=gVFfbw8D6SmUYMD5arPZBrksZxzf0Iun6UX19rTAFN+xkl/lRQU8yk4J+o4QIkP1OxvKn4ac7is/t6EANp3pBnDWcI1bIRCwvWV8w5VeU0LX3Cazf0Ad1BrkGHJ5Kp/uEhO/mdyG4edTiwrtW76zKgOB7M1uZO8jJ/bXsFOkWAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732641955; c=relaxed/simple;
	bh=bcHJ0voNx12vn8RXU8owiIoKzUE9/2e/2h01zWu1xOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LVbLu72hLdWN3uNcy07l/OoiJIgsH5a2+kITck1gS5t5GayH0adPZ2z77+hGTVD9tvRBmm/xysgFiqKrNHp9ep0pwe+jUiH4qi3OZxIPUBV/v5jHHurRwVfvpAl5uMVV6DJUBlzKgP43lx3Fj7LPLTm+wOkvLARJqlThdFqWyrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bbrdJ3TA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 28807526;
	Tue, 26 Nov 2024 18:25:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732641929;
	bh=bcHJ0voNx12vn8RXU8owiIoKzUE9/2e/2h01zWu1xOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bbrdJ3TArjfvR8ZJQlpKtxDYQTFNAN7OCAvihCVpji226cVITDHGSaEuguHmtg3tN
	 1uwlzKJoYChkcyNEA1rpiDKGoi8RN83W7y7sRggUGxBZP2hk58MHW80o3M++gLaM7n
	 /17hcpWNWKZy1zDuOEk5eFbsxwuFoKde8MEivluQ=
Date: Tue, 26 Nov 2024 19:25:41 +0200
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
Message-ID: <20241126172541.GB23391@pendragon.ideasonboard.com>
References: <CANiDSCt_bQ=E1fkpH1SAft1UXiHc2WYZgKDa8sr5fggrd7aiJg@mail.gmail.com>
 <d0dd293e-550b-4377-8a73-90bcfe8c2386@redhat.com>
 <CANiDSCvS1qEfS9oY=R05YhdRQJZmAjDCxVXxfVO4-=v4W1jTDg@mail.gmail.com>
 <5a199058-edab-4f9d-9e09-52305824f3bf@redhat.com>
 <20241125131428.GD32280@pendragon.ideasonboard.com>
 <233eaf78-49f1-43c1-b320-c75cfc04103f@redhat.com>
 <20241125213521.GV19381@pendragon.ideasonboard.com>
 <CANiDSCvfnNKG8KUQEeBsr3JhWjUE+nBr4BTaR-sfaQQV9ZqSwQ@mail.gmail.com>
 <20241126165049.GH5461@pendragon.ideasonboard.com>
 <CANiDSCu2FJiJP+e+gjWySQRUkKUxXYv2C70kRct2io7yetY56Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCu2FJiJP+e+gjWySQRUkKUxXYv2C70kRct2io7yetY56Q@mail.gmail.com>

On Tue, Nov 26, 2024 at 06:12:46PM +0100, Ricardo Ribalda wrote:
> On Tue, 26 Nov 2024 at 17:51, Laurent Pinchart wrote:
> > On Tue, Nov 26, 2024 at 05:27:57PM +0100, Ricardo Ribalda wrote:
> > > On Mon, 25 Nov 2024 at 22:35, Laurent Pinchart wrote:
> > > > On Mon, Nov 25, 2024 at 03:41:19PM +0100, Hans de Goede wrote:
> > > > > On 25-Nov-24 2:14 PM, Laurent Pinchart wrote:
> > > > > > On Mon, Nov 25, 2024 at 01:01:14PM +0100, Hans de Goede wrote:
> > > > > >> On 18-Nov-24 5:47 PM, Ricardo Ribalda wrote:
> > > > > >>> On Mon, 18 Nov 2024 at 16:43, Hans de Goede wrote:
> > > > > >>>> On 15-Nov-24 9:20 AM, Ricardo Ribalda wrote:
> > > > > >>>>> On Fri, 15 Nov 2024 at 00:06, Laurent Pinchart wrote:
> > > > >
> > > > > <snip>
> > > > >
> > > > > >>>>>> Is there any ACPI- or WMI-provided information that could assist with
> > > > > >>>>>> associating a privacy GPIO with a camera ?
> > > > > >>
> > > > > >> I just realized I did not answer this question from Laurent
> > > > > >> in my previous reply.
> > > > > >>
> > > > > >> No unfortunately there is no ACPI- or WMI-provided information that
> > > > > >> could assist with associating ACPI/WMI camera privacy controls with
> > > > > >> a specific camera. Note that these are typically not exposed as a GPIO,
> > > > > >> but rather as some vendor firmware interface.
> > > > > >>
> > > > > >> Thinking more about this I'm starting to believe more and more
> > > > > >> that the privacy-control stuff should be handled by libcamera
> > > > > >> and then specifically by the pipeline-handler, with some helper
> > > > > >> code to share functionality where possible.
> > > > > >>
> > > > > >> E.g. on IPU6 equipped Windows laptops there may be some ACPI/WMI
> > > > > >> driver which provides a /dev/input/event# SW_CAMERA_LENS_COVER node.
> > > > > >
> > > > > > Using an event device means that the user would need permissions to
> > > > > > access it. Would distributions be able to tell the device apart from
> > > > > > other event devices such as mouse/keyboard, where a logged user may not
> > > > > > have permission to access all event devices in a multi-seat system ?
> > > > >
> > > > > input events modaliases contain a lot of info, including what sort
> > > > > of events they report, e.g. :
> > > > >
> > > > > [hans@shalem uvc]$ cat /sys/class/input/input36/modalias
> > > > > input:b0003v046Dp405Ee0111-e0,1,2,3,4,11,14,k71,72,73,74,75,77,78,79,7A,7B,7C,7D,7E,7F,80,81,82,83,84,85,86,87,88,89,8A,8B,8C,8E,8F,90,96,98,9B,9C,9E,9F,A1,A3,A4,A5,A6,A7,A8,A9,AB,AC,AD,AE,B0,B1,B2,B3,B4,B5,B6,B7,B8,B9,BA,BB,BC,BD,BE,BF,C0,C1,C2,CC,CE,CF,D0,D1,D2,D4,D8,D9,DB,DF,E0,E1,E4,E5,E6,E7,E8,E9,EA,EB,F0,F1,F4,100,110,111,112,113,114,115,116,117,118,119,11A,11B,11C,11D,11E,11F,161,162,166,16A,16E,172,174,176,177,178,179,17A,17B,17C,17D,17F,180,182,183,185,188,189,18C,18D,18E,18F,190,191,192,193,195,197,198,199,19A,19C,1A0,1A1,1A2,1A3,1A4,1A5,1A6,1A7,1A8,1A9,1AA,1AB,1AC,1AD,1AE,1AF,1B0,1B1,1B7,1BA,240,241,242,243,244,245,246,247,248,249,24A,24B,24C,24D,250,251,260,261,262,263,264,265,r0,1,6,8,B,C,a20,m4,l0,1,2,3,4,sfw
> > > > >
> > > > > So I believe that we can create a udev rule which matches on input
> > > > > devices with SW_CAMERA_LENS_COVER functionality and set a uaccess
> > > > > tag on those just like it is done for /dev/video# nodes.
> > > > >
> > > > > Or we can just use a specific input-device-name (sub) string
> > > > > and match on that.
> > > > >
> > > > > This may require using a separate input_device with just
> > > > > the SW_CAMERA_LENS_COVER functionality in some of the laptop
> > > > > ACPI / WMI drivers, but that is an acceptable compromise IMHO.
> > > >
> > > > As long as it's doable I'm OK with it.
> > > >
> > > > > (we don't want to report privacy sensitive input events on
> > > > > these nodes to avoid keylogging).
> > > > >
> > > > > > Would compositors be able to ignore the device to let libcamera handle
> > > > > > it ?
> > > > >
> > > > > input devices can be opened multiple times and we want the compositor
> > > > > to also open it to show camera on/off OSD icons / messages.
> > > >
> > > > I'm not sure we want that though, as the event should be associated with
> > > > a particular camera in messages. It would be better if it still went
> > > > through libcamera and pipewire.
> > >
> > > For OSD we do not necessarily need to know what camera the GPIO is
> > > associated with.
> > >
> > > We just want to give instant feedback about a button on their device.
> > > Eg in ChromeOS we just say: "camera off" not "user facing camera off"
> >
> > That may be true of Chrome OS, but in general, other systems may want to
> > provide more detailed information. I wouldn't model the API and
> > architecture just on Chrome OS.
> 
> It is not about ChromeOS, it is about the use case.
> 
> We were talking about 2 usecases:
> - instant feedback for a button. Actor: OSD / composer
> - this camera is disabled, please use other camera or enable it: Actor
> camera app, or camera "service" (read pipewire, libcamera, or the
> permission handler for snap)
> 
> There are some examples showing that for "instant feedback" there is
> no need to link the event to the camera:
> - there is hardware where this is not possible to establish the link.
> - ChromeOS does not show the camera name (when it has enough
> information to do so)
> - I believe Hans mentioned that Windows does not show the camera name.
> - (Hans, are you wiring SW_CAMERA_LENS_COVER to the user right now?)
> Do you know of a system where this info is needed?
> 
> My problem is that I do not see where libcamera fits for the "instant
> feedback" usecase:
> - libcamera will be running as a service and telling the UI that the
> camera is disabled? how will it communicate with the OS?

Not libcamera itself, but a camera service on top of it. For typical
desktop cases, that would be pipewire. I don't know how it communicates
with other actors, that's not my area of expertise, but I would be
surprised if it wouldn't be able to.

> - the OS will run a "libcamera helper" every second to get the switch
> status for every camera?
> - the OS will wait for an input event and run a "libcamera helper" to
> find the correlation with the camera?
> 
> I think it is simpler that the OS just waits for an
> SW_CAMERA_LENS_COVER event and display "camera off". The same way it
> waits for "caps lock" today
> 
> In any case:
> -  for uvc, it seems like it is easy to go from evdev to videodev (and
> the other way around). Check my previous email
> - udev seems to have a lot of information about the evdev to configure
> the permissions in a way that cover most (all?) of the
> usecases/architectures
> 
> > > > > If opened multiple times all listeners will get the events.
> > > > >
> > > > > >>>>>> We could include the evdev in the MC graph. That will of course only be
> > > > > >>>>>> possible if the kernel knows about that association in the first place.
> > > > > >>>>>> At least the 1st category of devices would benefit from this.
> > > > > >>>>
> > > > > >>>> Yes I was thinking about adding a link to the MC graph for this too.
> > > > > >>>>
> > > > > >>>> Ricardo I notice that in this v3 series you still create a v4l2-subdev
> > > > > >>>> for the GPIO handling and then add an ancillary link for the GPIO subdev
> > > > > >>>> to the mc-graph. But I'm not sure how that is helpful. Userspace would
> > > > > >>>> still need to do parent matching, but then match the evdev parent to
> > > > > >>>> the subdev after getting the subdev from the mc. In that case it might
> > > > > >>>> as well look at the physical (USB-interface) parent of the MC/video
> > > > > >>>> node and do parent matching on that avoiding the need to go through
> > > > > >>>> the MC at all.
> > > > > >>>>
> > > > > >>>> I think using the MC could still be useful by adding a new type of
> > > > > >>>> ancillary link to the MC API which provides a file-path as info to
> > > > > >>>> userspace rather then a mc-link and then just directly provide
> > > > > >>>> the /dev/input/event# path through this new API?
> > > > > >
> > > > > > I don't think we need that. MC can model any type of entity and report
> > > > > > the device major:minor. That plus ancillary links should give us most of
> > > > > > what we need, the only required addition should be a new MC entity
> > > > > > function.
> > > > >
> > > > > Ah interesting yes that should work nicely.

-- 
Regards,

Laurent Pinchart

