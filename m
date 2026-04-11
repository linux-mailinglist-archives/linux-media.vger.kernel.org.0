Return-Path: <linux-media+bounces-58590-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDtrHt1d2mlQ0wgAu9opvQ
	(envelope-from <linux-media+bounces-58590-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2026 16:42:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A8B3E0620
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2026 16:42:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 62071304EA7F
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2026 14:42:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A97ED38655D;
	Sat, 11 Apr 2026 14:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hJj6EB0t"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2DF38643F
	for <linux-media@vger.kernel.org>; Sat, 11 Apr 2026 14:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775918550; cv=none; b=vF/DN9uZrH7TZQr62l0ATuSY2qANUQOQYEZxkpUsydjAJTvVawKn26yAmQqDo+5WJdeTp8vGq9CvVU/tG3bFsk+bEAZu0TgJ/KwWl31B4ASzew5ve6Gi7nyPQxFwiLhiKG3Kc6l0NzA3rMbHMNbKdzszhae1PGDDeJbBJPrXbJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775918550; c=relaxed/simple;
	bh=2ICVKZ3NpG3PCtlyO0uDpJGbGb04mqRHQYElJUW5dw0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sXbSvJ1YbM+ec6nu31z4M/HeQ6NFNGKXgFmXBXzNNC9s5j0sP1IMPw/kceXRzk40pBN13pXT5FoOViS2Y+guLte6aFVCCuIJO0XQHf5lmwe8AcxOWne+L2BEebSZYd44X6hqWbbpJBGd4G6MaFyjz8Ae9bFFGuKFazxau4N4h2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hJj6EB0t; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43cf3ee0fc1so1861641f8f.1
        for <linux-media@vger.kernel.org>; Sat, 11 Apr 2026 07:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775918546; x=1776523346; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wwDHubDvF2ta0bIvciw+Il/NoP/+nau6OfQepCZXqzI=;
        b=hJj6EB0tNHcEetb4dh/CRgWxM5PhIV4JWsA0fuc8GSpy1WRRFsbROtDmh35gQJr102
         d1RxiK3jWYRrauuT8wDAY9KLQK3NZbLl3I2rBjfJ/ImdwZTLKNsKFLBRDQJwApwZzrcM
         gxCQWX2yre2ELiLpPQGOIMq8GW0th/Nf6fo6liGwH0mIKK8pNx1HAPChiXEdl/TWorEv
         OnTQyGGLCuxsOmAvuR2MsN2U1yyBkivC0L83uBZWRQDW7UlYBsuNiI3bkMji3SdNxBKE
         a+Bhy2bIhSD7A8BaAYdtt3SDpV29Xxs2evDlzu6eQr1nmvuIlY4y/PVvJJ17Nuy+DQlE
         4hpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775918546; x=1776523346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wwDHubDvF2ta0bIvciw+Il/NoP/+nau6OfQepCZXqzI=;
        b=P9HahPZTCbUFbPGoWawVjaBemZjzxKFHBtFIlEr/M7cHiwz4BfioPc9GHHhLt11CpT
         waxtRCAQBJn2HbNyTZhQThZkU+hg/OlSfBQjgxfEJEiE4HIUEBA92IkCcVa35P/Pztb6
         6hniT48AhhMCRoBSUa7iWRX7fask7QRWuConVlrlHhQLNE/fOMOUic0aoLVhxpSV+3vD
         TSi5P8fyxLKMdb9qW9QchTqRWkJFqy9LC+gtET7In/3kYfc9wF8pvKcYs/aNIZ9WZRF9
         4TIUXtVo6tEInwZnKj3VX9xSQ1aaJFzGLVQF7G2TlcIwknfbptIpaM1+c0fl1oekcyxl
         1ISg==
X-Forwarded-Encrypted: i=1; AJvYcCXqR5jJ+GMj0DajfzT1y2svpv/mDLHd5C26dwZaSD/OCbzqpnRi6avx71A6DAEx0C33iD2hWB0x+oKtaA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyjez4o0lSRvU6dAgcwteCfKq9jRDg2az/GfnkJPHLMvO5AmriX
	co5pLMArklaa/Nkk98XninS7tR0z0uIsFKkbF0ZK3iUl155Lcujxc6lS
X-Gm-Gg: AeBDievv1N9/sKdXK5h+H1Z06bQ8LrTL7dWFYv8Ic3mqDKXWaLuIMS71p3lFzwJlylZ
	zdVwkP0YLAxGJbgvfBF0DlyKe0tkabe+zl18yJsKhcdIM/8YQoZQxoqxbRN7417AxSPcQTl6I/D
	eLj9d4Ql/wWyGhmxbw++xeQTp6dMq8l08JKL5ew3D0EkYIAOoASTJI0DbRe5C7PKlYJbMlFOgKb
	9zMUGcCtWSWbrzsDmaRi3LC+iRuhyq1nuW5DxeLQ4i0X8X3gXNvtJgR1udsoj4nfqTKphQADxL0
	magQC/27FAB/S86qj8LQZpqTXqhYJBKMitY2z51Lk7pBwe0mqkBI3rl9eBHDDufurkpIHnVsJP8
	m7rJMXnRVkBUXFd8gGn/Us1EDGatztLYkGpxLrvqDk1Ev4Gev+yI/fymtVZGvDjAWfTRpNWT+ek
	KL5gcxGFMv3gTBzd6ltaXAi8ZVtWXWPw99jp6l6IC3MseQDD/n2cLB8uIcGyVpSfmZ
X-Received: by 2002:a05:6000:4284:b0:43b:9aaa:52db with SMTP id ffacd0b85a97d-43d6497b463mr11027497f8f.19.1775918545737;
        Sat, 11 Apr 2026 07:42:25 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d6ffd3880sm648412f8f.7.2026.04.11.07.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 07:42:25 -0700 (PDT)
Date: Sat, 11 Apr 2026 15:42:23 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Michael Ugrin <mugrinphoto@gmail.com>, hansg@kernel.org,
 mchehab@kernel.org, sakari.ailus@linux.intel.com, andy@kernel.org,
 gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: media: atomisp: fix indentation to use tabs
 instead of spaces
Message-ID: <20260411154223.3091eb45@pumpkin>
In-Reply-To: <adont11Sr92pi0_N@stanley.mountain>
References: <20260411005512.46142-1-mugrinphoto@gmail.com>
	<adont11Sr92pi0_N@stanley.mountain>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58590-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linux.intel.com,linuxfoundation.org,vger.kernel.org,lists.linux.dev];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[davidlaightlinux@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E0A8B3E0620
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, 11 Apr 2026 13:51:35 +0300
Dan Carpenter <error27@gmail.com> wrote:

> On Fri, Apr 10, 2026 at 05:55:12PM -0700, Michael Ugrin wrote:
> > Fix whitespace issue where a continuation line used spaces
> > instead of tabs for indentation.
> >=20
> > Signed-off-by: Michael Ugrin <mugrinphoto@gmail.com>
> > ---
> >  .../staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c  | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css=
_debug.c b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug=
.c
> > index b411ca2f415e0..966d4efb200c5 100644
> > --- a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
> > +++ b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
> > @@ -1257,7 +1257,7 @@ ia_css_debug_pipe_graph_dump_stage(
> >  					p--;
> >  				/* Last comma found, copy till that comma */
> >  				strscpy(enable_info1, ei,
> > -                                        p > sizeof(enable_info1) ? siz=
eof(enable_info1) : p);
> > +					p > sizeof(enable_info1) ? sizeof(enable_info1) : p); =20
>=20
> Better to use:
>=20
> 	strscpy(enable_info1, ei, umin(p, sizeof(enable_info1)));
>=20
> Same for the other strscpy() calls as well.

Or refactor that code so it doesn't use 600+ bytes of stack and
lots of scanning of long strings.

=46rom a quick scan it seems to be generating a string of xxx,yyy, with the '=
,'
replaced by '\n' to avoid anything longer than 25 characters and at most th=
ree lines.
I'm sure you could write and use a function that lets you have a lot of lin=
es like:
	offset =3D add_flag(info, offset, bi->enable.reduced_pipe, "rp");

Oh, and none of your char_enable_info[] arrays are guaranteed to
be aligned either.
So all the snprint and strscpy calls into different buffers are pointless.

	David

>=20
> regards,
> dan carpenter
>=20
>=20


