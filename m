Return-Path: <linux-media+bounces-31844-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED27AAAC360
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 14:07:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 057C03AF1D7
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 12:07:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4B2727EC6C;
	Tue,  6 May 2025 12:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eTNCEPnO"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30CDF27E1D6
	for <linux-media@vger.kernel.org>; Tue,  6 May 2025 12:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746533242; cv=none; b=mqtdqq+vPq8lg49ddTtHkI4ql4VYeG199IQMgthrrrdSdDYVJBEdYKFnlnUfoFt6IOWzLyScCq9pFCApOkJbN/KCvv7QTThA5MPtPNL3dX2uVqlhpk0sM55cBnyMQCa+GFT0MQiYSSYjWhWmGSd1/m81sWr/NWmUxfSq+hbkdzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746533242; c=relaxed/simple;
	bh=NAtczBbfdEI39uSGjgTi0TqJ6o57yJweS8F2R1W1S7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iwMcCrcWnzkOTvH4VHjQ/YpWEdxfZx4+0suoP+uwBCbin3Xr+GusgU6FsoiH0r/gYj2VV4AXJExDINdVI6DJCFGjzcAs8h27BvYypiQY4uoxR400sqUzQ8jtvTBfi716ekULy5s6sYqhSfR/NLsV/UgsLufSEM+Pkfnp3aGKjSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eTNCEPnO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746533239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/4rYevTGlaWNrKX2qjPSRNSsrCUH7okIggINisIwHbs=;
	b=eTNCEPnOuEeo0q9GG85TBUMTd0hOcr5sZG96GEJx3ZLoNJ0NGcV5F3slaJ+y26kQ3ch+39
	/UHK5Dcx7MALSTNDEEiOaHxSpq4jWK2IJTllu1y0N0M3dtV27figQz2dW1d0OqmhY2wJOS
	vOHrHcfQq40sqUwVIcbWZtDE7Ji2geY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-T3kOcc08M2WvnHrQWcT8Ow-1; Tue, 06 May 2025 08:07:17 -0400
X-MC-Unique: T3kOcc08M2WvnHrQWcT8Ow-1
X-Mimecast-MFC-AGG-ID: T3kOcc08M2WvnHrQWcT8Ow_1746533236
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3912a0439afso1601868f8f.3
        for <linux-media@vger.kernel.org>; Tue, 06 May 2025 05:07:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746533236; x=1747138036;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/4rYevTGlaWNrKX2qjPSRNSsrCUH7okIggINisIwHbs=;
        b=Qs9Mg/woK6+pyVFUOE/gRd3kJGwFUmfknSLT/nFzPB9lDwuraNV7sW/9e9+YLR2Md6
         4Qn7078PmPCinZ77dJ0yyD3tlQ6GQQpW2M7S5G51pXtQN31gWp0deenJSr5tYJ0/YCdG
         ioW20ECBPHrTbS3ROyOW5jAckTZwmcEuzS7gDpqfrCEH3HWxpAsjK9pbM2Xg88Mghuh7
         SO/jXZAIPoAtdLpNQL1W9WKsdu6PD/HdldkeY0siOUyLDgWSRUX6WlOZ0XJnLQH/7naI
         QQ1dHHrfpgTXHOc0oJu64Lj17mfu2zvpcCdivEErgBjpyAS7TOPDRhb1EkawHbJvkJui
         2Qng==
X-Forwarded-Encrypted: i=1; AJvYcCXgDZ6pEOYyKVy7JiMXwBf4oHq6zuQSRGqx4+kCLO6e4aP4F0t3uz9FYje3V6HJ6i05sxjke6YfGv4t8g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKbARxRILM2p5/pqPzHwsoNC64jVtnKCYS3tugw+WjlAqXNk/+
	QQKS3SkT1sjVexLhM2ZExzIQoqIrinwQtgfs/f0O2Uzts5hbsfkrQn+Cv1ZhBK1b8npRWbqCZE5
	DHnDnuJ36d+gcYW3WuWRK0TQOXH4RojCBGBOE6B0g7PALA5kKmlPfpCHd6xma
X-Gm-Gg: ASbGncsLHwM7OzIXUUSW1NZVhal5c6XxvfXeOke/R5MA0FiSF4Dazg0Tl64vpTv53wc
	cyMwXJv2IKpHFSVFiMmcTjywfi9Sp8U7J9Qsm8FsOc/Hbzqwbk0lHIKmv8ZiuXGnSlvUmGDYMfW
	p/v/igmWcmBkYtgp2pyxMFO4Wuz9ZsZehCjyfAYwyX0fKRFpvS8HDV2SaaXo2Hr1sNcKZ6p8uLw
	Rb78iGn3wjEMIXXqJXDc5fjbVN3U2PqzUPJJjs9a/LWHn9oEHsQmBQAhebT++I=
X-Received: by 2002:a05:6000:2401:b0:399:7f44:5c74 with SMTP id ffacd0b85a97d-3a0ac3ea5c1mr2182766f8f.55.1746533236354;
        Tue, 06 May 2025 05:07:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQKFG3PgizDEvnx+76u18lQuyVbMis3YooBIijRKAokEMXnNuC615qp0Cd4mHMq/cEabyRLw==
X-Received: by 2002:a05:6000:2401:b0:399:7f44:5c74 with SMTP id ffacd0b85a97d-3a0ac3ea5c1mr2182729f8f.55.1746533235831;
        Tue, 06 May 2025 05:07:15 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b17096sm13900740f8f.96.2025.05.06.05.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 05:07:15 -0700 (PDT)
Date: Tue, 6 May 2025 14:07:14 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	linux-media@vger.kernel.org
Subject: Re: upstream unicam not returning any buffer
Message-ID: <20250506-cryptic-dove-from-atlantis-3addf4@houat>
References: <20250424-exuberant-carp-from-pluto-cce66c@houat>
 <CAPY8ntCzNckv8j0-yw-KmhS-CzXuMus6Q37XR-JS_xJD8=Qxeg@mail.gmail.com>
 <20250425-zealous-malachite-boar-f5384e@houat>
 <CAPY8ntAFCT4_JquvQ4C8Ov6Te8Hoxm36MJ6-ftRAM7Kxa5wZxA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="iaptmjdffckxklln"
Content-Disposition: inline
In-Reply-To: <CAPY8ntAFCT4_JquvQ4C8Ov6Te8Hoxm36MJ6-ftRAM7Kxa5wZxA@mail.gmail.com>


--iaptmjdffckxklln
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: upstream unicam not returning any buffer
MIME-Version: 1.0

On Wed, Apr 30, 2025 at 12:09:51PM +0100, Dave Stevenson wrote:
> Hi Maxime
>=20
> On Fri, 25 Apr 2025 at 08:05, Maxime Ripard <mripard@redhat.com> wrote:
> >
> > Hi Dave,
> >
> > On Thu, Apr 24, 2025 at 06:12:14PM +0100, Dave Stevenson wrote:
> > > Hi Maxime
> > >
> > > On Thu, 24 Apr 2025 at 15:58, 'Maxime Ripard' via kernel-list
> > > <kernel-list@raspberrypi.com> wrote:
> > > >
> > > > Hi,
> > > >
> > > > I've been trying to port a v4l2 application from the downstream uni=
cam
> > > > driver (with the 6.6 kernel) to upstream (6.13.11) kernel.
> > > >
> > > > While the application seemed to work ok with the downstream driver,=
 the
> > > > same code will never get any buffer from the upstream unicode drive=
r.
> > > > Either dqbuf will block forever (if it's blocking), or never return=
 a
> > > > buffer (if it's non-blocking).
> > > >
> > > > The media-controller topology after the application configured it i=
s:
> > > >
> > > > Media controller API version 6.13.11
> > > >
> > > > Media device information
> > > > ------------------------
> > > > driver          unicam
> > > > model           unicam
> > > > serial
> > > > bus info        platform:fe801000.csi
> > > > hw revision     0x0
> > > > driver version  6.13.11
> > > >
> > > > Device topology
> > > > - entity 1: unicam (3 pads, 3 links, 0 routes)
> > > >             type V4L2 subdev subtype Unknown flags 0
> > > >             device node name /dev/v4l-subdev0
> > > >         pad0: SINK
> > > >                 [stream:0 fmt:RGB888_1X24/1280x720 field:none color=
space:srgb xfer:srgb ycbcr:601 quantization:lim-range]
> > > >                 <- "tc358743 5-000f":0 [ENABLED,IMMUTABLE]
> > > >         pad1: SOURCE
> > > >                 [stream:0 fmt:RGB888_1X24/1280x720 field:none color=
space:srgb xfer:srgb ycbcr:601 quantization:lim-range]
> > > >                 -> "unicam-image":0 [ENABLED,IMMUTABLE]
> > > >         pad2: SOURCE
> > > >                 -> "unicam-embedded":0 [ENABLED,IMMUTABLE]
> > > >
> > > > - entity 5: tc358743 5-000f (1 pad, 1 link, 0 routes)
> > > >             type V4L2 subdev subtype Unknown flags 0
> > > >             device node name /dev/v4l-subdev1
> > > >         pad0: SOURCE
> > > >                 [stream:0 fmt:RGB888_1X24/1280x720 field:none color=
space:srgb]
> > > >                 [dv.caps:BT.656/1120 min:640x350@13000000 max:1920x=
1200@165000000 stds:CEA-861,DMT,CVT,GTF caps:progressive,reduced-blanking,c=
ustom]
> > > >                 [dv.detect:BT.656/1120 1280x720p60 (1650x750) stds:=
 flags:]
> > > >                 [dv.current:BT.656/1120 1280x720p60 (1650x750) stds=
: flags:]
> > > >                 -> "unicam":0 [ENABLED,IMMUTABLE]
> > > >
> > > > - entity 9: unicam-image (1 pad, 1 link)
> > > >             type Node subtype V4L flags 1
> > > >             device node name /dev/video0
> > > >         pad0: SINK
> > > >                 <- "unicam":1 [ENABLED,IMMUTABLE]
> > > >
> > > > - entity 15: unicam-embedded (1 pad, 1 link)
> > > >              type Node subtype V4L flags 0
> > > >              device node name /dev/video1
> > > >         pad0: SINK
> > > >                 <- "unicam":2 [ENABLED,IMMUTABLE]
> > > >
> > > > The interrupt count in /proc/interrupts increases with a somewhat
> > > > reasonable rate, so it looks like I'm getting interrupts.
> > > >
> > > > Enabling the debug output of the unicam driver gives the following =
logs:
> > > >
> > > > [ 2522.686656] unicam fe801000.csi: Starting stream on image device
> > > > [ 2522.687230] unicam fe801000.csi: Running with 2 data lanes, node=
s 1
> > > > [ 2522.847079] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BE, se=
quence 0, lines done 0
> > > > [ 2522.847105] unicam fe801000.csi: Scheduling dummy buffer for nod=
e 0
> > > > [ 2522.914545] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BC, se=
quence 0, lines done 819
> > > > [ 2522.914569] unicam fe801000.csi: Scheduling dummy buffer for nod=
e 0
> > > > [ 2522.947477] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BE, se=
quence 0, lines done 1638
> > > > [ 2522.947499] unicam fe801000.csi: Scheduling dummy buffer for nod=
e 0
> > > > [ 2522.964145] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BC, se=
quence 0, lines done 2457
> > > > [ 2522.964167] unicam fe801000.csi: Scheduling dummy buffer for nod=
e 0
> > > > [ 2522.997077] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BE, se=
quence 0, lines done 3276
> > > > [ 2522.997100] unicam fe801000.csi: Scheduling dummy buffer for nod=
e 0
> > > > [ 2523.013744] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BC, se=
quence 0, lines done 1059226
> > > > [ 2523.013764] unicam fe801000.csi: Scheduling dummy buffer for nod=
e 0
> > > > [ 2523.064544] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BE, se=
quence 0, lines done 1059226
> > > > [ 2523.064566] unicam fe801000.csi: Scheduling dummy buffer for nod=
e 0
> > > > [ 2523.081210] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BC, se=
quence 0, lines done 1059226
> > > > [ 2523.081230] unicam fe801000.csi: Scheduling dummy buffer for nod=
e 0
> > > > [ 2523.130810] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BE, se=
quence 0, lines done 1059226
> > > > [ 2523.130833] unicam fe801000.csi: Scheduling dummy buffer for nod=
e 0
> > > > [ 2523.247880] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BC, se=
quence 0, lines done 1059226
> > > > [ 2523.247902] unicam fe801000.csi: Scheduling dummy buffer for nod=
e 0
> > > >
> > > > Do you know what could be going on? I tried to compare the upstream=
 and
> > > > downstream unicam drivers, and the interrupt handler seems to be
> > > > slightly different, but I'm afraid I'm a bit out of my depth there.
> > >
> > > I must admit to not having run the upstream driver in anger.
> > >
> > > Your interrupt traces are odd for at least two reasons.
> > >
> > > ISTA always being 0x1 means only frame start events. No frame end
> > > (0x2) or line count interrupts (0x4).
> > > You should be getting 4 line count interrupts every frame or every 128
> > > lines if greater, and frame end at the end of each frame. Your
> > > interrupts are every 16.6ms (ish), which would follow with being FS
> > > only.
> > >
> > > "lines done" is incrementing by more than the 720 lines expected for
> > > the configured resolution. I suspect that it has updated the write
> > > address to the new buffer, and they just happen to be contiguous (at
> > > least to start with).
> > > Downstream has code that (incorrectly) returns the buffer to the
> > > internal queue if we get repeated FS events, but it probably wants to
> > > return them to userspace with VB2_BUF_STATE_ERROR.
> > >
> > > I'll try to find a few minutes to battle the upstream driver with
> > > tc358743 and see what I get.
> >
> > I guess if it was RGB, it could be a vsync polarity issue then and
> > probably a DT issue, but I can't recall something similar for CSI.
> >
> > The DT overlay I've been using is:
> >
> > #include <dt-bindings/media/video-interfaces.h>
> >
> > /dts-v1/;
> > /plugin/;
> >
> > &csi1 {
> >         status =3D "okay";
> >
> >         port {
> >                 csi1_ep: endpoint {
> >                         remote-endpoint =3D <&tc358743_ep>;
> >                         bus-type =3D <MEDIA_BUS_TYPE_CSI2_DPHY>;
> >                         clock-noncontinuous;
> >                         data-lanes =3D <1 2>;
> >                 };
> >         };
> > };
> >
> > &i2c0 {
> >         status =3D "okay";
> > };
> >
> > &i2c0mux {
> >         status =3D "okay";
> > };
> >
> > &i2c0_1 {
> >         #address-cells =3D <1>;
> >         #size-cells =3D <0>;
> >         status =3D "okay";
> >
> >         tc358743@f {
> >                 compatible =3D "toshiba,tc358743";
> >                 reg =3D <0x0f>;
> >                 clock-names =3D "refclk";
> >                 clocks =3D <&clk_27MHz>;
> >
> >                 port {
> >                         tc358743_ep: endpoint {
> >                                 remote-endpoint =3D <&csi1_ep>;
> >                                 clock-noncontinuous;
> >                                 clock-lanes =3D <0>;
> >                                 data-lanes =3D <1 2>;
> >                                 link-frequencies =3D /bits/ 64 <4860000=
00>;
>=20
> As just relayed to you via IM, this looks to be the problem.
> The mainline driver for tc358743 only supports a link freq of 297MHz,
> and will log "untested bps per lane: X bps" if you ask for something
> different. The PLL will be set for 486MHz, but the PHY settings remain
> those for 297MHz.
>=20
> The Raspberry Pi kernel has a couple of patches that add support for
> 486MHz / 972Mbit/s as that is then sufficient bandwidth to get 1080P30
> RGB or 1080P50 UYVY over 2 data lanes. I did try upstreaming them ages
> back, but memory says it sank in needing to verify FIFO fill level
> register settings, which is nigh impossible to prove with the data
> that Toshiba provide.
>=20
> Quick calcs say 2 lanes @ 297MHz / 594Mbit/s is enough for 720p60
> UYVY, but won't allow 720p60 RGB.
> 4 lanes @297MHz can do 1080p60 UYVY, but not RGB.

You're right, thanks for the pointer to the patches in the RPi repo to
enable the higher data rates, that was the culprit.

Should we send them upstream?

Thanks!
Maxime

--iaptmjdffckxklln
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaBn7cgAKCRAnX84Zoj2+
dnZxAYCZJjZS1ESL+OtbLBAnezRmb2gDYonwjdwOvPqZ0ebAXrblGpy+GcWFc8z4
Q3zrMmkBgJqg0y4is9GamnUOAqSOQStk3WYKQZICx3kvIhUMkCo5fI2JnTZd4jiX
MrZmlMnvLA==
=EJ/l
-----END PGP SIGNATURE-----

--iaptmjdffckxklln--


