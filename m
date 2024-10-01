Return-Path: <linux-media+bounces-18947-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CD298BFCB
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 16:23:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C82EC1C2279D
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 14:23:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE8161C6893;
	Tue,  1 Oct 2024 14:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="1vvqlon/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924E31C68A7
	for <linux-media@vger.kernel.org>; Tue,  1 Oct 2024 14:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727792575; cv=none; b=Xx9h3sjB32+Ad+JZsIxxLX9x/ogyecZmuDgVL634HWLiDyGTcy4G47unBUwSaTLlcbIm5VnvsiqDJ4Uwvezjyz/Zt/1Mf16M8GvvOey/1CpZUf+fLhjLxPNKgT7bsrUMlBGoXare8nO9ou4D9dwwAAm9xgGyw1JUOkkmoMnewNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727792575; c=relaxed/simple;
	bh=yh036OuWVtZS192RdATSdM1krocVw8uCFUV8hJl9q+c=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=qADbvBAzJdbSsUbD+hwQbjIkzNwbNwwJPTyDQowmRC0eA74D0r9ftCZoV6atdnGzFn6HA/9o5BJiENSSyvBXaT/OdGUzT7uKGa7yZWPoPINymbYbjhxVC+NFoVAeRi/Jv/5i/aJ3lzd7JfpYPQMlvpeCGwbSMEjIzTz9YNACG0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=1vvqlon/; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42cbface8d6so68480275e9.3
        for <linux-media@vger.kernel.org>; Tue, 01 Oct 2024 07:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1727792572; x=1728397372; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OUXzWwVynlO2farGmzjCRjampG4QkTOOiMVa306g3F4=;
        b=1vvqlon/Wb0my+FmrnsCC6P3iwhXdkVqtiqptopuzppGeGW6ElTzwNAH15nCgJehQB
         Z468l9a8p7mrglnuAyFtlJe37bJPs1dOR8FB8JHEVRuJbl8v+1a6EPLshDLxuDIxmVpE
         Qw6MEF8nQRsm+73H0xcOufZF1rxKI9RMBpGEOtGwKBdzsTgpC+Pn7svs2KAWchlHx0pS
         7ysjzFszeDImQUZDmrx/myVWmLm3zZbnhndJ86fjx81QeyP6hamTVV47wjh+n57o7sRU
         atw7LF8h9EoZjxjmR6PfhtT8EQdYzKKXC0LzmA2HBqlbZTEXwACV1zcbpl7tjnxkeAAW
         +rEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727792572; x=1728397372;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OUXzWwVynlO2farGmzjCRjampG4QkTOOiMVa306g3F4=;
        b=ErtU2A1lfHJAcTlgX80jmW0Bv4wOPZtUBgJhCYa1LQJqmR5VICwQyOjjP4F2NJ8dTr
         NugzG9QhtoQXXT3iv1hyogESojv5GRkBWcAN+2Wx0JLsOR+ykuKJjtaT+r3gZf4/S2/9
         ZltVUN7LV8l8jvavepHJufIxA9B/m57bmFh2sHSyJFoCptmY3RtsHmgKKWP4yzqF5gVH
         XhVZpL8UcE7anFGwqWpjqIpFUcpsHjxkCSBvD9pkUyrDm66IRk+sfxMXMf2FdsHw0afy
         cnR8LvPeRQVvvv/m7//2lJQsKzU84qn+O+1OcE+dwQoujh4MDRB6skRB/HnZ0wtpPSGn
         ngCg==
X-Forwarded-Encrypted: i=1; AJvYcCUtTzIx2GYUonZRN3PxodDLoyERNfducR/9LCm8vWmlIwdhDqiIW76Vex5J8Dt74p5zVCaIGNPTmTVzWA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2qvXGJm5cagn/3AniCZ5mZ+5+5xr1C/19B2k5OoBsEGe/EFpu
	sqW+Nz9/WUIWjjVly1K4dzi4LRsA3xc7F25TU1P1UxdNQaIutEMmJ2irrhpDaxc=
X-Google-Smtp-Source: AGHT+IE1MDD/pWaftXcta30RJmYNnd36yu433BiXNnM+DOhxjOYYibckt0mh/3U0Wfvp0AGvZHCkkA==
X-Received: by 2002:a05:600c:4ed3:b0:42c:df29:2366 with SMTP id 5b1f17b1804b1-42f584a1d68mr169077405e9.33.1727792571880;
        Tue, 01 Oct 2024 07:22:51 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27c7184sm716888766b.83.2024.10.01.07.22.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Oct 2024 07:22:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 01 Oct 2024 16:22:50 +0200
Message-Id: <D4KJCLCDGQ96.251XO3OG6DVB6@fairphone.com>
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
 Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 =?utf-8?q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20240904-camss_on_sc7280_rb3gen2_vision_v2_patches-v1-0-b18ddcd7d9df@quicinc.com> <D4JK8TRL7XBL.3TBA1FBF32RXL@fairphone.com> <fc0ce5cd-e42a-432b-ad74-01de67ec0d5c@linaro.org> <D4KBQ3ENKF5Y.3D2AK81PELAEZ@fairphone.com> <e7cc5f91-a0a8-48fc-9eb6-b9c46b22dfeb@linaro.org> <D4KFVNV1A4KG.CFLT81CFBDTM@fairphone.com> <c912f2da-519c-4bdc-a5cb-e19c3aa63ea8@linaro.org>
In-Reply-To: <c912f2da-519c-4bdc-a5cb-e19c3aa63ea8@linaro.org>

On Tue Oct 1, 2024 at 2:49 PM CEST, Bryan O'Donoghue wrote:
> On 01/10/2024 12:39, Luca Weiss wrote:
>
> > And v4l-subdev5 is msm_csid0 on my device.
>
> <snip>
>
> >=20
> > - entity 16: msm_csid0 (5 pads, 22 links, 0 routes)
> >               type V4L2 subdev subtype Unknown flags 0
> >               device node name /dev/v4l-subdev5
> >          pad0: Sink
> >                  [stream:0 fmt:SRGGB10_1X10/4056x3040 field:none colors=
pace:srgb]
> >                  <- "msm_csiphy0":1 []
> >                  <- "msm_csiphy1":1 []
> >                  <- "msm_csiphy2":1 []
> >                  <- "msm_csiphy3":1 []
> >                  <- "msm_csiphy4":1 []
> >          pad1: Source
> >                  [stream:0 fmt:SRGGB10_1X10/4056x3040 field:none colors=
pace:srgb]
> >                  -> "msm_vfe0_rdi0":0 [ENABLED]
> >                  -> "msm_vfe1_rdi0":0 []
> >                  -> "msm_vfe2_rdi0":0 []
> >                  -> "msm_vfe3_rdi0":0 []
> >                  -> "msm_vfe4_rdi0":0 []
>
> <snip>
>
> media-ctl --reset
> yavta --no-query -w '0x009f0903 2' /dev/v4l-subdev5
> yavta --list /dev/v4l-subdev5
> media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> media-ctl -d /dev/media0 -p
>
> That command list and this
>
> yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video=
0
>
> should work.

Yeah, unfortunately this is still hanging... Let's also see what Vikram
sees on their board.

fairphone-fp5:~$ yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x304=
0 -F /dev/video0
Device /dev/video0 opened.
Device `Qualcomm Camera Subsystem' on `platform:acb3000.camss' (driver 'qco=
m-camss') supports video, capture, with mplanes.
Video format set: SRGGB10P (41415270) 4056x3040 field none, 1 planes:=20
 * Stride 5072, buffer size 15418880
Video format: SRGGB10P (41415270) 4056x3040 field none, 1 planes:=20
 * Stride 5072, buffer size 15418880
5 buffers requested.
length: 1 offset: 3442938648 timestamp type/source: mono/EoF
Buffer 0/0 mapped at address 0xffff85e00000.
length: 1 offset: 3442938648 timestamp type/source: mono/EoF
Buffer 1/0 mapped at address 0xffff84e08000.
length: 1 offset: 3442938648 timestamp type/source: mono/EoF
Buffer 2/0 mapped at address 0xffff83e10000.
length: 1 offset: 3442938648 timestamp type/source: mono/EoF
Buffer 3/0 mapped at address 0xffff82e18000.
length: 1 offset: 3442938648 timestamp type/source: mono/EoF
Buffer 4/0 mapped at address 0xffff81e20000.

> I have to test Vladimir's two patches. I'll verify rb5 TPG while I'm at=
=20
> it, perhaps the error is not sdm670 specific.

FWIW this is not sdm670 but sc7280/qcm6490 here :) But I didn't follow
the sdm670 thread so maybe you mean something there.

>
> That said last time I tested it, it worked and no changes have gone in,=
=20
> in the meantime.

I also had the test pattern working on a 6.8-based kernel on this device
with camss patches from Matti Lehtim=C3=A4ki.

Regards
Luca

>
> ---
> bod


