Return-Path: <linux-media+bounces-7735-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B2688A341
	for <lists+linux-media@lfdr.de>; Mon, 25 Mar 2024 14:55:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80D661F3D1ED
	for <lists+linux-media@lfdr.de>; Mon, 25 Mar 2024 13:55:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 188A8158872;
	Mon, 25 Mar 2024 10:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jtqSLe7T"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B482D145FE5
	for <linux-media@vger.kernel.org>; Mon, 25 Mar 2024 09:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711358770; cv=none; b=Q9NHMpsKWWyajK/t9jp9CT0O1n3Rsd3xm+NpTgn2x2ZWnkGPlHw6/LV/s1Z8tuZKilkLUE1qGxs4FLagNCiP8nth12urZEqHjtL9djxVeKalsEdRn33VXykjfUgcyNjtt02sJfaYQ7zXLYRolAp3UYBc8mW5LIzFEqGZNKkRHaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711358770; c=relaxed/simple;
	bh=+UtR0NT011zyBW6pNpHFzKilg63ytC5qO0zyrg10zGA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L/BgEIaS/0QTx+ZbHk2YztCvxhvBjNduPhFnd8n52fbPlYjQJJN84xUgWSOYSoKV4lg4I4tAtnDjR6mhhmMnAYrwrCd0Me61IlJvC+LAcvzrtwNtjjpieBD80xHZXpyxd1Yw9LFayqE2eMJjmC3YOsK9KRhzAdsNli6wyyLQgHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jtqSLe7T; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-43143f0ddbcso6922451cf.0
        for <linux-media@vger.kernel.org>; Mon, 25 Mar 2024 02:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711358767; x=1711963567; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+UtR0NT011zyBW6pNpHFzKilg63ytC5qO0zyrg10zGA=;
        b=jtqSLe7TaoJ/+V95xYpsB2A0CsojuHZsyifgC9A1KziLR5q8QBrJ1FVCnDwjC2nNkt
         R/tYmPSHVlKm9qfWolfVippLSDsEDgnynRbQiX7cQEwnlbawMOqKKzMYC0R/ubkNkZ1y
         PldBya+Wu/dXmMZOUMbrgzZSu0ePeU6j3y8i8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711358767; x=1711963567;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+UtR0NT011zyBW6pNpHFzKilg63ytC5qO0zyrg10zGA=;
        b=Sl3k9iRoGN0bB3taFeK5ozGCHz4o9s/NS5vJp6fImJVhvZE91B4JMSI2U/i5LjH6wm
         ZZ6cw84Cb7cO2JVM3RnNZRLD2Fr0425QSYGDLWYWyZ3I3BmfH/zu+4RUEuXDzrBTGmhf
         zN9PTPZAY9cc6hxTOzI8AEn8+rOI6L7+dU2D/7nXJKB/UHaA2fWsC2Hs/Flcjg58xd+D
         jBrQZNcDBTa1KGo0h5wv2TuslyAc+eiR/6Olv/Rmkg3/G6SP3JXTJwUZlWxq/uIm/KtW
         8bF3kWLXnqNLOw86/G84CZm1nZaVFAeMvoafw6ihXjqWb/sVXDKX29UyjIrRegVQFrEG
         rb1A==
X-Forwarded-Encrypted: i=1; AJvYcCVsBn2A9t2hffOaNiyR3RjXOp1mkxL/8u2Z1Lu7OFC30pJv53cHluh3lCJq7ZhLIKySMZJBYQhnIlBIqzFkElM3VwsX7UR0lF8DE3o=
X-Gm-Message-State: AOJu0YwXEvmgihhH8wJemvbhRiW1da7+sRAE39AlbjWtwaIeEAipLmnY
	ZpljWrYZHTbQomNf2rljB/C2SSGar1+oMz3w/Q/EG8PK8yBeHjhjCt92Mv+cuOb9DqYw+b0mcjg
	JLA==
X-Google-Smtp-Source: AGHT+IGk1CIEGDJQxEET8RrLbbbOGN3NpopRVoOmZ+59izxYfkgLKze8B9A+4vYdPaUaiLmcXJVyNQ==
X-Received: by 2002:a05:622a:1ba1:b0:431:14cf:d62a with SMTP id bp33-20020a05622a1ba100b0043114cfd62amr8315913qtb.19.1711358767103;
        Mon, 25 Mar 2024 02:26:07 -0700 (PDT)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com. [209.85.219.54])
        by smtp.gmail.com with ESMTPSA id x6-20020ac81206000000b00430afbb6b50sm2394170qti.51.2024.03.25.02.26.06
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 02:26:06 -0700 (PDT)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6963c0c507eso42429216d6.1
        for <linux-media@vger.kernel.org>; Mon, 25 Mar 2024 02:26:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXHmcSe3MydtURNtS+lBG+RZwGMrxFH0WSkX7ZO3TFCDjd97JeTKYByUhs+vkha0U5ZTue3UZfvIPJtOVXgNNhzVKEwKarDOui2PEs=
X-Received: by 2002:a05:6214:2465:b0:68f:f859:ee06 with SMTP id
 im5-20020a056214246500b0068ff859ee06mr11514858qvb.12.1711358765850; Mon, 25
 Mar 2024 02:26:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240323-resend-hwtimestamp-v10-0-b08e590d97c7@chromium.org>
 <2722561.mvXUDI8C0e@natalenko.name> <CANiDSCsnOdTaW0Eg68+-niPXwPhYc3Br6cWoGiHytZrFOGmcZA@mail.gmail.com>
 <12403186.O9o76ZdvQC@natalenko.name>
In-Reply-To: <12403186.O9o76ZdvQC@natalenko.name>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 25 Mar 2024 10:25:51 +0100
X-Gmail-Original-Message-ID: <CANiDSCuma7aGxq7T2uYMgn_JEW223LdR4as83UT2Aj3QmVu4ig@mail.gmail.com>
Message-ID: <CANiDSCuma7aGxq7T2uYMgn_JEW223LdR4as83UT2Aj3QmVu4ig@mail.gmail.com>
Subject: Re: [PATCH v10 3/6] media: uvcvideo: Quirk for invalid dev_sof in
 Logitech C922
To: Oleksandr Natalenko <oleksandr@natalenko.name>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, "hn.chen" <hn.chen@sunplusit.com>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Sergey Senozhatsky <senozhatsky@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Oleksandr

On Mon, 25 Mar 2024 at 10:23, Oleksandr Natalenko
<oleksandr@natalenko.name> wrote:
>
> Hello.
>
> On pond=C4=9Bl=C3=AD 25. b=C5=99ezna 2024 8:52:57, CET Ricardo Ribalda wr=
ote:
> > Hi Oleksandr
> >
> > On Sat, 23 Mar 2024 at 13:16, Oleksandr Natalenko
> > <oleksandr@natalenko.name> wrote:
> >
> > >
> > > How do I check whether C920 (046d:082d) is affected too? I have got o=
ne, I can run tests on it as long as those will not blow the webcam up.
> > >
> > > Thanks.
> > >
> >
> > First of all you need to enable the hwtimestamps in the driver. You
> > could do that with
> >
> > ```
> > rmmod uvcvideo; modprobe uvcvideo hwtimestamps=3D1
> > ```
>
> ```
> $ cat /sys/module/uvcvideo/parameters/hwtimestamps
> 1
> ```
>
> > Then capture some frames with yavta
> > ```
> > yavta -c /dev/video0
> > ```
> >
> > After around 5 seconds all the frames should have a stable fps, the
> > fps is not stable then your camera is affected with this bug.
>
> ```
> $ ./yavta -c /dev/video1
> Device /dev/video1 opened.
> Device `HD Pro Webcam C920' on `usb-0000:0f:00.3-3.4' (driver 'uvcvideo')=
 supports video, capture, without mplanes.
> Video format: MJPEG (47504a4d) 1920x1080 (stride 0) field none buffer siz=
e 4147200
> =E2=80=A6
> 100 (4) [-] none 100 200717 B 212.919114 213.079004 33.727 fps ts mono/So=
E
> 101 (5) [-] none 101 200889 B 213.003703 213.114996 11.822 fps ts mono/So=
E
> 102 (6) [-] none 102 200926 B 213.035571 213.146999 31.379 fps ts mono/So=
E
> 103 (7) [-] none 103 200839 B 213.067424 213.179003 31.394 fps ts mono/So=
E
> 104 (0) [-] none 104 200692 B 213.293180 213.214991 4.430 fps ts mono/SoE
> 105 (1) [-] none 105 200937 B 213.322374 213.247001 34.254 fps ts mono/So=
E
> 106 (2) [-] none 106 201013 B 213.352228 213.279005 33.496 fps ts mono/So=
E
> =E2=80=A6
> 168 (0) [-] none 168 200914 B 215.183707 215.347066 33.676 fps ts mono/So=
E
> 169 (1) [-] none 169 201141 B 215.271693 215.379066 11.365 fps ts mono/So=
E
> 170 (2) [-] none 170 201005 B 215.303449 215.415057 31.490 fps ts mono/So=
E
> 171 (3) [-] none 171 201195 B 215.335295 215.447062 31.401 fps ts mono/So=
E
> 172 (4) [-] none 172 200933 B 215.557731 215.479072 4.496 fps ts mono/SoE
> 173 (5) [-] none 173 200973 B 215.587033 215.515063 34.127 fps ts mono/So=
E
> 174 (6) [-] none 174 200698 B 215.616811 215.547063 33.582 fps ts mono/So=
E
> 175 (7) [-] none 175 201290 B 215.646196 215.579075 34.031 fps ts mono/So=
E
> 176 (0) [-] none 176 200807 B 215.675857 215.615073 33.714 fps ts mono/So=
E
> =E2=80=A6
> ```
>
> Does the above mean the webcam is affected?

Looks like it.... could you try applying this patch and run with

rmmod uvcvideo; modprobe uvcvideo hwtimestamps=3D1 quirks=3D0x4000

to see if that fixes it for you?

Thanks!

>
> Thank you.
>
> >
> >
> > Thanks!
> >
>
>
> --
> Oleksandr Natalenko (post-factum)



--=20
Ricardo Ribalda

