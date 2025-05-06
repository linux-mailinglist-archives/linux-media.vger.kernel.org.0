Return-Path: <linux-media+bounces-31843-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 658F6AAC35A
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 14:05:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E6291C085E3
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 12:06:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44CA327E7EB;
	Tue,  6 May 2025 12:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="La0BMKjk"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3701E51E2
	for <linux-media@vger.kernel.org>; Tue,  6 May 2025 12:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746533150; cv=none; b=PSojCenNdVPIXnbfKIDBeJw29kWw4yNtyXT808+jIwuryafCs7lFm2ij/HRMkPDMI7AmFWjp9Yz9kOOUqsvH9X8Lp959NE71Q7H57hy2g7DjlmcRzdN4BrEFUuSU3RNfdbiYUxyEt/x6uxSIjCtoRZQHmMegL/UpKN83YornSf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746533150; c=relaxed/simple;
	bh=RKvZKUWJNdrxmWJy8zzjXG7FlTO9kHznVP03yYq0CtA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ukohom8Px0VrxHGoYmJst+v15PbbfE4g9/feWsYxohWLMuRHBfxbzpGqyABP/Ft2Jc09bQFl9HSelqPfOTMDDIP8wDDr34YcZDPZDuzxOuzTjf4mHgikxUGOgsHawkWYk/KPMSenpb7zBDkcwIC3S6MrRgoZFw2OkkXHuwvLbdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=La0BMKjk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746533147;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=l0YCIS9BJjxM3LMbK5jqv/83ONpvN1Yn0siUAoKiKcw=;
	b=La0BMKjkWRkDEujhM4utUxGgnBNT/OFl3PF2AiqkIfIIrH9GDcPbhLoyRagJmTmZmhbJyE
	oeJ/RysjfSyUcS9HWRxHZXQfViPiR1o8NIMc+EVYP4TGLg3dqpFBMxI8efk9dJI9wPgZ5u
	bJYRGX/lPdzzN/0gBZ7WkF/sOn8Llrc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-205-lqQPwR2MMaasJlhPTaZjZw-1; Tue, 06 May 2025 08:05:45 -0400
X-MC-Unique: lqQPwR2MMaasJlhPTaZjZw-1
X-Mimecast-MFC-AGG-ID: lqQPwR2MMaasJlhPTaZjZw_1746533144
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-44059976a1fso23991095e9.1
        for <linux-media@vger.kernel.org>; Tue, 06 May 2025 05:05:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746533144; x=1747137944;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l0YCIS9BJjxM3LMbK5jqv/83ONpvN1Yn0siUAoKiKcw=;
        b=uMPoekdpWIPrwFazqk/vlunz0VOsYBPH3VB9PlYar4Xs1zD0jaashiGQfRZmasWgHZ
         6F0hbCVtJ8N1jGhmegGx3B8bdS7e3yTj1/46WPOs0SAF2BZec0KGg2stCvmuL4DecVGX
         Ehip6bm4KdhfV6tAJfjdV86NintGLl88YJWyMmn2MIYBdocarhbS+giUTNoDmxO210zh
         pEZYUikNzgrnSuJndq6I562BdrlVfTbJ2GZSUlytjy9mrGYEoUCUrvG2iGXJf1eoDNqe
         i0UlCtJc083LFn3dtfXqxJWAgCsSlopTBWqwejaezjwMJZkMHDWpXt7OoWZgZVn+fReb
         iRog==
X-Gm-Message-State: AOJu0Yz3ID9CGf/0GK7BMKMr90qqSXH7ugX2+ZEoHuMd6dsg/iFvrQvT
	YT0s7/54Q9GodUP9d1QxvUSPaECIfKDOnaeemnb+GehaqqRhNuE7WFxMR6ICdKTwi/USZKJv1nE
	Eu7FbBSOzwvrrWtUrKZLb+PFzzhJcuKXW0ZKlWOee3bPDcW0+9g1rF+Lmo0s1
X-Gm-Gg: ASbGncsXRV/VA75j645ik84gpmYkeeVaat0EYtYcOigneLEigULsOZuFuBchV4HRD0h
	mekKJwWANR+AztpxWUVbb7jXbg5XVI8ibLlEXmPBahJSjoy3Yxyn0h88mqF490/FAOK5MD/LEK9
	8r65FKmDWhC6RUmVIj1MlqZ8lVSa4BcFPNXUa9C+jxZKaOA9VodBY6jczKh8SZ+U0Bbi3RC4+V4
	Ei9ei00mH2CctwUhyOmH5oPadDrZ1++lCfUHcfJgNdwvR38AI7YOwWs51cR4UE=
X-Received: by 2002:a05:600c:1c1c:b0:43c:fe5e:f040 with SMTP id 5b1f17b1804b1-441bbf34170mr132656375e9.23.1746533143825;
        Tue, 06 May 2025 05:05:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNDacrFeC/Kza0wneO9JavEeFXyxlW2HSc5N8/PKOs+iPHGFA0cHgg+PilO0PkVO2pAvEmXQ==
X-Received: by 2002:a05:600c:1c1c:b0:43c:fe5e:f040 with SMTP id 5b1f17b1804b1-441bbf34170mr132655905e9.23.1746533143255;
        Tue, 06 May 2025 05:05:43 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b8a288f0sm166413015e9.27.2025.05.06.05.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 05:05:42 -0700 (PDT)
Date: Tue, 6 May 2025 14:05:42 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: TC358743 RGB Quantization Issue
Message-ID: <20250506-spiked-corgi-of-greatness-811fbe@houat>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="7az2kpgbjjyvssp6"
Content-Disposition: inline


--7az2kpgbjjyvssp6
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: TC358743 RGB Quantization Issue
MIME-Version: 1.0

Hi,

It's something we've discussed a bit on IRC a few week ago, but I have
more data now, and can reproduce it on a mainline 6.13.12.

I have recently switched from an Auvidea B101
(https://auvidea.eu/product/b101-70501/) board to a Geekworm X1301
(https://geekworm.com/products/x1301). Both feature a TC358743XBG
according to their documentation, but the Auvideo one was bought in
2020-2021, whereas I bought the Geekworm this year, so I guess it could
be a newer revision.

Anyway, I have a v4l2 application on the CSI end of the TC358743 bridge,
and a KMS application on the HDMI end. The KMS application sends frame
through the HDMI cable, and the v4l2 application checks their integrity
using a hash algorithm.

Everything works nicely with the Auvidea board.

When I swap the Geekwork one in though, the bridge driver detects the
signal as limited range, and all the pixels are off. They are correct
though if you account for the full range to limited range conversion.

The EDID programmed in the bridge is:

edid-decode (hex):

00 ff ff ff ff ff ff 00 0e 4e 42 00 42 42 42 42
00 22 01 03 81 a0 5a 78 0a 9c 68 a0 57 4a 9b 26
12 48 4c 20 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 01 1d 00 72 51 d0 1e 20 dc 28
45 04 40 84 63 00 00 1e 00 00 00 fc 00 44 72 61
64 69 73 0a 20 20 20 20 20 20 00 00 00 fd 00 3b
3d 1e 32 08 00 0a 20 20 20 20 20 20 00 00 00 10
00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 1b

02 03 11 81 e3 05 00 20 e2 00 4a 65 03 0c 00 10
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 b1

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
    DMT 0x04:   640x480    59.940476 Hz   4:3     31.469 kHz     25.175000 MHz
  Standard Timings: none
  Detailed Timing Descriptors:
    DTD 1:  1280x720    60.000000 Hz  16:9     45.000 kHz     74.250000 MHz (1600 mm x 900 mm)
                 Hfront  220 Hsync  40 Hback  110 Hpol P
                 Vfront   20 Vsync   5 Vback    5 Vpol P
    Display Product Name: 'Dradis'
    Display Range Limits:
      Monitor ranges (GTF): 59-61 Hz V, 30-50 kHz H, max dotclock 80 MHz
    Dummy Descriptor:
  Extension blocks: 1
Checksum: 0x1b

----------------

Block 1, CTA-861 Extension Block:
  Revision: 3
  Underscans IT Video Formats by default
  Native detailed modes: 1
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
Checksum: 0xb1  Unused space in Extension Block: 110 bytes
[root@rpi-ab2f2485 ~]# edid-decode edid-dumps/test-edid.bin --check
edid-decode (hex):

00 ff ff ff ff ff ff 00 0e 4e 42 00 42 42 42 42
00 22 01 03 81 a0 5a 78 0a 9c 68 a0 57 4a 9b 26
12 48 4c 20 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 01 1d 00 72 51 d0 1e 20 dc 28
45 04 40 84 63 00 00 1e 00 00 00 fc 00 44 72 61
64 69 73 0a 20 20 20 20 20 20 00 00 00 fd 00 3b
3d 1e 32 08 00 0a 20 20 20 20 20 20 00 00 00 10
00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 1b

02 03 11 81 e3 05 00 20 e2 00 4a 65 03 0c 00 10
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 b1

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
    DMT 0x04:   640x480    59.940476 Hz   4:3     31.469 kHz     25.175000 MHz
  Standard Timings: none
  Detailed Timing Descriptors:
    DTD 1:  1280x720    60.000000 Hz  16:9     45.000 kHz     74.250000 MHz (1600 mm x 900 mm)
                 Hfront  220 Hsync  40 Hback  110 Hpol P
                 Vfront   20 Vsync   5 Vback    5 Vpol P
    Display Product Name: 'Dradis'
    Display Range Limits:
      Monitor ranges (GTF): 59-61 Hz V, 30-50 kHz H, max dotclock 80 MHz
    Dummy Descriptor:
  Extension blocks: 1
Checksum: 0x1b

----------------

Block 1, CTA-861 Extension Block:
  Revision: 3
  Underscans IT Video Formats by default
  Native detailed modes: 1
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
Checksum: 0xb1  Unused space in Extension Block: 110 bytes

----------------

edid-decode SHA: SHA DATE

Warnings:

Block 0, Base EDID:
  Detailed Timing Descriptor #1: DTD is similar but not identical to VIC 4.

EDID conformity: PASS

On the KMS side, the EDID received (checked through
/sys/class/drm/card2-HDMI-A-1/edid) is identical (md5sum match).

Once I start the KMS application, the infoframes look decent too:

# edid-decode /sys/class/drm/card2-HDMI-A-1/edid \
  -I /sys/kernel/debug/dri/2/HDMI-A-1/infoframes/audio \
  -I /sys/kernel/debug/dri/2/HDMI-A-1/infoframes/avi \
  -I /sys/kernel/debug/dri/2/HDMI-A-1/infoframes/hdmi \
  -I /sys/kernel/debug/dri/2/HDMI-A-1/infoframes/hdr_drm \
  -I /sys/kernel/debug/dri/2/HDMI-A-1/infoframes/spd

edid-decode (hex):

00 ff ff ff ff ff ff 00 0e 4e 42 00 42 42 42 42
00 22 01 03 81 a0 5a 78 0a 9c 68 a0 57 4a 9b 26
12 48 4c 20 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 01 1d 00 72 51 d0 1e 20 dc 28
45 04 40 84 63 00 00 1e 00 00 00 fc 00 44 72 61
64 69 73 0a 20 20 20 20 20 20 00 00 00 fd 00 3b
3d 1e 32 08 00 0a 20 20 20 20 20 20 00 00 00 10
00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 1b

02 03 11 81 e3 05 00 20 e2 00 4a 65 03 0c 00 10
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 b1

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
    DMT 0x04:   640x480    59.940476 Hz   4:3     31.469 kHz     25.175000 MHz
  Standard Timings: none
  Detailed Timing Descriptors:
    DTD 1:  1280x720    60.000000 Hz  16:9     45.000 kHz     74.250000 MHz (1600 mm x 900 mm)
                 Hfront  220 Hsync  40 Hback  110 Hpol P
                 Vfront   20 Vsync   5 Vback    5 Vpol P
    Display Product Name: 'Dradis'
    Display Range Limits:
      Monitor ranges (GTF): 59-61 Hz V, 30-50 kHz H, max dotclock 80 MHz
    Dummy Descriptor:
  Extension blocks: 1
Checksum: 0x1b

----------------

Block 1, CTA-861 Extension Block:
  Revision: 3
  Underscans IT Video Formats by default
  Native detailed modes: 1
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
Checksum: 0xb1  Unused space in Extension Block: 110 bytes

================

InfoFrame of '/sys/kernel/debug/dri/2/HDMI-A-1/infoframes/audio' was empty.

================

edid-decode InfoFrame (hex):

82 02 0d 4d 12 08 08 00 00 00 00 00 00 00 00 00
00

----------------

HDMI InfoFrame Checksum: 0x4d

AVI InfoFrame
  Version: 2
  Length: 13
  Y: Color Component Sample Format: RGB
  A: Active Format Information Present: Yes
  B: Bar Data Present: Bar Data not present
  S: Scan Information: Composed for an underscanned display
  C: Colorimetry: No Data
  M: Picture Aspect Ratio: No Data
  R: Active Portion Aspect Ratio: 8
  ITC: IT Content: No Data
  EC: Extended Colorimetry: xvYCC601
  Q: RGB Quantization Range: Full Range
  SC: Non-Uniform Picture Scaling: No Known non-uniform scaling
  YQ: YCC Quantization Range: Limited Range
  CN: IT Content Type: Graphics
  PR: Pixel Data Repetition Count: 0
  Line Number of End of Top Bar: 0
  Line Number of Start of Bottom Bar: 0
  Pixel Number of End of Left Bar: 0
  Pixel Number of Start of Right Bar: 0

================

InfoFrame of '/sys/kernel/debug/dri/2/HDMI-A-1/infoframes/hdmi' was empty.

================

InfoFrame of '/sys/kernel/debug/dri/2/HDMI-A-1/infoframes/hdr_drm' was empty.

================

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

My understanding from the AVI Q field is that the signal emitted is,
indeed, using a Full Range RGB quantization. And again, this was working
fine for the Auvidea board, so I think the KMS side is correct.

On the TC358743 end though, when capturing, the bridge does detect a
limited range signal:

# v4l2-ctl -d /dev/v4l-subdev1  --log-status

Status Log:

   [  309.450790] tc358743 5-000f: =================  START STATUS  =================
   [  309.467367] tc358743 5-000f: -----Chip status-----
   [  309.477801] tc358743 5-000f: Chip ID: 0x00
   [  309.486788] tc358743 5-000f: Chip revision: 0x00
   [  309.496228] tc358743 5-000f: Reset: IR: 1, CEC: 0, CSI TX: 0, HDMI: 0
   [  309.509326] tc358743 5-000f: Sleep mode: off
   [  309.518023] tc358743 5-000f: Cable detected (+5V power): yes
   [  309.530049] tc358743 5-000f: DDC lines enabled: yes
   [  309.540552] tc358743 5-000f: Hotplug enabled: yes
   [  309.550776] tc358743 5-000f: CEC enabled: no
   [  309.559489] tc358743 5-000f: -----Signal status-----
   [  309.569589] tc358743 5-000f: TMDS signal detected: yes
   [  309.580029] tc358743 5-000f: Stable sync signal: yes
   [  309.590130] tc358743 5-000f: PHY PLL locked: yes
   [  309.599626] tc358743 5-000f: PHY DE detected: yes
   [  309.616598] tc358743 5-000f: Detected format: 1280x720p60.00 (1650x750)
   [  309.630071] tc358743 5-000f: horizontal: fp = 0, -sync = 370, bp = 0
   [  309.642986] tc358743 5-000f: vertical: fp = 0, -sync = 30, bp = 0
   [  309.655384] tc358743 5-000f: pixelclock: 74250000
   [  309.664967] tc358743 5-000f: flags (0x0):
   [  309.673118] tc358743 5-000f: standards (0x0):
   [  309.681984] tc358743 5-000f: Configured format: 1280x720p60.00 (1650x750)
   [  309.695774] tc358743 5-000f: horizontal: fp = 0, -sync = 370, bp = 0
   [  309.708661] tc358743 5-000f: vertical: fp = 0, -sync = 30, bp = 0
   [  309.721047] tc358743 5-000f: pixelclock: 74250000
   [  309.730601] tc358743 5-000f: flags (0x0):
   [  309.738771] tc358743 5-000f: standards (0x0):
   [  309.747746] tc358743 5-000f: -----CSI-TX status-----
   [  309.757852] tc358743 5-000f: Lanes needed: 2
   [  309.766527] tc358743 5-000f: Lanes in use: 2
   [  309.776027] tc358743 5-000f: Waiting for particular sync signal: no
   [  309.789412] tc358743 5-000f: Transmit mode: yes
   [  309.799290] tc358743 5-000f: Receive mode: no
   [  309.808828] tc358743 5-000f: Stopped: no
   [  309.816804] tc358743 5-000f: Color space: RGB 888 24-bit
   [  309.828666] tc358743 5-000f: -----HDMI status-----
   [  309.838425] tc358743 5-000f: HDCP encrypted content: no
   [  309.849072] tc358743 5-000f: Input color space: RGB limited range
   [  309.862244] tc358743 5-000f: AV Mute: off
   [  309.870999] tc358743 5-000f: Deep color mode: 8-bits per channel
   [  309.885806] tc358743 5-000f: HDMI infoframe: Auxiliary Video Information (AVI), version 2, length 13
   [  309.904411] tc358743 5-000f:     colorspace: RGB
   [  309.913822] tc358743 5-000f:     scan mode: Underscan
   [  309.924112] tc358743 5-000f:     colorimetry: ITU601
   [  309.934204] tc358743 5-000f:     picture aspect: No Data
   [  309.945123] tc358743 5-000f:     active aspect: Same as Picture
   [  309.957191] tc358743 5-000f:     itc: No Data
   [  309.966183] tc358743 5-000f:     extended colorimetry: xvYCC 601
   [  309.978415] tc358743 5-000f:     quantization range: Default
   [  309.989908] tc358743 5-000f:     nups: Unknown Non-uniform Scaling
   [  310.002477] tc358743 5-000f:     video code: 0
   [  310.011518] tc358743 5-000f:     ycc quantization range: Limited
   [  310.023745] tc358743 5-000f:     hdmi content type: Graphics
   [  310.035264] tc358743 5-000f:     pixel repeat: 0
   [  310.044669] tc358743 5-000f:     bar top 0, bottom 0, left 0, right 0
   [  310.057769] tc358743 5-000f: ==================  END STATUS  ==================

The infoframes detected by the bridge look reasonable though, the only
difference being that the quantization range is reported as "default",
even though on the emitting side it's reported as Full Range.

The Input Color space does pick it up as limited though.

It looks like the registers responsible for the quantization selection
and detection are 0x8528, 0x8573, 0x8574, and 0x8576, which, when dumped
while the capture occurs, are:

# v4l2-dbg -d /dev/v4l-subdev1 -g 0x8528 -g 0x8573 -g 0x8574 -g 0x8576
ioctl: VIDIOC_DBG_G_REGISTER
Register 0x00008528 = 1h (1d  00000001b)
Register 0x00008573 = 1h (1d  00000001b)
Register 0x00008574 = 8h (8d  00001000b)
Register 0x00008576 = 0h (0d  00000000b)

And so, while the 0x8576 (VI_REP) register does select RGB_FULL, it
looks like the detected quantization in 0x8528 (VI_STATUS3) is indeed
limited range.

I'm a bit at a loss here, and I cannot make any sense of why this code
was working fine with one board and not the other, while it does look to
me that the signal is indeed properly emitted, but isn't correctly
detected by one variant of the bridge.

Would you have any idea of what's going on?

Thanks!
Maxime

--7az2kpgbjjyvssp6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaBn7CQAKCRAnX84Zoj2+
dqTCAYDfPeeJ/b7eOMjgVz2hDPnXTCljLoIzXHbqPjEM1aozVh5YtbJ8QOZuIhBK
eXbhEtkBgOQQ30PWJqrvWRMigg/W6I9n17LsjrLgYS3HEYrQGIjNYHKHYl5HipdB
PKVa5tVIQg==
=5LRc
-----END PGP SIGNATURE-----

--7az2kpgbjjyvssp6--


