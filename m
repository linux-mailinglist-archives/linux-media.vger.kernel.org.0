Return-Path: <linux-media+bounces-66942-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nwbKH2a+TWrN9gEAu9opvQ
	(envelope-from <linux-media+bounces-66942-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 05:05:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C37721498
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 05:05:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Z8Ec5u2t;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66942-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66942-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 86DE73011A68
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 03:05:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8279C2EBB9E;
	Wed,  8 Jul 2026 03:05:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D896D341ADD
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 03:05:02 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783479905; cv=pass; b=KWNXFJ3xdipKnp7eyRbKn70ga7L8TCJE5ruUESNxhbiGiXAwua0nYkeYn8+CXrI1qC/juBSG93B035VSPbzj4XLXDA+6bEUxmYq8SGZyFbkhLlGFAI/qTyIugt3vJYm+inucFNoJA+exxfx5PDMn8uuYo/sEB8sMDrwMlfs4OQs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783479905; c=relaxed/simple;
	bh=chsPa3PrXAEUEgzR2gIA/zhhWCOgC3uVGg97PvuoFgQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UyDiNkO9b0FNteEmzU37wrnLkGpoS5G6YJgD2x7iTz6Nl90hjI61C2LMSAKKXXTmpitWXYiTlcixA/RdFZZlF5JxY0D0qbl0aPblUSiCiMOeD9Gv4VusOKjx9XEe5EcVV4tsyrvLdtaUxVkFDxkcM8wG7enZHYEWap1SjAwid/g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z8Ec5u2t; arc=pass smtp.client-ip=209.85.167.171
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-49429feeceeso47492b6e.0
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 20:05:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783479901; cv=none;
        d=google.com; s=arc-20260327;
        b=isW5Wvnpwin3L0+AZbxV4qgJOazPw5m8R3oUWqUOMTiD2J31/SRnuNOlfH7ZJiHzie
         CZiqh+31mUq/1qdW17YD91631tv4v7zb6oguAZuMDF8ikNsf0NeREGYPXmZ+VbgsBzKv
         HI4iIdvLfTxuEwnCGuMi9HEe0VY3m+xQ4dMpSSyjx+2/H9I6ZcfqUEsOs+ufHungSEmb
         rnlh1dQU6RlVqyVeD1eSTZ7paemMtJ+mqn4yzJZpqWmb4ScYbNUHYhZ2z7X43EOhBv0i
         13fB0mm5O3wdhY1Wgy9YTWMrTtIqJlja571aEfFHwJpOrzLJaLTtVhs2H71M9RRLwSh5
         w4CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t0Oxs6yifRrQtckE7lh7MhuoDMg5v+QCzZUpFln4pLs=;
        fh=yZOeUULq0p4+tLJ97vKA6rF1mo3wnLRJvE//UdIquYs=;
        b=fEeQgOcrxN7ePfBNy4R/m2iY2QNm7ZO8pLRjyxKp/eiLUrnWWiSN27AT0VG10CV9cz
         N1IRQKsLqoU3yw1sDNGwjme9yS3HpiNbqGESC8Rc287NHunYzxqdSgIqehwuzV146MPg
         V1nIthBkqxN3fFPzvjBgvNg8scDOZNhLuO6LpVbCwTdzO39JTBixqrHGkx6nkCEoeFyO
         OrQ7X9GwKZrklwSCJOiTpBBa++XLroQbouaZE4BGV/1elqqArr8CZRyW35l2BP4TWw6y
         Oo607QMQVXQEpo5YS5J8xDe71wQrgXfXTlIG1I3tabHT5PzcNUvOM6KRpf1+Xk4OIFUp
         3Bdw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783479901; x=1784084701; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t0Oxs6yifRrQtckE7lh7MhuoDMg5v+QCzZUpFln4pLs=;
        b=Z8Ec5u2tbZUolHCwPYe+xDoF1R1Vn3tQ+otPwlbQ3ewTL/UG9KCi2QszLM/jUkGXYQ
         VTLl/33CwDDqUU0lzg+IsUCdhvX1YVyuU3NXKBXJwSSCv+rp2VUMR9GoUllC25ptNQxn
         1j/fwBxFvk1X9SCc0nMtCZyfnn0/eP5GiTLYX/DWDoj/KGdtX569jOE8fJ6JGJwBhOtc
         1uBqn1Ng2rlSdk1sNXdpPm+7Llb2PaFuq/ZyZSleoynhBOo4tNqh78f7Hzo7qIHsgWmA
         hqA3oh/+rb8zLmEzAIR13Rdcktd9hlV6a2g8ZND05P25p0A5RsfUNlIiyJF7JvdCs02p
         CnVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783479901; x=1784084701;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t0Oxs6yifRrQtckE7lh7MhuoDMg5v+QCzZUpFln4pLs=;
        b=rkaTsILkC0C0afgArMQIibmlQtwxAXHGWo79/4mIdx3pCIIjMY+kBx9PLxKK/dfZRG
         tVLbbfF1BF9odwL106ERDXkqY/Af8aUnA7+lQNr2S+tnQOTBlsBLPdo2ZAwH51XWQ3Yg
         qrh1LjFNtkfFZC8cbvwClgIYbtwphrNla3YgQMXDozjWW5GUNmOpwLUqlmZe5POrA06i
         3MWopfgMxOx7O1iHNJ6tvZSyi1ZffXgxicXNAhvfqap94EdSdoXCloiNwGxIrwLvtkHJ
         u/GppPPes3fNFyNDyOBSO+6cciBMe+nH0a5MeBnl1RZfCzOCse8cjQANdfPCbgkaJ7NU
         S4fg==
X-Forwarded-Encrypted: i=1; AFNElJ+ouXQJJ0U6tqnKwDIcuvrX/0AXFVdb1O8kyb2re1Tm2Jnpv4dzOPeBLxOJXW9rNyxGGPIJmYx8xwY34g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTYwNfKdpBEH8NuVKF3JsFMrgy8DA2WfFJemHwotD/dfJ3WKfv
	oTi3omqA9dpRUwOAN4ZLS5jmyxJaSErWvVmwms2MeFn3510JnCz5a4Qn624VL0nCAl7V1B8UuT+
	YivX5xKXKL0uLNl5UrwJMdFOyyHnluy8=
X-Gm-Gg: AfdE7cm6MgzU9dKaZGz1tX0M5teBssnobfRx2V3JRgr5qjjbGnakAWFB2+1chTEVfSa
	b3paGTr/3kv5i2GY6765texQHwAHWEK82yXjhY0pqlQLISV8DB9YDzOKHnCab3cOxN4QyhPpcyx
	dng4lpGz9OeB1nGybT4ZtH/1dnNOJfX6ncq4ZjibvFmARzfrFDJ8B10cN/3nucHzdRMp2a+i5yP
	skGAbp24Se8Z+nnpeZlc20x295xOT4hFDI6DyAXkaCVPu1rKtzYUYuRGKvVRO3r9lrv5YBY5H/L
	wEjUF+Wep8JraWfQDSA=
X-Received: by 2002:a05:6830:81ec:b0:7e6:6f9f:7445 with SMTP id
 46e09a7af769-7ebcff80811mr293192a34.3.1783479901517; Tue, 07 Jul 2026
 20:05:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706000738.18478-1-nealpatalay0@gmail.com>
 <CAHp75VcSGXC=x3hFXt8qvyRQjPzy3uLN9iBTURp2yA9+P_jibg@mail.gmail.com>
 <CAGjuiT9gu32wvx2Vf0U0g9deyAzzGtwwCNEdW_R4JVarO9x4JQ@mail.gmail.com> <akyoLqy98pt2iRkP@ashevche-desk.local>
In-Reply-To: <akyoLqy98pt2iRkP@ashevche-desk.local>
From: Neal Patalay <nealpatalay0@gmail.com>
Date: Tue, 7 Jul 2026 20:04:49 -0700
X-Gm-Features: AVVi8CenugNcpfN2pyvUXiLwv0I1FUqz1UIw41O-1bzFWgEPuSLhJGSeSI7uiCg
Message-ID: <CAGjuiT82_sXhEQ93FftK60qg20-GC-8q5NRN8Xrif8JVx0KGnw@mail.gmail.com>
Subject: Re: [PATCH v4] staging: media: atomisp: refactor pipe graph dump
 stage formatting
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, andy@kernel.org, hansg@kernel.org, 
	mchehab@kernel.org, gregkh@linuxfoundation.org, sakari.ailus@linux.intel.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, mugrinphoto@gmail.com, matt@mattwardle.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@intel.com,m:andy.shevchenko@gmail.com,m:andy@kernel.org,m:hansg@kernel.org,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:sakari.ailus@linux.intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:mugrinphoto@gmail.com,m:matt@mattwardle.net,m:andyshevchenko@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-66942-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[nealpatalay0@gmail.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nealpatalay0@gmail.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linuxfoundation.org,linux.intel.com,vger.kernel.org,lists.linux.dev,mattwardle.net];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 18C37721498

On Tue, Jul 7, 2026 at 12:18=E2=80=AFAM Andy Shevchenko wrote:
>
> On Mon, Jul 06, 2026 at 02:59:16PM -0700, Neal Patalay wrote:
> > On Sun, Jul 5, 2026 at 10:37=E2=80=AFPM Andy Shevchenko wrote:
> >
> > > Please, slow down! No need to send a new version immediately after
> > > replying to the previous one without settling down all aspects of the
> > > change.
> > >
> > > This version is no go, sorry.
> >
> > Understood, no problem.
> >
> > > > +static void ia_css_debug_build_info(char *info, size_t info_size,
> > > > +                                   int *offset,
> > > > +                                   const char *flag_str, size_t fl=
ag_str_size,
> > > > +                                   int *line_len,
> > > > +                                   int *num_lines)
> > > > +{
> > > > +       int len =3D *line_len;
> > > > +       int off =3D *offset;
> > > > +       int lines =3D *num_lines;
> > > > +       int len_written;
> > > > +
> > > > +       if (lines > 3)
> > > > +               return;
> > > > +
> > > > +       /*
> > > > +        * If new line length exceeds max line length,
> > > > +        * replace the last ',' with a "\\n".
> > > > +        */
> > > > +       if (len > 0 && off > 0 && info_size - off >=3D 2 &&
> > > > +           len + flag_str_size > ENABLE_LINE_MAX_LENGTH) {
> > > > +               if (lines >=3D 3) {
> > > > +                       *num_lines =3D lines + 1;
> > > > +                       return;
> > > > +               }
> > > > +               info[off - 1] =3D '\\';
> > > > +               info[off] =3D 'n';
> > > > +               off +=3D 1;
> > > > +               len =3D 0;
> > > > +               lines +=3D 1;
> > > > +       }
> > > > +
> > > > +       len_written =3D scnprintf(info + off, info_size - off, "%s,=
", flag_str);
> > > > +       *offset =3D off + len_written;
> > > > +       *line_len =3D len + len_written;
> > > > +       *num_lines =3D lines;
> > > > +}
> > >
> > > This makes helper too ugly and unreadable. Again, study the case
> > > first, when this can be true. Do we really need to cut it? This whole
> > > thing AFAICS depends on the dtrace facility in the driver. Is that
> > > HW-related? Is it pure SW? You need to perform some homework.
> >
> > I've taken a look at the driver in greater depth. The flag wrapping
> > functionality being refactored here is used to construct a graph
> > visualization for debugging.
> >
> > > >                 dtrace_dot("node [shape =3D circle, fixedsize=3Dtru=
e, width=3D2.5, label=3D\"%s\\n%s\\n\\n%s\"]; \"%s(pipe%d)\"",
> > > >                            bin_type, blob_name, enable_info, blob_n=
ame, id);
> >
> > Each one of these calls generates a node in that graph, and the content=
s
> > of the node are decided by the flag string we build in enable_info. See=
ing
> > as we are just collecting debug info and populating a visualization wit=
h it,
> > this refactor seems to be software.
> >
> > Seeing as it's unlikely that every flag is enabled at once, and even if=
 they
> > are this only causes a slightly more unreadable graph, avoiding 3 line
> > truncation seems to be the best option since it leads to more readable =
code
> > and avoids omitting information.
> >
> > Additionally, len > 0 && offset =3D=3D 0 is an impossible condition und=
er any
> > feasible helper function use condition. This can be documented in a com=
ment.
> >
> > Given this information, to me it seems like the best course of action i=
s to
> > revert the helper function to its simpler state without line count trun=
cation
> > or the offset > 0 comparison. What do you think?
>
> I agree, just add more comments to the code and elaborate in the commit m=
essage
> the (potential) difference in the behaviour.

Great, I'll send in v5.

--=20
Thank you,
Neal Patalay

