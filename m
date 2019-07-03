Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3865E5E899
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2019 18:17:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726762AbfGCQRH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jul 2019 12:17:07 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:39953 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725847AbfGCQRH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Jul 2019 12:17:07 -0400
Received: by mail-lf1-f68.google.com with SMTP id a9so2193246lff.7
        for <linux-media@vger.kernel.org>; Wed, 03 Jul 2019 09:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=T4K0lfJrZdB+WImHUfetaGJj7jF3V38fxGsDa1+dLU4=;
        b=EYgk3iUdJLGiD3gmhVDxVz7h2NG6et1FHg0d9Vb6krYWD+qzuBsonvXhmZ3uk4LzbS
         mBiEz1ciNf7VH2k7M1aga3L7jIAFJsjdtssyNmXYt8n2RPxPg5iXD4xzZRudbz88zHJj
         d8KnTjlVFGHZjCDI/YOkj3bBccyrVB8zRv9/bl2sF5276v+kMJNPjuUZsaBfGXdm24Kc
         1ikpvCfdhjwVljTeSjCVtiJlvGCEwfj4tIZyD+eg6T9BkaaVH6r4Gy7IEO4HMHihoisv
         KOuFiki3T+5kvBHxubzMYcAh3PHajyhMhaUDuXAEDX7wSbH001I7PW5nfZ+n5uJ1ZysN
         9XeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=T4K0lfJrZdB+WImHUfetaGJj7jF3V38fxGsDa1+dLU4=;
        b=nHnHZY+F9H/x8dB2sZ3leRgJI6/va+mbzUxvmDCBqBL0KLu3Z/80u2HeIWgrL2ftUK
         n4DPRGCOdtbZX2wiJMgAEToCmNM7g0hdw29oUd5fxOSU8r1kT/ypGlAK0XPKQ+EJMBVy
         zX0rMci6QX24kUsFAXeVyBE8YV4B4SK0Nrar0dzknCYkEXmznsfRyqYCZz1v4Rzt/nVh
         MxZaPUF57ygUVNlcRwTrvMqm4g8CSVQTu0mJ4KBAGIgQ03SBjgOMhPSDRMt9cuCf+dlW
         a71NA7sm1FNW4yXp6FbVOeuZXNZR6gbsnFQYJrDZKRvCi/CA0ycZUcl1nOFJ/IUw4Caj
         2ccg==
X-Gm-Message-State: APjAAAWPNFaA8AXxt9wGIPWbBhkagKGct9TB2VgsoJXd7q58tqWBiNWg
        mQIzElaAVtVQAyGwsTTVyQCnYg==
X-Google-Smtp-Source: APXvYqwAla6eKOL5iV3D7gn6PeSwU+YMXFl3SiIcq6sEo7baJjlSYNndKZraMpG64D9qZw08l4l7eg==
X-Received: by 2002:ac2:4152:: with SMTP id c18mr2759765lfi.144.1562170624734;
        Wed, 03 Jul 2019 09:17:04 -0700 (PDT)
Received: from localhost (customer-145-14-112-32.stosn.net. [145.14.112.32])
        by smtp.gmail.com with ESMTPSA id u13sm457577lfc.5.2019.07.03.09.17.03
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 03 Jul 2019 09:17:03 -0700 (PDT)
Date:   Wed, 3 Jul 2019 18:17:02 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        Helen Koike <helen.koike@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Use Media Dev Allocator to fix vimc dev lifetime bugs
Message-ID: <20190703161702.GA26461@bigcity.dyn.berto.se>
References: <cover.1558667245.git.skhan@linuxfoundation.org>
 <c9160fe7-e880-4070-3959-b9e9177acf54@xs4all.nl>
 <2862ebca-c58f-c265-cc74-8d0f9b943275@collabora.com>
 <1c794ca1-5490-26a4-dc39-f86e05fadc46@linuxfoundation.org>
 <20190616184506.GD5006@pendragon.ideasonboard.com>
 <6e67ae76-6d37-cd70-c05f-1c6b6dd4af1a@linuxfoundation.org>
 <20190630114102.GB7043@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190630114102.GB7043@pendragon.ideasonboard.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Shauah, Laurent,

On 2019-06-30 14:41:02 +0300, Laurent Pinchart wrote:
> Hi Shuah,
> 
> On Fri, Jun 28, 2019 at 10:41:07AM -0600, Shuah Khan wrote:
> > On 6/16/19 12:45 PM, Laurent Pinchart wrote:
> > > On Fri, Jun 14, 2019 at 05:26:46PM -0600, Shuah Khan wrote:
> > >> On 6/13/19 7:24 AM, Helen Koike wrote:
> > >>> On 6/13/19 2:44 AM, Hans Verkuil wrote:
> > >>>> On 5/24/19 5:31 AM, Shuah Khan wrote:
> > >>>>> media_device is embedded in struct vimc_device and when vimc is removed
> > >>>>> vimc_device and the embedded media_device goes with it, while the active
> > >>>>> stream and vimc_capture continue to access it.
> > >>>>>
> > >>>>> Fix the media_device lifetime problem by changing vimc to create shared
> > >>>>> media_device using Media Device Allocator API and vimc_capture getting
> > >>>>> a reference to vimc module. With this change, vimc module can be removed
> > >>>>> only when the references are gone. vimc can be removed after vimc_capture
> > >>>>> is removed.
> > >>>>>
> > >>>>> Media Device Allocator API supports just USB devices. Enhance it
> > >>>>> adding a genetic device allocate interface to support other media
> > >>>>> drivers.
> > >>>>>
> > >>>>> The new interface takes pointer to struct device instead and creates
> > >>>>> media device. This interface allows a group of drivers that have a
> > >>>>> common root device to share media device resource and ensure media
> > >>>>> device doesn't get deleted as long as one of the drivers holds its
> > >>>>> reference.
> > >>>>>
> > >>>>> The new interface has been tested with vimc component driver to fix
> > >>>>> panics when vimc module is removed while streaming is in progress.
> > >>>>
> > >>>> Helen, can you review this series? I'm not sure this is the right approach
> > >>>> for a driver like vimc, and even if it is, then it is odd that vimc-capture
> > >>>> is the only vimc module that's handled here.
> > >>>
> > >>> Hi Hans,
> > >>>
> > >>> Yes, I can take a look. Sorry, I've been a bit busy these days but I'll
> > >>> try to take a look at this patch series (and the others) asap.
> > >>>
> > >>> Helen
> > >>>
> > >>>> My gut feeling is that this should be handled inside vimc directly and not
> > >>>> using the media-dev-allocator.
> > >>
> > >> Hi Hans and Helen,
> > >>
> > >> I explored fixing the problem within vimc before I went down the path to
> > >> use Media Device Allocator API. I do think that it is cleaner to go this
> > >> way and easier to maintain.
> > >>
> > >> vimc is a group pf component drivers that rely on the media device vimc
> > >> in vimc and falls into the use-case Media Device Allocator API is added
> > >> to address. The release and life-time management happens without vimc
> > >> component drivers being changed other than using the API to get and put
> > >> media device reference.
> > > 
> > > Our replies crossed each other, please see my reply to Hans. I would
> > > just like to comment here that if having multiple kernel modules causes
> > > issue, they can all be merged together. There's no need for vimc to be
> > > handled through multiple modules (I actually think it's quite
> > > counterproductive, it only makes it more complex, for no added value).
> > 
> > There are several problems in this group of drivers as far as lifetime
> > management is concerned. I explained some of it in the patch 2/2
> > 
> > If vimc module is removed while streaming is active, vimc_exit runs
> > into NULL pointer dereference error when streaming thread tries to
> > access and lock graph_mutex in the struct media_device.
> > 
> > The primary reason for this is that:
> > 
> > media_device is embedded in struct vimc_device and when vimc is removed
> > vimc_device and the embedded media_device goes with it, while the active
> > stream and vimc_capture continue to access it.
> 
> The issue isn't so much that media_devic is embedded in vimc_device, but
> that vimc_device is released too early. Not only does the thread need to
> access the graph_mutex lock in the media_device structure, but it can
> potentially access fields of the device-specific structures as well. The
> proper solution is to propagate media_device_release() one level up, in
> order to only release the top-level structure containing media_device
> when the last reference to the media_device is dropped.

I have seen similar problems with rcar-vin, the device specific data is 
released to early. In my case it was not triggered by the struct
media_device but with a struct v4l2_device embedded in the device 
specific data IIRC.

This was when I tried to address the lifetime issues of the video device 
when binding/unbinding the device to the driver and not when unloading 
the module. This was quiet a while ago so I don't recall specifics, 
sorry about that. One finding was that there are also unsolved problems 
when it comes async notifiers and unloading/unbinding and then 
loading/binding subdevices as well as the driver controlling the video 
device. It was such a mess I gave up.

I'm happy to see activity in this area but I fear it might need work on 
a higher level and not trying to work around the problem in drivers.

> 
> > If we chose to keep these drivers as component drivers, media device
> > needs to stick around until all components stop using it. This is tricky
> > because there is no tie between these set of drivers. vimc module can
> > be deleted while others are still active. As vimc gets removed, other
> > component drivers start wanting to access the media device tree.
> 
> Reference-counting is the key.
> 
> > This is classic media device lifetime problem which could be solved
> > easily with the way I solved it with this series. I saw this as a
> > variation on the same use-case we had with sound and media drivers
> > sharing the media device.
> 
> This isn't about solving it easily, it's about solving it properly. The
> media device allocator as used here is a hack and takes us in the
> opposite direction of a proper fix.
> 
> > I have a TODO request from you asking to extend Media Device Allocator
> > API to generic case and not restrict it to USB devices. My thinking is
> > that this gives a perfect test case to extend the API to be generic
> > and use to solve this problem.
> 
> The biggest issue at the moment with the media device allocator, which I
> have pointed out numerous times and has never been addressed (and which
> explains why I didn't think the code was ready to be merged) is that the
> media_device contains operations that are based on having a single
> driver controlling the media device. A proper shared media device
> allocator needs to drop the concept of a single master for the media
> device, and thus needs to refactor those operations to allow any user of
> the media device to implement them (the .link_notify() operation is a
> prime example, and the recently added request operations will make this
> even more challenging - think of how this patch series would prevent
> vimc from properly implementing the request API). As long as these issue
> are not fixed I will be firmly opposed to spreading the usage of the
> media device allocator beyond what exists today.
> 
> > Collapsing the drivers into one might be lot more difficult and complex
> > than solving this problem with Media Device Allocator API. This approach
> > has an added benefit of extending the API to be generic and not just for
> > USB.
> 
> I've never disputed the fact that fixing a problem correctly is usually
> more work than hacking around it :-)
> 
> > I looked at this as a good way to add generic API and have a great test
> > case for it. This patch series fixes the problem for the current vimc
> > architecture.
> 
> NAK, for the reasons above. Please drop this series and fix the problem
> properly.
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Regards,
Niklas Söderlund
