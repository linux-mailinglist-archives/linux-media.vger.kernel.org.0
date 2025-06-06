Return-Path: <linux-media+bounces-34253-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A3137AD036E
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 15:47:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 05616189772B
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 13:48:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B10C2288C10;
	Fri,  6 Jun 2025 13:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="G0ao54hg"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE406284674
	for <linux-media@vger.kernel.org>; Fri,  6 Jun 2025 13:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749217669; cv=none; b=thTCbAObEgsWoglrb6hm+kfomURoWFhzDy4zLVG91I1IBP7NYNtGfW5jw4YEKtQyI3bsZ6xjnKXKwiOY1CzjfpRYzB+xmGPMrHLxDTpkAzsDkODQOuk/+SJYklXoednVXNeikWOCffeorHUEhSZ/SjG63aVwX6esKK4+TsQBuLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749217669; c=relaxed/simple;
	bh=n+FNYEbzR35viMC/IaZNq7g151UcXTEGo3Iq7/8paWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jNe1XTk2Wr1jhLeufhQ13VGxBRNjdY3NZyPnODdW/V8MR4t21JIeFcWdb4Z5JSJ6uwi7k1x8g+oQXI8GYEdNBzjzCRgWMyQTZRA5ymhGxIBV8JrattfDj7ll5HtTPQsSmo8BmY+Uo7Ftei31TaJeHxhUNJAwgwihwN+LApczMfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=G0ao54hg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749217665;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4LV0Di0ymHFU2o+dBnqxnQqCoQgL9ZWmnj62OdEeDss=;
	b=G0ao54hgIXBw/vtiZsLAlilCvPnhYSj/OU+TaLiPvsrL/30g3HYFIOyWkS3zIzdTLygV40
	YvdAc3EPgo3FdS30zCX/c3jY6sGfMniIb+X9fRCpCMVcvprvassvCP4OCCZg5iYHKBUlVs
	7B9gUiI2Z3mEjm8GY0/RSzCR4oO6Ez0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-161-TY8UIggcNbCvCzX2UksGeg-1; Fri, 06 Jun 2025 09:47:44 -0400
X-MC-Unique: TY8UIggcNbCvCzX2UksGeg-1
X-Mimecast-MFC-AGG-ID: TY8UIggcNbCvCzX2UksGeg_1749217663
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-450d021b9b1so9440595e9.0
        for <linux-media@vger.kernel.org>; Fri, 06 Jun 2025 06:47:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749217663; x=1749822463;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4LV0Di0ymHFU2o+dBnqxnQqCoQgL9ZWmnj62OdEeDss=;
        b=kyTR9ulJNxigSaMdbSWpnAqjNn3/4Ss2vODN9CrvlWvFbkpc+VohdA4IQ1TGaHME6n
         AvZvgW6+etRnq9ggvtI29KpAbQFlVhI13pikGuPuqe0JupdqOtXIeWAp21amWTcp9rp2
         FrsHreChOBLuAjlOTsa3YVuE+M7aCV4Ebxb4uSOP8yj/HZgdj6vA0FhCYD+4myOBR0r1
         JVeEKBVRno5tvCMS2Q+Ln9jrgD19VDfgEOBld5jKqk2JgUNcWn+sdWHPsp2sJFYEZR5E
         Flry1YpEpUc4uOZpmmY0pr8oWbuMFodtFKlWH49VmQC3XfC0SffKGSgGoGejq+QztG0Y
         fvfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVC4qnlhOW6uBSUcqh75sT+uXYtus0LgKwDkqzEyS2A+KGOklFppj77sfmVHvbLD0+4467kJS2m2GhtLg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBItL5GHRCjn322X0pcdvL6+WQ4zsRmpYS9SmBERWRv78RasEA
	W+LKpEVIqPgPNj+4VynTgYWiEB3+TGLvUQpNr0vJtHYJ4f5VGTZRP/i0t1h25RUcExSFgHHPpBq
	RgfQiVmYAjjG7EQxfvVFtZFsGhv8rD5ySpYuvIkyDNZ7aN0qWsrI5DtEHxeJXgAGl
X-Gm-Gg: ASbGncsudORqp/P3WdF4/Ui/sYuoAsVQDiiep1mgVnoTAXbGWT3h7aPJ0isAiu6edqU
	kwNgEub2qVSATO0FaUtL8qTPmrR5cLev4JnaOlFHU2K3GHLIpdv3otviovBLxvXnlLrE263fV+F
	fUgk3XBg32qgS0YeKMEmIkWQwpPVuVQn4XlW22hn1fZZ7eBT7MLwl/RUzWT4feeWzjEjwgTc7kk
	H/9tXUzsNXzOrea/kgS57+MbGQaOIynEquqF2HQ5zP0aZeNjieRJTiKX4wStpygMcLNx4V/dA==
X-Received: by 2002:a05:6000:144d:b0:3a4:fc08:8faf with SMTP id ffacd0b85a97d-3a531cb2c43mr2614041f8f.28.1749217662783;
        Fri, 06 Jun 2025 06:47:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpVG7AJzWdEMSFdjCdYQUzj0rDuabm70iBoDOpRkGtPO2WjtGvAH/K7D6ktxW0l0AsDD6/8w==
X-Received: by 2002:a05:6000:144d:b0:3a4:fc08:8faf with SMTP id ffacd0b85a97d-3a531cb2c43mr2614019f8f.28.1749217662264;
        Fri, 06 Jun 2025 06:47:42 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244d10asm1954975f8f.67.2025.06.06.06.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 06:47:41 -0700 (PDT)
Date: Fri, 6 Jun 2025 15:47:41 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	linux-media@vger.kernel.org
Subject: Re: upstream unicam not returning any buffer
Message-ID: <20250606-roaring-blue-bat-a8b2aa@houat>
References: <20250424-exuberant-carp-from-pluto-cce66c@houat>
 <CAPY8ntCzNckv8j0-yw-KmhS-CzXuMus6Q37XR-JS_xJD8=Qxeg@mail.gmail.com>
 <20250425-zealous-malachite-boar-f5384e@houat>
 <CAPY8ntAFCT4_JquvQ4C8Ov6Te8Hoxm36MJ6-ftRAM7Kxa5wZxA@mail.gmail.com>
 <20250506-cryptic-dove-from-atlantis-3addf4@houat>
 <CAPY8ntD6i1eGxoFxmAMcczAgxgd0wWQLZ+pM4W1atXbci-i-OA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="facms4yavuz3uwaf"
Content-Disposition: inline
In-Reply-To: <CAPY8ntD6i1eGxoFxmAMcczAgxgd0wWQLZ+pM4W1atXbci-i-OA@mail.gmail.com>


--facms4yavuz3uwaf
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: upstream unicam not returning any buffer
MIME-Version: 1.0

Hi Dave,

On Tue, May 06, 2025 at 02:14:51PM +0100, Dave Stevenson wrote:
> On Tue, 6 May 2025 at 13:07, Maxime Ripard <mripard@redhat.com> wrote:
> > On Wed, Apr 30, 2025 at 12:09:51PM +0100, Dave Stevenson wrote:
> > > On Fri, 25 Apr 2025 at 08:05, Maxime Ripard <mripard@redhat.com> wrot=
e:
> > > >
> > > > Hi Dave,
> > > >
> > > > On Thu, Apr 24, 2025 at 06:12:14PM +0100, Dave Stevenson wrote:
> > > > > Hi Maxime
> > > > >
> > > > > On Thu, 24 Apr 2025 at 15:58, 'Maxime Ripard' via kernel-list
> > > > > <kernel-list@raspberrypi.com> wrote:
> > > > > >
> > > > > > Hi,
> > > > > >
> > > > > > I've been trying to port a v4l2 application from the downstream=
 unicam
> > > > > > driver (with the 6.6 kernel) to upstream (6.13.11) kernel.
> > > > > >
> > > > > > While the application seemed to work ok with the downstream dri=
ver, the
> > > > > > same code will never get any buffer from the upstream unicode d=
river.
> > > > > > Either dqbuf will block forever (if it's blocking), or never re=
turn a
> > > > > > buffer (if it's non-blocking).
> > > > > >
> > > > > > The media-controller topology after the application configured =
it is:
> > > > > >
> > > > > > Media controller API version 6.13.11
> > > > > >
> > > > > > Media device information
> > > > > > ------------------------
> > > > > > driver          unicam
> > > > > > model           unicam
> > > > > > serial
> > > > > > bus info        platform:fe801000.csi
> > > > > > hw revision     0x0
> > > > > > driver version  6.13.11
> > > > > >
> > > > > > Device topology
> > > > > > - entity 1: unicam (3 pads, 3 links, 0 routes)
> > > > > >             type V4L2 subdev subtype Unknown flags 0
> > > > > >             device node name /dev/v4l-subdev0
> > > > > >         pad0: SINK
> > > > > >                 [stream:0 fmt:RGB888_1X24/1280x720 field:none c=
olorspace:srgb xfer:srgb ycbcr:601 quantization:lim-range]
> > > > > >                 <- "tc358743 5-000f":0 [ENABLED,IMMUTABLE]
> > > > > >         pad1: SOURCE
> > > > > >                 [stream:0 fmt:RGB888_1X24/1280x720 field:none c=
olorspace:srgb xfer:srgb ycbcr:601 quantization:lim-range]
> > > > > >                 -> "unicam-image":0 [ENABLED,IMMUTABLE]
> > > > > >         pad2: SOURCE
> > > > > >                 -> "unicam-embedded":0 [ENABLED,IMMUTABLE]
> > > > > >
> > > > > > - entity 5: tc358743 5-000f (1 pad, 1 link, 0 routes)
> > > > > >             type V4L2 subdev subtype Unknown flags 0
> > > > > >             device node name /dev/v4l-subdev1
> > > > > >         pad0: SOURCE
> > > > > >                 [stream:0 fmt:RGB888_1X24/1280x720 field:none c=
olorspace:srgb]
> > > > > >                 [dv.caps:BT.656/1120 min:640x350@13000000 max:1=
920x1200@165000000 stds:CEA-861,DMT,CVT,GTF caps:progressive,reduced-blanki=
ng,custom]
> > > > > >                 [dv.detect:BT.656/1120 1280x720p60 (1650x750) s=
tds: flags:]
> > > > > >                 [dv.current:BT.656/1120 1280x720p60 (1650x750) =
stds: flags:]
> > > > > >                 -> "unicam":0 [ENABLED,IMMUTABLE]
> > > > > >
> > > > > > - entity 9: unicam-image (1 pad, 1 link)
> > > > > >             type Node subtype V4L flags 1
> > > > > >             device node name /dev/video0
> > > > > >         pad0: SINK
> > > > > >                 <- "unicam":1 [ENABLED,IMMUTABLE]
> > > > > >
> > > > > > - entity 15: unicam-embedded (1 pad, 1 link)
> > > > > >              type Node subtype V4L flags 0
> > > > > >              device node name /dev/video1
> > > > > >         pad0: SINK
> > > > > >                 <- "unicam":2 [ENABLED,IMMUTABLE]
> > > > > >
> > > > > > The interrupt count in /proc/interrupts increases with a somewh=
at
> > > > > > reasonable rate, so it looks like I'm getting interrupts.
> > > > > >
> > > > > > Enabling the debug output of the unicam driver gives the follow=
ing logs:
> > > > > >
> > > > > > [ 2522.686656] unicam fe801000.csi: Starting stream on image de=
vice
> > > > > > [ 2522.687230] unicam fe801000.csi: Running with 2 data lanes, =
nodes 1
> > > > > > [ 2522.847079] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BE=
, sequence 0, lines done 0
> > > > > > [ 2522.847105] unicam fe801000.csi: Scheduling dummy buffer for=
 node 0
> > > > > > [ 2522.914545] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BC=
, sequence 0, lines done 819
> > > > > > [ 2522.914569] unicam fe801000.csi: Scheduling dummy buffer for=
 node 0
> > > > > > [ 2522.947477] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BE=
, sequence 0, lines done 1638
> > > > > > [ 2522.947499] unicam fe801000.csi: Scheduling dummy buffer for=
 node 0
> > > > > > [ 2522.964145] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BC=
, sequence 0, lines done 2457
> > > > > > [ 2522.964167] unicam fe801000.csi: Scheduling dummy buffer for=
 node 0
> > > > > > [ 2522.997077] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BE=
, sequence 0, lines done 3276
> > > > > > [ 2522.997100] unicam fe801000.csi: Scheduling dummy buffer for=
 node 0
> > > > > > [ 2523.013744] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BC=
, sequence 0, lines done 1059226
> > > > > > [ 2523.013764] unicam fe801000.csi: Scheduling dummy buffer for=
 node 0
> > > > > > [ 2523.064544] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BE=
, sequence 0, lines done 1059226
> > > > > > [ 2523.064566] unicam fe801000.csi: Scheduling dummy buffer for=
 node 0
> > > > > > [ 2523.081210] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BC=
, sequence 0, lines done 1059226
> > > > > > [ 2523.081230] unicam fe801000.csi: Scheduling dummy buffer for=
 node 0
> > > > > > [ 2523.130810] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BE=
, sequence 0, lines done 1059226
> > > > > > [ 2523.130833] unicam fe801000.csi: Scheduling dummy buffer for=
 node 0
> > > > > > [ 2523.247880] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BC=
, sequence 0, lines done 1059226
> > > > > > [ 2523.247902] unicam fe801000.csi: Scheduling dummy buffer for=
 node 0
> > > > > >
> > > > > > Do you know what could be going on? I tried to compare the upst=
ream and
> > > > > > downstream unicam drivers, and the interrupt handler seems to be
> > > > > > slightly different, but I'm afraid I'm a bit out of my depth th=
ere.
> > > > >
> > > > > I must admit to not having run the upstream driver in anger.
> > > > >
> > > > > Your interrupt traces are odd for at least two reasons.
> > > > >
> > > > > ISTA always being 0x1 means only frame start events. No frame end
> > > > > (0x2) or line count interrupts (0x4).
> > > > > You should be getting 4 line count interrupts every frame or ever=
y 128
> > > > > lines if greater, and frame end at the end of each frame. Your
> > > > > interrupts are every 16.6ms (ish), which would follow with being =
FS
> > > > > only.
> > > > >
> > > > > "lines done" is incrementing by more than the 720 lines expected =
for
> > > > > the configured resolution. I suspect that it has updated the write
> > > > > address to the new buffer, and they just happen to be contiguous =
(at
> > > > > least to start with).
> > > > > Downstream has code that (incorrectly) returns the buffer to the
> > > > > internal queue if we get repeated FS events, but it probably want=
s to
> > > > > return them to userspace with VB2_BUF_STATE_ERROR.
> > > > >
> > > > > I'll try to find a few minutes to battle the upstream driver with
> > > > > tc358743 and see what I get.
> > > >
> > > > I guess if it was RGB, it could be a vsync polarity issue then and
> > > > probably a DT issue, but I can't recall something similar for CSI.
> > > >
> > > > The DT overlay I've been using is:
> > > >
> > > > #include <dt-bindings/media/video-interfaces.h>
> > > >
> > > > /dts-v1/;
> > > > /plugin/;
> > > >
> > > > &csi1 {
> > > >         status =3D "okay";
> > > >
> > > >         port {
> > > >                 csi1_ep: endpoint {
> > > >                         remote-endpoint =3D <&tc358743_ep>;
> > > >                         bus-type =3D <MEDIA_BUS_TYPE_CSI2_DPHY>;
> > > >                         clock-noncontinuous;
> > > >                         data-lanes =3D <1 2>;
> > > >                 };
> > > >         };
> > > > };
> > > >
> > > > &i2c0 {
> > > >         status =3D "okay";
> > > > };
> > > >
> > > > &i2c0mux {
> > > >         status =3D "okay";
> > > > };
> > > >
> > > > &i2c0_1 {
> > > >         #address-cells =3D <1>;
> > > >         #size-cells =3D <0>;
> > > >         status =3D "okay";
> > > >
> > > >         tc358743@f {
> > > >                 compatible =3D "toshiba,tc358743";
> > > >                 reg =3D <0x0f>;
> > > >                 clock-names =3D "refclk";
> > > >                 clocks =3D <&clk_27MHz>;
> > > >
> > > >                 port {
> > > >                         tc358743_ep: endpoint {
> > > >                                 remote-endpoint =3D <&csi1_ep>;
> > > >                                 clock-noncontinuous;
> > > >                                 clock-lanes =3D <0>;
> > > >                                 data-lanes =3D <1 2>;
> > > >                                 link-frequencies =3D /bits/ 64 <486=
000000>;
> > >
> > > As just relayed to you via IM, this looks to be the problem.
> > > The mainline driver for tc358743 only supports a link freq of 297MHz,
> > > and will log "untested bps per lane: X bps" if you ask for something
> > > different. The PLL will be set for 486MHz, but the PHY settings remain
> > > those for 297MHz.
> > >
> > > The Raspberry Pi kernel has a couple of patches that add support for
> > > 486MHz / 972Mbit/s as that is then sufficient bandwidth to get 1080P30
> > > RGB or 1080P50 UYVY over 2 data lanes. I did try upstreaming them ages
> > > back, but memory says it sank in needing to verify FIFO fill level
> > > register settings, which is nigh impossible to prove with the data
> > > that Toshiba provide.
> > >
> > > Quick calcs say 2 lanes @ 297MHz / 594Mbit/s is enough for 720p60
> > > UYVY, but won't allow 720p60 RGB.
> > > 4 lanes @297MHz can do 1080p60 UYVY, but not RGB.
> >
> > You're right, thanks for the pointer to the patches in the RPi repo to
> > enable the higher data rates, that was the culprit.
> >
> > Should we send them upstream?
>=20
> I did back in 2017, and my memory was right that it the FIFO level
> change that was the main stumbling block -
> https://lore.kernel.org/all/cover.1505826082.git.dave.stevenson@raspberry=
pi.org/
> Use of g_mbus_config has already been resolved.
>
> I haven't checked if it's possible to support the faster link
> frequency without the FIFO level change. Gut feel is that it will fail
> as the FIFO will underflow due to starting to empty too soon.
> It may be more acceptable to set the FIFO level based on the link
> frequency. I don't believe I have sufficient information to make it
> fully dynamic as Mauro had suggested.

If one of the blocker is gone, and the other is (close to) impossible to
solve right now, it might be worth resending the patches, acknowledging
that another, better, solution might be on the table in the future?

Maxime

--facms4yavuz3uwaf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaELxeAAKCRAnX84Zoj2+
drsXAX9XI98yCWzdfgk7UVnuE3iC2vVMiI8HJOJ6q2n4GJIbvsiqf0N9h5m1SgiF
U2WHiHQBgJIbyBZxsJDUCuC6781mzJybK5vtVDyj6pWq+UrXxIcrI8Y6pw+6dsCz
YnVbeoTBXw==
=eHO5
-----END PGP SIGNATURE-----

--facms4yavuz3uwaf--


