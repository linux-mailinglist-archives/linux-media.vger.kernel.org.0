Return-Path: <linux-media+bounces-47259-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B707C68A1F
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 10:47:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 42BBF4F1510
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 09:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A6E531280D;
	Tue, 18 Nov 2025 09:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="AOzjmjLE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDB026A1B9
	for <linux-media@vger.kernel.org>; Tue, 18 Nov 2025 09:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763459024; cv=none; b=mBamdWUjDKPr3cifHvprh9QjCBcveMDGQpC7LqQ54cgRWG+CROXokFL/9gIja4+7Unt9u2spJVVqQ7VNlGzsyh+rCKqOiL8H+6hCDhGlfzzxqeR5xXGlgR/y5zE5eYHhku/vCplry06+M7C69zVkNCR4ZuRUXQvxOaaM0X08u1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763459024; c=relaxed/simple;
	bh=QkORPaFPwCkJw2PTlt9CLHW3UfkaqxDK0oZQhFUaUUI=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=B1LRl2vgG0rwd7Gb3WJ0isKxEKyyv99o9C31zrjXxvqzycu/L3UjVNw/I0ms4Ig9fr70zO+nMKs7geKls+QHv8uOHHZaM/MgtiFe0RI9+JulKL54kGosagipA3o5szM7qtv7/41Ml1m/WHbfv5ICzBwkGhgnXmQCx5sFySBtN8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=AOzjmjLE; arc=none smtp.client-ip=209.85.208.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f67.google.com with SMTP id 4fb4d7f45d1cf-64080ccf749so7274589a12.2
        for <linux-media@vger.kernel.org>; Tue, 18 Nov 2025 01:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1763459020; x=1764063820; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9kFq44+Lpbf++jR+7pJqPo09W9HDnlu7As7z112j1Xg=;
        b=AOzjmjLE/CJZy+/mVVpthXaASJkUl8AIoRNSCvvidpQz09g3eTb9MpuZkkHAT9f5WS
         6UUFUBUX1yW9hmLR0hpbiuhpdHxJBMG2Ae/TfjrBaEqkYyBX9n8+uaqelz2GxZjX2psM
         NJ7BO+7/QVd0p99IzPGnR5us/z5iRq3vJIY7Ru7NBi3ID3QpVlkDx5IemLwfB4iEKImM
         8Mif0HKTwxTlpSVSLDxx0YH545DYbhMYb+JBWimQeKMjRM499RnMXNnxxmuMNw7Tq9tS
         PhflSn4lVIDxORys5YTQS6LMpllUf2hIV9PA6cPZs0UGuYjSlTNTaxWEW0NbzzRZ77H8
         FDSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763459020; x=1764063820;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9kFq44+Lpbf++jR+7pJqPo09W9HDnlu7As7z112j1Xg=;
        b=exODrB5hoq/0GfdLAjdtpZxt1OV3ic43LY5/fQKdKQwe2VX2M8zZ3OCBYNfnxn8qLR
         eTIQArnmX7FMbnSR6riy9WPVs2K8yH2EVr7XaVTd83oMvHs4hB6DwAdmidj8BdwsHnBY
         GhFn5om6nTL54CCt/GLcWRMA2BX0MBtT9eMVRIlsbBaSpUwWRQnMREZa+Ux9+L2/QWZs
         HwomlkKprXabJLzo/xaDuu9TmvqdwkGBL0LgLrwjnSzie9fYP9XLnVLDjrrkmgJzgwIR
         PdtfHF/Sz0y5VEsQM3SQOi2k3UM9gqfXFtcwL/wWTV/+9dAa89yoKWpdC/y0X1a1KxtX
         vXVg==
X-Forwarded-Encrypted: i=1; AJvYcCU98Nd2xZI0wBmZ3z552oxWMT+bkRwWBBT39QXUk9kP0uE9jWf62HwocNjGQb69qmVOPYCy8zN7EJIusg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5V7kB18XcxOLdCKwFL2tu7uN7RFGcqFAWcwRyjmCuFqmyNKHn
	/mfVnSmTX5kZJPoMv+XI098FFwck9su8BQxXCQhI+WPn3TQPPzhO8D1uhy4MNjJGWZ0=
X-Gm-Gg: ASbGncvzHFjtBWCo+hNZmzaMfYfI2eyprmNrKPvXmajfnQSYfzroQ5mBLr0ba6Fsm/R
	kqQnq6d9mvK8fmYqwwn0U+zJBJnxy3U5gWQPn12EnuKYq52jN608EPJs6/1yD/1OeEP1gBvTKzW
	vcdwAPFgQoOGusX1UwUJH/fhNZy3Tg1zZVc1+anmUgx47xy7JXmfWuHI++CTEW3HMVSUKNzkllK
	Zsr0PW2YiuDCsPfbmD8Ej7UgnE7AToa+NMwz0U55cehii0Jlp2+XQ+xViI6zWuFDk4QSanR0X9H
	3a0qA7W5zmEU7ImcqGvVkCukCqOO6/su4pNv4MFlg1isUJ+2fdMAmkKarnBDQzT9g7auAJgAG9o
	2ix8IRmRPskdwUVu+7u94WQdpoDZeN4xmn2EE1yQhLSYqTpvw6hAxUB4DsoeU22sK1MpKDnMrlx
	cRl72NSgoPDv9BONOy6qP5uaZgrC7uYVVwE8+9wFnjktmlrg==
X-Google-Smtp-Source: AGHT+IHAjAvIoHxilsvGJvQimz2d0nFw/5Rl8TnnwT5flUI3SNpQzBhZbA9wUwqDHELdp5l6m/XSsw==
X-Received: by 2002:a05:6402:1ed6:b0:640:7402:4782 with SMTP id 4fb4d7f45d1cf-64350d328c8mr13403646a12.0.1763459020364;
        Tue, 18 Nov 2025 01:43:40 -0800 (PST)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a3f96e2sm12254612a12.16.2025.11.18.01.43.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 01:43:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 18 Nov 2025 10:43:39 +0100
Message-Id: <DEBQ1TNRYEK9.3VIMEEAM7M5WF@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, "Konrad Dybcio"
 <konrad.dybcio@oss.qualcomm.com>, "Luca Weiss" <luca.weiss@fairphone.com>,
 "Bryan O'Donoghue" <bod@kernel.org>, "Robert Foss" <rfoss@kernel.org>,
 "Todor Tomov" <todor.too@gmail.com>, "Vladimir Zapolskiy"
 <vladimir.zapolskiy@linaro.org>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/3] Add CAMSS support for SM6350
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <3ph8XeidoxkUIsK7qiOH29pde94sdwa3ReWKVVrPabgS5enIAmwVAC5plyFnBMJGKQBnxFB6df6j69OMFIeavw==@protonmail.internalid> <20251114-sm6350-camss-v2-0-d1ff67da33b6@fairphone.com> <df4a6a77-9004-4dbe-9b11-7af2bea7e068@kernel.org> <DE8JJCQA0C4Q.35NEED7XG0K0V@fairphone.com> <17e7ebc9-3b88-4334-b87d-1bce6d5bb120@linaro.org> <893b97ad-7d2b-4408-bab5-2cd63fdaa33b@oss.qualcomm.com> <28f33d3a-6866-4bdb-a1e5-d193dcb7d4d1@linaro.org>
In-Reply-To: <28f33d3a-6866-4bdb-a1e5-d193dcb7d4d1@linaro.org>

Hi Bryan,

On Tue Nov 18, 2025 at 10:33 AM CET, Bryan O'Donoghue wrote:
> On 17/11/2025 12:53, Konrad Dybcio wrote:
>> On 11/16/25 3:30 PM, Bryan O'Donoghue wrote:
>>> On 14/11/2025 15:59, Luca Weiss wrote:
>>>> On Fri Nov 14, 2025 at 4:51 PM CET, Bryan O'Donoghue wrote:
>>>>> On 14/11/2025 11:15, Luca Weiss wrote:
>>>>>> Add bindings, driver and dts to support the Camera Subsystem on the
>>>>>> SM6350 SoC.
>>>>>>
>>>>>> These patches were tested on a Fairphone 4 smartphone with WIP senso=
r
>>>>>> drivers (Sony IMX576 and IMX582), the camera pipeline works properly=
 as
>>>>>> far as I can tell.
>>>>>>
>>>>>> Though when stopping the camera stream, the following clock warning
>>>>>> appears in dmesg. But it does not interfere with any functionality,
>>>>>> starting and stopping the stream works and debugcc is showing 426.4 =
MHz
>>>>>> while the clock is on, and 'off' while it's off.
>>>>>>
>>>>>> Any suggestion how to fix this, is appreciated.
>>>>>>
>>>>>> [ 5738.590980] ------------[ cut here ]------------
>>>>>> [ 5738.591009] gcc_camera_axi_clk status stuck at 'on'
>>>>>> [ 5738.591049] WARNING: CPU: 0 PID: 6918 at drivers/clk/qcom/clk-bra=
nch.c:87 clk_branch_toggle+0x170/0x190
>>>>>
>>>>> Do you have a full and complete kernel tree we could look at here ?
>>>>
>>>> Sure, this branch has everything in:
>>>>
>>>> https://github.com/sm6350-mainline/linux/tree/sm6350-6.17.y/
>>>>
>>>> For further refence, at least two other people have tested this branch
>>>> in postmarketOS, nothing particularly exciting to report from there,
>>>> apart from that the sdm-skin-thermal thermal zone (thermistor right ne=
xt
>>>> to SoC) is currently configured with 55 degC as critical trip, which i=
s
>>>> quickly achieved when starting a video recording, but that's not reall=
y
>>>> an issue with camss, but will need some tweaking regardless.
>>>>
>>>> https://gitlab.postmarketos.org/postmarketOS/pmaports/-/merge_requests=
/7281
>>>
>>> diff --git a/drivers/clk/qcom/gcc-sm6350.c b/drivers/clk/qcom/gcc-sm635=
0.c
>>> index a4d6dff9d0f7f..229629ef82809 100644
>>> --- a/drivers/clk/qcom/gcc-sm6350.c
>>> +++ b/drivers/clk/qcom/gcc-sm6350.c
>>> @@ -908,9 +908,7 @@ static struct clk_branch gcc_camera_ahb_clk =3D {
>>>
>>>  =C2=A0static struct clk_branch gcc_camera_axi_clk =3D {
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .halt_reg =3D 0x17018,
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .halt_check =3D BRANCH_HALT,
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .hwcg_reg =3D 0x17018,
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .hwcg_bit =3D 1,
>>=20
>> No reason to drop the hwcg description
>>=20
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .halt_check =3D BRANCH_VOTED,
>>=20
>> It'd be useful to explain why we should ignore the hw feedback in this c=
ase
>>=20
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .clkr =3D {
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 .enable_reg =3D 0x17018,
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 .enable_mask =3D BIT(0),
>>=20
>> Konrad
>
> vfe170 is what we have on sdm845
>
> So I'm just asking Luca to try the sdm845 method of waggling this clock=
=20
> since what we have doesn't work.

Yes, your change to gcc-sm6350.c does remove the warning and everything
seems to work as expected. Opening and closing the plasma-camera
application, switching between cameras works without any visible issues.

Regards
Luca

>
> ---
> bod


