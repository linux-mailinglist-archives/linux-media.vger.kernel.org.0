Return-Path: <linux-media+bounces-36292-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF072AEDED9
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 15:22:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44B4A3BF488
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 13:16:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D17528DB4F;
	Mon, 30 Jun 2025 13:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AYBzNDgS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF982749E1;
	Mon, 30 Jun 2025 13:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751289219; cv=none; b=l4NcjQF6sQX9ai6eXSQkO6ouh0k197w+Mkr1nXPdy4wsggzA89Aa1gOzk9DBjPVoGpKD2KTvWd68N0T/aAabdOrfB+RWu0I51JzgkeHciMgBe4Xk1iWTgpIxcG+q67ltnZo+/9ovgKuLTxjLvlTnCO96Yx9VPxZFPKiIv6PipUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751289219; c=relaxed/simple;
	bh=ticg8F/QpgM6uZ+Xc7lwFuLN1jw7UH52pw2WrhaQ6Oo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iuQ8UMJDkIDI6g/+M6pHBzbabwLo7ioJXBY0Abb7vFcAKzyBB/5L5sSxNBbCkRRG8Qxrk6tXpSTU+/RU8WBSE2PRcqPD3qhQZPVpxUC8uRdgIQbWcK216bI5qNrzDXWMLpJdzypzm2swLRY6ek639vMBT/M+JiVOVGuiMMokcss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AYBzNDgS; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-607cf70b00aso8997645a12.2;
        Mon, 30 Jun 2025 06:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751289216; x=1751894016; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fswOJF6o7qkEIMaZT5o1n79zw+u/hsqnIJovmiTNbVw=;
        b=AYBzNDgS++l1+XVOLEK3vUgfJQAkpnUOFlJUwf3cutYC6nIdyewLXo8QrvsLcuc03m
         Vwe6+zkXokW/U3hsUOS1swBDXcl8FtJklU7Zv7/tS6uzDH6wBVKTdTlkB/iE3uUN6seO
         MFDniZzsabShMy64Fgtxby2rchTXmNq0mh9nOQ5DiGM8GYE1o757BgswGD8CBLVUdaVk
         6NpjRBWUERowS7xzCmLJxd8PYYC+4UtyKrmekENYX+8FQ8O8oSKlHUe8ovKC137z6xrF
         8p44jKyTO9r5oi/aEiandHmbT9NSSsZKmDAhhNSEUvTFXoeHYbsfsNsRF7+UMFYRyQKR
         PGVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751289216; x=1751894016;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fswOJF6o7qkEIMaZT5o1n79zw+u/hsqnIJovmiTNbVw=;
        b=SEpFTNF+NgSZx7ehyAEFRtKJC+e5tu7JzeFKWKL6W6pmF7MYz+igcO77C5wv12zxvC
         o+Akl3Cu6HjwmKw2dYdszrQUcNZ3jJq7eTwGSiQ9S8G89G5hnTd6KQrZR6tOty5VUgqu
         pTVOslAh0CMLKv06uW4IxCcm87jnd3S4TEvNNQpNlNn2IlSpVIa0B3sQhh+Aq+Wzww2S
         F6HxOENcxI+T91iBBL1n2OZ+kov5jLh09ROQ7BbJ9+KN/ZgIaobLFT5D5B38oPXaoSB9
         8PVAJHaMpkjFyy1S338OKf96AXanyqa5E8BMycnqkba4pUAGvinkDGjNoYLOVA9tls6X
         9maQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcdno2n8+TEW6nFIccE7SJZiMFCMwnTATeiZNgUnTwzTFtQWceS461nX0/Seo6R6mLeMQdICT893gGH40=@vger.kernel.org, AJvYcCXBbdupR+IxGmlhzurUNmluSo1D/A4HZgmcJZiAEE52Iyc+FhfSgP3FJE5LyTq0gbNwnDSZ/mxrUZzp6IU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgNrP3RXSXYSJlqlgXgT4S1f14pl1bTFc9yrlVT1VQFjG3wT7s
	DoPuM3lY8QCASqtt8YWujhTS4TGtF76K1ZndYi7ZFhJ2UCWdOvr2WmYZ0VCCciEEifxy+5qPI86
	bAFfxkgPvizS7LuZFQrB5yvN3+eot8/o=
X-Gm-Gg: ASbGncstY46O+BXjkdGaGT9tRqWBKB+waGZX/xA5HGv4NFpSu5WCL5qUqbztcIEpO8J
	PidXhb/XY7rF6ag5xfngHkU/kSS8tSq5BEmD5SSf0iirZIetlQbAeg0PTHWoL1YeLQHtzWBxn6B
	l1lKV6XPkrJhoJfZvFZqRAECqlQddey8SE3JFn9tIi3Bs=
X-Google-Smtp-Source: AGHT+IE/CC3UTiSZbneeJ7xdPR3D+CONWMBjZY1fQXWksoJ1Ise2YdpYc11zDtz5TdPhrowIOpBFW+ey/+B2c8Fx1NU=
X-Received: by 2002:a17:907:3e27:b0:ae0:b34d:907 with SMTP id
 a640c23a62f3a-ae35012229amr1126361566b.44.1751289215905; Mon, 30 Jun 2025
 06:13:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250628181530.873795-1-pedro.nariyoshi@gmail.com>
 <c8b65585-18bb-435c-9667-b202fb768299@jjverkuil.nl> <CAHPgyW5s8HB5op9z8cMPJPJ-9=e4Ufp6R3U3jABOxXD0Rzt06g@mail.gmail.com>
In-Reply-To: <CAHPgyW5s8HB5op9z8cMPJPJ-9=e4Ufp6R3U3jABOxXD0Rzt06g@mail.gmail.com>
From: "Mr. Chromebox" <mrchromebox@gmail.com>
Date: Mon, 30 Jun 2025 08:13:23 -0500
X-Gm-Features: Ac12FXxBe-NEPpyJu-_Iu88iVvt-iIfxyFjpehXXJ6E0qwyuiKPHOgUZMjqEmNo
Message-ID: <CAFTm+6CQ+EkMyt35bLzb0+GcHaCiCk8XFP5-dSwev90on4GT=A@mail.gmail.com>
Subject: Re: [PATCH] media: cros-ec-cec: Add Fizz board variants, so driver
 can detect them
To: Pedro Nariyoshi <pedro.nariyoshi@gmail.com>
Cc: hans@jjverkuil.nl, Hans Verkuil <hverkuil@xs4all.nl>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, linux-media@vger.kernel.org, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> (Sorry to those re-receiving this message, my email client added HTML tag=
s to the links and I didn't notice until too late)

same apologies from me

On Mon, Jun 30, 2025 at 7:52=E2=80=AFAM Pedro Nariyoshi
<pedro.nariyoshi@gmail.com> wrote:
>
> (Sorry to those re-receiving this message, my email client added HTML tag=
s to the links and I didn't notice until too late)
>
> Hello Hans,
> I don't particularly have a preference on what we match against. I went i=
n this direction because I felt it was less disruptive to add elements to a=
 table, than rewrite the matching function and the table (especially withou=
t the hardware to validate the changes on). I started looking at devices ba=
sed on the same board on the chromium developer list (searching for "Fizz")=
:
>
> https://www.chromium.org/chromium-os/developer-library/reference/developm=
ent/developer-information-for-chrome-os-devices/
>
> This list gave me Kench, Sion, Teemo and Wukong. Then I looked at the sup=
ported list for the coreboot implementation I am using:
>
> https://github.com/MrChromebox/scripts/blob/main/functions.sh
>
> The remaining boards seem to be rare variants of these devices (google me=
et hardware, i7 variants of the same board, etc). This gave me the rest of =
the boards I have added. Although, I now realize, I should have just gone t=
o the source of coreboot:
>
> https://github.com/coreboot/coreboot/blob/main/src/mainboard/google/fizz/=
mainboard.c#L184-L194
>
> This made me realize I am missing Karma (an acer all-in-one) and Endeavor=
 (another google meet variant). I could add these two missing boards, but I=
 think it'd be helpful to have someone from Google chime in as to whether i=
t'd make sense to change the matching scheme instead. Depending on what the=
y think, I'd be open to rewrite the patch whichever way it is decided.
> Regards,
>
> Pedro Nariyoshi
>
> On Mon, Jun 30, 2025 at 2:25=E2=80=AFAM <hans@jjverkuil.nl> wrote:
>>
>> Hi Pedro,
>>
>> On 28/06/2025 20:14, Pedro Nariyoshi wrote:
>> > I recently reflashed a Chromebox (Wukong variant of the Fizz board) wi=
th
>> > coreboot and I noticed that the cec driver refused to load with a bit =
of
>> > tinkering, I realized that the dmi_match_table was expecting the produ=
ct
>> > name to be Fizz, but `dmidecode` reports `Wukong` as the product name.=
 I
>> > am not sure if this is the best approach, but adding this patch lets m=
e
>> > load the driver and it works properly.
>> >
>> > Alternatively, we could instead match the DMI_PRODUCT_FAMILY, instead =
of
>> > DMI_SYS_VENDOR and DMI_PRODUCT_NAME. In my board at least, that says
>> > "Google_Fizz".
>> >
>> > I am open to suggestions for alternative solutions and I hope I did't
>> > break any rules (this is my first kernel patch). (And sorry for the
>> > previous submissions with errors in the subject line)
>> >
>> > Signed-off-by: Pedro Nariyoshi <pedro.nariyoshi@gmail.com>
>>
>> Thank you for your patch, but I would like to have someone from Google
>> review this as well.
>>
>> The number of entries keeps increasing, so perhaps switching to
>> DMI_PRODUCT_FAMILY would make sense. But I have no insight in how this
>> is done internally at Google.

DMI_PRODUCT_FAMILY is the baseboard/reference board name (Fizz, Puff,
Brask, etc). The individual boards/retail products each have their own
codename as well, which Google sets as the ChromeOS HWID in their
custom coreboot firmware. With upstream coreboot firmware, the
individual board names are used for the DMI_PRODUCT_NAME as the HWID
doesn't exist there, which is why the existing matching works with
Google's firmware but not mine.

I highly recommend switching to use the DMI_PRODUCT_FAMILY instead, as
it's deterministic and a simpler match. Using it along with
DMI_SYS_VENDOR is fine.

>> One question for Pedro: where did you get all the other code names
>> from? Based on the commit message you have the Wukong variant, but how
>> did you find all the other variants?

they're available from many sources online, including my website
(mrchromebox.tech) and the coreboot source code

>> Regards,
>>
>>         Hans
>>

regards,
Matt

>> > ---
>> >  drivers/media/cec/platform/cros-ec/cros-ec-cec.c | 9 ++++++++-
>> >  1 file changed, 8 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/driver=
s/media/cec/platform/cros-ec/cros-ec-cec.c
>> > index 419b9a7abcce..a26473c3cd84 100644
>> > --- a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
>> > +++ b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
>> > @@ -302,8 +302,15 @@ static const char *const port_ab_conns[] =3D { "P=
ort A", "Port B", NULL };
>> >  static const char *const port_d_conns[] =3D { "Port D", NULL };
>> >
>> >  static const struct cec_dmi_match cec_dmi_match_table[] =3D {
>> > -     /* Google Fizz */
>> > +     /* Google Fizz and variants*/
>> >       { "Google", "Fizz", "0000:00:02.0", port_b_conns },
>> > +     { "Google", "Bleemo", "0000:00:02.0", port_b_conns },
>> > +     { "Google", "Excelsior", "0000:00:02.0", port_b_conns },
>> > +     { "Google", "Jax", "0000:00:02.0", port_b_conns },
>> > +     { "Google", "Kench", "0000:00:02.0", port_b_conns },
>> > +     { "Google", "Sion", "0000:00:02.0", port_b_conns },
>> > +     { "Google", "Teemo", "0000:00:02.0", port_b_conns },
>> > +     { "Google", "Wukong", "0000:00:02.0", port_b_conns },
>> >       /* Google Brask */
>> >       { "Google", "Brask", "0000:00:02.0", port_b_conns },
>> >       /* Google Moli */
>>

