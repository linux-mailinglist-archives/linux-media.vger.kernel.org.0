Return-Path: <linux-media+bounces-58057-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id rqrDI3V20WkvKAcAu9opvQ
	(envelope-from <linux-media+bounces-58057-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 04 Apr 2026 22:37:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E97F539C689
	for <lists+linux-media@lfdr.de>; Sat, 04 Apr 2026 22:37:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BEA72300B777
	for <lists+linux-media@lfdr.de>; Sat,  4 Apr 2026 20:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A196330315;
	Sat,  4 Apr 2026 20:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l3FQuFtH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F1B12D1F1
	for <linux-media@vger.kernel.org>; Sat,  4 Apr 2026 20:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775335024; cv=pass; b=k5lbDrvh2p9G9aOmqBnQG3uvNMbeEtJKLd6KQWU3elhOjsDubltUZs+IVeRqxIVnTlF5+WuqqU2/r9rxqO6Ea6fNNCYy3sEnSWOtWwsW0cujrpNxJ2br2c3uyylbHsFJTLg/Xkpmr6lthb2BQCpxvlFS+loNdl/DDA7F5jJ9UVE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775335024; c=relaxed/simple;
	bh=lvfq5IAu74hKBO2NtIfsV8+BA1AdPyTsV4IGi3Vk8EI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tg7Gmxxy2DCi/WLzPWnwDm0nmd6Bk+nlNHkyplBbH/t1BUWCKuGg5+43PJXHXIsHvxDz5vgE0x2HMechBqCxek6qq8PayOAv/8nZg80H+ZAYgZ+xciY9hA6fOgE1s+Nfx3Xkgk5Iy/merQssBNwD6QNZ3/2gOz+LTXDaeUpU+c8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l3FQuFtH; arc=pass smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-605a3cff8d0so1410901137.3
        for <linux-media@vger.kernel.org>; Sat, 04 Apr 2026 13:37:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775335022; cv=none;
        d=google.com; s=arc-20240605;
        b=XPDDRO07NLvblw0bZU0yT1Wo2yKEhRua17iqfziOOCvDwd8pqWGG+kV9rNecL4EJjJ
         ccbQsEGAoPlzzk4hr0FX9pQ3deYyNgRaJudHHIeyBwTrU8YVKgStrzhQE+L8ZFpbYgKL
         h9/xkv2dXVAdZePEmEPDtsqEGBx8jJEPNItythn/zNp5s55ay2+bPo4zpUkBZil+HPri
         pKN1WaPvPZTjma5Tmf6SgUkLVHdrBPDZ1PosXo9bMZhIqVzogfzxjU3ksFlAjlFKIsg9
         mEiqWC105e04KIewydJBt5qWEgFKxVrP/9GNK4B8lkkK0dVuM5fhRHA7qRjuCw/29MYh
         x30Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lvfq5IAu74hKBO2NtIfsV8+BA1AdPyTsV4IGi3Vk8EI=;
        fh=VEFzq2RlFqJLoQqyFgtZ3VUAps9ojgzfQ2dgix4luaw=;
        b=UTCHxVe+XVS/4xy2w307Aq52kcBK5w6GXa8sNhw/8no+zEdxveczgqIbrN3PJez0j0
         R6kox/8AD0q/PIjNYYYL2kc1mQkoZc+NpNwLEwgyzKZ2BtXNXIqqfJgXe3DgnyP8rurK
         iNL9AD58KZCIMv1bFqh5Ts0A/qj99RowH1SyGBVQqd2YU990CTg/wrJA5vtHNv8dvHpV
         c1j/ARRgi3LP7w6YT5GXERNPqbyED64Kcx7SY7rqmbpvEjvOohIQ0MKa9NsXCw1y81Cu
         aXkdrEysiJAjbPOeSP41n1gwsJx3o/p2+p/GTOOnvX8CqrLf7c0UHSjWjUqwrsPrpX3P
         qEyw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775335022; x=1775939822; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lvfq5IAu74hKBO2NtIfsV8+BA1AdPyTsV4IGi3Vk8EI=;
        b=l3FQuFtHYm0mJYkFvj4s+3EGm4ldXEXg9D7/XpH2mhj7YMZIeNP2z7uHg8njG1n4M3
         fTP/sjoR94Uw0Ry3Z2/0ZJ5+95qPvTg5aIbSHHLywsKrj9qBF9ZaxIM49Sc8eDzUEb7M
         kAMIJnwHCLt/L5107WPl3dOFToVxK3phde21+WC7BzuEp3T/DlfVLGOKFtokNJuhHEzD
         6EPzqWahmZ9BuaDCkcOMP8mCMlo80Rx2f4VQz1ZyZVW0MGdz9ky87gNMoY2QTNz+Bre1
         wy3YlM/BIz3o9PvkvUgyWn+1XnpOwpRgDnFKMVMF7y5sN/HW6VE0nx5Rqxzw3HD4an77
         /eLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775335022; x=1775939822;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lvfq5IAu74hKBO2NtIfsV8+BA1AdPyTsV4IGi3Vk8EI=;
        b=PhayUaKw6ZVsnvQfTcKOIx2kmiGYadS8eP7BXs8nyn7b+gMZuy95svGWNFpmmtPV3+
         FIHF51ol4M9KnB0CbYkJeEP9hkH+BV1nnrMKuEG1ijcoaY4q6JAATQBYK/kU1TbJKj1f
         /rzM6r4uenWHKDY7r1QVPPvnKh5K1Y3/0ktlEgfWVzeSoVAmBWrpBeVc541ref15dUBn
         Qq5HBJr+V0eN0hQOG9Wdbb/FrSAV2waCFbxMipPDsQssSYqHM0W5Q2x0tahD0xSpie0a
         OJPQEEo9t8RPcbKd+xvDbjJgu+Y6ut1oMHXhZKoAszYoIvCzYqJX0N9isEqKf6ju3gmT
         f6Ug==
X-Forwarded-Encrypted: i=1; AJvYcCVr7MT57Icv6SQbrSeSnks2DOjxAzyWTz6kFZvC6jDDPYNa7Pkna9pFBVI5tf0sJSyov7CYlVCeHcpjxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxyi9y90LdLjPggfMVU0faELXouci1F1064F9QGO5gjNCgGoRg2
	NlEZSAqbiCl8y7i06NBwHZsF3kn9nikq8wUdx1nn4l+Dmwe+U0SbJBrV/HtnWHYLPx7JDhvXLIC
	lCmAlcAUotA69AJRBkalSzV4nglPjSA4B03KPkqhBQQ==
X-Gm-Gg: AeBDiev7QHdLjesQVaqKq/fqvd3o6Dku/mJ4PoBbJXtvh6I8HrfHRxytkd0jEvgUSjj
	CK0tUDZ1UysYSUbTfvPvgrkU9+2d57q3XhufClrqL4s6vcIhEg8Qm8VrJa7JVanY4bZ8CRXuPrl
	xgmh/Ot9LonTRRsBPqYz6tFtKyr0i2KhLYsbJbfc48ywC8MoinkIG9Hy5tqd+46W6J2ggAvl/4M
	hhVylSA3W5TSsrNGdgqAjyaxBROUaiQwQuM1t75s1wz5yv4yZkWO8zz+Y5GKkKHhrAms3G05ZC1
	xixJaxgU5VSYWRrM
X-Received: by 2002:a05:6102:26c2:b0:602:a80a:4d58 with SMTP id
 ada2fe7eead31-605a50d70demr2815538137.26.1775335022192; Sat, 04 Apr 2026
 13:37:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260404121701.47745-1-bulgardaniil18@gmail.com> <adFro9mJzfSJbbWL@ashevche-desk.local>
In-Reply-To: <adFro9mJzfSJbbWL@ashevche-desk.local>
From: =?UTF-8?B?0JTQsNC90LjQuNC7INCR0YPQu9Cz0LDRgNGM?= <bulgardaniil18@gmail.com>
Date: Sat, 4 Apr 2026 22:36:49 +0200
X-Gm-Features: AQROBzCzSDjJrJZmLd6wsMupRBuqKKDmYzcJBx61jlUWPV9JYsfKHJaTa3ah_wE
Message-ID: <CAMPU55jeW-7X6u-0nCyYq_p5XneN4z6URLdCBnCd-B+YRUuxXA@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: pci: cleanup and refactor
 tracing functions
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-58057-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bulgardaniil18@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,intel.com:email]
X-Rspamd-Queue-Id: E97F539C689
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Andy,

Thank you for the feedback.

I have fixed the commit message formatting (resolved the 'shorty
lines' and improved the description) in v2.

Regarding the removal of enter/leave traces: I have verified that
these specific logs did not carry any dynamic data or state variables.
Since the kernel's ftrace (function_graph) already tracks function
boundaries automatically, these manual prints were redundant. In the
remaining logs that do contain useful data, I have kept the
information but switched to using func for better maintainability.

I am sending the v2 patch shortly.

=D1=81=D0=B1, 4 =D0=B0=D0=BF=D1=80. 2026=E2=80=AF=D0=B3. =D0=B2 21:51, Andy=
 Shevchenko <andriy.shevchenko@intel.com>:
>
> On Sat, Apr 04, 2026 at 02:16:58PM +0200, Daniil Bulgar wrote:
> > The current tracing in sh_css.c contains
> > ftrace-like enter/leave logs that clutter
> > the code and provide little diagnostic value.
> > This patch removes these redundant traces and
> > updates the remaining useful logs
> > to use __func__ for better maintainability.
>
> It's too shorty lines.
>
> ...
>
> Do you have output before and after to compare?
>
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

