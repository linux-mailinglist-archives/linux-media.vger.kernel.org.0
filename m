Return-Path: <linux-media+bounces-45072-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 219EFBF30FF
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 20:56:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 10B044F4DCF
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 18:56:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0610E2D7386;
	Mon, 20 Oct 2025 18:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JlkGBpOQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F38B27C178
	for <linux-media@vger.kernel.org>; Mon, 20 Oct 2025 18:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760986556; cv=none; b=Ag/onZZawVNUzojYFnFbxC1LleCabcOSzHNU1ZBxf8nKQhX/vK9kj2ryEHanzzqY8IeboAozakTa8w+stIvRI7Tvcr3FwB45j0Jlvh1hJPyuLgkDzw0fnhS/DY0wRCfCd4PKCrEHWPF1ZUXp0a0mCfTl1krpoT9ubUbiMFjA5GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760986556; c=relaxed/simple;
	bh=g5Vxv2XVvK4eMxnkfPi/X7JkP216lTFKJMSA2uVNESw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mhzkgaJa62WXkOFKgj+T7AqAamEjiiPMYV5+8s18g2lMck680otJImfOkudx3U3JG8j5xZ8wtn8NEQZG9rpsh1yWoOwvd2uG8MJF28xoXdvQXjRGN8Ytax9rSZfzBpaH6NI6Gorgq28OZ6VW5XF5ZmwjhSofLzG/NFlgU8d/vK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JlkGBpOQ; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-57f1b88354eso5310374e87.1
        for <linux-media@vger.kernel.org>; Mon, 20 Oct 2025 11:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760986552; x=1761591352; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YRvV7Q5kJ96AkDQ6/j0AH4FveRa7t20puBFJp660ZzI=;
        b=JlkGBpOQTq9fHsCvXb91FoOeI6vnyvaP9he+0gDx5mdODa64bvgHbUtc1LQivLcXYG
         4n1Fuhev0aCeVfCm8jBWAfSsRXTgWnqlo564/UHP90hy+joq31ir4Yzt8F7tjMdFhNqn
         Mg0mwktvPquKTBreA5vlET6XIWX0gOmKC7nbw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760986552; x=1761591352;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YRvV7Q5kJ96AkDQ6/j0AH4FveRa7t20puBFJp660ZzI=;
        b=acXYhQsF3zwoyTS6sDkNjA9hquHaynhq+0z4zlfpaBqTmtcXzzjNIla0clut3iTcxj
         Nw2D/VeZJoCeXLkKZyY9g4hn0wCD9TUd140Ur96cN+2Mr1hKUKvYXaswNFq/wm6VOBdM
         BvOO6bz62KEfpsRkKiIigl6zE1W0qgqKwfMgVHY+mRHesMf8U4ZZXG7WIYFDoEjk686R
         Y3zaNkr/hHWpGvdrKf6OD/Oc9rrSogi5tNQd+B3uQMJccQ+r6WIH/hhBa5xmpYlt2JFz
         f4uPg68YgaGM5+87fmNZ+WlI7tdJpZ9aNo+N3MSWs16fkU2gVt1a2ZUl4Nor/qdyW6GL
         5aXw==
X-Forwarded-Encrypted: i=1; AJvYcCUijfzbKVxIKK/0aqeib4cLqB9ObOE2IoNH7fIiHUWvxq9pva2n5zDmTzC6+BS3E7WCWxDon3p0lLK84Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjbzp7rQpUI3KCXo5p9ts6sMu8298WDgsQlbFh7r7Jzq2Jv9B8
	SmOI/ArickYBBZPTinxUo0l3ovvldUvONy/dFR5QgzeqAD6tgBCH2TIK77lftjnIbeuBlydzHYr
	32nw=
X-Gm-Gg: ASbGncvbDNyAyMh9NVyPwp4BqNhECTF+INgINGSd5gm6VfiryAKa8ioCbNSfb7zY69k
	9NpURqlP/InJnImmKgx0Q2Jo4hHtzHMrEmyhvn48I3ca0Qibty9nHE3Ykd1eC94TQhRcPh/OXnk
	zscVZE0OTEkV2UzMScEQ7fN+kqE8QuBjRAwf+8Cd52wdUGwdFySfpaWZ9yezSdFfpY2lEjlDBlJ
	chcmd/1iTB9Le+XCExj2zCNv7HKLQzOu3cIj6JVi/SbCMXYV2f6zmcHPVLKddWKA+98+r+6dksL
	+qH/hV9ZIg8lBkrxtAO4phR6Cg+ZGnOSNrRB1YqvwYJYjkbi7THeZpxtiph7z6AdXHYqCKIw4vb
	SGJeAc/iDMarF6JQOliQFUx+Hg+8TF11wh+AYPXfxvCPg9e3eBZ/eCMn771Au+sS5h9EuXNZ5G4
	QnII3pwMjimxMx6nPWnVthQ/PbBj9/216F6SIkaQ==
X-Google-Smtp-Source: AGHT+IHWXvgl2IQaHiUSQSFsq2OGDXtEacEiZCWY/WKLkKEntFYPuvyPH4BkWsWg4WMujR+TKjn3Nw==
X-Received: by 2002:a05:6512:1557:b0:591:d903:4385 with SMTP id 2adb3069b0e04-591d903475emr3533183e87.39.1760986552149;
        Mon, 20 Oct 2025 11:55:52 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591def1ebecsm2762331e87.97.2025.10.20.11.55.51
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 11:55:51 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5797c8612b4so7248281e87.2
        for <linux-media@vger.kernel.org>; Mon, 20 Oct 2025 11:55:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWoSeAnIIejIMO4SeLv0emWmAJPpEIwfCEr14H1AmztqjsMXKccp2qbGCJvnngde9Ju1fuMv0V3iZA9JQ==@vger.kernel.org
X-Received: by 2002:a05:6512:2344:b0:57a:1818:480f with SMTP id
 2adb3069b0e04-591d85663fbmr4774926e87.46.1760986551307; Mon, 20 Oct 2025
 11:55:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251010030348.it.784-kees@kernel.org> <68ed624c.050a0220.3ba739.64ea@mx.google.com>
 <D1CBCBE2-3A54-410A-B15C-F1C621F9F56B@kernel.org> <CANiDSCu6xZAuSF5_M-4BMRc52hbSh_1QfDQqaeGR4iD5fdQjQg@mail.gmail.com>
 <202510141344.E0ABCD2C7@keescook> <CANiDSCsBAq3Yx4ybarUb_1NkQ-bvfXvWqb-DfqXatkiYJFZWiQ@mail.gmail.com>
 <202510201127.D97BCF2@keescook> <CANiDSCtbrM4Fg_p56EdV09ts_j8HnMCc1hGH31-BZvv03Z0DjQ@mail.gmail.com>
 <202510201146.F12EA92@keescook>
In-Reply-To: <202510201146.F12EA92@keescook>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 20 Oct 2025 20:55:38 +0200
X-Gmail-Original-Message-ID: <CANiDSCv3Ss=8sUXBya7ZbQtsm+b2--v=qCtC06CwLD1KBST7Fw@mail.gmail.com>
X-Gm-Features: AS18NWBUpNjIgkpOzcRhCQZaz7K265W9nxYIi65iv0sJqz27DsWtZq5YSGN2cdk
Message-ID: <CANiDSCv3Ss=8sUXBya7ZbQtsm+b2--v=qCtC06CwLD1KBST7Fw@mail.gmail.com>
Subject: Re: [v2,0/3] module: Add compile-time check for embedded NUL characters
To: Kees Cook <kees@kernel.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-media@vger.kernel.org, 
	Patchwork Integration <patchwork@media-ci.org>
Content-Type: text/plain; charset="UTF-8"

Hi Kees

On Mon, 20 Oct 2025 at 20:51, Kees Cook <kees@kernel.org> wrote:
>
> On Mon, Oct 20, 2025 at 08:35:53PM +0200, Ricardo Ribalda wrote:
> > Hi Kees
> >
> > On Mon, 20 Oct 2025 at 20:29, Kees Cook <kees@kernel.org> wrote:
> > >
> > > On Wed, Oct 15, 2025 at 09:33:40AM +0200, Ricardo Ribalda wrote:
> > > > Hi Dan
> > > >
> > > > On Tue, 14 Oct 2025 at 22:45, Kees Cook <kees@kernel.org> wrote:
> > > > >
> > > > > On Tue, Oct 14, 2025 at 08:24:00AM +0200, Ricardo Ribalda wrote:
> > > > > > Hi Kees
> > > > > >
> > > > > > Thanks for the report.
> > > > > >
> > > > > >
> > > > > > On Tue, 14 Oct 2025 at 07:41, Kees Cook <kees@kernel.org> wrote:
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > On October 13, 2025 1:34:20 PM PDT, Patchwork Integration <patchwork@media-ci.org> wrote:
> > > > > > > >Dear Kees Cook:
> > > > > > > >
> > > > > > > >Thanks for your patches! Unfortunately the Media CI robot detected some
> > > > > > > >issues:
> > > > > > > >
> > > > > > > ># Test static:test-smatch
> > > > > > > >
> > > > > > > >drivers/media/usb/usbtv/usbtv-core.c:157:1: error: bad constant expression
> > > > > > >
> > > > > > > Where can I find what this test actually does?
> > > > > > >
> > > > > > > >For more details, check the full report at:
> > > > > > > >https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/85913402/artifacts/report.htm .
> > > > > > >
> > > > > > > This webserver appears to be misconfigured to send compressed output without the right headers? I can't actually view this URL.
> > > > > >
> > > > > > I will follow-up with fdo maintainers to figure out what happened.
> > > > > > there. On the meantime you can use these url that seems to work:
> > > > > > https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/85913402/artifacts/report.txt
> > > > > > https://gitlab.freedesktop.org/linux-media/users/patchwork/-/jobs/85913398
> > > > > >
> > > > > > Basically sparse/smatch do not seem to understand the constant.
> > > > >
> > > > > Yeah, I managed to find the actual scripts that are run for the
> > > > > static-sparse/smatch tests. It looks like those tools aren't correctly
> > > > > handling string literals for __builtin_strlen(), which is a constant for
> > > > > constant arguments.
> > > > >
> > > > > So, that's a C parsing bug in those tools (GCC and Clang are fine).
> > > >
> > > > Could you take a look at this patch:
> > > > https://patchwork.linuxtv.org/project/linux-media/patch/20251010030610.3032147-3-kees@kernel.org/
> > > >
> > > > Seems that sparse/smatch are not very happy about __builtin_strlen()
> > > >
> > > > Could you fix support for __builtin_strlen() in your tool?
> > > >
> > > > Once Kees lands his patch it will break all the CIs using
> > > > sparse/smatch, including media-ci.
> > > >
> > > > Eg:
> > > >
> > > > drivers/media/pci/zoran/zr36060.c:33:1: error: bad constant expression
> > > > drivers/media/usb/pvrusb2/pvrusb2-dvb.c:19:1: error: bad constant expression
> > > > drivers/media/usb/pvrusb2/pvrusb2-dvb.c:19:1: error: bad constant expression
> > >
> > > We've waited a decade to get the embedded-NUL check into the modinfo
> > > macros, so I'm happy to wait until we can get the CI tooling updated.
> >
> > For media-ci. It will probably be after 6.19rc1
> >
> > Basically, when
> > https://lore.kernel.org/linux-sparse/CACePvbVG2KrGQq4cNKV=wbO5h=jp3M0RO1SdfX8kV4OukjPG8A@mail.gmail.com/T/#t
> > lands in media-committers.
>
> That's external to Linux, though; it's a patch for sparse and smatch. How
> often does the CI rebuild sparse and smatch?

My bad, I thought it was a patch for the kernel tree :)

We build it every monday or when there is a change in media-ci. I can
also trigger it manually.

>
> > How did you plan to land this series? via which tree?
>
> I assume it would go either via the modules tree or the hardening tree.
> (Again, no rush.)
>
> > if Chris have not landed his fix yet, maybe you can include that patch
> > in your series as 1/X.... That will make every ci happy
>
> Since it's a patch for a separate project, I don't think that will work.
> (Maybe I'm misunderstanding something?)

No, it is me who misunderstood it, sorry.




>
> -Kees
>
> --
> Kees Cook



-- 
Ricardo Ribalda

