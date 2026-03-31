Return-Path: <linux-media+bounces-57718-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJNdNatyy2k3HwYAu9opvQ
	(envelope-from <linux-media+bounces-57718-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 09:07:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 455CD364C71
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 09:07:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 026C2307D539
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 07:05:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B9DC3B6379;
	Tue, 31 Mar 2026 07:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RpGFhnE6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B4A27FB05
	for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 07:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774940720; cv=pass; b=QRuNNUGh4/GReeo77NVpi2GcDpxdhyGJfzYzxbO9FAvHppAdFgqOFxmhooiH4iXaikvHhhdatkHYpPl2n8CVJYkmiMhhDCs9JJk9B2o78b9equvRlQnPuHq9sOjXiTOQR/NaB2wSn7Dma4F7i1QHr4r9p2yXwOpiuDkobnimm5c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774940720; c=relaxed/simple;
	bh=csqNooH5rM+TOmTU+fGOgxtFFiac2iCUs8mRIqAjjiE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FkpH4WxGNn3YQk+0YIMDTAM8OUUpzZ4o6iz/cdw4QeU/Ppgd5Y2iG3yeB3/V1kiHqtguD2ipnHI3wxRV1aYA587I/RVTQrg63M9bXedin5KtsBvOzKyORRuSw8x5IBHmrp+rwEN8DtlfRCJLhzmtv3Bv4XCf3vkteaKk7L4rRv4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RpGFhnE6; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-66c5b2e41c1so153657a12.1
        for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 00:05:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774940717; cv=none;
        d=google.com; s=arc-20240605;
        b=ZLPrwqYfC3HzOPf429JYy8G3jCWPYBkU5mmZOTqvuFN2CNwZRI7zUOBBAFvRKhnJPQ
         3/Ntcjkq3huPB9cjIxC3pLr/sdOKlMVOLuwCWs5rosKM6J84pNrxZH8Zt/bErnxHITb7
         JuOnCEcLdHrKySOLdxj6nzv3nz8leqs3RSkLwAYQZL+nGtvWbZHK8DsCYK2az90FgSjG
         raFWC2NFE7YNF4d0yUHTObdgxFR5GEHDVGoGrLOJRAKA51eQ821IqOYcRbMTe63RRbKd
         G9mBzf0V9mQfIgAbzXJNd1pDogjxLbB9Uw6F6tCIv88cVRWJXjT/fkXSzkRbJ9CNfhJX
         TJvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=f6oWF/dNmQ8jzZYTNaItWPQmXNUN9mQoakFiTwJhUS4=;
        fh=f3Y002psaeS/ijjP0Bn2JKO7Ebn2a3sZHopaSWvC42E=;
        b=D2bBxxGjyvErx/oa8fp0l+Uboi1HAinH/CzL6OJ122bT8dKkZgDczZNQa9pz/s5un7
         Qc2+q/FZ3o/FEqE7L2rPfM7U6VaOSLahiurk8IqTwxTqoEBEsSjaT5e3kVXhLCgIEAD5
         GigU4I8HPrBSR+0no4eh5tr/jlRGMX1wHsNIqbsedqdAul9xl5Pf+hJJ2wiEA0+WCzUz
         k0aHcspiOlZWFYO/wMYZ8v704gN02PD8zKHrW3BSenlwgc6G5Vxl/u6M+MLSVSIAtfWS
         VqAWU5PLXWjDYUwYA4K4nJULQMGvDic4+qG5gwEcUjmUXzzSGriAJdi6DfR0YUQhxikk
         Qt/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774940717; x=1775545517; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f6oWF/dNmQ8jzZYTNaItWPQmXNUN9mQoakFiTwJhUS4=;
        b=RpGFhnE6U83EmGORcbIMvFINFTKJSo1FZ3TDZ/lKdPNHklcSU5VyPuIgGqme/PcKzF
         7LmepfRShQmugXUdWMGnWsv0SLTCN/ksKtK3n19k/0Zsxqfxlz5esUSt9A7finyFMuQB
         mUAQul4Drn5fcYOXOGTrW0YZhcHxuLoDDlalbP5gEZgwyHoONxguhvAUis3ZGDwFRWj6
         YNVY+6+ziycsYNgNpAXFx5lguBIxNKB0KQX73jrfUaDBB0znOTk8JkEMtA8iMhaKmF1y
         /uj63lq7qpzwgqcypHNEbEm1J8fBosLi5wtJW0pdhBqFXuGO8w72jQZiiG/tS2pmvjQt
         Xo0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774940717; x=1775545517;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f6oWF/dNmQ8jzZYTNaItWPQmXNUN9mQoakFiTwJhUS4=;
        b=fsFiDF+qiNMIyD4wQrspE+YLOyhf0KFW3HBcfUjBHgwUm1pnVh5WxB2WdjOXIb1YiW
         k3k5mwb0cR7Ykc18LO7ltbnAGIouQmwIDLYQUlNzy7fIAeO5gToiD5ue9ObJEQ+QYQh0
         ntDT71LU9cK74Ldp9PpdlbFyJlU96+PI1EzwN/ZWXzXRZnKkuvQpQhUemb1rm96nWuHf
         L/weIJpqdGbASi3R11pdMOSwOf3ns/UPeE3NwBITxqPbL8R6jlpKmPVk4Yemqc4DUrUL
         zSckoMgn2H+c+S868y8LuyW3hLG+2EjcwbQgpSHNEDujZwSlURnj3q3QlrQ4XRTA2WKF
         zbNg==
X-Forwarded-Encrypted: i=1; AJvYcCVsGqoVtbzwHFEOzG+48F3U3aNgeBKKuMDQIaneQVSel5uGcOtYYJ5U4+cEkOqwahIRYLfv85JEJrx3tw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9VSQFVGs5aOYDwLRHPp53gyML32Ya8vwfw5uu+uPbpECojObx
	XbGSsh8U8FrAkXIPOJlc4C/q+5DeQbWQuDg24QWREPB15diuHe2uSzAHh04C63VKRym3TCyCRV1
	hoSBA1qbBxFi0feSd7TBl1a8Y4uXNnK7PxGq9
X-Gm-Gg: ATEYQzyNTJdukYyn2pZbJ/LQJFUmP/m9Sh2+QZa19kxD9yw2NKkI3495y1u7Yj6ZH2W
	pdGwTq6tEJ8y0imPDgzrBRASO5CeiK5gH4mcBCmqXYTlULFyBzvvDcDBuK9yN7t5IfQaDTBO28i
	gsrfsPBJxAis4qXL1Uf1kuKRWmQ6+FtW7VtMNz4a3Urv22UG7jacJCoCzqQzecbMAuFLHe/HeCK
	gI1ydG4GbRCeCOg0xLf20tBbRZU9MwQhpwQVSSZJtjFjVqAUpWARGo49rWF4QIxZmc+u2IMUZss
	JmFewyiuLhNk6b+Bb1BoqX3tRNbGEfBOmvbXLAKpjfEhZPjqJCP5aRyPT2gnQkrq1BFUtbzebcb
	ahwEj/RI=
X-Received: by 2002:a17:907:706:b0:b98:6177:2f16 with SMTP id
 a640c23a62f3a-b9b509b401amr1011236566b.53.1774940716834; Tue, 31 Mar 2026
 00:05:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260328192721.255493-1-azpijr@gmail.com> <20260328192721.255493-2-azpijr@gmail.com>
 <CAHp75VezSSid9b5qNzvMjUS7QTJaKtBhhVVnuS+-sjVe_a=CxQ@mail.gmail.com> <actfdnYcTbqg0gvW@gmail.com>
In-Reply-To: <actfdnYcTbqg0gvW@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 31 Mar 2026 10:04:40 +0300
X-Gm-Features: AQROBzDo9NurmTjppPHO4AbpzhYBNpRMAu0W22hgBHxEng4PhZxNcp1LYPgrSWA
Message-ID: <CAHp75Vd2ZywQoPGvLhj4dAwcB7otKAcncuEO6cN9YZJXYM+=rQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] media: atomisp: fix potential NULL pointer
 dereference in configure_isp_from_args()
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Cc: linux-staging@lists.linux.dev, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Alan Cox <alan@linux.intel.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57718-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshevchenko@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 455CD364C71
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 8:57=E2=80=AFAM Jose A. Perez de Azpillaga
<azpijr@gmail.com> wrote:
> On Mon, Mar 30, 2026 at 11:59:24AM +0300, Andy Shevchenko wrote:
> > On Sat, Mar 28, 2026 at 9:27=E2=80=AFPM Jose A. Perez de Azpillaga
> > <azpijr@gmail.com> wrote:
> > >
> > > The function configure_isp_from_args() incorrectly dereferences
> > > args->delay_frames[0] to configure cropping without checking if the
> > > pointer is valid. However, as noted in a FIXME comment later in the
> > > same function, delay_frames can be NULL in certain pipeline
> > > configurations.
> > >
> > > Add defensive checks for both delay_frames and tnr_frames before pass=
ing
> > > them to their respective configuration functions. This ensures that
> > > optional frames are only processed if they were actually allocated,
> > > preventing a kernel NULL pointer dereference.
> >
> > Have you experienced bugs IRL?

> not really, I don't have the hardware, but while reading the code, I foun=
d
> it to be logically inconsistent. imo, the comment is misplaced since
> delay_frames can be null earlier.

Don't forget to mention this in the cover letter.

...

> > >         /*
> > > -        * FIXME: args->delay_frames can be NULL here
> > > -        *
> > > -        * Somehow, the driver at the Intel Atom Yocto tree doesn't s=
eem to
> > > -        * suffer from the same issue.
> > > -        *
> > > -        * Anyway, the function below should now handle a NULL delay_=
frames
> > > -        * without crashing, but the pipeline should likely be built =
without
> > > -        * adding it at the first place (or there are a hidden bug so=
mewhere)
> > > +        * Safely handle pipelines built without delay_frames
> > >          */
> >
> > This comment suggests something different. What the proposed change is
> > doing is just skipping the invalid data without actual understanding
> > of the root cause.
>
> you are right here. I should've done a deeper analysis instead of focusin=
g only
> on that function. looking more closely at how the pipeline is built, I fo=
und that
> these frames are intentionally skipped during allocation to save memory w=
hen a
> specific feature isn't enabled.
>
> the configuration path was just ignoring those enable flags and trying to=
 use the frames
> anyway. instead of a NULL check, maybe I should try gating these calls be=
hind the actual
> feature flags in the binary info.
>
> if this is a better approach, I'll send a v2 with these changes. :)

Sounds like a plan! We would appreciate this kind of patch over some
mechanical cleanups that flooded recently to this driver.

--=20
With Best Regards,
Andy Shevchenko

