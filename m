Return-Path: <linux-media+bounces-56328-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4LhrFHLhu2lXpQIAu9opvQ
	(envelope-from <linux-media+bounces-56328-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 12:43:46 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D781B2CA817
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 12:43:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C656E3010799
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 11:43:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17AB738F94A;
	Thu, 19 Mar 2026 11:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bJfpLnO+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2402580CF
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 11:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773920621; cv=none; b=rdgmBshnNc7hE1zdXi/mf3Lhu6XpugSZRZRhLL/4L+3l9G3xFr7U/AoXaJQMtVKaPZH5oLpQiFot0JRGg/eRA1OGL1UW9bqI60g9aZTz7Rp6QhrIzCFnsus5+YQEuhio3W9f/IgHe9lzM+6jjZR0vXU9jD/746q2DDyCkz5V93k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773920621; c=relaxed/simple;
	bh=O/B5jor0vW8cADLMNtBhxa0dR3u2UgKsCIxB8/6vI4o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MoJFipyNk8upxVBN4Ep84c5N/Wp0DNoBNdqLYgcxKbq9aVSzuF697RiMIeOOqzsWcfPqXUs9gTjW3xRfQc7t2beFk65G2+TobL7TPwn9lVHXoyVWNVtHPMMoGY+COMAxwgdFonDKmnPYwvplUrLB+OH3wbteAKIUolZ2gYb3+Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bJfpLnO+; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-660a58841d4so1128742a12.0
        for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 04:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773920618; x=1774525418; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O/B5jor0vW8cADLMNtBhxa0dR3u2UgKsCIxB8/6vI4o=;
        b=bJfpLnO+mOovyLzD+C3L68uBq1QK+cVif4YLZOLqIyQlmwDAzyPdtW89xc/gtvxwtZ
         NqbABf8grcbQyxSWZdIlLF+T/wuH5H5k4dm2RM4FxeFsXtkHtqqPx4M1mOg534WivgdH
         buDTLRHRx4AnGLug6YzCYIjBzlpyc0thpkz/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773920618; x=1774525418;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O/B5jor0vW8cADLMNtBhxa0dR3u2UgKsCIxB8/6vI4o=;
        b=N0fH3/6HyctLuLFQQTCviojCIMU4m/qPuDS+Fw65rR/1669Ugr97mmJEp2gk1waXE1
         BXzX3fjDpYD/n2+MkJIGq/u+vOat1JpzTP3HhKMmNTq8XT+0Jy67bdf73ty4pXwRGR+U
         u/YlrIerJBIh6KH42GHvA5z9bP9c/WApoo5jggcHTfDOkegSUGx3LQogtxrjg6GGUGXV
         m/v6v1OpbSGytNoAVKbP3VZYLvXdZtP/TXuUtMNCCMU/iB9sd7Uj3rTb6dWLvK7qJXZ1
         Npa1jiN+B/D4CTMfL9CEjr5IKKybPlE3GVO1nXQH0TL56CLcEa1pve+P2+THQ3u3ilL3
         OEYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGMCO9T/WkibHo2DzEBCpT4PrXp7Z+5IjVu4y7tcQQH3oY4yi8SJadmEhV7NNjvSBT9jo80+jBnXHiww==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZwD0NOq/yyUCePTCqxblY0llPVVhDni2rzSBXp3bnE44LovcX
	SvgyrlPi35S9SNwrtkHtAgfuyNF2WV5lo5J3q6ad0cZ3Uw3oO5ojvBspkju0IY/upxSQgd1HUdN
	wQqw3dHdE
X-Gm-Gg: ATEYQzz9qe0Q0tf+k+hAensty2Wmo9aZPHHYSAln03YUuToFPh8FxxxqExs5H1DEvKh
	ktzyT0jVuDIPPZvgpBnOLVOZAFpUDLc+/vhZYFeXFJa7E7+P8VtO32a5aP2LhB3QPlGD/tW6Fwq
	Ik7SmNqhjt4iyJYFXextSgW+Cs1ezBvmvrPp0D7FlddwPhgyt/q5oVlmuKselhjhYncpoj74Nvo
	7TtD2q/ZiBV3vHZX1U60DOZIQSiZ6/rNoNiM8AVUxdtSmBG8UP6CvRSCOpK+J9WPLYCBMFZXdDX
	OrleTjqDDluE7e/2rzMQjh8rDPe5dPLaI8vgYdxLMITmXc0RcCMVHl5+kxAZt3nSkiOlkNtXDMT
	E8OjkPwzyH1/Yybz8xtQjlQAiQHt/MhVc9fwI07VQyg/ooNHviFGnCBu/1aXgZu5Y/GfuAZTyBi
	Chc4RSxMrxrBvwvz2j/4v0CLB6Id9vurQT5IThj7d9O8IassHoOpjDfc6/rmMU
X-Received: by 2002:a05:6402:f19:b0:661:3f3c:400d with SMTP id 4fb4d7f45d1cf-667b3005830mr3476006a12.26.1773920617621;
        Thu, 19 Mar 2026 04:43:37 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-667aecbcae2sm4100687a12.1.2026.03.19.04.43.36
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 04:43:36 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b9358dd7f79so128084566b.1
        for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 04:43:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVlBBqfeR4asHmMTgfKge9AmGA/3Qq6ss0fBHMXVVcdMWT9KDm7+sdhQFN3dwFFTPoXj0EGsTckCAVnIQ==@vger.kernel.org
X-Received: by 2002:a17:906:4fcd:b0:b96:f6f1:e7af with SMTP id
 a640c23a62f3a-b97f486043dmr440383366b.9.1773920615674; Thu, 19 Mar 2026
 04:43:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260316-uvcdynctrl-v3-0-19cd4657e1f3@chromium.org>
 <20260316-uvcdynctrl-v3-3-19cd4657e1f3@chromium.org> <20260319013657.155efeb0.michal.pecio@gmail.com>
 <CANiDSCsBjgZL0MGFgkDzbTaJ03hE0gZbV3tu3fKo7k6KaAcMZw@mail.gmail.com> <20260319120856.09f2f15a.michal.pecio@gmail.com>
In-Reply-To: <20260319120856.09f2f15a.michal.pecio@gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 19 Mar 2026 12:43:21 +0100
X-Gmail-Original-Message-ID: <CANiDSCvw8+KAbrqqSr76eLpdyMoG_o6miy_nGEyS6bRqR4j0PA@mail.gmail.com>
X-Gm-Features: AaiRm50updStBLTHuXRztGog45v-kDkDlKyItK_AbBGnHajIvbj1i2TpZNuiD84
Message-ID: <CANiDSCvw8+KAbrqqSr76eLpdyMoG_o6miy_nGEyS6bRqR4j0PA@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] media: uvcvideo: Introduce allow_privacy_override
 module parameter
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56328-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.982];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,chromium.org:dkim]
X-Rspamd-Queue-Id: D781B2CA817
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Michal

On Thu, 19 Mar 2026 at 12:09, Michal Pecio <michal.pecio@gmail.com> wrote:
>
> On Thu, 19 Mar 2026 10:56:59 +0100, Ricardo Ribalda wrote:
> > The goal of the deprecation period is exactly this: to trigger a
> > conversation before a permanent block.
>
> Most users will just curse and edit their /etc/modprobe.conf. They may
> post a rant on some distro forum. I suspect no one will monitor this.
>
> > We can then decide if we need a specialized API for their use case or
> > a Kconfig option, rather than leaving the current "anyone can turn
> > off the privacy LED" status quo.
>
> Why not just add the specialized API right away?

We don't know the exact use cases yet, and I do not want to design an
API without understanding the users for it.

At this moment, we have only identified these usecases:

- Disabling the LED to avoid reflections in glasses. (This is
generally a non-issue with modern hardware).
- Baby monitors. (I would argue that physical tape is the correct
solution for a sleep-disturbing light).

>
> I believe users affected by this regression are already known,
> ISTR some negative response to previous iterations of this patch.
>
> Kconfig option sounds crazy, who would want to rebuild the kernel
> for this? Depending on BROKEN is double crazy.

I am not set on the final implementation yet; it is exactly the kind
of topic we should discuss at a media summit.

>
> > The attack vector is that an app with camera access, like your
> > browser, can record you when you don't want to be recorded.
> > The LED will be a signal that something is happening.
> >
> > Imagine that you install a Flatpak for live streaming. Assuming the
> > Flatpak is properly sandboxed, remote code execution is less worrisome
> > than the app spying on you.
>
> Theoretically yes. But also nobody should rely on those LEDs.
> People who care ask HW vendors for physical switches or disconnect
> the camera while not in use. I have seen black tape on laptop lids.

I rely on my LEDs. I know they are wired to the sensor power supply,
so the LED is definitely on when the camera is in use.
I want all users to be able to trust their LEDs like I do.

>
> Are there more owners of affected hardware who want this code than
> those who don't? Maybe it could be a Kconfig option for them :)

I believe the majority of users prefer a system that is "secure by
default." Most people expect that if the LED is off, the camera is
off.

>
> Most of my USB cameras don't even have activity LEDs.
>
> > > So it's not removal of some controversial feature, but 3KB of extra
> > > code in everybody's kernel (I just applied this patch) and a forever
> > > game of whack-a-mole with HW vendors? They will win...
> >
> > Maybe I meassured it wrong. But I can only account for 1.3 KiB
>
> I simply ran stat uvcvideo.ko and calculated difference.
> Could be a matter of different kernel configs.
>
> > I see no need for vendors to hide these features, they simply added
> > them because an OEM thought it was a nice feature to have, or because
> > they left them as hardware debug features.
>
> But how will the kernel know about those random debug backdoors?
> It just seems that whatever is discovered by users and becomes popular
> enough to reach linux-media, will be getting blacklisted and broken.
>

I prefer to say "filtered" rather than "broken." It=E2=80=99s a matter of
perspective: we are filtering out non-standard controls that undermine
user privacy. While we might not catch every debug backdoor
immediately, setting a policy and blocking known overrides is a
significant step and also sends a strong message to vendors.

Best regards!


--=20
Ricardo Ribalda

