Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CA631BE792
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2020 21:46:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726635AbgD2Tqa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Apr 2020 15:46:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:47118 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726456AbgD2Tqa (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Apr 2020 15:46:30 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 92C3C206B8;
        Wed, 29 Apr 2020 19:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588189589;
        bh=kZVAKSKhFNo6xx7Xf7X7yL4ZQKoDrz+Xvxx7V0gd2RQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=UqG0YsxlHGfZ257znmDrS/r5czfUIzI17xuiF6BYRu0dZdReve3MyrPM1VM53m9s+
         9z8qA55OgYxaM08xv3hx3040w+fYpziwsfFOb881zeblKocFv81VAoKylCzvrCM8ZZ
         XfqcpQQPX7l+mco0OAz99RCGgRpgiMzLEnU+JXMo=
Date:   Wed, 29 Apr 2020 21:46:24 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Niklas =?UTF-8?B?U8O2ZGVybHVuZA==?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Helen Koike <helen.koike@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v8.1 3/6] media: v4l2: Extend VIDIOC_ENUM_FMT to support
 MC-centric devices
Message-ID: <20200429214624.402e4744@coco.lan>
In-Reply-To: <20200429185033.GN5956@pendragon.ideasonboard.com>
References: <20200421135743.1381930-4-niklas.soderlund+renesas@ragnatech.se>
        <20200424134331.22271-1-laurent.pinchart@ideasonboard.com>
        <20200429182739.274ce451@coco.lan>
        <20200429163849.GK5956@pendragon.ideasonboard.com>
        <20200429200140.22a4db22@coco.lan>
        <20200429185033.GN5956@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 29 Apr 2020 21:50:33 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:

> Hi Mauro,
> 
> On Wed, Apr 29, 2020 at 08:01:40PM +0200, Mauro Carvalho Chehab wrote:
> > Em Wed, 29 Apr 2020 19:38:49 +0300 Laurent Pinchart escreveu:  
> > > On Wed, Apr 29, 2020 at 06:27:39PM +0200, Mauro Carvalho Chehab wrote:  
> > > > Em Fri, 24 Apr 2020 16:43:31 +0300 Laurent Pinchart escreveu:
> > > >     
> > > > > The VIDIOC_ENUM_FMT ioctl enumerates all formats supported by a video
> > > > > node. For MC-centric devices, its behaviour has always been ill-defined,
> > > > > with drivers implementing one of the following behaviours:  
> > > > 
> > > > ...
> > > > 
> > > > The patch itself is OK. However, there's a change you did at the
> > > > documentation that it is unrelated. 
> > > > 
> > > > See below.
> > > >     
> > > > > diff --git a/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst b/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
> > > > > index 8ca6ab701e4a..a987debc7654 100644
> > > > > --- a/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
> > > > > +++ b/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
> > > > > @@ -48,10 +48,21 @@ one until ``EINVAL`` is returned. If applicable, drivers shall return
> > > > >  formats in preference order, where preferred formats are returned before
> > > > >  (that is, with lower ``index`` value) less-preferred formats.
> > > > >  
> > > > > -.. note::
> > > > > -   After switching input or output the list of enumerated image
> > > > > -   formats may be different.    
> > > > 
> > > > Why are you dropping this note?
> > > > 
> > > > This basically reverts this changeset:
> > > > 
> > > >   commit 93828d6438081649e81b8681df9bf6ad5d691650
> > > >   Author: Hans Verkuil <hans.verkuil@cisco.com>
> > > >   Date:   Mon Sep 3 09:37:18 2012 -0300
> > > > 
> > > >     [media] DocBook: make the G/S/TRY_FMT specification more strict
> > > >     
> > > >     - S/TRY_FMT should always succeed, unless an invalid type field is passed in.
> > > >     - TRY_FMT should give the same result as S_FMT, all other things being equal.
> > > >     - ENUMFMT may return different formats for different inputs or outputs.
> > > >     This was decided during the 2012 Media Workshop.
> > > >     
> > > >     Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
> > > >     Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> > > >     Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > >     Acked-by: Sakari Ailus <sakari.ailus@iki.fi>
> > > >     Signed-off-by: Mauro Carvalho Chehab <mchehab@redhat.com>
> > > > 
> > > > As far as I remember, from our 2012 discussions, some drivers may change 
> > > > the enumerated image formats when some ioctls like VIDIOC_S_INPUT and
> > > > VIDIOC_S_OUTPUT ioctls are used. I also vaguely remember that 90 and 270
> > > > degrees rotation would equally affect it.
> > > > 
> > > > Perhaps, the removal was just some mistake. If so, please re-submit
> > > > another patch without it.
> > > > 
> > > > Otherwise, if are there any good reasons for such change, and it won't
> > > > cause any API regressions, please place it on a separate patch, clearly
> > > > that.
> > > > 
> > > > ... Or, maybe you felt that it won't make sense for MC-centric devices.
> > > > On such case, please improve the note stating it on a way that it would
> > > > be understandable on both MC-centric and bridge-centrid drivers.    
> > > 
> > > I'm not dropping the requirement, I'm rewriting it :-) The patch indeed
> > > removes the above, but adds the following
> > > 
> > > ----
> > > If the driver doesn't advertise the ``V4L2_CAP_IO_MC`` :ref:`capability
> > > <device-capabilities>`, applications shall initialize the ``mbus_code`` field
> > > to zero and drivers shall ignore the value of the field.  Drivers shall
> > > enumerate all image formats. The enumerated formats may depend on the active
> > > input or output of the device.
> > > 
> > > If the driver advertises the ``V4L2_CAP_IO_MC`` :ref:`capability
> > > <device-capabilities>`, applications may initialize the ``mbus_code`` field to
> > > a valid :ref:`media bus format code <v4l2-mbus-pixelcode>`. If the
> > > ``mbus_code`` field is not zero, drivers shall restrict enumeration to only the
> > > image formats that can produce (for video output devices) or be produced from
> > > (for video capture devices) that media bus code.  Regardless of the value of
> > > the ``mbus_code`` field, the enumerated image formats shall not depend on the
> > > active configuration of the video device or device pipeline. Enumeration shall
> > > otherwise operate as previously described.  
> > 
> > Hmm... it took me re-reading this text 4 or 5 times, in order to understand
> > that you're actually meaning bridge-centric devices here :-)
> > 
> > Also, you placed two independent and unrelated information at the same
> > paragraph.
> > 
> > IMHO, you should let it more clear, like, for example adding a numerated
> > list, like:
> > 
> > 1. Bridge-centric devices
> > 
> >    As such devices don't advertise the ``V4L2_CAP_IO_MC`` :ref:`capability
> >    <device-capabilities>`, applications shall initialize the ``mbus_code`` field
> >    to zero and drivers shall ignore the value of the field.  
> 
> I could settle for
> 
>    These devices don't advertise the ``V4L2_CAP_IO_MC`` :ref:`capability
>    <device-capabilities>`. Applications shall initialize the ``mbus_code`` field
>    to zero and drivers shall ignore the value of the field.
> 
> and similarly below. 

Works for me.

> It bothers me though, as "bridge" isn't formally
> defined anywhere in the userspace API documentation.

Actually, I submitted some patches some time ago related to documenting
it. They are the "v8, x/7" at patchwork:

	https://patchwork.linuxtv.org/project/linux-media/list/?series=&submitter=&state=&q=&archive=&delegate=1

> It's more formal to
> explain the behaviour of individual ioctls based solely on the
> V4L2_CAP_IO_MC flag, and gather all the explanation of what
> bridge-centric vs. MC-centric means in a single place, an introductory
> section, instead of spreading it through documentation of individual
> ioctls. 

This patch in particular (from the above series) does that:

	https://patchwork.linuxtv.org/patch/44904/

-

That's said, that series is outdated. IMO, we should do another spin 
on that, in the light of the V4L2_CAP_IO_MC changes (making the 
introductory chapter point to it).

I'll seek for some time and re-submit such patchset.

> V4L2 has more UAPI documentation than most other kernel APIs,
> but there are lots of places where details are not very clear.
> Standardizing ioctl documentation on the use of common vocabulary
> ("may", "shall", ...) and using clearly defined concepts (e.g.
> V4L2_CAP_IO_MC) instead of losely defined ones (e.g. Bridge-centric
> devices) that are explained in non-normative sections would increase
> clarity. I thus prefer the wording in v8.1 of this patch, or possibly
> with the small extension I've proposed in my previous e-mail.

See, my proposal is to have both ;-)

The list have the "less formal" definition (MC-centric x bridge-centric),
with is how media developers usually refer to those (as you did at
the subject of this patch series), while the contents preserve a more 
technical definition, based on V4L2_CAP_IO_MC field.

> 
> Hans, Sakari, what do you think ?
> 
> > 
> >    Drivers shall enumerate all image formats. The enumerated formats may depend
> >    on the active input or output of the device.
> > 
> > 2. MC-centric devices
> > 
> >   As such devices advertise the ``V4L2_CAP_IO_MC`` :ref:`capability
> >   <device-capabilities>`, applications may initialize the ``mbus_code`` field to
> >   a valid :ref:`media bus format code <v4l2-mbus-pixelcode>`. 
> > 
> >   If the ``mbus_code`` field is not zero, drivers shall restrict enumeration to 
> >   only the image formats that can produce (for video output devices) or be produced 
> >   from (for video capture devices) that media bus code.  
> > 
> >   Regardless of the value of the ``mbus_code`` field, the enumerated image formats
> >   shall not depend on the active configuration of the video device or device
> >   pipeline. Enumeration shall otherwise operate as previously described.
> > 
> > - 
> > 
> > On a side note: can a MC-centric device fill ``mbus_code`` field with zero?  
> 
> I assume you mean application here ? mbus_code is set by applications.
> 
> > The second paragraph seems to contradict the first one with mandates that
> > ``mbus_code`` should be a valid format.  
> 
> The first paragraph says that applications "may" set the field. The
> second paragraph explains what happens if they do.

Ok. I would then write it as:

 2. MC-centric devices
 
   These devices advertise the ``V4L2_CAP_IO_MC`` :ref:`capability
   <device-capabilities>`.

   Applications shall initialize the ``mbus_code`` field to zero or to
   a valid :ref:`media bus format code <v4l2-mbus-pixelcode>`. 
 
   If the ``mbus_code`` field is zero, the driver shall return all
   media formats supported by the driver. Otherwise, drivers shall
   restrict enumeration to only the image formats that can produce 
   (for video output devices) or be produced from (for video capture
   devices) that media bus code.

   If the ``mbus_code`` is not valid or if it is not supported, the
   driver shall return -EINVAL.
 
   Regardless of the value of the ``mbus_code`` field, the enumerated image
   formats shall not depend on the active configuration of the video device
   or device pipeline. Enumeration shall otherwise operate as previously
   described.


> 
> > > ----
> > > 
> > > Note the last sentence for the !V4L2_CAP_IO_MC case:
> > > 
> > > "The enumerated formats may depend on the active input or output of the
> > > device."
> > > 
> > > We can extend it with
> > > 
> > > "The enumerated formats may depend on the active input or output of the
> > > device, switching the input or output may thus produce different lists
> > > of enumerated formats."  
> > 
> > That sounds better, but "may" seems to weak for my taste. So, I would 
> > also add:
> > 
> >   Applications should (re)call VIDIOC_ENUM_FMT after changing the ative
> >   input or output of the device.  
> 
> That only applies if they need to enumerate formats in the first place.
> I'd prefer avoiding making this more complex. "may" is standard
> vocabulary in specifications to indicate a permitted behaviour. How
> applications react to that is based on their needs, and I don't think
> here is the right place to try and imagine what those needs are.

Works for me.

Thanks,
Mauro
