Return-Path: <linux-media+bounces-44178-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E655ABCD065
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 15:06:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA7FA3BBE9A
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 13:06:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD6352F0C63;
	Fri, 10 Oct 2025 13:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="lqHSGfEB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F9B1C5F27
	for <linux-media@vger.kernel.org>; Fri, 10 Oct 2025 13:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760101564; cv=none; b=GxrXznVgSrsz1hCURj+eF4GdK1owmqgeQRoRO70lGM1McrqCU8PfM6keTvocbeq3GOlM/gDfrCSY56sK7SSrKWycqnYwUmb1iWskPz8PJckOudT8HZ8i59BCQi9FW8Y/qZ5I10lM1VJg81cRnKSmrWzV8CQo3N28x8f8n+rhSrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760101564; c=relaxed/simple;
	bh=OQCvERQ330yC+5UdomKYeEry1qjCf4lcJvsbIum2GUk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uFvO2ViI76BeynK14BwH87r8oZN3tmxR4sTrqVaT9kA946qrFa5IYTKyjzyUW8E2v8HFDQ2pgSEX5s1TkRXb3E9Cj/DO7pJOawHLxs4imHP5HuaOmIa4M9thKbPiYsRS8C16VsPQyagbb0VCYLTK29qjxRalhfeAF9On7Qvemck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=lqHSGfEB; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-7e3148a8928so18917746d6.2
        for <linux-media@vger.kernel.org>; Fri, 10 Oct 2025 06:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1760101560; x=1760706360; darn=vger.kernel.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=L0+BpS6t2Yv2H52sIT/8sevjMsANiLM0BQhq3pAOHw4=;
        b=lqHSGfEBf+uSze7ZD1hAybGHeJYfk9F8WdpINKpF8fmUf6VeFlC1Z6aXOLPiYBzYwL
         jYhFORDhTynf0p5qLmpLAYRzG77ZuFEIKYBZMcTsu0N1ubxPEBFhoHrHeyg441wmGPed
         QuL2nF5XkLxDY/wDWdQMDCkb/6ifBwOzokCsGqQ3HpdRBZjysRWPZsOVzRJr1ZbZrHz+
         jra5YH/RGd/OoW4IA3kegj6NhEz2pnsEJgjXoC/QCIuA7PKWAkjOIVrddYxK2wf29mgI
         JGtACVBHYbwJyl8O59NyTzrNRjQEZJlQRxulfod0Oblycq3JeeLbmu/9cSfps4HnziC7
         HSKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760101560; x=1760706360;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L0+BpS6t2Yv2H52sIT/8sevjMsANiLM0BQhq3pAOHw4=;
        b=mMAkIaujkxX+7n+eFuItuFuYm/nGwjKV/al+KBsXS13GuRDDXbkNRdgTOzMpufA0xR
         p4ijwaiA1UPFr+ic6jpHhjnCMavx4Zco+edylDgafO9nLe/5qBGulQ705D8/vtkQ5B2b
         7IYlVtoSDyoWBek8lsbklyRQBPux5GqMDDRNqSVAEv+upvUFVJhmNioEVzr0JK4zD3tW
         gAtwgUUQJK4xEMge+VQSeEvg4AFznxg9hRwUjUPmH68m+pzwTU8Ffntir8E8DkQMpJ6c
         81cGJNb+2frdNTNvbzPDM92q187+jfLzvOfAvOZ70jr07jOauBNVkorf5N7VVz0QjvJH
         YZeA==
X-Gm-Message-State: AOJu0YwlftDK/LnXfzmHikdPDoYxQ5LHttYZHI+sz/8qpcMkyg19M4py
	LoBFBZSiDztCKasGCWL9EYO/CuI6xXYSR9jyCP5aw+Rl+fTov4B5NbqagQjpA8VmpXQ=
X-Gm-Gg: ASbGncu7X54i9OwrUIBMFLJLc/cuu13eOofJAdeVGvx7+t2yWEsw6FOHwyEGKg9jEGN
	uLagpXEXw+QanZkz+mxXt+pPMDa8P0fC7XiGnwXcZX+E6sODqzrlqF4Jcb9hi92wkM5vc/UYKQ9
	bhqy5wK0wClfURlGnJsrKtUdtEARsniNmHwh6uS+EE2mAz1uWqZD8edfJGHoRXZxlTRjiF5+PCz
	nnqRUorcq2RxVdLK+/W3bpqlCxX2JqkOHsLW7+vH5iqfXdKAg2OW/V9JNjhma5LQEqPetVF9q+N
	NUObUbrL1EADAsO+5MWCCjWzObbTHQj46TnDCPOCX5Y5PB9seMrxclUE/cTlQuUauWIf522a12g
	mG7Wo5JXIDrNs/bOF0miKy2p76Bs83XhfVbkQxTA3P5Ble5I=
X-Google-Smtp-Source: AGHT+IF2lHtElB4A7ycj70A6xTBBy/InZDxVEBhTGcnc7yiABS5UujGmiFlUfbSui2CokaCbt23X+A==
X-Received: by 2002:a05:6214:4012:b0:879:b99b:993c with SMTP id 6a1803df08f44-87b21065d5dmr179590206d6.18.1760101559663;
        Fri, 10 Oct 2025 06:05:59 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:ebd3::c41? ([2606:6d00:17:ebd3::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87bc347969fsm15890436d6.18.2025.10.10.06.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 06:05:58 -0700 (PDT)
Message-ID: <c6f273d57b01c199a6b8e1439d44de20f1e12dd1.camel@ndufresne.ca>
Subject: Re: [PATCH 00/16] media: platform: rga: Add RGA3 support
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sven =?ISO-8859-1?Q?P=FCschel?= <s.pueschel@pengutronix.de>, Jacob Chen
	 <jacob-chen@iotwrt.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	 <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kernel@pengutronix.de
Date: Fri, 10 Oct 2025 09:05:56 -0400
In-Reply-To: <a97780fa-5261-44ed-b54d-fd699d3cbb82@pengutronix.de>
References: <20251007-spu-rga3-v1-0-36ad85570402@pengutronix.de>
	 <3c62e3c837d534ef5bc21a95ec1dc408c38cb8a0.camel@ndufresne.ca>
	 <a97780fa-5261-44ed-b54d-fd699d3cbb82@pengutronix.de>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-WQ8w5DEroCRU/pMH4BKw"
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-WQ8w5DEroCRU/pMH4BKw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sven,

Le vendredi 10 octobre 2025 =C3=A0 10:33 +0200, Sven P=C3=BCschel a =C3=A9c=
rit=C2=A0:
> Hi Nicolas,
>=20
> On 10/7/25 8:06 PM, Nicolas Dufresne wrote:
> > Hi,
> >=20
> > Le mardi 07 octobre 2025 =C3=A0 10:31 +0200, Sven P=C3=BCschel a =C3=A9=
crit=C2=A0:
> > > This series adds support for the Raster Graphic Acceleration 3 (RGA3)
> > > peripheral, which is included in the RK3588 SoC. Unlike the RGA2 it
> > > can use the existing rockchip-iommu-v2 driver to handle iommu mapping=
s.
> > > Also the RK3588 contains two independent RGA3 cores.
> > Thanks for working on this.
> >=20
> > > Only scaling and format conversions between common 8bit RGB/YUV forma=
ts
> > > are implemented. Also the color space conversion is fixed to BT601F.
> > > This already allows a practical usage of the RGA3.
> > This seems quite limiting, can we expect an update on this, can't be th=
at hard
> > to fully implement.
>=20
> Sorry, but currently there is no need to have a fully featured=20
> implementation from our side. As the datasheet mentions that the RGA3=20
> should do 4 or 2 pixel/cycle depending on the operation

Upon first light review, its only the colorspace (and sub-paramters) aspect=
 that
I believe should be done properly before merging. Proper SELECTION
implementation is on the edge, I'm more on the side of this should be cover=
ed
then not to be usable in the wild.

Overall, this is the sad part of adding drivers that don't have a correspon=
ding
spec to define the rules.

>=20
> > > This was tested on a Radxa Rock 5T. With the increased clock speeds i=
n
> > > the devicetree around 160 fps were measured when scaling and converti=
ng
> > This is quite vague, I've checked the patch and you didn't extend eithe=
r there.
> > Is that an overclock or was it miss-configured ? Does RK implement a de=
vfreq ?
> > Should that be moved with a voltage adjustement ? Is there any thermal =
nearby we
> > should monitor ?
>=20
> This is mainly the result of a very low performance in the initial=20
> testing. We were quite disappointed looking at 30 fps output. The=20
> datasheet mentions the core should do 2 or 4 pixel/cycle, so we looked=
=20
> if the clock speed could be increased. The TRM Part1 mentions that the=
=20
> RGA3 clock uses a default divider of 2, so I've tweaked the dtsi to=20
> avoid the clock divider and run it on the fastest clock.
>=20
> But this tweaking only increased the frame rate to around 36fps. After=
=20
> some brainstorming and testing we found the culprit being the=20
> RGA3_WR_SW_OUTSTANDING_MAX value in the command. With this value maxed=
=20
> out and without the clock tweaks I've got around 80fps. As the clock=20
> increase resulted in the expected doubling of the fps and my few tests=
=20
> worked, I've included it in the patch set.
>=20
> I haven't done any stress testing and don't mind to remove the clock=20
> speed adjustments from the dtsi.

Thanks for the input, so yes, in V2 you should stay with the clock rate use=
d by
Rockchip in their BSP, as a safe measure. If there is useful gain needed la=
ter
for anyone use case, we can work on the clocking in isolation and find the =
best
approach without risking wearing out the HW faster then needed.

>=20
> > > from RGBA 480x360 to NV12 3840x2160. Without the clock speed scaling =
a
> > > default clock division factor of 2 is used and only around 80 fps are
> > > reached with one core. The v4l2-compliance tests only complain about
> > > the already failing colorspace propagation:
> > Did you do any more format testing to validation all supported combinat=
ions ?
> > This is a tool [0] you can use to test this using GStreamer and how to =
use it
> > [1].
>=20
> Thanks for the link!
>=20
> I've did some simple format conversion tests with a static test pattern.
>=20
> The tests mainly converts any combination of RGB/YUV formats (hope I=20
> didn't miss anything) to each other. Then I convert it back to rgba with=
=20
> gstreamer and compare it's hash.
>=20
> For scaling I've just tested one upscale, downscale and scale to a non=
=20
> aligned width/height.

Thanks for the feedback.

>=20
> > [0]https://gitlab.collabora.com/mediatek/aiot/lava-test-definitions/-/t=
ree/main/avvideocompare?ref_type=3Dheads
> > [1]https://gitlab.collabora.com/mediatek/aiot/linux/-/blob/mediatek-nex=
t/.gitlab-ci.yml?ref_type=3Dheads#L282
> > > =C2=A0=C2=A0 v4l2-compliance 1.28.1, 64 bits, 64-bit time_t
> > > =C2=A0=C2=A0 ...
> > > =C2=A0=C2=A0=C2=A0		fail: v4l2-test-formats.cpp(923): fmt_cap.g_color=
space() !=3D
> > > col
> > > =C2=A0=C2=A0=C2=A0	test VIDIOC_S_FMT: FAIL
> > > =C2=A0=C2=A0 ...
> > > =C2=A0=C2=A0 Total for rockchip-rga device /dev/video0: 47, Succeeded=
: 46, Failed: 1,
> > > Warnings: 0
> > >=20
> > > =C2=A0=C2=A0 v4l2-compliance 1.28.1, 64 bits, 64-bit time_t
> > > =C2=A0=C2=A0 ...
> > > =C2=A0=C2=A0=C2=A0		fail: v4l2-test-formats.cpp(923): fmt_cap.g_color=
space() !=3D
> > > col
> > > =C2=A0=C2=A0=C2=A0	test VIDIOC_S_FMT: FAIL
> > > =C2=A0=C2=A0 ...
> > > =C2=A0=C2=A0 Total for rockchip-rga device /dev/video1: 47, Succeeded=
: 46, Failed: 1,
> > > Warnings: 0
> > >=20
> > > =C2=A0=C2=A0 v4l2-compliance 1.28.1, 64 bits, 64-bit time_t
> > > =C2=A0=C2=A0 ...
> > > =C2=A0=C2=A0=C2=A0		fail: v4l2-test-formats.cpp(923): fmt_cap.g_color=
space() !=3D
> > > col
> > > =C2=A0=C2=A0=C2=A0	test VIDIOC_S_FMT: FAIL
> > > =C2=A0=C2=A0 ...
> > > =C2=A0=C2=A0 Total for rockchip-rga device /dev/video2: 47, Succeeded=
: 46, Failed: 1,
> > > Warnings: 0
> > >=20
> > > Each RGA core is a separate /dev/video device. To distinguish the RGA=
2
> > > core from the RGA3 cores the Card type is set accordingly. Combining =
all
> > > cores into a single device and scheduling tasks to the best core migh=
t
> > > be a future improvement, if it is desired by upstream to handle the
> > > scheduling and selection in kernel space.
> > It took me some time to understand why you spoke about multicore here. =
You
> > forgot to say here that you add RGA3 into RGA2 driver. Some information=
 on why
> > you went that path instead of a separate driver.
>=20
> Mostly as I've started by using the rga driver as a basis and just=20
> adjusted the command stream and register values to the RGA3. I was=20
> unsure, if I should create a separate driver.
> As it didn't seem unfeasible to have the existing driver handle both=20
> units, I've decided to add it to the existing driver to avoid code=20
> duplication.
>=20
> But looking at your comments about the wrong announcement of e.g. color=
=20
> space conversion, I now think that a new driver is probably better to=20
> avoid adding too much of the differences to the struct.

I've discussed this with other devs, there is clearly no single opinion abo=
ut
it. But some good argument came in in favour of your approach. Code duplica=
tion
is one (in fact, there is a lot of boiler plate code in all V4L2 drivers), =
but
the main thing is that it brings some maintenance to this close to abandone=
d
driver.

Though it means in v2, you have to push a little bit harder so the format, =
frame
size, try_format is properly adapted per hardware variants. We try and keep=
 this
information as static as possible, using constant C structure to describe i=
t.

>=20
> > =C2=A0From high level view, I don't think its a good idea to multi-plex=
 over
> > heterogeneous core. They may not even produce the exact same pixels for=
 the same
> > operation. They also don't share the same MMU, and at first glance, the=
 use of
> > rkiommu in RGA3 means it can no longer handle CPU cache (though I don't=
 know if
> > this is implemented/supported in upstream RGA2 driver).
>=20
> Thanks for the insight. This gives me another reason to create a=20
> separate driver. I'll probably also look into multiplexing the 2 RGA3=20
> cores to only expose one RGA3 video device to userspace (the current=20
> implementation exposes both cores individually to the userspace)

So no, you might want to keep it like this. I didn't understood when I read=
 this
cover later that there it wasn't just about the RGA2 and the RGA3 core, but=
 that
there is truly 2 RGA3 cores. For now, for the two RGA3 cores, you should mi=
mic
what Sebastian did for the multiple Hantro G1 cores [0]. If you expose each
cores as its own device, removing it later will possibly break existing dri=
vers
and will prevent implementing an in-kernel fair scheduling later.

Detlev is already prototyping scheduling of the two rockchip decoder cores,=
 and
hopefully that should come with helper in v4l2-m2m to register cores so you=
 can
easily schedule them. Note that both have similar challenges around the iom=
mu,
since the dma integration does not seem (someone correct me if I'm wrong) t=
o
already support a device driver with two or more iommus. We also have to de=
cide
if we want the cores in complete isolation per operation or just map everyt=
hing
in all iommus.

[0] https://www.spinics.net/lists//devicetree/msg708135.html

cheers,
Nicolas

>=20
> Sincerely
>=20
> =C2=A0=C2=A0 =C2=A0 Sven
>=20
> > > Patch 1-2 are general cleanups
> > > Patch 3-12 prepare the rga driver for the RGA3
> > > Patch 13 documments the RGA3 compatible value
> > > Patch 14 adds the RGA3 cores to the rk3588 dtsi
> > > Patch 15 increases the RGA3 core clock speeds
> > > Patch 16 adds RGA3 support to the rga driver
> > >=20
> > > Signed-off-by: Sven P=C3=BCschel<s.pueschel@pengutronix.de>
> > > ---
> > > Sven P=C3=BCschel (16):
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: rockchip: rga: use clk_bu=
lk api
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: rockchip: rga: use stride=
 for offset calculation
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: rockchip: rga: align stri=
de to 16 bytes
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: rockchip: rga: move hw sp=
ecific parts to a dedicated struct
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: rockchip: rga: use card t=
ype to specify rga type
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: rockchip: rga: change off=
set to dma_addresses
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: rockchip: rga: support ex=
ternal iommus
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: rockchip: rga: remove siz=
e from rga_frame
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: rockchip: rga: remove str=
ide from rga_frame
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: rockchip: rga: move rga_f=
mt to rga-hw.h
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: rockchip: rga: add iommu =
restore function
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: rockchip: rga: handle err=
or interrupt
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: dt-bindings: media: rockc=
hip-rga: add rockchip,rk3588-rga3
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arm64: dts: rockchip: add rga3 d=
t nodes
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arm64: dts: rockchip: increase r=
ga3 clock speed
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: rockchip: rga: add rga3 s=
upport
> > >=20
> > > =C2=A0=C2=A0.../devicetree/bindings/media/rockchip-rga.yaml=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > > =C2=A0=C2=A0arch/arm64/boot/dts/rockchip/rk3588-base.dtsi=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 50 +++
> > > =C2=A0=C2=A0drivers/media/platform/rockchip/rga/Makefile=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
> > > =C2=A0=C2=A0drivers/media/platform/rockchip/rga/rga-buf.c=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 78 ++--
> > > =C2=A0=C2=A0drivers/media/platform/rockchip/rga/rga-hw.c=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 356 ++++++++++++---
> > > =C2=A0=C2=A0drivers/media/platform/rockchip/rga/rga-hw.h=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 15 +-
> > > =C2=A0=C2=A0drivers/media/platform/rockchip/rga/rga.c=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 404 ++++++-----------
> > > =C2=A0=C2=A0drivers/media/platform/rockchip/rga/rga.h=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 74 ++--
> > > =C2=A0=C2=A0drivers/media/platform/rockchip/rga/rga3-hw.c=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 490
> > > +++++++++++++++++++++
> > > =C2=A0=C2=A0drivers/media/platform/rockchip/rga/rga3-hw.h=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 186 ++++++++
> > > =C2=A0=C2=A010 files changed, 1246 insertions(+), 410 deletions(-)
> > > ---
> > > base-commit: afb100a5ea7a13d7e6937dcd3b36b19dc6cc9328
> > > change-id: 20251001-spu-rga3-8a00e018b120
> > >=20
> > > Best regards,

--=-WQ8w5DEroCRU/pMH4BKw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaOkEtAAKCRDZQZRRKWBy
9DsdAQC+3PU8SGB7DHNotcnIhqVdUJwRCi8TYtn3JG4pK4zxbgEAwYNJYlKVnr2p
+GUqbXys42tcIcmmZ/59Av85u82U/wQ=
=wvxU
-----END PGP SIGNATURE-----

--=-WQ8w5DEroCRU/pMH4BKw--

