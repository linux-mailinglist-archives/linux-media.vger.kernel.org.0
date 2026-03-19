Return-Path: <linux-media+bounces-56332-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wM4XO9Xou2kKqQIAu9opvQ
	(envelope-from <linux-media+bounces-56332-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 13:15:17 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2F92CB06E
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 13:15:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4D56C32E0A6F
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 12:06:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CFAF3D3002;
	Thu, 19 Mar 2026 12:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ApcP0W9X"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211743CCFAA
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 12:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773921987; cv=none; b=b7nyPw4yHEjPUI6pb0+Jz0U9eZ7bmuYHBOsSSKi33/zVPf1nFvhJN3xbsvNUvMw8u78tphW6EGQnVmvmM/0dcOkBzcSD4sc4CIbABnwfIqdUccsHOp1SoOPYjZzwRjZumatLlvwvERFr9M5eljqX3faULx07fBjjIRedtcjuC/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773921987; c=relaxed/simple;
	bh=evGJACCQ92qfXRJxUJBm1HcUDUM5bR60yuJe8p+XIQE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AF8hlUI1t2VM1dawL95qdzOmdcB7nmhxmY8kaA7mf74i+JLVSxI/8Cs3svQdj4LYeGu2Lbx0Km09wIPyUwncIGdKi/dBFYzu71RWuGp61x82eYFFLmkbm7vcvLy7BWJuwgOrikOKHQBle9zcVLXASom7qiDYL2+7hqf768flxMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ApcP0W9X; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-65c0891f4e9so1749940a12.1
        for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 05:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773921984; x=1774526784; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+QAg7rnrXpBm0pGKAmLADPah3EOw8ViNCZqYfAAvVAI=;
        b=ApcP0W9XBZmhSJswAC0kkjSjrlbghlqGGAFJuRqzR3V1FtHCNN5e4O73zEppnyvhbx
         bBDsaxeNiXq9OL9B07bhaDnmaT4v1gQR7S3KReQfTgp1WTKKzR4TaGxecShl8P20URbF
         c+VdwW7aC7CNM4FHP6eyUxBaw760CeyoulXWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773921984; x=1774526784;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+QAg7rnrXpBm0pGKAmLADPah3EOw8ViNCZqYfAAvVAI=;
        b=tNe0YtBp8OUmzA+2c9QJL7A596LBorBcKNXRol6/ukj+JS++lNKgWKpAFX9qjDZ8pW
         6t5M4Wx9fmt+BUtLo4SOyMOHaWlbHP8brP3QwEaOlZBuv3VRelocqTmIbFlw+mpdyCHv
         fBPALygFqwprEaNk4KbxgWEiIL3vwWgSpDN0mrbEXsCb97H6z9AhkW9mP/hBrltl1YKl
         5vNgTpo6X8Cfwi/NqfdlumBn0MEq/wucplN4fZ9e+bonD1mkxbclzvCYx+bbJ4ku/b0h
         k1ACOrahO8XYJ7SPFpdlXQa+5ZTLcGlvODEsjFKMqPEXuFFZpW2UuknSNnkiVs3DKS+X
         EmZQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7as1VK32kGnic5yQZq1Zg/T72sdmFfjymXqumIHXFaqLiKPrzoKpy+WBEeSkv+bHSJXKzNGGTr7bUdA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZCG7sAgJS9tN8+UwAYcuMIKqkzAKO7zTVEMxYkFxLM9MLPyXz
	YjF6Kqb/gS13+DlrRzTJCBzQWgrR+G9E/PfYiEO3NSH4KYQOzoboonplYxM1f/+d5uPU0zqnW/i
	Q9OcAyqHY
X-Gm-Gg: ATEYQzyQXf/9rYrFKRLRYfqo8VSRHsTgO69vCDWUWhlc6GOWwtji6qZemB0UpEDMaKr
	nEAK6HW748aqO5VuHjWq+TBOGTsNvkPkFtV6NkQapRQpjk768WOD6s3wPZE20HemqCd2DhsyM9I
	Ri9/vZ+vyuvbtp59mINVhKG+DbH6Z2ENmEvpmoROIDJin6YwsknwY2+LK2YeniWpT+Grdt69c79
	cGUeeriATSClZ9RM6X2AG0eqb2FNhZXCS9XL28MRoGitIBZ1opYvofRp5bQwDJOvZg/nUDRWOEc
	FQ9plXpTl24TC1t91pOb2oItsEG0i2Op0H8jZ8jjiFAoqiedKDtm9wBBOFUtxAJ38EsQ04fHyrR
	7MAHMatnJLF1uB39jI1yMJMGh0gpzXB/nh6lYiaJ8ibwd19X6MLb1FrYLLssoSefoY5mNcKUAaG
	TuMFzn5ihk1f6EnHSrlzvynW2ajG/BhSKMnY0tq/nyxV/Rk6BIXW/H9600yjaOKFA2m+9tERs=
X-Received: by 2002:a05:6402:4410:b0:662:8cf0:5da9 with SMTP id 4fb4d7f45d1cf-667b23423fbmr4411982a12.8.1773921984065;
        Thu, 19 Mar 2026 05:06:24 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-667aecbcd3dsm3694704a12.2.2026.03.19.05.06.22
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 05:06:22 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b9382e59c0eso132619166b.0
        for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 05:06:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVS3zP+m/vrP9qkjb43g6h3AhMyXmeHv0weJTZxyVGC0AjiC/2H7lcPwAhqtv4AXgd9mJlzcn2nnQN6DA==@vger.kernel.org
X-Received: by 2002:a17:907:3cc1:b0:b97:a459:b66a with SMTP id
 a640c23a62f3a-b97f49248e8mr451884366b.25.1773921981709; Thu, 19 Mar 2026
 05:06:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260316-uvcdynctrl-v3-0-19cd4657e1f3@chromium.org>
 <20260316-uvcdynctrl-v3-4-19cd4657e1f3@chromium.org> <2026031852-unplowed-ocelot-142a@gregkh>
 <CANiDSCvJnwGix2fZU7KygM8zC1sizkgrW-BVyESnMcmXhGE+zw@mail.gmail.com> <3f4d7dc75346339dd8dfc89c473587ce0f140958.camel@irl.hu>
In-Reply-To: <3f4d7dc75346339dd8dfc89c473587ce0f140958.camel@irl.hu>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 19 Mar 2026 13:06:09 +0100
X-Gmail-Original-Message-ID: <CANiDSCuOseqH0RxYA-=jxq7o9pRgZNMBKNrKBY5UfUmQOarP9w@mail.gmail.com>
X-Gm-Features: AaiRm52NwdEyu_N17bsmFy6dTQI0yiaj67qnvkj987TEjYahmGItUjZAGUPR7LU
Message-ID: <CANiDSCuOseqH0RxYA-=jxq7o9pRgZNMBKNrKBY5UfUmQOarP9w@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] media: uvcvideo: RFC: Convert allow_privacy_override
 into Kconfig
To: Gergo Koteles <soyer@irl.hu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[chromium.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56332-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,irl.hu:email,mail.gmail.com:mid,reddit.com:url,chromium.org:dkim]
X-Rspamd-Queue-Id: 5C2F92CB06E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Gergo

On Thu, 19 Mar 2026 at 12:50, Gergo Koteles <soyer@irl.hu> wrote:
>
> Hi Ricardo,
>
> On Wed, 2026-03-18 at 15:57 +0100, Ricardo Ribalda wrote:
> > Hi Greg
> >
> > On Wed, 18 Mar 2026 at 15:17, Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Mon, Mar 16, 2026 at 01:34:47PM +0000, Ricardo Ribalda wrote:
> > > > This patch is just shared for discussion purposes! Do not land.
> > > >
> > > > In a perfect world, after a deprecation process, we will be able to
> > > > remove allow_privacy_override and block all privacy related control=
s.
> > >
> > > Why add something you are only going to remove in the future?  What h=
as
> > > changed to require this now, and will change in the future to make it
> > > not needed?
> >
> > Currently, any application with camera access can manipulate the
> > privacy LED. I believe this is a security flaw; ideally, the kernel
> > should block all such controls by default.
> >
> > However, blocking these controls immediately might be seen as a
> > regression for certain users. I added allow_privacy_override to:
> > - Prevent breaking existing workflows immediately upon a kernel update.
> > - Give users time to report why they still need manual LED control.
> >
> > The goal is to gather these use cases over the next 1=E2=80=932 years. =
Once we
> > understand the legitimate needs, we can either implement a proper
> > specialized mechanism for them or move the toggle to a Kconfig option
> > for those who explicitly need to opt-in to the old behavior or simply
> > remove the toggle altogether.
> >
> > For the record, identified use cases so far:
> > - Old hardware with red LEDs that reflect on glasses. (Likely a dying n=
iche).
>
> Older Logitech cameras, like the c920, have fairly large LEDs that can
> be reflective, and it's hard to cover them up aesthetically. Laurent
> wrote [1] that's why Logitech added this functionality a long time ago.
>
> You can find old Logitech software for Windows that still allows you to
> turn off the LEDs [2]. I tried it in a Win10 VM and it really works.

In the same link you will find that Logitech has removed that option
in newer version of the Logitech software and a "Official Logitech
Representative" says that:

```Please be informed that there is no way to disable the blue led
light on the webcam as that is the indicator that the webcam is active
and its mainly for security purpose.```

Other users say that
```I would not buy a webcam with an led that can be switched off and
that can watch me without any chance noticing it.```

This is definitely a requested feature by the users and it seems even
the vendor has realized that the security risk of a "stealth" camera
outweighs the benefit of turning off the LED.

>
> The c920 is a very popular camera, still available in stores today.
> Amazon says it sells 12k of them per month [3].
>
> 1:
> https://lore.kernel.org/all/20251119041907.GH10711@pendragon.ideasonboard=
.com/
>
> 2: https://www.reddit.com/r/logitech/comments/v641x6/comment/nr22zo7/
>
> 3: https://www.amazon.com/s?k=3Dlogitech+c920
>
> > - Using cameras as baby monitors where the LED disturbs sleep.
>
> And pet cameras and surveillance cameras don't need LEDs either.

Agree. All surveillance cameras.

All those special cases can use the allow_privacy_override parameter
until we find a good way to handle their use case.

>
> > (Arguably solvable with a piece of tape on the LED, but still a
> > reported use case).
> >
>
> Furthermore, if we filter these two Logitech XUs, we could then add the
> similar XUs of the camera modules in laptops and this could be an ever-
> growing list.

That is the goal, to have a list as comprehensive as possible.

>
> >
> Best regards,
> Gergo Koteles



--=20
Ricardo Ribalda

