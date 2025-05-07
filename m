Return-Path: <linux-media+bounces-31935-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D34AAD9F8
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 10:18:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AAECF3A4597
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 08:16:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FDC92153CB;
	Wed,  7 May 2025 08:16:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE7F13C82E
	for <linux-media@vger.kernel.org>; Wed,  7 May 2025 08:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746605811; cv=none; b=ZgPwVJv6hyE36m+Yzhk6x4hm8HRptrX5kD9W3z4VcC0HOmYPREqpBQNr7ueJDQM/3f/mTYLrk38RN0/eEtpnJxoDgVRf43b0vMsbNVAlIu40kyvooX2xb9WKk95LFeQynd3dtHlgY43yc764ARli0xb91L3WTGrRhR7E1z4bgNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746605811; c=relaxed/simple;
	bh=tM6ItOjDSzasUwjfKTJwV92l1c0J+j+zi+6bgIqROwc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YhjRUifq7Cq4OuukB4DJyruTALv2pZ1z2DppxioLHOLk8dgq3Ue1Yao53c6OOrHzzd82q5wkweZC+sIiaoRftW+FsR3qZRYsYrTh+BGP5qVeYPxFWS9Le4qE7hjSgYUsMJigWNe6N6opoBOdLGtB76SUsHNop11M0d5yub/lYwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4E44C4CEE7;
	Wed,  7 May 2025 08:16:49 +0000 (UTC)
Message-ID: <140e3b51-9048-4de0-a471-7ee8809a107e@xs4all.nl>
Date: Wed, 7 May 2025 10:16:47 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: TC358743 RGB Quantization Issue
To: Maxime Ripard <mripard@redhat.com>
Cc: linux-media@vger.kernel.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20250506-spiked-corgi-of-greatness-811fbe@houat>
 <004692be-f4af-4d3a-92e5-73b7c9b62576@xs4all.nl>
 <20250506-liberal-wine-bustard-8aa8fe@houat>
 <f0ac05fb-2bc0-4963-9da6-c322395bd294@xs4all.nl>
 <20250507-marvellous-silver-jaguarundi-4ab9c5@houat>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20250507-marvellous-silver-jaguarundi-4ab9c5@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/05/2025 09:37, Maxime Ripard wrote:

<snip>

>>> # v4l2-dbg -d /dev/v4l-subdev1 -g 0x8528 -g 0x8573 -g 0x8574 -g 0x8576
>>> ioctl: VIDIOC_DBG_G_REGISTER
>>> Register 0x00008528 = 0h (0d  00000000b)
>>> Register 0x00008573 = 1h (1d  00000001b)
>>> Register 0x00008574 = 8h (8d  00001000b)
>>> Register 0x00008576 = 0h (0d  00000000b)
>>>
>>> Which definitely looks like the chip on the Auvidea board detects the
>>> quantization differently from the same video feed.
>>>
>>> Could it be something like a pin strap on the board that is set
>>> differently and affects the chip behaviour? Or a bit somewhere not being
>>> initialized to what it should and changed default?
>>
>> Can you dump the value of register 0x8570? Is it different for the two boards?
> 
> On the Auvidea (working) one:
> # v4l2-dbg -d /dev/v4l-subdev1 -g 0x8570
> ioctl: VIDIOC_DBG_G_REGISTER
> Register 0x00008570 = e6h (230d  11100110b)
> 
> On the Geekworm (broken) one:
> # v4l2-dbg -d /dev/v4l-subdev1 -g 0x8570
> ioctl: VIDIOC_DBG_G_REGISTER
> Register 0x00008570 = e6h (230d  11100110b)
> 
> So both are identical

OK.

Are you able to install different EDIDs? Or does it have to be this one?
It's a bit odd in that there is only one DTD which is almost identical to
VIC 4. Normally for an HDMI receiver you would expect to see VICs listed in
the CTA-861 extension block.

The DTD listed says:

    DTD 1:  1280x720    60.000000 Hz  16:9     45.000 kHz     74.250000 MHz (1600 mm x 900 mm)
                 Hfront  220 Hsync  40 Hback  110 Hpol P
                 Vfront   20 Vsync   5 Vback    5 Vpol P

Whereas VIC 4 is:

VIC   4:  1280x720    60.000000 Hz  16:9     45.000 kHz     74.250000 MHz
               Hfront  110 Hsync  40 Hback  220 Hpol P
               Vfront    5 Vsync   5 Vback   20 Vpol P

So front and backporches appear to be swapped in the DTD.

Testing with a EDID where VIC 4 is added and the DTD is fixed would be interesting.
For one, the AVI InfoFrame would set the VIC to 4 instead of 0 as it is with this
EDID.

Note: I have an auvidea B101 as well, and I have a Geekworm C790:
https://geekworm.com/products/c790

So I can try to test this myself. But not until May 19 or later.

Regards,

	Hans

