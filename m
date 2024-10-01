Return-Path: <linux-media+bounces-18912-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA1B98BB65
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 13:39:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 629C628308E
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 11:39:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 662651C174E;
	Tue,  1 Oct 2024 11:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="2L+L3aHT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32791C0DD1
	for <linux-media@vger.kernel.org>; Tue,  1 Oct 2024 11:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727782786; cv=none; b=LIhr4nzcuypo71IkXJUfD9HjH9v6nFoYxhc4vg/2eADZ+CxYX001n9Av6Px6JNZVDZQk7HwA6OShpbI4Xe2OUojrqSKiUVtMe0NwvqoVvHrPYYZqPyFUI6CBVkWE3VXxv8+0Zt0eTvR7UwO3HglGNhJqGbgsMohUKBev3yilR+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727782786; c=relaxed/simple;
	bh=pD/nAzh/JC3Yy8vz47LCQ98RO2wbehXfFJev0z3/ntw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=R6zvY9evjEG0mYo8tNevUHk5jMz/6FM89aQ+J1abahXz1ZfrPtzGD8+EfgJxRKanO2IT7XxQLVJXa+000N+9y4GJyZ7u+Et9g2MpuRKoggMKzmZvjhcqFKhty9bVkhI/QkTUiioymkPrOeGlIZkuTh/VCEFgv1qhGTSMpCYe2bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=2L+L3aHT; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a8d6d0fe021so940882366b.1
        for <linux-media@vger.kernel.org>; Tue, 01 Oct 2024 04:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1727782782; x=1728387582; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DyZ953iXXKsXJbg3ETb9NgZ074fj5Y+oAKrj8aXIIO8=;
        b=2L+L3aHTi6RdF1449PBzFIP/H1Hjemmak9Lmb+dla/T1CEfZLL/9kiVKRJUwUmCsd2
         JYbx/bbWQzA9f9CL+hDIiJXIcsB2wgy3LXZqmGFWEDTxF6WgmxCXpsg9H74c2U9Egr/J
         XvJv1WRRengTFMC7HDWlTXOdRnATSEG3dPi8JaZbs2Ylq8BT5erSS06Nd/+ppWC3yZ2Z
         EbmyH21mEuOwiQ1u2C0PEJOV8tdYhAlgV6erHqEjYZJCwY8+UNdstTiCm8pWMVUJQ5so
         uHM6rfaP5UEZKPVnKj/hr/Vz3MBuTsOppSKH7wXtevKjG2oQnWQOk5LlLAS8za3bVNP8
         kbyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727782782; x=1728387582;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DyZ953iXXKsXJbg3ETb9NgZ074fj5Y+oAKrj8aXIIO8=;
        b=xSzrTGhg+z+n6iEqbA+Sg8iJ1JaoJW3IcN2qRw1m6cZxM9xUw7Z1B9dH9xtfLxmJAv
         YAa66RIdTBxaeChYOa7p+U9u5oTu9KPZP07pR3thqqD3dE9jgyla3JkpdZgiW/G5Xuh9
         nD9tGldQF5fBKDSluu+0hQ98HeAkRLC/qHfElIBnsEVbEbbWcUhr9F+jMbFrEEmtcvnM
         M+x94OZLXggnwCmP6bmyon81d8PUXeIFS2i4fMYMK34bzKCa1sOjjZy9gspBn2UQ78eA
         b+4lAhVc0E82zkxR8oaM6DdW/nccjR9e33kG0nEwzFOT15qFhdi2dhz78Sc1ol2TBckY
         mhXg==
X-Forwarded-Encrypted: i=1; AJvYcCV6lLA8BHPS1IaDAvV4B9UevQrESxmJR9LT1elI8GBLYp/+FE8FX7SJFAmI4fR0QErNeDTAWL3nRR+JOw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2mejErXFrFUdZIhs9muOWOPT8I+b3R0SPNChxWz9K5UqFdruS
	GrErSplroYUn5z5YdJSTCKkhCw3mGe0zFCzozfTp63Nskofj5IS5A7ifw8TX4Sc=
X-Google-Smtp-Source: AGHT+IFtFFJw7nB+YbnAJrkzDoG9jgSGuoqRIpm0eg/MGZ7zZiniA/lrRkvlswGVhecTEwj9BJD56Q==
X-Received: by 2002:a17:907:96aa:b0:a86:89ea:ee6c with SMTP id a640c23a62f3a-a93c4946cd5mr1836781066b.30.1727782781851;
        Tue, 01 Oct 2024 04:39:41 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c2978a71sm697271266b.161.2024.10.01.04.39.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Oct 2024 04:39:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 01 Oct 2024 13:39:40 +0200
Message-Id: <D4KFVNV1A4KG.CFLT81CFBDTM@fairphone.com>
Cc: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, "Suresh Vankadara"
 <quic_svankada@quicinc.com>, "Trishansh Bhardwaj"
 <quic_tbhardwa@quicinc.com>, <stable@vger.kernel.org>, "Hariram
 Purushothaman" <quic_hariramp@quicinc.com>
Subject: Re: [PATCH 00/10] (no cover subject)
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, "Vikram Sharma"
 <quic_vikramsa@quicinc.com>, "Robert Foss" <rfoss@kernel.org>, "Todor
 Tomov" <todor.too@gmail.com>, "Mauro Carvalho Chehab" <mchehab@kernel.org>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Kapatrala
 Syed" <akapatra@quicinc.com>, "Hariram Purushothaman"
 <hariramp@quicinc.com>, "Bjorn Andersson" <andersson@kernel.org>, "Konrad
 Dybcio" <konradybcio@kernel.org>, "Hans Verkuil"
 <hverkuil-cisco@xs4all.nl>, <cros-qcom-dts-watchers@chromium.org>, "Catalin
 Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20240904-camss_on_sc7280_rb3gen2_vision_v2_patches-v1-0-b18ddcd7d9df@quicinc.com> <D4JK8TRL7XBL.3TBA1FBF32RXL@fairphone.com> <fc0ce5cd-e42a-432b-ad74-01de67ec0d5c@linaro.org> <D4KBQ3ENKF5Y.3D2AK81PELAEZ@fairphone.com> <e7cc5f91-a0a8-48fc-9eb6-b9c46b22dfeb@linaro.org>
In-Reply-To: <e7cc5f91-a0a8-48fc-9eb6-b9c46b22dfeb@linaro.org>

On Tue Oct 1, 2024 at 11:30 AM CEST, Bryan O'Donoghue wrote:
> On 01/10/2024 09:24, Luca Weiss wrote:
> >> media-ctl --reset
> >> yavta --no-query -w '0x009f0903 2' /dev/v4l-subdev5
> >> yavta --list /dev/v4l-subdev5
> >> media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
> >> media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
> >> media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> >> media-ctl -d /dev/media0 -p
> > Hi Bryan!
> >=20
> > These commands are to set up the pipeline, and what then to grab an
> > image from it?
> >=20
> > I tried this, but it also just hangs:
> >=20
> > $ yavta -B capture-mplane --capture=3D3 -n 3 -f SRGGB10P -s 4056x3040 /=
dev/video0 --file=3Dfoo-#.bin
> > Device /dev/video0 opened.
> > Device `Qualcomm Camera Subsystem' on `platform:acb3000.camss' (driver =
'qcom-camss') supports video, capture, with mplanes.
> > Video format set: SRGGB10P (41415270) 4056x3040 field none, 1 planes:
> >   * Stride 5072, buffer size 15418880
> > Video format: SRGGB10P (41415270) 4056x3040 field none, 1 planes:
> >   * Stride 5072, buffer size 15418880
> > 3 buffers requested.
> > length: 1 offset: 3326519176 timestamp type/source: mono/EoF
> > Buffer 0/0 mapped at address 0xffffa0c00000.
> > length: 1 offset: 3326519176 timestamp type/source: mono/EoF
> > Buffer 1/0 mapped at address 0xffff9fc08000.
> > length: 1 offset: 3326519176 timestamp type/source: mono/EoF
> > Buffer 2/0 mapped at address 0xffff9ec10000.
>
> No there's no CSIPHY in that case, it should be the TPG inside of CSID0=
=20
> @ /dev/v4l-subdev5 which generates the data.

I understand the lack of csiphy involvement here, but how's this
relevant to reading data from /dev/video0? That's the vfe which gets
hooked up with the media-ctl commands to my understanding?

And v4l-subdev5 is msm_csid0 on my device.

>
> Just for verification purposes do a  `media-ctl -d /dev/media0 -p` and=20
> confirm that /dev/v4l-subdev5 =3D=3D csid0
>
> Rewrite the above as
>
> export csid0=3Dv4l-subdevX
>
> media-ctl --reset
> yavta --no-query -w '0x009f0903 2' /dev/$csid0
> yavta --list /dev/$csid0
> media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> media-ctl -d /dev/media0 -p
>
> basically you have to make sure you've set the TPG on the correct subdev.=
.
>
> Something like in media-ctl subdev4 in my case.
>
> - entity 13: msm_csid0 (5 pads, 36 links, 0 routes)
>               type V4L2 subdev subtype Unknown flags 0
>               device node name /dev/v4l-subdev4
>

Sure, here's the output from the commands:

fairphone-fp5:~$ export csid0=3Dv4l-subdev5
fairphone-fp5:~$ media-ctl --reset
fairphone-fp5:~$ yavta --no-query -w '0x009f0903 2' /dev/$csid0
Device /dev/v4l-subdev5 opened.
Control 0x009f0903 set to 2, is 2
fairphone-fp5:~$  yavta --list /dev/$csid0
Device /dev/v4l-subdev5 opened.
--- Image Processing Controls (class 0x009f0001) ---
control 0x009f0903 `Test Pattern' min 0 max 9 step 1 default 0 current 2
  0: Disabled
  1: Incrementing
  2: Alternating 0x55/0xAA (*)
  3: All Zeros 0x00
  4: All Ones 0xFF
  5: Pseudo-random Data
  6: User Specified
  7: Complex pattern
  8: Color box
  9: Color bars
1 control found.
Unable to get format: Not a tty (25).
fairphone-fp5:~$ media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
fairphone-fp5:~$ media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
fairphone-fp5:~$ media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
fairphone-fp5:~$ media-ctl -d /dev/media0 -p
Media controller API version 6.11.0

Media device information
------------------------
driver          qcom-camss
model           Qualcomm Camera Subsystem
serial         =20
bus info        platform:acb3000.camss
hw revision     0x0
driver version  6.11.0

Device topology
- entity 1: msm_csiphy0 (2 pads, 5 links, 0 routes)
            type V4L2 subdev subtype Unknown flags 0
            device node name /dev/v4l-subdev0
        pad0: Sink
                [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:sr=
gb]
        pad1: Source
                [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:sr=
gb]
                -> "msm_csid0":0 []
                -> "msm_csid1":0 []
                -> "msm_csid2":0 []
                -> "msm_csid3":0 []
                -> "msm_csid4":0 []

- entity 4: msm_csiphy1 (2 pads, 5 links, 0 routes)
            type V4L2 subdev subtype Unknown flags 0
            device node name /dev/v4l-subdev1
        pad0: Sink
                [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:sr=
gb]
        pad1: Source
                [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:sr=
gb]
                -> "msm_csid0":0 []
                -> "msm_csid1":0 []
                -> "msm_csid2":0 []
                -> "msm_csid3":0 []
                -> "msm_csid4":0 []

- entity 7: msm_csiphy2 (2 pads, 5 links, 0 routes)
            type V4L2 subdev subtype Unknown flags 0
            device node name /dev/v4l-subdev2
        pad0: Sink
                [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:sr=
gb]
        pad1: Source
                [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:sr=
gb]
                -> "msm_csid0":0 []
                -> "msm_csid1":0 []
                -> "msm_csid2":0 []
                -> "msm_csid3":0 []
                -> "msm_csid4":0 []

- entity 10: msm_csiphy3 (2 pads, 5 links, 0 routes)
             type V4L2 subdev subtype Unknown flags 0
             device node name /dev/v4l-subdev3
        pad0: Sink
                [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:sr=
gb]
        pad1: Source
                [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:sr=
gb]
                -> "msm_csid0":0 []
                -> "msm_csid1":0 []
                -> "msm_csid2":0 []
                -> "msm_csid3":0 []
                -> "msm_csid4":0 []

- entity 13: msm_csiphy4 (2 pads, 5 links, 0 routes)
             type V4L2 subdev subtype Unknown flags 0
             device node name /dev/v4l-subdev4
        pad0: Sink
                [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:sr=
gb]
        pad1: Source
                [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:sr=
gb]
                -> "msm_csid0":0 []
                -> "msm_csid1":0 []
                -> "msm_csid2":0 []
                -> "msm_csid3":0 []
                -> "msm_csid4":0 []

- entity 16: msm_csid0 (5 pads, 22 links, 0 routes)
             type V4L2 subdev subtype Unknown flags 0
             device node name /dev/v4l-subdev5
        pad0: Sink
                [stream:0 fmt:SRGGB10_1X10/4056x3040 field:none colorspace:=
srgb]
                <- "msm_csiphy0":1 []
                <- "msm_csiphy1":1 []
                <- "msm_csiphy2":1 []
                <- "msm_csiphy3":1 []
                <- "msm_csiphy4":1 []
        pad1: Source
                [stream:0 fmt:SRGGB10_1X10/4056x3040 field:none colorspace:=
srgb]
                -> "msm_vfe0_rdi0":0 [ENABLED]
                -> "msm_vfe1_rdi0":0 []
                -> "msm_vfe2_rdi0":0 []
                -> "msm_vfe3_rdi0":0 []
                -> "msm_vfe4_rdi0":0 []
        pad2: Source
                [stream:0 fmt:SRGGB10_1X10/4056x3040 field:none colorspace:=
srgb]
                -> "msm_vfe0_rdi1":0 []
                -> "msm_vfe1_rdi1":0 []
                -> "msm_vfe2_rdi1":0 []
                -> "msm_vfe3_rdi1":0 []
                -> "msm_vfe4_rdi1":0 []
        pad3: Source
                [stream:0 fmt:SRGGB10_1X10/4056x3040 field:none colorspace:=
srgb]
                -> "msm_vfe0_rdi2":0 []
                -> "msm_vfe1_rdi2":0 []
                -> "msm_vfe2_rdi2":0 []
                -> "msm_vfe3_rdi2":0 []
                -> "msm_vfe4_rdi2":0 []
        pad4: Source
                [stream:0 fmt:SRGGB10_1X10/4056x3040 field:none colorspace:=
srgb]
                -> "msm_vfe3_pix":0 []
                -> "msm_vfe4_pix":0 []

- entity 22: msm_csid1 (5 pads, 22 links, 0 routes)
             type V4L2 subdev subtype Unknown flags 0
             device node name /dev/v4l-subdev6
        pad0: Sink
                [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:sr=
gb]
                <- "msm_csiphy0":1 []
                <- "msm_csiphy1":1 []
                <- "msm_csiphy2":1 []
                <- "msm_csiphy3":1 []
                <- "msm_csiphy4":1 []
        pad1: Source
                [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:sr=
gb]
                -> "msm_vfe0_rdi0":0 []
                -> "msm_vfe1_rdi0":0 []
                -> "msm_vfe2_rdi0":0 []
                -> "msm_vfe3_rdi0":0 []
                -> "msm_vfe4_rdi0":0 []
        pad2: Source
                [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:sr=
gb]
                -> "msm_vfe0_rdi1":0 []
                -> "msm_vfe1_rdi1":0 []
                -> "msm_vfe2_rdi1":0 []
                -> "msm_vfe3_rdi1":0 []
                -> "msm_vfe4_rdi1":0 []
        pad3: Source
                [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:sr=
gb]
                -> "msm_vfe0_rdi2":0 []
                -> "msm_vfe1_rdi2":0 []
                -> "msm_vfe2_rdi2":0 []
                -> "msm_vfe3_rdi2":0 []
                -> "msm_vfe4_rdi2":0 []
        pad4: Source
                [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:sr=
gb]
                -> "msm_vfe3_pix":0 []
                -> "msm_vfe4_pix":0 []

- entity 28: msm_csid2 (5 pads, 22 links, 0 routes)
             type V4L2 subdev subtype Unknown flags 0
             device node name /dev/v4l-subdev7
        pad0: Sink
                [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:sr=
gb]
                <- "msm_csiphy0":1 []
                <- "msm_csiphy1":1 []
                <- "msm_csiphy2":1 []
                <- "msm_csiphy3":1 []
                <- "msm_csiphy4":1 []
        pad1: Source
                [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:sr=
gb]
                -> "msm_vfe0_rdi0":0 []
                -> "msm_vfe1_rdi0":0 []
                -> "msm_vfe2_rdi0":0 []
                -> "msm_vfe3_rdi0":0 []
                -> "msm_vfe4_rdi0":0 []
        pad2: Source
                [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:sr=
gb]
                -> "msm_vfe0_rdi1":0 []
                -> "msm_vfe1_rdi1":0 []
                -> "msm_vfe2_rdi1":0 []
                -> "msm_vfe3_rdi1":0 []
                -> "msm_vfe4_rdi1":0 []
        pad3: Source
                [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:sr=
gb]
                -> "msm_vfe0_rdi2":0 []
                -> "msm_vfe1_rdi2":0 []
                -> "msm_vfe2_rdi2":0 []
                -> "msm_vfe3_rdi2":0 []
                -> "msm_vfe4_rdi2":0 []
        pad4: Source
                [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:sr=
gb]
                -> "msm_vfe3_pix":0 []
                -> "msm_vfe4_pix":0 []

- entity 34: msm_csid3 (5 pads, 22 links, 0 routes)
             type V4L2 subdev subtype Unknown flags 0
             device node name /dev/v4l-subdev8
        pad0: Sink
                [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:sr=
gb]
                <- "msm_csiphy0":1 []
                <- "msm_csiphy1":1 []
                <- "msm_csiphy2":1 []
                <- "msm_csiphy3":1 []
                <- "msm_csiphy4":1 []
        pad1: Source
                [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:sr=
gb]
                -> "msm_vfe0_rdi0":0 []
                -> "msm_vfe1_rdi0":0 []
                -> "msm_vfe2_rdi0":0 []
                -> "msm_vfe3_rdi0":0 []
                -> "msm_vfe4_rdi0":0 []
        pad2: Source
                [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:sr=
gb]
                -> "msm_vfe0_rdi1":0 []
                -> "msm_vfe1_rdi1":0 []
                -> "msm_vfe2_rdi1":0 []
                -> "msm_vfe3_rdi1":0 []
                -> "msm_vfe4_rdi1":0 []
        pad3: Source
                [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:sr=
gb]
                -> "msm_vfe0_rdi2":0 []
                -> "msm_vfe1_rdi2":0 []
                -> "msm_vfe2_rdi2":0 []
                -> "msm_vfe3_rdi2":0 []
                -> "msm_vfe4_rdi2":0 []
        pad4: Source
                [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:sr=
gb]
                -> "msm_vfe3_pix":0 []
                -> "msm_vfe4_pix":0 []

- entity 40: msm_csid4 (5 pads, 22 links, 0 routes)
             type V4L2 subdev subtype Unknown flags 0
             device node name /dev/v4l-subdev9
        pad0: Sink
                [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:sr=
gb]
                <- "msm_csiphy0":1 []
                <- "msm_csiphy1":1 []
                <- "msm_csiphy2":1 []
                <- "msm_csiphy3":1 []
                <- "msm_csiphy4":1 []
        pad1: Source
                [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:sr=
gb]
                -> "msm_vfe0_rdi0":0 []
                -> "msm_vfe1_rdi0":0 []
                -> "msm_vfe2_rdi0":0 []
                -> "msm_vfe3_rdi0":0 []
                -> "msm_vfe4_rdi0":0 []
        pad2: Source
                [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:sr=
gb]
                -> "msm_vfe0_rdi1":0 []
                -> "msm_vfe1_rdi1":0 []
                -> "msm_vfe2_rdi1":0 []
                -> "msm_vfe3_rdi1":0 []
                -> "msm_vfe4_rdi1":0 []
        pad3: Source
                [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:sr=
gb]
                -> "msm_vfe0_rdi2":0 []
                -> "msm_vfe1_rdi2":0 []
                -> "msm_vfe2_rdi2":0 []
                -> "msm_vfe3_rdi2":0 []
                -> "msm_vfe4_rdi2":0 []
        pad4: Source
                [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:sr=
gb]
                -> "msm_vfe3_pix":0 []
                -> "msm_vfe4_pix":0 []

- entity 46: msm_vfe0_rdi0 (2 pads, 6 links, 0 routes)
             type V4L2 subdev subtype Unknown flags 0
             device node name /dev/v4l-subdev10
        pad0: Sink
                [stream:0 fmt:SRGGB10_1X10/4056x3040 field:none colorspace:=
srgb]
                <- "msm_csid0":1 [ENABLED]
                <- "msm_csid1":1 []
                <- "msm_csid2":1 []
                <- "msm_csid3":1 []
                <- "msm_csid4":1 []
        pad1: Source
                [stream:0 fmt:SRGGB10_1X10/4056x3040 field:none colorspace:=
srgb]
                -> "msm_vfe0_video0":0 [ENABLED,IMMUTABLE]

- entity 49: msm_vfe0_video0 (1 pad, 1 link)
             type Node subtype V4L flags 0
             device node name /dev/video0
        pad0: Sink
                <- "msm_vfe0_rdi0":1 [ENABLED,IMMUTABLE]

- entity 55: msm_vfe0_rdi1 (2 pads, 6 links, 0 routes)
             type V4L2 subdev subtype Unknown flags 0
             device node name /dev/v4l-subdev11
        pad0: Sink
                [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:sr=
gb]
                <- "msm_csid0":2 []
                <- "msm_csid1":2 []
                <- "msm_csid2":2 []
                <- "msm_csid3":2 []
                <- "msm_csid4":2 []
        pad1: Source
                [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:sr=
gb]
                -> "msm_vfe0_video1":0 [ENABLED,IMMUTABLE]

- entity 58: msm_vfe0_video1 (1 pad, 1 link)
             type Node subtype V4L flags 0
             device node name /dev/video1
        pad0: Sink
                <- "msm_vfe0_rdi1":1 [ENABLED,IMMUTABLE]

- entity 64: msm_vfe0_rdi2 (2 pads, 6 links, 0 routes)
             type V4L2 subdev subtype Unknown flags 0
             device node name /dev/v4l-subdev12
        pad0: Sink
                [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:sr=
gb]
                <- "msm_csid0":3 []
                <- "msm_csid1":3 []
                <- "msm_csid2":3 []
                <- "msm_csid3":3 []
                <- "msm_csid4":3 []
        pad1: Source
                [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:sr=
gb]
                -> "msm_vfe0_video2":0 [ENABLED,IMMUTABLE]

- entity 67: msm_vfe0_video2 (1 pad, 1 link)
             type Node subtype V4L flags 0
             device node name /dev/video2
        pad0: Sink
                <- "msm_vfe0_rdi2":1 [ENABLED,IMMUTABLE]

- entity 73: msm_vfe1_rdi0 (2 pads, 6 links, 0 routes)
             type V4L2 subdev subtype Unknown flags 0
             device node name /dev/v4l-subdev13
        pad0: Sink
                [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:sr=
gb]
                <- "msm_csid0":1 []
                <- "msm_csid1":1 []
                <- "msm_csid2":1 []
                <- "msm_csid3":1 []
                <- "msm_csid4":1 []
        pad1: Source
                [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:sr=
gb]
                -> "msm_vfe1_video0":0 [ENABLED,IMMUTABLE]

- entity 76: msm_vfe1_video0 (1 pad, 1 link)
             type Node subtype V4L flags 0
             device node name /dev/video3
        pad0: Sink
                <- "msm_vfe1_rdi0":1 [ENABLED,IMMUTABLE]

- entity 82: msm_vfe1_rdi1 (2 pads, 6 links, 0 routes)
             type V4L2 subdev subtype Unknown flags 0
             device node name /dev/v4l-subdev14
        pad0: Sink
                [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:sr=
gb]
                <- "msm_csid0":2 []
                <- "msm_csid1":2 []
                <- "msm_csid2":2 []
                <- "msm_csid3":2 []
                <- "msm_csid4":2 []
        pad1: Source
                [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:sr=
gb]
                -> "msm_vfe1_video1":0 [ENABLED,IMMUTABLE]

- entity 85: msm_vfe1_video1 (1 pad, 1 link)
             type Node subtype V4L flags 0
             device node name /dev/video4
        pad0: Sink
                <- "msm_vfe1_rdi1":1 [ENABLED,IMMUTABLE]

- entity 91: msm_vfe1_rdi2 (2 pads, 6 links, 0 routes)
             type V4L2 subdev subtype Unknown flags 0
             device node name /dev/v4l-subdev15
        pad0: Sink
                [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:sr=
gb]
                <- "msm_csid0":3 []
                <- "msm_csid1":3 []
                <- "msm_csid2":3 []
                <- "msm_csid3":3 []
                <- "msm_csid4":3 []
        pad1: Source
                [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:sr=
gb]
                -> "msm_vfe1_video2":0 [ENABLED,IMMUTABLE]

- entity 94: msm_vfe1_video2 (1 pad, 1 link)
             type Node subtype V4L flags 0
             device node name /dev/video5
        pad0: Sink
                <- "msm_vfe1_rdi2":1 [ENABLED,IMMUTABLE]

- entity 100: msm_vfe2_rdi0 (2 pads, 6 links, 0 routes)
              type V4L2 subdev subtype Unknown flags 0
              device node name /dev/v4l-subdev16
        pad0: Sink
                [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:sr=
gb]
                <- "msm_csid0":1 []
                <- "msm_csid1":1 []
                <- "msm_csid2":1 []
                <- "msm_csid3":1 []
                <- "msm_csid4":1 []
        pad1: Source
                [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:sr=
gb]
                -> "msm_vfe2_video0":0 [ENABLED,IMMUTABLE]

- entity 103: msm_vfe2_video0 (1 pad, 1 link)
              type Node subtype V4L flags 0
              device node name /dev/video6
        pad0: Sink
                <- "msm_vfe2_rdi0":1 [ENABLED,IMMUTABLE]

- entity 109: msm_vfe2_rdi1 (2 pads, 6 links, 0 routes)
              type V4L2 subdev subtype Unknown flags 0
              device node name /dev/v4l-subdev17
        pad0: Sink
                [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:sr=
gb]
                <- "msm_csid0":2 []
                <- "msm_csid1":2 []
                <- "msm_csid2":2 []
                <- "msm_csid3":2 []
                <- "msm_csid4":2 []
        pad1: Source
                [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:sr=
gb]
                -> "msm_vfe2_video1":0 [ENABLED,IMMUTABLE]

- entity 112: msm_vfe2_video1 (1 pad, 1 link)
              type Node subtype V4L flags 0
              device node name /dev/video7
        pad0: Sink
                <- "msm_vfe2_rdi1":1 [ENABLED,IMMUTABLE]

- entity 118: msm_vfe2_rdi2 (2 pads, 6 links, 0 routes)
              type V4L2 subdev subtype Unknown flags 0
              device node name /dev/v4l-subdev18
        pad0: Sink
                [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:sr=
gb]
                <- "msm_csid0":3 []
                <- "msm_csid1":3 []
                <- "msm_csid2":3 []
                <- "msm_csid3":3 []
                <- "msm_csid4":3 []
        pad1: Source
                [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:sr=
gb]
                -> "msm_vfe2_video2":0 [ENABLED,IMMUTABLE]

- entity 121: msm_vfe2_video2 (1 pad, 1 link)
              type Node subtype V4L flags 0
              device node name /dev/video8
        pad0: Sink
                <- "msm_vfe2_rdi2":1 [ENABLED,IMMUTABLE]

- entity 127: msm_vfe3_rdi0 (2 pads, 6 links, 0 routes)
              type V4L2 subdev subtype Unknown flags 0
              device node name /dev/v4l-subdev19
        pad0: Sink
                [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:sr=
gb]
                <- "msm_csid0":1 []
                <- "msm_csid1":1 []
                <- "msm_csid2":1 []
                <- "msm_csid3":1 []
                <- "msm_csid4":1 []
        pad1: Source
                [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:sr=
gb]
                -> "msm_vfe3_video0":0 [ENABLED,IMMUTABLE]

- entity 130: msm_vfe3_video0 (1 pad, 1 link)
              type Node subtype V4L flags 0
              device node name /dev/video9
        pad0: Sink
                <- "msm_vfe3_rdi0":1 [ENABLED,IMMUTABLE]

- entity 136: msm_vfe3_rdi1 (2 pads, 6 links, 0 routes)
              type V4L2 subdev subtype Unknown flags 0
              device node name /dev/v4l-subdev20
        pad0: Sink
                [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:sr=
gb]
                <- "msm_csid0":2 []
                <- "msm_csid1":2 []
                <- "msm_csid2":2 []
                <- "msm_csid3":2 []
                <- "msm_csid4":2 []
        pad1: Source
                [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:sr=
gb]
                -> "msm_vfe3_video1":0 [ENABLED,IMMUTABLE]

- entity 139: msm_vfe3_video1 (1 pad, 1 link)
              type Node subtype V4L flags 0
              device node name /dev/video10
        pad0: Sink
                <- "msm_vfe3_rdi1":1 [ENABLED,IMMUTABLE]

- entity 145: msm_vfe3_rdi2 (2 pads, 6 links, 0 routes)
              type V4L2 subdev subtype Unknown flags 0
              device node name /dev/v4l-subdev21
        pad0: Sink
                [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:sr=
gb]
                <- "msm_csid0":3 []
                <- "msm_csid1":3 []
                <- "msm_csid2":3 []
                <- "msm_csid3":3 []
                <- "msm_csid4":3 []
        pad1: Source
                [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:sr=
gb]
                -> "msm_vfe3_video2":0 [ENABLED,IMMUTABLE]

- entity 148: msm_vfe3_video2 (1 pad, 1 link)
              type Node subtype V4L flags 0
              device node name /dev/video11
        pad0: Sink
                <- "msm_vfe3_rdi2":1 [ENABLED,IMMUTABLE]

- entity 154: msm_vfe3_pix (2 pads, 6 links, 0 routes)
              type V4L2 subdev subtype Unknown flags 0
              device node name /dev/v4l-subdev22
        pad0: Sink
                [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:sr=
gb
                 compose.bounds:(0,0)/1920x1080
                 compose:(0,0)/1920x1080]
                <- "msm_csid0":4 []
                <- "msm_csid1":4 []
                <- "msm_csid2":4 []
                <- "msm_csid3":4 []
                <- "msm_csid4":4 []
        pad1: Source
                [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:sr=
gb
                 crop.bounds:(0,0)/1920x1080
                 crop:(0,0)/1920x1080]
                -> "msm_vfe3_video3":0 [ENABLED,IMMUTABLE]

- entity 157: msm_vfe3_video3 (1 pad, 1 link)
              type Node subtype V4L flags 0
              device node name /dev/video12
        pad0: Sink
                <- "msm_vfe3_pix":1 [ENABLED,IMMUTABLE]

- entity 163: msm_vfe4_rdi0 (2 pads, 6 links, 0 routes)
              type V4L2 subdev subtype Unknown flags 0
              device node name /dev/v4l-subdev23
        pad0: Sink
                [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:sr=
gb]
                <- "msm_csid0":1 []
                <- "msm_csid1":1 []
                <- "msm_csid2":1 []
                <- "msm_csid3":1 []
                <- "msm_csid4":1 []
        pad1: Source
                [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:sr=
gb]
                -> "msm_vfe4_video0":0 [ENABLED,IMMUTABLE]

- entity 166: msm_vfe4_video0 (1 pad, 1 link)
              type Node subtype V4L flags 0
              device node name /dev/video13
        pad0: Sink
                <- "msm_vfe4_rdi0":1 [ENABLED,IMMUTABLE]

- entity 172: msm_vfe4_rdi1 (2 pads, 6 links, 0 routes)
              type V4L2 subdev subtype Unknown flags 0
              device node name /dev/v4l-subdev24
        pad0: Sink
                [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:sr=
gb]
                <- "msm_csid0":2 []
                <- "msm_csid1":2 []
                <- "msm_csid2":2 []
                <- "msm_csid3":2 []
                <- "msm_csid4":2 []
        pad1: Source
                [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:sr=
gb]
                -> "msm_vfe4_video1":0 [ENABLED,IMMUTABLE]

- entity 175: msm_vfe4_video1 (1 pad, 1 link)
              type Node subtype V4L flags 0
              device node name /dev/video14
        pad0: Sink
                <- "msm_vfe4_rdi1":1 [ENABLED,IMMUTABLE]

- entity 181: msm_vfe4_rdi2 (2 pads, 6 links, 0 routes)
              type V4L2 subdev subtype Unknown flags 0
              device node name /dev/v4l-subdev25
        pad0: Sink
                [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:sr=
gb]
                <- "msm_csid0":3 []
                <- "msm_csid1":3 []
                <- "msm_csid2":3 []
                <- "msm_csid3":3 []
                <- "msm_csid4":3 []
        pad1: Source
                [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:sr=
gb]
                -> "msm_vfe4_video2":0 [ENABLED,IMMUTABLE]

- entity 184: msm_vfe4_video2 (1 pad, 1 link)
              type Node subtype V4L flags 0
              device node name /dev/video15
        pad0: Sink
                <- "msm_vfe4_rdi2":1 [ENABLED,IMMUTABLE]

- entity 190: msm_vfe4_pix (2 pads, 6 links, 0 routes)
              type V4L2 subdev subtype Unknown flags 0
              device node name /dev/v4l-subdev26
        pad0: Sink
                [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:sr=
gb
                 compose.bounds:(0,0)/1920x1080
                 compose:(0,0)/1920x1080]
                <- "msm_csid0":4 []
                <- "msm_csid1":4 []
                <- "msm_csid2":4 []
                <- "msm_csid3":4 []
                <- "msm_csid4":4 []
        pad1: Source
                [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:sr=
gb
                 crop.bounds:(0,0)/1920x1080
                 crop:(0,0)/1920x1080]
                -> "msm_vfe4_video3":0 [ENABLED,IMMUTABLE]

- entity 193: msm_vfe4_video3 (1 pad, 1 link)
              type Node subtype V4L flags 0
              device node name /dev/video16
        pad0: Sink
                <- "msm_vfe4_pix":1 [ENABLED,IMMUTABLE]




> =3D>
>
> export csid0=3Dv4l-subdev4
>
> media-ctl --reset
> yavta --no-query -w '0x009f0903 2' /dev/$csid0
> yavta --list /dev/$csid0
> media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> media-ctl -d /dev/media0 -p
>
>
> ---
> bod


