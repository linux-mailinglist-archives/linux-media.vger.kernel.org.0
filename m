Return-Path: <linux-media+bounces-28132-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACF2A5F0E6
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 11:30:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DAD23BE462
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 10:29:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29FD4265CD5;
	Thu, 13 Mar 2025 10:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VME+fC5m"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BBB5265CA5
	for <linux-media@vger.kernel.org>; Thu, 13 Mar 2025 10:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741861800; cv=none; b=X9x7emnY+buJwGTWkcAXJj+Ab28WjQitwwxqqyavIV3sms35ZwU123YjQv6jgWMfXeCC9t/WYidLPAoMGwxhcCZY1al6cmzU0KZDbEO0U/Zau+ItJzYFZr4RvjnKCfCmuDcaYVlVlYWt91CvGZU5noAveQ9QzWPsoPAgKvfUwTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741861800; c=relaxed/simple;
	bh=NEmSl0VCjKfvL7t65VUB5MzMa9tpwGW3y/LTbdNnZVY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=axJlvYXLMFIBHDwzcBvThUPPBrYdkBkKXp5kJicqLGROtcLRmpbJBvOaie/THrBrwyoqOPpmc0RWE6ESnH05wiT8+ZLvMgYvlz2b9czJXg3W+8tuJ8AFSQpEdb2px84pexGBtjoaQJsMBtEacA2FITNvEPxVcWinRYtve26Ijgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VME+fC5m; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5499da759e8so2096059e87.0
        for <linux-media@vger.kernel.org>; Thu, 13 Mar 2025 03:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741861796; x=1742466596; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pviuwRFdfnui+N+RMClLZiL5AkwReTbr0Jey2Ox0RLI=;
        b=VME+fC5mC0W/AyrSaiA6j+OcR/T8tbx7vplq0U14zwgF46NxayQnajSKdJEB7Rdg8N
         qn50O5s3wOsLXICa6eo5u4mx3imhWJUPRTNK44qQi0oY33dq8cnFaFRNGoMY9/WvPHwK
         qmaToebcslN/dwxlOLakZGiKQ/FD6Mm9jXHD4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741861796; x=1742466596;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pviuwRFdfnui+N+RMClLZiL5AkwReTbr0Jey2Ox0RLI=;
        b=svvCU4VSIUEjvk4LMfKi8+zcC5Vi6wm9oTdvqmVbaQQW+iigpDKd/uzlCEY464eKys
         8AKoEhSnSWGveaDQ2oATcyWtBaffH9nYQ2YkUc5sdoVxNLXDeHnCFpRiM8ONdQr/L3W2
         OBjRZlsakxsRR/GAm0RWx+6wPtlFyAqv0QOZzWSez/XXCl/EtN6HblIT/D2Rg5E66npa
         QoXnchilsgDwGAiYYBLNrHt7itheNiu/x7PblFM2pcySpgrZKxg1fre7a3joBLFxtoBV
         ySKVCo4NK8DznU4h4AZiBhn9oAYzw46llMdkJlptBzCdGHckiRMxCWB5l/KgJlOpQukF
         2xUA==
X-Forwarded-Encrypted: i=1; AJvYcCWnD8HK8M0Arh0jvj/UrTCo5XQ0ZvfPcMI9fDpjlkPrmi1hHwDo4RJUA8p6WOMZjw7rI5IYRLmDAQLJDg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz7aryJG1FjK4Ok2HB0PJ+DEy41Gle3giWI3pmOO+Wu/rhHuoO
	K+gi+rcpLW2aGKCeEz5glj7DMu8IVan/ZGwQWeIWy2Y4lNqDY4Nw46APvKPzOJ5pPmHAQWCa7U8
	=
X-Gm-Gg: ASbGncvlisKQMApwaHQLv1hKx7FrDPvcFtDVZ4LgB+SO6x7IKbW83qaY/8AVjtXP/XU
	IPcePmVKadz9lPLz+a1XnF4JnEsQG9rQjyWB3ShAN5MQNGLTMI8TRzeySHQXXIzk4Me35PZN11b
	HJ9opzF3zHH+QlNHctO82bkDrDM1cjJTb+zxLbKeUbRTLo5RI8XSsiO1oLco7DVRzYe00XwxgHo
	90YLxoWHSQ9SrbqTekBGUU5iDmb/AEslhEy+srBgRbtfXnphWpjyfyWrxEaoYLkVolK3ZLZ09hu
	ss7WJ08SGjH0aaDcyZAieEEBEFEXLIOombrZM4E2/pUuhJ1o/8fGJg2br8pAa7wuZZAIMdhihkP
	c9GkUn+A=
X-Google-Smtp-Source: AGHT+IFX9GZ/3hXhiM4yK3o4Cl1NrY4p/T2QVap6Dkkdm19W5uPo+XkTVrJDgieIWOnOlYcePE9jMg==
X-Received: by 2002:a05:6512:31cc:b0:549:981a:1eeb with SMTP id 2adb3069b0e04-549ba3b4103mr740854e87.5.1741861796096;
        Thu, 13 Mar 2025 03:29:56 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba8a79a9sm167711e87.221.2025.03.13.03.29.55
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Mar 2025 03:29:55 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54991d85f99so1957425e87.1
        for <linux-media@vger.kernel.org>; Thu, 13 Mar 2025 03:29:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWScTHwZ4Cs2qVyEXItirw7snYWkxqpnV38lEzrDop+TLKh8qu9ZKf3rbFgn1uvLqGVIp+AFyqpc8s5rw==@vger.kernel.org
X-Received: by 2002:a05:6512:39c8:b0:548:878b:ccb3 with SMTP id
 2adb3069b0e04-549ba429dcemr762107e87.25.1741861794589; Thu, 13 Mar 2025
 03:29:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250312192528.95838-1-andriy.shevchenko@linux.intel.com>
 <67d1f748.050a0220.353790.339b@mx.google.com> <Z9Kf06nLg86jmcqI@smile.fi.intel.com>
 <4633173e-111a-4659-945d-149e3857896c@xs4all.nl>
In-Reply-To: <4633173e-111a-4659-945d-149e3857896c@xs4all.nl>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 13 Mar 2025 11:29:41 +0100
X-Gmail-Original-Message-ID: <CANiDSCs5QsyTxYj4DnsYD=18RXGBXGVQ=r_XxY6C011JTmh+LQ@mail.gmail.com>
X-Gm-Features: AQ5f1JqH81eCmniQ-A65SsDIPlCKmBwLLnS5WW7jzue24hdFz1RihLXZRmsS1gk
Message-ID: <CANiDSCs5QsyTxYj4DnsYD=18RXGBXGVQ=r_XxY6C011JTmh+LQ@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=5Bv2=2C1=2F1=5D_media=3A_v4l2=2Dcore=3A_Replace_the_check_for?=
	=?UTF-8?Q?_firmware_registered_I=C2=B2C_devices?=
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-kernel@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 13 Mar 2025 at 10:52, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 13/03/2025 10:05, Andy Shevchenko wrote:
> > On Wed, Mar 12, 2025 at 02:06:16PM -0700, Patchwork Integration wrote:
> >> Dear Andy Shevchenko:
> >>
> >> Thanks for your patches! Unfortunately the Media CI robot detected som=
e
> >> issues:
> >>
> >> # Test media-patchstyle:./0001-media-v4l2-core-Replace-the-check-for-f=
irmware-regis.patch media style
> >> ERROR: ./0001-media-v4l2-core-Replace-the-check-for-firmware-regis.pat=
ch: Missing 'media:' prefix in Subject
> >
> > LOL, what?
>
> Hmm, the 'I=C2=B2C' bit in the Subject header causes it to be UTF-8. The =
Subject line in
> patchwork (1) is now:
>
> Subject: [PATCH v2 1/1] =3D?utf-8?q?media=3D3A_v4l2-core=3D3A_Replace_the=
_check_fo?=3D
>         =3D?utf-8?q?r_firmware_registered_I=3DC2=3DB2C_devices?=3D
>
> so the check for the 'media:' prefix in the Subject line fails.
>
> Interestingly, if I commit the patch (git am) to a test branch, then run
> 'git format-patch -n1' the Subject line now reads:
>
> Subject: [PATCH 1/1] =3D?UTF-8?q?media:=3D20v4l2-core:=3D20Replace=3D20th=
e=3D20check?=3D
>  =3D?UTF-8?q?=3D20for=3D20firmware=3D20registered=3D20I=3DC2=3DB2C=3D20de=
vices?=3D
>
> and that restored the ':'.
>
> Ricardo, can you look at this?

STOP breaking media-ci :P [1]

Thanks for the report. We were not ready to handle that encoding. I am
now leveraging "git log" and it seems to work fine.
https://gitlab.freedesktop.org/linux-media/media-ci/-/merge_requests/246

Regards

>
> I also noticed that the v1 and v2 patches ended up in my spam folder. Whe=
ther that
> is related to UTF-8 in the Subject is not clear (my provider marks way to=
o many
> legit posts as spam).
>
> Andy, can you post a v3 with just 'I2C' in the subject instead of 'I=C2=
=B2C'? If nothing
> else, I'd like to know if that's the reason it ended up in my spam folder=
.
>
> Regards,
>
>         Hans
>
> (1) https://patchwork.linuxtv.org/project/linux-media/patch/2025031219252=
8.95838-1-andriy.shevchenko@linux.intel.com/
>
> >
> >> Please fix your series, and upload a new version. If you have a patchw=
ork
> >> account, do not forget to mark the current series as Superseded.
> >>
> >> For more details, check the full report at:
> >> https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/727=
74130/artifacts/report.htm .
> >
>

[1] No, seriously, thanks for taking the time to report back, it really hel=
ps!
--=20
Ricardo Ribalda

