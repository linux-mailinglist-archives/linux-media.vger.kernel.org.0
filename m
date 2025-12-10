Return-Path: <linux-media+bounces-48526-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4434FCB18F8
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 02:02:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0A47730ACEA6
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 01:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F401021A92F;
	Wed, 10 Dec 2025 01:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kgKyzH2s"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C711F4C96
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 01:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765328431; cv=none; b=W6Tm/GOLg1wKQgPcarE6YfdBgqcJ56wuWoBu8L1FkuKAjqpsIhlTdmSEjf1xFdnaTDYJGaycTs8pUKfHZnuY6qBYg0JEIwlGxVubN/oAhc8q36l/SBzHluRWmwl3B9IMo508JuiRVnWJJGL9x1I2WgL0qT/IvlM3c3CanE0ByLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765328431; c=relaxed/simple;
	bh=3ajHi0yHPov0SKg4O4bcCBy0K1fDiVaVSenJjs4a1bQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MFGABg5fc5Kn3HfEvH5ipmuC6yNRZayu3e6fX5LBj1jHV1mg7fJBTmMvuQOUa1UEmIa0tbctvuwnH/7exBmyy/vIwYfvJGC+I5zySR/FdfTZNpT1/sUdOzTVkTJ3YbsjZo7ifH7//3BLMrkA483z618i9m0TRhMMqgWCvQrQfXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kgKyzH2s; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-297e13bf404so99145ad.0
        for <linux-media@vger.kernel.org>; Tue, 09 Dec 2025 17:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765328428; x=1765933228; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=691lAnJLGf8S4+TJC63j4SAsoo3YOyh4dWuPiM7IB1Y=;
        b=kgKyzH2swSxVXBMaeFB7gJNTGVVgRjudOLs5hyYnbuQNDZYS3DQU5oDVuypi7nzWg9
         UoL+4TIYLG/v7OPda7a+tAnkkmJ99+fzXqQD+m3yO1/Ha/p3V85KH7NdXFrAOiyo0m3i
         u2tNWXzPMA9rX/jwPHk9jlYKQap0e0xHDMIAE/jkQzpulvbUSO4e/mwHjOtPwzVBIcue
         vedJDref403j9C210J/b2na+jJ5GArAgTkXCoCx1P+NPuRnGGOjE/YFnvoh5FldRbm9R
         FNEMj5Obb9gRP0A692VrbA8jYKtIC3y5ccADwF5EWJa8Zzy/eIoj2kXZU+PgZsDB7WqZ
         CBFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765328428; x=1765933228;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=691lAnJLGf8S4+TJC63j4SAsoo3YOyh4dWuPiM7IB1Y=;
        b=uaMGfDfVyuIa0AsWmuj87nely+SGDLoNDzn28CQ7mQb18506riLBDxlDwG9cBjBDRP
         x79F+/DXiH4gHrPS2LtbwPyWsQu+2X5EP0gCf0tbmLnWI0owrpmS0yogJNDAderkeP+t
         SS4g96gtSzdZU/aaw0BhHWZHfMb7R3w0zvevYM80NXo1s4O+Paid8/YzHZjxCYyms5KJ
         eDHCzBKOF+gblA72emQvckqUm3/Wbi8desE46V1tnWxG070xoKvtFiAVpiBtdFhH9Kti
         EyUfAOLLOujYOuy0h6927xIWRux2Gtxt74+R+p9hw+Vx54RqHh7x13fyS2EpFcbxq377
         QtQw==
X-Forwarded-Encrypted: i=1; AJvYcCX7rzzu6lZwE1sne/UHLh0Drz5/WneClE0GVWz1nt8+sJTE3mbbrfsmWqCYKenNSXu2oy1sNW3uC1nsMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGH82e/jHLWfkwsk8/MKl1hCmGHreZn63jlv0rpP6AA3oQ33lH
	MWgKngT6EraktxZmi0ZA9hzn9NU7CKdvwlz1gipbD/nJbGY01rwa3Fo9ieOpTN3UNg==
X-Gm-Gg: AY/fxX6xi9u4CJWNEYH7XAH3UzB4kPXDLmaflcpxQv+MTsQYk4GGk7k0b2utfYteY+4
	KgBgiPTGP7wOB5xr/FcgSfhLM5WIxu7k9N5/kObrz61nQ7Oi6qoXEdgMTqiXYuCyCQwWROj6IHz
	IA2L1q4AqcxzHC0r3irGlm9bnrxAYl8/Tq/c4ZJtoh5tGhBECiLtYUUPapaj5EHiQD/v/Oxp/DU
	kpWmvg0EAXxjDC9wOEV40GdV2irHt6QWbxzvwyT8vKHa2g7eCi2HJ/LKm2VokluIt0NAwNtusqw
	//1BNzQyHHUg5vawpYpy7I/YAMOTRYNy1Ffs7rR6UIDgfl00SXrPdiAuUJtcgTafrdtnM1kTTzT
	lfW3X85TFNI/wioFV/KM+CgmLO0CILHfgjt2SsWJe5RxS6wDPmTb9OzYqhYVaNMQq6LdbUeUnlm
	Bog5XFd7KvPCOfJ+oo1dVVRaksci+nngVc2jAxMu/Ej5PS92vIAnm0HGY=
X-Google-Smtp-Source: AGHT+IHwazsr/LFDDUVLr6lpCN1u73yiv9zYWPNsYlgfC/SF2jnbI472ByJ0qhQLxPF8fI22SQq4QA==
X-Received: by 2002:a17:902:d4c2:b0:295:1351:f63e with SMTP id d9443c01a7336-29ebf8ce459mr1596665ad.10.1765328427004;
        Tue, 09 Dec 2025 17:00:27 -0800 (PST)
Received: from google.com (99.181.125.34.bc.googleusercontent.com. [34.125.181.99])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e2a07213b6sm17205315b3a.26.2025.12.09.17.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 17:00:26 -0800 (PST)
Date: Wed, 10 Dec 2025 01:00:20 +0000
From: Sami Tolvanen <samitolvanen@google.com>
To: "Luck, Tony" <tony.luck@intel.com>
Cc: Daniel Gomez <da.gomez@kernel.org>, Eric Biggers <ebiggers@kernel.org>,
	Kees Cook <kees@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>,
	Rusty Russell <rusty@rustcorp.com.au>,
	Petr Pavlu <petr.pavlu@suse.com>,
	"linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>,
	Malcolm Priestley <tvboxspy@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>
Subject: Re: [PATCH 3/3] module: Add compile-time check for embedded NUL
 characters
Message-ID: <20251210010020.GA2522829@google.com>
References: <20251008033844.work.801-kees@kernel.org>
 <20251008035938.838263-3-kees@kernel.org>
 <aTc9s210am0YqMV4@agluck-desk3>
 <20251209001139.GA7982@quark>
 <d3dd8fc8-ab46-4cf1-87a9-0324685ba2e0@kernel.org>
 <SJ1PR11MB6083C6D97484ED4E4710268EFCA3A@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <aThSGiKwJRYOB6kx@agluck-desk3>
 <aThqcq0iGge1pQCr@agluck-desk3>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aThqcq0iGge1pQCr@agluck-desk3>

On Tue, Dec 09, 2025 at 10:29:06AM -0800, Luck, Tony wrote:
> On Tue, Dec 09, 2025 at 08:45:14AM -0800, Luck, Tony wrote:
> > On Tue, Dec 09, 2025 at 04:20:06PM +0000, Luck, Tony wrote:
> > > >> Likewise, I just got the following kernel test robot report sent to me,
> > > >> where it's warning about MODULE_LICENSE("GPL"):
> > > >> https://lore.kernel.org/all/202512090359.7BkUaiC9-lkp@intel.com/
> > > >
> > > > Can you both confirm which version of sparse are you using?
> > > >
> > > > My understanding was that this patch fixed that problem:
> > > > >https://lore.kernel.org/linux-sparse/CACePvbVG2KrGQq4cNKV=wbO5h=jp3M0RO1SdfX8kV4OukjPG8A@mail.gmail.com/T/#mf838b3e2e3245d88c30a801ea7473d5a5c0eb121
> > > 
> > > > The patch is already merged into the sparse tree, and I was not able to
> > > > reproduce the issue.
> > > 
> > > I pulled the latest sparse source and re-checked before reporting. Top commit I have is the one you mention:
> > > 
> > > fbdde3127b83 ("builtin: implement __builtin_strlen() for constants")
> > > 
> > > I'm building latest Linus tree from the current merge window (well latest as-of yesterday):
> > > 
> > > c2f2b01b74be ("Merge tag 'i3c/for-6.19' of git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux")
> > 
> > I added a debug trace to the new expand_strlen() function added to
> > sparse. It is being called and doing the right thing. My trace says:
> > 
> > 	len(GPL) = 3
> 
> Simple test case:
> 
> $ cat -n s.c
>      1
>      2  _Static_assert(sizeof("GPL") - 1 == 3, "sizeof");
>      3
>      4  _Static_assert(__builtin_strlen("GPL") == 3, "strlen");
> 
> $ sparse s.c
> s.c:4:40: error: bad integer constant expression
> s.c:4:40: error: static assertion failed: "strlen"
> 
> So the "sizeof" bit is OK. But the __builtin_strlen() isn't.

This looks like a bug in Sparse. The CEF_ICE flag isn't propagated to
the comparison expression, which it presumably should be when both
sides are integer constant expressions.

I'm not really familiar enough with Sparse to know whether this is the
correct place to handle this case, but this quick hack fixes the issue
for me:

diff --git a/expand.c b/expand.c
index f14e7181..71221d35 100644
--- a/expand.c
+++ b/expand.c
@@ -535,6 +535,8 @@ static int expand_compare(struct expression *expr)
 			expr->taint = 0;
 			return 0;
 		}
+		if (left->flags & CEF_ICE && right->flags & CEF_ICE)
+			expr->flags |= CEF_SET_ICE;
 		if (simplify_cmp_binop(expr, left->ctype))
 			return 0;
 		if (simplify_float_cmp(expr, left->ctype))

Sami

