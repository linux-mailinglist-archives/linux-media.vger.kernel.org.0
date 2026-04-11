Return-Path: <linux-media+bounces-58593-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEggC2OB2mlC3QgAu9opvQ
	(envelope-from <linux-media+bounces-58593-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2026 19:14:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A123E0FC4
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2026 19:14:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6AE0E3010261
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2026 17:14:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56D5A3B9DBA;
	Sat, 11 Apr 2026 17:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C4JSiBBl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BECA3B9D84
	for <linux-media@vger.kernel.org>; Sat, 11 Apr 2026 17:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775927642; cv=pass; b=KgB34GV18pz1n7VVfZ7wwcL/SefqHqx6OXN27BoEScOwfvzrD6ODOFrUqk83Ouq0ZUydiWqOXw6YAI+b8FCgJkydTcUOICkILZUBNIKNsyYr5WWTJnbSsp9vOw3rNy4fUa2co4wRyjsovujf4YCo0xbn3fnurdw0Yy2hBMLOVSw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775927642; c=relaxed/simple;
	bh=CuOrpIa+6SHU5p2bWRfT8xZ/Hmi+guVdnfGSMrmhCxQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XMWFhqEEldSvFD/uOO0e1lpEzeDa6/6BPBH2rlDMbtyOAz7cjDrn9FoO62OWH0tCH8pTW6A8tMUWXulZGMKAivTjUiTlrJ+kJtlPN0Nr8WLQJH7Ae/64qTFsdtBnaqp/4m2iq/63R7Z4oII9xS5gn2RdpnSKTKhmcaMKmrGBJz8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C4JSiBBl; arc=pass smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-79be0de8610so29786877b3.2
        for <linux-media@vger.kernel.org>; Sat, 11 Apr 2026 10:14:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775927640; cv=none;
        d=google.com; s=arc-20240605;
        b=k9zG4J+BBoBFoyat96ShlhqYC08M8NMwxnugVz0fe9TxvV4clZy2GUMg0X/6L3DtKR
         rTELF2xR25ky43tHNk54jsoTviIfhUXJjcuLOgHpIWv2Fk5jFXdaIRiAjZMnMbrqZyJZ
         d6uJSz8r/6VK8gP+VwIviziKtNuLNL0DBFxkQdHqioDnNbaFv6UCI3LFj8d38oOdne8j
         zi3yIqh0D+bkCKRGKj+lRCIKv6j2fTQvOUuqoFwV8G6dmu1Hielmw2LgMqdKGJANh62o
         xv9g7kxUVvRwQnegsKDflj15DNENqDmHQ87al1WJIXKswW/gzHf/o4idZIXIdhi1ADmD
         W8Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QN3ph+rJ2Hq6R7ZAU5OE19GiG1+NPfYTXZ7jwsrW8O0=;
        fh=YnHpO+xgjBrVzd+rVzRfdcAfblA+qT4dz4QZF5b1zuo=;
        b=XonAwynE51LpsSHxHea7sGQDIhstYg++H+VUi7uErAbeVEtUBXTV8WAYGh64XECZXr
         9HktAu2WEW+GaUTjNR1ae+EHEFjAAznBBpCY+2hYSCvsX0EvnSA/0P56XwKfWsXZ36DX
         M3QeCqHGLzK6mWFeAwBSHY+y7uzy1XuhjzbEzamvG21r6rYmvDivBAcpwhADDJHJtbmV
         imlkRKWm2bEsRow6mU1IpQ/l7bSO3+oQMG2o/9DP0k8Rb60jjP1FFBQYKvnOvkGQskv5
         jTdTz88OvLU90GMzFqNYEN1S/M9NPzaYwoqbh6LmbetdqeCeLSlWdjO1NBWpcO4xOO/5
         +afA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775927640; x=1776532440; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QN3ph+rJ2Hq6R7ZAU5OE19GiG1+NPfYTXZ7jwsrW8O0=;
        b=C4JSiBBlLtKd6eG8rmk4TrO+0Vt4MnjWftl3knPyyxy6M+68Tohp/2Z9nzNIrXNdPR
         WF6s43cOcFAJaAtwMqQve2lJZLXITotZoVizY58Qhe4dhRkebRd5NpxzplROAbg17z2R
         3EiWNEIXFlQvDge6gz5iUhrC/ON/P9BtGWfwTQVZeDgo3hESnj808GabnODbNUxDVBkq
         qY3h0KJA1/oM/qJ4oWePqQxERbwen7kZkBuY/9vnXAOi1YTGsJQR49so1we49wY6T/5Z
         TnO/V5srovVDuk+OC/Jz9ep/JXA4MDybVaxd/fysAvKUdzWh0Pd75yQZK/n15dodqLsb
         EtTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775927640; x=1776532440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QN3ph+rJ2Hq6R7ZAU5OE19GiG1+NPfYTXZ7jwsrW8O0=;
        b=j5KRLHAfmO/dusJd1xhNgiQYaPh4cAzbYtpZ+IBmDtoHJR7BE9a9EkD4SQ1CT2mshw
         S1kj4e6f/KFUHiUdAf7jVCOq4i0CYds3RFU2MrEEqP3NG+e9HZ3ymoLh14dgJT6BvHBf
         xyZaRxgD2pvxdQXXGBnf5l8TCMFcDqyvwNh1t6l6VqOJjJKQhj1v93y6K5uB+uBHAbXA
         gAMMiTUgLDZjxKdLoHDPjXCe9bBxm4uwijZZwCScfEKwwdTZSxX1pPQ1y/0Ye140ZrkQ
         q06mi5gEXeElN0IpHcdfj31kTN5ARw973SroOlAYwDFV9eGNP2T743cEqvoGqXXNrHQq
         EYPA==
X-Forwarded-Encrypted: i=1; AFNElJ85m/bi4V46a6Y0gVa6C80qBnDGN7D5Jrk41mOl+ahRY08Av3+rmHSZ93NBBgaMiBhgT3IuhQiLKSHIhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+LCVIut1olgLhrUhh+7/rfkG9oOaF2/tY7n+4qQ9LIv9CfvIT
	tyueomYLD8XA7nBn+uSbD8cm1l+ESB9bkb1hMA62GxzN/vG/ZEgHSIGBx5Yb2Fr42e/J17edL3A
	FZJYxWAWU5YvMrdTUoGx5lSW84bk0KPo=
X-Gm-Gg: AeBDietNNyyue++itVPEkErAmD71wyYxjEFv3QSbgGuzO3Bq0kCFTIs07QHs7etMNod
	7Xs69EZcFas6qf+9mWvs6QcoSSVNVBROT2UBE5vjN2RWl2jZJ13qhuB1Jdgg7wPw8LPgrrwi1wQ
	uQwie/h9SNrWhksmONjofNKjW2xc9WM1bXfG0tfAbM8qOYvbtYKIzEPos3ZsuLtJJuXrq9nngXO
	obhCho5QmX2M0uFVFqby/oi7RBafYyesQiybghFO3eqndDZJ9QGsn66IvaO1Tv0qY0oLtRlclpx
	fO1icuqWrqxPmqSGc2ahuky8zFxmtTucuFsRsRq4uiP1ymgd/pMFx5xAtw3kKhpD8J4ShHx4
X-Received: by 2002:a05:690c:110:b0:79a:da70:864 with SMTP id
 00721157ae682-7af72637e82mr85310437b3.49.1775927640339; Sat, 11 Apr 2026
 10:14:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260411005512.46142-1-mugrinphoto@gmail.com> <adont11Sr92pi0_N@stanley.mountain>
 <20260411154223.3091eb45@pumpkin>
In-Reply-To: <20260411154223.3091eb45@pumpkin>
From: Michael Ugrin <mugrinphoto@gmail.com>
Date: Sat, 11 Apr 2026 10:13:49 -0700
X-Gm-Features: AQROBzCyBmwsMvjQSjRkfrc4MqWnZf8XPyvA6rhHE6cCS4H_9LUOw23qbQ8zwuo
Message-ID: <CAEiYE9hBGiDgP9FmMAuU0qyVygmwU0FrxVGcuy5g7JLO4KWMLQ@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: fix indentation to use tabs
 instead of spaces
To: David Laight <david.laight.linux@gmail.com>
Cc: Dan Carpenter <error27@gmail.com>, hansg@kernel.org, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, andy@kernel.org, gregkh@linuxfoundation.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58593-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linux.intel.com,linuxfoundation.org,vger.kernel.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mugrinphoto@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A9A123E0FC4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thanks for the review, Dan and David.

I'll work on a v2,replacing the ternary with umin() for that strscpy
call and the other strscpy calls in the function.

The larger refactor to eliminate the stack buffers and build the
output incrementally sounds like a great improvement. I'm a new
contributor and that's beyond my scope for this patch, but I'd like to
come back and tackle it as a separate effort once I'm more comfortable
with the codebase.

Thanks again for the guidance.

- Michael

On Sat, Apr 11, 2026 at 7:42=E2=80=AFAM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Sat, 11 Apr 2026 13:51:35 +0300
> Dan Carpenter <error27@gmail.com> wrote:
>
> > On Fri, Apr 10, 2026 at 05:55:12PM -0700, Michael Ugrin wrote:
> > > Fix whitespace issue where a continuation line used spaces
> > > instead of tabs for indentation.
> > >
> > > Signed-off-by: Michael Ugrin <mugrinphoto@gmail.com>
> > > ---
> > >  .../staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c  | 2 =
+-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_c=
ss_debug.c b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_deb=
ug.c
> > > index b411ca2f415e0..966d4efb200c5 100644
> > > --- a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debu=
g.c
> > > +++ b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debu=
g.c
> > > @@ -1257,7 +1257,7 @@ ia_css_debug_pipe_graph_dump_stage(
> > >                                     p--;
> > >                             /* Last comma found, copy till that comma=
 */
> > >                             strscpy(enable_info1, ei,
> > > -                                        p > sizeof(enable_info1) ? s=
izeof(enable_info1) : p);
> > > +                                   p > sizeof(enable_info1) ? sizeof=
(enable_info1) : p);
> >
> > Better to use:
> >
> >       strscpy(enable_info1, ei, umin(p, sizeof(enable_info1)));
> >
> > Same for the other strscpy() calls as well.
>
> Or refactor that code so it doesn't use 600+ bytes of stack and
> lots of scanning of long strings.
>
> From a quick scan it seems to be generating a string of xxx,yyy, with the=
 ','
> replaced by '\n' to avoid anything longer than 25 characters and at most =
three lines.
> I'm sure you could write and use a function that lets you have a lot of l=
ines like:
>         offset =3D add_flag(info, offset, bi->enable.reduced_pipe, "rp");
>
> Oh, and none of your char_enable_info[] arrays are guaranteed to
> be aligned either.
> So all the snprint and strscpy calls into different buffers are pointless=
.
>
>         David
>
> >
> > regards,
> > dan carpenter
> >
> >
>

