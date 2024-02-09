Return-Path: <linux-media+bounces-4904-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD0A84FC31
	for <lists+linux-media@lfdr.de>; Fri,  9 Feb 2024 19:45:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 14D0128CF3B
	for <lists+linux-media@lfdr.de>; Fri,  9 Feb 2024 18:45:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1864D7B3FC;
	Fri,  9 Feb 2024 18:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="S3Cn9scZ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E5457337
	for <linux-media@vger.kernel.org>; Fri,  9 Feb 2024 18:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707504318; cv=none; b=MSSRTuITpoi8LA3swBtYHEuDmOVqly3yLqVtiN7aJ1cLti0oL9A8dAkmETDZfa0325zQ9J+1LCpdldmbW5fLnPAgdsaUCACSZ43lyZx41FXf+edJd1+9SezUpvov+PogvDt0cV4fi8qdeVq1vr7uS1aupvqCABcvD+jNvtK6B5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707504318; c=relaxed/simple;
	bh=k72iz8nPsXqbNpRzEbxNVUyTa396gvYMjDiLi95jUlE=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=isVefbtpBGFXuAh8elrft61Vg/zA4ciRnmxsz6/+dXON+4OPxlfKgrz/OmF5JnS8SkR4l04z2SfVXYq2c3AvDiHgG3MgY9c6+qFtRblcp6QCC9RCdvCEdR358NQmG1iAo0Zlt6G54izE2ldcK50ZARn3uexOgquZe6D7JY6E9jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=S3Cn9scZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 53C6282A;
	Fri,  9 Feb 2024 19:43:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1707504228;
	bh=k72iz8nPsXqbNpRzEbxNVUyTa396gvYMjDiLi95jUlE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=S3Cn9scZPNfVNEdyW9NPyPLhtwDlfeGs7miGP9oQO4K/M9O94pCJzQYWkxBrL1Wtk
	 IQv3Fbfh8gNQ1aD+SIj98h0H7+93wPdCoXB50MVfcioFo1a6SZ4B4LgsnPf38jES2l
	 3Wz13oiM95M+1RfhAaWTmJfLiqDL/Uvkx+bs+ZAc=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240209164825.166800-9-jacopo.mondi@ideasonboard.com>
References: <20240209164825.166800-1-jacopo.mondi@ideasonboard.com> <20240209164825.166800-9-jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH 8/8] media: admin-guide: Document the Raspberry Pi PiSP BE
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, David Plowman <david.plowman@raspberrypi.com>, Naushir Patuck <naush@raspberrypi.com>, Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sakari Ailus <sakari.ailus@iki.fi>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Linux Media Mailing List <linux-media@vger.kernel.org>
Date: Fri, 09 Feb 2024 18:45:11 +0000
Message-ID: <170750431136.1011926.1857665645955840255@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Jacopo Mondi (2024-02-09 16:48:23)
> Add documentation for the PiSP Back End memory-to-memory ISP.
>=20
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  Documentation/admin-guide/media/pisp-be.dot   |  22 ++++
>  Documentation/admin-guide/media/pisp-be.rst   | 117 ++++++++++++++++++
>  .../admin-guide/media/v4l-drivers.rst         |   1 +
>  3 files changed, 140 insertions(+)
>  create mode 100644 Documentation/admin-guide/media/pisp-be.dot
>  create mode 100644 Documentation/admin-guide/media/pisp-be.rst
>=20
> diff --git a/Documentation/admin-guide/media/pisp-be.dot b/Documentation/=
admin-guide/media/pisp-be.dot
> new file mode 100644
> index 000000000000..001b2c16e232
> --- /dev/null
> +++ b/Documentation/admin-guide/media/pisp-be.dot
> @@ -0,0 +1,22 @@
> +digraph board {
> +       rankdir=3DTB
> +       n00000001 [label=3D"{{<port0> 0 | <port1> 1 | <port2> 2 | <port8>=
 8} | pispbe\n | {<port3> 3 | <port4> 4 | <port5> 5 | <port6> 6 | <port7> 7=
}}", shape=3DMrecord, style=3Dfilled, fillcolor=3Dgreen]
> +       n00000001:port3 -> n0000001d [style=3Dbold]
> +       n00000001:port4 -> n00000023 [style=3Dbold]
> +       n00000001:port5 -> n00000029 [style=3Dbold]
> +       n00000001:port6 -> n0000002f [style=3Dbold]
> +       n00000001:port7 -> n00000035 [style=3Dbold]
> +       n0000000b [label=3D"pispbe-input\n/dev/video0", shape=3Dbox, styl=
e=3Dfilled, fillcolor=3Dyellow]
> +       n0000000b -> n00000001:port0 [style=3Dbold]
> +       n00000011 [label=3D"pispbe-tdn_input\n/dev/video1", shape=3Dbox, =
style=3Dfilled, fillcolor=3Dyellow]
> +       n00000011 -> n00000001:port1 [style=3Dbold]
> +       n00000017 [label=3D"pispbe-stitch_input\n/dev/video2", shape=3Dbo=
x, style=3Dfilled, fillcolor=3Dyellow]
> +       n00000017 -> n00000001:port2 [style=3Dbold]
> +       n0000001d [label=3D"pispbe-hog_output\n/dev/video3", shape=3Dbox,=
 style=3Dfilled, fillcolor=3Dyellow]

I suspect this node is now removed, so this needs a refresh.

> +       n00000023 [label=3D"pispbe-output0\n/dev/video4", shape=3Dbox, st=
yle=3Dfilled, fillcolor=3Dyellow]
> +       n00000029 [label=3D"pispbe-output1\n/dev/video5", shape=3Dbox, st=
yle=3Dfilled, fillcolor=3Dyellow]
> +       n0000002f [label=3D"pispbe-tdn_output\n/dev/video6", shape=3Dbox,=
 style=3Dfilled, fillcolor=3Dyellow]
> +       n00000035 [label=3D"pispbe-stitch_output\n/dev/video7", shape=3Db=
ox, style=3Dfilled, fillcolor=3Dyellow]
> +       n0000003b [label=3D"pispbe-config\n/dev/video8", shape=3Dbox, sty=
le=3Dfilled, fillcolor=3Dyellow]
> +       n0000003b -> n00000001:port8 [style=3Dbold]
> +}
> diff --git a/Documentation/admin-guide/media/pisp-be.rst b/Documentation/=
admin-guide/media/pisp-be.rst
> new file mode 100644
> index 000000000000..871d44c3de04
> --- /dev/null
> +++ b/Documentation/admin-guide/media/pisp-be.rst
> @@ -0,0 +1,117 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> +Raspberry Pi PiSP Back End Memory-to-Memory ISP (pisp-be)
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The PiSP Back End
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The PiSP Back End is a memory-to-memory Image Signal Processor (ISP) whi=
ch reads
> +image data from DRAM memory and performs image processing as specified b=
y the
> +application through the parameters in a configuration buffer, before wri=
ting
> +pixel data back to memory through two distinct output channels.
> +
> +The ISP registers a programming model are documented in the `Raspberry P=
i Image

The ISP registers 'and' programming model?

> +Signal Processor (ISP) Specification document
> +<https://datasheets.raspberrypi.com/camera/raspberry-pi-image-signal-pro=
cessor-specification.pdf>`_
> +
> +The PiSP Back End ISP processes images in tiles to allow concurrent proc=
essing



> +of different images. The handling of image tassellation and the computat=
ion of

s/tassellation/tessellation/ ?


> +low-level configuration parameters is realized by a free software library
> +called `libpisp <https://github.com/raspberrypi/libpisp>`_.
> +
> +The full image processing pipeline, which involves capturing RAW Bayer d=
ata from
> +an image sensor through a MIPI CSI-2 compatible capture interface, stori=
ng them
> +in DRAM memory and processing them in the PiSP Back to obtain images usa=
ble by

s/PiSP Back/PiSP Back End/

> +an application is implemented in `libcamera <www.libcamera.org>`_ as par=
t of the
> +Raspberry Pi platform support.
> +
> +The pisp-be driver
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The Raspberry Pi PiSP Back End (pisp-be) driver is located under
> +drivers/media/platform/raspberrypi/pisp-be. It uses the `V4L2 API` to re=
gister
> +a number of video capture and output devices, the `V4L2 subdev API` to r=
egister
> +a subdevice for the ISP that connects the video devices in a single medi=
a graph
> +realized using the `Media Controller (MC) API`.

There's an 'and' missing in there somewhere. Probably before "the `v4l2
subdev API` ?

> +
> +As the PiSP Back End device processes images in tiles, it can be multipl=
exed
> +between several different execution contexts. The driver registers two
> +`contexts` represented as two distinct media graph instances but could
> +potentially register more of them.
> +
> +The media topology registered by the `pisp-be` driver is the following o=
ne:

I'd phrase this as
 "is as follows:" or "is represented below:"

> +
> +.. _pips-be-topology:
> +
> +.. kernel-figure:: pisp-be.dot
> +    :alt:   Diagram of the default media pipeline topology
> +    :align: center
> +
> +
> +Each media graph instance registers the following video device nodes:
> +
> +- pispbe-input: output device for images to be submitted to the ISP for
> +  processing.
> +- pispbe-tdn_input: output device for temporal denoise.
> +- pispbe-stitch_input: output device for image stitching (HDR).
> +- pipsbe-hog_output: capture device for HOG (histogram of oriented gradi=
ents).

The HOGs got baconed out I think.

> +- pispbe-output0: first capture device for processed images.
> +- pispbe-output1: second capture device for processed images.
> +- pispbe-tdn_output: capture device for temporal denoise.
> +- pispbe-stitch_output: capture device for image stitching (HDR).
> +- pispbe-config: output device for ISP configuration parameters.
> +
> +pispbe-input
> +------------
> +
> +Images to be processed by the ISP are queued to the `pispbe-input` outpu=
t device
> +node. For a list of image formats supported as input format by the ISP r=
efer to

"For a list of image formats supported as inputs to the ISP" ?

> +the PiSP specification document.
> +
> +pispbe-tdn_input, pispbe-tdn_output
> +-----------------------------------
> +
> +The `pispbe-tdn_input` output video device receives images to be process=
ed by
> +the temporal denoise block which are captured from the `pispbe-tdn_outpu=
t`
> +capture video device. Userspace should maintain a queue of buffers as ca=
ptured
> +from the TDN output and input to the TDN input device.

This doesn't sound very clear at the end. I think I recall that
userspace is responsible for maintaining queues on both devices, and
ensuring that buffers completed on the output are queued to the input?

> +
> +pispbe-stitch_input, pispbe-tdn_output

pispbe-stitch_output?=20

> +--------------------------------------
> +
> +To realize HDR (high dynamic range) image processing the image stitching=
 and
> +tonemapping blocks are used. The `pispbe-stitch_output` writes images to=
 memory
> +and the `pispbe-stitch_input` receives the previously written frame to p=
rocess
> +it along with the current input image. Userspace should maintain a queue=
 of
> +buffers as captured from the stitch output and input to the stitch input=
 device.

Same as above. Probably could be clear that userspace is queueing the
captured buffers of the output to the input for processing on the next
frame.

> +
> +pipsbe-hog_output
> +-----------------
> +
> +The `pipsbe-hog_output` video capture device produces image statistics i=
n the
> +form of 'Histogram of Oriented Gradients'.

I think this was removed from the driver support, so likely needs to be
removed here too.


> +
> +pispbe-output0, pispbe-output1
> +------------------------------
> +
> +The two capture devices write to memory the pixel data as processed by t=
he ISP.
> +
> +pispbe-config
> +-------------
> +
> +The `pispbe-config` output video devices receives a buffer of configurat=
ion
> +parameters that define the desired image processing to be performed by t=
he ISP.
> +
> +The format of the ISP configuration parameter is defined by
> +:c:type:`pisp_be_tiles_config` C structure and the meaning of each param=
eter is
> +described in the `PiSP specification` document.
> +
> +ISP configuration
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The ISP configuration is described solely by the content of the paramete=
rs
> +buffer. The only parameter that userspace needs to configure using the V=
4L2 API
> +is the image format on the output and capture video devices for validati=
on of
> +the content of the parameters buffer.
> diff --git a/Documentation/admin-guide/media/v4l-drivers.rst b/Documentat=
ion/admin-guide/media/v4l-drivers.rst
> index f4bb2605f07e..1a491a74a272 100644
> --- a/Documentation/admin-guide/media/v4l-drivers.rst
> +++ b/Documentation/admin-guide/media/v4l-drivers.rst
> @@ -21,6 +21,7 @@ Video4Linux (V4L) driver-specific documentation
>         omap3isp
>         omap4_camera
>         philips
> +       pisp-be
>         qcom_camss
>         rcar-fdp1
>         rkisp1
> --=20
> 2.43.0
>

