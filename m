Return-Path: <linux-media+bounces-13990-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1641913E92
	for <lists+linux-media@lfdr.de>; Sun, 23 Jun 2024 23:38:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F3D471C20CF8
	for <lists+linux-media@lfdr.de>; Sun, 23 Jun 2024 21:38:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5B991850A6;
	Sun, 23 Jun 2024 21:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fDYnSBYB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD874085D;
	Sun, 23 Jun 2024 21:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719178684; cv=none; b=WzlZHkdkaYL1t5U1ZCq+o4BgvADtOLfc/E+LK6R5br+/5R4JwxDx6Qae4yKUpCKy1QRRvzSHb4d2/+eiLwlH9zrtcbhGHWeZOZt6+HTD7pZ09QpuIRMDdpGcaeMOJ5y7r/XMriHJAFgnI5aze0cdYZ86M0bCXj/hN3g6SdzVwJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719178684; c=relaxed/simple;
	bh=gJMsc6X7zLAc7ha/CcJFJs3r3HuCaQJGt7Aun9swhxc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VIFzL4FelcB/27JTNmfqlGmDy0oSmj2msezslkSz7JF1skG9/KiLIRaRfW1Y6vJsYoHWIPGGAmPTE7nwq1ceh5mlYKIy4A19w/DFjGU2DEk3uxlsGyY9FrVduOvbuTAbssNwm5aCi7EMtZTHnZqduw2TiFL5dVyzBFANGDxEGV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fDYnSBYB; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ec50d4e46aso20875211fa.1;
        Sun, 23 Jun 2024 14:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719178680; x=1719783480; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oWiliFGkEiFIXmW6uAjOGvupLLp/3EOWvT3qpHd+/28=;
        b=fDYnSBYBSktZByA745jv0ZyB1a2nGk/fjxJazcFykBQrYjpL4v9z3z56U/4gvLtzn6
         +8HCf5tCO+OIHjFHZ3w9KbH41XCplSFnF+j0soH4ZQSCX1rvnfZB+P1hoQ0XY0Yg4shI
         QAh/J8igQ+PsQOiHDP9Lf/PC+vq1OjinmFJAP4rj9tPCIN1O7SqQcLisjlvd1+fLeebb
         kDNIjmnNKcsg77tk41RXMe2XyLj8wzGEiHb+pUOeyh7hqM7IiOYFzHUkGozGy1/23CIV
         e0+b40yD964rB4H6hhu1Zxg+thCAevCD2ueza+7a4FiIOx8UKMd+qrA1tCCPw/oQsr8l
         3x3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719178680; x=1719783480;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oWiliFGkEiFIXmW6uAjOGvupLLp/3EOWvT3qpHd+/28=;
        b=ucBVbmMzd3aVZsFmF0gD+jPUXEj9VGUjkZuKBLGLWFfB6dTVBYuSJyO9pZimI0Q0e6
         v8/AhLtYUHSoCk1X9/33Q81YFYL//AOYLEeY53b3CM00QfRW8SQVvPACinsMKMpg7bKO
         Joy1x8bX707o+92V1th1rLBK27cbinI03LsEzag2fCLW6+sz8mua9cbwXRFt/4e2dfMz
         5k81GVU+mjViuMq5+6KFGsNYcIwddlRfUOwbRFNrsFY+ZNCioQKeYFcY0BS4wVYir7Tb
         0VYHxDAZQt7W+cpAR+AqKsQ9iT8ADBnJn1BXcLibfMOazkOtKN/tHKjmtlMnjAKSsD7T
         gEaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWstqxedjImiVTUWrPfVBQezPowiZmvIX4GJ9lLHUrz5df15wkm1pKNzJXr3ZUpU6k4LjklElc7Yugd1sU6S7tumwtG1+6pYUFIe+/06nlMWdIZn31dJVOfxvm0gMACEoeKgLknHf/B6fYiOVKklf29xVwVw6iCmMNgzf/x9J4HEv2sg0xu30iX/cuuYocVsAmDkLeRBbPXey1T2KYz2u+y/ugcoA==
X-Gm-Message-State: AOJu0Yxo0f0wUFYh7AyGTdJAa25kA2IjRlgpdROqSx8+c1/dcZ2FbvoI
	SaTalfZ9xha/vnA7oHWW1LIfo9KTsD5EXLTb4iuGO+UDplxo+ojACZcjzmlbytKMPXjB54rVsXq
	EdiMb36JeHwl6Of77cHFOGSwXMwg=
X-Google-Smtp-Source: AGHT+IH6EbcdBDYXYU98T46lpGYd6sfYLZQKWXDwx5i5Qew8axHwbFI44pjFKkLbzi1Iwzp2SdrWGnU23bkbWDdQGmc=
X-Received: by 2002:a05:6512:2205:b0:52c:cd7d:4e7d with SMTP id
 2adb3069b0e04-52cdf7e6711mr3006975e87.5.1719178679913; Sun, 23 Jun 2024
 14:37:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240621-b4-sc7180-camss-v1-0-14937929f30e@gmail.com>
 <20240621-b4-sc7180-camss-v1-3-14937929f30e@gmail.com> <cd9b5612-1160-4284-be7f-4efbcbbbe346@linaro.org>
 <b9deca88-8e1a-4017-a0fc-6a77672d684d@linaro.org> <CADgMGSs7owyvvvRTr4YvCdmMiJV86CjD5YLsJiBZZONDhfFisQ@mail.gmail.com>
 <ef218f06-283a-4e7b-bafd-382c47248106@linaro.org>
In-Reply-To: <ef218f06-283a-4e7b-bafd-382c47248106@linaro.org>
From: george chan <gchan9527@gmail.com>
Date: Mon, 24 Jun 2024 05:37:48 +0800
Message-ID: <CADgMGSuaKKNgkVjcWA__fJkmeHYXgE47YfObHddp4e-gTH3NEw@mail.gmail.com>
Subject: Re: [PATCH 3/6] media: qcom: camss: csiphy-3ph: Add Gen2 v1.2.2
 two-phase MIPI CSI-2 DPHY init
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, Bjorn Andersson <andersson@kernel.org>, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 23, 2024 at 7:17=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 22/06/2024 14:43, george chan wrote:
> >     FWIW 1.2.2 seems to be the desired one: [1]
> >
> >     Konrad
> >
> >     [1]
> >     https://git.codelinaro.org/clo/la/kernel/msm-4.14/-/blob/UC.UM.1.0.=
r1-02500-sa8155.0/arch/arm64/boot/dts/qcom/atoll-camera.dtsi#L22 <https://g=
it.codelinaro.org/clo/la/kernel/msm-4.14/-/blob/UC.UM.1.0.r1-02500-sa8155.0=
/arch/arm64/boot/dts/qcom/atoll-camera.dtsi#L22>
> >
> >
> > Here is the log from sm7125 joyeuse phone, not sure if it helps or not.
> > [  204.034767] qcom-camss acb3000.camss: CSIPHY 3PH HW Version =3D 0x01=
000000
> >
> > I carefully looked into this csiphy_2ph_v1_2_2_reg of various trees, an=
d
> > concluded below version:
> > (1)atoll, sdm845[1]
> > (2)surya[2], sa8155, factory-trogdor-13443.B-chromeos-5.4[3]
> >
> > I was tempted to use (1)atoll one but it looked like (2) is newer. Is i=
t
> > worthy to create CAMSS_7125 specially for SM7125. Please give me some
> > advice about it.
>
> So, which have you tested with as verified and working ?
>

Tests show me, under my sm7125 test phone test case, no matter v1.2.1,
or atoll's v1.2.2 even surya and trogdor tree v1.2.2 are all
surprisingly works. Thanks for telling me or I won't be able to spot
this out. These results are quite funny :-)

> My assumption here is that this series has been tested and is proven to
> work.
>
> Version 1.2.1 and version 1.2.2 don't indicate different versions of the
> init sequence but different versions of the PHY.
>
> For example - the CSI decoder is "just" digital logic, the "source code"
> for the at logic can be "recompiled" for a different process node.
>
> But the PHYs translate analogue signals into the digital domain and
> therefore will vary with different process nodes - 3nm v 4nm v 28nm.
>
> So it is virtually impossible - or highly improbable that init sequence
> 1.2.1 and init sequence 1.2.2 will work on the same piece of hardware.
>

Yes, agreed. I also have the feeling of sc7180(10nm) vs sm7125(8nm) fab.

> So its not a question of choosing the newer version - only one version
> will work - the version that is specifically tuned to the PHY for the
> given process node and RTL version.
>
> Err, so TL;DR you _have_ tested this and gotten data delivered to you in
> user-space - right ?

User-space tool can't tell so I made some guesses.

A side note, atoll's reg sequence is a bit shorter and, unlike
trogdor, it does not write upto 0x9xx reg. That seemed to me, using
atoll's init sequence for sc7180 is nothing wrong initially. Later on
today, I am wondering if writing those extra regs(> 0x9xx) is to
stabilize the phy, so applying trogdor init sequence to atoll might be
more desirable.

As the trogdor tree with kernel 5.4 so this is a side proof that
trogdor init sequence is newer than atoll's. So I will use the
trodgor's init sequence for CAMSS_7180.

So here is the plan. Let's treat CAMSS_7180 to both sm7125 and sc7180
SOCs, and apply the idea to all others sharing v1.2.2 phy atm.

If somebody knowledgeable could confirm some real difference, then I
can prepare another CAMSS_7125 patch-set afterward.

>
> ---
> bod

