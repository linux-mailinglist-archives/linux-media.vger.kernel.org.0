Return-Path: <linux-media+bounces-31858-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9E3AAC752
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 16:03:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2C5C97B6CAE
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 14:02:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81643280CF1;
	Tue,  6 May 2025 14:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JhqDMCHG"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D9827F19E
	for <linux-media@vger.kernel.org>; Tue,  6 May 2025 14:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746540192; cv=none; b=q1VNOTKjsOTJhsB6ncS34TsyXWoxlUGyNr7WH/sMpXC7RyJQvOMRXBwAvgGzulzc6eskwaVvqI27I4pptXF0qZFXqaJiszjuLd0NMqr9kjis7vq9WnB8dPKEEvJYnFbMA503IRWPGrfzJHGLJqOLrkZCnMmgIfKjvKelLFPsOBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746540192; c=relaxed/simple;
	bh=JI0EGkmcDZKvZiEeXtjxjlGR9nvPIa9Smtz5U/8yHSE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oiNeGtXthVxNoTH4osPF2xSSOYfFKs3o0c7/3K6zIecAL9nFUa2jV9XUwI1Opp70HyEt+UXe56n+L/omNDwzIgvcBGc0tX3gpNol3r+O+DEHXPOgxA9PfN+3jUqZ3oyIW2fEDWGG/hlH40QA2uVhiIFQAIdFkALQsZp8Y0lLddI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JhqDMCHG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746540188;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NwXvGA76S5XwI+O4Y1tffC4qfsxvz5BPY6F4DPLuGZs=;
	b=JhqDMCHGtn6FFAKH72GG+1ID7y9ySfUE0Qes14kAIWUenHyxVgWL3hw6rGMQaLByeBv5Yn
	YDt/bE6GX6Fu5WkbJ/vMESkhT4JgkTzxyb1rOktV68NevYjozo+IsuxIK2J+V285zMYcKo
	WgIuIQ1wn9R3k+BtAfKU4NeV1yejmGs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-ahBMiTCMOfOF62-dB1Sf_g-1; Tue, 06 May 2025 10:03:05 -0400
X-MC-Unique: ahBMiTCMOfOF62-dB1Sf_g-1
X-Mimecast-MFC-AGG-ID: ahBMiTCMOfOF62-dB1Sf_g_1746540184
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-440667e7f92so34095715e9.3
        for <linux-media@vger.kernel.org>; Tue, 06 May 2025 07:03:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746540184; x=1747144984;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NwXvGA76S5XwI+O4Y1tffC4qfsxvz5BPY6F4DPLuGZs=;
        b=tqvwE9FQQUVUcf0UTauA+9BcNetGTZwGDvq4yQCLJspaP+/VvW3AMykYKCtZ3Ap8Mz
         u7ORVeTYwaJi4lqkyu5uDOtCK6HKRH9pMxb8ZiaZZ2l8NpIHV6tqI0fHrUMnK0jWroPw
         0AJIY+hR9VQEKPeHy0J+ftO+UW0KSGJHqbDnmyQqCPfgadU8J35v+sP/ro2ZlNolJSUM
         KpERO2lTPdX/m2owKOyi/xb6KscgO657KxFSe60ii8VQ1o6CD3H9/jIVNPomfbHDwdtx
         Kdlh1Iez9mx8+eO3oP7t7TH1qoAATlEf8QoUP22FGMTd1/UlaryQ3clXeqwySlRBpsF3
         SGhA==
X-Gm-Message-State: AOJu0Yzsh3jzhReNGYOg/55zIZMo5VIQonbk8F+gi7YnDTRp8feTiiCE
	bT2HCp708GXRsSan8M4sMyO4BlKQHRD1PYnei9uuzAG6NGGlXOhiw33lqEKsS6W+6dy8SKEKn+e
	T/nzYFNCeo8eNO2ZX2hDdtEMk+xyLRwx508NA7PzJDQTCf0JLenmckpuEvbpLDiRR1FCU
X-Gm-Gg: ASbGncutx2KC9lGxl4JKMWhRn8FImFm2bvx7L6E5TfriXRArUxIJmQR1eRE9aEB3q+u
	8NmEpGDOLwagl+rORkhtxb75mpnQKds+HyIbAfFBJz4dKy2oc4AToBZp1HbWaW3AIEFwhEiUQMO
	VZNkHT0We/IYZFLTYwjxGHtEOMpT75p+P2W561WjmF16fmHuC8I+rJLbtI9vimWkT8S9lfnsGE1
	fUl6Ei+YA1zHWYSoENcdU6mhCwZTgkFQlFs4/D+BdTdFGWBeH+QlE+/bD2Thjo=
X-Received: by 2002:a5d:5f48:0:b0:39c:13fd:e50e with SMTP id ffacd0b85a97d-3a09fd79f75mr9699337f8f.10.1746540183965;
        Tue, 06 May 2025 07:03:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgKCb4ZtVGTbhBObKUsN3rlIT/4q1EY96meYiWx3Xdd3EcY9YvOb892Mhq7MTdJqfB0EUySA==
X-Received: by 2002:a5d:5f48:0:b0:39c:13fd:e50e with SMTP id ffacd0b85a97d-3a09fd79f75mr9699263f8f.10.1746540183076;
        Tue, 06 May 2025 07:03:03 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b10083sm13924011f8f.62.2025.05.06.07.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 07:03:02 -0700 (PDT)
Date: Tue, 6 May 2025 16:03:02 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: TC358743 RGB Quantization Issue
Message-ID: <20250506-liberal-wine-bustard-8aa8fe@houat>
References: <20250506-spiked-corgi-of-greatness-811fbe@houat>
 <004692be-f4af-4d3a-92e5-73b7c9b62576@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="vo6zn54tkfqvqc2x"
Content-Disposition: inline
In-Reply-To: <004692be-f4af-4d3a-92e5-73b7c9b62576@xs4all.nl>


--vo6zn54tkfqvqc2x
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: TC358743 RGB Quantization Issue
MIME-Version: 1.0

On Tue, May 06, 2025 at 02:44:43PM +0200, Hans Verkuil wrote:
> On 5/6/25 14:05, Maxime Ripard wrote:
> > It's something we've discussed a bit on IRC a few week ago, but I have
> > more data now, and can reproduce it on a mainline 6.13.12.
> >=20
> > I have recently switched from an Auvidea B101
> > (https://auvidea.eu/product/b101-70501/) board to a Geekworm X1301
> > (https://geekworm.com/products/x1301). Both feature a TC358743XBG
> > according to their documentation, but the Auvideo one was bought in
> > 2020-2021, whereas I bought the Geekworm this year, so I guess it could
> > be a newer revision.
> >=20
> > Anyway, I have a v4l2 application on the CSI end of the TC358743 bridge,
> > and a KMS application on the HDMI end. The KMS application sends frame
> > through the HDMI cable, and the v4l2 application checks their integrity
> > using a hash algorithm.
> >=20
> > Everything works nicely with the Auvidea board.
> >=20
> > When I swap the Geekwork one in though, the bridge driver detects the
> > signal as limited range, and all the pixels are off. They are correct
> > though if you account for the full range to limited range conversion.
> >=20
> > The EDID programmed in the bridge is:
> >=20
> > edid-decode (hex):
> >=20
> > 00 ff ff ff ff ff ff 00 0e 4e 42 00 42 42 42 42
> > 00 22 01 03 81 a0 5a 78 0a 9c 68 a0 57 4a 9b 26
> > 12 48 4c 20 00 00 01 01 01 01 01 01 01 01 01 01
> > 01 01 01 01 01 01 01 1d 00 72 51 d0 1e 20 dc 28
> > 45 04 40 84 63 00 00 1e 00 00 00 fc 00 44 72 61
> > 64 69 73 0a 20 20 20 20 20 20 00 00 00 fd 00 3b
> > 3d 1e 32 08 00 0a 20 20 20 20 20 20 00 00 00 10
> > 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 1b
> >=20
> > 02 03 11 81 e3 05 00 20 e2 00 4a 65 03 0c 00 10
> > 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 b1
>=20
> Is the EDID of the Auvidea B101 and the Geekworm X1301 the same?
> I assume you program the EDID yourself and it is the same for both, right?

Yes :)

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
> >                  Hfront  220 Hsync  40 Hback  110 Hpol P
> >                  Vfront   20 Vsync   5 Vback    5 Vpol P
> >     Display Product Name: 'Dradis'
> >     Display Range Limits:
> >       Monitor ranges (GTF): 59-61 Hz V, 30-50 kHz H, max dotclock 80 MHz
> >     Dummy Descriptor:
> >   Extension blocks: 1
> > Checksum: 0x1b
> >=20
> > ----------------
> >=20
> > Block 1, CTA-861 Extension Block:
> >   Revision: 3
> >   Underscans IT Video Formats by default
> >   Native detailed modes: 1
> >   Colorimetry Data Block:
> >     sRGB
> >   Video Capability Data Block:
> >     YCbCr quantization: No Data
> >     RGB quantization: Selectable (via AVI Q)
>=20
> This is important for RGB Quantization Range as it indicates that
> you can explicitly signal the RGB Quantization Range in the AVI InfoFrame
> instead of having to rely on the 'default' behavior.
>=20
> >     PT scan behavior: No Data
> >     IT scan behavior: Always Underscanned
> >     CE scan behavior: Always Underscanned
> >   Vendor-Specific Data Block (HDMI), OUI 00-0C-03:
> >     Source physical address: 1.0.0.0
> > Checksum: 0xb1  Unused space in Extension Block: 110 bytes
> > [root@rpi-ab2f2485 ~]# edid-decode edid-dumps/test-edid.bin --check
> > edid-decode (hex):
> >=20
> > 00 ff ff ff ff ff ff 00 0e 4e 42 00 42 42 42 42
> > 00 22 01 03 81 a0 5a 78 0a 9c 68 a0 57 4a 9b 26
> > 12 48 4c 20 00 00 01 01 01 01 01 01 01 01 01 01
> > 01 01 01 01 01 01 01 1d 00 72 51 d0 1e 20 dc 28
> > 45 04 40 84 63 00 00 1e 00 00 00 fc 00 44 72 61
> > 64 69 73 0a 20 20 20 20 20 20 00 00 00 fd 00 3b
> > 3d 1e 32 08 00 0a 20 20 20 20 20 20 00 00 00 10
> > 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 1b
> >=20
> > 02 03 11 81 e3 05 00 20 e2 00 4a 65 03 0c 00 10
> > 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 b1
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
> >                  Hfront  220 Hsync  40 Hback  110 Hpol P
> >                  Vfront   20 Vsync   5 Vback    5 Vpol P
> >     Display Product Name: 'Dradis'
> >     Display Range Limits:
> >       Monitor ranges (GTF): 59-61 Hz V, 30-50 kHz H, max dotclock 80 MHz
> >     Dummy Descriptor:
> >   Extension blocks: 1
> > Checksum: 0x1b
> >=20
> > ----------------
> >=20
> > Block 1, CTA-861 Extension Block:
> >   Revision: 3
> >   Underscans IT Video Formats by default
> >   Native detailed modes: 1
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
> > Checksum: 0xb1  Unused space in Extension Block: 110 bytes
> >=20
> > ----------------
> >=20
> > edid-decode SHA: SHA DATE
> >=20
> > Warnings:
> >=20
> > Block 0, Base EDID:
> >   Detailed Timing Descriptor #1: DTD is similar but not identical to VI=
C 4.
> >=20
> > EDID conformity: PASS
> >=20
> > On the KMS side, the EDID received (checked through
> > /sys/class/drm/card2-HDMI-A-1/edid) is identical (md5sum match).
> >=20
> > Once I start the KMS application, the infoframes look decent too:
> >=20
> > # edid-decode /sys/class/drm/card2-HDMI-A-1/edid \
> >   -I /sys/kernel/debug/dri/2/HDMI-A-1/infoframes/audio \
> >   -I /sys/kernel/debug/dri/2/HDMI-A-1/infoframes/avi \
> >   -I /sys/kernel/debug/dri/2/HDMI-A-1/infoframes/hdmi \
> >   -I /sys/kernel/debug/dri/2/HDMI-A-1/infoframes/hdr_drm \
> >   -I /sys/kernel/debug/dri/2/HDMI-A-1/infoframes/spd
> >=20
> > edid-decode (hex):
> >=20
> > 00 ff ff ff ff ff ff 00 0e 4e 42 00 42 42 42 42
> > 00 22 01 03 81 a0 5a 78 0a 9c 68 a0 57 4a 9b 26
> > 12 48 4c 20 00 00 01 01 01 01 01 01 01 01 01 01
> > 01 01 01 01 01 01 01 1d 00 72 51 d0 1e 20 dc 28
> > 45 04 40 84 63 00 00 1e 00 00 00 fc 00 44 72 61
> > 64 69 73 0a 20 20 20 20 20 20 00 00 00 fd 00 3b
> > 3d 1e 32 08 00 0a 20 20 20 20 20 20 00 00 00 10
> > 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 1b
> >=20
> > 02 03 11 81 e3 05 00 20 e2 00 4a 65 03 0c 00 10
> > 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 b1
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
> >                  Hfront  220 Hsync  40 Hback  110 Hpol P
> >                  Vfront   20 Vsync   5 Vback    5 Vpol P
> >     Display Product Name: 'Dradis'
> >     Display Range Limits:
> >       Monitor ranges (GTF): 59-61 Hz V, 30-50 kHz H, max dotclock 80 MHz
> >     Dummy Descriptor:
> >   Extension blocks: 1
> > Checksum: 0x1b
> >=20
> > ----------------
> >=20
> > Block 1, CTA-861 Extension Block:
> >   Revision: 3
> >   Underscans IT Video Formats by default
> >   Native detailed modes: 1
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
> > Checksum: 0xb1  Unused space in Extension Block: 110 bytes
> >=20
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >=20
> > InfoFrame of '/sys/kernel/debug/dri/2/HDMI-A-1/infoframes/audio' was em=
pty.
> >=20
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >=20
> > edid-decode InfoFrame (hex):
> >=20
> > 82 02 0d 4d 12 08 08 00 00 00 00 00 00 00 00 00
> > 00
> >=20
> > ----------------
> >=20
> > HDMI InfoFrame Checksum: 0x4d
> >=20
> > AVI InfoFrame
> >   Version: 2
> >   Length: 13
> >   Y: Color Component Sample Format: RGB
> >   A: Active Format Information Present: Yes
> >   B: Bar Data Present: Bar Data not present
> >   S: Scan Information: Composed for an underscanned display
> >   C: Colorimetry: No Data
> >   M: Picture Aspect Ratio: No Data
> >   R: Active Portion Aspect Ratio: 8
> >   ITC: IT Content: No Data
> >   EC: Extended Colorimetry: xvYCC601
> >   Q: RGB Quantization Range: Full Range
>=20
> And that's used here by explicitly signaling Full Range.
>=20
> Are you certain that what is dumped here is also what is transmitted?
> I.e. there is no code that messes with the Q bit?

AFAIK, the infoframe is programmed as is in the KMS driver. I can't be
certain about how the driver behaves though, but see below.

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
> > InfoFrame of '/sys/kernel/debug/dri/2/HDMI-A-1/infoframes/hdmi' was emp=
ty.
> >=20
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >=20
> > InfoFrame of '/sys/kernel/debug/dri/2/HDMI-A-1/infoframes/hdr_drm' was =
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
> > My understanding from the AVI Q field is that the signal emitted is,
> > indeed, using a Full Range RGB quantization. And again, this was working
> > fine for the Auvidea board, so I think the KMS side is correct.
> >=20
> > On the TC358743 end though, when capturing, the bridge does detect a
> > limited range signal:
> >=20
> > # v4l2-ctl -d /dev/v4l-subdev1  --log-status
> >=20
> > Status Log:
> >=20
> >    [  309.450790] tc358743 5-000f: =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D  START STATUS  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> >    [  309.467367] tc358743 5-000f: -----Chip status-----
> >    [  309.477801] tc358743 5-000f: Chip ID: 0x00
> >    [  309.486788] tc358743 5-000f: Chip revision: 0x00
> >    [  309.496228] tc358743 5-000f: Reset: IR: 1, CEC: 0, CSI TX: 0, HDM=
I: 0
> >    [  309.509326] tc358743 5-000f: Sleep mode: off
> >    [  309.518023] tc358743 5-000f: Cable detected (+5V power): yes
> >    [  309.530049] tc358743 5-000f: DDC lines enabled: yes
> >    [  309.540552] tc358743 5-000f: Hotplug enabled: yes
> >    [  309.550776] tc358743 5-000f: CEC enabled: no
> >    [  309.559489] tc358743 5-000f: -----Signal status-----
> >    [  309.569589] tc358743 5-000f: TMDS signal detected: yes
> >    [  309.580029] tc358743 5-000f: Stable sync signal: yes
> >    [  309.590130] tc358743 5-000f: PHY PLL locked: yes
> >    [  309.599626] tc358743 5-000f: PHY DE detected: yes
> >    [  309.616598] tc358743 5-000f: Detected format: 1280x720p60.00 (165=
0x750)
> >    [  309.630071] tc358743 5-000f: horizontal: fp =3D 0, -sync =3D 370,=
 bp =3D 0
> >    [  309.642986] tc358743 5-000f: vertical: fp =3D 0, -sync =3D 30, bp=
 =3D 0
> >    [  309.655384] tc358743 5-000f: pixelclock: 74250000
> >    [  309.664967] tc358743 5-000f: flags (0x0):
> >    [  309.673118] tc358743 5-000f: standards (0x0):
> >    [  309.681984] tc358743 5-000f: Configured format: 1280x720p60.00 (1=
650x750)
> >    [  309.695774] tc358743 5-000f: horizontal: fp =3D 0, -sync =3D 370,=
 bp =3D 0
> >    [  309.708661] tc358743 5-000f: vertical: fp =3D 0, -sync =3D 30, bp=
 =3D 0
> >    [  309.721047] tc358743 5-000f: pixelclock: 74250000
> >    [  309.730601] tc358743 5-000f: flags (0x0):
> >    [  309.738771] tc358743 5-000f: standards (0x0):
> >    [  309.747746] tc358743 5-000f: -----CSI-TX status-----
> >    [  309.757852] tc358743 5-000f: Lanes needed: 2
> >    [  309.766527] tc358743 5-000f: Lanes in use: 2
> >    [  309.776027] tc358743 5-000f: Waiting for particular sync signal: =
no
> >    [  309.789412] tc358743 5-000f: Transmit mode: yes
> >    [  309.799290] tc358743 5-000f: Receive mode: no
> >    [  309.808828] tc358743 5-000f: Stopped: no
> >    [  309.816804] tc358743 5-000f: Color space: RGB 888 24-bit
> >    [  309.828666] tc358743 5-000f: -----HDMI status-----
> >    [  309.838425] tc358743 5-000f: HDCP encrypted content: no
> >    [  309.849072] tc358743 5-000f: Input color space: RGB limited range
> >    [  309.862244] tc358743 5-000f: AV Mute: off
> >    [  309.870999] tc358743 5-000f: Deep color mode: 8-bits per channel
> >    [  309.885806] tc358743 5-000f: HDMI infoframe: Auxiliary Video Info=
rmation (AVI), version 2, length 13
> >    [  309.904411] tc358743 5-000f:     colorspace: RGB
> >    [  309.913822] tc358743 5-000f:     scan mode: Underscan
> >    [  309.924112] tc358743 5-000f:     colorimetry: ITU601
> >    [  309.934204] tc358743 5-000f:     picture aspect: No Data
> >    [  309.945123] tc358743 5-000f:     active aspect: Same as Picture
> >    [  309.957191] tc358743 5-000f:     itc: No Data
> >    [  309.966183] tc358743 5-000f:     extended colorimetry: xvYCC 601
> >    [  309.978415] tc358743 5-000f:     quantization range: Default
> >    [  309.989908] tc358743 5-000f:     nups: Unknown Non-uniform Scaling
> >    [  310.002477] tc358743 5-000f:     video code: 0
> >    [  310.011518] tc358743 5-000f:     ycc quantization range: Limited
> >    [  310.023745] tc358743 5-000f:     hdmi content type: Graphics
> >    [  310.035264] tc358743 5-000f:     pixel repeat: 0
> >    [  310.044669] tc358743 5-000f:     bar top 0, bottom 0, left 0, rig=
ht 0
>=20
> This is definitely a raw dump of the AVI InfoFrame, read directly from
> the registers of the tc358743.
>=20
> Sincxe you see one thing in at the receiver side, and another thing at
> the transmitter side, and it is highly unlikely that the receiver side
> is wrong, then the only thing I can think of is that the AVI InfoFrame
> that you think the transmitter is sending is not actually what is
> transmitted.

I'd still bet on the TC358743 behaving differently.

If I keep things exactly the same on the transmitter side, and on the
receiver side use the exact same system, during the video capture, I
get:

# v4l2-ctl -d /dev/v4l-subdev1  --log-status

Status Log:

   [   94.289872] tc358743 5-000f: =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D  START STATUS  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
   [   94.299064] tc358743 5-000f: -----Chip status-----
   [   94.304595] tc358743 5-000f: Chip ID: 0x00
   [   94.309507] tc358743 5-000f: Chip revision: 0x00
   [   94.314262] tc358743 5-000f: Reset: IR: 1, CEC: 0, CSI TX: 0, HDMI: 0
   [   94.320851] tc358743 5-000f: Sleep mode: off
   [   94.325275] tc358743 5-000f: Cable detected (+5V power): yes
   [   94.331620] tc358743 5-000f: DDC lines enabled: yes
   [   94.337220] tc358743 5-000f: Hotplug enabled: yes
   [   94.342673] tc358743 5-000f: CEC enabled: no
   [   94.347076] tc358743 5-000f: -----Signal status-----
   [   94.352156] tc358743 5-000f: TMDS signal detected: yes
   [   94.357424] tc358743 5-000f: Stable sync signal: yes
   [   94.362500] tc358743 5-000f: PHY PLL locked: yes
   [   94.367219] tc358743 5-000f: PHY DE detected: yes
   [   94.380192] tc358743 5-000f: Detected format: 1280x720p60.00 (1650x75=
0)
   [   94.387225] tc358743 5-000f: horizontal: fp =3D 0, -sync =3D 370, bp =
=3D 0
   [   94.393754] tc358743 5-000f: vertical: fp =3D 0, -sync =3D 30, bp =3D=
 0
   [   94.400012] tc358743 5-000f: pixelclock: 74250000
   [   94.404830] tc358743 5-000f: flags (0x0):
   [   94.408931] tc358743 5-000f: standards (0x0):
   [   94.413403] tc358743 5-000f: Configured format: 1280x720p60.00 (1650x=
750)
   [   94.420340] tc358743 5-000f: horizontal: fp =3D 0, -sync =3D 370, bp =
=3D 0
   [   94.426934] tc358743 5-000f: vertical: fp =3D 0, -sync =3D 30, bp =3D=
 0
   [   94.433180] tc358743 5-000f: pixelclock: 74250000
   [   94.437984] tc358743 5-000f: flags (0x0):
   [   94.442106] tc358743 5-000f: standards (0x0):
   [   94.446574] tc358743 5-000f: -----CSI-TX status-----
   [   94.451645] tc358743 5-000f: Lanes needed: 2
   [   94.456030] tc358743 5-000f: Lanes in use: 2
   [   94.461038] tc358743 5-000f: Waiting for particular sync signal: no
   [   94.468106] tc358743 5-000f: Transmit mode: yes
   [   94.473868] tc358743 5-000f: Receive mode: no
   [   94.478975] tc358743 5-000f: Stopped: no
   [   94.483032] tc358743 5-000f: Color space: RGB 888 24-bit
   [   94.489012] tc358743 5-000f: -----HDMI status-----
   [   94.493945] tc358743 5-000f: HDCP encrypted content: no
   [   94.499314] tc358743 5-000f: Input color space: RGB full range
   [   94.506104] tc358743 5-000f: AV Mute: off
   [   94.511054] tc358743 5-000f: Deep color mode: 8-bits per channel
   [   94.519839] tc358743 5-000f: HDMI infoframe: Auxiliary Video Informat=
ion (AVI), version 2, length 13
   [   94.529179] tc358743 5-000f:     colorspace: RGB
   [   94.533941] tc358743 5-000f:     scan mode: Underscan
   [   94.539121] tc358743 5-000f:     colorimetry: No Data
   [   94.544305] tc358743 5-000f:     picture aspect: No Data
   [   94.549751] tc358743 5-000f:     active aspect: Same as Picture
   [   94.555794] tc358743 5-000f:     itc: No Data
   [   94.560266] tc358743 5-000f:     extended colorimetry: xvYCC 601
   [   94.566427] tc358743 5-000f:     quantization range: Full
   [   94.571998] tc358743 5-000f:     nups: Unknown Non-uniform Scaling
   [   94.578345] tc358743 5-000f:     video code: 0
   [   94.582907] tc358743 5-000f:     ycc quantization range: Limited
   [   94.589045] tc358743 5-000f:     hdmi content type: Graphics
   [   94.594941] tc358743 5-000f:     pixel repeat: 0
   [   94.599705] tc358743 5-000f:     bar top 0, bottom 0, left 0, right 0
   [   94.606306] tc358743 5-000f: =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D  END STATUS  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D

# v4l2-dbg -d /dev/v4l-subdev1 -g 0x8528 -g 0x8573 -g 0x8574 -g 0x8576
ioctl: VIDIOC_DBG_G_REGISTER
Register 0x00008528 =3D 0h (0d  00000000b)
Register 0x00008573 =3D 1h (1d  00000001b)
Register 0x00008574 =3D 8h (8d  00001000b)
Register 0x00008576 =3D 0h (0d  00000000b)

Which definitely looks like the chip on the Auvidea board detects the
quantization differently from the same video feed.

Could it be something like a pin strap on the board that is set
differently and affects the chip behaviour? Or a bit somewhere not being
initialized to what it should and changed default?

Maxime

--vo6zn54tkfqvqc2x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaBoWlQAKCRAnX84Zoj2+
dvkpAXwO0Mi2cZ6LEoLDsnLGua2xfAi/CEHvEtmEHj2xIS/GcbHdyiSj1mmh7Zk6
Y12AGuIBgKAOJv2tAntkvbD24ECg2BqgShadfXM5UcmLN1WewKyFn4GtwAdsyOU7
VkdLcotHow==
=mtEE
-----END PGP SIGNATURE-----

--vo6zn54tkfqvqc2x--


