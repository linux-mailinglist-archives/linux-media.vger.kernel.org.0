Return-Path: <linux-media+bounces-22751-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 117F29E6130
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2024 00:18:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F1E7E28376B
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 23:18:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAC1A1CD210;
	Thu,  5 Dec 2024 23:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h/tHW+FU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827401922D3
	for <linux-media@vger.kernel.org>; Thu,  5 Dec 2024 23:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733440694; cv=none; b=hq7x5e880wpaM4iM1NXAEONvsgi6N6Z6vNTxNpRmIfm7VqJ+AB0uzJXificbiZKRLVAdFBBzi/jFrCDZr3Fwi88PArj9+cdOXD+LBv22m0DMW7OMcO+BV7fFDx8AADCHUMwrRj/amFF5UfLtZ4VLPm7L0PhHBqTAA2fGN1fRwO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733440694; c=relaxed/simple;
	bh=dVFX0iweJAmgsuLhqVkE2GOMr2kcozOmtW5wiosZ9RA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hSE5pnVmEcRq5EdwdpME0BUR1/Of75+cBMDwBT0ux7hIUEsikETZQS63oT6MRo/kjIuT8SnKHsePBe0rBVXBMsTIOXSTSsXUvKif+bPCK23uJqCQWAfLb/i+w/0H3UH6nZkaJ+XE7pA3hASO8RoXhJoWqsUNhu/ssKDlddLdp1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=h/tHW+FU; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aa5366d3b47so234762566b.0
        for <linux-media@vger.kernel.org>; Thu, 05 Dec 2024 15:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733440691; x=1734045491; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ABRkDj2N+QkWL48IvhN2/HmURfPPjhYtD6+wjCTrDIo=;
        b=h/tHW+FUgRRL6F7R2AnC/KqM1dywtivCU14ymVfKRGJXl6Oe4jiFCRap4JYs74+yrN
         NAVlnbOsh/TN3JlzpYIlPfEuxNMoUZftCcFT9l52QYoo7z0vERzLjs7rAi0UwxOaEmjn
         ex8ANYYvOGDpQ52YRV+18Wxu4V5/OcJRmtbf8upbCbHSb7E0nau8VRDeE03mLF4fWS1B
         Bchxb+Pi2l2CjaAIFNmdNLK3mfjo5roVvsr3h6BZxOtKALxqmcFmDUurxpq7AqAJ/iQO
         PmKBO64AtnbAIRFmpN13A+7ENZLAllErO647R4bBP2goJUdJ38KRH2g5GdCooqbXKY9y
         thrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733440691; x=1734045491;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ABRkDj2N+QkWL48IvhN2/HmURfPPjhYtD6+wjCTrDIo=;
        b=rZyZxad4w/rRkHDqNny/75zEL9hu4PtOi9jnqYgqkasrUR6AcC3pfbjs7d1wg73A8w
         8z7eOW/mrnWmSfTOQVlTTmk1ytSqZBXFFo1T0ZNFDQCJw11YdS9T1TQ1MgVBh83R7SWt
         mfO9xiflE3ieF2hz81JshHMzA+Jcgg8B6Xz1caaa5NUfOBWxXqVSFjNsf3qBt/Zs5Ghg
         Ro9G7j112gq3pRAwdZfG4+RwlMgO7ogQc9qiqUwQ3qEgxt/dZ7byJV+7OpijmyEvbMTr
         2o/icr4CZ3hcEQiYJzhQAjXcHJJxbHYZe3ZNYIoEHrGN+V2HRjNoLnGAxO05nOdAviGY
         Dpdw==
X-Forwarded-Encrypted: i=1; AJvYcCWfK7aos1Q237GKKsKyewluYXAgHZQHnkMr630WYGjD5XeC/vPkfQWkb8OWVfNrjOZqfZCu4HKJd7jl4w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4+7vzYNjmkElkJRzGivN6X7yaPEKRGIBJiHjKrcs+8fXWeA5Y
	uISgZZoBHVdCVla/GjlvpXYBMAYZ8eSbDW+rbFNfVSP91T6DqR9teQ1zDKnD1aHbB367YkCCLMG
	hw3XIDwRWGDoDZxqUGrv9TVF7RdQs6uAzoEg=
X-Gm-Gg: ASbGncs2xXTFa2x9QPJfC1CO0uQ4apHgBVPMD7yzbNpCHQw7Iue38wO21wBcBjfrDk/
	o+c1Vi3U5YZ+gUDNrbZHSzTJUgkNSFdRHFdb+KCxnc33IVjZ6f7f5kqsNv/+e
X-Google-Smtp-Source: AGHT+IFp8XCFg1lEU3e1fi+fHUhDavDNkEfjadO/eMfIJfRp5lhMaScdyBmt/tCjFNB2PINDghB3+C6LC7IZg7++n4w=
X-Received: by 2002:a17:907:3a57:b0:aa5:2bab:69f6 with SMTP id
 a640c23a62f3a-aa639fb37fbmr47238966b.8.1733440690804; Thu, 05 Dec 2024
 15:18:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241202115827.50388-1-mripard@kernel.org> <CANDhNCpTnc6=YkjQgQngRCw1_xLWgOFrcjTxrrGX+bRhvGb5DQ@mail.gmail.com>
 <20241203-cerulean-ringtail-of-speed-920c5f@houat> <f6412229-4606-41ad-8c05-7bbba2eb6e08@ti.com>
In-Reply-To: <f6412229-4606-41ad-8c05-7bbba2eb6e08@ti.com>
From: John Stultz <jstultz@google.com>
Date: Thu, 5 Dec 2024 15:17:57 -0800
Message-ID: <CANDhNCqtMUaO4Y_7UYGJebDEdN==vTAQRexuuek5SZt5rqd8sQ@mail.gmail.com>
Subject: Re: [PATCH v2] Documentation: dma-buf: heaps: Add heap name definitions
To: Andrew Davis <afd@ti.com>
Cc: Maxime Ripard <mripard@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	"T.J. Mercier" <tjmercier@google.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-media@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 3, 2024 at 11:04=E2=80=AFAM Andrew Davis <afd@ti.com> wrote:
> On 12/3/24 1:44 AM, Maxime Ripard wrote:
> > On Mon, Dec 02, 2024 at 11:12:23AM -0800, John Stultz wrote:
> >> Hrm. I'm not sure I see the value in enumerating things in this way,
> >> it seems like it will be a nuisance to keep current?  Maybe something
> >> like:
> >>
> >> On most systems the default cma region is named "linux, cma" or
> >> "reserved", with a few exceptions:
> >>      - Allwinner sun4i, sun5i and sun7i families: ``default-pool``
> >
> > I'm a bit worried about doing so. What if, on a "linux,cma" system, we
> > have another "reserved" heap created with different semantics?
> >
>
> Having the "default CMA" heap get its dev name based on the method that
> created it was arguably a mistake made when first upstreaming this heap.
> We should fix this, then maybe add the old name as a link just for
> backwards compat as needed.
>
> exp_info.name =3D "default_cma";
>
> All other CMA and carveout heaps will have names based on their
> method of creation as there may be multiple of them, but there
> will only every be one "default CMA" area, and its heap should
> be named to match.

This seems reasonable to me. Maybe putting the link creation behind a
compatibility config so they can be later deprecated?

That said, while I understand the impulse to want to fix the heap
names so applications can depend on them, I also want to caution it's
a little bit like trying to hard code eth0 as a network device name in
your scripts.  There are too many potential configurations, and any
fixed mapping is going to break in some cases.  I think there is just
going to have to be some (gralloc-like) device-specific configuration
glue to map a pipeline/use-case to the memory type (similar to fstab
for filesystem to mount points) in order to handle every case.

So if I'm being a little squirrely on fixed names, it's mostly due to
wanting to avoid anyone getting the mistaken impression that fixed
mappings will generally work.

thanks
-john

