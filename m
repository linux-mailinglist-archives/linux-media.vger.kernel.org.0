Return-Path: <linux-media+bounces-31984-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B32FAAE381
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 16:47:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19DA73BAD80
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 14:47:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89644289819;
	Wed,  7 May 2025 14:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cy0xchnl"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80BF288C28
	for <linux-media@vger.kernel.org>; Wed,  7 May 2025 14:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746629233; cv=none; b=qVLMlzIid2nVKPVRNebUsHum+TuhWAhcBxY35OJYcuQ4ofmWV56uUg33mkN/ifQ1mL0AQUFp3F4AnlYp2Dr2rFWDxjbaMwlZOywykTm+pRU70bNMHokl7r/OgPVqeGv4qm8yJxtqMlVrEhcevEEZ4gt6ZGc0MexT7bcAgZ/Qk8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746629233; c=relaxed/simple;
	bh=u5V9zYWg9QQl2Bf1soSHZr1h8AB9/qKPVo4SyQ9JRsM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lj9co/PhzCxYrDv5OCfYESgL0rm3zzBWVdKsFtgFq4dEx0BErzneiSEl8u2szSg8F1f0K3G+25CYQIqDkjb7gmpP6ejrmbZkIMtGLy/7fznciOqNrSTwFzpYjZ/291E8L3HyvBQ4XcdcDmAiKHaXdc87T3dXR/drxaIRsHUgOow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cy0xchnl; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746629229;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1dnYrGMmymVDS4KV5oqOoLSn3p6X10S2vaSz8Mo4wS8=;
	b=cy0xchnluZsXezsrkqeROyCbwWyzxeBaf1zQCypP3lsI5ic4VM+bRU18C0DfaK74WXRcj7
	UCAnv28aC+0k7h2zq9vksoIjTP2S2Lj6VmBZb119TcjaCRs0lpl3bhfnc1z28RwUqVMSV2
	xdpIHglrGE9HGZwTfk/yp9SlDd3Mw9k=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-383-OwprW3gVP5GCnjWM7gZZGw-1; Wed, 07 May 2025 10:47:07 -0400
X-MC-Unique: OwprW3gVP5GCnjWM7gZZGw-1
X-Mimecast-MFC-AGG-ID: OwprW3gVP5GCnjWM7gZZGw_1746629226
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43eea5a5d80so38473095e9.1
        for <linux-media@vger.kernel.org>; Wed, 07 May 2025 07:47:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746629226; x=1747234026;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1dnYrGMmymVDS4KV5oqOoLSn3p6X10S2vaSz8Mo4wS8=;
        b=RE35233JN5mdDKQWQUqnOPY7F2P+HjD6hTbrwkZbuC/7dq197vxt36hhYqQXbVAH+6
         MfvCSm6bd8HRkWitAudxQuBJQGUTvibFDBRc5fesu4+IY0HtJA14S9XA8zNOfFvgcrop
         l32gaQg3UqrRF16Qjfe5A2BmxLNbV/P16LgT1NCzajKkGqwqE1Jw+l47IcB60/EN+ur5
         aYXr25JdCLabWb9I73aa2dGv7Bip5NHPvCwFLWci/fLWYmiIVUZUugggUvQIJEhRluux
         mW8uZhsQum9DWls4rl/fn7Mlj7oz0eCPUWrFeueq7hJgu+SZe869F7V8fXj420HGcw1I
         9pKg==
X-Gm-Message-State: AOJu0YwQufvVN+YMOUUyafsDtZD3xaaxBE5rdizAz+siBb4Ym4PTh8JF
	lD9ygDTktK5sS8OqwesI7RgC8MLbfDSmMpbzVvdJs+CphJ5aozFUZptxLUj++8TLoFqdWhtZ97E
	93C5pohPGLYRt4VbeAmWUIza9KDbNh2V51EVNpsLRIHTiubbVD/q1SafqXMT/h0ZfV5X2
X-Gm-Gg: ASbGncsVwHBKrhAO5EaQkRP2LTpSOEdsrHQ2iMAgYnzgQSlvL1kyzDX+prAVzEoeT4g
	aX6CvkxN2Fi7gGG9cXb839M5Vf7QSLFGGKd3cbwlgsUIEVmjg83+9iySBrmlCwGx2DE3QnKGgre
	YyvPmzGDErS9rUHXYCcckL66W2Cw4GNMIumLnoh8XBVf2j4Yv7kLICmYLCDqKATAirhz6cTOBC8
	lb4M+brihOjVvCDohO/Zf0bi7MIzJ+1osOfHsCnGVPsdHBds4EwdWI8ZuUFPpE=
X-Received: by 2002:a05:600c:8216:b0:43c:fabf:9146 with SMTP id 5b1f17b1804b1-441d44c7ea7mr35126635e9.17.1746629225886;
        Wed, 07 May 2025 07:47:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEM4XYB3a3wuTdEbaTW3VnU9MgTcey03IwnU5CgWj9alrQ7o04uIwimvc95XetseoOHFm6NCw==
X-Received: by 2002:a05:600c:8216:b0:43c:fabf:9146 with SMTP id 5b1f17b1804b1-441d44c7ea7mr35126325e9.17.1746629225326;
        Wed, 07 May 2025 07:47:05 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd3285f9sm3493595e9.8.2025.05.07.07.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 07:47:04 -0700 (PDT)
Date: Wed, 7 May 2025 16:47:04 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Hans Verkuil <hans@jjverkuil.nl>
Cc: linux-media@vger.kernel.org, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: TC358743 RGB Quantization Issue
Message-ID: <20250507-crouching-curassow-of-acumen-36deac@houat>
References: <20250506-spiked-corgi-of-greatness-811fbe@houat>
 <004692be-f4af-4d3a-92e5-73b7c9b62576@xs4all.nl>
 <20250506-liberal-wine-bustard-8aa8fe@houat>
 <f0ac05fb-2bc0-4963-9da6-c322395bd294@xs4all.nl>
 <20250507-marvellous-silver-jaguarundi-4ab9c5@houat>
 <140e3b51-9048-4de0-a471-7ee8809a107e@xs4all.nl>
 <20250507-petite-qualified-beaver-e0dddc@houat>
 <b1835207-2ccb-40b0-8968-6edecd92e9e3@jjverkuil.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="btdozhm64qg4b7bj"
Content-Disposition: inline
In-Reply-To: <b1835207-2ccb-40b0-8968-6edecd92e9e3@jjverkuil.nl>


--btdozhm64qg4b7bj
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: TC358743 RGB Quantization Issue
MIME-Version: 1.0

On Wed, May 07, 2025 at 03:57:50PM +0200, Hans Verkuil wrote:
> On 07/05/2025 15:17, Maxime Ripard wrote:
> > On Wed, May 07, 2025 at 10:16:47AM +0200, Hans Verkuil wrote:
> >> On 07/05/2025 09:37, Maxime Ripard wrote:
> >>>>> # v4l2-dbg -d /dev/v4l-subdev1 -g 0x8528 -g 0x8573 -g 0x8574 -g 0x8=
576
> >>>>> ioctl: VIDIOC_DBG_G_REGISTER
> >>>>> Register 0x00008528 =3D 0h (0d  00000000b)
> >>>>> Register 0x00008573 =3D 1h (1d  00000001b)
> >>>>> Register 0x00008574 =3D 8h (8d  00001000b)
> >>>>> Register 0x00008576 =3D 0h (0d  00000000b)
> >>>>>
> >>>>> Which definitely looks like the chip on the Auvidea board detects t=
he
> >>>>> quantization differently from the same video feed.
> >>>>>
> >>>>> Could it be something like a pin strap on the board that is set
> >>>>> differently and affects the chip behaviour? Or a bit somewhere not =
being
> >>>>> initialized to what it should and changed default?
> >>>>
> >>>> Can you dump the value of register 0x8570? Is it different for the t=
wo boards?
> >>>
> >>> On the Auvidea (working) one:
> >>> # v4l2-dbg -d /dev/v4l-subdev1 -g 0x8570
> >>> ioctl: VIDIOC_DBG_G_REGISTER
> >>> Register 0x00008570 =3D e6h (230d  11100110b)
> >>>
> >>> On the Geekworm (broken) one:
> >>> # v4l2-dbg -d /dev/v4l-subdev1 -g 0x8570
> >>> ioctl: VIDIOC_DBG_G_REGISTER
> >>> Register 0x00008570 =3D e6h (230d  11100110b)
> >>>
> >>> So both are identical
> >>
> >> OK.
> >>
> >> Are you able to install different EDIDs? Or does it have to be this on=
e?
> >=20
> > It doesn't have to be this one.
> >=20
> >> It's a bit odd in that there is only one DTD which is almost identical=
 to
> >> VIC 4. Normally for an HDMI receiver you would expect to see VICs list=
ed in
> >> the CTA-861 extension block.
> >>
> >> The DTD listed says:
> >>
> >>     DTD 1:  1280x720    60.000000 Hz  16:9     45.000 kHz     74.25000=
0 MHz (1600 mm x 900 mm)
> >>                  Hfront  220 Hsync  40 Hback  110 Hpol P
> >>                  Vfront   20 Vsync   5 Vback    5 Vpol P
> >>
> >> Whereas VIC 4 is:
> >>
> >> VIC   4:  1280x720    60.000000 Hz  16:9     45.000 kHz     74.250000 =
MHz
> >>                Hfront  110 Hsync  40 Hback  220 Hpol P
> >>                Vfront    5 Vsync   5 Vback   20 Vpol P
> >>
> >> So front and backporches appear to be swapped in the DTD.
> >>
> >> Testing with a EDID where VIC 4 is added and the DTD is fixed would be=
 interesting.
> >> For one, the AVI InfoFrame would set the VIC to 4 instead of 0 as it i=
s with this
> >> EDID.
> >=20
> > I gave it a try, and it's interesting.
> >=20
> > Here's the EDID, and the infoframes:
> >=20
> > # edid-decode \
> >   /sys/class/drm/card1-HDMI-A-2/edid \
> >   -I /sys/kernel/debug/dri/1/HDMI-A-2/infoframes/audio \
> >   -I /sys/kernel/debug/dri/1/HDMI-A-2/infoframes/avi \
> >   -I /sys/kernel/debug/dri/1/HDMI-A-2/infoframes/hdmi \
> >   -I /sys/kernel/debug/dri/1/HDMI-A-2/infoframes/hdr_drm \
> >   -I /sys/kernel/debug/dri/1/HDMI-A-2/infoframes/spd
> > edid-decode (hex):
> >=20
> > 00 ff ff ff ff ff ff 00 0e 4e 42 00 42 42 42 42
> > 00 22 01 03 81 a0 5a 78 0a 9c 68 a0 57 4a 9b 26
> > 12 48 4c 20 00 00 01 01 01 01 01 01 01 01 01 01
> > 01 01 01 01 01 01 01 1d 00 72 51 d0 1e 20 6e 28
> > 55 00 40 84 63 00 00 1e 00 00 00 fc 00 44 72 61
> > 64 69 73 0a 20 20 20 20 20 20 00 00 00 fd 00 3b
> > 3d 1e 32 08 00 0a 20 20 20 20 20 20 00 00 00 10
> > 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 7d
> >=20
> > 02 03 13 81 41 04 e3 05 00 20 e2 00 4a 65 03 0c
> > 00 10 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 6a
> >=20
> > ----------------
> >=20
> > Block 0, Base EDID:
> >   EDID Structure Version & Revision: 1.3
> >   Vendor & Product Identification:
> >     Manufacturer: CRN
> >     Model: 66
> >     Serial Number: 1111638594 (0x42424242)
> >     Made in: 2024
> >   Basic Display Parameters & Features:
> >     Digital display
> >     DFP 1.x compatible TMDS
> >     Maximum image size: 160 cm x 90 cm
> >     Gamma: 2.20
> >     RGB color display
> >     First detailed timing is the preferred timing
> >   Color Characteristics:
> >     Red  : 0.6269, 0.3408
> >     Green: 0.2919, 0.6054
> >     Blue : 0.1494, 0.0722
> >     White: 0.2832, 0.2968
> >   Established Timings I & II:
> >     DMT 0x04:   640x480    59.940476 Hz   4:3     31.469 kHz     25.175=
000 MHz
> >   Standard Timings: none
> >   Detailed Timing Descriptors:
> >     DTD 1:  1280x720    60.000000 Hz  16:9     45.000 kHz     74.250000=
 MHz (1600 mm x 900 mm)
> >                  Hfront  110 Hsync  40 Hback  220 Hpol P
> >                  Vfront    5 Vsync   5 Vback   20 Vpol P
> >     Display Product Name: 'Dradis'
> >     Display Range Limits:
> >       Monitor ranges (GTF): 59-61 Hz V, 30-50 kHz H, max dotclock 80 MHz
> >     Dummy Descriptor:
> >   Extension blocks: 1
> > Checksum: 0x7d
> >=20
> > ----------------
> >=20
> > Block 1, CTA-861 Extension Block:
> >   Revision: 3
> >   Underscans IT Video Formats by default
> >   Native detailed modes: 1
> >   Video Data Block:
> >     VIC   4:  1280x720    60.000000 Hz  16:9     45.000 kHz     74.2500=
00 MHz
> >   Colorimetry Data Block:
> >     sRGB
> >   Video Capability Data Block:
> >     YCbCr quantization: No Data
> >     RGB quantization: Selectable (via AVI Q)
> >     PT scan behavior: No Data
> >     IT scan behavior: Always Underscanned
> >     CE scan behavior: Always Underscanned
> >   Vendor-Specific Data Block (HDMI), OUI 00-0C-03:
> >     Source physical address: 1.0.0.0
> > Checksum: 0x6a  Unused space in Extension Block: 108 bytes
> >=20
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >=20
> > InfoFrame of '/sys/kernel/debug/dri/1/HDMI-A-2/infoframes/audio' was em=
pty.
> >=20
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >=20
> > edid-decode InfoFrame (hex):
> >=20
> > 82 02 0d 2d 12 28 04 04 00 00 00 00 00 00 00 00
> > 00
> >=20
> > ----------------
> >=20
> > HDMI InfoFrame Checksum: 0x2d
> >=20
> > AVI InfoFrame
> >   Version: 2
> >   Length: 13
> >   VIC   4:  1280x720    60.000000 Hz  16:9     45.000 kHz     74.250000=
 MHz
> >   Y: Color Component Sample Format: RGB
> >   A: Active Format Information Present: Yes
> >   B: Bar Data Present: Bar Data not present
> >   S: Scan Information: Composed for an underscanned display
> >   C: Colorimetry: No Data
> >   M: Picture Aspect Ratio: 16:9
> >   R: Active Portion Aspect Ratio: 8
> >   ITC: IT Content: No Data
> >   EC: Extended Colorimetry: xvYCC601
> >   Q: RGB Quantization Range: Limited Range
>=20
> Note that this sets Limited Range, but at the tc358743 receiver side
> it is still Default. It's really, really weird.
>=20
> >   SC: Non-Uniform Picture Scaling: No Known non-uniform scaling
> >   YQ: YCC Quantization Range: Limited Range
> >   CN: IT Content Type: Graphics
> >   PR: Pixel Data Repetition Count: 0
> >   Line Number of End of Top Bar: 0
> >   Line Number of Start of Bottom Bar: 0
> >   Pixel Number of End of Left Bar: 0
> >   Pixel Number of Start of Right Bar: 0
> >=20
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >=20
> > InfoFrame of '/sys/kernel/debug/dri/1/HDMI-A-2/infoframes/hdmi' was emp=
ty.
> >=20
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >=20
> > InfoFrame of '/sys/kernel/debug/dri/1/HDMI-A-2/infoframes/hdr_drm' was =
empty.
> >=20
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >=20
> > edid-decode InfoFrame (hex):
> >=20
> > 83 01 19 93 42 72 6f 61 64 63 6f 6d 56 69 64 65
> > 6f 63 6f 72 65 00 00 00 00 00 00 00 09
> >=20
> > ----------------
> >=20
> > HDMI InfoFrame Checksum: 0x93
> >=20
> > Source Product Description InfoFrame
> >   Version: 1
> >   Length: 25
> >   Vendor Name: 'Broadcom'
> >   Product Description: 'Videocore'
> >   Source Information: PC general
> >=20
> > So indeed, the infoframes now report the VIC4 as being transmitted, but
> > now will transmit with limited range RGB.
> >=20
> > And it's properly picked up by the bridge:
> > # v4l2-ctl -d /dev/v4l-subdev1  --log-status
> >=20
> > Status Log:
> >=20
> >    [  761.603912] tc358743 5-000f: =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D  START STATUS  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> >    [  761.613688] tc358743 5-000f: -----Chip status-----
> >    [  761.619970] tc358743 5-000f: Chip ID: 0x00
> >    [  761.625471] tc358743 5-000f: Chip revision: 0x00
> >    [  761.630261] tc358743 5-000f: Reset: IR: 1, CEC: 0, CSI TX: 0, HDM=
I: 0
> >    [  761.636867] tc358743 5-000f: Sleep mode: off
> >    [  761.641260] tc358743 5-000f: Cable detected (+5V power): yes
> >    [  761.648216] tc358743 5-000f: DDC lines enabled: yes
> >    [  761.654448] tc358743 5-000f: Hotplug enabled: yes
> >    [  761.660582] tc358743 5-000f: CEC enabled: no
> >    [  761.665237] tc358743 5-000f: -----Signal status-----
> >    [  761.670388] tc358743 5-000f: TMDS signal detected: yes
> >    [  761.675656] tc358743 5-000f: Stable sync signal: yes
> >    [  761.680782] tc358743 5-000f: PHY PLL locked: yes
> >    [  761.685602] tc358743 5-000f: PHY DE detected: yes
> >    [  761.699297] tc358743 5-000f: Detected format: 1280x720p60.00 (165=
0x750)
> >    [  761.706138] tc358743 5-000f: horizontal: fp =3D 0, -sync =3D 370,=
 bp =3D 0
> >    [  761.712660] tc358743 5-000f: vertical: fp =3D 0, -sync =3D 30, bp=
 =3D 0
> >    [  761.718880] tc358743 5-000f: pixelclock: 74250000
> >    [  761.723721] tc358743 5-000f: flags (0x0):
> >    [  761.727854] tc358743 5-000f: standards (0x0):
> >    [  761.732326] tc358743 5-000f: Configured format: 1280x720p60.00 (1=
650x750)
> >    [  761.739265] tc358743 5-000f: horizontal: fp =3D 0, -sync =3D 370,=
 bp =3D 0
> >    [  761.745780] tc358743 5-000f: vertical: fp =3D 0, -sync =3D 30, bp=
 =3D 0
> >    [  761.752248] tc358743 5-000f: pixelclock: 74250000
> >    [  761.757121] tc358743 5-000f: flags (0x0):
> >    [  761.761243] tc358743 5-000f: standards (0x0):
> >    [  761.765735] tc358743 5-000f: -----CSI-TX status-----
> >    [  761.770887] tc358743 5-000f: Lanes needed: 2
> >    [  761.775280] tc358743 5-000f: Lanes in use: 2
> >    [  761.780367] tc358743 5-000f: Waiting for particular sync signal: =
no
> >    [  761.787518] tc358743 5-000f: Transmit mode: yes
> >    [  761.793055] tc358743 5-000f: Receive mode: no
> >    [  761.798190] tc358743 5-000f: Stopped: no
> >    [  761.802252] tc358743 5-000f: Color space: RGB 888 24-bit
> >    [  761.808266] tc358743 5-000f: -----HDMI status-----
> >    [  761.813221] tc358743 5-000f: HDCP encrypted content: no
> >    [  761.818593] tc358743 5-000f: Input color space: RGB limited range
> >    [  761.825450] tc358743 5-000f: AV Mute: off
> >    [  761.830161] tc358743 5-000f: Deep color mode: 8-bits per channel
> >    [  761.839178] tc358743 5-000f: HDMI infoframe: Auxiliary Video Info=
rmation (AVI), version 2, length 13
> >    [  761.848599] tc358743 5-000f:     colorspace: RGB
> >    [  761.853350] tc358743 5-000f:     scan mode: Underscan
> >    [  761.858593] tc358743 5-000f:     colorimetry: ITU601
>=20
> This is also weird: the transmitter sends 'No Data' here.
>=20
> Can you dump the raw AVI InfoFrame data that the tc358743 reads before it=
 is
> logged here, and compare it with the raw data from the avi infoframe that
> the transmitter sends?
>=20
> Actually, if you are on a recent kernel (6.13 and up) then the infoframe =
received by the
> tc358743 is also exported in debugfs. So you can check it with edid-decod=
e as well.

Here it is on the Geekwork (broken):

# edid-decode edid-dumps/test-edid.bin -I /sys/kernel/debug/v4l2/tc358743\ =
5-000f/infoframes/avi
edid-decode (hex):

00 ff ff ff ff ff ff 00 0e 4e 42 00 42 42 42 42
00 22 01 03 81 a0 5a 78 0a 9c 68 a0 57 4a 9b 26
12 48 4c 20 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 01 1d 00 72 51 d0 1e 20 6e 28
55 00 40 84 63 00 00 1e 00 00 00 fc 00 44 72 61
64 69 73 0a 20 20 20 20 20 20 00 00 00 fd 00 3b
3d 1e 32 08 00 0a 20 20 20 20 20 20 00 00 00 10
00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 7d

02 03 13 81 41 04 e3 05 00 20 e2 00 4a 65 03 0c
00 10 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 6a

----------------

Block 0, Base EDID:
  EDID Structure Version & Revision: 1.3
  Vendor & Product Identification:
    Manufacturer: CRN
    Model: 66
    Serial Number: 1111638594 (0x42424242)
    Made in: 2024
  Basic Display Parameters & Features:
    Digital display
    DFP 1.x compatible TMDS
    Maximum image size: 160 cm x 90 cm
    Gamma: 2.20
    RGB color display
    First detailed timing is the preferred timing
  Color Characteristics:
    Red  : 0.6269, 0.3408
    Green: 0.2919, 0.6054
    Blue : 0.1494, 0.0722
    White: 0.2832, 0.2968
  Established Timings I & II:
    DMT 0x04:   640x480    59.940476 Hz   4:3     31.469 kHz     25.175000 =
MHz
  Standard Timings: none
  Detailed Timing Descriptors:
    DTD 1:  1280x720    60.000000 Hz  16:9     45.000 kHz     74.250000 MHz=
 (1600 mm x 900 mm)
                 Hfront  110 Hsync  40 Hback  220 Hpol P
                 Vfront    5 Vsync   5 Vback   20 Vpol P
    Display Product Name: 'Dradis'
    Display Range Limits:
      Monitor ranges (GTF): 59-61 Hz V, 30-50 kHz H, max dotclock 80 MHz
    Dummy Descriptor:
  Extension blocks: 1
Checksum: 0x7d

----------------

Block 1, CTA-861 Extension Block:
  Revision: 3
  Underscans IT Video Formats by default
  Native detailed modes: 1
  Video Data Block:
    VIC   4:  1280x720    60.000000 Hz  16:9     45.000 kHz     74.250000 M=
Hz
  Colorimetry Data Block:
    sRGB
  Video Capability Data Block:
    YCbCr quantization: No Data
    RGB quantization: Selectable (via AVI Q)
    PT scan behavior: No Data
    IT scan behavior: Always Underscanned
    CE scan behavior: Always Underscanned
  Vendor-Specific Data Block (HDMI), OUI 00-0C-03:
    Source physical address: 1.0.0.0
Checksum: 0x6a  Unused space in Extension Block: 108 bytes

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

edid-decode InfoFrame (hex):

82 02 0d f1 12 68 00 04 00 00 00 00 00 00 00 00
00

----------------

HDMI InfoFrame Checksum: 0xf1

AVI InfoFrame
  Version: 2
  Length: 13
  VIC   4:  1280x720    60.000000 Hz  16:9     45.000 kHz     74.250000 MHz
  Y: Color Component Sample Format: RGB
  A: Active Format Information Present: Yes
  B: Bar Data Present: Bar Data not present
  S: Scan Information: Composed for an underscanned display
  C: Colorimetry: SMPTE ST 170
  M: Picture Aspect Ratio: 16:9
  R: Active Portion Aspect Ratio: 8
  ITC: IT Content: No Data
  EC: Extended Colorimetry: xvYCC601
  Q: RGB Quantization Range: Default
  SC: Non-Uniform Picture Scaling: No Known non-uniform scaling
  YQ: YCC Quantization Range: Limited Range
  CN: IT Content Type: Graphics
  PR: Pixel Data Repetition Count: 0
  Line Number of End of Top Bar: 0
  Line Number of Start of Bottom Bar: 0
  Pixel Number of End of Left Bar: 0
  Pixel Number of Start of Right Bar: 0

So it looks like the EDID match, but the InfoFrame bytes 3 and 7 don't
for some reason.

I went back to the Auvidea one to see what it was reporting and it's:

edid-decode InfoFrame (hex):

82 02 0d 2d 12 28 04 04 00 00 00 00 00 00 00 00
00

----------------

HDMI InfoFrame Checksum: 0x2d

AVI InfoFrame
  Version: 2
  Length: 13
  VIC   4:  1280x720    60.000000 Hz  16:9     45.000 kHz     74.250000 MHz
  Y: Color Component Sample Format: RGB
  A: Active Format Information Present: Yes
  B: Bar Data Present: Bar Data not present
  S: Scan Information: Composed for an underscanned display
  C: Colorimetry: No Data
  M: Picture Aspect Ratio: 16:9
  R: Active Portion Aspect Ratio: 8
  ITC: IT Content: No Data
  EC: Extended Colorimetry: xvYCC601
  Q: RGB Quantization Range: Limited Range
  SC: Non-Uniform Picture Scaling: No Known non-uniform scaling
  YQ: YCC Quantization Range: Limited Range
  CN: IT Content Type: Graphics
  PR: Pixel Data Repetition Count: 0
  Line Number of End of Top Bar: 0
  Line Number of Start of Bottom Bar: 0
  Pixel Number of End of Left Bar: 0
  Pixel Number of Start of Right Bar: 0

----------------

Warnings:

InfoFrame:
  AVI InfoFrame: If a VID or RID is specified, then set M to 0.

AVI InfoFrame conformity: PASS

So, this time, the infoframes match what the kernel is supposed to send.

> >    [  761.863682] tc358743 5-000f:     picture aspect: 16:9
> >    [  761.868853] tc358743 5-000f:     active aspect: Same as Picture
> >    [  761.874934] tc358743 5-000f:     itc: No Data
> >    [  761.879405] tc358743 5-000f:     extended colorimetry: xvYCC 601
> >    [  761.885538] tc358743 5-000f:     quantization range: Default
> >    [  761.891325] tc358743 5-000f:     nups: Unknown Non-uniform Scaling
> >    [  761.897660] tc358743 5-000f:     video code: 4
> >    [  761.902291] tc358743 5-000f:     ycc quantization range: Limited
> >    [  761.908466] tc358743 5-000f:     hdmi content type: Graphics
> >    [  761.914244] tc358743 5-000f:     pixel repeat: 0
> >    [  761.918980] tc358743 5-000f:     bar top 0, bottom 0, left 0, rig=
ht 0
> >    [  761.925734] tc358743 5-000f: =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D  END STATUS  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> >=20
> > I guess that makes sense, because if I understand right, any VIC mode >
> > 1 is supposed to be sent in limited range.
>=20
> Correct, that's the default behavior.
>=20
> > Is there any way to get HDMI to send a full range RGB signal for
> > somewhat common modes, or are they all supposed to be sent as limited
> > range?
>=20
> If the EDID signals Selectable RGB Quantization Range in the Video Capabi=
lity Data Block
> (this EDID does), then the source has the option to select full range. It=
's the Broadcast RGB
> property.
>=20
> I also have a patch here:
>=20
> https://git.linuxtv.org/hverkuil/media_tree.git/commit/?h=3Dhdmi-dbg&id=
=3D9bf808aa3659ed88e7188994b1f84cfd0a2133b6
>=20
> that switches to Full Range if the display can handle it.

Yeah, I know the Broadcast RGB property. My question was more about an
automatic mechanism. This whole thing is meant for CI, so I'd ideally
prefer to have something that works without the driver supporting
Broadcast RGB property, because most driver still don't.

Maxime

--btdozhm64qg4b7bj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaBtyYgAKCRAnX84Zoj2+
dqu5AX9Am+cLU/3+EYdOtoOCLsTLKGbwoybsmqrez/h80y6gPR2rWswcdlyuE8mV
gaWPcA0Bf05EzKW6fES2TTIrJ4E9/k7tg/6DCjM+3wGE2etb7GwwG396YJK3k1+N
Lze83uuqMw==
=YgNz
-----END PGP SIGNATURE-----

--btdozhm64qg4b7bj--


