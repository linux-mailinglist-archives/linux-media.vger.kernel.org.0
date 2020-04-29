Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 954961BE817
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2020 22:08:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726862AbgD2UIO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Apr 2020 16:08:14 -0400
Received: from mga17.intel.com ([192.55.52.151]:24528 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726456AbgD2UIO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Apr 2020 16:08:14 -0400
IronPort-SDR: kwvhZ03/e5F9V+kx+1fPS3NAdgWz5b3tg46ahY4eXRwTg0UVQb/qXcrdPY0mnn9mXJ/XPUzhKP
 bmQ5PvvFThRA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2020 13:08:12 -0700
IronPort-SDR: Su2Lu5tP4r6TR8aEa3Qsr09txqHFj2Y5G6m9Yc6/f2eDur7BraWwFEYALVoXCRXO8X0rZunJkB
 TcGmxia9UL6w==
X-IronPort-AV: E=Sophos;i="5.73,333,1583222400"; 
   d="scan'208";a="248078171"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2020 13:08:11 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id ED588202AE; Wed, 29 Apr 2020 23:08:08 +0300 (EEST)
Date:   Wed, 29 Apr 2020 23:08:08 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-media@vger.kernel.org,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Helen Koike <helen.koike@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v8.1 3/6] media: v4l2: Extend VIDIOC_ENUM_FMT to support
 MC-centric devices
Message-ID: <20200429200808.GK9190@paasikivi.fi.intel.com>
References: <20200421135743.1381930-4-niklas.soderlund+renesas@ragnatech.se>
 <20200424134331.22271-1-laurent.pinchart@ideasonboard.com>
 <20200429182739.274ce451@coco.lan>
 <20200429163849.GK5956@pendragon.ideasonboard.com>
 <20200429200140.22a4db22@coco.lan>
 <20200429185033.GN5956@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200429185033.GN5956@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent, Mauro,

On Wed, Apr 29, 2020 at 09:50:33PM +0300, Laurent Pinchart wrote:
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
> and similarly below. It bothers me though, as "bridge" isn't formally
> defined anywhere in the userspace API documentation. It's more formal to
> explain the behaviour of individual ioctls based solely on the
> V4L2_CAP_IO_MC flag, and gather all the explanation of what
> bridge-centric vs. MC-centric means in a single place, an introductory

How about "video node centric"? That's what I recall has been used
previously to differentiate regular V4L2 uAPI drivers from MC-centric
drivers. Bridge refers to hardware whereas MC-centric is software, just as
video node centric would be.

> section, instead of spreading it through documentation of individual
> ioctls. V4L2 has more UAPI documentation than most other kernel APIs,
> but there are lots of places where details are not very clear.
> Standardizing ioctl documentation on the use of common vocabulary
> ("may", "shall", ...) and using clearly defined concepts (e.g.
> V4L2_CAP_IO_MC) instead of losely defined ones (e.g. Bridge-centric
> devices) that are explained in non-normative sections would increase
> clarity. I thus prefer the wording in v8.1 of this patch, or possibly
> with the small extension I've proposed in my previous e-mail.
> 
> Hans, Sakari, what do you think ?

My preference is with v8.1 wording, with bridge-centric replaced by video
node centric. This is because it differentiates between the flag what
actually defines device behaviour. That's what applications see, they don't
necessarily know what kind of devices they're working with when they open
the device node.

-- 
Kind regards,

Sakari Ailus
