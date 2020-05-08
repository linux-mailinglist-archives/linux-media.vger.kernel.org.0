Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A69AE1CB1E2
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2020 16:36:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727082AbgEHOgo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 May 2020 10:36:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:34640 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726689AbgEHOgo (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 8 May 2020 10:36:44 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8EE982083B;
        Fri,  8 May 2020 14:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588948603;
        bh=jqTlb2vYzrNgFL07ZdRIYprWqnjbt5GT2f8R1c508k4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=lgNcnFS9+FjD1wFc2RYf+c7F5sQniML2RhkdsEnBm6mO5UeOaXev7O1musavKd4hg
         X2gPXgx1y969KZpxAl0qqscbG+NU/MYmrf0ZEmAAq37bZDNKXYv8Jt27sUtZnAAfyZ
         TaGunov3jXHWVqJe6S0/s3V2rAZsNrEbrxw2X80s=
Date:   Fri, 8 May 2020 16:36:39 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v9 4/5] media: glossary.rst: add terms for MC-centric
 video-node-centric
Message-ID: <20200508163639.7bf3bde5@coco.lan>
In-Reply-To: <230cccf3-fbe9-5308-9c11-b48aa8382709@xs4all.nl>
References: <cover.1588943181.git.mchehab+huawei@kernel.org>
        <0c083fffe63499a9ce49d30f3c907668299401f1.1588943181.git.mchehab+huawei@kernel.org>
        <230cccf3-fbe9-5308-9c11-b48aa8382709@xs4all.nl>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Fri, 8 May 2020 15:46:50 +0200
Hans Verkuil <hverkuil-cisco@xs4all.nl> escreveu:

> On 08/05/2020 15:10, Mauro Carvalho Chehab wrote:
> > Now that we have a chapter describing hardware control, let's
> > add the terms used there to the glossary.
> >=20
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > ---
> >  .../userspace-api/media/glossary.rst          | 42 ++++++++++++++++---
> >  1 file changed, 37 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/Documentation/userspace-api/media/glossary.rst b/Documenta=
tion/userspace-api/media/glossary.rst
> > index 18a1ace00159..8cdb7900e994 100644
> > --- a/Documentation/userspace-api/media/glossary.rst
> > +++ b/Documentation/userspace-api/media/glossary.rst
> > @@ -69,6 +69,20 @@ Glossary
> > =20
> >  	See https://en.wikipedia.org/wiki/Field-programmable_gate_array.
> > =20
> > +    Hardware Component
> > +	A subset of the :term:`media hardware`. For example an :term:`I=C2=B2=
C` or
> > +	:term:`SPI` device, or an :term:`IP block` inside a =20
>=20
> inside a -> inside an
>=20
> > +	:term:`SoC` or :term:`FPGA`.
> > +
> > +    Hardware Peripheral
> > +	A group of :term:`hardware components <hardware component>` that
> > +	together make a larger user-facing functional peripheral. For
> > +	instance the :term:`SoC` :term:`ISP` :term:`IP	block <ip block>` =20
>=20
> Are there some commas missing here after 'SoC' and 'ISP'?

There is a comma missing, but not at the place you pointed (IMHO) ;-)

Removing the :term: markup, what the above is saying is:

	For  instance, the SoC ISP IP block and external camera=20
	sensors together make a camera hardware peripheral.

Ok, we could just call it as "ISP", instead of trying to be too
formal.

>=20
> > +	and external camera sensors together make a camera hardware
> > +	peripheral.
> > +
> > +	Also known as :term:`peripheral`.
> > +
> >      I=C2=B2C
> >  	**Inter-Integrated Circuit**
> > =20
> > @@ -126,6 +140,14 @@ Glossary
> > =20
> >  	See :ref:`media_controller`.
> > =20
> > +    MC-Centric
> > +	:term:`V4L2 hardware` that requires a :term:`MC API`. =20
>=20
> a -> the
>=20
> > +
> > +	Such hardware have ``V4L2_CAP_IO_MC`` device_caps field unset =20
>=20
> They have that capability set, not unset.

Sorry, cut and paste error... it is identical to the video-node-centric
below ;-)

>=20
> > +	(see :ref:`VIDIOC_QUERYCAP`).
> > +
> > +	See :ref:`v4l2_hardware_control` for more details.
> > +
> >      Media Hardware
> >  	Subset of the hardware that is supported by the Linux Media API.
> > =20
> > @@ -139,6 +161,9 @@ Glossary
> >  	control and input/output (I/O) operations specified by the
> >  	instructions on a single integrated circuit.
> > =20
> > +    Peripheral
> > +	The same as :term:`hardware peripheral`.
> > +
> >      RC API
> >  	**Remote Controller API**
> > =20
> > @@ -168,15 +193,22 @@ Glossary
> >  	The userspace API defined in :ref:`v4l2spec`, which is used to
> >  	control a V4L2 hardware.
> > =20
> > +    V4L2 Device Node
> > +	A :term:`device node` that is associated to a V4L driver.
> > +
> > +	The V4L2 device node naming is specified at :ref:`v4l2_device_naming`.
> > +
> >      V4L2 Hardware
> >  	Part of a media hardware with is supported by the :term:`V4L2 API`.
> > =20
> >      V4L2 Sub-device
> >  	V4L2 hardware components that aren't controlled by a
> > -	:term:`bridge driver`.
> > +	:term:`bridge driver`. See :ref:`subdev`.
> > =20
> > -    V4L2 Sub-device API
> > -	Part of the :term:`V4L2 API` which control
> > -	:term:`V4L2 sub-devices <V4L2 Sub-device>`.
> > +    Video-node-Centric =20
>=20
> Either Video-Node-Centric or Video-node-centric, but not Video-node-Centr=
ic,
> that's inconsistent use of capitals.

Ok.

>=20
> > +	V4L2 hardware that doesn't require a media controller to be used. =20
>=20
> a media controller to be used -> the MC API.
>=20
> > =20
> > -	See :ref:`subdev`.
> > +	Such hardware have ``V4L2_CAP_IO_MC`` device_caps field unset
> > +	(see :ref:`VIDIOC_QUERYCAP`).
> > +
> > +	See :ref:`v4l2_hardware_control` for more details.
> >  =20
>=20
> Regards,
>=20
> 	Hans



Thanks,
Mauro
