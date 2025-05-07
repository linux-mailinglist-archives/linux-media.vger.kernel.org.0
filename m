Return-Path: <linux-media+bounces-31974-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1E3AAE074
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 15:17:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17050163D46
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 13:18:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E4D920CCD8;
	Wed,  7 May 2025 13:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OYFdb8W0"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000E2199939
	for <linux-media@vger.kernel.org>; Wed,  7 May 2025 13:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746623873; cv=none; b=HdoLLM1oJ4Phr0wDg3MKwkg5YRRdSWTSNjHLA7ZdDwcs6e7OMlfm3xQIvYsWizp4x6iNfODDxbYsn+sfihHPWIxvH922hy6Up4rdp/qSDke9QCdq0407jcZAtWnz4/KYyas0vXyrU3ya/m9oKPJ10NGGnkuyEjMbxBFyFcgkE6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746623873; c=relaxed/simple;
	bh=hhtHBPOoh2Sl9HsuAthjqbsIx1ZbMVSXkLAVHEavROg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cvF9x6aHM0ipSFc2ODvPAfsfk18cb4Np/mxu3FhyzxRPJWLsmuv411Ah0NRigBZ2gIXbfLqWhQ4n7nBxMLTI+KnwAyMLxZikek6MLkbh/yGjzWUeJcUCc2OTits3qz8FKyL45b71uJjrkp0t++ieTrnolUt85EuQO/++oncxcDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OYFdb8W0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746623869;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FfDl5gAr/kCXABtzkatixuK7XcwzaZ9BMq8BMwj2gkc=;
	b=OYFdb8W0k/wnCrBnOSJtzX1PfkCLOaI5kMR5UmO9Xm61Xu56avLjeWuKOP4gB8vo/uC7C1
	Qz6MTQ+eGypLPvze85s7Tdbn3ni0cu2XUwAovrcfAqndlwN8VD6DQ31ieHHDOx29kJswiL
	D4vI+kJ/vv3RMU41EitTHG+63DaANws=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-EQVK6saCMFSRjIjRgJUjvQ-1; Wed, 07 May 2025 09:17:46 -0400
X-MC-Unique: EQVK6saCMFSRjIjRgJUjvQ-1
X-Mimecast-MFC-AGG-ID: EQVK6saCMFSRjIjRgJUjvQ_1746623865
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-39ee54d5a00so2349708f8f.1
        for <linux-media@vger.kernel.org>; Wed, 07 May 2025 06:17:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746623865; x=1747228665;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FfDl5gAr/kCXABtzkatixuK7XcwzaZ9BMq8BMwj2gkc=;
        b=XEUaXA8qd6WWFztVJlO2PbZUtVMncL4KR3Mzz3ZhWZNFePNu50AM7aNZdgYU1OQNnH
         cN7LF3RtmQa/bWtjNDg0X5luLFCmpppYb0GZT3xAnJMc890yAsaBkU4KVuXTy9N202xM
         +86yIheV0OKc7/9A7lblH2u1GUBC7SobRS5vY7b3yG5py0vmV09/qtfBb8fOq2oR07Ap
         apFoqfNzMqXdI9IyoWMKXeR8kxQfTZ7HpK9NgLXrc+Bvttm2YfAuC8FRpFD5Rp4KKcAd
         aU80ylctDxb68pc/WcJSN3u6LZvth7pj1el774ZFJ7Fn6MjhZyCo7rCwixVpdW3/SDzI
         AE/w==
X-Gm-Message-State: AOJu0YybT2njx+lHLB/E6Lvl1ygDPJuQePgOSpv4A9NVCJT9cvh7rsKp
	OkPq7kYQaXtZce1F5yjBazIP7g9p7974WDNkwGWMcl5nmqjyRRFvmn05J/bxgQkYBsA0F3v47qG
	YdO6AnKB6Vkks/2fA5+8hpEZdIj2ZtjDdlJepwR+0JlboFXAJntuULIw2EO8cKIkTqkb3
X-Gm-Gg: ASbGncs8Fz+ILIp9AoosiwEBpleoX3d5E9sLfk3ke0HKu5VocovYuXbuAfHmD3uMSel
	VzkOJlWtR2YRRgXbUN5rALOH8HQchSMmMk3qFrneDg5uSsx/sMYuRkbMiHH3NiUl9ciXchI1I6v
	UsGjMP3DIhWNqujZpQWs/Y5xyB5/3MxVZGhI24l9UETBNVwKWaFFALpN6Q5FfFFk3/qH2Nm4WlP
	2R5d4gLVhqh0wrAODMIGwZyTfPjL9pIGNodyjmMjTVyN1Zhsp2b+j67GbJmoIw=
X-Received: by 2002:a05:6000:2404:b0:3a0:b203:450f with SMTP id ffacd0b85a97d-3a0b49ac7e0mr3140504f8f.22.1746623864924;
        Wed, 07 May 2025 06:17:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1R6COc9fCAccwex4kS23Rdxxky0UicQmSGOLUh3F5Oc4+2zp95NOrVoWLNP8/lFNChcd+lw==
X-Received: by 2002:a05:6000:2404:b0:3a0:b203:450f with SMTP id ffacd0b85a97d-3a0b49ac7e0mr3140470f8f.22.1746623864449;
        Wed, 07 May 2025 06:17:44 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd333331sm771735e9.12.2025.05.07.06.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 06:17:43 -0700 (PDT)
Date: Wed, 7 May 2025 15:17:39 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: TC358743 RGB Quantization Issue
Message-ID: <20250507-petite-qualified-beaver-e0dddc@houat>
References: <20250506-spiked-corgi-of-greatness-811fbe@houat>
 <004692be-f4af-4d3a-92e5-73b7c9b62576@xs4all.nl>
 <20250506-liberal-wine-bustard-8aa8fe@houat>
 <f0ac05fb-2bc0-4963-9da6-c322395bd294@xs4all.nl>
 <20250507-marvellous-silver-jaguarundi-4ab9c5@houat>
 <140e3b51-9048-4de0-a471-7ee8809a107e@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="kxgvqxnxbysomevj"
Content-Disposition: inline
In-Reply-To: <140e3b51-9048-4de0-a471-7ee8809a107e@xs4all.nl>


--kxgvqxnxbysomevj
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: TC358743 RGB Quantization Issue
MIME-Version: 1.0

On Wed, May 07, 2025 at 10:16:47AM +0200, Hans Verkuil wrote:
> On 07/05/2025 09:37, Maxime Ripard wrote:
> >>> # v4l2-dbg -d /dev/v4l-subdev1 -g 0x8528 -g 0x8573 -g 0x8574 -g 0x8576
> >>> ioctl: VIDIOC_DBG_G_REGISTER
> >>> Register 0x00008528 =3D 0h (0d  00000000b)
> >>> Register 0x00008573 =3D 1h (1d  00000001b)
> >>> Register 0x00008574 =3D 8h (8d  00001000b)
> >>> Register 0x00008576 =3D 0h (0d  00000000b)
> >>>
> >>> Which definitely looks like the chip on the Auvidea board detects the
> >>> quantization differently from the same video feed.
> >>>
> >>> Could it be something like a pin strap on the board that is set
> >>> differently and affects the chip behaviour? Or a bit somewhere not be=
ing
> >>> initialized to what it should and changed default?
> >>
> >> Can you dump the value of register 0x8570? Is it different for the two=
 boards?
> >=20
> > On the Auvidea (working) one:
> > # v4l2-dbg -d /dev/v4l-subdev1 -g 0x8570
> > ioctl: VIDIOC_DBG_G_REGISTER
> > Register 0x00008570 =3D e6h (230d  11100110b)
> >=20
> > On the Geekworm (broken) one:
> > # v4l2-dbg -d /dev/v4l-subdev1 -g 0x8570
> > ioctl: VIDIOC_DBG_G_REGISTER
> > Register 0x00008570 =3D e6h (230d  11100110b)
> >=20
> > So both are identical
>=20
> OK.
>=20
> Are you able to install different EDIDs? Or does it have to be this one?

It doesn't have to be this one.

> It's a bit odd in that there is only one DTD which is almost identical to
> VIC 4. Normally for an HDMI receiver you would expect to see VICs listed =
in
> the CTA-861 extension block.
>=20
> The DTD listed says:
>=20
>     DTD 1:  1280x720    60.000000 Hz  16:9     45.000 kHz     74.250000 M=
Hz (1600 mm x 900 mm)
>                  Hfront  220 Hsync  40 Hback  110 Hpol P
>                  Vfront   20 Vsync   5 Vback    5 Vpol P
>=20
> Whereas VIC 4 is:
>=20
> VIC   4:  1280x720    60.000000 Hz  16:9     45.000 kHz     74.250000 MHz
>                Hfront  110 Hsync  40 Hback  220 Hpol P
>                Vfront    5 Vsync   5 Vback   20 Vpol P
>=20
> So front and backporches appear to be swapped in the DTD.
>=20
> Testing with a EDID where VIC 4 is added and the DTD is fixed would be in=
teresting.
> For one, the AVI InfoFrame would set the VIC to 4 instead of 0 as it is w=
ith this
> EDID.

I gave it a try, and it's interesting.

Here's the EDID, and the infoframes:

# edid-decode \
  /sys/class/drm/card1-HDMI-A-2/edid \
  -I /sys/kernel/debug/dri/1/HDMI-A-2/infoframes/audio \
  -I /sys/kernel/debug/dri/1/HDMI-A-2/infoframes/avi \
  -I /sys/kernel/debug/dri/1/HDMI-A-2/infoframes/hdmi \
  -I /sys/kernel/debug/dri/1/HDMI-A-2/infoframes/hdr_drm \
  -I /sys/kernel/debug/dri/1/HDMI-A-2/infoframes/spd
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

InfoFrame of '/sys/kernel/debug/dri/1/HDMI-A-2/infoframes/audio' was empty.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

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

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

InfoFrame of '/sys/kernel/debug/dri/1/HDMI-A-2/infoframes/hdmi' was empty.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

InfoFrame of '/sys/kernel/debug/dri/1/HDMI-A-2/infoframes/hdr_drm' was empt=
y.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

edid-decode InfoFrame (hex):

83 01 19 93 42 72 6f 61 64 63 6f 6d 56 69 64 65
6f 63 6f 72 65 00 00 00 00 00 00 00 09

----------------

HDMI InfoFrame Checksum: 0x93

Source Product Description InfoFrame
  Version: 1
  Length: 25
  Vendor Name: 'Broadcom'
  Product Description: 'Videocore'
  Source Information: PC general

So indeed, the infoframes now report the VIC4 as being transmitted, but
now will transmit with limited range RGB.

And it's properly picked up by the bridge:
# v4l2-ctl -d /dev/v4l-subdev1  --log-status

Status Log:

   [  761.603912] tc358743 5-000f: =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D  START STATUS  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
   [  761.613688] tc358743 5-000f: -----Chip status-----
   [  761.619970] tc358743 5-000f: Chip ID: 0x00
   [  761.625471] tc358743 5-000f: Chip revision: 0x00
   [  761.630261] tc358743 5-000f: Reset: IR: 1, CEC: 0, CSI TX: 0, HDMI: 0
   [  761.636867] tc358743 5-000f: Sleep mode: off
   [  761.641260] tc358743 5-000f: Cable detected (+5V power): yes
   [  761.648216] tc358743 5-000f: DDC lines enabled: yes
   [  761.654448] tc358743 5-000f: Hotplug enabled: yes
   [  761.660582] tc358743 5-000f: CEC enabled: no
   [  761.665237] tc358743 5-000f: -----Signal status-----
   [  761.670388] tc358743 5-000f: TMDS signal detected: yes
   [  761.675656] tc358743 5-000f: Stable sync signal: yes
   [  761.680782] tc358743 5-000f: PHY PLL locked: yes
   [  761.685602] tc358743 5-000f: PHY DE detected: yes
   [  761.699297] tc358743 5-000f: Detected format: 1280x720p60.00 (1650x75=
0)
   [  761.706138] tc358743 5-000f: horizontal: fp =3D 0, -sync =3D 370, bp =
=3D 0
   [  761.712660] tc358743 5-000f: vertical: fp =3D 0, -sync =3D 30, bp =3D=
 0
   [  761.718880] tc358743 5-000f: pixelclock: 74250000
   [  761.723721] tc358743 5-000f: flags (0x0):
   [  761.727854] tc358743 5-000f: standards (0x0):
   [  761.732326] tc358743 5-000f: Configured format: 1280x720p60.00 (1650x=
750)
   [  761.739265] tc358743 5-000f: horizontal: fp =3D 0, -sync =3D 370, bp =
=3D 0
   [  761.745780] tc358743 5-000f: vertical: fp =3D 0, -sync =3D 30, bp =3D=
 0
   [  761.752248] tc358743 5-000f: pixelclock: 74250000
   [  761.757121] tc358743 5-000f: flags (0x0):
   [  761.761243] tc358743 5-000f: standards (0x0):
   [  761.765735] tc358743 5-000f: -----CSI-TX status-----
   [  761.770887] tc358743 5-000f: Lanes needed: 2
   [  761.775280] tc358743 5-000f: Lanes in use: 2
   [  761.780367] tc358743 5-000f: Waiting for particular sync signal: no
   [  761.787518] tc358743 5-000f: Transmit mode: yes
   [  761.793055] tc358743 5-000f: Receive mode: no
   [  761.798190] tc358743 5-000f: Stopped: no
   [  761.802252] tc358743 5-000f: Color space: RGB 888 24-bit
   [  761.808266] tc358743 5-000f: -----HDMI status-----
   [  761.813221] tc358743 5-000f: HDCP encrypted content: no
   [  761.818593] tc358743 5-000f: Input color space: RGB limited range
   [  761.825450] tc358743 5-000f: AV Mute: off
   [  761.830161] tc358743 5-000f: Deep color mode: 8-bits per channel
   [  761.839178] tc358743 5-000f: HDMI infoframe: Auxiliary Video Informat=
ion (AVI), version 2, length 13
   [  761.848599] tc358743 5-000f:     colorspace: RGB
   [  761.853350] tc358743 5-000f:     scan mode: Underscan
   [  761.858593] tc358743 5-000f:     colorimetry: ITU601
   [  761.863682] tc358743 5-000f:     picture aspect: 16:9
   [  761.868853] tc358743 5-000f:     active aspect: Same as Picture
   [  761.874934] tc358743 5-000f:     itc: No Data
   [  761.879405] tc358743 5-000f:     extended colorimetry: xvYCC 601
   [  761.885538] tc358743 5-000f:     quantization range: Default
   [  761.891325] tc358743 5-000f:     nups: Unknown Non-uniform Scaling
   [  761.897660] tc358743 5-000f:     video code: 4
   [  761.902291] tc358743 5-000f:     ycc quantization range: Limited
   [  761.908466] tc358743 5-000f:     hdmi content type: Graphics
   [  761.914244] tc358743 5-000f:     pixel repeat: 0
   [  761.918980] tc358743 5-000f:     bar top 0, bottom 0, left 0, right 0
   [  761.925734] tc358743 5-000f: =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D  END STATUS  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D

I guess that makes sense, because if I understand right, any VIC mode >
1 is supposed to be sent in limited range.

Is there any way to get HDMI to send a full range RGB signal for
somewhat common modes, or are they all supposed to be sent as limited
range?

Maxime

--kxgvqxnxbysomevj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaBtdbgAKCRAnX84Zoj2+
dlNsAXoCV9MDhMjXFBDWzIw4oS9Rr2E0by6+CdtWKxvS5fkZ63Y2K0ACtwEWXmAd
hXw26mEBf13uE3QPR9hCvTl91NouOH61gcz16iV175Xitc1HU7poKFZPdjmDetWD
JS23ThtDhQ==
=vPZG
-----END PGP SIGNATURE-----

--kxgvqxnxbysomevj--


