Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DE301B9DB
	for <lists+linux-media@lfdr.de>; Mon, 13 May 2019 17:24:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729374AbfEMPXt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 May 2019 11:23:49 -0400
Received: from casper.infradead.org ([85.118.1.10]:54980 "EHLO
        casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728615AbfEMPXt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 May 2019 11:23:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=XecE39z5Wdv1UUdpgjNY8jEJraT3bchBosqiDVEwKac=; b=H0nmENQFZDrtsb3WGjL+nJ69KT
        +fXIpU+tp4CIRwnV+GiOf2ZuYb/PjDqW+bH34swATcxiDuZnoXt0NgCWwwjUvKVVSV+4LSGTEDkxt
        EgaBGgeQXLx3OmLBYd93SgbZClb1EJduca7Wg514zub9bi1EJbXXXPCqTyK2I0c5oZSObRWrlKlA8
        Yy73fDr+lUmikIR3nYOUtTmYEXCm57xPb5KR/uYq4cNV6Flmow0OzvrHf0inaLH9aCMVeDwZh/iMp
        OxxIfEOkSOZCIbnn6mxObPb4uof0Z1j+riFiG3a7d2eBftDChxE55rtGPvKR8IyyPgkKlMP78iBvH
        REqmF3PA==;
Received: from [179.179.44.200] (helo=coco.lan)
        by casper.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hQCnd-0003iy-SA; Mon, 13 May 2019 15:23:34 +0000
Date:   Mon, 13 May 2019 12:23:27 -0300
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Sean Paul <seanpaul@chromium.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH 00/20] drm: Split out the formats API and move it to a
 common place
Message-ID: <20190513122327.57f9c6ea@coco.lan>
In-Reply-To: <20190513145719.GS17751@phenom.ffwll.local>
References: <20190417154121.GJ13337@phenom.ffwll.local>
        <20190418062229.eyog4i62eg4pr6uf@flea>
        <CAKMK7uHwSjqXwWGt+wQ6oMFWoPqmBxYHL7r+vTOXdYt9KMCYLQ@mail.gmail.com>
        <20190418090221.e57dogn4yx5nwdni@flea>
        <CAKMK7uHN6QfYyzx4DjRT+7VLRi6N9DorQtw2GoDiNGTgie=DXA@mail.gmail.com>
        <20190420225904.GZ4964@pendragon.ideasonboard.com>
        <20190423072554.GW13337@phenom.ffwll.local>
        <20190423154527.GH16111@pendragon.ideasonboard.com>
        <CAKMK7uEFco0LcmbZaSddcpSHwY8tSMhif5rKmqwANnt2zhtzpg@mail.gmail.com>
        <20190511192632.GN13043@pendragon.ideasonboard.com>
        <20190513145719.GS17751@phenom.ffwll.local>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon, 13 May 2019 16:57:19 +0200
Daniel Vetter <daniel@ffwll.ch> escreveu:

> > > I think small boutique trees are a problem themselves, not a solution.
> > > So if you're creating a new small boutique tree to fix a problem, you
> > > then have 2. Yes, assuming sufficient expenditure of energy it can be
> > > made to work, but I'd prefer to make my own life as easy and lazy as
> > > possible :-) And I think I've been fairly successful at that within
> > > drivers/gpu at least.
> > > 
> > > Imo the proper fix is to merge v4l and drm, at a process/maintainer
> > > level. That would solve both the original issue and the 2ndary one of
> > > the permanent topic branch.  
> > 
> > Proposals are welcome ;-)  
> 
> I'm already somewhat unpopular at LPC/lkml/kernel-at-large, I don't want
> to make this worse.  That's why I don't want to officially push for
> anything here myself, nor be in any other way involved in an effort to
> figure out v4l governance and maintainership rules.
> 
> What I think is required for efficient collaboration with drm (no matter
> how we implement that in the details once we're ready for that step) is
> some kind of group maintainership model. Doesn't need to be as extreme as
> drm-misc, but I think at least something like the soc tree (while it was
> still a bit more limited as arm-soc). Otherwise the impendence mismatch
> between how drm rolls and how v4l rolls is probably way too much. From my
> understanding v4l is working differently.
> 
> Also, through sheer inertia of size, I don't think it'll be easier to
> align drm with the v4l model. So that option is not realistic.

I don't think it is realistic trying to align V4L2 model to every single 
other subsystems we use. We have a lot of alignment with alsa, with even
increased during this merge window due to some drivers on media sharing 
media controller resources with usb-audio. We also have lots of alignment
with i2c, as we use a lot of stuff there, and from time to time they
need to add new features due to our needs. The same is true also for
input and for other subsystems and arch/sub-arch trees.

That doesn't mean at all that everybody should use the same maintainership
model. Each subsystem should use whatever suits best.

That's said, after following this thread for a while, I'm starting to
convince that it wouldn't even be realistic to have a common fourcc 
API for both subsystems. The internal requirements from each subsystem
are different, and, as it was already pointed in this thread, that's
basically why DRM ended by having their own way of doing that.

Yet, it would make sense to have at least a single nomenclature for
both systems to use, but it could be a simple as what we already do
with other common resources, like:

	Documentation/ioctl/ioctl-number.txt

If we keep the fourcc codes there sorted, if one subsystem would
add a conflicting code, it would be easy to notice at linux-next.

Thanks,
Mauro
