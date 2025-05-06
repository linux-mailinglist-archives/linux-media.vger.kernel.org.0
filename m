Return-Path: <linux-media+bounces-31848-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 225C0AAC477
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 14:45:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 181C11BA8872
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 12:45:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFEB727FD76;
	Tue,  6 May 2025 12:44:47 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9870227D79F
	for <linux-media@vger.kernel.org>; Tue,  6 May 2025 12:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746535487; cv=none; b=MPZrhel/CBupeAgcIBhq+xjx75zkXpoXSBZCpVLCXUUwweF2BdXtN8rlCegI2blDZ8oT2gVWc45dN6hTb1wkzu8eUEU3sxAD2ACrpe01/R+F70WcXNjAtvIHYc6gGge4stc3Cz1mN9KyX0Te/XB/F764qV8YG/5xpsCZHhnNU1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746535487; c=relaxed/simple;
	bh=RUhYXmE9XgStagU0YZBeHd0dD5is1Nd0rY1PMby2E5w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y1yZ1zbqJrxGTXfFkAWfQJirPFiLoPSWtnndEN2GkcHsjE6P5ObZB3d1exM270WM3IZ2Ubrho4FyVrvLX/95PO2XT9aY/VFIZ4m6Mbk3ns1Cv1G72wuzFQBzHznuOLsQ34RS9/s/iLZZ+s68o6tijWvhN39uwpoPJjcvaxc02Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F6A0C4CEE4;
	Tue,  6 May 2025 12:44:45 +0000 (UTC)
Message-ID: <004692be-f4af-4d3a-92e5-73b7c9b62576@xs4all.nl>
Date: Tue, 6 May 2025 14:44:43 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: TC358743 RGB Quantization Issue
Content-Language: en-US
To: Maxime Ripard <mripard@redhat.com>
Cc: linux-media@vger.kernel.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20250506-spiked-corgi-of-greatness-811fbe@houat>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20250506-spiked-corgi-of-greatness-811fbe@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/6/25 14:05, Maxime Ripard wrote:
> Hi,
> 
> It's something we've discussed a bit on IRC a few week ago, but I have
> more data now, and can reproduce it on a mainline 6.13.12.
> 
> I have recently switched from an Auvidea B101
> (https://auvidea.eu/product/b101-70501/) board to a Geekworm X1301
> (https://geekworm.com/products/x1301). Both feature a TC358743XBG
> according to their documentation, but the Auvideo one was bought in
> 2020-2021, whereas I bought the Geekworm this year, so I guess it could
> be a newer revision.
> 
> Anyway, I have a v4l2 application on the CSI end of the TC358743 bridge,
> and a KMS application on the HDMI end. The KMS application sends frame
> through the HDMI cable, and the v4l2 application checks their integrity
> using a hash algorithm.
> 
> Everything works nicely with the Auvidea board.
> 
> When I swap the Geekwork one in though, the bridge driver detects the
> signal as limited range, and all the pixels are off. They are correct
> though if you account for the full range to limited range conversion.
> 
> The EDID programmed in the bridge is:
> 
> edid-decode (hex):
> 
> 00 ff ff ff ff ff ff 00 0e 4e 42 00 42 42 42 42
> 00 22 01 03 81 a0 5a 78 0a 9c 68 a0 57 4a 9b 26
> 12 48 4c 20 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 01 1d 00 72 51 d0 1e 20 dc 28
> 45 04 40 84 63 00 00 1e 00 00 00 fc 00 44 72 61
> 64 69 73 0a 20 20 20 20 20 20 00 00 00 fd 00 3b
> 3d 1e 32 08 00 0a 20 20 20 20 20 20 00 00 00 10
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 1b
> 
> 02 03 11 81 e3 05 00 20 e2 00 4a 65 03 0c 00 10
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 b1

Is the EDID of the Auvidea B101 and the Geekworm X1301 the same?
I assume you program the EDID yourself and it is the same for both, right?

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
>                  Hfront  220 Hsync  40 Hback  110 Hpol P
>                  Vfront   20 Vsync   5 Vback    5 Vpol P
>     Display Product Name: 'Dradis'
>     Display Range Limits:
>       Monitor ranges (GTF): 59-61 Hz V, 30-50 kHz H, max dotclock 80 MHz
>     Dummy Descriptor:
>   Extension blocks: 1
> Checksum: 0x1b
> 
> ----------------
> 
> Block 1, CTA-861 Extension Block:
>   Revision: 3
>   Underscans IT Video Formats by default
>   Native detailed modes: 1
>   Colorimetry Data Block:
>     sRGB
>   Video Capability Data Block:
>     YCbCr quantization: No Data
>     RGB quantization: Selectable (via AVI Q)

This is important for RGB Quantization Range as it indicates that
you can explicitly signal the RGB Quantization Range in the AVI InfoFrame
instead of having to rely on the 'default' behavior.

>     PT scan behavior: No Data
>     IT scan behavior: Always Underscanned
>     CE scan behavior: Always Underscanned
>   Vendor-Specific Data Block (HDMI), OUI 00-0C-03:
>     Source physical address: 1.0.0.0
> Checksum: 0xb1  Unused space in Extension Block: 110 bytes
> [root@rpi-ab2f2485 ~]# edid-decode edid-dumps/test-edid.bin --check
> edid-decode (hex):
> 
> 00 ff ff ff ff ff ff 00 0e 4e 42 00 42 42 42 42
> 00 22 01 03 81 a0 5a 78 0a 9c 68 a0 57 4a 9b 26
> 12 48 4c 20 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 01 1d 00 72 51 d0 1e 20 dc 28
> 45 04 40 84 63 00 00 1e 00 00 00 fc 00 44 72 61
> 64 69 73 0a 20 20 20 20 20 20 00 00 00 fd 00 3b
> 3d 1e 32 08 00 0a 20 20 20 20 20 20 00 00 00 10
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 1b
> 
> 02 03 11 81 e3 05 00 20 e2 00 4a 65 03 0c 00 10
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 b1
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
>                  Hfront  220 Hsync  40 Hback  110 Hpol P
>                  Vfront   20 Vsync   5 Vback    5 Vpol P
>     Display Product Name: 'Dradis'
>     Display Range Limits:
>       Monitor ranges (GTF): 59-61 Hz V, 30-50 kHz H, max dotclock 80 MHz
>     Dummy Descriptor:
>   Extension blocks: 1
> Checksum: 0x1b
> 
> ----------------
> 
> Block 1, CTA-861 Extension Block:
>   Revision: 3
>   Underscans IT Video Formats by default
>   Native detailed modes: 1
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
> Checksum: 0xb1  Unused space in Extension Block: 110 bytes
> 
> ----------------
> 
> edid-decode SHA: SHA DATE
> 
> Warnings:
> 
> Block 0, Base EDID:
>   Detailed Timing Descriptor #1: DTD is similar but not identical to VIC 4.
> 
> EDID conformity: PASS
> 
> On the KMS side, the EDID received (checked through
> /sys/class/drm/card2-HDMI-A-1/edid) is identical (md5sum match).
> 
> Once I start the KMS application, the infoframes look decent too:
> 
> # edid-decode /sys/class/drm/card2-HDMI-A-1/edid \
>   -I /sys/kernel/debug/dri/2/HDMI-A-1/infoframes/audio \
>   -I /sys/kernel/debug/dri/2/HDMI-A-1/infoframes/avi \
>   -I /sys/kernel/debug/dri/2/HDMI-A-1/infoframes/hdmi \
>   -I /sys/kernel/debug/dri/2/HDMI-A-1/infoframes/hdr_drm \
>   -I /sys/kernel/debug/dri/2/HDMI-A-1/infoframes/spd
> 
> edid-decode (hex):
> 
> 00 ff ff ff ff ff ff 00 0e 4e 42 00 42 42 42 42
> 00 22 01 03 81 a0 5a 78 0a 9c 68 a0 57 4a 9b 26
> 12 48 4c 20 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 01 1d 00 72 51 d0 1e 20 dc 28
> 45 04 40 84 63 00 00 1e 00 00 00 fc 00 44 72 61
> 64 69 73 0a 20 20 20 20 20 20 00 00 00 fd 00 3b
> 3d 1e 32 08 00 0a 20 20 20 20 20 20 00 00 00 10
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 1b
> 
> 02 03 11 81 e3 05 00 20 e2 00 4a 65 03 0c 00 10
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 b1
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
>                  Hfront  220 Hsync  40 Hback  110 Hpol P
>                  Vfront   20 Vsync   5 Vback    5 Vpol P
>     Display Product Name: 'Dradis'
>     Display Range Limits:
>       Monitor ranges (GTF): 59-61 Hz V, 30-50 kHz H, max dotclock 80 MHz
>     Dummy Descriptor:
>   Extension blocks: 1
> Checksum: 0x1b
> 
> ----------------
> 
> Block 1, CTA-861 Extension Block:
>   Revision: 3
>   Underscans IT Video Formats by default
>   Native detailed modes: 1
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
> Checksum: 0xb1  Unused space in Extension Block: 110 bytes
> 
> ================
> 
> InfoFrame of '/sys/kernel/debug/dri/2/HDMI-A-1/infoframes/audio' was empty.
> 
> ================
> 
> edid-decode InfoFrame (hex):
> 
> 82 02 0d 4d 12 08 08 00 00 00 00 00 00 00 00 00
> 00
> 
> ----------------
> 
> HDMI InfoFrame Checksum: 0x4d
> 
> AVI InfoFrame
>   Version: 2
>   Length: 13
>   Y: Color Component Sample Format: RGB
>   A: Active Format Information Present: Yes
>   B: Bar Data Present: Bar Data not present
>   S: Scan Information: Composed for an underscanned display
>   C: Colorimetry: No Data
>   M: Picture Aspect Ratio: No Data
>   R: Active Portion Aspect Ratio: 8
>   ITC: IT Content: No Data
>   EC: Extended Colorimetry: xvYCC601
>   Q: RGB Quantization Range: Full Range

And that's used here by explicitly signaling Full Range.

Are you certain that what is dumped here is also what is transmitted?
I.e. there is no code that messes with the Q bit?

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
> InfoFrame of '/sys/kernel/debug/dri/2/HDMI-A-1/infoframes/hdmi' was empty.
> 
> ================
> 
> InfoFrame of '/sys/kernel/debug/dri/2/HDMI-A-1/infoframes/hdr_drm' was empty.
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
> My understanding from the AVI Q field is that the signal emitted is,
> indeed, using a Full Range RGB quantization. And again, this was working
> fine for the Auvidea board, so I think the KMS side is correct.
> 
> On the TC358743 end though, when capturing, the bridge does detect a
> limited range signal:
> 
> # v4l2-ctl -d /dev/v4l-subdev1  --log-status
> 
> Status Log:
> 
>    [  309.450790] tc358743 5-000f: =================  START STATUS  =================
>    [  309.467367] tc358743 5-000f: -----Chip status-----
>    [  309.477801] tc358743 5-000f: Chip ID: 0x00
>    [  309.486788] tc358743 5-000f: Chip revision: 0x00
>    [  309.496228] tc358743 5-000f: Reset: IR: 1, CEC: 0, CSI TX: 0, HDMI: 0
>    [  309.509326] tc358743 5-000f: Sleep mode: off
>    [  309.518023] tc358743 5-000f: Cable detected (+5V power): yes
>    [  309.530049] tc358743 5-000f: DDC lines enabled: yes
>    [  309.540552] tc358743 5-000f: Hotplug enabled: yes
>    [  309.550776] tc358743 5-000f: CEC enabled: no
>    [  309.559489] tc358743 5-000f: -----Signal status-----
>    [  309.569589] tc358743 5-000f: TMDS signal detected: yes
>    [  309.580029] tc358743 5-000f: Stable sync signal: yes
>    [  309.590130] tc358743 5-000f: PHY PLL locked: yes
>    [  309.599626] tc358743 5-000f: PHY DE detected: yes
>    [  309.616598] tc358743 5-000f: Detected format: 1280x720p60.00 (1650x750)
>    [  309.630071] tc358743 5-000f: horizontal: fp = 0, -sync = 370, bp = 0
>    [  309.642986] tc358743 5-000f: vertical: fp = 0, -sync = 30, bp = 0
>    [  309.655384] tc358743 5-000f: pixelclock: 74250000
>    [  309.664967] tc358743 5-000f: flags (0x0):
>    [  309.673118] tc358743 5-000f: standards (0x0):
>    [  309.681984] tc358743 5-000f: Configured format: 1280x720p60.00 (1650x750)
>    [  309.695774] tc358743 5-000f: horizontal: fp = 0, -sync = 370, bp = 0
>    [  309.708661] tc358743 5-000f: vertical: fp = 0, -sync = 30, bp = 0
>    [  309.721047] tc358743 5-000f: pixelclock: 74250000
>    [  309.730601] tc358743 5-000f: flags (0x0):
>    [  309.738771] tc358743 5-000f: standards (0x0):
>    [  309.747746] tc358743 5-000f: -----CSI-TX status-----
>    [  309.757852] tc358743 5-000f: Lanes needed: 2
>    [  309.766527] tc358743 5-000f: Lanes in use: 2
>    [  309.776027] tc358743 5-000f: Waiting for particular sync signal: no
>    [  309.789412] tc358743 5-000f: Transmit mode: yes
>    [  309.799290] tc358743 5-000f: Receive mode: no
>    [  309.808828] tc358743 5-000f: Stopped: no
>    [  309.816804] tc358743 5-000f: Color space: RGB 888 24-bit
>    [  309.828666] tc358743 5-000f: -----HDMI status-----
>    [  309.838425] tc358743 5-000f: HDCP encrypted content: no
>    [  309.849072] tc358743 5-000f: Input color space: RGB limited range
>    [  309.862244] tc358743 5-000f: AV Mute: off
>    [  309.870999] tc358743 5-000f: Deep color mode: 8-bits per channel
>    [  309.885806] tc358743 5-000f: HDMI infoframe: Auxiliary Video Information (AVI), version 2, length 13
>    [  309.904411] tc358743 5-000f:     colorspace: RGB
>    [  309.913822] tc358743 5-000f:     scan mode: Underscan
>    [  309.924112] tc358743 5-000f:     colorimetry: ITU601
>    [  309.934204] tc358743 5-000f:     picture aspect: No Data
>    [  309.945123] tc358743 5-000f:     active aspect: Same as Picture
>    [  309.957191] tc358743 5-000f:     itc: No Data
>    [  309.966183] tc358743 5-000f:     extended colorimetry: xvYCC 601
>    [  309.978415] tc358743 5-000f:     quantization range: Default
>    [  309.989908] tc358743 5-000f:     nups: Unknown Non-uniform Scaling
>    [  310.002477] tc358743 5-000f:     video code: 0
>    [  310.011518] tc358743 5-000f:     ycc quantization range: Limited
>    [  310.023745] tc358743 5-000f:     hdmi content type: Graphics
>    [  310.035264] tc358743 5-000f:     pixel repeat: 0
>    [  310.044669] tc358743 5-000f:     bar top 0, bottom 0, left 0, right 0

This is definitely a raw dump of the AVI InfoFrame, read directly from the
registers of the tc358743.

Since you see one thing in at the receiver side, and another thing at the transmitter side,
and it is highly unlikely that the receiver side is wrong, then the only thing I can
think of is that the AVI InfoFrame that you think the transmitter is sending is not
actually what is transmitted.

Have you traced it all the way to where the HDMI transmitter is programmed?

Regards,

	Hans

>    [  310.057769] tc358743 5-000f: ==================  END STATUS  ==================
> 
> The infoframes detected by the bridge look reasonable though, the only
> difference being that the quantization range is reported as "default",
> even though on the emitting side it's reported as Full Range.
> 
> The Input Color space does pick it up as limited though.
> 
> It looks like the registers responsible for the quantization selection
> and detection are 0x8528, 0x8573, 0x8574, and 0x8576, which, when dumped
> while the capture occurs, are:
> 
> # v4l2-dbg -d /dev/v4l-subdev1 -g 0x8528 -g 0x8573 -g 0x8574 -g 0x8576
> ioctl: VIDIOC_DBG_G_REGISTER
> Register 0x00008528 = 1h (1d  00000001b)
> Register 0x00008573 = 1h (1d  00000001b)
> Register 0x00008574 = 8h (8d  00001000b)
> Register 0x00008576 = 0h (0d  00000000b)
> 
> And so, while the 0x8576 (VI_REP) register does select RGB_FULL, it
> looks like the detected quantization in 0x8528 (VI_STATUS3) is indeed
> limited range.
> 
> I'm a bit at a loss here, and I cannot make any sense of why this code
> was working fine with one board and not the other, while it does look to
> me that the signal is indeed properly emitted, but isn't correctly
> detected by one variant of the bridge.
> 
> Would you have any idea of what's going on?
> 
> Thanks!
> Maxime


