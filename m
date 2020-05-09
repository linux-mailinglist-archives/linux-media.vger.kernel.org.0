Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2E3D1CBED7
	for <lists+linux-media@lfdr.de>; Sat,  9 May 2020 10:18:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727837AbgEIISZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 May 2020 04:18:25 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:50171 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727803AbgEIISY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 9 May 2020 04:18:24 -0400
X-Originating-IP: 212.216.150.148
Received: from uno.localdomain (a-ur1-85.tin.it [212.216.150.148])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id BFCD140002;
        Sat,  9 May 2020 08:18:19 +0000 (UTC)
Date:   Sat, 9 May 2020 10:21:32 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>, libcamera-devel@lists.libcamera.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh@kernel.org>, tfiga@google.com, pavel@ucw.cz,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v10 03/13] dt-bindings: Add media properties
Message-ID: <20200509082132.zpojrdqcleb2dgp2@uno.localdomain>
References: <20200508100158.3437161-1-jacopo@jmondi.org>
 <20200508100158.3437161-4-jacopo@jmondi.org>
 <c09f2875-b9ca-8154-0491-3c5da1dc0c10@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c09f2875-b9ca-8154-0491-3c5da1dc0c10@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Fri, May 08, 2020 at 01:04:24PM +0200, Hans Verkuil wrote:
> On 08/05/2020 12:01, Jacopo Mondi wrote:
> > Add a DT header file to contain definitions for standard media properties.
> >
> > The file is named after:
> > Documentation/devicetree/bindings/media/video-interfaces.txt
> > which contains the standard media properties definitions.
> >
> > Initially add three macros to define the supported 'orientation'
> > property values.
> >
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
>
> For v11 just move this to the end of the series since it is an independent
> patch.

Ack, I can leave it out as well, since I have no users if not a local
one for testing.

>
> > ---
> >  include/dt-bindings/media/video-interfaces.h | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> >  create mode 100644 include/dt-bindings/media/video-interfaces.h
> >
> > diff --git a/include/dt-bindings/media/video-interfaces.h b/include/dt-bindings/media/video-interfaces.h
> > new file mode 100644
> > index 0000000000000..404c697d6bd6e
> > --- /dev/null
> > +++ b/include/dt-bindings/media/video-interfaces.h
> > @@ -0,0 +1,15 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * include/dt-bindings/media/video-interfaces.h
> > + *
> > + * Copyright (C) 2020 Jacopo Mondi <jacopo@jmondi.org>
> > + */
> > +
> > +#ifndef __DT_BINDINGS_MEDIA_VIDEO_INTERFACES_H__
> > +#define __DT_BINDINGS_MEDIA_VIDEO_INTERFACES_H__
> > +
> > +#define FRONT_CAMERA		<0>
> > +#define BACK_CAMERA		<1>
> > +#define EXTERNAL_CAMERA		<2>
>
> Wouldn't it be better to say CAMERA_FRONT (i.e. swap the words) or
> even CAMERA_ORIENTATION_FRONT?

Once I wrote
                orientation = CAMERA_FRONT;

I realized that it was nicer to have

                orientation = FRONT_CAMERA:

I'll stop bikeshedding though and wait for other comments to see if
this can be included or not.

>
> Regards,
>
> 	Hans
>
> > +
> > +#endif /* __DT_BINDINGS_MEDIA_VIDEO_INTERFACES_H__ */
> > --
> > 2.26.1
> >
>
