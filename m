Return-Path: <linux-media+bounces-46249-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8838C2F9CE
	for <lists+linux-media@lfdr.de>; Tue, 04 Nov 2025 08:29:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF359189DF6D
	for <lists+linux-media@lfdr.de>; Tue,  4 Nov 2025 07:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 823453064A6;
	Tue,  4 Nov 2025 07:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l7h+/uWR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DED0305E3A
	for <linux-media@vger.kernel.org>; Tue,  4 Nov 2025 07:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762241331; cv=none; b=fcMJqaOCp/tnrh9+Hr9fsxd0c6iTTKjMYN9iqeb9u3YvRn+vDMYIjIeZC9KAobCToWMUkIhceNTPgCkrp5yA9fV4Noevr8rXl98JrZnEQJ6gYPzGcKfGkzxURKhr1JcOPpJ5YR0/BFHpRGZhAePJxusxedn2FSb7XHPvzpLnBqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762241331; c=relaxed/simple;
	bh=RzL4yYIPBn7PInlROYKVeTg4lpHCuSXqDqT7JeeqATY=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Mv93ZUjojbtwHPwDWRzXgD8mbbXw0zXMA253f0Rsp1+ozVyS5seTKZ+vZ10FTTw8wTUZwlk8hGHH8G/zv8IgF3bpT7WStpju/BSej46RF3lLHSIg6Mt5Ax9afacyYaMrIuPDPQGGcTRjIlHWaMKQcRrPkPj2ge1WXsnJ92EMGZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l7h+/uWR; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-429bcddad32so2980969f8f.3
        for <linux-media@vger.kernel.org>; Mon, 03 Nov 2025 23:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762241327; x=1762846127; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RQrVztubx2u+pACffgEQuXsypBYi+W9z0hLwySF7Kwo=;
        b=l7h+/uWRB+8DND0mB0rZ98D0mqgRf6cvyNO8xVrzONfVVq/UcdTSdGrDycX3Dv0/xO
         MkY5KBcnWkPbUy6oXo88q9yyPfk0uVQeleFpR/TQZGSgNZp7RwOQDzbkEQjGpwGjQVbx
         SiXYz0/Bq7vdyvI0Uhkqed2/hhpUQN0/t5oYP95wkMZ0SiXSJfKLvWwhEDUpPNIgcxLL
         44ZEIPQFbNI1gSYxjfmQS6jLyYJmcfIGdPAiRJfHTA/ZtA8fF82S6z4QAvQAPC6qn6bq
         HqUxSTRwL1bQwYLgXeX2SxVd1B3ffqRIid6d0jRLxvdAhUorgoUKBozj0PxhxI5+ZCLj
         XWkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762241327; x=1762846127;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RQrVztubx2u+pACffgEQuXsypBYi+W9z0hLwySF7Kwo=;
        b=MpijS3T/i1sR8fenAxTY6DNKsElas44vbFiwTz3QSQWnmrzNAyFD+rFF0nN7EIalVh
         4KwSO0uBFvKsCH1LxOJdYwRakglFe/0AjqFvVcK2+ULQ5+umV81bT2c+TCMzqrZq+cgq
         2Fdsmia3SPJXgh3WbezodfK8idMMyghvy853anPyPunTERFb1wJXMOeJEMv1pBiZ9o5Z
         teNwkV+j58MrWspJux45WBcVfpNejjbVZ0KIdWZVHUsjEo6P1W9uxW7swGiEtCjJm7pg
         KXtstFIhJiH4XOEdVb22TYAvzhS91/iHciQHYttJBUGQODurTzH0jNdmueHD8uIPGlzf
         sMJw==
X-Forwarded-Encrypted: i=1; AJvYcCWHXTf/WE9py9LsT2zQxDUEG/SvqR21yrgdnU9EQIpqBOv7bZB+mNMwzeZbuIRfsY4+ES40BCUPNtz4+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOknXTyclSIVv9sTxGm38fFwuoqj139StOqkCKaNx3ce8wvai9
	HUbXnf5M7Al19PWsynUAAMz09Esu9iXzbx8UHna9uAkrrOaPUsgf8ARe
X-Gm-Gg: ASbGncs6AnDb3mGOUBlxyC3eGQpGzmQOi+dRWw4cOcygMUS4ez2F8UABtcbE4WhRpts
	PcH3kpNF6q51JX9fA7u6T+ZuPlgmfG0+WGneMen4xSqPmxw9SpgxVd7PgKN6FC9MmIiGxdRlJ62
	WsFCsikEN1uYU/cr3NHIGMngOMcfwXNu9Zf0UjvsWBtY+BFFZgGWipvuZdrcdcIiVWYbJEfBnS5
	T3FCRJuRwNYelkYJsprjJ0QZReKjrRMsGjeMj1SsA8JkhYQOhj8ZaqUD/8h8xFhYejG/IyqwRwy
	WVToFf7SMGxU8yv29SMmsWnRHpIr1Z5Ki+azthDOTSnmTvtsbaAJ2xA/c2BtShNbJe8ZLdxrvYx
	GMslXmcjcjHgRKphAqMYQVQdhpZ2DEjjeqmfUVio+mOaoLGl5W1O/Lu5ROym+AaxLikNwNiN0Ou
	rzxUsKip05wtlmmzU2h5tKZHtMLjheRNcS2M866iCcRh7SP8uB6V75/vWVYl8/+AZpS9d9nFI=
X-Google-Smtp-Source: AGHT+IE/zGw+D0u9TFjklGUocQN9vuvOn2j0IijPm9wr89yrvoE3rgFyzPC1PsYWnF6kAditU4Rbhw==
X-Received: by 2002:a05:6000:714:b0:429:c711:22c5 with SMTP id ffacd0b85a97d-429c7112421mr9065018f8f.42.1762241326271;
        Mon, 03 Nov 2025 23:28:46 -0800 (PST)
Received: from smtpclient.apple (static.253.36.98.91.clients.your-server.de. [91.98.36.253])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429dc19227csm2989084f8f.11.2025.11.03.23.28.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Nov 2025 23:28:45 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH 0/3] Add Amlogic stateless H.264 video decoder for S4
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <540d98ea-114c-43bc-94c0-e944b5613d74@amlogic.com>
Date: Tue, 4 Nov 2025 11:28:33 +0400
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-media@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <2B4BFCAC-57FF-429F-BD57-457E634A24E8@gmail.com>
References: <20251027-b4-s4-vdec-upstream-v1-0-620401813b5d@amlogic.com>
 <b976b442-7d07-4fef-b851-ccd14661a233@linaro.org>
 <540d98ea-114c-43bc-94c0-e944b5613d74@amlogic.com>
To: Zhentao Guo <zhentao.guo@amlogic.com>
X-Mailer: Apple Mail (2.3826.700.81)

> On 28 Oct 2025, at 3:47=E2=80=AFpm, Zhentao Guo =
<zhentao.guo@amlogic.com> wrote:
>=20
> =E5=9C=A8 2025/10/28 18:50, Neil Armstrong =E5=86=99=E9=81=93:
>> [ EXTERNAL EMAIL ]
>>=20
>> Hi,
>>=20
>> On 10/27/25 06:42, Zhentao Guo via B4 Relay wrote:
>>> Introduce initial driver support for Amlogic's new video =
acceleration
>>> hardware architecture, designed for video stream decoding.
>>>=20
>>> Compared to the current Amlogic video decoder hardware architecture,
>>> this new implementation eliminates the Esparser hardware component,
>>> enabling direct vb2 buffer input. The driver is designed to support
>>> the V4L2 M2M stateless decoder API. The initial phase includes =
support
>>> for H.264 decoding on Amlogic S805X2 platform.

S805X2 looks challenging to test (without hardware) and this will =
prevent
wider feedback. Can you extend the driver for G12B? - it has good =
upstream
support and lots of good boards. This would also demonstrate (in =
patches)
how further expansion is handled. The only minor complication is that
meson-g12-common.dtsi has vdec nodes for the staging driver that need to =
be
reworked. This probably leads into a discussion (with Neil mostly) about
how to drop/clean-up the staging driver. NB: There is also a canvas =
driver
long-merged upstream. Can this be reused or adapted instead of adding =
new
canvas code?

>>> The driver is capable of:
>>> - Supporting stateless H.264 decoding up to a resolution =
1920x1088(on the S805X2 platform).
>>> - Supporting I/P/B frame handling.
>>> - Supporting vb2 mmap and dma-buf modes.
>>> - Supporting frame-based decode mode. (Note that some H.264 =
bitstreams require
>>>    DPB reordering to generate reference lists, the stateless decoder =
driver
>>>    cannot access reordered reference lists in this mode, requiring =
the driver
>>>    to perform reference list reordering itself)
>>> - Supporting NV12/NV21 output.
>>> - Supporting Annex B start codes.
>>=20
>> Thanks for the initial drop, it's very nice !
>>=20
>> First of all, this still requires some work so it would be better if =
you
>> used the RFC tag until all issues are sorted out.
>>=20
> Thanks for the reminder, I will add the RFC tag from the next patch =
version.
>> You didn't tell anything about the firmware, did you build a specific =
version
>> of the firmware to handle the stateless and bypass ESPARSER ?
>> Will this technique work with the released firmwares of GXL/G12/SM1 ?
> For the firmware, we need to build a specific version for stateless =
decoder
> driver. The ESPARSER is fully dropped. As I mentioned, this technique =
needs
> specific firmware so it would not work with the released firmware of =
the older
> SOCs. We plan to submit the new firmware to the linux-firmware repo. I =
will
> share the commit once the upload is completed.

linux-firmware only accepts files for merged drivers so while things are
still in development you either need to share firmware blobs as an extra
patch with the series (tagged as DONOTMERGE) or you need to put files in
a repo and share a link in the cover-letter. You are welcome to abuse =
the
LibreELEC org on GitHub if you need somewhere friendly to push files (we
already host similar things for distro packaging).

>> Will you support the compressed format and 10bit with this ?
> No, the compressed format and 10bit are not supported.

Understood that AFBC and 10-bit are not part of this initial series, but
are they planned for a follow-up series? .. or never?

>>> This driver is tested with Gstreamer.
>>> Example:
>>> gst-launch-1.0 filesrc =
location=3D/tmp/video_640x360_mp4_hevc_450kbps_no_b.mp4 !
>>> parsebin ! v4l2slh264dec ! filesink location=3D/tmp/output.yuv
>>>=20
>>> The driver passes v4l2 compliance test, test reports :
>>> v4l2-compliance 1.30.1, 64 bits, 64-bit time_t
>>>=20
>>> Compliance test for aml-vdec-drv device /dev/video0:
>>>=20
>>> Driver Info:
>>>          Driver name      : aml-vdec-drv
>>>          Card type        : platform:aml-vdec-drv
>>>          Bus info         : platform:fe320000.video-codec
>>>          Driver version   : 6.16.0
>>>          Capabilities     : 0x84204000
>>>                  Video Memory-to-Memory Multiplanar
>>>                  Streaming
>>>                  Extended Pix Format
>>>                  Device Capabilities
>>>          Device Caps      : 0x04204000
>>>                  Video Memory-to-Memory Multiplanar
>>>                  Streaming
>>>                  Extended Pix Format
>>>          Detected Stateless Decoder
>>> Media Driver Info:
>>>          Driver name      : aml-vdec-drv
>>>          Model            : aml-vdec-drv
>>>          Serial           :
>>>          Bus info         : platform:fe320000.video-codec
>>>          Media version    : 6.16.0
>>>          Hardware revision: 0x00000000 (0)
>>>          Driver version   : 6.16.0
>>> Interface Info:
>>>          ID               : 0x0300000c
>>>          Type             : V4L Video
>>> Entity Info:
>>>          ID               : 0x00000001 (1)
>>>          Name             : aml_dev_drv-source
>>>          Function         : V4L2 I/O
>>>          Pad 0x01000002   : 0: Source
>>>            Link 0x02000008: to remote pad 0x1000004 of entity =
'aml_dev_drv-proc' (Video Decoder): Data, Enabled, Immutable
>>>=20
>>> Required ioctls:
>>>          test MC information (see 'Media Driver Info' above): OK
>>>          test VIDIOC_QUERYCAP: OK
>>>          test invalid ioctls: OK
>>>=20
>>> Allow for multiple opens:
>>>          test second /dev/video0 open: OK
>>>          test VIDIOC_QUERYCAP: OK
>>>          test VIDIOC_G/S_PRIORITY: OK
>>>          test for unlimited opens: OK
>>>=20
>>> Debug ioctls:
>>>          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>>>=20
>>> Input ioctls:
>>>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>>>=20
>>> Output ioctls:
>>>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>>>=20
>>> Input/Output configuration ioctls:
>>>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>>          test VIDIOC_G/S_EDID: OK (Not Supported)
>>>=20
>>> Control ioctls:
>>>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>>>          test VIDIOC_QUERYCTRL: OK
>>>          test VIDIOC_G/S_CTRL: OK
>>>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>>>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>>>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>>          Standard Controls: 6 Private Controls: 0
>>>          Standard Compound Controls: 4 Private Compound Controls: 0
>>>=20
>>> Format ioctls:
>>>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>>          test VIDIOC_G/S_PARM: OK (Not Supported)
>>>          test VIDIOC_G_FBUF: OK (Not Supported)
>>>          test VIDIOC_G_FMT: OK
>>>          test VIDIOC_TRY_FMT: OK
>>>          test VIDIOC_S_FMT: OK
>>>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>>          test Cropping: OK (Not Supported)
>>>          test Composing: OK (Not Supported)
>>>          test Scaling: OK (Not Supported)
>>>=20
>>> Codec ioctls:
>>>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>>          test VIDIOC_(TRY_)DECODER_CMD: OK
>>>=20
>>> Buffer ioctls:
>>>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>>          test CREATE_BUFS maximum buffers: OK
>>>          test VIDIOC_REMOVE_BUFS: OK
>>>          test VIDIOC_EXPBUF: OK
>>>          test Requests: OK
>>>          test blocking wait: OK
>>=20
>> Please also enable the streaming tests.
> Yes, we did some streaming tests with Gstreamer, fluster test and bug =
fix is also in progress.
>>>=20
>>> Total for aml-vdec-drv device /dev/video0: 49, Succeeded: 49, =
Failed: 0, Warnings: 0
>>>=20
>>> Some Fluster test cases are still failing. We will publish the final =
results
>>> once all these Fluster test failures have been resolved.
>>=20
>> As Christian reported, please add the flutter results aswell.
> Thanks. We have now tested the JVT-AVC_V1.
> Result:
> Ran 54/135 tests successfully
>=20
> - 52 test vectors failed due to interlaced or mbaff clips: The Amlogic =
stateless
>   decoder driver only support bitstreams with frame_mbs_only_flags =3D=3D=
 1.
>   Test Vectors:
>         cabac_mot_fld0_full
>         cabac_mot_mbaff0_full
>         cabac_mot_picaff0_full
>         CABREF3_Sand_D
>         CAFI1_SVA_C
>         CAMA1_Sony_C
>         CAMA1_TOSHIBA_B
>         cama1_vtc_c
>         cama2_vtc_b
>         CAMA3_Sand_E
>         cama3_vtc_b
>         CAMACI3_Sony_C
>         CAMANL1_TOSHIBA_B
>         CAMANL2_TOSHIBA_B
>         CAMANL3_Sand_E
>         CAMASL3_Sony_B
>         CAMP_MOT_MBAFF_L30
>         CAMP_MOT_MBAFF_L31
>         CANLMA2_Sony_C
>         CANLMA3_Sony_C
>         CAPA1_TOSHIBA_B
>         CAPAMA3_Sand_F
>         cavlc_mot_fld0_full_B
>         cavlc_mot_mbaff0_full_B
>         cavlc_mot_picaff0_full_B
>         CVCANLMA2_Sony_C
>         CVFI1_Sony_D
>         CVFI1_SVA_C
>         CVFI2_Sony_H
>         CVFI2_SVA_C
>         CVMA1_Sony_D
>         CVMA1_TOSHIBA_B
>         CVMANL1_TOSHIBA_B
>         CVMANL2_TOSHIBA_B
>         CVMAPAQP3_Sony_E
>         CVMAQP2_Sony_G
>         CVMAQP3_Sony_D
>         CVMP_MOT_FLD_L30_B
>         CVNLFI1_Sony_C
>         CVNLFI2_Sony_H
>         CVPA1_TOSHIBA_B
>         FI1_Sony_E
>         MR6_BT_B
>         MR7_BT_B
>         MR8_BT_B
>         MR9_BT_B
>         Sharp_MP_Field_1_B
>         Sharp_MP_Field_2_B
>         Sharp_MP_Field_3_B
>         Sharp_MP_PAFF_1r2
>         Sharp_MP_PAFF_2r
>         CVMP_MOT_FRM_L31_B
> - 3 test vectors failed due to unsupported bitstream.
>   num_slice_group_minus1 greater than zero is not supported by the
>   hardware.
>   Test Vectors:
>         FM1_BT_B
>         FM1_FT_E
>         FM2_SVA_C
> - 2 test vectors failed because SP_SLICE type is not supported by the
>   hardware.
>   Test Vectors:
>         SP1_BT_A
>         sp2_bt_b
>=20
> We are working with the remain failures, we think that these fail =
cases
>=20
> must be resolved.
>=20
> I'll add the fluster result to the cover-letter from the next patch =
version.

Thanks, it=E2=80=99s good to understand where things are. All good :)

Christian


>>=20
>> Neil
>>=20
>>>=20
>>> Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
>>> ---
>>> Zhentao Guo (3):
>>>        dt-bindings: vdec: Add binding document of Amlogic decoder =
accelerator
>>>        dts: decoder: Support V4L2 stateless decoder dt node for S4
>>>        decoder: Add V4L2 stateless H.264 decoder driver
>>>=20
>>>   .../bindings/media/amlogic,vcodec-dec.yaml         |   96 ++
>>>   MAINTAINERS                                        |    7 +
>>>   arch/arm64/boot/dts/amlogic/meson-s4.dtsi          |   24 +
>>>   drivers/media/platform/amlogic/Kconfig             |    2 +
>>>   drivers/media/platform/amlogic/Makefile            |    1 +
>>>   drivers/media/platform/amlogic/vdec/Kconfig        |   15 +
>>>   drivers/media/platform/amlogic/vdec/Makefile       |    4 +
>>>   drivers/media/platform/amlogic/vdec/aml_vdec.c     |  759 =
+++++++++
>>>   drivers/media/platform/amlogic/vdec/aml_vdec.h     |   31 +
>>>   .../platform/amlogic/vdec/aml_vdec_canvas_utils.c  |  154 ++
>>>   .../platform/amlogic/vdec/aml_vdec_canvas_utils.h  |   22 +
>>>   drivers/media/platform/amlogic/vdec/aml_vdec_drv.c |  263 +++
>>>   drivers/media/platform/amlogic/vdec/aml_vdec_drv.h |  194 +++
>>>   drivers/media/platform/amlogic/vdec/aml_vdec_hw.c  |  652 +++++++
>>>   drivers/media/platform/amlogic/vdec/aml_vdec_hw.h  |  182 ++
>>>   .../platform/amlogic/vdec/aml_vdec_platform.c      |   37 +
>>>   .../platform/amlogic/vdec/aml_vdec_platform.h      |   62 +
>>>   drivers/media/platform/amlogic/vdec/h264.c         | 1790 =
++++++++++++++++++++
>>>   drivers/media/platform/amlogic/vdec/h264.h         |  300 ++++
>>>   drivers/media/platform/amlogic/vdec/reg_defines.h  |  175 ++
>>>   20 files changed, 4770 insertions(+)
>>> ---
>>> base-commit: 72fb0170ef1f45addf726319c52a0562b6913707
>>> change-id: 20251027-b4-s4-vdec-upstream-0603c1a4c84a
>>>=20
>>> Best regards,
>>=20
> Thank you
>=20
> Zhentao
>=20
>=20
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic


