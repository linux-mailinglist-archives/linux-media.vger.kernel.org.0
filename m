Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A94811EAE5
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2019 20:04:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728747AbfLMTEH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Dec 2019 14:04:07 -0500
Received: from mail-qt1-f195.google.com ([209.85.160.195]:44392 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728905AbfLMTED (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Dec 2019 14:04:03 -0500
Received: by mail-qt1-f195.google.com with SMTP id g17so3090709qtp.11
        for <linux-media@vger.kernel.org>; Fri, 13 Dec 2019 11:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=PFm3oartBQfM+YdDwauwRoJMeKeiL0La1p3TM1SvP3k=;
        b=sfrIjqAAruqLRkXX4aO+Fp3r9ck6k5EHZbJyyPCzL1BbC8g7covFSICzPfFMlGLwWk
         eqPt3gejCnMLCcOsZJ/2j3KHoxcmBuSqA7QAgL6Bz1p8o2rtV1U6t9EN5T4IYtzmNx/7
         y3dbxkQ1jssnsGXgQSWmsVNbzk3AbTwWLiWRcbBqBLSZ7i0dq7mwppKcq91G3VyCbJkV
         nFwtw2PS8oQWDsPLJyk/A7Mt/HzOYGEHTlhd8AFYmGL+1/BOEJlTyx/P+70399r8ANLQ
         kW7QADPm+dv1U/H4XMmNuOKiATvhuR04cmrfxeBsfHjqIosSLzfTqeOS+MmHpCCpmDjJ
         Q71g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=PFm3oartBQfM+YdDwauwRoJMeKeiL0La1p3TM1SvP3k=;
        b=q2kdnOmeCW5FLink25ANXC98ZfOg6bXt7lp+amfsoLi/RGCfHbmFeChJCstZei1YGk
         Lgij+Xo486lLNYTRifDHFYWvFZeyuC0QDl1cw23ErzB69tjiWD3l8dy6Rpn1EFFdczRf
         id4epBgo1t9PVF+yGJ8RMhxqkKoMnBsyiRgczbAnPz6mB2Hh92/qvcbWRmO0jG3K+TPL
         dY2fmgld8o1gff5X0ZRvOsgv2YoUzFl3WDW0WUw1gt2sCyNwaTSwxgBLQfYjVvc/yUyl
         izfGp6YoOX7iQMTrfYgxm37neydJKN5th04Anhjs0GcQ5YqcF4Kfewb8PjLilDd+Pb3m
         ya7A==
X-Gm-Message-State: APjAAAVGWBlEcWjOdUUKqkKqSrDaNGqq2RUnErDB7GEIp8VZ6n9tQHCD
        OGReN+T/Kz74TFwwn2c4at7B2g==
X-Google-Smtp-Source: APXvYqxefrIy4i25kRQOHzAwqvcQ7MGCBODeGnIKl33hyeUJgjMpVuDpY0/D3SlgcKrz7K3uqGQxbA==
X-Received: by 2002:aed:238f:: with SMTP id j15mr2262107qtc.240.1576263840702;
        Fri, 13 Dec 2019 11:04:00 -0800 (PST)
Received: from tpx230-nicolas ([192.222.193.21])
        by smtp.gmail.com with ESMTPSA id 24sm3115651qka.32.2019.12.13.11.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2019 11:03:59 -0800 (PST)
Message-ID: <c10a3d9e53109010be894438ae8bb0be6cc68a69.camel@ndufresne.ca>
Subject: Re: [PATCH 0/5] media: meson: vdec: Add VP9 decoding support
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Neil Armstrong <narmstrong@baylibre.com>, mchehab@kernel.org,
        hans.verkuil@cisco.com
Cc:     linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Date:   Fri, 13 Dec 2019 14:03:57 -0500
In-Reply-To: <ba2cefa3-1ab8-6eb9-8e69-93d6a3ef68d9@baylibre.com>
References: <20191205092454.26075-1-narmstrong@baylibre.com>
         <4ee20fdf5182b7bfe338e9ae044424b6125fed15.camel@ndufresne.ca>
         <60fa8f55-de40-13fa-b584-ad9f020cde12@baylibre.com>
         <1a570c6e07fcd0d0ddc401a3640dfca07f22304d.camel@ndufresne.ca>
         <ba2cefa3-1ab8-6eb9-8e69-93d6a3ef68d9@baylibre.com>
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-BLYE2OIbj7nYRjVQ3ora"
User-Agent: Evolution 3.34.2 (3.34.2-1.fc31) 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-BLYE2OIbj7nYRjVQ3ora
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 13 d=C3=A9cembre 2019 =C3=A0 10:12 +0100, Neil Armstrong a =C3=
=A9crit :
> On 05/12/2019 19:46, Nicolas Dufresne wrote:
> > Le jeudi 05 d=C3=A9cembre 2019 =C3=A0 16:49 +0100, Neil Armstrong a =C3=
=A9crit :
> > > On 05/12/2019 16:42, Nicolas Dufresne wrote:
> > > > Hi Neil,
> > > >=20
> > > > Le jeudi 05 d=C3=A9cembre 2019 =C3=A0 10:24 +0100, Neil Armstrong a=
 =C3=A9crit :
> > > > > Hello,
> > > > >=20
> > > > > This patchset aims to bring VP9 decoding support to Amlogic GXL, =
G12A & SM1
> > > > > platforms for the amlogic stateful video decoder driver.
> > > > >=20
> > > > > With this, it passes v4l2-compliance with streaming on Amlogic G1=
2A and
> > > > > Amlogic SM1 SoCs successfully using the stream at [1] with a fixe=
d
> > > > > pyv4l2compliance script for VP9 at [2].
> > > > >=20
> > > > > The original script kept the IVF headers in the stream, confusing=
 the
> > > > > decoder. The fixed script only extracts the payload from the IVF =
container.
> > > > >=20
> > > > > The decoder has been tested using the Google CTS TestVectorsIttia=
m VP9 yuv420
> > > > > samples, passing 82 resolutions test streams, with 13 fails by pi=
xel
> > > > > differences and 3 timeouts.
> > > >=20
> > > > How do you handle resolution changes on delta frames ? It's a bit o=
f a
> > > > challenge since the reference frames are not at the same resolution=
 as
> > > > the frames to be decoded. This breaks the assumption for the resolu=
tion
> > > > changes mechanism as described in the spec.
> > >=20
> > > I don't have a lot of experience on the subject, but in the vendor im=
plementation,
> > > they store the resolution along the reference frames and when loading=
 all the
> > > reference frames to the HW, the original resolution is also loaded.
> > > But we don't handle it.
> > >=20
> > > > On stateless side, Boris is introducing DESTROY_BUFS, so we can fre=
e
> > > > the references when they are not used anymore. But the reference ar=
e
> > > > managed by userspace and are not queued. While on stateful side so =
far,
> > > > it was assumed that references are queued, and the semantic of S_FM=
T is
> > > > that it must apply to the entire set of queued buffer.
> > >=20
> > > yes
> > >=20
> > > > I think most streams will work and won't use this feature, but I'm
> > > > worried that writing a compliant VP9 decoder is currently not possi=
ble.
> > >=20
> > > Indeed, but I don't have a clear enough view on the subject, and it d=
oesn't seem
> > > I have any test stream with such feature.
> >=20
> > https://www.webmproject.org/vp9/levels/
> >=20
> > I believe in the performance suite, the FRM_RESIZE sample is what
> > should exercise this.
>=20
> Thanks for pointing this test suite... all samples were failing :-p
>=20
> Now we added the probability handling and all samples works (except the u=
nsupported level).
> The ref handling was tricky aswell, anyway it's all fixed except FRM_RESI=
ZE which will
> be a hell of hacking to tackle.
>=20
> The hack would be to keep the refs buffers we still need after frame resi=
zing on drain,
> then use the max(old_frame_size, new_frame_size) as capture buffer size, =
then copy back
> the old refs buffers into the newly queued buffers and continue.

It's interesting, does VP8/9 indicate how long a reference frame can be
held. My concern is that for truly zero-copy cases, you cannot push out
a buffer until they are no longer referenced, and that's why we have
large queues. The use case I know came from STM a long time ago, they
would burn in software the subtitles into the video frames. So as soon
as a buffer is release from the decoder, it's being dirtied, and cannot
be used as reference anymore.

In this case, on resolution changed, you have let say a reference of
resolution X, that you haven't pushed yet, because you have to keep it
clean. And you want to decode the next buffer of size Y. Because you
receive a request to drain, X will be pushed, and current userspace may
just dirty it before it actually re-queue the buffers.

Wouldn't the appropriate hack would be to have internal allocation and
do copies of the reference frames before you actually emit the
resolution change event ? It's in any case just a hack, since in 4K
it's unlikely to be seamless (real-time).

Another option is to force RO for VP9, for most cases it makes no
difference. And then we could just keep a ref on the buffer (like we do
for stateless) regardless if it's queued or not. As we can trust it
won't be dirtied.

The third option, you don't care about all this, because you have a
third queue of buffers, and use a special IP to transfer the decoded
images to CAPTURE buffer (e.g. could be detiling). That's the case for
CODA, and I think it can be the case for Amlogic since on S805 the
output format is unusable, not sure what's the status of the CODEC
there.

p.s. we could have a different semantic depending if the DMABuf are  RO
or RW exported. But I think most userspace today uses RW exportation,
hence we cannot trust the buffer out to stay clean. That is different
with stateless, since this is managed by userspace.

>=20
> It's a ugly hack, but won't break the drain + S_FMT semantic.
> But I will fix this _after_ the v2 of this serie is merged.
>=20
> Neil
>=20
> > > Neil
> > >=20
> > > > > This patchset depends on :
> > > > > - G12A enablement at [3]
> > > > > - SM1 enablement at [4]
> > > > > - H.264 and compliance at [5]
> > > > >=20
> > > > > [1] https://github.com/superna9999/pyv4l2compliance/raw/tests/out=
put/Jellyfish_1080_10s_5MB.vp9.hdr
> > > > > [2] https://github.com/superna9999/pyv4l2compliance
> > > > > [3] https://lore.kernel.org/linux-media/20191120111430.29552-1-na=
rmstrong@baylibre.com
> > > > > [4] https://lore.kernel.org/linux-media/20191121101429.23831-1-na=
rmstrong@baylibre.com
> > > > > [5] https://lore.kernel.org/linux-media/20191126093733.32404-1-na=
rmstrong@baylibre.com
> > > > >=20
> > > > > The compliance log is:
> > > > > # v4l2-compliance --stream-from-hdr Jellyfish_1080_10s_5MB.vp9.hd=
r -s 200
> > > > > v4l2-compliance SHA: 7ead0e1856b89f2e19369af452bb03fd0cd16793, 64=
 bits
> > > > >=20
> > > > > Compliance test for meson-vdec device /dev/video0:
> > > > >=20
> > > > > Driver Info:
> > > > > 	Driver name      : meson-vdec
> > > > > 	Card type        : Amlogic Video Decoder
> > > > > 	Bus info         : platform:meson-vdec
> > > > > 	Driver version   : 5.4.0
> > > > > 	Capabilities     : 0x84204000
> > > > > 		Video Memory-to-Memory Multiplanar
> > > > > 		Streaming
> > > > > 		Extended Pix Format
> > > > > 		Device Capabilities
> > > > > 	Device Caps      : 0x04204000
> > > > > 		Video Memory-to-Memory Multiplanar
> > > > > 		Streaming
> > > > > 		Extended Pix Format
> > > > > 	Detected Stateful Decoder
> > > > >=20
> > > > > Required ioctls:
> > > > > 	test VIDIOC_QUERYCAP: OK
> > > > >=20
> > > > > Allow for multiple opens:
> > > > > 	test second /dev/video0 open: OK
> > > > > 	test VIDIOC_QUERYCAP: OK
> > > > > 	test VIDIOC_G/S_PRIORITY: OK
> > > > > 	test for unlimited opens: OK
> > > > >=20
> > > > > Debug ioctls:
> > > > > 	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> > > > > 	test VIDIOC_LOG_STATUS: OK (Not Supported)
> > > > >=20
> > > > > Input ioctls:
> > > > > 	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> > > > > 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > > > > 	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> > > > > 	test VIDIOC_ENUMAUDIO: OK (Not Supported)
> > > > > 	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> > > > > 	test VIDIOC_G/S_AUDIO: OK (Not Supported)
> > > > > 	Inputs: 0 Audio Inputs: 0 Tuners: 0
> > > > >=20
> > > > > Output ioctls:
> > > > > 	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> > > > > 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > > > > 	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> > > > > 	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> > > > > 	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> > > > > 	Outputs: 0 Audio Outputs: 0 Modulators: 0
> > > > >=20
> > > > > Input/Output configuration ioctls:
> > > > > 	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> > > > > 	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> > > > > 	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> > > > > 	test VIDIOC_G/S_EDID: OK (Not Supported)
> > > > >=20
> > > > > Control ioctls:
> > > > > 	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
> > > > > 	test VIDIOC_QUERYCTRL: OK
> > > > > 	test VIDIOC_G/S_CTRL: OK
> > > > > 	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
> > > > > 	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
> > > > > 	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> > > > > 	Standard Controls: 2 Private Controls: 0
> > > > >=20
> > > > > Format ioctls:
> > > > > 	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> > > > > 	test VIDIOC_G/S_PARM: OK (Not Supported)
> > > > > 	test VIDIOC_G_FBUF: OK (Not Supported)
> > > > > 	test VIDIOC_G_FMT: OK
> > > > > 	test VIDIOC_TRY_FMT: OK
> > > > > 	test VIDIOC_S_FMT: OK
> > > > > 	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> > > > > 	test Cropping: OK (Not Supported)
> > > > > 	test Composing: OK (Not Supported)
> > > > > 	test Scaling: OK (Not Supported)
> > > > >=20
> > > > > Codec ioctls:
> > > > > 	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> > > > > 	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> > > > > 	test VIDIOC_(TRY_)DECODER_CMD: OK
> > > > >=20
> > > > > Buffer ioctls:
> > > > > 	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> > > > > 	test VIDIOC_EXPBUF: OK
> > > > > 	test Requests: OK (Not Supported)
> > > > >=20
> > > > > Test input 0:
> > > > >=20
> > > > > Streaming ioctls:
> > > > > 	test read/write: OK (Not Supported)
> > > > > 	test blocking wait: OK
> > > > > 	Video Capture Multiplanar: Captured 200 buffers  =20
> > > > > 	test MMAP (select): OK
> > > > > 	Video Capture Multiplanar: Captured 200 buffers  =20
> > > > > 	test MMAP (epoll): OK
> > > > > 	test USERPTR (select): OK (Not Supported)
> > > > > 	test DMABUF: Cannot test, specify --expbuf-device
> > > > >=20
> > > > > Total for meson-vdec device /dev/video0: 49, Succeeded: 49, Faile=
d: 0, Warnings: 0
> > > > >=20
> > > > > Maxime Jourdan (4):
> > > > >   media: meson: vdec: add helpers for lossless framebuffer compre=
ssion
> > > > >     buffers
> > > > >   media: meson: vdec: add common HEVC decoder support
> > > > >   media: meson: vdec: add VP9 input support
> > > > >   media: meson: vdec: add VP9 decoder support
> > > > >=20
> > > > > Neil Armstrong (1):
> > > > >   media: meson: vdec: align stride on 32 bytes
> > > > >=20
> > > > >  drivers/staging/media/meson/vdec/Makefile     |    4 +-
> > > > >  .../media/meson/vdec/codec_hevc_common.c      |  285 ++++
> > > > >  .../media/meson/vdec/codec_hevc_common.h      |   77 ++
> > > > >  drivers/staging/media/meson/vdec/codec_vp9.c  | 1192 +++++++++++=
++++++
> > > > >  drivers/staging/media/meson/vdec/codec_vp9.h  |   13 +
> > > > >  drivers/staging/media/meson/vdec/esparser.c   |  142 +-
> > > > >  drivers/staging/media/meson/vdec/hevc_regs.h  |  218 +++
> > > > >  drivers/staging/media/meson/vdec/vdec.c       |   10 +-
> > > > >  .../staging/media/meson/vdec/vdec_helpers.c   |   31 +-
> > > > >  .../staging/media/meson/vdec/vdec_helpers.h   |    4 +
> > > > >  drivers/staging/media/meson/vdec/vdec_hevc.c  |  231 ++++
> > > > >  drivers/staging/media/meson/vdec/vdec_hevc.h  |   13 +
> > > > >  .../staging/media/meson/vdec/vdec_platform.c  |   38 +
> > > > >  13 files changed, 2245 insertions(+), 13 deletions(-)
> > > > >  create mode 100644 drivers/staging/media/meson/vdec/codec_hevc_c=
ommon.c
> > > > >  create mode 100644 drivers/staging/media/meson/vdec/codec_hevc_c=
ommon.h
> > > > >  create mode 100644 drivers/staging/media/meson/vdec/codec_vp9.c
> > > > >  create mode 100644 drivers/staging/media/meson/vdec/codec_vp9.h
> > > > >  create mode 100644 drivers/staging/media/meson/vdec/hevc_regs.h
> > > > >  create mode 100644 drivers/staging/media/meson/vdec/vdec_hevc.c
> > > > >  create mode 100644 drivers/staging/media/meson/vdec/vdec_hevc.h
> > > > >=20
>=20
>=20

--=-BLYE2OIbj7nYRjVQ3ora
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXfPgnQAKCRBxUwItrAao
HFSCAKCVMCo+IJ5+LZKokgrOxsO/0S84qACeISPG04hd4xC9AqF5XJfyi1DsYD0=
=POaY
-----END PGP SIGNATURE-----

--=-BLYE2OIbj7nYRjVQ3ora--

