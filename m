Return-Path: <linux-media+bounces-37785-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 447B2B05C38
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 15:29:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBEBB7474AB
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 13:25:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F1462E339B;
	Tue, 15 Jul 2025 13:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W3hrbTAd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B282E5B06;
	Tue, 15 Jul 2025 13:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752585852; cv=none; b=ElyShK543CIBMcyJUhpNMUdMOyY6ebuG+HTk7v24pbVUoWjDpw5tTTvDsZfI+0qVlI4GXxPa60FkoOla56awtkcq9kZACuzihYhNx0r712HG81Q99b9LaeXJ70wq9dcmI7Xnt6IFSKZMLPFl7NdHndWso4im9GiFygOQ1KWeRPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752585852; c=relaxed/simple;
	bh=hJs2Tx12AhStRuVCGZs1ahFFxS9sjYhF28qp/H8h42Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H6d2htuudNypqCS15vMoScomm7XB3ETxQgU4FdZEaGnQ0EJqK7K334QaTePh/phCcyJZ5HXyPj1FBY7HkGnlx3Xh5dpcTHE9WWlydWswmobs6i+O/y7SGXlH++aferkGr9j34w2qKOB9oSsferZ6J3DNM2KoMRfIN+CalfBE+4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W3hrbTAd; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-32b4876dfecso65278351fa.1;
        Tue, 15 Jul 2025 06:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752585849; x=1753190649; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=puBkZe6ZLP/QGTaKOMgF9k4UNRq2jZxxdkE9m753KvA=;
        b=W3hrbTAdetq9OnVfXCUQegBshcKRgEtF4wRL9D0pheIV6r/2/DbXrF0gOMcZxTFKw8
         1d51EcmahvWQcHhddnkYmCdFPF/GiVv2wQkFVYDgFdKPoQiF+0ELKAGbBXvkm30fkbJ+
         tIImGdlAKJT6FIZvkheGk++590SXB/on8yI4UN8LhycJIl5fgKnK2bQAVn9SYhLE0P2f
         aPTrwjoaVROPOogXs8B5/gbouEJW6TWczEcrers4O56yhabTwuKqiC+lXI6y9K6mmnCe
         cMMjHw+lg2LUDu6tIkHbAOJ/ENPouCQrPxoWal5Mi07PF/apceWOwyhRU8YJyOCmfJgi
         0FBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752585849; x=1753190649;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=puBkZe6ZLP/QGTaKOMgF9k4UNRq2jZxxdkE9m753KvA=;
        b=g/N1NRtOj6zlK0V2EIcbOOPpczdgJUVl+oueb2498bDmGgw3LmsXenmJ1f/j3vJWy4
         Xu6xp9ApeoBgUTfjPLzDujX2xfZRFxF5mgwol3PVN3DFsjvcwwaKreQv5MnarbKc5OMs
         MM5bGA4fVSHnuLRc7g/zzHi2bWbduz/yt5s+2uVbrweShuK2qteN+Y8JA1HB0012CZFk
         5ou/ZVOnj7RAuyqmisxfc3fLOSK+HY2Q1zcwy2Lwl/eE8hY0BquZgZcrColICwy/tUxB
         szX+Y2T+Pp/Zvnh6O3W94BAnzomQymS1FUMF9q6iaRpmi9+j6mD8/QfHUIqZlC2G5QfX
         cPbg==
X-Forwarded-Encrypted: i=1; AJvYcCUX1kw5HjTaszHdCCHA5tSNszNo2XTzlUjItDtC8OMwhj+U3keq0deaDBwD8Wb5yAxUFZCtlW2B01LCjOw=@vger.kernel.org, AJvYcCWQCfB0UzFk/TDBHk8uaJdlFRpXWdWoZBrYxOr2zOT/w3KRQmMR+ZGHvY+HwmsA7p0AEABkcf3Jcy8URK4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPW+rlCSiHygZdFdR0pKRSYx0hCnAXx1BX2wbM6Jv5O8rCbHNW
	/tW/0sYNGZoeytk/dlOTINoKE8Nzsd0hlr3vC6QlzSIBc64Y3Azj0n/Zx8FnF4NHFzL0WxPIL2U
	Qmpsw4DVHo/KCCDebeyGDZGf28RYoPRo=
X-Gm-Gg: ASbGncvvxNFWZ3yRqhjkBsXGYp5+xWkUQlm7d5/+93Q+v7FP356CGsrcWai5ZvDLBEi
	11PNxQfkPszmTttf3n3VkWNrkshEmno/tHeelHvtvUmHyAK5wKbdq+5GdlWBAbUM4cHg73JEdqJ
	S5fudZtRpuWy0hp7Z+Ir+b100+9diPbE+sWmzQbKglNm3dUca7xnyiaR2SKfCxLNxDq7bs53Lyn
	7GHVIJsYQ==
X-Google-Smtp-Source: AGHT+IHyhgM9GTkj6ufKA4ysSb28NiNtRNmpxfHePlNkbW+SDylrwHOU1wSPErQE40fSVHRPCwqv5mVSW0wvtXQD2qo=
X-Received: by 2002:a2e:a984:0:b0:329:136e:300f with SMTP id
 38308e7fff4ca-330811fd7ddmr10104531fa.13.1752585848880; Tue, 15 Jul 2025
 06:24:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250715121839.12987-1-shjy180909@gmail.com> <PN3P287MB1829790FCBF0CFF1F06585728B57A@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
In-Reply-To: <PN3P287MB1829790FCBF0CFF1F06585728B57A@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 15 Jul 2025 16:23:31 +0300
X-Gm-Features: Ac12FXw4aZaN7rnjjlU4zPnr7LEkkyd1A8yPGqxz66xL1FgOMiNDSbYD9CZrEbs
Message-ID: <CAHp75VcxKhz_+Kb4Y1qdrYKLrSBEEC0n77ptddSe4TVVtk18-g@mail.gmail.com>
Subject: Re: [PATCH] media: atomisp: fix trailing block comment style
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: Michelle Jin <shjy180909@gmail.com>, "andy@kernel.org" <andy@kernel.org>, 
	"hansg@kernel.org" <hansg@kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>, 
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>, 
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>, 
	"lkcamp/patches@lists.sr.ht" <lkcamp/patches@lists.sr.ht>, "koike@igalia.com" <koike@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 15, 2025 at 4:11=E2=80=AFPM Tarang Raval
<tarang.raval@siliconsignals.io> wrote:

...

> >         /* Sensor driver fills ch_id with the id
> > -          of the virtual channel. */
> > +        * of the virtual channel.
> > +        */
>
> Preferred line length is 80 columns, so I guess.

Yes.

> you can write it in a single line.

/*
 * Also note that the correct
 * multi-line comment style is
 * in this example (with wider lines, of course).
 */

--=20
With Best Regards,
Andy Shevchenko

