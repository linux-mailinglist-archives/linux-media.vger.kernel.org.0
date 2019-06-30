Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 236D15AFBD
	for <lists+linux-media@lfdr.de>; Sun, 30 Jun 2019 13:41:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726531AbfF3LlY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 30 Jun 2019 07:41:24 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:34804 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726498AbfF3LlX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 30 Jun 2019 07:41:23 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2800E255;
        Sun, 30 Jun 2019 13:41:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1561894881;
        bh=R1fW2R4tnAmMxR62xnDIqr6xUU4pDRsXfvB012OtFY4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=b0IQQ2j5Rw/LikZiUeIl32pvl6foyMeOUf/OUN7qbN4XvqteH86hdUNISiqAHVloU
         A/p87xbNErfFMLdoNA8ISD7njilFV2efnVLVHIhfMpH29phLkrP8cADVN1KYZraWLf
         Cy4N1GuTDR6R63ZppAuHpI4G3YdUNOBwHM7f7Nzo=
Date:   Sun, 30 Jun 2019 14:41:02 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     Helen Koike <helen.koike@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Use Media Dev Allocator to fix vimc dev lifetime bugs
Message-ID: <20190630114102.GB7043@pendragon.ideasonboard.com>
References: <cover.1558667245.git.skhan@linuxfoundation.org>
 <c9160fe7-e880-4070-3959-b9e9177acf54@xs4all.nl>
 <2862ebca-c58f-c265-cc74-8d0f9b943275@collabora.com>
 <1c794ca1-5490-26a4-dc39-f86e05fadc46@linuxfoundation.org>
 <20190616184506.GD5006@pendragon.ideasonboard.com>
 <6e67ae76-6d37-cd70-c05f-1c6b6dd4af1a@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6e67ae76-6d37-cd70-c05f-1c6b6dd4af1a@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Shuah,

On Fri, Jun 28, 2019 at 10:41:07AM -0600, Shuah Khan wrote:
> On 6/16/19 12:45 PM, Laurent Pinchart wrote:
> > On Fri, Jun 14, 2019 at 05:26:46PM -0600, Shuah Khan wrote:
> >> On 6/13/19 7:24 AM, Helen Koike wrote:
> >>> On 6/13/19 2:44 AM, Hans Verkuil wrote:
> >>>> On 5/24/19 5:31 AM, Shuah Khan wrote:
> >>>>> media_device is embedded in struct vimc_device and when vimc is removed
> >>>>> vimc_device and the embedded media_device goes with it, while the active
> >>>>> stream and vimc_capture continue to access it.
> >>>>>
> >>>>> Fix the media_device lifetime problem by changing vimc to create shared
> >>>>> media_device using Media Device Allocator API and vimc_capture getting
> >>>>> a reference to vimc module. With this change, vimc module can be removed
> >>>>> only when the references are gone. vimc can be removed after vimc_capture
> >>>>> is removed.
> >>>>>
> >>>>> Media Device Allocator API supports just USB devices. Enhance it
> >>>>> adding a genetic device allocate interface to support other media
> >>>>> drivers.
> >>>>>
> >>>>> The new interface takes pointer to struct device instead and creates
> >>>>> media device. This interface allows a group of drivers that have a
> >>>>> common root device to share media device resource and ensure media
> >>>>> device doesn't get deleted as long as one of the drivers holds its
> >>>>> reference.
> >>>>>
> >>>>> The new interface has been tested with vimc component driver to fix
> >>>>> panics when vimc module is removed while streaming is in progress.
> >>>>
> >>>> Helen, can you review this series? I'm not sure this is the right approach
> >>>> for a driver like vimc, and even if it is, then it is odd that vimc-capture
> >>>> is the only vimc module that's handled here.
> >>>
> >>> Hi Hans,
> >>>
> >>> Yes, I can take a look. Sorry, I've been a bit busy these days but I'll
> >>> try to take a look at this patch series (and the others) asap.
> >>>
> >>> Helen
> >>>
> >>>> My gut feeling is that this should be handled inside vimc directly and not
> >>>> using the media-dev-allocator.
> >>
> >> Hi Hans and Helen,
> >>
> >> I explored fixing the problem within vimc before I went down the path to
> >> use Media Device Allocator API. I do think that it is cleaner to go this
> >> way and easier to maintain.
> >>
> >> vimc is a group pf component drivers that rely on the media device vimc
> >> in vimc and falls into the use-case Media Device Allocator API is added
> >> to address. The release and life-time management happens without vimc
> >> component drivers being changed other than using the API to get and put
> >> media device reference.
> > 
> > Our replies crossed each other, please see my reply to Hans. I would
> > just like to comment here that if having multiple kernel modules causes
> > issue, they can all be merged together. There's no need for vimc to be
> > handled through multiple modules (I actually think it's quite
> > counterproductive, it only makes it more complex, for no added value).
> 
> There are several problems in this group of drivers as far as lifetime
> management is concerned. I explained some of it in the patch 2/2
> 
> If vimc module is removed while streaming is active, vimc_exit runs
> into NULL pointer dereference error when streaming thread tries to
> access and lock graph_mutex in the struct media_device.
> 
> The primary reason for this is that:
> 
> media_device is embedded in struct vimc_device and when vimc is removed
> vimc_device and the embedded media_device goes with it, while the active
> stream and vimc_capture continue to access it.

The issue isn't so much that media_devic is embedded in vimc_device, but
that vimc_device is released too early. Not only does the thread need to
access the graph_mutex lock in the media_device structure, but it can
potentially access fields of the device-specific structures as well. The
proper solution is to propagate media_device_release() one level up, in
order to only release the top-level structure containing media_device
when the last reference to the media_device is dropped.

> If we chose to keep these drivers as component drivers, media device
> needs to stick around until all components stop using it. This is tricky
> because there is no tie between these set of drivers. vimc module can
> be deleted while others are still active. As vimc gets removed, other
> component drivers start wanting to access the media device tree.

Reference-counting is the key.

> This is classic media device lifetime problem which could be solved
> easily with the way I solved it with this series. I saw this as a
> variation on the same use-case we had with sound and media drivers
> sharing the media device.

This isn't about solving it easily, it's about solving it properly. The
media device allocator as used here is a hack and takes us in the
opposite direction of a proper fix.

> I have a TODO request from you asking to extend Media Device Allocator
> API to generic case and not restrict it to USB devices. My thinking is
> that this gives a perfect test case to extend the API to be generic
> and use to solve this problem.

The biggest issue at the moment with the media device allocator, which I
have pointed out numerous times and has never been addressed (and which
explains why I didn't think the code was ready to be merged) is that the
media_device contains operations that are based on having a single
driver controlling the media device. A proper shared media device
allocator needs to drop the concept of a single master for the media
device, and thus needs to refactor those operations to allow any user of
the media device to implement them (the .link_notify() operation is a
prime example, and the recently added request operations will make this
even more challenging - think of how this patch series would prevent
vimc from properly implementing the request API). As long as these issue
are not fixed I will be firmly opposed to spreading the usage of the
media device allocator beyond what exists today.

> Collapsing the drivers into one might be lot more difficult and complex
> than solving this problem with Media Device Allocator API. This approach
> has an added benefit of extending the API to be generic and not just for
> USB.

I've never disputed the fact that fixing a problem correctly is usually
more work than hacking around it :-)

> I looked at this as a good way to add generic API and have a great test
> case for it. This patch series fixes the problem for the current vimc
> architecture.

NAK, for the reasons above. Please drop this series and fix the problem
properly.

-- 
Regards,

Laurent Pinchart
