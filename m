Return-Path: <linux-media+bounces-31975-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACEAAAE262
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 16:17:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6DE0F9A30BB
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 14:11:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70EEF28B50F;
	Wed,  7 May 2025 13:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.b="cgXrgd3R"
X-Original-To: linux-media@vger.kernel.org
Received: from dane.soverin.net (dane.soverin.net [185.233.34.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FB8288CA8
	for <linux-media@vger.kernel.org>; Wed,  7 May 2025 13:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.34.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746626282; cv=none; b=HHbPELYvAtkqwOlXMyVhrE5VKtcgPfRwZIUXN2OvrQbkRE7NvAJ/7EAIJKPaYbsHHE3dtzbEfopeFB9KAijMSMbrhcBd+sUoDZ93EnlwUR7W8m8rPxa7dv/7tWz7PBydq0M6BWxTPPcg4hjTjry7zmvOQN3xcaBUys62o/m6JII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746626282; c=relaxed/simple;
	bh=3AXyx5qPToiYGbpHgfVoIs6he7KDhDMzs3n+4m6q2Ec=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D3stF87YzFyxfyCq/2w0enKVxyehta1AuBAPg9caxlvFvfe2EG8EXOOHz5ffnaId7YTZzkVEWYP0gVCls82t1VQUYWxkfpE/htzI5UNWJ2ejvxVPl+XzrVvCaNS/DJgkbJi4PpeM2pA4OGGSwWRNDU5uZp6ZHuk6SUHlphnyOi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jjverkuil.nl; spf=pass smtp.mailfrom=jjverkuil.nl; dkim=pass (2048-bit key) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.b=cgXrgd3R; arc=none smtp.client-ip=185.233.34.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jjverkuil.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jjverkuil.nl
Received: from smtp.freedom.nl (unknown [10.10.4.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by dane.soverin.net (Postfix) with ESMTPS id 4Zsxfl5Jjdz15FS;
	Wed,  7 May 2025 13:57:51 +0000 (UTC)
Received: from smtp.freedom.nl (smtp.freedom.nl [10.10.4.107]) by freedom.nl (Postfix) with ESMTPSA id 4Zsxfl2g4Yz3s;
	Wed,  7 May 2025 13:57:51 +0000 (UTC)
Authentication-Results: smtp.freedom.nl;
	dkim=pass (2048-bit key; unprotected) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.a=rsa-sha256 header.s=soverin1 header.b=cgXrgd3R;
	dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jjverkuil.nl;
	s=soverin1; t=1746626271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=YtqjlTDuZnzpOH+fyVqAT0wtQRHiNNcqWI8v5XplRrY=;
	b=cgXrgd3Rhk+evFKbrxSvUqe2xEBPtAflnxeUyDdCLqJ/mlZfCf5qtxfkZl1RxEM0mv7pxU
	seZRTBUczUGQQxdO8BtdchTQCJfznwzS33sU+eWvtjznG+ygT9AZQXiby9mF6APVZDqOqJ
	zvk2vlqYZXcFtSTI4i2aWz9VbSWw6/j5fhV6mVveAuY+x8IQttMOHRu8qIiVqBeQ88ao9H
	PbBy3Rc2tct+zmGONzWu71zoToT99lM4njfGiuv6791aUZr2ecoAEsRbOgUk9HSFrAj3vw
	PFl4278V3QdcTAccVGdRH4ovxGgy2P1LatNliu89iPLDyWNQzvkiVYohOnrLlg==
X-CM-Analysis: v=2.4 cv=d/oPyQjE c=1 sm=1 tr=0 ts=681b66df a=smkfPCmiGCBx+NgG8pXs4w==:117 a=smkfPCmiGCBx+NgG8pXs4w==:17 a=IkcTkHD0fZMA:10 a=xq3W2uTSAAAA:8 a=HAiC5QejbJRGFkM9ISAA:9 a=QEXdDO2ut3YA:10 a=P5L7wpMTXyg1GfFA3Gwx:22
X-CM-Envelope: MS4xfIzRzNG+LFv4Sh3joZPvr6QMR6dj0zEskGJ/CunYbd204loGP8rw+W0p+nW3dMkjTGEnd7xzFAtPYCXTIWvDnH2ojqy/VNpe5jlCstUPXybqjCQYdab7 jLocKH5HzpD/ZFWw/LF9cg1Hap9f+0+N5OP7V+kVj/6MnFnnVLFVzyJkprSduyo88Jm45J04S01L7fASIhaPT0MWrypNSJ9gr7HgEdrojKWD5mm4QhcQiqPE KumFFZL29AxaehchakUNUEZxSSJ4nYOr9b5v2PiP9Vo=
Message-ID: <b1835207-2ccb-40b0-8968-6edecd92e9e3@jjverkuil.nl>
Date: Wed, 7 May 2025 15:57:50 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: TC358743 RGB Quantization Issue
To: Maxime Ripard <mripard@redhat.com>
Cc: linux-media@vger.kernel.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20250506-spiked-corgi-of-greatness-811fbe@houat>
 <004692be-f4af-4d3a-92e5-73b7c9b62576@xs4all.nl>
 <20250506-liberal-wine-bustard-8aa8fe@houat>
 <f0ac05fb-2bc0-4963-9da6-c322395bd294@xs4all.nl>
 <20250507-marvellous-silver-jaguarundi-4ab9c5@houat>
 <140e3b51-9048-4de0-a471-7ee8809a107e@xs4all.nl>
 <20250507-petite-qualified-beaver-e0dddc@houat>
Content-Language: en-US, nl
From: Hans Verkuil <hans@jjverkuil.nl>
Autocrypt: addr=hans@jjverkuil.nl; keydata=
 xsFNBFQ84W0BEAC7EF1iL4s3tY8cRTVkJT/297h0Hz0ypA+ByVM4CdU9sN6ua/YoFlr9k0K4
 BFUlg7JzJoUuRbKxkYb8mmqOe722j7N3HO8+ofnio5cAP5W0WwDpM0kM84BeHU0aPSTsWiGR
 yw55SOK2JBSq7hueotWLfJLobMWhQii0Zd83hGT9SIt9uHaHjgwmtTH7MSTIiaY6N14nw2Ud
 C6Uykc1va0Wqqc2ov5ihgk/2k2SKa02ookQI3e79laOrbZl5BOXNKR9LguuOZdX4XYR3Zi6/
 BsJ7pVCK9xkiVf8svlEl94IHb+sa1KrlgGv3fn5xgzDw8Z222TfFceDL/2EzUyTdWc4GaPMC
 E/c1B4UOle6ZHg02+I8tZicjzj5+yffv1lB5A1btG+AmoZrgf0X2O1B96fqgHx8w9PIpVERN
 YsmkfxvhfP3MO3oHh8UY1OLKdlKamMneCLk2up1Zlli347KMjHAVjBAiy8qOguKF9k7HOjif
 JCLYTkggrRiEiE1xg4tblBNj8WGyKH+u/hwwwBqCd/Px2HvhAsJQ7DwuuB3vBAp845BJYUU3
 06kRihFqbO0vEt4QmcQDcbWINeZ2zX5TK7QQ91ldHdqJn6MhXulPKcM8tCkdD8YNXXKyKqNl
 UVqXnarz8m2JCbHgjEkUlAJCNd6m3pfESLZwSWsLYL49R5yxIwARAQABzSBIYW5zIFZlcmt1
 aWwgPGhhbnNAamp2ZXJrdWlsLm5sPsLBlAQTAQoAPhYhBAUs3nvCFQU7aJ8byr0tYUhmFDtM
 BQJoBTEAAhsDBQkX+5V7BQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEL0tYUhmFDtMb8EQ
 AK6Ecb5mGBanCa0R+J/WkWxGVsgqsaTjNU6nS5sl9lkiY64Tad6nF8RNO9YKRyfuokm2pxAD
 a91Tk92DFstszKGwiisEG7PQ3zXHEJTqxIosy9ueLbHTOvB4CnWVChcvaBWZ2uilyKFsWNTq
 mbDQf3/0UC3LxbEvGsYNU1Q6Pz+h+Pdv7GgdOJhYGKSLCpQyPYOyaU9tenHDKx6aNedNG4ZI
 2OAM18nDfKrEplSjDF9E9Ras65/n9iWQfGoUdxSlGrxM/t3EVgi1FXEq14FaCi6HhvreBZuw
 3NTHg4Za6bqnYsZnbyHY36bgnxi2YJYxKlh+IMT/TpfEh8nf2nnJTgs3bsNIVVaaYxJtl4w/
 Y48gKt6YzcWsHR6l0CSMQhZXQqp/Ljpi+/xtE6JJ/tJnG9Wyi3+hA11GFQ50uciXTpp9/w8s
 fScrv8qrfRiUsd+zfd0MC6EJmHSlW7qSVQjEauWDsdCFmsER8y/ab3DQb5uhrsyuooB+V7uj
 476vUbH/fM3KMrvh8HOTUBoAE/Mf82/bMlrduuU5PkbO+3/PcUR0WFUSK2yRK32GX/Tt2tD+
 YJq0RnyR8UeYslVLzyehrt8Cgc9KgHa8VUi/vkSTenjieYJYxgrd+oTYXB38gKlADnhw+zyp
 CsqeGGZu+SS2qrPUyUkeruRX7kC2tQ6gNoYpzsFNBFQ84W0BEADcy4iOoB5CIQUCnkGmLKdk
 kqhfXPvvSzsucep20OLNF96EymjBnwWboipJFOjZxwkmtAM+UnEVi2kRrtT844HFcM5eTrA2
 sEdQbThv16D0TQdt+dT0afvlvE1qNr4mGGNLiRyhRzC/pLvatD/jZHU8xRiSz/oZ+8dEUwzG
 4Skxztx9sSc+U1zRPc0ybiHxgM90oQ6Yo782InmN99Ac2WH6YLwpZQ1TOROF4HxeBfzfdMFi
 rudHzANNbn8LvvfRhMExVRtms+U/Ul3e730oEUpM18u4XJ8Y+CITnzOk7POfwYzHiKXqskw3
 bLnrQYF/QzDFsTFpewS3ojMzBq35CeLb5aH9LFY7q14m04m2cn8hkdq4nIPIk2x8hWgM19rh
 VaGWj8a6e7nQ30PerH89IXrBfWYvHezZzZzGG1JlLWktPNy/5dhAyrwiJIUo3ePFxfmjvFYa
 wn211qRkWi3GP4MYtk10WBvcQmuzyDYM/Usjt+LC+k3hT0mZ+Gz0FeTtY/OQ4+IwXnAdZM9m
 q88JVlijGVG0dOB03gLrr2LwihDJ31twAc3aJ4e9EHaiW6UBnwBdqeP4ghEylrqnn4jmJ6Uf
 D6qEANQ2L97e8vQyDeScP/Do+cDnhMm8Or0zAdK658fiWl78Xh0pRcx4g+opfwoQw5CfSf3o
 wh1ECJeNMC0g0QARAQABwsF8BBgBCgAmAhsMFiEEBSzee8IVBTtonxvKvS1hSGYUO0wFAmaU
 3McFCRf7ldoACgkQvS1hSGYUO0zJTw//aaYKzeGfYF7WvSHUvGvtBO5Y/3XNC5xfU+jDKmlA
 vghX304jqDQ5314fLH7Kk4wE+dE7FaXZR+mMj5W1ORUfGwvMJ7ayemUVg3RyYggy6jQP5Rlb
 SCj9WFvHwNNbYTHFVMkAnVVKpwcjCYiUA82WK1/hP2ClE4dkS+WHtH6ABhO0hs32WoCNAzmT
 fdsOfXtSYN8wYWF0CI8wW4RiMu7rAX7xPPNhnVGz9vWyn06XDipCSIDuivsPNg/9XeUzjUg9
 eOvlMkphJ42MRyPJAWGmSeLm8mKwxoF094yAT6vIvYmT9yUnmf9BfVCJV+CnjEhvMpoAkUqi
 9cvaZfUdnsAnqQmoRJE0+yInhlMyWc+3xlGsa0snsTxNfqjaLH61CLt8oUQOgCI4cD4rJWks
 A8SyOqlgxEHnljUGmFEhCBUOV5GcXf1TfCXjMBiAKtex5cpvic4wZIJJtS1fS18PQ/DEC3vL
 UnhF1/AWSHp+sv8vlNgnncxLDCho8uVjZrn4jzswd6ticBUAsPAKDYnO7KDzfQlQhIHdq10v
 jlGW/FbxA1UUiuWH+/Ub3qh75oQHTTlYe9H+Qr8Ef231/xItks8c+OyoWV6Z9ZcZnHbOmy2I
 0wGRdGp8puOL7LzhLkIN66sY/+x4s+ANxyJK6U1nJVeq7tbbhqf2Se2mPG3b87T9ik8=
In-Reply-To: <20250507-petite-qualified-beaver-e0dddc@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spampanel-Class: ham

On 07/05/2025 15:17, Maxime Ripard wrote:
> On Wed, May 07, 2025 at 10:16:47AM +0200, Hans Verkuil wrote:
>> On 07/05/2025 09:37, Maxime Ripard wrote:
>>>>> # v4l2-dbg -d /dev/v4l-subdev1 -g 0x8528 -g 0x8573 -g 0x8574 -g 0x8576
>>>>> ioctl: VIDIOC_DBG_G_REGISTER
>>>>> Register 0x00008528 = 0h (0d  00000000b)
>>>>> Register 0x00008573 = 1h (1d  00000001b)
>>>>> Register 0x00008574 = 8h (8d  00001000b)
>>>>> Register 0x00008576 = 0h (0d  00000000b)
>>>>>
>>>>> Which definitely looks like the chip on the Auvidea board detects the
>>>>> quantization differently from the same video feed.
>>>>>
>>>>> Could it be something like a pin strap on the board that is set
>>>>> differently and affects the chip behaviour? Or a bit somewhere not being
>>>>> initialized to what it should and changed default?
>>>>
>>>> Can you dump the value of register 0x8570? Is it different for the two boards?
>>>
>>> On the Auvidea (working) one:
>>> # v4l2-dbg -d /dev/v4l-subdev1 -g 0x8570
>>> ioctl: VIDIOC_DBG_G_REGISTER
>>> Register 0x00008570 = e6h (230d  11100110b)
>>>
>>> On the Geekworm (broken) one:
>>> # v4l2-dbg -d /dev/v4l-subdev1 -g 0x8570
>>> ioctl: VIDIOC_DBG_G_REGISTER
>>> Register 0x00008570 = e6h (230d  11100110b)
>>>
>>> So both are identical
>>
>> OK.
>>
>> Are you able to install different EDIDs? Or does it have to be this one?
> 
> It doesn't have to be this one.
> 
>> It's a bit odd in that there is only one DTD which is almost identical to
>> VIC 4. Normally for an HDMI receiver you would expect to see VICs listed in
>> the CTA-861 extension block.
>>
>> The DTD listed says:
>>
>>     DTD 1:  1280x720    60.000000 Hz  16:9     45.000 kHz     74.250000 MHz (1600 mm x 900 mm)
>>                  Hfront  220 Hsync  40 Hback  110 Hpol P
>>                  Vfront   20 Vsync   5 Vback    5 Vpol P
>>
>> Whereas VIC 4 is:
>>
>> VIC   4:  1280x720    60.000000 Hz  16:9     45.000 kHz     74.250000 MHz
>>                Hfront  110 Hsync  40 Hback  220 Hpol P
>>                Vfront    5 Vsync   5 Vback   20 Vpol P
>>
>> So front and backporches appear to be swapped in the DTD.
>>
>> Testing with a EDID where VIC 4 is added and the DTD is fixed would be interesting.
>> For one, the AVI InfoFrame would set the VIC to 4 instead of 0 as it is with this
>> EDID.
> 
> I gave it a try, and it's interesting.
> 
> Here's the EDID, and the infoframes:
> 
> # edid-decode \
>   /sys/class/drm/card1-HDMI-A-2/edid \
>   -I /sys/kernel/debug/dri/1/HDMI-A-2/infoframes/audio \
>   -I /sys/kernel/debug/dri/1/HDMI-A-2/infoframes/avi \
>   -I /sys/kernel/debug/dri/1/HDMI-A-2/infoframes/hdmi \
>   -I /sys/kernel/debug/dri/1/HDMI-A-2/infoframes/hdr_drm \
>   -I /sys/kernel/debug/dri/1/HDMI-A-2/infoframes/spd
> edid-decode (hex):
> 
> 00 ff ff ff ff ff ff 00 0e 4e 42 00 42 42 42 42
> 00 22 01 03 81 a0 5a 78 0a 9c 68 a0 57 4a 9b 26
> 12 48 4c 20 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 01 1d 00 72 51 d0 1e 20 6e 28
> 55 00 40 84 63 00 00 1e 00 00 00 fc 00 44 72 61
> 64 69 73 0a 20 20 20 20 20 20 00 00 00 fd 00 3b
> 3d 1e 32 08 00 0a 20 20 20 20 20 20 00 00 00 10
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 7d
> 
> 02 03 13 81 41 04 e3 05 00 20 e2 00 4a 65 03 0c
> 00 10 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 6a
> 
> ----------------
> 
> Block 0, Base EDID:
>   EDID Structure Version & Revision: 1.3
>   Vendor & Product Identification:
>     Manufacturer: CRN
>     Model: 66
>     Serial Number: 1111638594 (0x42424242)
>     Made in: 2024
>   Basic Display Parameters & Features:
>     Digital display
>     DFP 1.x compatible TMDS
>     Maximum image size: 160 cm x 90 cm
>     Gamma: 2.20
>     RGB color display
>     First detailed timing is the preferred timing
>   Color Characteristics:
>     Red  : 0.6269, 0.3408
>     Green: 0.2919, 0.6054
>     Blue : 0.1494, 0.0722
>     White: 0.2832, 0.2968
>   Established Timings I & II:
>     DMT 0x04:   640x480    59.940476 Hz   4:3     31.469 kHz     25.175000 MHz
>   Standard Timings: none
>   Detailed Timing Descriptors:
>     DTD 1:  1280x720    60.000000 Hz  16:9     45.000 kHz     74.250000 MHz (1600 mm x 900 mm)
>                  Hfront  110 Hsync  40 Hback  220 Hpol P
>                  Vfront    5 Vsync   5 Vback   20 Vpol P
>     Display Product Name: 'Dradis'
>     Display Range Limits:
>       Monitor ranges (GTF): 59-61 Hz V, 30-50 kHz H, max dotclock 80 MHz
>     Dummy Descriptor:
>   Extension blocks: 1
> Checksum: 0x7d
> 
> ----------------
> 
> Block 1, CTA-861 Extension Block:
>   Revision: 3
>   Underscans IT Video Formats by default
>   Native detailed modes: 1
>   Video Data Block:
>     VIC   4:  1280x720    60.000000 Hz  16:9     45.000 kHz     74.250000 MHz
>   Colorimetry Data Block:
>     sRGB
>   Video Capability Data Block:
>     YCbCr quantization: No Data
>     RGB quantization: Selectable (via AVI Q)
>     PT scan behavior: No Data
>     IT scan behavior: Always Underscanned
>     CE scan behavior: Always Underscanned
>   Vendor-Specific Data Block (HDMI), OUI 00-0C-03:
>     Source physical address: 1.0.0.0
> Checksum: 0x6a  Unused space in Extension Block: 108 bytes
> 
> ================
> 
> InfoFrame of '/sys/kernel/debug/dri/1/HDMI-A-2/infoframes/audio' was empty.
> 
> ================
> 
> edid-decode InfoFrame (hex):
> 
> 82 02 0d 2d 12 28 04 04 00 00 00 00 00 00 00 00
> 00
> 
> ----------------
> 
> HDMI InfoFrame Checksum: 0x2d
> 
> AVI InfoFrame
>   Version: 2
>   Length: 13
>   VIC   4:  1280x720    60.000000 Hz  16:9     45.000 kHz     74.250000 MHz
>   Y: Color Component Sample Format: RGB
>   A: Active Format Information Present: Yes
>   B: Bar Data Present: Bar Data not present
>   S: Scan Information: Composed for an underscanned display
>   C: Colorimetry: No Data
>   M: Picture Aspect Ratio: 16:9
>   R: Active Portion Aspect Ratio: 8
>   ITC: IT Content: No Data
>   EC: Extended Colorimetry: xvYCC601
>   Q: RGB Quantization Range: Limited Range

Note that this sets Limited Range, but at the tc358743 receiver side
it is still Default. It's really, really weird.

>   SC: Non-Uniform Picture Scaling: No Known non-uniform scaling
>   YQ: YCC Quantization Range: Limited Range
>   CN: IT Content Type: Graphics
>   PR: Pixel Data Repetition Count: 0
>   Line Number of End of Top Bar: 0
>   Line Number of Start of Bottom Bar: 0
>   Pixel Number of End of Left Bar: 0
>   Pixel Number of Start of Right Bar: 0
> 
> ================
> 
> InfoFrame of '/sys/kernel/debug/dri/1/HDMI-A-2/infoframes/hdmi' was empty.
> 
> ================
> 
> InfoFrame of '/sys/kernel/debug/dri/1/HDMI-A-2/infoframes/hdr_drm' was empty.
> 
> ================
> 
> edid-decode InfoFrame (hex):
> 
> 83 01 19 93 42 72 6f 61 64 63 6f 6d 56 69 64 65
> 6f 63 6f 72 65 00 00 00 00 00 00 00 09
> 
> ----------------
> 
> HDMI InfoFrame Checksum: 0x93
> 
> Source Product Description InfoFrame
>   Version: 1
>   Length: 25
>   Vendor Name: 'Broadcom'
>   Product Description: 'Videocore'
>   Source Information: PC general
> 
> So indeed, the infoframes now report the VIC4 as being transmitted, but
> now will transmit with limited range RGB.
> 
> And it's properly picked up by the bridge:
> # v4l2-ctl -d /dev/v4l-subdev1  --log-status
> 
> Status Log:
> 
>    [  761.603912] tc358743 5-000f: =================  START STATUS  =================
>    [  761.613688] tc358743 5-000f: -----Chip status-----
>    [  761.619970] tc358743 5-000f: Chip ID: 0x00
>    [  761.625471] tc358743 5-000f: Chip revision: 0x00
>    [  761.630261] tc358743 5-000f: Reset: IR: 1, CEC: 0, CSI TX: 0, HDMI: 0
>    [  761.636867] tc358743 5-000f: Sleep mode: off
>    [  761.641260] tc358743 5-000f: Cable detected (+5V power): yes
>    [  761.648216] tc358743 5-000f: DDC lines enabled: yes
>    [  761.654448] tc358743 5-000f: Hotplug enabled: yes
>    [  761.660582] tc358743 5-000f: CEC enabled: no
>    [  761.665237] tc358743 5-000f: -----Signal status-----
>    [  761.670388] tc358743 5-000f: TMDS signal detected: yes
>    [  761.675656] tc358743 5-000f: Stable sync signal: yes
>    [  761.680782] tc358743 5-000f: PHY PLL locked: yes
>    [  761.685602] tc358743 5-000f: PHY DE detected: yes
>    [  761.699297] tc358743 5-000f: Detected format: 1280x720p60.00 (1650x750)
>    [  761.706138] tc358743 5-000f: horizontal: fp = 0, -sync = 370, bp = 0
>    [  761.712660] tc358743 5-000f: vertical: fp = 0, -sync = 30, bp = 0
>    [  761.718880] tc358743 5-000f: pixelclock: 74250000
>    [  761.723721] tc358743 5-000f: flags (0x0):
>    [  761.727854] tc358743 5-000f: standards (0x0):
>    [  761.732326] tc358743 5-000f: Configured format: 1280x720p60.00 (1650x750)
>    [  761.739265] tc358743 5-000f: horizontal: fp = 0, -sync = 370, bp = 0
>    [  761.745780] tc358743 5-000f: vertical: fp = 0, -sync = 30, bp = 0
>    [  761.752248] tc358743 5-000f: pixelclock: 74250000
>    [  761.757121] tc358743 5-000f: flags (0x0):
>    [  761.761243] tc358743 5-000f: standards (0x0):
>    [  761.765735] tc358743 5-000f: -----CSI-TX status-----
>    [  761.770887] tc358743 5-000f: Lanes needed: 2
>    [  761.775280] tc358743 5-000f: Lanes in use: 2
>    [  761.780367] tc358743 5-000f: Waiting for particular sync signal: no
>    [  761.787518] tc358743 5-000f: Transmit mode: yes
>    [  761.793055] tc358743 5-000f: Receive mode: no
>    [  761.798190] tc358743 5-000f: Stopped: no
>    [  761.802252] tc358743 5-000f: Color space: RGB 888 24-bit
>    [  761.808266] tc358743 5-000f: -----HDMI status-----
>    [  761.813221] tc358743 5-000f: HDCP encrypted content: no
>    [  761.818593] tc358743 5-000f: Input color space: RGB limited range
>    [  761.825450] tc358743 5-000f: AV Mute: off
>    [  761.830161] tc358743 5-000f: Deep color mode: 8-bits per channel
>    [  761.839178] tc358743 5-000f: HDMI infoframe: Auxiliary Video Information (AVI), version 2, length 13
>    [  761.848599] tc358743 5-000f:     colorspace: RGB
>    [  761.853350] tc358743 5-000f:     scan mode: Underscan
>    [  761.858593] tc358743 5-000f:     colorimetry: ITU601

This is also weird: the transmitter sends 'No Data' here.

Can you dump the raw AVI InfoFrame data that the tc358743 reads before it is
logged here, and compare it with the raw data from the avi infoframe that
the transmitter sends?

Actually, if you are on a recent kernel (6.13 and up) then the infoframe received by the
tc358743 is also exported in debugfs. So you can check it with edid-decode as well.

>    [  761.863682] tc358743 5-000f:     picture aspect: 16:9
>    [  761.868853] tc358743 5-000f:     active aspect: Same as Picture
>    [  761.874934] tc358743 5-000f:     itc: No Data
>    [  761.879405] tc358743 5-000f:     extended colorimetry: xvYCC 601
>    [  761.885538] tc358743 5-000f:     quantization range: Default
>    [  761.891325] tc358743 5-000f:     nups: Unknown Non-uniform Scaling
>    [  761.897660] tc358743 5-000f:     video code: 4
>    [  761.902291] tc358743 5-000f:     ycc quantization range: Limited
>    [  761.908466] tc358743 5-000f:     hdmi content type: Graphics
>    [  761.914244] tc358743 5-000f:     pixel repeat: 0
>    [  761.918980] tc358743 5-000f:     bar top 0, bottom 0, left 0, right 0
>    [  761.925734] tc358743 5-000f: ==================  END STATUS  ==================
> 
> I guess that makes sense, because if I understand right, any VIC mode >
> 1 is supposed to be sent in limited range.

Correct, that's the default behavior.

> Is there any way to get HDMI to send a full range RGB signal for
> somewhat common modes, or are they all supposed to be sent as limited
> range?

If the EDID signals Selectable RGB Quantization Range in the Video Capability Data Block
(this EDID does), then the source has the option to select full range. It's the Broadcast RGB
property.

I also have a patch here:

https://git.linuxtv.org/hverkuil/media_tree.git/commit/?h=hdmi-dbg&id=9bf808aa3659ed88e7188994b1f84cfd0a2133b6

that switches to Full Range if the display can handle it.

Regards,

	Hans

