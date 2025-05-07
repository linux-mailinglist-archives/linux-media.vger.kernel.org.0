Return-Path: <linux-media+bounces-31894-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7769BAAD850
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 09:38:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A3C427B447A
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 07:36:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2AD621FF54;
	Wed,  7 May 2025 07:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hEgyIyUt"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4F820FA86
	for <linux-media@vger.kernel.org>; Wed,  7 May 2025 07:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746603472; cv=none; b=Q4CCpp1YSXPmH/apjKUO+ViGKW9l0UuhfBvztoCGjfH3GD3L6pBS3LQiDkelSV3DzRHcCfbr3JfLsnYWkyRZmXbg9QZCaF6fdQbiVkL8jzIoGkBSSaEm3/rwCDU4r0QCLzwU0p/RUKYLLUWSeJ7ye+pjwglspWdubYL3MdNXZGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746603472; c=relaxed/simple;
	bh=QYBzWSNNYD1zZEc/kSRocO+/rJbYxZUamVeJ5idBbIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fBodL2NgLLLB/Y/kLPdcumXVootuUTzcgDInc0VNAAo1PlSYG175GWwvZiR3SS1udcJApXFrpAPz/O4pZ77doxxvvsCbSC7y1xa9k6IoStsEvrdoF/jBNWSa3O74okzpWSwkBYE/RwZDEsXzUOAy0a1UR96nZIYQvy6wIj9qhzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hEgyIyUt; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746603468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5CKn6n2ZOaOAWxWer6e87ysouXAdwPL22r3LOHGRIV0=;
	b=hEgyIyUtjAoSP1TsblnsvlNUSwR8E+CHQgbbOl50nXznUOnyurukBxlhNU0J7fe7T3FC2M
	k2SuwGFtNn92m4fqtz2ZZqQx1teGmsFuIVknAdhLwVOKmY/SAYAG9iyWitX1HkHSPmhxII
	ycZn9aVIFFJAeQLSwGiuSXekzrFP1+I=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-J4MCwTHrM5GbiSNbvMvPPQ-1; Wed, 07 May 2025 03:37:46 -0400
X-MC-Unique: J4MCwTHrM5GbiSNbvMvPPQ-1
X-Mimecast-MFC-AGG-ID: J4MCwTHrM5GbiSNbvMvPPQ_1746603465
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-391492acb59so3274524f8f.3
        for <linux-media@vger.kernel.org>; Wed, 07 May 2025 00:37:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746603465; x=1747208265;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5CKn6n2ZOaOAWxWer6e87ysouXAdwPL22r3LOHGRIV0=;
        b=X8JA180I4W/jYS/YXESmdix4x5WZTJ0WynYqpuJGcgPq3+THRBHwrLXVlHNL+1KGTI
         B3V2AIAtYPjLI2seJqubpmGIoWgWSnmzXmTgqs6mvpLSSEkfEnCSnzM08t/b8utLEIAK
         5X8YYuZGmvrjEdddDcrcoQrWNIRBbl7Q5XUf9CqK6kmf4HI24SeM6n+GVigM80bQljgq
         zozZkcfdburEFLea7umZ9055sk5c7G5g+Qo3ffdRgzRQmt81VSF/gq8OJFH+OqEdGyxg
         48DZeUYr0NI03c0A4R8j5SWtslih9eJv7T7Z61U+/EfOEnGwAK9AqpcjUB7rSn9Zqlig
         ityw==
X-Gm-Message-State: AOJu0YwlRmFXFMfcj64lO/XtfK5fvkz70OiZESCbiNDAl3C4V6zuDBnP
	pXSsW1D5XVI5FuCzCA+X5W+48dN+w8IBXNWSE8uxhTLazkCLY91NhgReYAggqo7laOu0kTHrBBg
	zSn13b+k3I+pWthn5Z3u13qCddaoUgLmhuYjuVinbvfRWaLhoRI2rvcYmlPbM
X-Gm-Gg: ASbGncsAX0JBaHK/jO8rfmytGXM1bbpAEmcGo9+3UO3Kkhfep8B4w6Br1pdzyxmQFa8
	dUE0rtT21vdH6C2npqfYyBl3M0vRxwhSqFATERxrmir8OR2RZqJpv2r5lA9+GNuJOP3DIqU72Qe
	F9dCAGdks65Ud3MlLyFk3jgKqzfQ15ZPXQXs8f5pNLqmJO26HjVhpCvfnNZKg7KZ4D2y9qbsTXR
	1VPxF/IvLGonGtqj1Ta/biYAjaBajWzxBeXKsryGJ74PhKNBS83XXnBvV0C+gU=
X-Received: by 2002:a5d:5f4f:0:b0:3a0:83b1:b3c1 with SMTP id ffacd0b85a97d-3a0b49a8129mr1857988f8f.15.1746603464475;
        Wed, 07 May 2025 00:37:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIcqP/ZCeYCtuWz0ou4XjsDu2gg2YgKZ02j/7gQlFNCVtwaR1ddcKza6STEXWEbyljDZdd/g==
X-Received: by 2002:a5d:5f4f:0:b0:3a0:83b1:b3c1 with SMTP id ffacd0b85a97d-3a0b49a8129mr1857957f8f.15.1746603463911;
        Wed, 07 May 2025 00:37:43 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae3441sm15758078f8f.26.2025.05.07.00.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 00:37:43 -0700 (PDT)
Date: Wed, 7 May 2025 09:37:42 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: TC358743 RGB Quantization Issue
Message-ID: <20250507-marvellous-silver-jaguarundi-4ab9c5@houat>
References: <20250506-spiked-corgi-of-greatness-811fbe@houat>
 <004692be-f4af-4d3a-92e5-73b7c9b62576@xs4all.nl>
 <20250506-liberal-wine-bustard-8aa8fe@houat>
 <f0ac05fb-2bc0-4963-9da6-c322395bd294@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="6xpwrrdbja223ot4"
Content-Disposition: inline
In-Reply-To: <f0ac05fb-2bc0-4963-9da6-c322395bd294@xs4all.nl>


--6xpwrrdbja223ot4
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: TC358743 RGB Quantization Issue
MIME-Version: 1.0

On Tue, May 06, 2025 at 06:04:26PM +0200, Hans Verkuil wrote:
> On 06/05/2025 16:03, Maxime Ripard wrote:
> > On Tue, May 06, 2025 at 02:44:43PM +0200, Hans Verkuil wrote:
> >> On 5/6/25 14:05, Maxime Ripard wrote:
> >>> It's something we've discussed a bit on IRC a few week ago, but I have
> >>> more data now, and can reproduce it on a mainline 6.13.12.
> >>>
> >>> I have recently switched from an Auvidea B101
> >>> (https://auvidea.eu/product/b101-70501/) board to a Geekworm X1301
> >>> (https://geekworm.com/products/x1301). Both feature a TC358743XBG
> >>> according to their documentation, but the Auvideo one was bought in
> >>> 2020-2021, whereas I bought the Geekworm this year, so I guess it cou=
ld
> >>> be a newer revision.
> >>>
> >>> Anyway, I have a v4l2 application on the CSI end of the TC358743 brid=
ge,
> >>> and a KMS application on the HDMI end. The KMS application sends frame
> >>> through the HDMI cable, and the v4l2 application checks their integri=
ty
> >>> using a hash algorithm.
> >>>
> >>> Everything works nicely with the Auvidea board.
> >>>
> >>> When I swap the Geekwork one in though, the bridge driver detects the
> >>> signal as limited range, and all the pixels are off. They are correct
> >>> though if you account for the full range to limited range conversion.
> >>>
> >>> The EDID programmed in the bridge is:
> >>>
> >>> edid-decode (hex):
> >>>
> >>> 00 ff ff ff ff ff ff 00 0e 4e 42 00 42 42 42 42
> >>> 00 22 01 03 81 a0 5a 78 0a 9c 68 a0 57 4a 9b 26
> >>> 12 48 4c 20 00 00 01 01 01 01 01 01 01 01 01 01
> >>> 01 01 01 01 01 01 01 1d 00 72 51 d0 1e 20 dc 28
> >>> 45 04 40 84 63 00 00 1e 00 00 00 fc 00 44 72 61
> >>> 64 69 73 0a 20 20 20 20 20 20 00 00 00 fd 00 3b
> >>> 3d 1e 32 08 00 0a 20 20 20 20 20 20 00 00 00 10
> >>> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 1b
> >>>
> >>> 02 03 11 81 e3 05 00 20 e2 00 4a 65 03 0c 00 10
> >>> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> >>> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> >>> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> >>> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> >>> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> >>> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> >>> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 b1
> >>
> >> Is the EDID of the Auvidea B101 and the Geekworm X1301 the same?
> >> I assume you program the EDID yourself and it is the same for both, ri=
ght?
> >=20
> > Yes :)
> >=20
> >>> ----------------
> >>>
> >>> Block 0, Base EDID:
> >>>   EDID Structure Version & Revision: 1.3
> >>>   Vendor & Product Identification:
> >>>     Manufacturer: CRN
> >>>     Model: 66
> >>>     Serial Number: 1111638594 (0x42424242)
> >>>     Made in: 2024
> >>>   Basic Display Parameters & Features:
> >>>     Digital display
> >>>     DFP 1.x compatible TMDS
> >>>     Maximum image size: 160 cm x 90 cm
> >>>     Gamma: 2.20
> >>>     RGB color display
> >>>     First detailed timing is the preferred timing
> >>>   Color Characteristics:
> >>>     Red  : 0.6269, 0.3408
> >>>     Green: 0.2919, 0.6054
> >>>     Blue : 0.1494, 0.0722
> >>>     White: 0.2832, 0.2968
> >>>   Established Timings I & II:
> >>>     DMT 0x04:   640x480    59.940476 Hz   4:3     31.469 kHz     25.1=
75000 MHz
> >>>   Standard Timings: none
> >>>   Detailed Timing Descriptors:
> >>>     DTD 1:  1280x720    60.000000 Hz  16:9     45.000 kHz     74.2500=
00 MHz (1600 mm x 900 mm)
> >>>                  Hfront  220 Hsync  40 Hback  110 Hpol P
> >>>                  Vfront   20 Vsync   5 Vback    5 Vpol P
> >>>     Display Product Name: 'Dradis'
> >>>     Display Range Limits:
> >>>       Monitor ranges (GTF): 59-61 Hz V, 30-50 kHz H, max dotclock 80 =
MHz
> >>>     Dummy Descriptor:
> >>>   Extension blocks: 1
> >>> Checksum: 0x1b
> >>>
> >>> ----------------
> >>>
> >>> Block 1, CTA-861 Extension Block:
> >>>   Revision: 3
> >>>   Underscans IT Video Formats by default
> >>>   Native detailed modes: 1
> >>>   Colorimetry Data Block:
> >>>     sRGB
> >>>   Video Capability Data Block:
> >>>     YCbCr quantization: No Data
> >>>     RGB quantization: Selectable (via AVI Q)
> >>
> >> This is important for RGB Quantization Range as it indicates that
> >> you can explicitly signal the RGB Quantization Range in the AVI InfoFr=
ame
> >> instead of having to rely on the 'default' behavior.
> >>
> >>>     PT scan behavior: No Data
> >>>     IT scan behavior: Always Underscanned
> >>>     CE scan behavior: Always Underscanned
> >>>   Vendor-Specific Data Block (HDMI), OUI 00-0C-03:
> >>>     Source physical address: 1.0.0.0
> >>> Checksum: 0xb1  Unused space in Extension Block: 110 bytes
> >>> [root@rpi-ab2f2485 ~]# edid-decode edid-dumps/test-edid.bin --check
> >>> edid-decode (hex):
> >>>
> >>> 00 ff ff ff ff ff ff 00 0e 4e 42 00 42 42 42 42
> >>> 00 22 01 03 81 a0 5a 78 0a 9c 68 a0 57 4a 9b 26
> >>> 12 48 4c 20 00 00 01 01 01 01 01 01 01 01 01 01
> >>> 01 01 01 01 01 01 01 1d 00 72 51 d0 1e 20 dc 28
> >>> 45 04 40 84 63 00 00 1e 00 00 00 fc 00 44 72 61
> >>> 64 69 73 0a 20 20 20 20 20 20 00 00 00 fd 00 3b
> >>> 3d 1e 32 08 00 0a 20 20 20 20 20 20 00 00 00 10
> >>> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 1b
> >>>
> >>> 02 03 11 81 e3 05 00 20 e2 00 4a 65 03 0c 00 10
> >>> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> >>> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> >>> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> >>> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> >>> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> >>> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> >>> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 b1
> >>>
> >>> ----------------
> >>>
> >>> Block 0, Base EDID:
> >>>   EDID Structure Version & Revision: 1.3
> >>>   Vendor & Product Identification:
> >>>     Manufacturer: CRN
> >>>     Model: 66
> >>>     Serial Number: 1111638594 (0x42424242)
> >>>     Made in: 2024
> >>>   Basic Display Parameters & Features:
> >>>     Digital display
> >>>     DFP 1.x compatible TMDS
> >>>     Maximum image size: 160 cm x 90 cm
> >>>     Gamma: 2.20
> >>>     RGB color display
> >>>     First detailed timing is the preferred timing
> >>>   Color Characteristics:
> >>>     Red  : 0.6269, 0.3408
> >>>     Green: 0.2919, 0.6054
> >>>     Blue : 0.1494, 0.0722
> >>>     White: 0.2832, 0.2968
> >>>   Established Timings I & II:
> >>>     DMT 0x04:   640x480    59.940476 Hz   4:3     31.469 kHz     25.1=
75000 MHz
> >>>   Standard Timings: none
> >>>   Detailed Timing Descriptors:
> >>>     DTD 1:  1280x720    60.000000 Hz  16:9     45.000 kHz     74.2500=
00 MHz (1600 mm x 900 mm)
> >>>                  Hfront  220 Hsync  40 Hback  110 Hpol P
> >>>                  Vfront   20 Vsync   5 Vback    5 Vpol P
> >>>     Display Product Name: 'Dradis'
> >>>     Display Range Limits:
> >>>       Monitor ranges (GTF): 59-61 Hz V, 30-50 kHz H, max dotclock 80 =
MHz
> >>>     Dummy Descriptor:
> >>>   Extension blocks: 1
> >>> Checksum: 0x1b
> >>>
> >>> ----------------
> >>>
> >>> Block 1, CTA-861 Extension Block:
> >>>   Revision: 3
> >>>   Underscans IT Video Formats by default
> >>>   Native detailed modes: 1
> >>>   Colorimetry Data Block:
> >>>     sRGB
> >>>   Video Capability Data Block:
> >>>     YCbCr quantization: No Data
> >>>     RGB quantization: Selectable (via AVI Q)
> >>>     PT scan behavior: No Data
> >>>     IT scan behavior: Always Underscanned
> >>>     CE scan behavior: Always Underscanned
> >>>   Vendor-Specific Data Block (HDMI), OUI 00-0C-03:
> >>>     Source physical address: 1.0.0.0
> >>> Checksum: 0xb1  Unused space in Extension Block: 110 bytes
> >>>
> >>> ----------------
> >>>
> >>> edid-decode SHA: SHA DATE
> >>>
> >>> Warnings:
> >>>
> >>> Block 0, Base EDID:
> >>>   Detailed Timing Descriptor #1: DTD is similar but not identical to =
VIC 4.
> >>>
> >>> EDID conformity: PASS
> >>>
> >>> On the KMS side, the EDID received (checked through
> >>> /sys/class/drm/card2-HDMI-A-1/edid) is identical (md5sum match).
> >>>
> >>> Once I start the KMS application, the infoframes look decent too:
> >>>
> >>> # edid-decode /sys/class/drm/card2-HDMI-A-1/edid \
> >>>   -I /sys/kernel/debug/dri/2/HDMI-A-1/infoframes/audio \
> >>>   -I /sys/kernel/debug/dri/2/HDMI-A-1/infoframes/avi \
> >>>   -I /sys/kernel/debug/dri/2/HDMI-A-1/infoframes/hdmi \
> >>>   -I /sys/kernel/debug/dri/2/HDMI-A-1/infoframes/hdr_drm \
> >>>   -I /sys/kernel/debug/dri/2/HDMI-A-1/infoframes/spd
> >>>
> >>> edid-decode (hex):
> >>>
> >>> 00 ff ff ff ff ff ff 00 0e 4e 42 00 42 42 42 42
> >>> 00 22 01 03 81 a0 5a 78 0a 9c 68 a0 57 4a 9b 26
> >>> 12 48 4c 20 00 00 01 01 01 01 01 01 01 01 01 01
> >>> 01 01 01 01 01 01 01 1d 00 72 51 d0 1e 20 dc 28
> >>> 45 04 40 84 63 00 00 1e 00 00 00 fc 00 44 72 61
> >>> 64 69 73 0a 20 20 20 20 20 20 00 00 00 fd 00 3b
> >>> 3d 1e 32 08 00 0a 20 20 20 20 20 20 00 00 00 10
> >>> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 1b
> >>>
> >>> 02 03 11 81 e3 05 00 20 e2 00 4a 65 03 0c 00 10
> >>> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> >>> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> >>> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> >>> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> >>> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> >>> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> >>> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 b1
> >>>
> >>> ----------------
> >>>
> >>> Block 0, Base EDID:
> >>>   EDID Structure Version & Revision: 1.3
> >>>   Vendor & Product Identification:
> >>>     Manufacturer: CRN
> >>>     Model: 66
> >>>     Serial Number: 1111638594 (0x42424242)
> >>>     Made in: 2024
> >>>   Basic Display Parameters & Features:
> >>>     Digital display
> >>>     DFP 1.x compatible TMDS
> >>>     Maximum image size: 160 cm x 90 cm
> >>>     Gamma: 2.20
> >>>     RGB color display
> >>>     First detailed timing is the preferred timing
> >>>   Color Characteristics:
> >>>     Red  : 0.6269, 0.3408
> >>>     Green: 0.2919, 0.6054
> >>>     Blue : 0.1494, 0.0722
> >>>     White: 0.2832, 0.2968
> >>>   Established Timings I & II:
> >>>     DMT 0x04:   640x480    59.940476 Hz   4:3     31.469 kHz     25.1=
75000 MHz
> >>>   Standard Timings: none
> >>>   Detailed Timing Descriptors:
> >>>     DTD 1:  1280x720    60.000000 Hz  16:9     45.000 kHz     74.2500=
00 MHz (1600 mm x 900 mm)
> >>>                  Hfront  220 Hsync  40 Hback  110 Hpol P
> >>>                  Vfront   20 Vsync   5 Vback    5 Vpol P
> >>>     Display Product Name: 'Dradis'
> >>>     Display Range Limits:
> >>>       Monitor ranges (GTF): 59-61 Hz V, 30-50 kHz H, max dotclock 80 =
MHz
> >>>     Dummy Descriptor:
> >>>   Extension blocks: 1
> >>> Checksum: 0x1b
> >>>
> >>> ----------------
> >>>
> >>> Block 1, CTA-861 Extension Block:
> >>>   Revision: 3
> >>>   Underscans IT Video Formats by default
> >>>   Native detailed modes: 1
> >>>   Colorimetry Data Block:
> >>>     sRGB
> >>>   Video Capability Data Block:
> >>>     YCbCr quantization: No Data
> >>>     RGB quantization: Selectable (via AVI Q)
> >>>     PT scan behavior: No Data
> >>>     IT scan behavior: Always Underscanned
> >>>     CE scan behavior: Always Underscanned
> >>>   Vendor-Specific Data Block (HDMI), OUI 00-0C-03:
> >>>     Source physical address: 1.0.0.0
> >>> Checksum: 0xb1  Unused space in Extension Block: 110 bytes
> >>>
> >>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>>
> >>> InfoFrame of '/sys/kernel/debug/dri/2/HDMI-A-1/infoframes/audio' was =
empty.
> >>>
> >>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>>
> >>> edid-decode InfoFrame (hex):
> >>>
> >>> 82 02 0d 4d 12 08 08 00 00 00 00 00 00 00 00 00
> >>> 00
> >>>
> >>> ----------------
> >>>
> >>> HDMI InfoFrame Checksum: 0x4d
> >>>
> >>> AVI InfoFrame
> >>>   Version: 2
> >>>   Length: 13
> >>>   Y: Color Component Sample Format: RGB
> >>>   A: Active Format Information Present: Yes
> >>>   B: Bar Data Present: Bar Data not present
> >>>   S: Scan Information: Composed for an underscanned display
> >>>   C: Colorimetry: No Data
> >>>   M: Picture Aspect Ratio: No Data
> >>>   R: Active Portion Aspect Ratio: 8
> >>>   ITC: IT Content: No Data
> >>>   EC: Extended Colorimetry: xvYCC601
> >>>   Q: RGB Quantization Range: Full Range
> >>
> >> And that's used here by explicitly signaling Full Range.
> >>
> >> Are you certain that what is dumped here is also what is transmitted?
> >> I.e. there is no code that messes with the Q bit?
> >=20
> > AFAIK, the infoframe is programmed as is in the KMS driver. I can't be
> > certain about how the driver behaves though, but see below.
> >=20
> >>>   SC: Non-Uniform Picture Scaling: No Known non-uniform scaling
> >>>   YQ: YCC Quantization Range: Limited Range
> >>>   CN: IT Content Type: Graphics
> >>>   PR: Pixel Data Repetition Count: 0
> >>>   Line Number of End of Top Bar: 0
> >>>   Line Number of Start of Bottom Bar: 0
> >>>   Pixel Number of End of Left Bar: 0
> >>>   Pixel Number of Start of Right Bar: 0
> >>>
> >>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>>
> >>> InfoFrame of '/sys/kernel/debug/dri/2/HDMI-A-1/infoframes/hdmi' was e=
mpty.
> >>>
> >>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>>
> >>> InfoFrame of '/sys/kernel/debug/dri/2/HDMI-A-1/infoframes/hdr_drm' wa=
s empty.
> >>>
> >>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>>
> >>> edid-decode InfoFrame (hex):
> >>>
> >>> 83 01 19 93 42 72 6f 61 64 63 6f 6d 56 69 64 65
> >>> 6f 63 6f 72 65 00 00 00 00 00 00 00 09
> >>>
> >>> ----------------
> >>>
> >>> HDMI InfoFrame Checksum: 0x93
> >>>
> >>> Source Product Description InfoFrame
> >>>   Version: 1
> >>>   Length: 25
> >>>   Vendor Name: 'Broadcom'
> >>>   Product Description: 'Videocore'
> >>>   Source Information: PC general
> >>>
> >>> My understanding from the AVI Q field is that the signal emitted is,
> >>> indeed, using a Full Range RGB quantization. And again, this was work=
ing
> >>> fine for the Auvidea board, so I think the KMS side is correct.
> >>>
> >>> On the TC358743 end though, when capturing, the bridge does detect a
> >>> limited range signal:
> >>>
> >>> # v4l2-ctl -d /dev/v4l-subdev1  --log-status
> >>>
> >>> Status Log:
> >>>
> >>>    [  309.450790] tc358743 5-000f: =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D  START STATUS  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> >>>    [  309.467367] tc358743 5-000f: -----Chip status-----
> >>>    [  309.477801] tc358743 5-000f: Chip ID: 0x00
> >>>    [  309.486788] tc358743 5-000f: Chip revision: 0x00
> >>>    [  309.496228] tc358743 5-000f: Reset: IR: 1, CEC: 0, CSI TX: 0, H=
DMI: 0
> >>>    [  309.509326] tc358743 5-000f: Sleep mode: off
> >>>    [  309.518023] tc358743 5-000f: Cable detected (+5V power): yes
> >>>    [  309.530049] tc358743 5-000f: DDC lines enabled: yes
> >>>    [  309.540552] tc358743 5-000f: Hotplug enabled: yes
> >>>    [  309.550776] tc358743 5-000f: CEC enabled: no
> >>>    [  309.559489] tc358743 5-000f: -----Signal status-----
> >>>    [  309.569589] tc358743 5-000f: TMDS signal detected: yes
> >>>    [  309.580029] tc358743 5-000f: Stable sync signal: yes
> >>>    [  309.590130] tc358743 5-000f: PHY PLL locked: yes
> >>>    [  309.599626] tc358743 5-000f: PHY DE detected: yes
> >>>    [  309.616598] tc358743 5-000f: Detected format: 1280x720p60.00 (1=
650x750)
> >>>    [  309.630071] tc358743 5-000f: horizontal: fp =3D 0, -sync =3D 37=
0, bp =3D 0
> >>>    [  309.642986] tc358743 5-000f: vertical: fp =3D 0, -sync =3D 30, =
bp =3D 0
> >>>    [  309.655384] tc358743 5-000f: pixelclock: 74250000
> >>>    [  309.664967] tc358743 5-000f: flags (0x0):
> >>>    [  309.673118] tc358743 5-000f: standards (0x0):
> >>>    [  309.681984] tc358743 5-000f: Configured format: 1280x720p60.00 =
(1650x750)
> >>>    [  309.695774] tc358743 5-000f: horizontal: fp =3D 0, -sync =3D 37=
0, bp =3D 0
> >>>    [  309.708661] tc358743 5-000f: vertical: fp =3D 0, -sync =3D 30, =
bp =3D 0
> >>>    [  309.721047] tc358743 5-000f: pixelclock: 74250000
> >>>    [  309.730601] tc358743 5-000f: flags (0x0):
> >>>    [  309.738771] tc358743 5-000f: standards (0x0):
> >>>    [  309.747746] tc358743 5-000f: -----CSI-TX status-----
> >>>    [  309.757852] tc358743 5-000f: Lanes needed: 2
> >>>    [  309.766527] tc358743 5-000f: Lanes in use: 2
> >>>    [  309.776027] tc358743 5-000f: Waiting for particular sync signal=
: no
> >>>    [  309.789412] tc358743 5-000f: Transmit mode: yes
> >>>    [  309.799290] tc358743 5-000f: Receive mode: no
> >>>    [  309.808828] tc358743 5-000f: Stopped: no
> >>>    [  309.816804] tc358743 5-000f: Color space: RGB 888 24-bit
> >>>    [  309.828666] tc358743 5-000f: -----HDMI status-----
> >>>    [  309.838425] tc358743 5-000f: HDCP encrypted content: no
> >>>    [  309.849072] tc358743 5-000f: Input color space: RGB limited ran=
ge
> >>>    [  309.862244] tc358743 5-000f: AV Mute: off
> >>>    [  309.870999] tc358743 5-000f: Deep color mode: 8-bits per channel
> >>>    [  309.885806] tc358743 5-000f: HDMI infoframe: Auxiliary Video In=
formation (AVI), version 2, length 13
> >>>    [  309.904411] tc358743 5-000f:     colorspace: RGB
> >>>    [  309.913822] tc358743 5-000f:     scan mode: Underscan
> >>>    [  309.924112] tc358743 5-000f:     colorimetry: ITU601
> >>>    [  309.934204] tc358743 5-000f:     picture aspect: No Data
> >>>    [  309.945123] tc358743 5-000f:     active aspect: Same as Picture
> >>>    [  309.957191] tc358743 5-000f:     itc: No Data
> >>>    [  309.966183] tc358743 5-000f:     extended colorimetry: xvYCC 601
> >>>    [  309.978415] tc358743 5-000f:     quantization range: Default
> >>>    [  309.989908] tc358743 5-000f:     nups: Unknown Non-uniform Scal=
ing
> >>>    [  310.002477] tc358743 5-000f:     video code: 0
> >>>    [  310.011518] tc358743 5-000f:     ycc quantization range: Limited
> >>>    [  310.023745] tc358743 5-000f:     hdmi content type: Graphics
> >>>    [  310.035264] tc358743 5-000f:     pixel repeat: 0
> >>>    [  310.044669] tc358743 5-000f:     bar top 0, bottom 0, left 0, r=
ight 0
> >>
> >> This is definitely a raw dump of the AVI InfoFrame, read directly from
> >> the registers of the tc358743.
> >>
> >> Sincxe you see one thing in at the receiver side, and another thing at
> >> the transmitter side, and it is highly unlikely that the receiver side
> >> is wrong, then the only thing I can think of is that the AVI InfoFrame
> >> that you think the transmitter is sending is not actually what is
> >> transmitted.
> >=20
> > I'd still bet on the TC358743 behaving differently.
> >=20
> > If I keep things exactly the same on the transmitter side, and on the
> > receiver side use the exact same system, during the video capture, I
> > get:
> >=20
> > # v4l2-ctl -d /dev/v4l-subdev1  --log-status
> >=20
> > Status Log:
> >=20
> >    [   94.289872] tc358743 5-000f: =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D  START STATUS  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> >    [   94.299064] tc358743 5-000f: -----Chip status-----
> >    [   94.304595] tc358743 5-000f: Chip ID: 0x00
> >    [   94.309507] tc358743 5-000f: Chip revision: 0x00
> >    [   94.314262] tc358743 5-000f: Reset: IR: 1, CEC: 0, CSI TX: 0, HDM=
I: 0
> >    [   94.320851] tc358743 5-000f: Sleep mode: off
> >    [   94.325275] tc358743 5-000f: Cable detected (+5V power): yes
> >    [   94.331620] tc358743 5-000f: DDC lines enabled: yes
> >    [   94.337220] tc358743 5-000f: Hotplug enabled: yes
> >    [   94.342673] tc358743 5-000f: CEC enabled: no
> >    [   94.347076] tc358743 5-000f: -----Signal status-----
> >    [   94.352156] tc358743 5-000f: TMDS signal detected: yes
> >    [   94.357424] tc358743 5-000f: Stable sync signal: yes
> >    [   94.362500] tc358743 5-000f: PHY PLL locked: yes
> >    [   94.367219] tc358743 5-000f: PHY DE detected: yes
> >    [   94.380192] tc358743 5-000f: Detected format: 1280x720p60.00 (165=
0x750)
> >    [   94.387225] tc358743 5-000f: horizontal: fp =3D 0, -sync =3D 370,=
 bp =3D 0
> >    [   94.393754] tc358743 5-000f: vertical: fp =3D 0, -sync =3D 30, bp=
 =3D 0
> >    [   94.400012] tc358743 5-000f: pixelclock: 74250000
> >    [   94.404830] tc358743 5-000f: flags (0x0):
> >    [   94.408931] tc358743 5-000f: standards (0x0):
> >    [   94.413403] tc358743 5-000f: Configured format: 1280x720p60.00 (1=
650x750)
> >    [   94.420340] tc358743 5-000f: horizontal: fp =3D 0, -sync =3D 370,=
 bp =3D 0
> >    [   94.426934] tc358743 5-000f: vertical: fp =3D 0, -sync =3D 30, bp=
 =3D 0
> >    [   94.433180] tc358743 5-000f: pixelclock: 74250000
> >    [   94.437984] tc358743 5-000f: flags (0x0):
> >    [   94.442106] tc358743 5-000f: standards (0x0):
> >    [   94.446574] tc358743 5-000f: -----CSI-TX status-----
> >    [   94.451645] tc358743 5-000f: Lanes needed: 2
> >    [   94.456030] tc358743 5-000f: Lanes in use: 2
> >    [   94.461038] tc358743 5-000f: Waiting for particular sync signal: =
no
> >    [   94.468106] tc358743 5-000f: Transmit mode: yes
> >    [   94.473868] tc358743 5-000f: Receive mode: no
> >    [   94.478975] tc358743 5-000f: Stopped: no
> >    [   94.483032] tc358743 5-000f: Color space: RGB 888 24-bit
> >    [   94.489012] tc358743 5-000f: -----HDMI status-----
> >    [   94.493945] tc358743 5-000f: HDCP encrypted content: no
> >    [   94.499314] tc358743 5-000f: Input color space: RGB full range
> >    [   94.506104] tc358743 5-000f: AV Mute: off
> >    [   94.511054] tc358743 5-000f: Deep color mode: 8-bits per channel
> >    [   94.519839] tc358743 5-000f: HDMI infoframe: Auxiliary Video Info=
rmation (AVI), version 2, length 13
> >    [   94.529179] tc358743 5-000f:     colorspace: RGB
> >    [   94.533941] tc358743 5-000f:     scan mode: Underscan
> >    [   94.539121] tc358743 5-000f:     colorimetry: No Data
> >    [   94.544305] tc358743 5-000f:     picture aspect: No Data
> >    [   94.549751] tc358743 5-000f:     active aspect: Same as Picture
> >    [   94.555794] tc358743 5-000f:     itc: No Data
> >    [   94.560266] tc358743 5-000f:     extended colorimetry: xvYCC 601
> >    [   94.566427] tc358743 5-000f:     quantization range: Full
> >    [   94.571998] tc358743 5-000f:     nups: Unknown Non-uniform Scaling
> >    [   94.578345] tc358743 5-000f:     video code: 0
> >    [   94.582907] tc358743 5-000f:     ycc quantization range: Limited
> >    [   94.589045] tc358743 5-000f:     hdmi content type: Graphics
> >    [   94.594941] tc358743 5-000f:     pixel repeat: 0
> >    [   94.599705] tc358743 5-000f:     bar top 0, bottom 0, left 0, rig=
ht 0
> >    [   94.606306] tc358743 5-000f: =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D  END STATUS  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> >=20
> > # v4l2-dbg -d /dev/v4l-subdev1 -g 0x8528 -g 0x8573 -g 0x8574 -g 0x8576
> > ioctl: VIDIOC_DBG_G_REGISTER
> > Register 0x00008528 =3D 0h (0d  00000000b)
> > Register 0x00008573 =3D 1h (1d  00000001b)
> > Register 0x00008574 =3D 8h (8d  00001000b)
> > Register 0x00008576 =3D 0h (0d  00000000b)
> >=20
> > Which definitely looks like the chip on the Auvidea board detects the
> > quantization differently from the same video feed.
> >=20
> > Could it be something like a pin strap on the board that is set
> > differently and affects the chip behaviour? Or a bit somewhere not being
> > initialized to what it should and changed default?
>=20
> Can you dump the value of register 0x8570? Is it different for the two bo=
ards?

On the Auvidea (working) one:
# v4l2-dbg -d /dev/v4l-subdev1 -g 0x8570
ioctl: VIDIOC_DBG_G_REGISTER
Register 0x00008570 =3D e6h (230d  11100110b)

On the Geekworm (broken) one:
# v4l2-dbg -d /dev/v4l-subdev1 -g 0x8570
ioctl: VIDIOC_DBG_G_REGISTER
Register 0x00008570 =3D e6h (230d  11100110b)

So both are identical

Maxime

--6xpwrrdbja223ot4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaBsNuwAKCRAnX84Zoj2+
du+2AX4yUKicMHlEIvJZD9ALnEers2ytf9n3d6MdSGaH+Ekbvpn7iD3c1WrH9qX2
dEG52f0BgPlTECe1S7uJxPpqePPcLQxK231JFX86+p5YUnGLJI5IYRoCK7+w9lOF
W2q8QfMU2w==
=Ne22
-----END PGP SIGNATURE-----

--6xpwrrdbja223ot4--


