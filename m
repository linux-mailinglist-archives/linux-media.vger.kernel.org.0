Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA8EE45656
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2019 09:31:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726028AbfFNHbA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Jun 2019 03:31:00 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:50955 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725858AbfFNHbA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Jun 2019 03:31:00 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud7.xs4all.net with ESMTPA
        id bgflhW4t15qKabgfohKiUw; Fri, 14 Jun 2019 09:30:57 +0200
Subject: Re: [PATCH 4/4] media: docs: create vimc documentation
To:     =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@collabora.com>,
        linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, helen.koike@collabora.com,
        kernel@collabora.com, lkcamp@lists.libreplanetbr.org,
        linux-kernel@vger.kernel.org
References: <20190613150616.19336-1-andrealmeid@collabora.com>
 <20190613150616.19336-5-andrealmeid@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <4359daf5-4a0c-64b4-46ad-75eba4e9016f@xs4all.nl>
Date:   Fri, 14 Jun 2019 09:30:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190613150616.19336-5-andrealmeid@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfJHfANkmbWcf/XPPcs5gIJktZc8rJJNzs+iu5+Ag9RH0QrsKy78MhinbGsEJNMrAqPFutGUCMdTPl4FshpPeAPTTgweB2Nku/YMWr4tTh6miecyqjUYy
 2LsEXIayRo73USnLiEgcCZmDE/qx16vNsaicmdTaiE13FaSHJOY5ZkF6v9De8n6CjCdRVO6ve3v7XFKgLFld8DUHdq9ZHzG2A+Xr7lGb+zseOnQr/bFEnxbG
 P4kI1r8Mt7YO4HbNVe2ICSBpOFX0KVQ5zZX2JtPARxhBTH50DwjMvYZ1luoL77dWMm05s/q/hYbQIP81oFc6m+NswRdwtQIPyAf6RuaBoos7dNXXwEpohYlX
 YmiLF/mUcQxWC1ORqkdQUvNk70FPBjajvV/hS/D6bcB87MCxbbU=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi André,

Thanks for working one this, very nice to have this documentation.

Some comments below:

On 6/13/19 5:06 PM, André Almeida wrote:
> Create vimc documentation file to explain it basics features, it's
> topology, how to configure it and to document vimc's subdevices.
> 
> Signed-off-by: André Almeida <andrealmeid@collabora.com>
> Suggested-by: Helen Koike <helen.koike@collabora.com>
> ---
>  Documentation/media/v4l-drivers/index.rst |  1 +
>  Documentation/media/v4l-drivers/vimc.dot  | 22 +++++
>  Documentation/media/v4l-drivers/vimc.rst  | 98 +++++++++++++++++++++++
>  3 files changed, 121 insertions(+)
>  create mode 100644 Documentation/media/v4l-drivers/vimc.dot
>  create mode 100644 Documentation/media/v4l-drivers/vimc.rst
> 
> diff --git a/Documentation/media/v4l-drivers/index.rst b/Documentation/media/v4l-drivers/index.rst
> index 33a055907258..c4c78a28654c 100644
> --- a/Documentation/media/v4l-drivers/index.rst
> +++ b/Documentation/media/v4l-drivers/index.rst
> @@ -64,5 +64,6 @@ For more details see the file COPYING in the source distribution of Linux.
>  	si476x
>  	soc-camera
>  	uvcvideo
> +	vimc
>  	vivid
>  	zr364xx
> diff --git a/Documentation/media/v4l-drivers/vimc.dot b/Documentation/media/v4l-drivers/vimc.dot
> new file mode 100644
> index 000000000000..57863a13fa39
> --- /dev/null
> +++ b/Documentation/media/v4l-drivers/vimc.dot
> @@ -0,0 +1,22 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +digraph board {
> +	rankdir=TB
> +	n00000001 [label="{{} | Sensor A\n/dev/v4l-subdev0 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
> +	n00000001:port0 -> n00000005:port0 [style=bold]
> +	n00000001:port0 -> n0000000b [style=bold]
> +	n00000003 [label="{{} | Sensor B\n/dev/v4l-subdev1 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
> +	n00000003:port0 -> n00000008:port0 [style=bold]
> +	n00000003:port0 -> n0000000f [style=bold]
> +	n00000005 [label="{{<port0> 0} | Debayer A\n/dev/v4l-subdev2 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> +	n00000005:port1 -> n00000017:port0
> +	n00000008 [label="{{<port0> 0} | Debayer B\n/dev/v4l-subdev3 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> +	n00000008:port1 -> n00000017:port0 [style=dashed]
> +	n0000000b [label="Raw Capture 0\n/dev/video0", shape=box, style=filled, fillcolor=yellow]
> +	n0000000f [label="Raw Capture 1\n/dev/video1", shape=box, style=filled, fillcolor=yellow]
> +	n00000013 [label="RGB/YUV Input\n/dev/video2", shape=box, style=filled, fillcolor=yellow]
> +	n00000013 -> n00000017:port0 [style=dashed]
> +	n00000017 [label="{{<port0> 0} | Scaler\n/dev/v4l-subdev4 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> +	n00000017:port1 -> n0000001a [style=bold]
> +	n0000001a [label="RGB/YUV Capture\n/dev/video3", shape=box, style=filled, fillcolor=yellow]
> +}
> diff --git a/Documentation/media/v4l-drivers/vimc.rst b/Documentation/media/v4l-drivers/vimc.rst
> new file mode 100644
> index 000000000000..bd98c55a0025
> --- /dev/null
> +++ b/Documentation/media/v4l-drivers/vimc.rst
> @@ -0,0 +1,98 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +The Virtual Media Controller Driver (vimc)
> +==========================================
> +
> +The Vimc driver emulates the V4L2 API and the Media API as well. Its goal is to

Vimc -> vimc

It doesn't emulate these APIs, it emulates complex video hardware using these APIs.

> +emulate complex devices and topologies. In the actual state, it has a capture

Drop 'In the actual state, '.

> +device and three subdevices: sensor, debayer and scaler.
> +
> +Topology
> +--------
> +
> +The topology is hardcoded, although you could modify it on vimc-core and

on -> in

> +recompile the driver to achieve your own topology. This is the default topology:
> +
> +.. _vimc_topology_graph:
> +
> +.. kernel-figure:: vimc.dot
> +    :alt:   vimc.dot
> +    :align: center
> +
> +    Media pipeline graph on Vimc
> +
> +Configuring the topology
> +~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Each subdevice will come with its default configuration (pixelformat, height,
> +width, ...). One needs to configure the topology in order to match the
> +configuration on each linked subdevice to stream frames through the pipeline.
> +If the configuration doesn't match, the stream will fail. The ``v4l2-utils``
> +is a bundle of user-space applications, that comes with ``media-ctl`` and
> +``v4l2-clt`` that can be used in combination to configure. This sequence of

v4l2-clt -> v4l2-ctl

in combination to configure -> to configure the vimc configuration.

> +commands fits for the default topology:
> +
> +.. code-block:: bash
> +
> +        media-ctl -d platform:vimc -V '"Sensor A":0[fmt:SBGGR8_1X8/640x480]'
> +        media-ctl -d platform:vimc -V '"Debayer A":0[fmt:SBGGR8_1X8/640x480]'
> +        media-ctl -d platform:vimc -V '"Sensor B":0[fmt:SBGGR8_1X8/640x480]'
> +        media-ctl -d platform:vimc -V '"Debayer B":0[fmt:SBGGR8_1X8/640x480]'
> +        v4l2-ctl -z platform:vimc -d "RGB/YUV Capture" -v width=1920,height=1440
> +        v4l2-ctl -z platform:vimc -d "Raw Capture 0" -v pixelformat=BA81
> +        v4l2-ctl -z platform:vimc -d "Raw Capture 1" -v pixelformat=BA81
> +
> +Subdevices
> +----------
> +
> +Subdevices define the behavior of an entity in the topology. Depending on the
> +subdevice, the entity can have multiple pads of type source or sink.
> +
> +vimc-sensor:
> +	Generates images in several formats using video test pattern generator.
> +	Exposes:
> +
> +	* 1 Pad source
> +
> +vimc-debayer:
> +	Transforms images in bayer format into a non-bayer format.
> +	Exposes:
> +
> +	* 1 Pad sink
> +	* 1 Pad source
> +
> +vimc-scaler:
> +	Multiplies the size of the image by 9 (this value can be configured,
> +        see at `Modules options`_).

It's a bit ambiguous: I assume you mean that the images is scaled up by a
factor of 3? So 640x480 becomes 1920x1440?

> +	Exposes:
> +
> +	* 1 Pad sink
> +	* 1 Pad source
> +
> +vimc-capture:
> +	Exposes node /dev/videoX to allow userspace to capture the stream.
> +	Exposes:
> +
> +	* 1 Pad sink
> +	* 1 Pad source
> +
> +Modules options

Modules -> Module

> +---------------
> +
> +Vimc has a few module parameters to configure the driver. You should pass
> +those arguments to each subdevice, not for the Vimc module. For example::

for the -> to the

> +
> +        vimc_subvice.param=value

subvice -> subdevice

> +
> +* ``vimc_scaler.sca_mult=<unsigned int>``
> +
> +        Image size multiplier factor to be used to multiply both width and
> +        height, so the image size will be ``sca_mult^2`` bigger than the
> +        original one. Currently, only supports scaling up (the default value
> +        is 3).
> +
> +* ``vimc_debayer.deb_mean_win_size=<unsigned int>``
> +
> +        Window size to calculate the mean. Note: the window size needs to be an
> +        odd number, as the main pixel stays in the center of the window,
> +        otherwise the next odd number is considered (the default value is 3).
> 

Regards,

	Hans
