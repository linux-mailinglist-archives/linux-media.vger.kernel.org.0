Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C115411E05F
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2019 10:12:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726170AbfLMJMj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Dec 2019 04:12:39 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:38579 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725980AbfLMJMi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Dec 2019 04:12:38 -0500
Received: by mail-wr1-f66.google.com with SMTP id y17so5801668wrh.5
        for <linux-media@vger.kernel.org>; Fri, 13 Dec 2019 01:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:openpgp:autocrypt:organization
         :message-id:date:user-agent:mime-version:in-reply-to;
        bh=rWt1q/vEeEVbF+yEnz16jeMd6eO5L70OARQdrU8zDtc=;
        b=B5LRz1m2ghh2MOK6JEprWxfTaaYDrFyxx8C9wgAFPtkw2omP3OyKFzU99hQAT1JSAV
         2WFu8knXt2TaD2VBML6R3Uxoxa1iO2sU+0bDWhZUKWFiuJhfBM6iGwj4PS+mjBA61r0x
         nb/h3K9DlkJdhgPEnn0oT/JHjqGdT5n9hDeZmL3XMtiOa7tRj2B+B2W0cdQUAFAgMEI8
         P7p7lgOIxWABPULt+wtVhxMblUgUMr0MURHh1EPGDYYVyLWjuks/lEFteuDjUfTZ+LIb
         poMbVzMUNctno9WVMt884uIR+/K2Tho0apR1IoEKD+H6ng0VND08at7qBCqQf/yHIliM
         eXog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to;
        bh=rWt1q/vEeEVbF+yEnz16jeMd6eO5L70OARQdrU8zDtc=;
        b=k0oVNidyYFidOMX6I8ta/Ofpq5H6WYkFMaRARpi6pbBPTBFEpZNijIjxIiqys6YdyC
         UWineAMjYHaUDcF5lXc0ipkk1I3PjWMPO7zmepy3xcOvSfdtXsydQ4Ml2U6umcIBfJjk
         MjvC0DENXshiC4rnw10foKTsYh/qGQ5PJx9gTe/HBEK+ifqJVYeNzfeGCHZ0rUqcd0Mj
         se0Pvx2KG056bjw8JSEhuRfR8gZbvFM+0cLDrUdDnscGkYBx6sDHbScdYj9EzDmQ87jK
         qBXneiPIR2QpnAN7KNeIDHr41UaXacdr1OuyhseqmA6dG82s/VkbV755FanD0xTRErmc
         994Q==
X-Gm-Message-State: APjAAAUY2Vu21yvAHP08+uowCe6gF+H94v3/ivAVqneaZkPthsogqbnC
        p9PBap7wgfmd5UshMJ2vzGtAlA==
X-Google-Smtp-Source: APXvYqyDC/XuqVmKwI1n82QjbC1znUmVQ7yMVLQ/fY+owmA0HzULjEesXcgdW3/pymDvmYUol36xug==
X-Received: by 2002:a5d:5307:: with SMTP id e7mr11845072wrv.146.1576228354430;
        Fri, 13 Dec 2019 01:12:34 -0800 (PST)
Received: from [10.2.4.229] (lfbn-nic-1-505-157.w90-116.abo.wanadoo.fr. [90.116.92.157])
        by smtp.gmail.com with ESMTPSA id g21sm10197750wmh.17.2019.12.13.01.12.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Dec 2019 01:12:33 -0800 (PST)
Subject: Re: [PATCH 0/5] media: meson: vdec: Add VP9 decoding support
To:     Nicolas Dufresne <nicolas@ndufresne.ca>, mchehab@kernel.org,
        hans.verkuil@cisco.com
Cc:     linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
References: <20191205092454.26075-1-narmstrong@baylibre.com>
 <4ee20fdf5182b7bfe338e9ae044424b6125fed15.camel@ndufresne.ca>
 <60fa8f55-de40-13fa-b584-ad9f020cde12@baylibre.com>
 <1a570c6e07fcd0d0ddc401a3640dfca07f22304d.camel@ndufresne.ca>
From:   Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <ba2cefa3-1ab8-6eb9-8e69-93d6a3ef68d9@baylibre.com>
Date:   Fri, 13 Dec 2019 10:12:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1a570c6e07fcd0d0ddc401a3640dfca07f22304d.camel@ndufresne.ca>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="H6Y9TyX5Bl7bwWDy8BWI7XoBTgjeltSAh"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--H6Y9TyX5Bl7bwWDy8BWI7XoBTgjeltSAh
Content-Type: multipart/mixed; boundary="BySJcvjvxfZ1gJyoSuVoZUxjIRCmOaxPz";
 protected-headers="v1"
From: Neil Armstrong <narmstrong@baylibre.com>
To: Nicolas Dufresne <nicolas@ndufresne.ca>, mchehab@kernel.org,
 hans.verkuil@cisco.com
Cc: linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <ba2cefa3-1ab8-6eb9-8e69-93d6a3ef68d9@baylibre.com>
Subject: Re: [PATCH 0/5] media: meson: vdec: Add VP9 decoding support
References: <20191205092454.26075-1-narmstrong@baylibre.com>
 <4ee20fdf5182b7bfe338e9ae044424b6125fed15.camel@ndufresne.ca>
 <60fa8f55-de40-13fa-b584-ad9f020cde12@baylibre.com>
 <1a570c6e07fcd0d0ddc401a3640dfca07f22304d.camel@ndufresne.ca>
In-Reply-To: <1a570c6e07fcd0d0ddc401a3640dfca07f22304d.camel@ndufresne.ca>

--BySJcvjvxfZ1gJyoSuVoZUxjIRCmOaxPz
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 05/12/2019 19:46, Nicolas Dufresne wrote:
> Le jeudi 05 d=C3=A9cembre 2019 =C3=A0 16:49 +0100, Neil Armstrong a =C3=
=A9crit :
>> On 05/12/2019 16:42, Nicolas Dufresne wrote:
>>> Hi Neil,
>>>
>>> Le jeudi 05 d=C3=A9cembre 2019 =C3=A0 10:24 +0100, Neil Armstrong a =C3=
=A9crit :
>>>> Hello,
>>>>
>>>> This patchset aims to bring VP9 decoding support to Amlogic GXL, G12=
A & SM1
>>>> platforms for the amlogic stateful video decoder driver.
>>>>
>>>> With this, it passes v4l2-compliance with streaming on Amlogic G12A =
and
>>>> Amlogic SM1 SoCs successfully using the stream at [1] with a fixed
>>>> pyv4l2compliance script for VP9 at [2].
>>>>
>>>> The original script kept the IVF headers in the stream, confusing th=
e
>>>> decoder. The fixed script only extracts the payload from the IVF con=
tainer.
>>>>
>>>> The decoder has been tested using the Google CTS TestVectorsIttiam V=
P9 yuv420
>>>> samples, passing 82 resolutions test streams, with 13 fails by pixel=

>>>> differences and 3 timeouts.
>>>
>>> How do you handle resolution changes on delta frames ? It's a bit of =
a
>>> challenge since the reference frames are not at the same resolution a=
s
>>> the frames to be decoded. This breaks the assumption for the resoluti=
on
>>> changes mechanism as described in the spec.
>>
>> I don't have a lot of experience on the subject, but in the vendor imp=
lementation,
>> they store the resolution along the reference frames and when loading =
all the
>> reference frames to the HW, the original resolution is also loaded.
>> But we don't handle it.
>>
>>> On stateless side, Boris is introducing DESTROY_BUFS, so we can free
>>> the references when they are not used anymore. But the reference are
>>> managed by userspace and are not queued. While on stateful side so fa=
r,
>>> it was assumed that references are queued, and the semantic of S_FMT =
is
>>> that it must apply to the entire set of queued buffer.
>>
>> yes
>>
>>> I think most streams will work and won't use this feature, but I'm
>>> worried that writing a compliant VP9 decoder is currently not possibl=
e.
>>
>> Indeed, but I don't have a clear enough view on the subject, and it do=
esn't seem
>> I have any test stream with such feature.
>=20
> https://www.webmproject.org/vp9/levels/
>=20
> I believe in the performance suite, the FRM_RESIZE sample is what
> should exercise this.

Thanks for pointing this test suite... all samples were failing :-p

Now we added the probability handling and all samples works (except the u=
nsupported level).
The ref handling was tricky aswell, anyway it's all fixed except FRM_RESI=
ZE which will
be a hell of hacking to tackle.

The hack would be to keep the refs buffers we still need after frame resi=
zing on drain,
then use the max(old_frame_size, new_frame_size) as capture buffer size, =
then copy back
the old refs buffers into the newly queued buffers and continue.

It's a ugly hack, but won't break the drain + S_FMT semantic.
But I will fix this _after_ the v2 of this serie is merged.

Neil

>=20
>>
>> Neil
>>
>>>> This patchset depends on :
>>>> - G12A enablement at [3]
>>>> - SM1 enablement at [4]
>>>> - H.264 and compliance at [5]
>>>>
>>>> [1] https://github.com/superna9999/pyv4l2compliance/raw/tests/output=
/Jellyfish_1080_10s_5MB.vp9.hdr
>>>> [2] https://github.com/superna9999/pyv4l2compliance
>>>> [3] https://lore.kernel.org/linux-media/20191120111430.29552-1-narms=
trong@baylibre.com
>>>> [4] https://lore.kernel.org/linux-media/20191121101429.23831-1-narms=
trong@baylibre.com
>>>> [5] https://lore.kernel.org/linux-media/20191126093733.32404-1-narms=
trong@baylibre.com
>>>>
>>>> The compliance log is:
>>>> # v4l2-compliance --stream-from-hdr Jellyfish_1080_10s_5MB.vp9.hdr -=
s 200
>>>> v4l2-compliance SHA: 7ead0e1856b89f2e19369af452bb03fd0cd16793, 64 bi=
ts
>>>>
>>>> Compliance test for meson-vdec device /dev/video0:
>>>>
>>>> Driver Info:
>>>> 	Driver name      : meson-vdec
>>>> 	Card type        : Amlogic Video Decoder
>>>> 	Bus info         : platform:meson-vdec
>>>> 	Driver version   : 5.4.0
>>>> 	Capabilities     : 0x84204000
>>>> 		Video Memory-to-Memory Multiplanar
>>>> 		Streaming
>>>> 		Extended Pix Format
>>>> 		Device Capabilities
>>>> 	Device Caps      : 0x04204000
>>>> 		Video Memory-to-Memory Multiplanar
>>>> 		Streaming
>>>> 		Extended Pix Format
>>>> 	Detected Stateful Decoder
>>>>
>>>> Required ioctls:
>>>> 	test VIDIOC_QUERYCAP: OK
>>>>
>>>> Allow for multiple opens:
>>>> 	test second /dev/video0 open: OK
>>>> 	test VIDIOC_QUERYCAP: OK
>>>> 	test VIDIOC_G/S_PRIORITY: OK
>>>> 	test for unlimited opens: OK
>>>>
>>>> Debug ioctls:
>>>> 	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>>> 	test VIDIOC_LOG_STATUS: OK (Not Supported)
>>>>
>>>> Input ioctls:
>>>> 	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>>> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>> 	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>>> 	test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>>> 	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>>> 	test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>>> 	Inputs: 0 Audio Inputs: 0 Tuners: 0
>>>>
>>>> Output ioctls:
>>>> 	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>>> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>> 	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>>> 	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>>> 	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>>> 	Outputs: 0 Audio Outputs: 0 Modulators: 0
>>>>
>>>> Input/Output configuration ioctls:
>>>> 	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>>> 	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>>> 	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>>> 	test VIDIOC_G/S_EDID: OK (Not Supported)
>>>>
>>>> Control ioctls:
>>>> 	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>>>> 	test VIDIOC_QUERYCTRL: OK
>>>> 	test VIDIOC_G/S_CTRL: OK
>>>> 	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>>>> 	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>>>> 	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>>> 	Standard Controls: 2 Private Controls: 0
>>>>
>>>> Format ioctls:
>>>> 	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>>> 	test VIDIOC_G/S_PARM: OK (Not Supported)
>>>> 	test VIDIOC_G_FBUF: OK (Not Supported)
>>>> 	test VIDIOC_G_FMT: OK
>>>> 	test VIDIOC_TRY_FMT: OK
>>>> 	test VIDIOC_S_FMT: OK
>>>> 	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>>> 	test Cropping: OK (Not Supported)
>>>> 	test Composing: OK (Not Supported)
>>>> 	test Scaling: OK (Not Supported)
>>>>
>>>> Codec ioctls:
>>>> 	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>>> 	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>>> 	test VIDIOC_(TRY_)DECODER_CMD: OK
>>>>
>>>> Buffer ioctls:
>>>> 	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>>> 	test VIDIOC_EXPBUF: OK
>>>> 	test Requests: OK (Not Supported)
>>>>
>>>> Test input 0:
>>>>
>>>> Streaming ioctls:
>>>> 	test read/write: OK (Not Supported)
>>>> 	test blocking wait: OK
>>>> 	Video Capture Multiplanar: Captured 200 buffers  =20
>>>> 	test MMAP (select): OK
>>>> 	Video Capture Multiplanar: Captured 200 buffers  =20
>>>> 	test MMAP (epoll): OK
>>>> 	test USERPTR (select): OK (Not Supported)
>>>> 	test DMABUF: Cannot test, specify --expbuf-device
>>>>
>>>> Total for meson-vdec device /dev/video0: 49, Succeeded: 49, Failed: =
0, Warnings: 0
>>>>
>>>> Maxime Jourdan (4):
>>>>   media: meson: vdec: add helpers for lossless framebuffer compressi=
on
>>>>     buffers
>>>>   media: meson: vdec: add common HEVC decoder support
>>>>   media: meson: vdec: add VP9 input support
>>>>   media: meson: vdec: add VP9 decoder support
>>>>
>>>> Neil Armstrong (1):
>>>>   media: meson: vdec: align stride on 32 bytes
>>>>
>>>>  drivers/staging/media/meson/vdec/Makefile     |    4 +-
>>>>  .../media/meson/vdec/codec_hevc_common.c      |  285 ++++
>>>>  .../media/meson/vdec/codec_hevc_common.h      |   77 ++
>>>>  drivers/staging/media/meson/vdec/codec_vp9.c  | 1192 ++++++++++++++=
+++
>>>>  drivers/staging/media/meson/vdec/codec_vp9.h  |   13 +
>>>>  drivers/staging/media/meson/vdec/esparser.c   |  142 +-
>>>>  drivers/staging/media/meson/vdec/hevc_regs.h  |  218 +++
>>>>  drivers/staging/media/meson/vdec/vdec.c       |   10 +-
>>>>  .../staging/media/meson/vdec/vdec_helpers.c   |   31 +-
>>>>  .../staging/media/meson/vdec/vdec_helpers.h   |    4 +
>>>>  drivers/staging/media/meson/vdec/vdec_hevc.c  |  231 ++++
>>>>  drivers/staging/media/meson/vdec/vdec_hevc.h  |   13 +
>>>>  .../staging/media/meson/vdec/vdec_platform.c  |   38 +
>>>>  13 files changed, 2245 insertions(+), 13 deletions(-)
>>>>  create mode 100644 drivers/staging/media/meson/vdec/codec_hevc_comm=
on.c
>>>>  create mode 100644 drivers/staging/media/meson/vdec/codec_hevc_comm=
on.h
>>>>  create mode 100644 drivers/staging/media/meson/vdec/codec_vp9.c
>>>>  create mode 100644 drivers/staging/media/meson/vdec/codec_vp9.h
>>>>  create mode 100644 drivers/staging/media/meson/vdec/hevc_regs.h
>>>>  create mode 100644 drivers/staging/media/meson/vdec/vdec_hevc.c
>>>>  create mode 100644 drivers/staging/media/meson/vdec/vdec_hevc.h
>>>>
>>
>>



--BySJcvjvxfZ1gJyoSuVoZUxjIRCmOaxPz--

--H6Y9TyX5Bl7bwWDy8BWI7XoBTgjeltSAh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEPVPGJshWBf4d9CyLd9zb2sjISdEFAl3zVf0ACgkQd9zb2sjI
SdE92g/9EV9jmSpc6UEnZyrrQ8j5Ltvzte/JyREj7VhEyBY/hNjikfldte1VhNe+
sP8EyUOnunZ6dLwHqqaHlGQgOcIk4rhD4NLv1BK+78w2N2s8VXg+p8sh2N08x3Qc
WPBdsfNAyFAIEpRiWoDhVoUcDwcd3v0uQursZ2rF5NuI2f1uP3BuO+g3bRMPZ2hq
Xn+Xg1WzrzBEAc7CEHaJs818G/3Yr5UArcVvDtaq4DB1JEV6nrBKYlghrjGmdcNX
X6Tu+e1E7i6QY8lPOGGNGXkv7FdmebPtTMkU71x97Bb4GZyNqal2LdL5RHCs2x3/
5JR83jRoIf+Kw6dNO94yKTRwSmM/qtgU7HFG2qtvmIR3xNaHeV63VwKLpYMQbo7E
q2kM7khr1T0TQp/ie2g4AtFVfFrbw+3uMFPHKUB1zPvngt12P/GskQnQQ04L4QsU
3ndwvADBrPn29MTDHn91rWy4e7xmBx3tgtjDZMi95fCI2lgV/zlxRLcQv7B/T4Cq
ot+pKKyNvxXJpoL6dioEhiatIOznNxZJH6sbOg/G4/RFt48swHFi0mk1hKdKmVUu
n2844fvpiZCxJBdE6S+j2Q7dGfyToUZS8NzmWIYJiKpyRU7NZ5H4rB4h6IbMXo3I
cO/ePpDY4s9X+tyG5WFHHsKPHtJGjZB5PV0dZAl0+mgrX+w598g=
=xujm
-----END PGP SIGNATURE-----

--H6Y9TyX5Bl7bwWDy8BWI7XoBTgjeltSAh--
