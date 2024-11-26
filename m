Return-Path: <linux-media+bounces-22062-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 543819D9291
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 08:37:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E1866164CF3
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 07:37:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CADC1940B0;
	Tue, 26 Nov 2024 07:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D1mcp90A"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011FE1940B1
	for <linux-media@vger.kernel.org>; Tue, 26 Nov 2024 07:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732606634; cv=none; b=ZcfnsL5c7Iy3vAOh7UQkGCQ13GJoKVI3TtpUrj+5X7pEf5ziJ35keWcB93jGzOVKfr+b2hxhZKtybGUS70MMD3LO95EEGqBCr2ZWrC6Ke6/N1eSRYIj7elYVobFr2R4C7jm6o86cy1n8fK4XMRMZxDbXNoQsyVkamMHZ2DmucJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732606634; c=relaxed/simple;
	bh=HPkAK3QEMU6lCsGXsxTqREhr6LO7OphIHM/w0+Xd9CA=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=khAOM+c76x+YPWB7SPlSwIk0LPIRHFfaAD/9frdmpxCTEIjKx/qa4DrWKtyexKBhMP2OuR53YihAkw6NvucWWoquG7TNUqcGYIwhUUriL9vE1tUdCcalmEzC/98+44+2D+pBf+eZ9aMFGAKiAgrkwYwrMqWymWSaq3CHKSj8uPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D1mcp90A; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53dede30436so29894e87.2
        for <linux-media@vger.kernel.org>; Mon, 25 Nov 2024 23:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732606629; x=1733211429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GsR2P0A0wrOmr1JPLEVXtmhySrfq3zBbwdUpNA8MBR4=;
        b=D1mcp90AJRLLKMIJbmWYr5EbFyjGSLVRi3WL6ZYY4+//Ao2qnPQhYRzbuiUcsW5m1v
         jFEK8n8wQdX8g5l/esgJPu2tdv2zvmq1qdRSDJgsZ3/ku76JmbbI75kVu6GIS6XeZSoF
         8/noCdBj/i1hVSIM32n7BpbaQOVcV1XPnUtDY5K5dl383AQHmJbLwgjJiHRHzUTkZE+T
         cBxiDQ5TVRpY5AYapaQjz6l14zlO4Wq+OorCTx1kPWT7714hgc6L0ZO6nfGGOPHKx35i
         z3i7nDDAjNOhQtLUEkjyETFgvKAQhTCYPi1xhMozxvythHyoTENmx6y4d4ym4yD0dCEo
         HlKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732606629; x=1733211429;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GsR2P0A0wrOmr1JPLEVXtmhySrfq3zBbwdUpNA8MBR4=;
        b=UFIFZFGm4cIQ/As2L4L8zLCXB7JRHnO/p2MXnd37d1l/G/kGCHu7dXa4nE/tVZLY/6
         ywKwvASpN8zkyswzOsloWfEMlJEHHf+H6Yl4D46jM0YyfVqAv45qv8b/bMdtSkVAGgW5
         W9qhHuJh3V0adRknk1HAWihjCRqVJCqdKJ6lfq9yS6uuKvCTu98zFrxr4Wl0Op1arooa
         QFrhkEpKop/0zmePdeLhTVIPbmpuNjehWJFglmi/zI30OhHW9oBjqrUmW3a9mIbC1719
         v3llq32BxhluWW510iY5HeAzACkWRVBgungoxtgS4i2iWAI60WKEuylwWgnyOdzTgULU
         GVbw==
X-Forwarded-Encrypted: i=1; AJvYcCUTFe15WbdJdKtnP9w/phKO9Z9QZQuH+2yP7ClaCZYVEkxJdlHRSdzUHWFBhZPzYu/ZWqCF++2uauEPfA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzcTzrMri8h/Y5H6AuyjRcq8Rg2q5+D5YU/feQjPbTokBVtIq9G
	O8Damgayv221k01gW4IrU2bAGYANJ1jXw1UQgF0nqO4A1KJYrDhAIk549IYmdqo=
X-Gm-Gg: ASbGncuuyF2ogWcVIniqnRIqeHO9obnmw02QYGMzTVT0HdhIkCt/zgfhf24mti6Vutx
	fKMCAP2vfULmKEDQaIVabk39eHlIwl5y50Vt/boe9w35yejhreO5fzDJOgZARCj+MoAG7Zwf8lh
	umghK0ZOw/CRbiZfwSABwYQSs63iWsHmlA8GhbFocuw8pyQHu5Eibjp3B+I+NIQHhl3FdMuBWKh
	hnsSQr6/G5G0dkrwRFUYjmnEMiGgzdqW0sg2opmIh0JSY/07FbtprPxkoisqodJ2y1fh6ZNYvJH
	QuNyA9FnS+/Wzw4=
X-Google-Smtp-Source: AGHT+IE1mO2+CX9wL+NojM5BPJsyPS/lvw8H6+0UnsGMmqXi+RdZzBKUihgzoN7JyuYxuCHKW8Qr2A==
X-Received: by 2002:a05:6512:1092:b0:53d:e70d:f3cf with SMTP id 2adb3069b0e04-53de70df552mr2268057e87.24.1732606628484;
        Mon, 25 Nov 2024 23:37:08 -0800 (PST)
Received: from [127.0.0.1] (85-76-116-93-nat.elisa-mobile.fi. [85.76.116.93])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53de4cba7b9sm603704e87.111.2024.11.25.23.37.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 23:37:07 -0800 (PST)
Date: Tue, 26 Nov 2024 09:37:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Taniya Das <quic_tdas@quicinc.com>
CC: Renjiang Han <quic_renjiang@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_1/2=5D_clk=3A_qcom=3A_videocc=3A_Us?=
 =?US-ASCII?Q?e_HW=5FCTRL=5FTRIGGER_flag_for_video_GDSC=27s?=
User-Agent: Thunderbird for Android
In-Reply-To: <5be1ca54-6a9c-46da-81cc-882ae1596cae@quicinc.com>
References: <20241122-switch_gdsc_mode-v1-0-365f097ecbb0@quicinc.com> <20241122-switch_gdsc_mode-v1-1-365f097ecbb0@quicinc.com> <zhco37pigrp4fh5alqx4xfxx3xhjitqlgw552vwiijka22bt4u@sl4ngzypwh4x> <1d9aa2e7-d402-42dc-baa6-155f01b132ca@quicinc.com> <23ho25gl3iwyi2jspb6a2x5bv76fco5pkg2x5ct4gu3c44dbiq@yec6evx5sihm> <5be1ca54-6a9c-46da-81cc-882ae1596cae@quicinc.com>
Message-ID: <EE235E3C-D327-4483-9C44-DBB72B0DDEA0@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 26 November 2024 06:04:12 EET, Taniya Das <quic_tdas@quicinc=2Ecom> wrot=
e:
>
>
>On 11/23/2024 5:35 AM, Dmitry Baryshkov wrote:
>> On Fri, Nov 22, 2024 at 10:25:44PM +0530, Taniya Das wrote:
>>>=20
>>>=20
>>> On 11/22/2024 4:29 PM, Dmitry Baryshkov wrote:
>>>> On Fri, Nov 22, 2024 at 04:01:45PM +0530, Renjiang Han wrote:
>>>>> From: Taniya Das <quic_tdas@quicinc=2Ecom>
>>>>>=20
>>>>> The video driver will be using the newly introduced
>>>>=20
>>>> 'will be' or 'is using'? Or will be using it for these platforms? Is
>>>> there any kind of dependency between two patches in the series?
>>>>=20
>>> The video driver will not be able to work without the clock side chang=
es=2E
>>=20
>> Will enabling this flag break the video driver until it is updated?
>>=20
>
>Yes, my understanding is yes it will break=2E When we first introduced th=
e flag we had got the driver and the clock changes together=2E

Please clearly document this in the cover letter=2E Can venus changes go i=
n first? Or they will also break without the flag? The kernel should not br=
eak between commits=2E

>
>>>=20
>>>>> dev_pm_genpd_set_hwmode() API to switch the video GDSC to HW and SW
>>>>> control modes at runtime=2E
>>>>> Hence use HW_CTRL_TRIGGER flag instead of HW_CTRL for video GDSC's f=
or
>>>>> Qualcomm SoC SC7180 and SDM845=2E
>>>>=20
>>>> Is it applicable to any other platforms? Why did you select just thes=
e
>>>> two?
>>>>=20
>>>=20
>>> The V6 version of Video driver is already using them, now the video dr=
iver
>>> wants to migrate to v4 version of the HW to use the new flag=2E
>>=20
>> I mean slightly different issue=2E We have following drivers:
>>=20
>> videocc-sa8775p=2Ec - already uses HW_CTRL_TRIGGER
>> videocc-sc7180=2Ec - being converted now
>> videocc-sc7280=2Ec - already uses HW_CTRL_TRIGGER
>> videocc-sdm845=2Ec - being converted now
>> videocc-sm7150=2Ec
>> videocc-sm8150=2Ec
>> videocc-sm8250=2Ec - already uses HW_CTRL_TRIGGER
>> videocc-sm8350=2Ec - already uses HW_CTRL_TRIGGER
>> videocc-sm8450=2Ec
>> videocc-sm8550=2Ec - already uses HW_CTRL_TRIGGER
>>=20
>> This leaves sm7150, sm8150 and sm8450 untouched=2E Don't they also need=
 to
>> use HW_CTRL_TRIGGER?
>>=20
>
>Yes, I am okay to add the flag, but looking for the Video SW team to conf=
irm they are well tested on the rest of the platforms=2E

Thank you! Let's get confirmation from Vikash or Dikshita=2E

>
>>>=20
>>>>>=20
>>>>> Signed-off-by: Taniya Das <quic_tdas@quicinc=2Ecom>
>>>>> Signed-off-by: Renjiang Han <quic_renjiang@quicinc=2Ecom>
>>>>> ---
>>>>>    drivers/clk/qcom/videocc-sc7180=2Ec | 2 +-
>>>>>    drivers/clk/qcom/videocc-sdm845=2Ec | 4 ++--
>>>>>    2 files changed, 3 insertions(+), 3 deletions(-)
>>>>>=20
>>>>> diff --git a/drivers/clk/qcom/videocc-sc7180=2Ec b/drivers/clk/qcom/=
videocc-sc7180=2Ec
>>>>> index d7f84548039699ce6fdd7c0f6675c168d5eaf4c1=2E=2Edd2441d6aa83bd7c=
ff17deeb42f5d011c1e9b134 100644
>>>>> --- a/drivers/clk/qcom/videocc-sc7180=2Ec
>>>>> +++ b/drivers/clk/qcom/videocc-sc7180=2Ec
>>>>> @@ -166,7 +166,7 @@ static struct gdsc vcodec0_gdsc =3D {
>>>>>    	=2Epd =3D {
>>>>>    		=2Ename =3D "vcodec0_gdsc",
>>>>>    	},
>>>>> -	=2Eflags =3D HW_CTRL,
>>>>> +	=2Eflags =3D HW_CTRL_TRIGGER,
>>>>>    	=2Epwrsts =3D PWRSTS_OFF_ON,
>>>>>    };
>>>>> diff --git a/drivers/clk/qcom/videocc-sdm845=2Ec b/drivers/clk/qcom/=
videocc-sdm845=2Ec
>>>>> index f77a0777947773dc8902c92098acff71b9b8f10f=2E=2E6dedc80a8b3e18ec=
a82c08a5bcd7e1fdc374d4b5 100644
>>>>> --- a/drivers/clk/qcom/videocc-sdm845=2Ec
>>>>> +++ b/drivers/clk/qcom/videocc-sdm845=2Ec
>>>>> @@ -260,7 +260,7 @@ static struct gdsc vcodec0_gdsc =3D {
>>>>>    	},
>>>>>    	=2Ecxcs =3D (unsigned int []){ 0x890, 0x930 },
>>>>>    	=2Ecxc_count =3D 2,
>>>>> -	=2Eflags =3D HW_CTRL | POLL_CFG_GDSCR,
>>>>> +	=2Eflags =3D HW_CTRL_TRIGGER | POLL_CFG_GDSCR,
>>>>>    	=2Epwrsts =3D PWRSTS_OFF_ON,
>>>>>    };
>>>>> @@ -271,7 +271,7 @@ static struct gdsc vcodec1_gdsc =3D {
>>>>>    	},
>>>>>    	=2Ecxcs =3D (unsigned int []){ 0x8d0, 0x950 },
>>>>>    	=2Ecxc_count =3D 2,
>>>>> -	=2Eflags =3D HW_CTRL | POLL_CFG_GDSCR,
>>>>> +	=2Eflags =3D HW_CTRL_TRIGGER | POLL_CFG_GDSCR,
>>>>>    	=2Epwrsts =3D PWRSTS_OFF_ON,
>>>>>    };
>>>>>=20
>>>>> --=20
>>>>> 2=2E34=2E1
>>>>>=20
>>>>=20
>>>=20
>>> --=20
>>> Thanks & Regards,
>>> Taniya Das=2E
>>=20
>


