Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B7C725444D
	for <lists+linux-media@lfdr.de>; Thu, 27 Aug 2020 13:29:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728445AbgH0L3W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Aug 2020 07:29:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728122AbgH0LQj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Aug 2020 07:16:39 -0400
Received: from hillosipuli.retiisi.org.uk (hillosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7084C06123D;
        Thu, 27 Aug 2020 04:08:20 -0700 (PDT)
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 7590D634C87;
        Thu, 27 Aug 2020 14:08:11 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1kBFlL-0000Wz-Sw; Thu, 27 Aug 2020 14:08:11 +0300
Date:   Thu, 27 Aug 2020 14:08:11 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v10 3/4] media: docs: add glossary.rst with common terms
 used at V4L2 spec
Message-ID: <20200827110811.GC851@valkosipuli.retiisi.org.uk>
References: <cover.1598512802.git.mchehab+huawei@kernel.org>
 <a7a4d5ecce953710119e7aa0c5d55f97052a75e8.1598512802.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a7a4d5ecce953710119e7aa0c5d55f97052a75e8.1598512802.git.mchehab+huawei@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

On Thu, Aug 27, 2020 at 09:21:47AM +0200, Mauro Carvalho Chehab wrote:
> Add a glossary of terms used within the media userspace API
> documentation, as several concepts are complex enough to cause
> misunderstandings.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  .../userspace-api/media/glossary.rst          | 216 ++++++++++++++++++
>  Documentation/userspace-api/media/index.rst   |   3 +
>  2 files changed, 219 insertions(+)
>  create mode 100644 Documentation/userspace-api/media/glossary.rst
> 
> diff --git a/Documentation/userspace-api/media/glossary.rst b/Documentation/userspace-api/media/glossary.rst
> new file mode 100644
> index 000000000000..45f0933e03c0
> --- /dev/null
> +++ b/Documentation/userspace-api/media/glossary.rst
> @@ -0,0 +1,216 @@
> +.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-or-later
> +
> +.. For GPL-2.0, see LICENSES/preferred/GPL-2.0
> +..
> +.. For GFDL-1.1-or-later, see:
> +..
> +.. Permission is granted to copy, distribute and/or modify this document
> +.. under the terms of the GNU Free Documentation License, Version 1.1 or
> +.. any later version published by the Free Software Foundation, with no
> +.. Invariant Sections, no Front-Cover Texts and no Back-Cover Texts.
> +.. A copy of the license is included at
> +.. Documentation/userspace-api/media/fdl-appendix.rst.
> +
> +========
> +Glossary
> +========
> +
> +.. note::
> +
> +   The goal of this section is to standardize the terms used within the media
> +   userspace API documentation. This is Work In Progress.
> +
> +.. Please keep the glossary entries in alphabetical order
> +
> +.. glossary::
> +
> +    Bridge Driver
> +	A :term:`device driver` that implements the main logic to talk with
> +	media hardware.
> +
> +    CEC API
> +	**Consumer Electronics Control API**
> +
> +	An API designed to receive and transmit data via an HDMI
> +	CEC interface.
> +
> +	See :ref:`cec`.
> +
> +    Device Driver
> +	Part of the Linux Kernel that implements support for a hardware
> +	component.
> +
> +    Device Node
> +	A character device node in the file system used to control and
> +	transfer data in and out of a Kernel driver.
> +
> +    Digital TV API
> +	**Previously known as DVB API**
> +
> +	An API designed to control a subset of the :term:`Media Hardware`
> +	that implements	digital TV (e. g. DVB, ATSC, ISDB, etc).
> +
> +	See :ref:`dvbapi`.
> +
> +    DSP
> +        **Digital Signal Processor**
> +
> +	A specialized :term:`Microprocessor`, with its architecture
> +	optimized for the operational needs of digital signal processing.
> +
> +    FPGA
> +	**Field-programmable Gate Array**
> +
> +	An :term:`IC` circuit designed to be configured by a customer or
> +	a designer after manufacturing.
> +
> +	See https://en.wikipedia.org/wiki/Field-programmable_gate_array.
> +
> +    Hardware Component
> +	A subset of the :term:`media hardware`. For example an :term:`I²C` or
> +	:term:`SPI` device, or an :term:`IP block` inside an
> +	:term:`SoC` or :term:`FPGA`.
> +
> +    Hardware Peripheral
> +	A group of :term:`hardware components <hardware component>` that
> +	together make a larger user-facing functional peripheral. For
> +	instance, the :term:`SoC` :term:`ISP` :term:`IP block <ip block>`
> +	and the external camera sensors together make a camera hardware
> +	peripheral.
> +
> +	Also known as :term:`peripheral`.
> +
> +    I²C
> +	**Inter-Integrated Circuit**
> +
> +	A  multi-master, multi-slave, packet switched, single-ended,
> +	serial computer bus used to control some hardware components
> +	like sub-device hardware components.
> +
> +	See http://www.nxp.com/docs/en/user-guide/UM10204.pdf.
> +
> +    IC
> +	**Integrated circuit**
> +
> +	A set of electronic circuits on one small flat piece of
> +	semiconductor material, normally silicon.
> +
> +	Also known as chip.
> +
> +    IP Block
> +	**Intellectual property core**
> +
> +	In electronic design a semiconductor intellectual property core,
> +	is a reusable unit of logic, cell, or integrated circuit layout
> +	design that is the intellectual property of one party.
> +	IP Blocks may be licensed to another party or can be owned
> +	and used by a single party alone.
> +
> +	See https://en.wikipedia.org/wiki/Semiconductor_intellectual_property_core).
> +
> +    ISP
> +	**Image Signal Processor**
> +
> +	A specialized processor that implements a set of algorithms for
> +	processing image data. ISPs may implement algorithms for lens
> +	shading correction, demosaicing, scaling and pixel format conversion
> +	as well as produce statistics for the use of the control
> +	algorithms (e.g. automatic exposure, white balance and focus).
> +
> +    Media API
> +	A set of userspace APIs used to control the media hardware. It is
> +	composed by:
> +
> +	  - :term:`CEC API`;
> +	  - :term:`Digital TV API`;
> +	  - :term:`MC API`;
> +	  - :term:`RC API`; and
> +	  - :term:`V4L2 API`.
> +
> +	See :doc:`index`.
> +
> +    MC API
> +	**Media Controller API**
> +
> +	An API designed to expose and control the relationships between
> +	multimedia devices and sub-devices.
> +
> +	See :ref:`media_controller`.
> +
> +    MC-centric
> +	:term:`V4L2 hardware` that requires a :term:`MC API`.
> +
> +	Such hardware have ``V4L2_CAP_IO_MC`` device_caps field set
> +	(see :ref:`VIDIOC_QUERYCAP`).
> +
> +	See :ref:`v4l2_hardware_control` for more details.
	
I think this should be documented as referring to drivers, for it's a
property of a driver, not hardware.

There is hardware that better fits for MC-enabled drivers but still has
V4L2-centric driver written for it. The matter is further complicated by
e.g. raw camera systems that may consist of several different kinds of
devices, including external ISPs.

Say, a simple raw sensor + a CSI-2 receiver would fit for V4L2-centric
model well, but add a more complex sensor or that external ISP and that no
longer is the case. The CSI-2 receiver is still the same in both cases
though.

Similar comment on video-node-centric.

The rest looks fine to me.

> +
> +    Media Hardware
> +	Subset of the hardware that is supported by the Linux Media API.
> +
> +	This includes audio and video capture and playback hardware,
> +	digital and analog TV, camera sensors, ISPs, remote controllers,
> +	codecs, HDMI Consumer Electronics Control, HDMI capture, etc.
> +
> +    Microprocessor
> +	Electronic circuitry that carries out the instructions of a
> +	computer program by performing the basic arithmetic, logical,
> +	control and input/output (I/O) operations specified by the
> +	instructions on a single integrated circuit.
> +
> +    Peripheral
> +	The same as :term:`hardware peripheral`.
> +
> +    RC API
> +	**Remote Controller API**
> +
> +	An API designed to receive and transmit data from remote
> +	controllers.
> +
> +	See :ref:`remote_controllers`.
> +
> +    SMBus
> +	A subset of I²C, which defines a stricter usage of the bus.
> +
> +    SPI
> +	**Serial Peripheral Interface Bus**
> +
> +	Synchronous serial communication interface specification used for
> +	short distance communication, primarily in embedded systems.
> +
> +    SoC
> +	**System on a Chip**
> +
> +	An integrated circuit that integrates all components of a computer
> +	or other electronic systems.
> +
> +    V4L2 API
> +	**V4L2 userspace API**
> +
> +	The userspace API defined in :ref:`v4l2spec`, which is used to
> +	control a V4L2 hardware.
> +
> +    V4L2 Device Node
> +	A :term:`device node` that is associated to a V4L driver.
> +
> +	The V4L2 device node naming is specified at :ref:`v4l2_device_naming`.
> +
> +    V4L2 Hardware
> +	Part of the media hardware which is supported by the :term:`V4L2 API`.
> +
> +    V4L2 Sub-device
> +	V4L2 hardware components that aren't controlled by a
> +	:term:`bridge driver`. See :ref:`subdev`.
> +
> +    Video-node-centric
> +	V4L2 hardware that doesn't require a media controller to be used.
> +
> +	Such hardware have the ``V4L2_CAP_IO_MC`` device_caps field unset
> +	(see :ref:`VIDIOC_QUERYCAP`).
> +
> +    V4L2 Sub-device API
> +	Part of the :term:`V4L2 API` which control
> +	:term:`V4L2 sub-devices <V4L2 Sub-device>`, like sensors,
> +	HDMI receivers, scalers, deinterlacers.
> +
> +	See :ref:`v4l2_hardware_control` for more details.
> diff --git a/Documentation/userspace-api/media/index.rst b/Documentation/userspace-api/media/index.rst
> index 70a3f3d73698..7f42f83b9f59 100644
> --- a/Documentation/userspace-api/media/index.rst
> +++ b/Documentation/userspace-api/media/index.rst
> @@ -35,6 +35,9 @@ Please see:
>      mediactl/media-controller
>      cec/cec-api
>      gen-errors
> +
> +    glossary
> +
>      fdl-appendix
>  
>      drivers/index

-- 
Sakari Ailus
