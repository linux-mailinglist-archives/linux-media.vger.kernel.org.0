Return-Path: <linux-media+bounces-17122-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 908089640DF
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 12:04:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48721283373
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 10:04:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6B3218DF94;
	Thu, 29 Aug 2024 10:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=shreeya.patel@collabora.com header.b="e8MkRzAS"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0605018C90F;
	Thu, 29 Aug 2024 10:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724925875; cv=pass; b=lhTynu1rphsEVL1twi3Cer2s8XboSss1+xaqDJILpRkmZUmLJ44WtkSVPt04lP0tK3NTO71QOpu6N6tLznODpnL0tkEZgfa3QMgSvaTV2wlTykHelkx85VFkVAv95VaO961YC0xIUbnJnqRFk3WjpWu3p6+LggxSjuS1sbwGB3k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724925875; c=relaxed/simple;
	bh=YmG82Xpg0Tla/3duqpK/FgcyXSe3sEXJrvUP3NLB3vw=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=KHPsvrCwjhotLMQlUg5M4cwfRWdN1VK/zw3+bI725Rq8BxfTKDbLxmFgx32As6G/NPYT2NfrxKSBwmH7q/PES8ULCcV5XLVRGJtWjjEbaxK6/hY/tHHh7UUAWDATLg1YvDcr3QHwJikzitVkVuKe8W2yjpdqmETzu4ChesKwFMs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=shreeya.patel@collabora.com header.b=e8MkRzAS; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Delivered-To: nicolas.dufresne@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1724925822; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gNBZpXh+Xd0h3QWXFDkAtOWKfOG0MCyjZFsdz9kG3n7qSt2ZpqTATIix//jSwvtWS2QYfntSfRd6fy01SfYht/HksWEfS7jhiUa7j1wX2q54OdMfkcXulQUWKvT2f4uAZP6QRWWNzUOMeM8pvV1yWTn6VlRd2zugF/FpCuvv2EI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1724925822; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=qONUeydkRVhD2t1OPCBVx8xjJXj4ujqXTSH3NPxbT+4=; 
	b=egY/TGBWOVe/Y7HK4D7VZ8w7XzUnbb0tATW3dpdA8PFV+N7Z605KgaIX8xLjPGWdneeZtTYCgvsjBC3AcZNZmvaLnyyxuMR0PgWifNUKqJAf0Y68lMIgXNfv6W2Fapyq3zLD/xkK+dO3P8FY/dm1ykY2PDlVcjSiflRtZdDnMkM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=shreeya.patel@collabora.com;
	dmarc=pass header.from=<shreeya.patel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724925822;
	s=zohomail; d=collabora.com; i=shreeya.patel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=qONUeydkRVhD2t1OPCBVx8xjJXj4ujqXTSH3NPxbT+4=;
	b=e8MkRzAS6bt3Bzo2tKDKPb605upD+/4cRHt4AiS/IJ5heYFPrAO+KmCOkjPx+wuQ
	+8JKAkRuk3Fy1wPTZyzpG96VCObNDEoZxamopo0/wdZMjKoSwzSIAksTfjATuRk+chu
	px9LdIqds73WCDmKORl5PQkjnWu2neB4NqaIor5Q=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 172492582100197.34520959421991; Thu, 29 Aug 2024 03:03:41 -0700 (PDT)
Date: Thu, 29 Aug 2024 15:33:40 +0530
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
Message-ID: <1919d97402f.b403f96c443474.1860819764033812181@collabora.com>
In-Reply-To: <74850340-b662-4a58-b5eb-a4e352c5002c@timsurber.de>
References: <20240719124032.26852-1-shreeya.patel@collabora.com>
 <6f5c4ebb-84ab-4b65-9817-ac5f6158911f@timsurber.de>
 <19150697f90.11f343d091099757.4301715823219222254@collabora.com> <74850340-b662-4a58-b5eb-a4e352c5002c@timsurber.de>
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


 ---- On Thu, 29 Aug 2024 03:43:40 +0530  Tim Surber  wrote ---=20
 > Hi Shreeya,
 >=20
 > another hint:
 >=20
 > Changing the EDID like you described fixed the 4k60fps BGR3 input.
 >=20
 > But still for NV16/NV24 (I can't output NV12 for some reason) there is=
=20
 > the error which Nicolas described.
 >=20
 > The output from v4l2-ctl for NV16/NV24 is:
 >=20
 > Plane 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :
 >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Bytes per Line : 3840
 >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Size Image=C2=A0=C2=A0=C2=A0=C2=A0=
 : 8294400
 >=20
 > According to Nicolas there should be an additional plane/more memory=20
 > reserved.
 >=20

Yes, it could be possible that the imagesize is incorrect as we made some
modifications related to it in v4. I'll increase this as required by the NV=
12/24
and see if that fixes the issue.


Thanks,
Shreeya Patel

 > This leads to errors when trying to read the device using for example=20
 > gstreamer:
 >=20
 >  =C2=A0gst_memory_resize: assertion 'size + mem->offset + offset <=3D=20
 > mem->maxsize' failed
 >=20
 >=20
 > This seems to always happen using the=C2=A0 NV16/NV24 formats regardless=
 of=20
 > resolution/fps.
 >=20
 >=20
 > Best regards,
 >=20
 > Tim
 >=20
 > On 14.08.24 12:22, Shreeya Patel wrote:
 > >   ---- On Sun, 04 Aug 2024 05:27:08 +0530  Tim Surber  wrote ---
 > >   > Hi Shreeya,
 > >   >
 > >
 > > Hi Tim,
 > >
 > >
 > >   > I tested your patch and noticed problems when using 3840x2160 reso=
lution
 > >   > at =C2=A060fps.
 > >   >
 > >   > For my testing I connected an HDMI source and set it to 4k60fps. I
 > >   > verified that this source and the cables work on a screen at this
 > >   > resolution.
 > >   >
 > >   > Using
 > >   > 'v4l2-ctl --verbose -d /dev/video1
 > >   > --set-fmt-video=3Dwidth=3D3840,height=3D2160,pixelformat=3D'NV12'
 > >   > --stream-mmap=3D4 --stream-skip=3D3 --stream-count=3D100 --stream-=
poll'
 > >   > I get the video format output, but not the periodic output which s=
hows
 > >   > the fps.
 > >   >
 > >   > Using
 > >   > 'GST_DEBUG=3D4 gst-launch-1.0 -v v4l2src device=3D/dev/video1 !
 > >   > fpsdisplaysink text-overlay=3Dfalse video-sink=3D"fakevideosink"'
 > >   > I get the following error message:
 > >   >
 > >   > (gst-launch-1.0:3231): GStreamer-CRITICAL **: 01:34:39.137:
 > >   > gst_memory_resize: assertion 'size + mem->offset + offset <=3D
 > >   > mem->maxsize' failed
 > >   > 0:00:03.489382529 =C2=A03231 0xffffa0000b90 WARN =C2=A0v4l2bufferp=
ool
 > >   > gstv4l2bufferpool.c:2209:gst_v4l2_buffer_pool_process:
 > >   > Dropping truncated buffer, this is likely a driver bug.
 > >   > 0:00:03.489421906 =C2=A03231 0xffffa0000b90 WARN =C2=A0bufferpool
 > >   > gstbufferpool.c:1252:default_reset_buffer: Buffer
 > >   > 0xffff98008e80 without the memory tag has maxsize (8294400) that i=
s
 > >   > smaller than the configured buffer pool size (12441600). The buffe=
r will
 > >   > be not be reused. This is most likely a bug in this GstBufferPool =
subclass
 > >   >
 > >   >
 > >   > Everything works with 4k30fps or 1080p 60fps. The hardware should
 > >   > support 4k60fps.
 > >   >
 > >
 > >
 > > Sorry for the delayed response, I've been trying to reproduce this on =
my side
 > > and to also fix it.
 > >
 > > It seems you are right, 4K@60 fps doesn't work with the latest version=
 of HDMIRX.
 > > We found out that it could be because of the current EDID which shows =
some failures.
 > >
 > > Though I wasn't able to test the following on my side since my device =
doesn't support
 > > 4K, one of my colleague tried to replace the EDID and 4K@60 fps worked=
 fine after that.
 > >
 > > If you'd like to try it yourself then following is the command to get =
the new EDID
 > >
 > > v4l2-ctl --show-edid type=3Dhdmi-4k-600mhz
 > >
 > > You will have to replace the EDID in the driver with the EDID you get =
the from the above
 > > command in HEX format.
 > >
 > > Thanks for reporting this, I will soon send v5 with this change includ=
ed in it.
 > >
 > >
 > > Thanks,
 > > Shreeya Patel
 > >
 > >
 > >   > Best regards,
 > >   > Tim
 > >   >
 > >   > On 19.07.24 14:40, Shreeya Patel wrote:
 > >   > > This series implements support for the Synopsys DesignWare
 > >   > > HDMI RX Controller, being compliant with standard HDMI 1.4b
 > >   > > and HDMI 2.0.
 > >   > >
 > >   > > Features that are currently supported by the HDMI RX driver
 > >   > > have been tested on rock5b board using a HDMI to micro-HDMI cabl=
e.
 > >   > > It is recommended to use a good quality cable as there were
 > >   > > multiple issues seen during testing the driver.
 > >   > >
 > >   > > Please note the below information :-
 > >   > > * While testing the driver on rock5b we noticed that the binary =
BL31
 > >   > > from Rockchip contains some unknown code to get the HDMI-RX PHY
 > >   > > access working without any errors.
 > >   > > With TF-A BL31, the HDMI-RX PHY also works fine but there were n=
o
 > >   > > interrupts seen for rk_hdmirx-hdmi leading to some errors when
 > >   > > loading the driver [0]. It doesn't affect the functionality of t=
he
 > >   > > driver though.
 > >   > > * We have tested the working of OBS studio with HDMIRX driver an=
d
 > >   > > there were no issues seen.
 > >   > > * We also tested and verified the support for interlaced video.
 > >   > >
 > >   > > [0] https://gitlab.collabora.com/hardware-enablement/rockchip-35=
88/trusted-firmware-a/-/issues/1
 > >   > >
 > >   > > To test the HDMI RX Controller driver, following example command=
s can be used :-
 > >   > >
 > >   > > root@debian-rockchip-rock5b-rk3588:~# v4l2-ctl --verbose -d /dev=
/video0 \
 > >   > > --set-fmt-video=3Dwidth=3D1920,height=3D1080,pixelformat=3D'BGR3=
' --stream-mmap=3D4 \
 > >   > > --stream-skip=3D3 --stream-count=3D100 --stream-to=3D/home/hdmii=
n4k.raw --stream-poll
 > >   > >
 > >   > > root@debian-rockchip-rock5b-rk3588:~# ffmpeg -f rawvideo -vcodec=
 rawvideo \
 > >   > > -s 1920x1080 -r 60 -pix_fmt bgr24 -i /home/hdmiin4k.raw output.m=
kv
 > >   > >
 > >   > > CEC compliance test results :-
 > >   > >
 > >   > > * https://gitlab.collabora.com/-/snippets/381
 > >   > > * https://gitlab.collabora.com/-/snippets/380
 > >   > >
 > >   > > Following is the v4l2-compliance test result :-
 > >   > >
 > >   > > root@debian-rockchip-rock5b-rk3588:~# v4l2-compliance -d /dev/vi=
deo0
 > >   > > v4l2-compliance 1.27.0-5220, 64 bits, 64-bit time_t
 > >   > > v4l2-compliance SHA: 8387e3673837 2024-07-01 11:09:32
 > >   > >
 > >   > > Compliance test for snps_hdmirx device /dev/video0:
 > >   > >
 > >   > > Driver Info:
 > >   > > =C2=A0=C2=A0=C2=A0=C2=A0Driver name      : snps_hdmirx
 > >   > > =C2=A0=C2=A0=C2=A0=C2=A0Card type        : snps_hdmirx
 > >   > > =C2=A0=C2=A0=C2=A0=C2=A0Bus info         : platform:fdee0000.hdm=
i-receiver
 > >   > > =C2=A0=C2=A0=C2=A0=C2=A0Driver version   : 6.10.0
 > >   > > =C2=A0=C2=A0=C2=A0=C2=A0Capabilities     : 0x84201000
 > >   > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Video Capture Mu=
ltiplanar
 > >   > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Streaming
 > >   > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Extended Pix For=
mat
 > >   > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Device Capabilit=
ies
 > >   > > =C2=A0=C2=A0=C2=A0=C2=A0Device Caps      : 0x04201000
 > >   > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Video Capture Mu=
ltiplanar
 > >   > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Streaming
 > >   > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Extended Pix For=
mat
 > >   > >
 > >   > > Required ioctls:
 > >   > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_QUERYCAP: OK
 > >   > > =C2=A0=C2=A0=C2=A0=C2=A0test invalid ioctls: OK
 > >   > >
 > >   > > Allow for multiple opens:
 > >   > > =C2=A0=C2=A0=C2=A0=C2=A0test second /dev/video0 open: OK
 > >   > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_QUERYCAP: OK
 > >   > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_G/S_PRIORITY: OK
 > >   > > =C2=A0=C2=A0=C2=A0=C2=A0test for unlimited opens: OK
 > >   > >
 > >   > > Debug ioctls:
 > >   > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_DBG_G/S_REGISTER: OK (Not Su=
pported)
 > >   > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_LOG_STATUS: OK
 > >   > >
 > >   > > Input ioctls:
 > >   > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: O=
K (Not Supported)
 > >   > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_G/S_FREQUENCY: OK (Not Suppo=
rted)
 > >   > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supp=
orted)
 > >   > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_ENUMAUDIO: OK (Not Supported=
)
 > >   > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_G/S/ENUMINPUT: OK
 > >   > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_G/S_AUDIO: OK (Not Supported=
)
 > >   > > =C2=A0=C2=A0=C2=A0=C2=A0Inputs: 1 Audio Inputs: 0 Tuners: 0
 > >   > >
 > >   > > Output ioctls:
 > >   > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_G/S_MODULATOR: OK (Not Suppo=
rted)
 > >   > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_G/S_FREQUENCY: OK (Not Suppo=
rted)
 > >   > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_ENUMAUDOUT: OK (Not Supporte=
d)
 > >   > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supp=
orted)
 > >   > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_G/S_AUDOUT: OK (Not Supporte=
d)
 > >   > > =C2=A0=C2=A0=C2=A0=C2=A0Outputs: 0 Audio Outputs: 0 Modulators: =
0
 > >   > >
 > >   > > Input/Output configuration ioctls:
 > >   > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not =
Supported)
 > >   > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: O=
K
 > >   > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_DV_TIMINGS_CAP: OK
 > >   > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_G/S_EDID: OK
 > >   > >
 > >   > > Control ioctls (Input 0):
 > >   > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
 > >   > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_QUERYCTRL: OK
 > >   > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_G/S_CTRL: OK
 > >   > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_G/S/TRY_EXT_CTRLS: OK
 > >   > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT:=
 OK
 > >   > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_G/S_JPEGCOMP: OK (Not Suppor=
ted)
 > >   > > =C2=A0=C2=A0=C2=A0=C2=A0Standard Controls: 3 Private Controls: 0
 > >   > >
 > >   > > Format ioctls (Input 0):
 > >   > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINT=
ERVALS: OK
 > >   > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_G/S_PARM: OK
 > >   > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_G_FBUF: OK (Not Supported)
 > >   > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_G_FMT: OK
 > >   > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_TRY_FMT: OK
 > >   > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_S_FMT: OK
 > >   > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_G_SLICED_VBI_CAP: OK (Not Su=
pported)
 > >   > > =C2=A0=C2=A0=C2=A0=C2=A0test Cropping: OK (Not Supported)
 > >   > > =C2=A0=C2=A0=C2=A0=C2=A0test Composing: OK (Not Supported)
 > >   > > =C2=A0=C2=A0=C2=A0=C2=A0test Scaling: OK (Not Supported)
 > >   > >
 > >   > > Codec ioctls (Input 0):
 > >   > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_(TRY_)ENCODER_CMD: OK (Not S=
upported)
 > >   > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_G_ENC_INDEX: OK (Not Support=
ed)
 > >   > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_(TRY_)DECODER_CMD: OK (Not S=
upported)
 > >   > >
 > >   > > Buffer ioctls (Input 0):
 > >   > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF=
: OK
 > >   > > =C2=A0=C2=A0=C2=A0=C2=A0test CREATE_BUFS maximum buffers: OK
 > >   > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_REMOVE_BUFS: OK
 > >   > > =C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_EXPBUF: OK
 > >   > > =C2=A0=C2=A0=C2=A0=C2=A0test Requests: OK (Not Supported)
 > >   > >
 > >   > > Total for snps_hdmirx device /dev/video0: 47, Succeeded: 47, Fai=
led: 0, Warnings: 0
 > >   > >
 > >   > > Changes in v4 :-
 > >   > >    - Remove DTS changes included in the device tree patch
 > >   > >    - Remove the hdmi rx pin info as it's already present
 > >   > >      in the rk3588-base-pinctrl.dtsi
 > >   > >    - Create a separate config option for selecting the EDID
 > >   > >      and enable it by default
 > >   > >    - Improve the comment related to DV timings and move it
 > >   > >      to the side of hdmirx_get_detected_timings
 > >   > >    - Add 100ms delay before pulling the HPD high
 > >   > >    - Do not return the detected timings from VIDIOC_G_DV_TIMINGS
 > >   > >    - Drop the bus info from hdmirx_querycap
 > >   > >    - If *num_planes !=3D 0 then return 0 in hdmirx_queue_setup
 > >   > >    - Set queue->min_queued_buffers to 1
 > >   > >    - Drop q->allow_cache_hints =3D 0; as it's always 0 by defaul=
t
 > >   > >    - Add a comment for q->dma_attrs =3D DMA_ATTR_FORCE_CONTIGUOU=
S;
 > >   > >    - Drop .read =3D vb2_fop_read as it's not supported by driver
 > >   > >    - Remove redundant edid_init_data_600M
 > >   > >    - Make HPD low when driver is loaded
 > >   > >    - Add support for reading AVI Infoframe
 > >   > >    - Remove msg_len checks from hdmirx_cec_transmit
 > >   > >    - Add info about the CEC compliance test in the cover letter
 > >   > >    - Add arbitration lost status
 > >   > >    - Validate the physical address inside the EDID
 > >   > >
 > >   > > Changes in v3 :-
 > >   > >    - Use v4l2-common helpers in the HDMIRX driver
 > >   > >    - Rename cma node and phandle names
 > >   > >    - Elaborate the comment to explain 160MiB calculation
 > >   > >    - Move &hdmi_receiver_cma to the rock5b dts file
 > >   > >    - Add information about interlaced video testing in the
 > >   > >      cover-letter
 > >   > >
 > >   > > Changes in v2 :-
 > >   > >    - Fix checkpatch --strict warnings
 > >   > >    - Move the dt-binding include file changes in a separate patc=
h
 > >   > >    - Add a description for the hardware in the dt-bindings file
 > >   > >    - Rename resets, vo1 grf and HPD properties
 > >   > >    - Add a proper description for grf and vo1-grf phandles in th=
e
 > >   > >      bindings
 > >   > >    - Rename the HDMI RX node name to hdmi-receiver
 > >   > >    - Include gpio header file in binding example to fix the
 > >   > >      dt_binding_check failure
 > >   > >    - Move hdmirx_cma node to the rk3588.dtsi file
 > >   > >    - Add an entry to MAINTAINERS file for the HDMIRX driver
 > >   > >
 > >   > > Shreeya Patel (4):
 > >   > >    MAINTAINERS: Add entry for Synopsys DesignWare HDMI RX Driver
 > >   > >    dt-bindings: media: Document bindings for HDMI RX Controller
 > >   > >    arm64: dts: rockchip: Add device tree support for HDMI RX Con=
troller
 > >   > >    media: platform: synopsys: Add support for hdmi input driver
 > >   > >
 > >   > >   .../bindings/media/snps,dw-hdmi-rx.yaml       |  132 +
 > >   > >   MAINTAINERS                                   |    8 +
 > >   > >   .../dts/rockchip/rk3588-base-pinctrl.dtsi     |   14 +
 > >   > >   .../arm64/boot/dts/rockchip/rk3588-extra.dtsi |   56 +
 > >   > >   drivers/media/platform/Kconfig                |    1 +
 > >   > >   drivers/media/platform/Makefile               |    1 +
 > >   > >   drivers/media/platform/synopsys/Kconfig       |    3 +
 > >   > >   drivers/media/platform/synopsys/Makefile      |    2 +
 > >   > >   .../media/platform/synopsys/hdmirx/Kconfig    |   27 +
 > >   > >   .../media/platform/synopsys/hdmirx/Makefile   |    4 +
 > >   > >   .../platform/synopsys/hdmirx/snps_hdmirx.c    | 2763 +++++++++=
++++++++
 > >   > >   .../platform/synopsys/hdmirx/snps_hdmirx.h    |  394 +++
 > >   > >   .../synopsys/hdmirx/snps_hdmirx_cec.c         |  285 ++
 > >   > >   .../synopsys/hdmirx/snps_hdmirx_cec.h         |   44 +
 > >   > >   14 files changed, 3734 insertions(+)
 > >   > >   create mode 100644 Documentation/devicetree/bindings/media/snp=
s,dw-hdmi-rx.yaml
 > >   > >   create mode 100644 drivers/media/platform/synopsys/Kconfig
 > >   > >   create mode 100644 drivers/media/platform/synopsys/Makefile
 > >   > >   create mode 100644 drivers/media/platform/synopsys/hdmirx/Kcon=
fig
 > >   > >   create mode 100644 drivers/media/platform/synopsys/hdmirx/Make=
file
 > >   > >   create mode 100644 drivers/media/platform/synopsys/hdmirx/snps=
_hdmirx.c
 > >   > >   create mode 100644 drivers/media/platform/synopsys/hdmirx/snps=
_hdmirx.h
 > >   > >   create mode 100644 drivers/media/platform/synopsys/hdmirx/snps=
_hdmirx_cec.c
 > >   > >   create mode 100644 drivers/media/platform/synopsys/hdmirx/snps=
_hdmirx_cec.h
 > >   > >
 > >   >
 >=20

