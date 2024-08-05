Return-Path: <linux-media+bounces-15786-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 44591947FDC
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2024 19:03:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6763E1C20F21
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2024 17:03:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD31915E5D4;
	Mon,  5 Aug 2024 17:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.dufresne@collabora.com header.b="By4sKju0"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D84A15C15C;
	Mon,  5 Aug 2024 17:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722877412; cv=pass; b=LIGYL6GCgvfb9r+szSLc8XTMpfaEHY0v6BkLQMkNGVfUS3ZIuzO7ZdpFB4iaJDiMccuyZoNC8nR6A9bBOIO5/cOW6vN47+mdWNolqKkVGIAKW0QV8qrW3A05cVA9mKL4X0XTmM/SuTL2/B9UgbjzKA0kBK+eRB0kUhvb7Aj6Rik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722877412; c=relaxed/simple;
	bh=y5TXoh9aE7292b9XzQPpSQgT1NJVloTYaNB+qGvtQFQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OhsvrbbqCeoCDnOWRkg7yMqfJzLuY20pMzVUB2yvxbDp5MQ6tRaycwOeIQce2l5T7CibkNzwIMFf2uSf67hBNHvSMLSCJ6VKL7XPBq2nn8qI32z9Jt/hrMtXi2YJhWv/Yk/pMwcJAGPeolUHqnRRARjg9SPle7OIJadZ8yicRVk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.dufresne@collabora.com header.b=By4sKju0; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Delivered-To: shreeya.patel@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1722877361; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TkqUrn79KRT5ftQoTfc8pEEvY99bqronZMetRkibgmAMDSyYx0a6w19Tt2wXL1furwKBKtqd0HeQOiy0cDDhWJeL/qlLTPKkVX1kJPwXjlu05D4mXwY5BDha/4CELN9AVCgvvtVRLmWYAwFXj4T/gke730UtgsmHVeZQu65QJjs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1722877361; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=w7kTIvSzvKqdKtYQYPR2Fn9gYJDyCUv52X1ELJ2LPMU=; 
	b=GweE+gXsMaoHoe/8tfitZs/ohWFauAL20+5pbZmxIkpZ6gGM+VCQaP9jle1DyPsRbSIOew3MtA5aj3BsZylLKd+ZqjUSX3/E7mja/2OEs1Gv9re6DI2zUj9A5vvG3O2m/GLTJTxXhJMr8SAfP/vgQO1mBnQQb49us6yxbs4tYpM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.dufresne@collabora.com;
	dmarc=pass header.from=<nicolas.dufresne@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1722877361;
	s=zohomail; d=collabora.com; i=nicolas.dufresne@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=w7kTIvSzvKqdKtYQYPR2Fn9gYJDyCUv52X1ELJ2LPMU=;
	b=By4sKju07MmJSl+8IbstTRrtsddtzXIriwHPEW0mkbpMnd1gCmCn5/cMBE0Cihzd
	envGsxbS4b5LPLnHOSyhL04IuMl1ag4NyfA9xY8DkDCMmkAOqJ7kIgd+9sbmGaRr11O
	uexzvWNGp+X/Ip4lgZB7GdCxlBTt84zzh2CMzZmU=
Received: by mx.zohomail.com with SMTPS id 1722877359057150.24825321003527;
	Mon, 5 Aug 2024 10:02:39 -0700 (PDT)
Message-ID: <ce4994b69d1d006e6d6f02e0fddeee24a0467075.camel@collabora.com>
Subject: Re: [PATCH v4 0/4] Add Synopsys DesignWare HDMI RX Controller
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Tim Surber <me@timsurber.de>, Shreeya Patel
 <shreeya.patel@collabora.com>,  heiko@sntech.de, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org,  conor+dt@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org,  p.zabel@pengutronix.de,
 jose.abreu@synopsys.com, nelson.costa@synopsys.com, 
 shawn.wen@rock-chips.com, hverkuil@xs4all.nl, hverkuil-cisco@xs4all.nl
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Date: Mon, 05 Aug 2024 13:02:35 -0400
In-Reply-To: <6f5c4ebb-84ab-4b65-9817-ac5f6158911f@timsurber.de>
References: <20240719124032.26852-1-shreeya.patel@collabora.com>
	 <6f5c4ebb-84ab-4b65-9817-ac5f6158911f@timsurber.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ZohoMailClient: External

Hi Tim,

Le dimanche 04 ao=C3=BBt 2024 =C3=A0 01:57 +0200, Tim Surber a =C3=A9crit=
=C2=A0:
> Hi Shreeya,
>=20
> I tested your patch and noticed problems when using 3840x2160 resolution=
=20
> at =C2=A060fps.
>=20
> For my testing I connected an HDMI source and set it to 4k60fps. I=20
> verified that this source and the cables work on a screen at this=20
> resolution.
>=20
> Using
> 'v4l2-ctl --verbose -d /dev/video1=20
> --set-fmt-video=3Dwidth=3D3840,height=3D2160,pixelformat=3D'NV12'=20
> --stream-mmap=3D4 --stream-skip=3D3 --stream-count=3D100 --stream-poll'
> I get the video format output, but not the periodic output which shows=
=20
> the fps.
>=20
> Using
> 'GST_DEBUG=3D4 gst-launch-1.0 -v v4l2src device=3D/dev/video1 !=20
> fpsdisplaysink text-overlay=3Dfalse video-sink=3D"fakevideosink"'
> I get the following error message:
>=20
> (gst-launch-1.0:3231): GStreamer-CRITICAL **: 01:34:39.137:=20
> gst_memory_resize: assertion 'size + mem->offset + offset <=3D=20
> mem->maxsize' failed
> 0:00:03.489382529 =C2=A03231 0xffffa0000b90 WARN =C2=A0v4l2bufferpool=20
> gstv4l2bufferpool.c:2209:gst_v4l2_buffer_pool_process:<v4l2src0:pool0:src=
>=20
> Dropping truncated buffer, this is likely a driver bug.
> 0:00:03.489421906 =C2=A03231 0xffffa0000b90 WARN =C2=A0bufferpool=20
> gstbufferpool.c:1252:default_reset_buffer:<v4l2src0:pool0:src> Buffer=20
> 0xffff98008e80 without the memory tag has maxsize (8294400) that is=20
> smaller than the configured buffer pool size (12441600). The buffer will=
=20
> be not be reused. This is most likely a bug in this GstBufferPool subclas=
s

We'll need to check if its a userspace issue rather then kernel one. You ca=
n
test with v4l2-ctl (change 0 to the index of your video node):

v4l2-ctl -d 0 --stream-mmap --set-fmt-video=3Dwidth=3D3840,height=3D2160 --=
set-parm 60

The option --stream-to let you write to a file (will be slower then real-ti=
me
though).

Nicolas

>=20
>=20
> Everything works with 4k30fps or 1080p 60fps. The hardware should=20
> support 4k60fps.
>=20
> Best regards,
> Tim
>=20
> On 19.07.24 14:40, Shreeya Patel wrote:
> > This series implements support for the Synopsys DesignWare
> > HDMI RX Controller, being compliant with standard HDMI 1.4b
> > and HDMI 2.0.
> >=20
> > Features that are currently supported by the HDMI RX driver
> > have been tested on rock5b board using a HDMI to micro-HDMI cable.
> > It is recommended to use a good quality cable as there were
> > multiple issues seen during testing the driver.
> >=20
> > Please note the below information :-
> > * While testing the driver on rock5b we noticed that the binary BL31
> > from Rockchip contains some unknown code to get the HDMI-RX PHY
> > access working without any errors.
> > With TF-A BL31, the HDMI-RX PHY also works fine but there were no
> > interrupts seen for rk_hdmirx-hdmi leading to some errors when
> > loading the driver [0]. It doesn't affect the functionality of the
> > driver though.
> > * We have tested the working of OBS studio with HDMIRX driver and
> > there were no issues seen.
> > * We also tested and verified the support for interlaced video.
> >=20
> > [0] https://gitlab.collabora.com/hardware-enablement/rockchip-3588/trus=
ted-firmware-a/-/issues/1
> >=20
> > To test the HDMI RX Controller driver, following example commands can b=
e used :-
> >=20
> > root@debian-rockchip-rock5b-rk3588:~# v4l2-ctl --verbose -d /dev/video0=
 \
> > --set-fmt-video=3Dwidth=3D1920,height=3D1080,pixelformat=3D'BGR3' --str=
eam-mmap=3D4 \
> > --stream-skip=3D3 --stream-count=3D100 --stream-to=3D/home/hdmiin4k.raw=
 --stream-poll
> >=20
> > root@debian-rockchip-rock5b-rk3588:~# ffmpeg -f rawvideo -vcodec rawvid=
eo \
> > -s 1920x1080 -r 60 -pix_fmt bgr24 -i /home/hdmiin4k.raw output.mkv
> >=20
> > CEC compliance test results :-
> >=20
> > * https://gitlab.collabora.com/-/snippets/381
> > * https://gitlab.collabora.com/-/snippets/380
> >=20
> > Following is the v4l2-compliance test result :-
> >=20
> > root@debian-rockchip-rock5b-rk3588:~# v4l2-compliance -d /dev/video0
> > v4l2-compliance 1.27.0-5220, 64 bits, 64-bit time_t
> > v4l2-compliance SHA: 8387e3673837 2024-07-01 11:09:32
> >=20
> > Compliance test for snps_hdmirx device /dev/video0:
> >=20
> > Driver Info:
> > 	Driver name      : snps_hdmirx
> > 	Card type        : snps_hdmirx
> > 	Bus info         : platform:fdee0000.hdmi-receiver
> > 	Driver version   : 6.10.0
> > 	Capabilities     : 0x84201000
> > 		Video Capture Multiplanar
> > 		Streaming
> > 		Extended Pix Format
> > 		Device Capabilities
> > 	Device Caps      : 0x04201000
> > 		Video Capture Multiplanar
> > 		Streaming
> > 		Extended Pix Format
> >=20
> > Required ioctls:
> > 	test VIDIOC_QUERYCAP: OK
> > 	test invalid ioctls: OK
> >=20
> > Allow for multiple opens:
> > 	test second /dev/video0 open: OK
> > 	test VIDIOC_QUERYCAP: OK
> > 	test VIDIOC_G/S_PRIORITY: OK
> > 	test for unlimited opens: OK
> >=20
> > Debug ioctls:
> > 	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> > 	test VIDIOC_LOG_STATUS: OK
> >=20
> > Input ioctls:
> > 	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> > 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > 	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> > 	test VIDIOC_ENUMAUDIO: OK (Not Supported)
> > 	test VIDIOC_G/S/ENUMINPUT: OK
> > 	test VIDIOC_G/S_AUDIO: OK (Not Supported)
> > 	Inputs: 1 Audio Inputs: 0 Tuners: 0
> >=20
> > Output ioctls:
> > 	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> > 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > 	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> > 	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> > 	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> > 	Outputs: 0 Audio Outputs: 0 Modulators: 0
> >=20
> > Input/Output configuration ioctls:
> > 	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> > 	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK
> > 	test VIDIOC_DV_TIMINGS_CAP: OK
> > 	test VIDIOC_G/S_EDID: OK
> >=20
> > Control ioctls (Input 0):
> > 	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
> > 	test VIDIOC_QUERYCTRL: OK
> > 	test VIDIOC_G/S_CTRL: OK
> > 	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
> > 	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
> > 	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> > 	Standard Controls: 3 Private Controls: 0
> >=20
> > Format ioctls (Input 0):
> > 	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> > 	test VIDIOC_G/S_PARM: OK
> > 	test VIDIOC_G_FBUF: OK (Not Supported)
> > 	test VIDIOC_G_FMT: OK
> > 	test VIDIOC_TRY_FMT: OK
> > 	test VIDIOC_S_FMT: OK
> > 	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> > 	test Cropping: OK (Not Supported)
> > 	test Composing: OK (Not Supported)
> > 	test Scaling: OK (Not Supported)
> >=20
> > Codec ioctls (Input 0):
> > 	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> > 	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> > 	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> >=20
> > Buffer ioctls (Input 0):
> > 	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> > 	test CREATE_BUFS maximum buffers: OK
> > 	test VIDIOC_REMOVE_BUFS: OK
> > 	test VIDIOC_EXPBUF: OK
> > 	test Requests: OK (Not Supported)
> >=20
> > Total for snps_hdmirx device /dev/video0: 47, Succeeded: 47, Failed: 0,=
 Warnings: 0
> >=20
> > Changes in v4 :-
> >    - Remove DTS changes included in the device tree patch
> >    - Remove the hdmi rx pin info as it's already present
> >      in the rk3588-base-pinctrl.dtsi
> >    - Create a separate config option for selecting the EDID
> >      and enable it by default
> >    - Improve the comment related to DV timings and move it
> >      to the side of hdmirx_get_detected_timings
> >    - Add 100ms delay before pulling the HPD high
> >    - Do not return the detected timings from VIDIOC_G_DV_TIMINGS
> >    - Drop the bus info from hdmirx_querycap
> >    - If *num_planes !=3D 0 then return 0 in hdmirx_queue_setup
> >    - Set queue->min_queued_buffers to 1
> >    - Drop q->allow_cache_hints =3D 0; as it's always 0 by default
> >    - Add a comment for q->dma_attrs =3D DMA_ATTR_FORCE_CONTIGUOUS;
> >    - Drop .read =3D vb2_fop_read as it's not supported by driver
> >    - Remove redundant edid_init_data_600M
> >    - Make HPD low when driver is loaded
> >    - Add support for reading AVI Infoframe
> >    - Remove msg_len checks from hdmirx_cec_transmit
> >    - Add info about the CEC compliance test in the cover letter
> >    - Add arbitration lost status
> >    - Validate the physical address inside the EDID
> >=20
> > Changes in v3 :-
> >    - Use v4l2-common helpers in the HDMIRX driver
> >    - Rename cma node and phandle names
> >    - Elaborate the comment to explain 160MiB calculation
> >    - Move &hdmi_receiver_cma to the rock5b dts file
> >    - Add information about interlaced video testing in the
> >      cover-letter
> >=20
> > Changes in v2 :-
> >    - Fix checkpatch --strict warnings
> >    - Move the dt-binding include file changes in a separate patch
> >    - Add a description for the hardware in the dt-bindings file
> >    - Rename resets, vo1 grf and HPD properties
> >    - Add a proper description for grf and vo1-grf phandles in the
> >      bindings
> >    - Rename the HDMI RX node name to hdmi-receiver
> >    - Include gpio header file in binding example to fix the
> >      dt_binding_check failure
> >    - Move hdmirx_cma node to the rk3588.dtsi file
> >    - Add an entry to MAINTAINERS file for the HDMIRX driver
> >=20
> > Shreeya Patel (4):
> >    MAINTAINERS: Add entry for Synopsys DesignWare HDMI RX Driver
> >    dt-bindings: media: Document bindings for HDMI RX Controller
> >    arm64: dts: rockchip: Add device tree support for HDMI RX Controller
> >    media: platform: synopsys: Add support for hdmi input driver
> >=20
> >   .../bindings/media/snps,dw-hdmi-rx.yaml       |  132 +
> >   MAINTAINERS                                   |    8 +
> >   .../dts/rockchip/rk3588-base-pinctrl.dtsi     |   14 +
> >   .../arm64/boot/dts/rockchip/rk3588-extra.dtsi |   56 +
> >   drivers/media/platform/Kconfig                |    1 +
> >   drivers/media/platform/Makefile               |    1 +
> >   drivers/media/platform/synopsys/Kconfig       |    3 +
> >   drivers/media/platform/synopsys/Makefile      |    2 +
> >   .../media/platform/synopsys/hdmirx/Kconfig    |   27 +
> >   .../media/platform/synopsys/hdmirx/Makefile   |    4 +
> >   .../platform/synopsys/hdmirx/snps_hdmirx.c    | 2763 ++++++++++++++++=
+
> >   .../platform/synopsys/hdmirx/snps_hdmirx.h    |  394 +++
> >   .../synopsys/hdmirx/snps_hdmirx_cec.c         |  285 ++
> >   .../synopsys/hdmirx/snps_hdmirx_cec.h         |   44 +
> >   14 files changed, 3734 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/media/snps,dw-hd=
mi-rx.yaml
> >   create mode 100644 drivers/media/platform/synopsys/Kconfig
> >   create mode 100644 drivers/media/platform/synopsys/Makefile
> >   create mode 100644 drivers/media/platform/synopsys/hdmirx/Kconfig
> >   create mode 100644 drivers/media/platform/synopsys/hdmirx/Makefile
> >   create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmirx=
.c
> >   create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmirx=
.h
> >   create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmirx=
_cec.c
> >   create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmirx=
_cec.h
> >=20
>=20


