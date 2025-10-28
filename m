Return-Path: <linux-media+bounces-45773-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CCFC13D22
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 10:31:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0F3195065BC
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 09:27:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B56B3009F5;
	Tue, 28 Oct 2025 09:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gFzeK94G"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0BC207A22
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 09:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761643649; cv=none; b=mrL78PH+zbSTXD/+0S9nuemPOfzQEK88VuKUy26LhIsbeCaedW+56q4G7lFpskwI8z+tKrOefNpjABe36EStv4FxruV4Cj6DHB0DyEzDJz9+/X0yNopDHaDMwp3aG2pmm/+lWKM4oi6ZBg+8O2y8T65kjFhZNjejFFFTFPyb2Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761643649; c=relaxed/simple;
	bh=2nzO/Lgis0CGEF4PRwALL8keP37eKj0EffWsyrHfk8g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=POdlOQvowCBNUczmq4xiOpPzuv8N7P++QArDFTSO/6ZGtQX1BN3jBPo9u34eBr8PM7u0tpfCv6nO5ndWzGJkVqr9ul9gI8kfEuFLs2FZOIpIENV+LQm679z/aWC7RyQgvdO9pHu/ae97QPNLD8g6/EXNmbNlas+L3a6FKLuvexU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gFzeK94G; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4771b03267bso2292925e9.0
        for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 02:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761643646; x=1762248446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Fa94rq4LY4WzohJQBw+1+fnrKto/qSLOJsPZx6Z7XI=;
        b=gFzeK94GevHbhOMiC3e73zh2DVpGzeNYpfuermoLx17CgcM1z15E0c7VRnKDatBmJ9
         jBfbONzCHIDfmkUHshBA01wOYhy7sios20iu02Ik00nZHUM4tWkWWSHSA9CM3zEyFn6P
         BpUBQe3jLgkj3+jUqgzA8PIVc9kGACoPAYrDjZeNcOJWpMKKCyuHGDhm63G3N7WQ2CZ2
         1DkV+0ij+AhS1S6s/bO0/fbzdUsOIK9RVU6t41G06Ox5M/drv9NGsVvIuFivpw1IJaeX
         PF0SVq6RaPCfVb7CZxPQOijIHwDp+xe6SQ67OSGT31LA3hK/5LiY9Dh7Jk6bXRJMayVY
         Zu+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761643646; x=1762248446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Fa94rq4LY4WzohJQBw+1+fnrKto/qSLOJsPZx6Z7XI=;
        b=uIP8LK9hdO9/uOoIRNS/j218N/wmsfHHPT9LD+cFNHKmDIvNLQ7rZpozGm5QWlzXwx
         U7idg5prnJ1MqOUoz7aKxWdo5TBdY1qRJ/FVf2fuVznnF7uSNuuqVaOK6GCG7KLn8VRn
         EO61GurhbI37zb5soGr6uAobuRAGYrQFSos25wLk75TRX6wr70pTLOKnk80UthVyBilT
         +kYpcSJubhhLl5ZeObsPCv16n6wS3cSDwt0UfOXGcupajYN73dlSczefc1+1pWsy8hbw
         Wr0xNQYs0kmdROYPoeAQNLuBFghU+/bhQvvNkjS/bcOOsrSk1E0UabNYZ6aPeFY608Ox
         UwaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuk9Sq8rXFNumy3Z2ub46jTEY05Ye16prFgKOuMK7uItkYL4jfZ4/kP+Tn2STgssvSH6cpCZIzfPdfCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn7eXDv/fLmXYwwuCELNVjY40GCzHUHRGmpHXcx1A3BHw+q+2C
	t9xxH2uiNcLBrT9J4lRz9BOEV+63CQPAZz8WQ1tFOwBZ8e5qLns8Ym20
X-Gm-Gg: ASbGncv3VnfhI2fblvx6Nr1V/g64mhHawTAsn7L5O/W+Sf6CjjcnlfWxFyfLj0GAcmT
	Hi19Cjdi/Pk2HusW7P+qum4MUrSt8ZW+dJjCSi2dgLPGNB9RKrliW/ajwwKJr5iS5A8H8Ikwo92
	m3WfulxCZ8+HLL7vSlX2oBkkq+1UVuYJ+Uqx5VzCewUIV+t6a2oBa+xSmg+klHaGLpM80caKTGL
	dTPKtiYfokS7IbVsVfR3BS//3gRtCIJoqs6TH0SBvBAtdxqzF4gfwzeDCig8OLrpoMyEAHo29qV
	uBOCXiM12WW4vJwIPHURSttQgSYhSEPage8WsWBrkgV1TKHqAEUcHEsFDP3lfGXJa3vBiBym+OP
	aa+lANPh1DYxMFdgP9BHB9ZKO89/8M4kJaH2Nvfu0w6q6aT0j2gmRDaqfVRV1yhMUzaBbEqjYZg
	WY0FfGaCLpHQzmjNGuSj4l/PsH1SsnAkloFfIW6t814Q==
X-Google-Smtp-Source: AGHT+IFF5YJfFnpTtTAVxGmV5ZlBFo/mf4gYcQP7jzA5jKthEnOt4UjCXc6otkG5ppk07jpyxXmDJg==
X-Received: by 2002:a05:6000:25f4:b0:429:a7f1:bdda with SMTP id ffacd0b85a97d-429a7f1bf31mr2313106f8f.47.1761643645777;
        Tue, 28 Oct 2025 02:27:25 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952d4494sm19408803f8f.21.2025.10.28.02.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 02:27:25 -0700 (PDT)
Date: Tue, 28 Oct 2025 09:27:23 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-iio@vger.kernel.org, chrome-platform@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, Jonathan Cameron
 <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Subject: Re: [PATCH v1 2/6] units: Add value of =?UTF-8?B?z4A=?= *
 =?UTF-8?B?MTDigbk=?=
Message-ID: <20251028092723.3403d122@pumpkin>
In-Reply-To: <aQB55GjWQL3VD1MO@smile.fi.intel.com>
References: <20251027143850.2070427-1-andriy.shevchenko@linux.intel.com>
	<20251027143850.2070427-3-andriy.shevchenko@linux.intel.com>
	<20251027193033.69728215@pumpkin>
	<aQB55GjWQL3VD1MO@smile.fi.intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 28 Oct 2025 10:08:04 +0200
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Mon, Oct 27, 2025 at 07:30:33PM +0000, David Laight wrote:
> > On Mon, 27 Oct 2025 15:34:51 +0100
> > Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> >  =20
> > > There are a few drivers that want to have this value, and at least one
> > > known to come soon. Let's define a value for them. =20
>=20
> > > +/* Value of =CF=80 * 10=E2=81=B9 */

Thinks - should non-ascii characters be allowed in comments.
They can cause grief.

> > > +#define PI	3141592653LL =20
> >=20
> > Is that the right value?
> > IIRC the next digits are 58979 (I used to know the next few as well)
> > which means it should be rounded up. =20
>=20
> Right, today I have the same thought that actually ChromeOS driver has a
> off-by-one issue there.

Not as though it is likely to make a difference.
If any code needs anything more accurate than 3.1416 it probably cares
whether the value is rounded down or up.

> Btw, do you know if we can have compile-time divisions that can make 32-b=
it
> constants out of the 64-bit input? DIV_ROUND_CLOSEST_ULL() doesn't seem a=
llow
> that.

Not sure, I did wonder how much thought had gone into the LL suffix.
The value used will fit in u32 - but then any maths becomes unsigned.
OTOH using LL forces 64bit maths on 32bit - not good.

I suspect it would be better to drop a digit so the value fits in a
signed 32bit variable.

The other issue is whether scaling by a power of 10 is even right.
If the code has to rescale the value using divides you really want
to divide by a big power of 2 not 10.
So multiplying by 2**29 may be more useful.

	David






