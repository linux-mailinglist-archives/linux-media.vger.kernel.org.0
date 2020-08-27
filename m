Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AD1C254579
	for <lists+linux-media@lfdr.de>; Thu, 27 Aug 2020 14:56:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729171AbgH0Msh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Aug 2020 08:48:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:33422 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729089AbgH0MsR (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Aug 2020 08:48:17 -0400
Received: from coco.lan (ip5f5ad5a8.dynamic.kabel-deutschland.de [95.90.213.168])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 34B6122CAE;
        Thu, 27 Aug 2020 12:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598532496;
        bh=T573s1h+OfVtbSoERHdm73xj5TCvPh4oK6PieFQpZAE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=hJqY4JeltsfxL3WzzYk92n9b1vbGGYgmmi22jV1OgCNuS5IK6lgdQLOdCE9lhe0wi
         6fZfF1IXWaxjOyFQ2m3jeuhbwWn8F7DOmMcTOm3uCsYT0c4wnvr0D6DtH8ECFbf4mD
         Ww7fFDTU2TItsxbjUIkR3XdNduLgpIhmvdYdjwUs=
Date:   Thu, 27 Aug 2020 14:48:12 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v10 3/4] media: docs: add glossary.rst with common terms
 used at V4L2 spec
Message-ID: <20200827144812.14755f97@coco.lan>
In-Reply-To: <20200827110811.GC851@valkosipuli.retiisi.org.uk>
References: <cover.1598512802.git.mchehab+huawei@kernel.org>
        <a7a4d5ecce953710119e7aa0c5d55f97052a75e8.1598512802.git.mchehab+huawei@kernel.org>
        <20200827110811.GC851@valkosipuli.retiisi.org.uk>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 27 Aug 2020 14:08:11 +0300
Sakari Ailus <sakari.ailus@iki.fi> escreveu:

> Hi Mauro,
>=20
> On Thu, Aug 27, 2020 at 09:21:47AM +0200, Mauro Carvalho Chehab wrote:
> > Add a glossary of terms used within the media userspace API
> > documentation, as several concepts are complex enough to cause
> > misunderstandings.
> >=20
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > ---
> >  .../userspace-api/media/glossary.rst          | 216 ++++++++++++++++++
> >  Documentation/userspace-api/media/index.rst   |   3 +
> >  2 files changed, 219 insertions(+)
> >  create mode 100644 Documentation/userspace-api/media/glossary.rst
> >=20
> > diff --git a/Documentation/userspace-api/media/glossary.rst b/Documenta=
tion/userspace-api/media/glossary.rst
> > new file mode 100644
> > index 000000000000..45f0933e03c0
> > --- /dev/null
> > +++ b/Documentation/userspace-api/media/glossary.rst
> > @@ -0,0 +1,216 @@
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
> > +   The goal of this section is to standardize the terms used within th=
e media
> > +   userspace API documentation. This is Work In Progress.
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
> > +	transfer data in and out of a Kernel driver.
> > +
> > +    Digital TV API
> > +	**Previously known as DVB API**
> > +
> > +	An API designed to control a subset of the :term:`Media Hardware`
> > +	that implements	digital TV (e. g. DVB, ATSC, ISDB, etc).
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
> > +    Hardware Component
> > +	A subset of the :term:`media hardware`. For example an :term:`I=C2=B2=
C` or
> > +	:term:`SPI` device, or an :term:`IP block` inside an
> > +	:term:`SoC` or :term:`FPGA`.
> > +
> > +    Hardware Peripheral
> > +	A group of :term:`hardware components <hardware component>` that
> > +	together make a larger user-facing functional peripheral. For
> > +	instance, the :term:`SoC` :term:`ISP` :term:`IP block <ip block>`
> > +	and the external camera sensors together make a camera hardware
> > +	peripheral.
> > +
> > +	Also known as :term:`peripheral`.
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
> > +	See :doc:`index`.
> > +
> > +    MC API
> > +	**Media Controller API**
> > +
> > +	An API designed to expose and control the relationships between
> > +	multimedia devices and sub-devices.
> > +
> > +	See :ref:`media_controller`.
> > +
> > +    MC-centric
> > +	:term:`V4L2 hardware` that requires a :term:`MC API`.
> > +
> > +	Such hardware have ``V4L2_CAP_IO_MC`` device_caps field set
> > +	(see :ref:`VIDIOC_QUERYCAP`).
> > +
> > +	See :ref:`v4l2_hardware_control` for more details. =20
> =09
> I think this should be documented as referring to drivers, for it's a
> property of a driver, not hardware.
>=20
> There is hardware that better fits for MC-enabled drivers but still has
> V4L2-centric driver written for it. The matter is further complicated by
> e.g. raw camera systems that may consist of several different kinds of
> devices, including external ISPs.
>=20
> Say, a simple raw sensor + a CSI-2 receiver would fit for V4L2-centric
> model well, but add a more complex sensor or that external ISP and that no
> longer is the case. The CSI-2 receiver is still the same in both cases
> though.
>=20
> Similar comment on video-node-centric.

Makes sense. Do you have some suggestion for the text??

>=20
> The rest looks fine to me.

Ok.

Thanks,
Mauro
