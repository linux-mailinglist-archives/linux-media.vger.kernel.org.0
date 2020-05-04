Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7167C1C3E41
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2020 17:15:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729373AbgEDPPt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 May 2020 11:15:49 -0400
Received: from mx2.suse.de ([195.135.220.15]:56172 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728684AbgEDPPs (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 4 May 2020 11:15:48 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id EFC0AABBD;
        Mon,  4 May 2020 15:15:46 +0000 (UTC)
Message-ID: <8ef4ab2d73ff9b4d1135ed8362aff2fe0fe21c41.camel@suse.de>
Subject: Re: [PATCH v2 00/34] Drivers for the BCM283x CSI-2/CCP2 receiver
 and ISP
From:   Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Niklas =?ISO-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>,
        Naushir Patuck <naush@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Mon, 04 May 2020 17:15:42 +0200
In-Reply-To: <20200504092611.9798-1-laurent.pinchart@ideasonboard.com>
References: <20200504092611.9798-1-laurent.pinchart@ideasonboard.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-kxFcKI0vT3Kee6tGhcWl"
User-Agent: Evolution 3.36.2 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-kxFcKI0vT3Kee6tGhcWl
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2020-05-04 at 12:25 +0300, Laurent Pinchart wrote:
> Hello,
>=20

Hi Laurent, thanks for the series!
Would you mind CCing on further iterations, I was lucky enough to find this
referenced in twitter, and I'll be more than happy to review/test it. I'm t=
he
BCM2711/BCM2835 arm architecture & vc04_services maintainer :).

An please also CC:
bcm-kernel-feedback-list@broadcom.com
linux-rpi-kernel@lists.infradead.org
linux-arm-kernel@lists.infradead.org

Regards,
Nicolas

> This patch series adds drivers for the CSI-2/CCP2 receiver and ISP found
> in the Broadcom BCM283x and compatible SoCs (namely the BCM2711). The
> CSI-2/CCP2 receiver IP core is known as Unicam. The most well known
> platforms representative of these SoCs are the Raspberry Pi. The
> previous version of the series was titled "[PATCH 0/5] Driver for the
> BCM283x CSI-2/CCP2 receiver" and contained the CSI-2/CCP2 receiver only.
>=20
> A driver already exists in drivers/staging/vc04_services/bcm2835-camera/
> to support cameras on Raspberry Pi platforms. The driver relies on the
> firmware running on the VC4 VPU to control the camera, and is thus
> limited to the camera sensors supported in the firmware. These drivers,
> on the other hand, have limited dependencies on the firmware:
>=20
> - The Unicam peripheral driver doesn't rely on the firmware at all and
>   controls the Unicam hardware directly. It supports any camera sensor
>   compatible with those interfaces.
>=20
> - The ISP driver relies on the VC4 VPU firmware to communicate with the
>   ISP hardware, but, unlike with the existing bcm2835-camera driver, the
>   firmware exposes the ISP instead of controlling it internally.
>=20
> The code is upported from the Raspberry Pi Linux kernel repository
> available at https://github.com/raspberrypi/linux. The patches are based
> on top of v5.7-rc2 with Jacopo's "[PATCH v4 0/5] media: Register
> read-only sub-dev devnode" series applied.
>=20
> Patches 01/34 to 05/34 are related to the bcm2835-unicam driver. Patches
> 01/34 and 02/34 add new a pixel format and media bus code for sensor
> embedded data. Patch 03/34 then adds DT bindings for the driver, and
> patch 04/34 adds the driver itself. Patch 05/34 adds the Unicam
> peripheral instances to the BCM2711 device tree.
>=20
> The bcm2835-unicam driver supports capturing both image data and
> embedded data. Support for embedded data is currently implemented
> through two sink pads, requiring two source pads on the sensor driver
> side. Work is ongoing to try and replace this with usage of a
> multiplexed streams API.
>=20
> The remaining patches are related to the bcm2835-isp driver. As the
> driver needs to communicate with the VC4 VPU firmware, whose support is
> currently in staging, the new driver is added to staging too.
>=20
> Patch 06/34 adds a new driver named vc-sm-cma to handle memory sharing
> with the VC4 VPU. This will likely be reworked in the future to use
> dmabuf heaps. Patch 07/34 then breaks the VC4 VPU multimedia access
> layer code (named vchiq-mmal) out of the existing bcm2835-camera driver
> to a new directory, to be shared with the bcm2835-isp driver. Patches
> 08/34 to 24/34 then upport various improvements to the MMAL code.
> Patches 25/34 to 31/34 follow with an upport of various improvement to
> the VCHIQ code, which handles the communication with the VC4 VPU (and is
> used by the MMAL code).
>=20
> At patch 32/34 we move to the media side, with a small extension to
> videobuf2. Patch 33/34 adds the bcm2835-isp driver, along with
> documentation of the related metadata format. Patch 34/34 then wires
> this up with the vchiq-mmal driver.
>=20
> The two drivers will likely be split into separate patch series for v3.
> I however wanted to bundle them here to emphasize that they're related,
> and that together they support full control of the Raspberry Pi cameras
> through libcamera without any closed-source software. The corresponding
> libcamera code is available from
>=20
> 	git://linuxtv.org/libcamera.git raspberrypi
>=20
> The 'raspberrypi' branch is temporary until the code gets integrated in
> the master branch after public review.
>=20
> I would like to thank Dave Stevenson, Naushir Patuk and David Plowman
> from Raspberry Pi (Trading) Ltd. for their hard work that made this all
> possible, as well as Jacopo Mondi, Kieran Bingham and Niklas S=C3=B6derlu=
nd
> from the libcamera team for all their efforts on both the kernel and
> libcamera side. This is, I'm sure, the beginning of a new journey for
> computational camera support in Linux.
>=20
> And now, the customary v4l2-compliance report. There are three new
> failures with bcm2835-unicam compared to the previous version, and they
> will addressed in v3.
>=20
> pi@raspberrypi:~/src/v4l-utils $ ./utils/v4l2-compliance/v4l2-compliance =
-m
> /dev/media0
> v4l2-compliance SHA: 2984938795a23e4bdf5a4b75c12a4245a2e0daff, 32 bits, 3=
2-
bit=20
> time_t
>=20
> Compliance test for unicam device /dev/media0:
>=20
> Media Driver Info:
>         Driver name      : unicam
>         Model            : unicam
>         Serial           :
>         Bus info         : platform:fe801000.csi
>         Media version    : 5.7.0
>         Hardware revision: 0x00000000 (0)
>         Driver version   : 5.7.0
>=20
> Required ioctls:
>         test MEDIA_IOC_DEVICE_INFO: OK
>=20
> Allow for multiple opens:
>         test second /dev/media0 open: OK
>         test MEDIA_IOC_DEVICE_INFO: OK
>         test for unlimited opens: OK
>=20
> Media Controller ioctls:
>         test MEDIA_IOC_G_TOPOLOGY: OK
>         Entities: 3 Interfaces: 3 Pads: 4 Links: 5
>         test MEDIA_IOC_ENUM_ENTITIES/LINKS: OK
>         test MEDIA_IOC_SETUP_LINK: OK
>         test invalid ioctls: OK
>=20
> Total for unicam device /dev/media0: 8, Succeeded: 8, Failed: 0, Warnings=
: 0
> -------------------------------------------------------------------------=
-----
> --
> Compliance test for unicam device /dev/video0:
>=20
> Driver Info:
>         Driver name      : unicam
>         Card type        : unicam
>         Bus info         : platform:fe801000.csi
>         Driver version   : 5.7.0
>         Capabilities     : 0x84a00001
>                 Video Capture
>                 Metadata Capture
>                 Streaming
>                 Extended Pix Format
>                 Device Capabilities
>         Device Caps      : 0x04200001
>                 Video Capture
>                 Streaming
>                 Extended Pix Format
> Media Driver Info:
>         Driver name      : unicam
>         Model            : unicam
>         Serial           :
>         Bus info         : platform:fe801000.csi
>         Media version    : 5.7.0
>         Hardware revision: 0x00000000 (0)
>         Driver version   : 5.7.0
> Interface Info:
>         ID               : 0x03000006
>         Type             : V4L Video
> Entity Info:
>         ID               : 0x00000004 (4)
>         Name             : unicam-image
>         Function         : V4L2 I/O
>         Flags         : default
>         Pad 0x01000005   : 0: Sink
>           Link 0x02000008: from remote pad 0x1000002 of entity 'imx219 10=
-
> 0010': Data, Enabled, Immutable
>=20
> Required ioctls:
>         test MC information (see 'Media Driver Info' above): OK
>         test VIDIOC_QUERYCAP: OK
>=20
> Allow for multiple opens:
>         test second /dev/video0 open: OK
>         test VIDIOC_QUERYCAP: OK
>         test VIDIOC_G/S_PRIORITY: OK
>         test for unlimited opens: OK
>=20
>         test invalid ioctls: OK
> Debug ioctls:
>         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>         test VIDIOC_LOG_STATUS: OK
>=20
> Input ioctls:
>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>         test VIDIOC_G/S/ENUMINPUT: OK
>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>         Inputs: 1 Audio Inputs: 0 Tuners: 0
>=20
> Output ioctls:
>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>         Outputs: 0 Audio Outputs: 0 Modulators: 0
>=20
> Input/Output configuration ioctls:
>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>         test VIDIOC_G/S_EDID: OK (Not Supported)
>=20
> Control ioctls (Input 0):
>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>         test VIDIOC_QUERYCTRL: OK
>         test VIDIOC_G/S_CTRL: OK
>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>         Standard Controls: 16 Private Controls: 0
>=20
> Format ioctls (Input 0):
>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>         test VIDIOC_G/S_PARM: OK (Not Supported)
>         test VIDIOC_G_FBUF: OK (Not Supported)
>         test VIDIOC_G_FMT: OK
>         test VIDIOC_TRY_FMT: OK
>                 fail: v4l2-test-formats.cpp(1038): Global format mismatch=
:
> 41415270(pRAA)/640x480 vs 30314752(RG10)/640x480
>         test VIDIOC_S_FMT: FAIL
>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>                 fail: v4l2-test-formats.cpp(1529): !doioctl(node,
> VIDIOC_G_SELECTION, &sel)
>                 fail: v4l2-test-formats.cpp(1547): testLegacyCrop(node)
>         test Cropping: FAIL
>         test Composing: OK (Not Supported)
>         test Scaling: OK (Not Supported)
>=20
> Codec ioctls (Input 0):
>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>=20
> Buffer ioctls (Input 0):
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>         test VIDIOC_EXPBUF: OK
>         test Requests: OK (Not Supported)
>=20
> Total for unicam device /dev/video0: 46, Succeeded: 44, Failed: 2, Warnin=
gs: 0
> -------------------------------------------------------------------------=
-----
> --
> Compliance test for unicam device /dev/video1:
>=20
> Driver Info:
>         Driver name      : unicam
>         Card type        : unicam
>         Bus info         : platform:fe801000.csi
>         Driver version   : 5.7.0
>         Capabilities     : 0x84a00001
>                 Video Capture
>                 Metadata Capture
>                 Streaming
>                 Extended Pix Format
>                 Device Capabilities
>         Device Caps      : 0x04a00000
>                 Metadata Capture
>                 Streaming
>                 Extended Pix Format
> Media Driver Info:
>         Driver name      : unicam
>         Model            : unicam
>         Serial           :
>         Bus info         : platform:fe801000.csi
>         Media version    : 5.7.0
>         Hardware revision: 0x00000000 (0)
>         Driver version   : 5.7.0
> Interface Info:
>         ID               : 0x0300000c
>         Type             : V4L Video
> Entity Info:
>         ID               : 0x0000000a (10)
>         Name             : unicam-embedded
>         Function         : V4L2 I/O
>         Pad 0x0100000b   : 0: Sink
>           Link 0x0200000e: from remote pad 0x1000003 of entity 'imx219 10=
-
> 0010': Data, Enabled, Immutable
>=20
> Required ioctls:
>         test MC information (see 'Media Driver Info' above): OK
>         test VIDIOC_QUERYCAP: OK
>=20
> Allow for multiple opens:
>         test second /dev/video1 open: OK
>         test VIDIOC_QUERYCAP: OK
>         test VIDIOC_G/S_PRIORITY: OK
>         test for unlimited opens: OK
>=20
>         test invalid ioctls: OK
> Debug ioctls:
>         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>         test VIDIOC_LOG_STATUS: OK
>=20
> Input ioctls:
>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>         test VIDIOC_G/S/ENUMINPUT: OK
>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>         Inputs: 1 Audio Inputs: 0 Tuners: 0
>=20
> Output ioctls:
>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>         Outputs: 0 Audio Outputs: 0 Modulators: 0
>=20
> Input/Output configuration ioctls:
>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>         test VIDIOC_G/S_EDID: OK (Not Supported)
>=20
> Control ioctls (Input 0):
>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>         test VIDIOC_QUERYCTRL: OK (Not Supported)
>         test VIDIOC_G/S_CTRL: OK (Not Supported)
>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>         Standard Controls: 0 Private Controls: 0
>=20
> Format ioctls (Input 0):
>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>         test VIDIOC_G/S_PARM: OK (Not Supported)
>         test VIDIOC_G_FBUF: OK (Not Supported)
>         test VIDIOC_G_FMT: OK
>         test VIDIOC_TRY_FMT: OK
>         test VIDIOC_S_FMT: OK
>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>         test Cropping: OK (Not Supported)
>         test Composing: OK (Not Supported)
>         test Scaling: OK (Not Supported)
>=20
> Codec ioctls (Input 0):
>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>=20
> Buffer ioctls (Input 0):
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>         test VIDIOC_EXPBUF: OK
>         test Requests: OK (Not Supported)
>=20
> Total for unicam device /dev/video1: 46, Succeeded: 46, Failed: 0, Warnin=
gs: 0
> -------------------------------------------------------------------------=
-----
> --
> Compliance test for device /dev/v4l-subdev0:
>=20
>=20
> Required ioctls:
>=20
> Allow for multiple opens:
>         test second /dev/v4l-subdev0 open: OK
>         test for unlimited opens: OK
>=20
>         test invalid ioctls: OK
> Debug ioctls:
>         test VIDIOC_LOG_STATUS: OK (Not Supported)
>=20
> Input ioctls:
>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>         Inputs: 0 Audio Inputs: 0 Tuners: 0
>=20
> Output ioctls:
>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>         Outputs: 0 Audio Outputs: 0 Modulators: 0
>=20
> Input/Output configuration ioctls:
>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>         test VIDIOC_G/S_EDID: OK (Not Supported)
>=20
> Control ioctls:
>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>         test VIDIOC_QUERYCTRL: OK
>         test VIDIOC_G/S_CTRL: OK
>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>         Standard Controls: 16 Private Controls: 0
>=20
> Format ioctls:
>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported=
)
>         test VIDIOC_G/S_PARM: OK (Not Supported)
>         test VIDIOC_G_FBUF: OK (Not Supported)
>         test VIDIOC_G_FMT: OK (Not Supported)
>         test VIDIOC_TRY_FMT: OK (Not Supported)
>         test VIDIOC_S_FMT: OK (Not Supported)
>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>         test Cropping: OK (Not Supported)
>         test Composing: OK (Not Supported)
>         test Scaling: OK (Not Supported)
>=20
> Codec ioctls:
>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>=20
> Buffer ioctls:
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
>         test VIDIOC_EXPBUF: OK (Not Supported)
>         test Requests: OK (Not Supported)
>=20
> Total for device /dev/v4l-subdev0: 41, Succeeded: 41, Failed: 0, Warnings=
: 0
>=20
> Grand Total for unicam device /dev/media0: 141, Succeeded: 139, Failed: 2=
,
> Warnings: 0
> pi@raspberrypi:~/src/v4l-utils $ ./utils/v4l2-compliance/v4l2-compliance =
-m
> /dev/media1
> v4l2-compliance SHA: 2984938795a23e4bdf5a4b75c12a4245a2e0daff, 32 bits, 3=
2-
bit=20
> time_t
>=20
> Compliance test for bcm2835-isp device /dev/media1:
>=20
> Media Driver Info:
>         Driver name      : bcm2835-isp
>         Model            : bcm2835-isp
>         Serial           :
>         Bus info         : platform:bcm2835-isp
>         Media version    : 5.7.0
>         Hardware revision: 0x00000000 (0)
>         Driver version   : 5.7.0
>=20
> Required ioctls:
>         test MEDIA_IOC_DEVICE_INFO: OK
>=20
> Allow for multiple opens:
>         test second /dev/media1 open: OK
>         test MEDIA_IOC_DEVICE_INFO: OK
>         test for unlimited opens: OK
>=20
> Media Controller ioctls:
>         test MEDIA_IOC_G_TOPOLOGY: OK
>         Entities: 5 Interfaces: 4 Pads: 8 Links: 8
>         test MEDIA_IOC_ENUM_ENTITIES/LINKS: OK
>         test MEDIA_IOC_SETUP_LINK: OK
>         test invalid ioctls: OK
>=20
> Total for bcm2835-isp device /dev/media1: 8, Succeeded: 8, Failed: 0,
> Warnings: 0
> -------------------------------------------------------------------------=
-----
> --
> Compliance test for bcm2835-isp device /dev/video13:
>=20
> Driver Info:
>         Driver name      : bcm2835-isp
>         Card type        : bcm2835-isp
>         Bus info         : platform:bcm2835-isp
>         Driver version   : 5.7.0
>         Capabilities     : 0x84200002
>                 Video Output
>                 Streaming
>                 Extended Pix Format
>                 Device Capabilities
>         Device Caps      : 0x04200002
>                 Video Output
>                 Streaming
>                 Extended Pix Format
> Media Driver Info:
>         Driver name      : bcm2835-isp
>         Model            : bcm2835-isp
>         Serial           :
>         Bus info         : platform:bcm2835-isp
>         Media version    : 5.7.0
>         Hardware revision: 0x00000000 (0)
>         Driver version   : 5.7.0
> Interface Info:
>         ID               : 0x03000008
>         Type             : V4L Video
> Entity Info:
>         ID               : 0x00000006 (6)
>         Name             : bcm2835-isp0-output0
>         Function         : V4L2 I/O
>         Pad 0x01000007   : 0: Source
>           Link 0x0200000a: to remote pad 0x1000002 of entity 'bcm2835_isp=
0':
> Data, Enabled, Immutable
>=20
> Required ioctls:
>         test MC information (see 'Media Driver Info' above): OK
>         test VIDIOC_QUERYCAP: OK
>=20
> Allow for multiple opens:
>         test second /dev/video13 open: OK
>         test VIDIOC_QUERYCAP: OK
>         test VIDIOC_G/S_PRIORITY: OK
>         test for unlimited opens: OK
>=20
>         test invalid ioctls: OK
> Debug ioctls:
>         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>         test VIDIOC_LOG_STATUS: OK (Not Supported)
>=20
> Input ioctls:
>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>         Inputs: 0 Audio Inputs: 0 Tuners: 0
>=20
> Output ioctls:
>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>         Outputs: 0 Audio Outputs: 0 Modulators: 0
>=20
> Input/Output configuration ioctls:
>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>         test VIDIOC_G/S_EDID: OK (Not Supported)
>=20
> Control ioctls:
>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>         test VIDIOC_QUERYCTRL: OK
>         test VIDIOC_G/S_CTRL: OK
>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>         Standard Controls: 5 Private Controls: 8
>=20
> Format ioctls:
>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>         test VIDIOC_G/S_PARM: OK (Not Supported)
>         test VIDIOC_G_FBUF: OK (Not Supported)
>         test VIDIOC_G_FMT: OK
>         test VIDIOC_TRY_FMT: OK
>         test VIDIOC_S_FMT: OK
>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>         test Cropping: OK (Not Supported)
>         test Composing: OK (Not Supported)
>         test Scaling: OK
>=20
> Codec ioctls:
>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>=20
> Buffer ioctls:
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>         test VIDIOC_EXPBUF: OK
>         test Requests: OK (Not Supported)
>=20
> Total for bcm2835-isp device /dev/video13: 46, Succeeded: 46, Failed: 0,
> Warnings: 0
> -------------------------------------------------------------------------=
-----
> --
> Compliance test for bcm2835-isp device /dev/video14:
>=20
> Driver Info:
>         Driver name      : bcm2835-isp
>         Card type        : bcm2835-isp
>         Bus info         : platform:bcm2835-isp
>         Driver version   : 5.7.0
>         Capabilities     : 0x84200001
>                 Video Capture
>                 Streaming
>                 Extended Pix Format
>                 Device Capabilities
>         Device Caps      : 0x04200001
>                 Video Capture
>                 Streaming
>                 Extended Pix Format
> Media Driver Info:
>         Driver name      : bcm2835-isp
>         Model            : bcm2835-isp
>         Serial           :
>         Bus info         : platform:bcm2835-isp
>         Media version    : 5.7.0
>         Hardware revision: 0x00000000 (0)
>         Driver version   : 5.7.0
> Interface Info:
>         ID               : 0x0300000e
>         Type             : V4L Video
> Entity Info:
>         ID               : 0x0000000c (12)
>         Name             : bcm2835-isp0-capture1
>         Function         : V4L2 I/O
>         Pad 0x0100000d   : 0: Sink
>           Link 0x02000010: from remote pad 0x1000003 of entity 'bcm2835_i=
sp0':
> Data, Enabled, Immutable
>=20
> Required ioctls:
>         test MC information (see 'Media Driver Info' above): OK
>         test VIDIOC_QUERYCAP: OK
>=20
> Allow for multiple opens:
>         test second /dev/video14 open: OK
>         test VIDIOC_QUERYCAP: OK
>         test VIDIOC_G/S_PRIORITY: OK
>         test for unlimited opens: OK
>=20
>         test invalid ioctls: OK
> Debug ioctls:
>         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>         test VIDIOC_LOG_STATUS: OK (Not Supported)
>=20
> Input ioctls:
>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>         Inputs: 0 Audio Inputs: 0 Tuners: 0
>=20
> Output ioctls:
>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>         Outputs: 0 Audio Outputs: 0 Modulators: 0
>=20
> Input/Output configuration ioctls:
>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>         test VIDIOC_G/S_EDID: OK (Not Supported)
>=20
> Control ioctls:
>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>         test VIDIOC_QUERYCTRL: OK (Not Supported)
>         test VIDIOC_G/S_CTRL: OK (Not Supported)
>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>         Standard Controls: 0 Private Controls: 0
>=20
> Format ioctls:
>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>         test VIDIOC_G/S_PARM: OK (Not Supported)
>         test VIDIOC_G_FBUF: OK (Not Supported)
>         test VIDIOC_G_FMT: OK
>         test VIDIOC_TRY_FMT: OK
>         test VIDIOC_S_FMT: OK
>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>         test Cropping: OK (Not Supported)
>         test Composing: OK (Not Supported)
>         test Scaling: OK
>=20
> Codec ioctls:
>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>=20
> Buffer ioctls:
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>         test VIDIOC_EXPBUF: OK
>         test Requests: OK (Not Supported)
>=20
> Total for bcm2835-isp device /dev/video14: 46, Succeeded: 46, Failed: 0,
> Warnings: 0
> -------------------------------------------------------------------------=
-----
> --
> Compliance test for bcm2835-isp device /dev/video15:
>=20
> Driver Info:
>         Driver name      : bcm2835-isp
>         Card type        : bcm2835-isp
>         Bus info         : platform:bcm2835-isp
>         Driver version   : 5.7.0
>         Capabilities     : 0x84200001
>                 Video Capture
>                 Streaming
>                 Extended Pix Format
>                 Device Capabilities
>         Device Caps      : 0x04200001
>                 Video Capture
>                 Streaming
>                 Extended Pix Format
> Media Driver Info:
>         Driver name      : bcm2835-isp
>         Model            : bcm2835-isp
>         Serial           :
>         Bus info         : platform:bcm2835-isp
>         Media version    : 5.7.0
>         Hardware revision: 0x00000000 (0)
>         Driver version   : 5.7.0
> Interface Info:
>         ID               : 0x03000014
>         Type             : V4L Video
> Entity Info:
>         ID               : 0x00000012 (18)
>         Name             : bcm2835-isp0-capture2
>         Function         : V4L2 I/O
>         Pad 0x01000013   : 0: Sink
>           Link 0x02000016: from remote pad 0x1000004 of entity 'bcm2835_i=
sp0':
> Data, Enabled, Immutable
>=20
> Required ioctls:
>         test MC information (see 'Media Driver Info' above): OK
>         test VIDIOC_QUERYCAP: OK
>=20
> Allow for multiple opens:
>         test second /dev/video15 open: OK
>         test VIDIOC_QUERYCAP: OK
>         test VIDIOC_G/S_PRIORITY: OK
>         test for unlimited opens: OK
>=20
>         test invalid ioctls: OK
> Debug ioctls:
>         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>         test VIDIOC_LOG_STATUS: OK (Not Supported)
>=20
> Input ioctls:
>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>         Inputs: 0 Audio Inputs: 0 Tuners: 0
>=20
> Output ioctls:
>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>         Outputs: 0 Audio Outputs: 0 Modulators: 0
>=20
> Input/Output configuration ioctls:
>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>         test VIDIOC_G/S_EDID: OK (Not Supported)
>=20
> Control ioctls:
>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>         test VIDIOC_QUERYCTRL: OK (Not Supported)
>         test VIDIOC_G/S_CTRL: OK (Not Supported)
>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>         Standard Controls: 0 Private Controls: 0
>=20
> Format ioctls:
>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>         test VIDIOC_G/S_PARM: OK (Not Supported)
>         test VIDIOC_G_FBUF: OK (Not Supported)
>         test VIDIOC_G_FMT: OK
>         test VIDIOC_TRY_FMT: OK
>         test VIDIOC_S_FMT: OK
>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>         test Cropping: OK (Not Supported)
>         test Composing: OK (Not Supported)
>         test Scaling: OK
>=20
> Codec ioctls:
>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>=20
> Buffer ioctls:
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>         test VIDIOC_EXPBUF: OK
>         test Requests: OK (Not Supported)
>=20
> Total for bcm2835-isp device /dev/video15: 46, Succeeded: 46, Failed: 0,
> Warnings: 0
> -------------------------------------------------------------------------=
-----
> --
> Compliance test for bcm2835-isp device /dev/video16:
>=20
> Driver Info:
>         Driver name      : bcm2835-isp
>         Card type        : bcm2835-isp
>         Bus info         : platform:bcm2835-isp
>         Driver version   : 5.7.0
>         Capabilities     : 0x84a00000
>                 Metadata Capture
>                 Streaming
>                 Extended Pix Format
>                 Device Capabilities
>         Device Caps      : 0x04a00000
>                 Metadata Capture
>                 Streaming
>                 Extended Pix Format
> Media Driver Info:
>         Driver name      : bcm2835-isp
>         Model            : bcm2835-isp
>         Serial           :
>         Bus info         : platform:bcm2835-isp
>         Media version    : 5.7.0
>         Hardware revision: 0x00000000 (0)
>         Driver version   : 5.7.0
> Interface Info:
>         ID               : 0x0300001a
>         Type             : V4L Video
> Entity Info:
>         ID               : 0x00000018 (24)
>         Name             : bcm2835-isp0-capture3
>         Function         : V4L2 I/O
>         Pad 0x01000019   : 0: Sink
>           Link 0x0200001c: from remote pad 0x1000005 of entity 'bcm2835_i=
sp0':
> Data, Enabled, Immutable
>=20
> Required ioctls:
>         test MC information (see 'Media Driver Info' above): OK
>         test VIDIOC_QUERYCAP: OK
>=20
> Allow for multiple opens:
>         test second /dev/video16 open: OK
>         test VIDIOC_QUERYCAP: OK
>         test VIDIOC_G/S_PRIORITY: OK
>         test for unlimited opens: OK
>=20
>         test invalid ioctls: OK
> Debug ioctls:
>         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>         test VIDIOC_LOG_STATUS: OK (Not Supported)
>=20
> Input ioctls:
>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>         Inputs: 0 Audio Inputs: 0 Tuners: 0
>=20
> Output ioctls:
>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>         Outputs: 0 Audio Outputs: 0 Modulators: 0
>=20
> Input/Output configuration ioctls:
>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>         test VIDIOC_G/S_EDID: OK (Not Supported)
>=20
> Control ioctls:
>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>         test VIDIOC_QUERYCTRL: OK (Not Supported)
>         test VIDIOC_G/S_CTRL: OK (Not Supported)
>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>         Standard Controls: 0 Private Controls: 0
>=20
> Format ioctls:
>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>         test VIDIOC_G/S_PARM: OK (Not Supported)
>         test VIDIOC_G_FBUF: OK (Not Supported)
>         test VIDIOC_G_FMT: OK
>         test VIDIOC_TRY_FMT: OK
>         test VIDIOC_S_FMT: OK
>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>         test Cropping: OK (Not Supported)
>         test Composing: OK (Not Supported)
>         test Scaling: OK (Not Supported)
>=20
> Codec ioctls:
>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>=20
> Buffer ioctls:
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>         test VIDIOC_EXPBUF: OK
>         test Requests: OK (Not Supported)
>=20
> Total for bcm2835-isp device /dev/video16: 46, Succeeded: 46, Failed: 0,
> Warnings: 0
>=20
> Grand Total for bcm2835-isp device /dev/media1: 192, Succeeded: 192, Fail=
ed:
> 0, Warnings: 0
>=20
> Dave Stevenson (22):
>   dt-bindings: media: Document BCM283x CSI2/CCP2 receiver
>   staging: vc04_services: Add new vc-sm-cma driver
>   staging: mmal-vchiq: Allocate and free components as required
>   staging: mmal-vchiq: Avoid use of bool in structures
>   staging: mmal-vchiq: Make timeout a defined parameter
>   staging: mmal-vchiq: Make a mmal_buf struct for passing parameters
>   staging: mmal-vchiq: Add support for event callbacks.
>   staging: mmal-vchiq: Support sending data to MMAL ports
>   staging: mmal-vchiq: Fixup vchiq-mmal include ordering
>   staging: mmal-vchiq: Use vc-sm-cma to support zero copy
>   staging: mmal-vchiq: Fix client_component for 64 bit kernel
>   staging: mmal_vchiq: Add in the Bayer encoding formats
>   staging: mmal-vchiq: Always return the param size from param_get
>   staging: mmal-vchiq: If the VPU returns an error, don't negate it
>   staging: mmal-vchiq: Fix handling of VB2_MEMORY_DMABUF buffers
>   staging: mmal-vchiq: Update mmal_parameters.h with recently defined
>     params
>   staging: mmal-vchiq: Free the event context for control ports
>   staging: mmal-vchiq: Fix memory leak in error path
>   staging: vchiq_arm: Register vcsm-cma as a platform driver
>   staging: vchiq_arm: Set up dma ranges on child devices
>   staging: vchiq: Use the old dma controller for OF config on platform
>     devices
>   media: videobuf2: Allow exporting of a struct dmabuf
>=20
> Jacopo Mondi (1):
>   staging: bcm2835: Break MMAL support out from camera
>=20
> Laurent Pinchart (1):
>   ARM: dts: bcm2711: Add Unicam DT nodes
>=20
> Naushir Patuck (6):
>   media: uapi: v4l2-core: Add sensor ancillary data V4L2 fourcc type
>   media: uapi: Add MEDIA_BUS_FMT_SENSOR_DATA media bus format
>   media: bcm2835-unicam: Driver for CCP2/CSI2 camera interface
>   staging: mmal-vchiq: Fix formatting errors in mmal_parameters.h
>   staging: bcm2835-isp: Add support for BC2835 ISP
>   staging: vchiq: Load bcm2835_isp driver from vchiq
>=20
> Oliver Gjoneski (1):
>   staging: vchiq_2835_arm: Implement a DMA pool for small bulk transfers
>=20
> Phil Elwell (3):
>   staging: vchiq: Add 36-bit address support
>   staging: vchiq_arm: Give vchiq children DT nodes
>   staging: vchiq_arm: Add a matching unregister call
>=20
>  .../bindings/media/brcm,bcm2835-unicam.yaml   |  155 +
>  Documentation/media/uapi/v4l/meta-formats.rst |    1 +
>  .../uapi/v4l/pixfmt-meta-sensor-data.rst      |   32 +
>  .../media/uapi/v4l/subdev-formats.rst         |   33 +
>  MAINTAINERS                                   |    7 +
>  arch/arm/boot/dts/bcm2711.dtsi                |   43 +
>  .../media/common/videobuf2/videobuf2-core.c   |   21 +-
>  drivers/media/platform/Kconfig                |    1 +
>  drivers/media/platform/Makefile               |    2 +
>  drivers/media/platform/bcm2835/Kconfig        |   15 +
>  drivers/media/platform/bcm2835/Makefile       |    3 +
>  .../media/platform/bcm2835/bcm2835-unicam.c   | 2825 +++++++++++++++++
>  .../media/platform/bcm2835/vc4-regs-unicam.h  |  253 ++
>  drivers/media/v4l2-core/v4l2-ioctl.c          |    1 +
>  .../v4l/pixfmt-meta-bcm2835-isp-stats.rst     |   41 +
>  drivers/staging/vc04_services/Kconfig         |    6 +
>  drivers/staging/vc04_services/Makefile        |    7 +-
>  .../vc04_services/bcm2835-camera/Kconfig      |    1 +
>  .../vc04_services/bcm2835-camera/Makefile     |    4 +-
>  .../bcm2835-camera/bcm2835-camera.c           |   64 +-
>  .../staging/vc04_services/bcm2835-isp/Kconfig |   14 +
>  .../vc04_services/bcm2835-isp/Makefile        |   10 +
>  .../bcm2835-isp/bcm2835-v4l2-isp.c            | 1632 ++++++++++
>  .../bcm2835-isp/bcm2835_isp_ctrls.h           |   67 +
>  .../bcm2835-isp/bcm2835_isp_fmts.h            |  301 ++
>  .../include/linux/broadcom/vc_sm_cma_ioctl.h  |  114 +
>  .../include/uapi/linux/bcm2835-isp.h          |  333 ++
>  .../interface/vchiq_arm/vchiq_2835_arm.c      |  126 +-
>  .../interface/vchiq_arm/vchiq_arm.c           |   38 +
>  .../interface/vchiq_arm/vchiq_arm.h           |    1 +
>  .../staging/vc04_services/vc-sm-cma/Kconfig   |   10 +
>  .../staging/vc04_services/vc-sm-cma/Makefile  |   13 +
>  drivers/staging/vc04_services/vc-sm-cma/TODO  |    1 +
>  .../staging/vc04_services/vc-sm-cma/vc_sm.c   | 1732 ++++++++++
>  .../staging/vc04_services/vc-sm-cma/vc_sm.h   |   84 +
>  .../vc04_services/vc-sm-cma/vc_sm_cma_vchi.c  |  505 +++
>  .../vc04_services/vc-sm-cma/vc_sm_cma_vchi.h  |   63 +
>  .../vc04_services/vc-sm-cma/vc_sm_defs.h      |  300 ++
>  .../vc04_services/vc-sm-cma/vc_sm_knl.h       |   28 +
>  .../staging/vc04_services/vchiq-mmal/Kconfig  |    9 +
>  .../staging/vc04_services/vchiq-mmal/Makefile |    8 +
>  .../mmal-common.h                             |   10 +
>  .../mmal-encodings.h                          |   31 +
>  .../mmal-msg-common.h                         |    0
>  .../mmal-msg-format.h                         |    0
>  .../mmal-msg-port.h                           |    0
>  .../{bcm2835-camera =3D> vchiq-mmal}/mmal-msg.h |   36 +
>  .../mmal-parameters.h                         |  231 +-
>  .../mmal-vchiq.c                              |  376 ++-
>  .../mmal-vchiq.h                              |   13 +-
>  include/media/videobuf2-core.h                |   15 +
>  include/uapi/linux/media-bus-format.h         |    3 +
>  include/uapi/linux/videodev2.h                |    1 +
>  53 files changed, 9492 insertions(+), 128 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/brcm,bcm2835-
> unicam.yaml
>  create mode 100644 Documentation/media/uapi/v4l/pixfmt-meta-sensor-data.=
rst
>  create mode 100644 drivers/media/platform/bcm2835/Kconfig
>  create mode 100644 drivers/media/platform/bcm2835/Makefile
>  create mode 100644 drivers/media/platform/bcm2835/bcm2835-unicam.c
>  create mode 100644 drivers/media/platform/bcm2835/vc4-regs-unicam.h
>  create mode 100644 drivers/staging/vc04_services/Documentation/userspace=
-
> api/media/v4l/pixfmt-meta-bcm2835-isp-stats.rst
>  create mode 100644 drivers/staging/vc04_services/bcm2835-isp/Kconfig
>  create mode 100644 drivers/staging/vc04_services/bcm2835-isp/Makefile
>  create mode 100644 drivers/staging/vc04_services/bcm2835-isp/bcm2835-v4l=
2-
> isp.c
>  create mode 100644 drivers/staging/vc04_services/bcm2835-
> isp/bcm2835_isp_ctrls.h
>  create mode 100644 drivers/staging/vc04_services/bcm2835-
> isp/bcm2835_isp_fmts.h
>  create mode 100644
> drivers/staging/vc04_services/include/linux/broadcom/vc_sm_cma_ioctl.h
>  create mode 100644 drivers/staging/vc04_services/include/uapi/linux/bcm2=
835-
> isp.h
>  create mode 100644 drivers/staging/vc04_services/vc-sm-cma/Kconfig
>  create mode 100644 drivers/staging/vc04_services/vc-sm-cma/Makefile
>  create mode 100644 drivers/staging/vc04_services/vc-sm-cma/TODO
>  create mode 100644 drivers/staging/vc04_services/vc-sm-cma/vc_sm.c
>  create mode 100644 drivers/staging/vc04_services/vc-sm-cma/vc_sm.h
>  create mode 100644 drivers/staging/vc04_services/vc-sm-cma/vc_sm_cma_vch=
i.c
>  create mode 100644 drivers/staging/vc04_services/vc-sm-cma/vc_sm_cma_vch=
i.h
>  create mode 100644 drivers/staging/vc04_services/vc-sm-cma/vc_sm_defs.h
>  create mode 100644 drivers/staging/vc04_services/vc-sm-cma/vc_sm_knl.h
>  create mode 100644 drivers/staging/vc04_services/vchiq-mmal/Kconfig
>  create mode 100644 drivers/staging/vc04_services/vchiq-mmal/Makefile
>  rename drivers/staging/vc04_services/{bcm2835-camera =3D> vchiq-mmal}/mm=
al-
> common.h (84%)
>  rename drivers/staging/vc04_services/{bcm2835-camera =3D> vchiq-mmal}/mm=
al-
> encodings.h (80%)
>  rename drivers/staging/vc04_services/{bcm2835-camera =3D> vchiq-mmal}/mm=
al-msg-
> common.h (100%)
>  rename drivers/staging/vc04_services/{bcm2835-camera =3D> vchiq-mmal}/mm=
al-msg-
> format.h (100%)
>  rename drivers/staging/vc04_services/{bcm2835-camera =3D> vchiq-mmal}/mm=
al-msg-
> port.h (100%)
>  rename drivers/staging/vc04_services/{bcm2835-camera =3D> vchiq-mmal}/mm=
al-
> msg.h (90%)
>  rename drivers/staging/vc04_services/{bcm2835-camera =3D> vchiq-mmal}/mm=
al-
> parameters.h (77%)
>  rename drivers/staging/vc04_services/{bcm2835-camera =3D> vchiq-mmal}/mm=
al-
> vchiq.c (82%)
>  rename drivers/staging/vc04_services/{bcm2835-camera =3D> vchiq-mmal}/mm=
al-
> vchiq.h (93%)
>=20


--=-kxFcKI0vT3Kee6tGhcWl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl6wMZ8ACgkQlfZmHno8
x/4bJgf/eDwtmfpNMlj1Kqn9W0SGyCa2PRJuvbWR2huwmv+xAX0JBq25y4Zl0SvG
DkLpwtCYlwdYVUuwVxCsc1I5OTt8FVuOWNUZbNNEHFE0HCjAj6StQq/h8aMWUSXy
p9K5oP9werMmnOZ0UnOoxv0ekrxneMe4cSag7OAqCx5rFOEtecaT6WweO0WXwMt9
Ai6PeT2+ouRRBiK7vKpfMnmksXsN//8a9zRwdtLxEPfeZfcqzSblOCKEVhGopbex
TD05UEaG8XqxWAwLfq1QNZ/+ycrdGxKyHQN9lSVdSteOc3rCfxABKJMp+3qUC08s
canwtfFbhpUhN0OwqSeS96ric1EgkQ==
=CV+l
-----END PGP SIGNATURE-----

--=-kxFcKI0vT3Kee6tGhcWl--

