Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 573785EF9E
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2019 01:25:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727428AbfGCXZw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jul 2019 19:25:52 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:60122 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727126AbfGCXZw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Jul 2019 19:25:52 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 50BA924B;
        Thu,  4 Jul 2019 01:25:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1562196349;
        bh=XtdE/gbqEbdkLoLVIK10NxfUE2jRJNofEm4V3DPEB0c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=K81gNzMN7rgs37lpqq/ZCUD/FFFBmSxTX1ELUpmFmf6z6qgh0PYdUoekMtOuJDhMe
         fxTjH6GYss4/8Xr2O2YsM6aqv07sz5BKlR5+HNx3aDUXnQNcumjrKH716HW4fLVf7x
         Z1dMBDup2jYG+ZhCky5yeqHAZaDU4uC5WyyZ0CYg=
Date:   Thu, 4 Jul 2019 02:25:28 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Helen Koike <helen.koike@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Use Media Dev Allocator to fix vimc dev lifetime bugs
Message-ID: <20190703232528.GR5007@pendragon.ideasonboard.com>
References: <cover.1558667245.git.skhan@linuxfoundation.org>
 <c9160fe7-e880-4070-3959-b9e9177acf54@xs4all.nl>
 <2862ebca-c58f-c265-cc74-8d0f9b943275@collabora.com>
 <1c794ca1-5490-26a4-dc39-f86e05fadc46@linuxfoundation.org>
 <20190616184506.GD5006@pendragon.ideasonboard.com>
 <6e67ae76-6d37-cd70-c05f-1c6b6dd4af1a@linuxfoundation.org>
 <20190630114102.GB7043@pendragon.ideasonboard.com>
 <20190703161702.GA26461@bigcity.dyn.berto.se>
 <0306e792-e4b9-37b4-2ee0-9b0133c92828@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0306e792-e4b9-37b4-2ee0-9b0133c92828@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Shuah,

On Wed, Jul 03, 2019 at 10:52:17AM -0600, Shuah Khan wrote:
> On 7/3/19 10:17 AM, Niklas Söderlund wrote:
> > On 2019-06-30 14:41:02 +0300, Laurent Pinchart wrote:
> >> On Fri, Jun 28, 2019 at 10:41:07AM -0600, Shuah Khan wrote:
> >>> On 6/16/19 12:45 PM, Laurent Pinchart wrote:
> >>>> On Fri, Jun 14, 2019 at 05:26:46PM -0600, Shuah Khan wrote:
> >>>>> On 6/13/19 7:24 AM, Helen Koike wrote:
> >>>>>> On 6/13/19 2:44 AM, Hans Verkuil wrote:
> >>>>>>> On 5/24/19 5:31 AM, Shuah Khan wrote:
> >>>>>>>> media_device is embedded in struct vimc_device and when vimc is removed
> >>>>>>>> vimc_device and the embedded media_device goes with it, while the active
> >>>>>>>> stream and vimc_capture continue to access it.
> >>>>>>>>
> >>>>>>>> Fix the media_device lifetime problem by changing vimc to create shared
> >>>>>>>> media_device using Media Device Allocator API and vimc_capture getting
> >>>>>>>> a reference to vimc module. With this change, vimc module can be removed
> >>>>>>>> only when the references are gone. vimc can be removed after vimc_capture
> >>>>>>>> is removed.
> >>>>>>>>
> >>>>>>>> Media Device Allocator API supports just USB devices. Enhance it
> >>>>>>>> adding a genetic device allocate interface to support other media
> >>>>>>>> drivers.
> >>>>>>>>
> >>>>>>>> The new interface takes pointer to struct device instead and creates
> >>>>>>>> media device. This interface allows a group of drivers that have a
> >>>>>>>> common root device to share media device resource and ensure media
> >>>>>>>> device doesn't get deleted as long as one of the drivers holds its
> >>>>>>>> reference.
> >>>>>>>>
> >>>>>>>> The new interface has been tested with vimc component driver to fix
> >>>>>>>> panics when vimc module is removed while streaming is in progress.
> >>>>>>>
> >>>>>>> Helen, can you review this series? I'm not sure this is the right approach
> >>>>>>> for a driver like vimc, and even if it is, then it is odd that vimc-capture
> >>>>>>> is the only vimc module that's handled here.
> >>>>>>
> >>>>>> Hi Hans,
> >>>>>>
> >>>>>> Yes, I can take a look. Sorry, I've been a bit busy these days but I'll
> >>>>>> try to take a look at this patch series (and the others) asap.
> >>>>>>
> >>>>>> Helen
> >>>>>>
> >>>>>>> My gut feeling is that this should be handled inside vimc directly and not
> >>>>>>> using the media-dev-allocator.
> >>>>>
> >>>>> Hi Hans and Helen,
> >>>>>
> >>>>> I explored fixing the problem within vimc before I went down the path to
> >>>>> use Media Device Allocator API. I do think that it is cleaner to go this
> >>>>> way and easier to maintain.
> >>>>>
> >>>>> vimc is a group pf component drivers that rely on the media device vimc
> >>>>> in vimc and falls into the use-case Media Device Allocator API is added
> >>>>> to address. The release and life-time management happens without vimc
> >>>>> component drivers being changed other than using the API to get and put
> >>>>> media device reference.
> >>>>
> >>>> Our replies crossed each other, please see my reply to Hans. I would
> >>>> just like to comment here that if having multiple kernel modules causes
> >>>> issue, they can all be merged together. There's no need for vimc to be
> >>>> handled through multiple modules (I actually think it's quite
> >>>> counterproductive, it only makes it more complex, for no added value).
> >>>
> >>> There are several problems in this group of drivers as far as lifetime
> >>> management is concerned. I explained some of it in the patch 2/2
> >>>
> >>> If vimc module is removed while streaming is active, vimc_exit runs
> >>> into NULL pointer dereference error when streaming thread tries to
> >>> access and lock graph_mutex in the struct media_device.
> >>>
> >>> The primary reason for this is that:
> >>>
> >>> media_device is embedded in struct vimc_device and when vimc is removed
> >>> vimc_device and the embedded media_device goes with it, while the active
> >>> stream and vimc_capture continue to access it.
> >>
> >> The issue isn't so much that media_devic is embedded in vimc_device, but
> >> that vimc_device is released too early. Not only does the thread need to
> >> access the graph_mutex lock in the media_device structure, but it can
> >> potentially access fields of the device-specific structures as well. The
> >> proper solution is to propagate media_device_release() one level up, in
> >> order to only release the top-level structure containing media_device
> >> when the last reference to the media_device is dropped.
> 
> Yes. vimc_device is the master device for all the component drivers and
> it being released early definitely causes problems. I tried to solve
> this by isolating the media_device embedded in it and taking that out
> of contention for release later. This problem could be solved by making
> sure vimc_device sticks around and I am on that solution now.

Thank you :-)

> > I have seen similar problems with rcar-vin, the device specific data is
> > released to early. In my case it was not triggered by the struct
> > media_device but with a struct v4l2_device embedded in the device
> > specific data IIRC.
> > 
> > This was when I tried to address the lifetime issues of the video device
> > when binding/unbinding the device to the driver and not when unloading
> > the module. This was quiet a while ago so I don't recall specifics,
> > sorry about that. One finding was that there are also unsolved problems
> > when it comes async notifiers and unloading/unbinding and then
> > loading/binding subdevices as well as the driver controlling the video
> > device. It was such a mess I gave up.
> 
> Yes. You will find such problems with various media drivers. It could be
> the v4l2 device or some other device that gets released while still in
> use.
> 
> > I'm happy to see activity in this area but I fear it might need work on
> > a higher level and not trying to work around the problem in drivers.
> 
> Drivers still need to handle such issues anyway. Is there a reason why
> you think it is a work-around?
> 
> >>> If we chose to keep these drivers as component drivers, media device
> >>> needs to stick around until all components stop using it. This is tricky
> >>> because there is no tie between these set of drivers. vimc module can
> >>> be deleted while others are still active. As vimc gets removed, other
> >>> component drivers start wanting to access the media device tree.
> >>
> >> Reference-counting is the key.
> >>
> >>> This is classic media device lifetime problem which could be solved
> >>> easily with the way I solved it with this series. I saw this as a
> >>> variation on the same use-case we had with sound and media drivers
> >>> sharing the media device.
> >>
> >> This isn't about solving it easily, it's about solving it properly. The
> >> media device allocator as used here is a hack and takes us in the
> >> opposite direction of a proper fix.
> 
> Labeling this hack doesn't accurate. I agree though that this might be a
> big hammer and there might be other solutions that can be limited to
> just vimc scope. :)

The reason I call this a hack is that it may hide the early free of the
media_device structure itself, but won't help at all with the vimc
device structure that may also need to be accessed by the other drivers.
In order to fix this problem - and all similar lifetime management
problems - correctly we need to look at every structure and track how
they are referenced. Only through proper reference counting can we be
safe.

The media device allocator was specifically designed to handle cases
where there is no single master driver that can own a media device. This
caused the problems explained below which to my infinite disappointment
have been ignored while being pointed out multiple times during review.
I can only blame myself for not having done a better job at explaining
those issues of course, as the patch adding the allocator is signed by
three V4L2 core developers, so I must have failed three times.
Nevertheless, this API shall not be used until those problems are fixed,
to avoid spreading them to more drivers. At least until then - and I
believe beyond that too - it shall not be used for drivers where a media
device master exists, such as vimc.

> >>> I have a TODO request from you asking to extend Media Device Allocator
> >>> API to generic case and not restrict it to USB devices. My thinking is
> >>> that this gives a perfect test case to extend the API to be generic
> >>> and use to solve this problem.
> >>
> >> The biggest issue at the moment with the media device allocator, which I
> >> have pointed out numerous times and has never been addressed (and which
> >> explains why I didn't think the code was ready to be merged) is that the
> >> media_device contains operations that are based on having a single
> >> driver controlling the media device. A proper shared media device
> >> allocator needs to drop the concept of a single master for the media
> >> device, and thus needs to refactor those operations to allow any user of
> >> the media device to implement them (the .link_notify() operation is a
> >> prime example, and the recently added request operations will make this
> >> even more challenging - think of how this patch series would prevent
> >> vimc from properly implementing the request API). As long as these issue
> >> are not fixed I will be firmly opposed to spreading the usage of the
> >> media device allocator beyond what exists today.
> 
> During the reviews, it was deemed necessary to make media driver as the
> master for creating parts of the tree and provide hooks for other
> drivers to add their own media components to the tree. The same is
> extended to other interfaces. This feature was on ice for so long,
> I don't recall all the details on how it evolved.

Do you mean during the review of the vimc driver or of the media
allocator API ?

-- 
Regards,

Laurent Pinchart
