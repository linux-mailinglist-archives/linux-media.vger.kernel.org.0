Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FC0E1CB1C0
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2020 16:26:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726767AbgEHO0B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 May 2020 10:26:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:47484 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726636AbgEHO0B (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 8 May 2020 10:26:01 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C473F24954;
        Fri,  8 May 2020 14:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588947960;
        bh=gDzH9B43zeVtlI6rs5TISDJzieOrzOZ0VWMVO+NXxmU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=quIjxeD08yeErYGFQ7EEV77532VXeqI7xnxgcmj5Hp1roLNrnMUtfe7h2W51p/gXT
         UnWDUyHYlruzbzjVfOw10PCinWPPprU1CoNHq7DcscqwVjTFdpJNIas+Cp9Xeq2cGs
         Ce+nhL3wBa1MhlO5jixtVJr/VdV2R/bRbQmhw0w8=
Date:   Fri, 8 May 2020 16:25:56 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v9 3/5] media: docs: add glossary.rst with common terms
 used at V4L2 spec
Message-ID: <20200508162556.048a7868@coco.lan>
In-Reply-To: <cf9f5a08-4c32-febe-52e9-56d2233c387a@xs4all.nl>
References: <cover.1588943181.git.mchehab+huawei@kernel.org>
        <03ae8cfd780924080f48154569c7fa26b6e92ab3.1588943181.git.mchehab+huawei@kernel.org>
        <cf9f5a08-4c32-febe-52e9-56d2233c387a@xs4all.nl>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Fri, 8 May 2020 15:40:25 +0200
Hans Verkuil <hverkuil-cisco@xs4all.nl> escreveu:

> On 08/05/2020 15:10, Mauro Carvalho Chehab wrote:
> > Add a glossary of terms used within the media userspace API
> > documentation, as several concepts are complex enough to cause
> > misunderstandings.
> >=20
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > ---
> >  .../userspace-api/media/glossary.rst          | 182 ++++++++++++++++++
> >  Documentation/userspace-api/media/index.rst   |   3 +
> >  2 files changed, 185 insertions(+)
> >  create mode 100644 Documentation/userspace-api/media/glossary.rst
> >=20
> > diff --git a/Documentation/userspace-api/media/glossary.rst b/Documenta=
tion/userspace-api/media/glossary.rst
> > new file mode 100644
> > index 000000000000..18a1ace00159
> > --- /dev/null
> > +++ b/Documentation/userspace-api/media/glossary.rst
> > @@ -0,0 +1,182 @@
> > +.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-or-later
> > +
> > +.. For GPL-2.0, see LICENSES/preferred/GPL-2.0
> > +..
> > +.. For GFDL-1.1-or-later, see:
> > +..
> > +.. Permission is granted to copy, distribute and/or modify this docume=
nt
> > +.. under the terms of the GNU Free Documentation License, Version 1.1 =
or
> > +.. any later version published by the Free Software Foundation, with no
> > +.. Invariant Sections, no Front-Cover Texts and no Back-Cover Texts.
> > +.. A copy of the license is included at
> > +.. Documentation/userspace-api/media/fdl-appendix.rst.
> > +
> > +=3D=3D=3D=3D=3D=3D=3D=3D
> > +Glossary
> > +=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +.. note::
> > +
> > +   This goal of this section is to standardize the terms used within t=
he media =20
>=20
> This -> The
>=20
> > +   userspace API documentation. It is written incrementally as they are
> > +   standardized in the media documentation.
> > +
> > +   So, it is a Work In Progress. =20
>=20
> I'd just say:
>=20
> userspace API documentation. This is Work in Progress.
>=20
> > +
> > +.. Please keep the glossary entries in alphabetical order
> > +
> > +.. glossary::
> > +
> > +    Bridge Driver
> > +	A :term:`device driver` that implements the main logic to talk with
> > +	media hardware.
> > +
> > +    CEC API
> > +	**Consumer Electronics Control API**
> > +
> > +	An API designed to receive and transmit data via an HDMI
> > +	CEC interface.
> > +
> > +	See :ref:`cec`.
> > +
> > +    Device Driver
> > +	Part of the Linux Kernel that implements support for a hardware
> > +	component.
> > +
> > +    Device Node
> > +	A character device node in the file system used to control and
> > +	ransfer data in and out of a Kernel driver. =20
>=20
> ransfer -> transfer
>=20
> > +
> > +    Digital TV API
> > +	**Previously known as DVB API**
> > +
> > +	An API designed to control a subset of the :term:`Media Hardware`
> > +	that implements	digital TV. =20
>=20
> I think it will help to provide some examples, e.g.:
>=20
> that implements digital TV (e.g. DVB, ATSC, etc.).

For the above: Ok!

>=20
> > +
> > +	See :ref:`dvbapi`.
> > +
> > +    DSP
> > +        **Digital Signal Processor**
> > +
> > +	A specialized :term:`Microprocessor`, with its architecture
> > +	optimized for the operational needs of digital signal processing.
> > +
> > +    FPGA
> > +	**Field-programmable Gate Array**
> > +
> > +	An :term:`IC` circuit designed to be configured by a customer or
> > +	a designer after manufacturing.
> > +
> > +	See https://en.wikipedia.org/wiki/Field-programmable_gate_array.
> > +
> > +    I=C2=B2C
> > +	**Inter-Integrated Circuit**
> > +
> > +	A  multi-master, multi-slave, packet switched, single-ended,
> > +	serial computer bus used to control some hardware components
> > +	like sub-device hardware components.
> > +
> > +	See http://www.nxp.com/docs/en/user-guide/UM10204.pdf.
> > +
> > +    IC
> > +	**Integrated circuit**
> > +
> > +	A set of electronic circuits on one small flat piece of
> > +	semiconductor material, normally silicon.
> > +
> > +	Also known as chip.
> > +
> > +    IP Block
> > +	**Intellectual property core**
> > +
> > +	In electronic design a semiconductor intellectual property core,
> > +	is a reusable unit of logic, cell, or integrated circuit layout
> > +	design that is the intellectual property of one party.
> > +	IP Blocks may be licensed to another party or can be owned
> > +	and used by a single party alone.
> > +
> > +	See https://en.wikipedia.org/wiki/Semiconductor_intellectual_property=
_core).
> > +
> > +    ISP
> > +	**Image Signal Processor**
> > +
> > +	A specialized processor that implements a set of algorithms for
> > +	processing image data. ISPs may implement algorithms for lens
> > +	shading correction, demosaicing, scaling and pixel format conversion
> > +	as well as produce statistics for the use of the control
> > +	algorithms (e.g. automatic exposure, white balance and focus).
> > +
> > +    Media API
> > +	A set of userspace APIs used to control the media hardware. It is
> > +	composed by:
> > +
> > +	  - :term:`CEC API`;
> > +	  - :term:`Digital TV API`;
> > +	  - :term:`MC API`;
> > +	  - :term:`RC API`; and
> > +	  - :term:`V4L2 API`.
> > +
> > +	See :doc:`v4l/v4l2`. =20
>=20
> Is that the right reference? I'd expect that v4l/v4l2 refers to the V4L2 =
API
> and not the whole media API.

That's the right reference: userspace-api/media/v4l/v4l2.rst file has
just the V4L2 API.

The entire API file is now at userspace-api/media/index.html.

>=20
> > +
> > +    MC API
> > +	**Media Controller API**
> > +
> > +	An API designed to expose and control the relationships between
> > +	devices and sub-devices. =20
>=20
> I'd say 'media devices and sub-devices'. Otherwise it would suggest that
> the MC API also supports non-media devices.

Yeah, it sounds too generic, but MC is currently used also by audio
devices.

Ok, "audio" is "media", but not covered by this spec.=20

We might use "multimedia" or some similar word. What do you think?

Thanks,
Mauro
