Return-Path: <linux-media+bounces-16283-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A2D951896
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 12:24:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 315601C21EF2
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 10:24:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C8ED1AD9EA;
	Wed, 14 Aug 2024 10:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=shreeya.patel@collabora.com header.b="OCXsrx97"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732061A4F10;
	Wed, 14 Aug 2024 10:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723631037; cv=pass; b=VzAaOoYJhHdKgde2XxnMdi1jjputADw92QtAvNYoO2TBu0emJ87DVJ1dIgQjoLW4whEIYizfoBgIMsJfN7HqGk2W3xiD3/5zdpzDXFlg1JLFSCUf/kRjqJD9ppUMEvpyPTvcqxZ7AFwzvT3vT6hHdjLxU3aRVhIrE2mHRMQJn6I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723631037; c=relaxed/simple;
	bh=FJhdXmcJfITXAU0eY6mADQeSuP/jponqtb7pDgHUZc0=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=fHJbqxKvNxl0eqCJHM4pVk8M29HQAVa9NIjrQn65R7SIfZ26gtAf4WRmq1oZuXvz+CTlRvOaId4PRLI5YEfdWBIsftIjf9SF+TBpRkhdJdjPUkZiT01O6SWVCbX4hlnL0qLSc7rycTV2FExWhkhW4/oH5695ecqC/cNk+kELzJs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=shreeya.patel@collabora.com header.b=OCXsrx97; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Delivered-To: nicolas.dufresne@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1723630979; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Mv+Lbq4LftFO8c0ZzwICdAtOSIiOuoXWVn7T/4qjtEQggbgOgWJPYKpPffffv4Nbo8hH+2WfvhHHaiVbWwztoyKLdkWZZEvM69dZNjrCuMXOFca2smBY4qo+ij3YIACiHtkCtm/HLfwh5zhICJUoTgFVCWuXVffnJ9b/1YRhw6I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1723630979; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=KDSuq+GdTkk8usdOD1M6R1p5SyZGtUFOvVvC4JR/q4U=; 
	b=VIRKkSZS1V38FTAYMJWOsrHpd0ihEA2+9xc2585g5ZhgRID7YfUqYSfMqhJwL+kpbZ+L4U9IG4UD9owpzyrCEYQjL0xk2rp/0vtl+hsfUTrXz4KqCb3LERCJQxzo+/4CbVtSoAxHNCAKdQKPGM3g1YFkYJbdyGw9oZlN4WxtpEI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=shreeya.patel@collabora.com;
	dmarc=pass header.from=<shreeya.patel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1723630979;
	s=zohomail; d=collabora.com; i=shreeya.patel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=KDSuq+GdTkk8usdOD1M6R1p5SyZGtUFOvVvC4JR/q4U=;
	b=OCXsrx97mNoLm5XwPuTPdi9MywUJusqE5tG1wZimWkhm5AqWqhwYZPgLQIntrseC
	tMgnmWI8rxO4xN63+RWOBqyDhUFUHSeoalq4k2rAzXheFErrGP/W+x4mgeduWOqshFB
	mOIXMjBHfGGkE1b11nREH3ksmSb6HP/hhqljU/lg=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1723630978549368.7322665721008; Wed, 14 Aug 2024 03:22:58 -0700 (PDT)
Date: Wed, 14 Aug 2024 15:52:56 +0530
From: Shreeya Patel <shreeya.patel@collabora.com>
To: "Tim Surber" <me@timsurber.de>
Cc: "heiko" <heiko@sntech.de>, "mchehab" <mchehab@kernel.org>,
	"robh" <robh@kernel.org>, "krzk+dt" <krzk+dt@kernel.org>,
	"conor+dt" <conor+dt@kernel.org>,
	"mturquette" <mturquette@baylibre.com>, "sboyd" <sboyd@kernel.org>,
	"p.zabel" <p.zabel@pengutronix.de>,
	"jose.abreu" <jose.abreu@synopsys.com>,
	"nelson.costa" <nelson.costa@synopsys.com>,
	"shawn.wen" <shawn.wen@rock-chips.com>,
	"nicolas.dufresne" <nicolas.dufresne@collabora.com>,
	"hverkuil" <hverkuil@xs4all.nl>,
	"hverkuil-cisco" <hverkuil-cisco@xs4all.nl>,
	"kernel" <kernel@collabora.com>,
	"linux-kernel" <linux-kernel@vger.kernel.org>,
	"linux-media" <linux-media@vger.kernel.org>,
	"devicetree" <devicetree@vger.kernel.org>,
	"linux-arm-kernel" <linux-arm-kernel@lists.infradead.org>,
	"linux-rockchip" <linux-rockchip@lists.infradead.org>
Message-ID: <19150697f90.11f343d091099757.4301715823219222254@collabora.com>
In-Reply-To: <6f5c4ebb-84ab-4b65-9817-ac5f6158911f@timsurber.de>
References: <20240719124032.26852-1-shreeya.patel@collabora.com> <6f5c4ebb-84ab-4b65-9817-ac5f6158911f@timsurber.de>
Subject: Re: [PATCH v4 0/4] Add Synopsys DesignWare HDMI RX Controller
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail

 ---- On Sun, 04 Aug 2024 05:27:08 +0530  Tim Surber  wrote ---=20
 > Hi Shreeya,
 >=20

Hi Tim,


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
 > gstv4l2bufferpool.c:2209:gst_v4l2_buffer_pool_process:=20
 > Dropping truncated buffer, this is likely a driver bug.
 > 0:00:03.489421906 =C2=A03231 0xffffa0000b90 WARN =C2=A0bufferpool=20
 > gstbufferpool.c:1252:default_reset_buffer: Buffer=20
 > 0xffff98008e80 without the memory tag has maxsize (8294400) that is=20
 > smaller than the configured buffer pool size (12441600). The buffer will=
=20
 > be not be reused. This is most likely a bug in this GstBufferPool subcla=
ss
 >=20
 >=20
 > Everything works with 4k30fps or 1080p 60fps. The hardware should=20
 > support 4k60fps.
 >=20


Sorry for the delayed response, I've been trying to reproduce this on my si=
de
and to also fix it.

It seems you are right, 4K@60 fps doesn't work with the latest version of H=
DMIRX.
We found out that it could be because of the current EDID which shows some =
failures.

Though I wasn't able to test the following on my side since my device doesn=
't support
4K, one of my colleague tried to replace the EDID and 4K@60 fps worked fine=
 after that.

If you'd like to try it yourself then following is the command to get the n=
ew EDID

v4l2-ctl --show-edid type=3Dhdmi-4k-600mhz

You will have to replace the EDID in the driver with the EDID you get the f=
rom the above
command in HEX format.

Thanks for reporting this, I will soon send v5 with this change included in=
 it.


Thanks,
Shreeya Patel


 > Best regards,
 > Tim
 >=20
 > On 19.07.24 14:40, Shreeya Patel wrote:
 > > This series implements support for the Synopsys DesignWare
 > > HDMI RX Controller, being compliant with standard HDMI 1.4b
 > > and HDMI 2.0.
 > >
 > > Features that are currently supported by the HDMI RX driver
 > > have been tested on rock5b board using a HDMI to micro-HDMI cable.
 > > It is recommended to use a good quality cable as there were
 > > multiple issues seen during testing the driver.
 > >
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
 > >
 > > [0] https://gitlab.collabora.com/hardware-enablement/rockchip-3588/tru=
sted-firmware-a/-/issues/1
 > >
 > > To test the HDMI RX Controller driver, following example commands can =
be used :-
 > >
 > > root@debian-rockchip-rock5b-rk3588:~# v4l2-ctl --verbose -d /dev/video=
0 \
 > > --set-fmt-video=3Dwidth=3D1920,height=3D1080,pixelformat=3D'BGR3' --st=
ream-mmap=3D4 \
 > > --stream-skip=3D3 --stream-count=3D100 --stream-to=3D/home/hdmiin4k.ra=
w --stream-poll
 > >
 > > root@debian-rockchip-rock5b-rk3588:~# ffmpeg -f rawvideo -vcodec rawvi=
deo \
 > > -s 1920x1080 -r 60 -pix_fmt bgr24 -i /home/hdmiin4k.raw output.mkv
 > >
 > > CEC compliance test results :-
 > >
 > > * https://gitlab.collabora.com/-/snippets/381
 > > * https://gitlab.collabora.com/-/snippets/380
 > >
 > > Following is the v4l2-compliance test result :-
 > >
 > > root@debian-rockchip-rock5b-rk3588:~# v4l2-compliance -d /dev/video0
 > > v4l2-compliance 1.27.0-5220, 64 bits, 64-bit time_t
 > > v4l2-compliance SHA: 8387e3673837 2024-07-01 11:09:32
 > >
 > > Compliance test for snps_hdmirx device /dev/video0:
 > >
 > > Driver Info:
 > > =C2=A0=C2=A0=C2=A0=C2=A0Driver name      : snps_hdmirx
 > > =C2=A0=C2=A0=C2=A0=C2=A0Card type        : snps_hdmirx
 > > =C2=A0=C2=A0=C2=A0=C2=A0Bus info         : platform:fdee0000.hdmi-rece=
iver
 > > =C2=A0=C2=A0=C2=A0=C2=A0Driver version   : 6.10.0
 > > =C2=A0=C2=A0=C2=A0=C2=A0Capabilities     : 0x84201000
 > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Video Capture Multipla=
nar
 > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Streaming
 > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Extended Pix Format
 > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Device Capabilities
 > > =C2=A0=C2=A0=C2=A0=C2=A0Device Caps      : 0x04201000
 > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Video Capture Multipla=
nar
 > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Streaming
 > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Extended Pix Format
 > >
 > > Required ioctls:
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_QUERYCAP: OK
 > > =C2=A0=C2=A0=C2=A0=C2=A0test invalid ioctls: OK
 > >
 > > Allow for multiple opens:
 > > =C2=A0=C2=A0=C2=A0=C2=A0test second /dev/video0 open: OK
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_QUERYCAP: OK
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_G/S_PRIORITY: OK
 > > =C2=A0=C2=A0=C2=A0=C2=A0test for unlimited opens: OK
 > >
 > > Debug ioctls:
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_DBG_G/S_REGISTER: OK (Not Supporte=
d)
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_LOG_STATUS: OK
 > >
 > > Input ioctls:
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not=
 Supported)
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_ENUMAUDIO: OK (Not Supported)
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_G/S/ENUMINPUT: OK
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_G/S_AUDIO: OK (Not Supported)
 > > =C2=A0=C2=A0=C2=A0=C2=A0Inputs: 1 Audio Inputs: 0 Tuners: 0
 > >
 > > Output ioctls:
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_G/S_MODULATOR: OK (Not Supported)
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_ENUMAUDOUT: OK (Not Supported)
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_G/S_AUDOUT: OK (Not Supported)
 > > =C2=A0=C2=A0=C2=A0=C2=A0Outputs: 0 Audio Outputs: 0 Modulators: 0
 > >
 > > Input/Output configuration ioctls:
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Suppor=
ted)
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_DV_TIMINGS_CAP: OK
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_G/S_EDID: OK
 > >
 > > Control ioctls (Input 0):
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_QUERYCTRL: OK
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_G/S_CTRL: OK
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_G/S/TRY_EXT_CTRLS: OK
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
 > > =C2=A0=C2=A0=C2=A0=C2=A0Standard Controls: 3 Private Controls: 0
 > >
 > > Format ioctls (Input 0):
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS=
: OK
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_G/S_PARM: OK
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_G_FBUF: OK (Not Supported)
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_G_FMT: OK
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_TRY_FMT: OK
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_S_FMT: OK
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supporte=
d)
 > > =C2=A0=C2=A0=C2=A0=C2=A0test Cropping: OK (Not Supported)
 > > =C2=A0=C2=A0=C2=A0=C2=A0test Composing: OK (Not Supported)
 > > =C2=A0=C2=A0=C2=A0=C2=A0test Scaling: OK (Not Supported)
 > >
 > > Codec ioctls (Input 0):
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Support=
ed)
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_G_ENC_INDEX: OK (Not Supported)
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_(TRY_)DECODER_CMD: OK (Not Support=
ed)
 > >
 > > Buffer ioctls (Input 0):
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
 > > =C2=A0=C2=A0=C2=A0=C2=A0test CREATE_BUFS maximum buffers: OK
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_REMOVE_BUFS: OK
 > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_EXPBUF: OK
 > > =C2=A0=C2=A0=C2=A0=C2=A0test Requests: OK (Not Supported)
 > >
 > > Total for snps_hdmirx device /dev/video0: 47, Succeeded: 47, Failed: 0=
, Warnings: 0
 > >
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
 > >
 > > Changes in v3 :-
 > >    - Use v4l2-common helpers in the HDMIRX driver
 > >    - Rename cma node and phandle names
 > >    - Elaborate the comment to explain 160MiB calculation
 > >    - Move &hdmi_receiver_cma to the rock5b dts file
 > >    - Add information about interlaced video testing in the
 > >      cover-letter
 > >
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
 > >
 > > Shreeya Patel (4):
 > >    MAINTAINERS: Add entry for Synopsys DesignWare HDMI RX Driver
 > >    dt-bindings: media: Document bindings for HDMI RX Controller
 > >    arm64: dts: rockchip: Add device tree support for HDMI RX Controlle=
r
 > >    media: platform: synopsys: Add support for hdmi input driver
 > >
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
 > >   .../platform/synopsys/hdmirx/snps_hdmirx.c    | 2763 +++++++++++++++=
++
 > >   .../platform/synopsys/hdmirx/snps_hdmirx.h    |  394 +++
 > >   .../synopsys/hdmirx/snps_hdmirx_cec.c         |  285 ++
 > >   .../synopsys/hdmirx/snps_hdmirx_cec.h         |   44 +
 > >   14 files changed, 3734 insertions(+)
 > >   create mode 100644 Documentation/devicetree/bindings/media/snps,dw-h=
dmi-rx.yaml
 > >   create mode 100644 drivers/media/platform/synopsys/Kconfig
 > >   create mode 100644 drivers/media/platform/synopsys/Makefile
 > >   create mode 100644 drivers/media/platform/synopsys/hdmirx/Kconfig
 > >   create mode 100644 drivers/media/platform/synopsys/hdmirx/Makefile
 > >   create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmir=
x.c
 > >   create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmir=
x.h
 > >   create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmir=
x_cec.c
 > >   create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmir=
x_cec.h
 > >
 >=20

