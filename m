Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4FEF1CD27A
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2020 09:21:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727913AbgEKHVU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 May 2020 03:21:20 -0400
Received: from mga12.intel.com ([192.55.52.136]:25604 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725916AbgEKHVU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 May 2020 03:21:20 -0400
IronPort-SDR: VF9qGIVBWIkuyHFYhqoUXSfqqu0i4zjzTVlM9D6Dr2JJfvBM0Dr2YwMu+AT2tJSTfhbUfuXwpi
 SN0pGHQjp4zw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2020 00:21:20 -0700
IronPort-SDR: q/E831QAP5/ndS2HAoNAZCjSs9P5FqSUd95vcbenzQjRGUN9N3dbSMKwhqxOUcuyKEsTMos/VF
 930gvM8uvOxQ==
X-IronPort-AV: E=Sophos;i="5.73,378,1583222400"; 
   d="scan'208";a="265068343"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2020 00:21:17 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id D505D207FE; Mon, 11 May 2020 10:21:14 +0300 (EEST)
Date:   Mon, 11 May 2020 10:21:14 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>, libcamera-devel@lists.libcamera.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh@kernel.org>, tfiga@google.com, pavel@ucw.cz,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v10 03/13] dt-bindings: Add media properties
Message-ID: <20200511072114.GC11272@paasikivi.fi.intel.com>
References: <20200508100158.3437161-1-jacopo@jmondi.org>
 <20200508100158.3437161-4-jacopo@jmondi.org>
 <c09f2875-b9ca-8154-0491-3c5da1dc0c10@xs4all.nl>
 <20200509082132.zpojrdqcleb2dgp2@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200509082132.zpojrdqcleb2dgp2@uno.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo, Hans,

On Sat, May 09, 2020 at 10:21:32AM +0200, Jacopo Mondi wrote:
> Hi Hans,
> 
> On Fri, May 08, 2020 at 01:04:24PM +0200, Hans Verkuil wrote:
> > On 08/05/2020 12:01, Jacopo Mondi wrote:
> > > Add a DT header file to contain definitions for standard media properties.
> > >
> > > The file is named after:
> > > Documentation/devicetree/bindings/media/video-interfaces.txt
> > > which contains the standard media properties definitions.
> > >
> > > Initially add three macros to define the supported 'orientation'
> > > property values.
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> >
> > For v11 just move this to the end of the series since it is an independent
> > patch.
> 
> Ack, I can leave it out as well, since I have no users if not a local
> one for testing.
> 
> >
> > > ---
> > >  include/dt-bindings/media/video-interfaces.h | 15 +++++++++++++++
> > >  1 file changed, 15 insertions(+)
> > >  create mode 100644 include/dt-bindings/media/video-interfaces.h
> > >
> > > diff --git a/include/dt-bindings/media/video-interfaces.h b/include/dt-bindings/media/video-interfaces.h
> > > new file mode 100644
> > > index 0000000000000..404c697d6bd6e
> > > --- /dev/null
> > > +++ b/include/dt-bindings/media/video-interfaces.h
> > > @@ -0,0 +1,15 @@
> > > +/* SPDX-License-Identifier: GPL-2.0-only */
> > > +/*
> > > + * include/dt-bindings/media/video-interfaces.h
> > > + *
> > > + * Copyright (C) 2020 Jacopo Mondi <jacopo@jmondi.org>
> > > + */
> > > +
> > > +#ifndef __DT_BINDINGS_MEDIA_VIDEO_INTERFACES_H__
> > > +#define __DT_BINDINGS_MEDIA_VIDEO_INTERFACES_H__
> > > +
> > > +#define FRONT_CAMERA		<0>
> > > +#define BACK_CAMERA		<1>
> > > +#define EXTERNAL_CAMERA		<2>
> >
> > Wouldn't it be better to say CAMERA_FRONT (i.e. swap the words) or
> > even CAMERA_ORIENTATION_FRONT?
> 
> Once I wrote
>                 orientation = CAMERA_FRONT;
> 
> I realized that it was nicer to have
> 
>                 orientation = FRONT_CAMERA:
> 
> I'll stop bikeshedding though and wait for other comments to see if
> this can be included or not.

I'd be in favour of having "CAMERA" first. That gives it a nice prefix.

-- 
Kind regards,

Sakari Ailus
