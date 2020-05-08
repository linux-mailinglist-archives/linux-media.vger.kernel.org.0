Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BBD81CB0A0
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2020 15:40:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727111AbgEHNkc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 May 2020 09:40:32 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:44771 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726736AbgEHNkc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 8 May 2020 09:40:32 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id X3Enj10zd8hmdX3EqjIOb9; Fri, 08 May 2020 15:40:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1588945229; bh=wjwTOfuLg96yf4d6kc5oMQxjs4I9SUOPq6JdAXfHXAI=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Lf4ABk2forx/Hq2MbTwqtUAL7pYYw1/OYOcrbS1h4iMXro/k5e6APspg82NVIl0cX
         plsf00ko2bQWpcCocW5kXjaDJA2J6KAQ0tkyP7uhCU4Wu5DZsDiz08WSQoBz6Gmtx4
         4EfjDBB4pY1KKVdyzePp0UK3Mj+m6j0Tz9iL9l4M/DD5zHxtmM0W5fNxTfmkGYRujY
         kGoWX1abTJrxJsvgBSIeynxNpLwo+gxbuZdv0eOBPomHJoT4t+oQEyG8Ntr/H2oV0n
         imf1GTsRbRAecrv0E6jWQ4dkqmuPX4cn/yAzdwj4sHoTwRCzVs6JSfuD4s1yMBexLV
         k2TRfko91ax6Q==
Subject: Re: [PATCH v9 3/5] media: docs: add glossary.rst with common terms
 used at V4L2 spec
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
References: <cover.1588943181.git.mchehab+huawei@kernel.org>
 <03ae8cfd780924080f48154569c7fa26b6e92ab3.1588943181.git.mchehab+huawei@kernel.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <cf9f5a08-4c32-febe-52e9-56d2233c387a@xs4all.nl>
Date:   Fri, 8 May 2020 15:40:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <03ae8cfd780924080f48154569c7fa26b6e92ab3.1588943181.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfO0av1QRds6QGJA6naeLWvjOjky3qFbZVCxMYqEiOUPCWyKcEFYqUM4HtgY8MSrnJp1FdKEIhmShGd+DmDF5eOdCgmBhauxkTncPbZKEMRQKD4wanFfw
 Te+SHhOv10sy9uEtFY38+t5Jtshl4aWe+tVUx+ZTs2UCNXYd+oHDb2yxYIxxrXxaoJDG1lN5SJc+i/20JPyC64e+I7oCctSZOHpiOBSva5BE6P20Ugi311ZT
 xHaxTk9ssuSHBtpVE1/hVpi632gsxMYjEhVlnVF2X+XWrd/ObcyExR4ZheeFajZrDpK2OLLkBslk6nmkyMmLyg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 08/05/2020 15:10, Mauro Carvalho Chehab wrote:
> Add a glossary of terms used within the media userspace API
> documentation, as several concepts are complex enough to cause
> misunderstandings.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  .../userspace-api/media/glossary.rst          | 182 ++++++++++++++++++
>  Documentation/userspace-api/media/index.rst   |   3 +
>  2 files changed, 185 insertions(+)
>  create mode 100644 Documentation/userspace-api/media/glossary.rst
> 
> diff --git a/Documentation/userspace-api/media/glossary.rst b/Documentation/userspace-api/media/glossary.rst
> new file mode 100644
> index 000000000000..18a1ace00159
> --- /dev/null
> +++ b/Documentation/userspace-api/media/glossary.rst
> @@ -0,0 +1,182 @@
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
> +   This goal of this section is to standardize the terms used within the media

This -> The

> +   userspace API documentation. It is written incrementally as they are
> +   standardized in the media documentation.
> +
> +   So, it is a Work In Progress.

I'd just say:

userspace API documentation. This is Work in Progress.

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
> +	ransfer data in and out of a Kernel driver.

ransfer -> transfer

> +
> +    Digital TV API
> +	**Previously known as DVB API**
> +
> +	An API designed to control a subset of the :term:`Media Hardware`
> +	that implements	digital TV.

I think it will help to provide some examples, e.g.:

that implements digital TV (e.g. DVB, ATSC, etc.).

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
> +	See :doc:`v4l/v4l2`.

Is that the right reference? I'd expect that v4l/v4l2 refers to the V4L2 API
and not the whole media API.

> +
> +    MC API
> +	**Media Controller API**
> +
> +	An API designed to expose and control the relationships between
> +	devices and sub-devices.

I'd say 'media devices and sub-devices'. Otherwise it would suggest that
the MC API also supports non-media devices.

> +
> +	See :ref:`media_controller`.
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
> +    V4L2 Hardware
> +	Part of a media hardware with is supported by the :term:`V4L2 API`.

of a -> of the
with -> which

> +
> +    V4L2 Sub-device
> +	V4L2 hardware components that aren't controlled by a
> +	:term:`bridge driver`.

I'd give some examples here as well: sensors, HDMI receivers, scalers,
deinterlacers. Otherwise this is too vague.

> +
> +    V4L2 Sub-device API
> +	Part of the :term:`V4L2 API` which control

control -> controls

> +	:term:`V4L2 sub-devices <V4L2 Sub-device>`.
> +
> +	See :ref:`subdev`.
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
> 

Regards,

	Hans
