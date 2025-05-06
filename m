Return-Path: <linux-media+bounces-31860-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C76A5AACA68
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 18:04:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3FB73ACBDA
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 16:04:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7D4D283FF3;
	Tue,  6 May 2025 16:04:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F08A280A47
	for <linux-media@vger.kernel.org>; Tue,  6 May 2025 16:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746547469; cv=none; b=WHPOMuov90bRBkDmJkEDeG4DFQW5KZyfo5wAWEVPwbA5MGz0oyIZVj9NpQwaCz50cnLwyzMKkBzaNKvvOxDCFVXYxwuP6ZVgxnqGxbVRYPpzd3xMMqWxDXuzPXePEg/Eze9+vuvfdB16jmCCbCpfHkyWNuXL7XjePE2tYusvkSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746547469; c=relaxed/simple;
	bh=jt6aicJyLb+M2/z86Qc3LLANZ4pTmFpgyDbZXL/emHA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MvQqrC/YsvcCImhgc7oQ4mDtQv9L6RCuRLwS4MVWd9gdrjenS0C97z+TXVXVOsBJOys+sojwTeq85eCfnJ1Y7lQR3grxulNclgHg+Sim8ymnt6bZIfzm2Xz2hY0Jt7Ng+JcwAZV3Vc/u+M2Bk5G+do9c/SPE7AFkP2jdJoRHoC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C944C4CEE4;
	Tue,  6 May 2025 16:04:27 +0000 (UTC)
Message-ID: <f0ac05fb-2bc0-4963-9da6-c322395bd294@xs4all.nl>
Date: Tue, 6 May 2025 18:04:26 +0200
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
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 xsFNBFQ84W0BEAC7EF1iL4s3tY8cRTVkJT/297h0Hz0ypA+ByVM4CdU9sN6ua/YoFlr9k0K4
 BFUlg7JzJoUuRbKxkYb8mmqOe722j7N3HO8+ofnio5cAP5W0WwDpM0kM84BeHU0aPSTsWiGR
 yw55SOK2JBSq7hueotWLfJLobMWhQii0Zd83hGT9SIt9uHaHjgwmtTH7MSTIiaY6N14nw2Ud
 C6Uykc1va0Wqqc2ov5ihgk/2k2SKa02ookQI3e79laOrbZl5BOXNKR9LguuOZdX4XYR3Zi6/
 BsJ7pVCK9xkiVf8svlEl94IHb+sa1KrlgGv3fn5xgzDw8Z222TfFceDL/2EzUyTdWc4GaPMC
 E/c1B4UOle6ZHg02+I8tZicjzj5+yffv1lB5A1btG+AmoZrgf0X2O1B96fqgHx8w9PIpVERN
 YsmkfxvhfP3MO3oHh8UY1OLKdlKamMneCLk2up1Zlli347KMjHAVjBAiy8qOguKF9k7HOjif
 JCLYTkggrRiEiE1xg4tblBNj8WGyKH+u/hwwwBqCd/Px2HvhAsJQ7DwuuB3vBAp845BJYUU3
 06kRihFqbO0vEt4QmcQDcbWINeZ2zX5TK7QQ91ldHdqJn6MhXulPKcM8tCkdD8YNXXKyKqNl
 UVqXnarz8m2JCbHgjEkUlAJCNd6m3pfESLZwSWsLYL49R5yxIwARAQABzSFIYW5zIFZlcmt1
 aWwgPGh2ZXJrdWlsQHhzNGFsbC5ubD7CwZUEEwEKAD8CGwMGCwkIBwMCBhUIAgkKCwQWAgMB
 Ah4BAheAFiEEBSzee8IVBTtonxvKvS1hSGYUO0wFAmaU3GkFCRf7lXsACgkQvS1hSGYUO0wZ
 cw//cLMiaV+p2rCyzdpDjWon2XD6M646THYvqXLb9eVWicFlVG78kNtHrHyEWKPhN3OdWWjn
 kOzXseVR/nS6vZvqCaT3rwgh3ZMb0GvOQk1/7V8UbcIERy036AjQoZmKo5tEDIv48MSvqxjj
 H6wbKXbCyvnIwpGICLyb0xAwvvpTaJkwZjvGqeo5EL0Z+cQ8fCelfKNO5CFFP3FNd3dH8wU6
 CHRtdZE03iIVEWpgCTjsG2zwsX/CKfPx0EKcrQajW3Tc50Jm0uuRUEKCVphlYORAPtFAF1dj
 Ly8zpN1bEXH+0FDXe/SHhzbvgS4sL0J4KQCCZ/GcbKh/vsDC1VLsGS5C7fKOhAtOkUPWRjF+
 kOEEcTOROMMvSUVokO+gCdb9nA/e3WMgiTwWRumWy5eCEnCpM9+rfI2HzTeACrVgGEDkOTHW
 eaGHEy8nS9a25ejQzsBhi+T7MW53ZTIjklR7dFl/uuK+EJ6DLbDpVbwyYo2oeiwP+sf8/Rgv
 WfJv4wzfUo/JABwrsbfWfycVZwFWBzqq+TaKFkMPm017dkLdg4MzxvvTMP7nKfJxU1bQ2OOr
 xkPk5KDcz+aRYBvTqEXgYZ6OZtnOUFKD+uPlbWf68vuz/1iFbQYnNJkTxwWhiIMN7BULK74d
 Ek89MU7JlbYNSv0v21lRF+uDo0J6zyoTt0ZxSPzOwU0EVDzhbQEQANzLiI6gHkIhBQKeQaYs
 p2SSqF9c++9LOy5x6nbQ4s0X3oTKaMGfBZuiKkkU6NnHCSa0Az5ScRWLaRGu1PzjgcVwzl5O
 sDawR1BtOG/XoPRNB2351PRp++W8TWo2viYYY0uJHKFHML+ku9q0P+NkdTzFGJLP+hn7x0RT
 DMbhKTHO3H2xJz5TXNE9zTJuIfGAz3ShDpijvzYieY330BzZYfpgvCllDVM5E4XgfF4F/N90
 wWKu50fMA01ufwu+99GEwTFVG2az5T9SXd7vfSgRSkzXy7hcnxj4IhOfM6Ts85/BjMeIpeqy
 TDdsuetBgX9DMMWxMWl7BLeiMzMGrfkJ4tvlof0sVjurXibTibZyfyGR2ricg8iTbHyFaAzX
 2uFVoZaPxrp7udDfQ96sfz0hesF9Zi8d7NnNnMYbUmUtaS083L/l2EDKvCIkhSjd48XF+aO8
 VhrCfbXWpGRaLcY/gxi2TXRYG9xCa7PINgz9SyO34sL6TeFPSZn4bPQV5O1j85Dj4jBecB1k
 z2arzwlWWKMZUbR04HTeAuuvYvCKEMnfW3ABzdonh70QdqJbpQGfAF2p4/iCETKWuqefiOYn
 pR8PqoQA1DYv3t7y9DIN5Jw/8Oj5wOeEybw6vTMB0rrnx+JaXvxeHSlFzHiD6il/ChDDkJ9J
 /ejCHUQIl40wLSDRABEBAAHCwXwEGAEKACYCGwwWIQQFLN57whUFO2ifG8q9LWFIZhQ7TAUC
 ZpTcxwUJF/uV2gAKCRC9LWFIZhQ7TMlPD/9ppgrN4Z9gXta9IdS8a+0E7lj/dc0LnF9T6MMq
 aUC+CFffTiOoNDnfXh8sfsqTjAT50TsVpdlH6YyPlbU5FR8bC8wntrJ6ZRWDdHJiCDLqNA/l
 GVtIKP1YW8fA01thMcVUyQCdVUqnByMJiJQDzZYrX+E/YKUTh2RL5Ye0foAGE7SGzfZagI0D
 OZN92w59e1Jg3zBhYXQIjzBbhGIy7usBfvE882GdUbP29bKfTpcOKkJIgO6K+w82D/1d5TON
 SD146+UySmEnjYxHI8kBYaZJ4ubyYrDGgXT3jIBPq8i9iZP3JSeZ/0F9UIlX4KeMSG8ymgCR
 SqL1y9pl9R2ewCepCahEkTT7IieGUzJZz7fGUaxrSyexPE1+qNosfrUIu3yhRA6AIjhwPisl
 aSwDxLI6qWDEQeeWNQaYUSEIFQ5XkZxd/VN8JeMwGIAq17Hlym+JzjBkgkm1LV9LXw9D8MQL
 e8tSeEXX8BZIen6y/y+U2CedzEsMKGjy5WNmufiPOzB3q2JwFQCw8AoNic7soPN9CVCEgd2r
 XS+OUZb8VvEDVRSK5Yf79RveqHvmhAdNOVh70f5CvwR/bfX/Ei2Szxz47KhZXpn1lxmcds6b
 LYjTAZF0anym44vsvOEuQg3rqxj/7Hiz4A3HIkrpTWclV6ru1tuGp/ZJ7aY8bdvztP2KTw==
In-Reply-To: <20250506-liberal-wine-bustard-8aa8fe@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/05/2025 16:03, Maxime Ripard wrote:
> On Tue, May 06, 2025 at 02:44:43PM +0200, Hans Verkuil wrote:
>> On 5/6/25 14:05, Maxime Ripard wrote:
>>> It's something we've discussed a bit on IRC a few week ago, but I have
>>> more data now, and can reproduce it on a mainline 6.13.12.
>>>
>>> I have recently switched from an Auvidea B101
>>> (https://auvidea.eu/product/b101-70501/) board to a Geekworm X1301
>>> (https://geekworm.com/products/x1301). Both feature a TC358743XBG
>>> according to their documentation, but the Auvideo one was bought in
>>> 2020-2021, whereas I bought the Geekworm this year, so I guess it could
>>> be a newer revision.
>>>
>>> Anyway, I have a v4l2 application on the CSI end of the TC358743 bridge,
>>> and a KMS application on the HDMI end. The KMS application sends frame
>>> through the HDMI cable, and the v4l2 application checks their integrity
>>> using a hash algorithm.
>>>
>>> Everything works nicely with the Auvidea board.
>>>
>>> When I swap the Geekwork one in though, the bridge driver detects the
>>> signal as limited range, and all the pixels are off. They are correct
>>> though if you account for the full range to limited range conversion.
>>>
>>> The EDID programmed in the bridge is:
>>>
>>> edid-decode (hex):
>>>
>>> 00 ff ff ff ff ff ff 00 0e 4e 42 00 42 42 42 42
>>> 00 22 01 03 81 a0 5a 78 0a 9c 68 a0 57 4a 9b 26
>>> 12 48 4c 20 00 00 01 01 01 01 01 01 01 01 01 01
>>> 01 01 01 01 01 01 01 1d 00 72 51 d0 1e 20 dc 28
>>> 45 04 40 84 63 00 00 1e 00 00 00 fc 00 44 72 61
>>> 64 69 73 0a 20 20 20 20 20 20 00 00 00 fd 00 3b
>>> 3d 1e 32 08 00 0a 20 20 20 20 20 20 00 00 00 10
>>> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 1b
>>>
>>> 02 03 11 81 e3 05 00 20 e2 00 4a 65 03 0c 00 10
>>> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>>> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>>> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>>> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>>> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>>> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>>> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 b1
>>
>> Is the EDID of the Auvidea B101 and the Geekworm X1301 the same?
>> I assume you program the EDID yourself and it is the same for both, right?
> 
> Yes :)
> 
>>> ----------------
>>>
>>> Block 0, Base EDID:
>>>   EDID Structure Version & Revision: 1.3
>>>   Vendor & Product Identification:
>>>     Manufacturer: CRN
>>>     Model: 66
>>>     Serial Number: 1111638594 (0x42424242)
>>>     Made in: 2024
>>>   Basic Display Parameters & Features:
>>>     Digital display
>>>     DFP 1.x compatible TMDS
>>>     Maximum image size: 160 cm x 90 cm
>>>     Gamma: 2.20
>>>     RGB color display
>>>     First detailed timing is the preferred timing
>>>   Color Characteristics:
>>>     Red  : 0.6269, 0.3408
>>>     Green: 0.2919, 0.6054
>>>     Blue : 0.1494, 0.0722
>>>     White: 0.2832, 0.2968
>>>   Established Timings I & II:
>>>     DMT 0x04:   640x480    59.940476 Hz   4:3     31.469 kHz     25.175000 MHz
>>>   Standard Timings: none
>>>   Detailed Timing Descriptors:
>>>     DTD 1:  1280x720    60.000000 Hz  16:9     45.000 kHz     74.250000 MHz (1600 mm x 900 mm)
>>>                  Hfront  220 Hsync  40 Hback  110 Hpol P
>>>                  Vfront   20 Vsync   5 Vback    5 Vpol P
>>>     Display Product Name: 'Dradis'
>>>     Display Range Limits:
>>>       Monitor ranges (GTF): 59-61 Hz V, 30-50 kHz H, max dotclock 80 MHz
>>>     Dummy Descriptor:
>>>   Extension blocks: 1
>>> Checksum: 0x1b
>>>
>>> ----------------
>>>
>>> Block 1, CTA-861 Extension Block:
>>>   Revision: 3
>>>   Underscans IT Video Formats by default
>>>   Native detailed modes: 1
>>>   Colorimetry Data Block:
>>>     sRGB
>>>   Video Capability Data Block:
>>>     YCbCr quantization: No Data
>>>     RGB quantization: Selectable (via AVI Q)
>>
>> This is important for RGB Quantization Range as it indicates that
>> you can explicitly signal the RGB Quantization Range in the AVI InfoFrame
>> instead of having to rely on the 'default' behavior.
>>
>>>     PT scan behavior: No Data
>>>     IT scan behavior: Always Underscanned
>>>     CE scan behavior: Always Underscanned
>>>   Vendor-Specific Data Block (HDMI), OUI 00-0C-03:
>>>     Source physical address: 1.0.0.0
>>> Checksum: 0xb1  Unused space in Extension Block: 110 bytes
>>> [root@rpi-ab2f2485 ~]# edid-decode edid-dumps/test-edid.bin --check
>>> edid-decode (hex):
>>>
>>> 00 ff ff ff ff ff ff 00 0e 4e 42 00 42 42 42 42
>>> 00 22 01 03 81 a0 5a 78 0a 9c 68 a0 57 4a 9b 26
>>> 12 48 4c 20 00 00 01 01 01 01 01 01 01 01 01 01
>>> 01 01 01 01 01 01 01 1d 00 72 51 d0 1e 20 dc 28
>>> 45 04 40 84 63 00 00 1e 00 00 00 fc 00 44 72 61
>>> 64 69 73 0a 20 20 20 20 20 20 00 00 00 fd 00 3b
>>> 3d 1e 32 08 00 0a 20 20 20 20 20 20 00 00 00 10
>>> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 1b
>>>
>>> 02 03 11 81 e3 05 00 20 e2 00 4a 65 03 0c 00 10
>>> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>>> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>>> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>>> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>>> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>>> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>>> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 b1
>>>
>>> ----------------
>>>
>>> Block 0, Base EDID:
>>>   EDID Structure Version & Revision: 1.3
>>>   Vendor & Product Identification:
>>>     Manufacturer: CRN
>>>     Model: 66
>>>     Serial Number: 1111638594 (0x42424242)
>>>     Made in: 2024
>>>   Basic Display Parameters & Features:
>>>     Digital display
>>>     DFP 1.x compatible TMDS
>>>     Maximum image size: 160 cm x 90 cm
>>>     Gamma: 2.20
>>>     RGB color display
>>>     First detailed timing is the preferred timing
>>>   Color Characteristics:
>>>     Red  : 0.6269, 0.3408
>>>     Green: 0.2919, 0.6054
>>>     Blue : 0.1494, 0.0722
>>>     White: 0.2832, 0.2968
>>>   Established Timings I & II:
>>>     DMT 0x04:   640x480    59.940476 Hz   4:3     31.469 kHz     25.175000 MHz
>>>   Standard Timings: none
>>>   Detailed Timing Descriptors:
>>>     DTD 1:  1280x720    60.000000 Hz  16:9     45.000 kHz     74.250000 MHz (1600 mm x 900 mm)
>>>                  Hfront  220 Hsync  40 Hback  110 Hpol P
>>>                  Vfront   20 Vsync   5 Vback    5 Vpol P
>>>     Display Product Name: 'Dradis'
>>>     Display Range Limits:
>>>       Monitor ranges (GTF): 59-61 Hz V, 30-50 kHz H, max dotclock 80 MHz
>>>     Dummy Descriptor:
>>>   Extension blocks: 1
>>> Checksum: 0x1b
>>>
>>> ----------------
>>>
>>> Block 1, CTA-861 Extension Block:
>>>   Revision: 3
>>>   Underscans IT Video Formats by default
>>>   Native detailed modes: 1
>>>   Colorimetry Data Block:
>>>     sRGB
>>>   Video Capability Data Block:
>>>     YCbCr quantization: No Data
>>>     RGB quantization: Selectable (via AVI Q)
>>>     PT scan behavior: No Data
>>>     IT scan behavior: Always Underscanned
>>>     CE scan behavior: Always Underscanned
>>>   Vendor-Specific Data Block (HDMI), OUI 00-0C-03:
>>>     Source physical address: 1.0.0.0
>>> Checksum: 0xb1  Unused space in Extension Block: 110 bytes
>>>
>>> ----------------
>>>
>>> edid-decode SHA: SHA DATE
>>>
>>> Warnings:
>>>
>>> Block 0, Base EDID:
>>>   Detailed Timing Descriptor #1: DTD is similar but not identical to VIC 4.
>>>
>>> EDID conformity: PASS
>>>
>>> On the KMS side, the EDID received (checked through
>>> /sys/class/drm/card2-HDMI-A-1/edid) is identical (md5sum match).
>>>
>>> Once I start the KMS application, the infoframes look decent too:
>>>
>>> # edid-decode /sys/class/drm/card2-HDMI-A-1/edid \
>>>   -I /sys/kernel/debug/dri/2/HDMI-A-1/infoframes/audio \
>>>   -I /sys/kernel/debug/dri/2/HDMI-A-1/infoframes/avi \
>>>   -I /sys/kernel/debug/dri/2/HDMI-A-1/infoframes/hdmi \
>>>   -I /sys/kernel/debug/dri/2/HDMI-A-1/infoframes/hdr_drm \
>>>   -I /sys/kernel/debug/dri/2/HDMI-A-1/infoframes/spd
>>>
>>> edid-decode (hex):
>>>
>>> 00 ff ff ff ff ff ff 00 0e 4e 42 00 42 42 42 42
>>> 00 22 01 03 81 a0 5a 78 0a 9c 68 a0 57 4a 9b 26
>>> 12 48 4c 20 00 00 01 01 01 01 01 01 01 01 01 01
>>> 01 01 01 01 01 01 01 1d 00 72 51 d0 1e 20 dc 28
>>> 45 04 40 84 63 00 00 1e 00 00 00 fc 00 44 72 61
>>> 64 69 73 0a 20 20 20 20 20 20 00 00 00 fd 00 3b
>>> 3d 1e 32 08 00 0a 20 20 20 20 20 20 00 00 00 10
>>> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 1b
>>>
>>> 02 03 11 81 e3 05 00 20 e2 00 4a 65 03 0c 00 10
>>> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>>> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>>> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>>> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>>> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>>> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>>> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 b1
>>>
>>> ----------------
>>>
>>> Block 0, Base EDID:
>>>   EDID Structure Version & Revision: 1.3
>>>   Vendor & Product Identification:
>>>     Manufacturer: CRN
>>>     Model: 66
>>>     Serial Number: 1111638594 (0x42424242)
>>>     Made in: 2024
>>>   Basic Display Parameters & Features:
>>>     Digital display
>>>     DFP 1.x compatible TMDS
>>>     Maximum image size: 160 cm x 90 cm
>>>     Gamma: 2.20
>>>     RGB color display
>>>     First detailed timing is the preferred timing
>>>   Color Characteristics:
>>>     Red  : 0.6269, 0.3408
>>>     Green: 0.2919, 0.6054
>>>     Blue : 0.1494, 0.0722
>>>     White: 0.2832, 0.2968
>>>   Established Timings I & II:
>>>     DMT 0x04:   640x480    59.940476 Hz   4:3     31.469 kHz     25.175000 MHz
>>>   Standard Timings: none
>>>   Detailed Timing Descriptors:
>>>     DTD 1:  1280x720    60.000000 Hz  16:9     45.000 kHz     74.250000 MHz (1600 mm x 900 mm)
>>>                  Hfront  220 Hsync  40 Hback  110 Hpol P
>>>                  Vfront   20 Vsync   5 Vback    5 Vpol P
>>>     Display Product Name: 'Dradis'
>>>     Display Range Limits:
>>>       Monitor ranges (GTF): 59-61 Hz V, 30-50 kHz H, max dotclock 80 MHz
>>>     Dummy Descriptor:
>>>   Extension blocks: 1
>>> Checksum: 0x1b
>>>
>>> ----------------
>>>
>>> Block 1, CTA-861 Extension Block:
>>>   Revision: 3
>>>   Underscans IT Video Formats by default
>>>   Native detailed modes: 1
>>>   Colorimetry Data Block:
>>>     sRGB
>>>   Video Capability Data Block:
>>>     YCbCr quantization: No Data
>>>     RGB quantization: Selectable (via AVI Q)
>>>     PT scan behavior: No Data
>>>     IT scan behavior: Always Underscanned
>>>     CE scan behavior: Always Underscanned
>>>   Vendor-Specific Data Block (HDMI), OUI 00-0C-03:
>>>     Source physical address: 1.0.0.0
>>> Checksum: 0xb1  Unused space in Extension Block: 110 bytes
>>>
>>> ================
>>>
>>> InfoFrame of '/sys/kernel/debug/dri/2/HDMI-A-1/infoframes/audio' was empty.
>>>
>>> ================
>>>
>>> edid-decode InfoFrame (hex):
>>>
>>> 82 02 0d 4d 12 08 08 00 00 00 00 00 00 00 00 00
>>> 00
>>>
>>> ----------------
>>>
>>> HDMI InfoFrame Checksum: 0x4d
>>>
>>> AVI InfoFrame
>>>   Version: 2
>>>   Length: 13
>>>   Y: Color Component Sample Format: RGB
>>>   A: Active Format Information Present: Yes
>>>   B: Bar Data Present: Bar Data not present
>>>   S: Scan Information: Composed for an underscanned display
>>>   C: Colorimetry: No Data
>>>   M: Picture Aspect Ratio: No Data
>>>   R: Active Portion Aspect Ratio: 8
>>>   ITC: IT Content: No Data
>>>   EC: Extended Colorimetry: xvYCC601
>>>   Q: RGB Quantization Range: Full Range
>>
>> And that's used here by explicitly signaling Full Range.
>>
>> Are you certain that what is dumped here is also what is transmitted?
>> I.e. there is no code that messes with the Q bit?
> 
> AFAIK, the infoframe is programmed as is in the KMS driver. I can't be
> certain about how the driver behaves though, but see below.
> 
>>>   SC: Non-Uniform Picture Scaling: No Known non-uniform scaling
>>>   YQ: YCC Quantization Range: Limited Range
>>>   CN: IT Content Type: Graphics
>>>   PR: Pixel Data Repetition Count: 0
>>>   Line Number of End of Top Bar: 0
>>>   Line Number of Start of Bottom Bar: 0
>>>   Pixel Number of End of Left Bar: 0
>>>   Pixel Number of Start of Right Bar: 0
>>>
>>> ================
>>>
>>> InfoFrame of '/sys/kernel/debug/dri/2/HDMI-A-1/infoframes/hdmi' was empty.
>>>
>>> ================
>>>
>>> InfoFrame of '/sys/kernel/debug/dri/2/HDMI-A-1/infoframes/hdr_drm' was empty.
>>>
>>> ================
>>>
>>> edid-decode InfoFrame (hex):
>>>
>>> 83 01 19 93 42 72 6f 61 64 63 6f 6d 56 69 64 65
>>> 6f 63 6f 72 65 00 00 00 00 00 00 00 09
>>>
>>> ----------------
>>>
>>> HDMI InfoFrame Checksum: 0x93
>>>
>>> Source Product Description InfoFrame
>>>   Version: 1
>>>   Length: 25
>>>   Vendor Name: 'Broadcom'
>>>   Product Description: 'Videocore'
>>>   Source Information: PC general
>>>
>>> My understanding from the AVI Q field is that the signal emitted is,
>>> indeed, using a Full Range RGB quantization. And again, this was working
>>> fine for the Auvidea board, so I think the KMS side is correct.
>>>
>>> On the TC358743 end though, when capturing, the bridge does detect a
>>> limited range signal:
>>>
>>> # v4l2-ctl -d /dev/v4l-subdev1  --log-status
>>>
>>> Status Log:
>>>
>>>    [  309.450790] tc358743 5-000f: =================  START STATUS  =================
>>>    [  309.467367] tc358743 5-000f: -----Chip status-----
>>>    [  309.477801] tc358743 5-000f: Chip ID: 0x00
>>>    [  309.486788] tc358743 5-000f: Chip revision: 0x00
>>>    [  309.496228] tc358743 5-000f: Reset: IR: 1, CEC: 0, CSI TX: 0, HDMI: 0
>>>    [  309.509326] tc358743 5-000f: Sleep mode: off
>>>    [  309.518023] tc358743 5-000f: Cable detected (+5V power): yes
>>>    [  309.530049] tc358743 5-000f: DDC lines enabled: yes
>>>    [  309.540552] tc358743 5-000f: Hotplug enabled: yes
>>>    [  309.550776] tc358743 5-000f: CEC enabled: no
>>>    [  309.559489] tc358743 5-000f: -----Signal status-----
>>>    [  309.569589] tc358743 5-000f: TMDS signal detected: yes
>>>    [  309.580029] tc358743 5-000f: Stable sync signal: yes
>>>    [  309.590130] tc358743 5-000f: PHY PLL locked: yes
>>>    [  309.599626] tc358743 5-000f: PHY DE detected: yes
>>>    [  309.616598] tc358743 5-000f: Detected format: 1280x720p60.00 (1650x750)
>>>    [  309.630071] tc358743 5-000f: horizontal: fp = 0, -sync = 370, bp = 0
>>>    [  309.642986] tc358743 5-000f: vertical: fp = 0, -sync = 30, bp = 0
>>>    [  309.655384] tc358743 5-000f: pixelclock: 74250000
>>>    [  309.664967] tc358743 5-000f: flags (0x0):
>>>    [  309.673118] tc358743 5-000f: standards (0x0):
>>>    [  309.681984] tc358743 5-000f: Configured format: 1280x720p60.00 (1650x750)
>>>    [  309.695774] tc358743 5-000f: horizontal: fp = 0, -sync = 370, bp = 0
>>>    [  309.708661] tc358743 5-000f: vertical: fp = 0, -sync = 30, bp = 0
>>>    [  309.721047] tc358743 5-000f: pixelclock: 74250000
>>>    [  309.730601] tc358743 5-000f: flags (0x0):
>>>    [  309.738771] tc358743 5-000f: standards (0x0):
>>>    [  309.747746] tc358743 5-000f: -----CSI-TX status-----
>>>    [  309.757852] tc358743 5-000f: Lanes needed: 2
>>>    [  309.766527] tc358743 5-000f: Lanes in use: 2
>>>    [  309.776027] tc358743 5-000f: Waiting for particular sync signal: no
>>>    [  309.789412] tc358743 5-000f: Transmit mode: yes
>>>    [  309.799290] tc358743 5-000f: Receive mode: no
>>>    [  309.808828] tc358743 5-000f: Stopped: no
>>>    [  309.816804] tc358743 5-000f: Color space: RGB 888 24-bit
>>>    [  309.828666] tc358743 5-000f: -----HDMI status-----
>>>    [  309.838425] tc358743 5-000f: HDCP encrypted content: no
>>>    [  309.849072] tc358743 5-000f: Input color space: RGB limited range
>>>    [  309.862244] tc358743 5-000f: AV Mute: off
>>>    [  309.870999] tc358743 5-000f: Deep color mode: 8-bits per channel
>>>    [  309.885806] tc358743 5-000f: HDMI infoframe: Auxiliary Video Information (AVI), version 2, length 13
>>>    [  309.904411] tc358743 5-000f:     colorspace: RGB
>>>    [  309.913822] tc358743 5-000f:     scan mode: Underscan
>>>    [  309.924112] tc358743 5-000f:     colorimetry: ITU601
>>>    [  309.934204] tc358743 5-000f:     picture aspect: No Data
>>>    [  309.945123] tc358743 5-000f:     active aspect: Same as Picture
>>>    [  309.957191] tc358743 5-000f:     itc: No Data
>>>    [  309.966183] tc358743 5-000f:     extended colorimetry: xvYCC 601
>>>    [  309.978415] tc358743 5-000f:     quantization range: Default
>>>    [  309.989908] tc358743 5-000f:     nups: Unknown Non-uniform Scaling
>>>    [  310.002477] tc358743 5-000f:     video code: 0
>>>    [  310.011518] tc358743 5-000f:     ycc quantization range: Limited
>>>    [  310.023745] tc358743 5-000f:     hdmi content type: Graphics
>>>    [  310.035264] tc358743 5-000f:     pixel repeat: 0
>>>    [  310.044669] tc358743 5-000f:     bar top 0, bottom 0, left 0, right 0
>>
>> This is definitely a raw dump of the AVI InfoFrame, read directly from
>> the registers of the tc358743.
>>
>> Sincxe you see one thing in at the receiver side, and another thing at
>> the transmitter side, and it is highly unlikely that the receiver side
>> is wrong, then the only thing I can think of is that the AVI InfoFrame
>> that you think the transmitter is sending is not actually what is
>> transmitted.
> 
> I'd still bet on the TC358743 behaving differently.
> 
> If I keep things exactly the same on the transmitter side, and on the
> receiver side use the exact same system, during the video capture, I
> get:
> 
> # v4l2-ctl -d /dev/v4l-subdev1  --log-status
> 
> Status Log:
> 
>    [   94.289872] tc358743 5-000f: =================  START STATUS  =================
>    [   94.299064] tc358743 5-000f: -----Chip status-----
>    [   94.304595] tc358743 5-000f: Chip ID: 0x00
>    [   94.309507] tc358743 5-000f: Chip revision: 0x00
>    [   94.314262] tc358743 5-000f: Reset: IR: 1, CEC: 0, CSI TX: 0, HDMI: 0
>    [   94.320851] tc358743 5-000f: Sleep mode: off
>    [   94.325275] tc358743 5-000f: Cable detected (+5V power): yes
>    [   94.331620] tc358743 5-000f: DDC lines enabled: yes
>    [   94.337220] tc358743 5-000f: Hotplug enabled: yes
>    [   94.342673] tc358743 5-000f: CEC enabled: no
>    [   94.347076] tc358743 5-000f: -----Signal status-----
>    [   94.352156] tc358743 5-000f: TMDS signal detected: yes
>    [   94.357424] tc358743 5-000f: Stable sync signal: yes
>    [   94.362500] tc358743 5-000f: PHY PLL locked: yes
>    [   94.367219] tc358743 5-000f: PHY DE detected: yes
>    [   94.380192] tc358743 5-000f: Detected format: 1280x720p60.00 (1650x750)
>    [   94.387225] tc358743 5-000f: horizontal: fp = 0, -sync = 370, bp = 0
>    [   94.393754] tc358743 5-000f: vertical: fp = 0, -sync = 30, bp = 0
>    [   94.400012] tc358743 5-000f: pixelclock: 74250000
>    [   94.404830] tc358743 5-000f: flags (0x0):
>    [   94.408931] tc358743 5-000f: standards (0x0):
>    [   94.413403] tc358743 5-000f: Configured format: 1280x720p60.00 (1650x750)
>    [   94.420340] tc358743 5-000f: horizontal: fp = 0, -sync = 370, bp = 0
>    [   94.426934] tc358743 5-000f: vertical: fp = 0, -sync = 30, bp = 0
>    [   94.433180] tc358743 5-000f: pixelclock: 74250000
>    [   94.437984] tc358743 5-000f: flags (0x0):
>    [   94.442106] tc358743 5-000f: standards (0x0):
>    [   94.446574] tc358743 5-000f: -----CSI-TX status-----
>    [   94.451645] tc358743 5-000f: Lanes needed: 2
>    [   94.456030] tc358743 5-000f: Lanes in use: 2
>    [   94.461038] tc358743 5-000f: Waiting for particular sync signal: no
>    [   94.468106] tc358743 5-000f: Transmit mode: yes
>    [   94.473868] tc358743 5-000f: Receive mode: no
>    [   94.478975] tc358743 5-000f: Stopped: no
>    [   94.483032] tc358743 5-000f: Color space: RGB 888 24-bit
>    [   94.489012] tc358743 5-000f: -----HDMI status-----
>    [   94.493945] tc358743 5-000f: HDCP encrypted content: no
>    [   94.499314] tc358743 5-000f: Input color space: RGB full range
>    [   94.506104] tc358743 5-000f: AV Mute: off
>    [   94.511054] tc358743 5-000f: Deep color mode: 8-bits per channel
>    [   94.519839] tc358743 5-000f: HDMI infoframe: Auxiliary Video Information (AVI), version 2, length 13
>    [   94.529179] tc358743 5-000f:     colorspace: RGB
>    [   94.533941] tc358743 5-000f:     scan mode: Underscan
>    [   94.539121] tc358743 5-000f:     colorimetry: No Data
>    [   94.544305] tc358743 5-000f:     picture aspect: No Data
>    [   94.549751] tc358743 5-000f:     active aspect: Same as Picture
>    [   94.555794] tc358743 5-000f:     itc: No Data
>    [   94.560266] tc358743 5-000f:     extended colorimetry: xvYCC 601
>    [   94.566427] tc358743 5-000f:     quantization range: Full
>    [   94.571998] tc358743 5-000f:     nups: Unknown Non-uniform Scaling
>    [   94.578345] tc358743 5-000f:     video code: 0
>    [   94.582907] tc358743 5-000f:     ycc quantization range: Limited
>    [   94.589045] tc358743 5-000f:     hdmi content type: Graphics
>    [   94.594941] tc358743 5-000f:     pixel repeat: 0
>    [   94.599705] tc358743 5-000f:     bar top 0, bottom 0, left 0, right 0
>    [   94.606306] tc358743 5-000f: ==================  END STATUS  ==================
> 
> # v4l2-dbg -d /dev/v4l-subdev1 -g 0x8528 -g 0x8573 -g 0x8574 -g 0x8576
> ioctl: VIDIOC_DBG_G_REGISTER
> Register 0x00008528 = 0h (0d  00000000b)
> Register 0x00008573 = 1h (1d  00000001b)
> Register 0x00008574 = 8h (8d  00001000b)
> Register 0x00008576 = 0h (0d  00000000b)
> 
> Which definitely looks like the chip on the Auvidea board detects the
> quantization differently from the same video feed.
> 
> Could it be something like a pin strap on the board that is set
> differently and affects the chip behaviour? Or a bit somewhere not being
> initialized to what it should and changed default?

Can you dump the value of register 0x8570? Is it different for the two boards?

Regards,

	Hans

> 
> Maxime


