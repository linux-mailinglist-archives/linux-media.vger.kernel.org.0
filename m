Return-Path: <linux-media+bounces-57719-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLJaAEtzy2k3HwYAu9opvQ
	(envelope-from <linux-media+bounces-57719-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 09:10:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 27253364D2D
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 09:10:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 12E32301CEC9
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 07:08:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB5F83BC672;
	Tue, 31 Mar 2026 07:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q/Zj9uo+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01583590A9
	for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 07:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774940931; cv=pass; b=d6e5nC9N3SuGL3YR/hQBvPswkrnUFvfD8/Ak6K+uUfaZdIpMbC2tuSDTvfyxgL0QbyPIZx585AnJnyMZuqSfcU9WpsIzlNBD67dVEFJJyl7eJn9MG54/B9S8Gx6k1z9KJE74Q2mkPGCZrYGgoWr0r8vB21dh9qI8Kg2A62mDeqI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774940931; c=relaxed/simple;
	bh=dUmt8meN/c5qzy5lFr0nV8aXowqm32XSpnxoMdBrVgY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UFvzaqaKnODrFudPh60CLp3NwSvGcWDQC7KFFW4c+12wTZ6mce6m4f58fOJNtKenWCbKnnnktg4xmcdNeLYYoOlx6up4S65Wh3s0HzKOdnwQcwADqGE1j4m/h8LATgkA9dUiDxr0vFko3jV8y4/x7B+LJL33OIS2oVkVIcfNAVI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q/Zj9uo+; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b97f9587e6eso805194066b.3
        for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 00:08:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774940928; cv=none;
        d=google.com; s=arc-20240605;
        b=KgAaqaZ+bPetjDnlS4Gxb6LLMwo++FV1yILO8wmtpEWojsvEabEmHwYsnEQENT31+M
         bwWHPCZEJnfG9neCROmE/N6h+IFwxJIqYrUGw+PmItVvrhcoQufoXDW/PVJ2yxWnevb2
         HkKMmn6AQ0n+LWPvQkbgMkA2QYVRKk/N5chhmnqcwaNm+SlgCv+lRxmNOSTkvFP4rtEi
         uztHIpPFkmjsJUKFA3bHHzJYK5o6Se/q3/tqjsNKfYnZ1vdW6UZ2RScJ3t5f8O4AiiUX
         cNe03Rufe+hKLwLQvCCtSo4CjoxRFmwcFQMpja5UoTAR7Es4Wl3YuDBQhk1JpdvHVW73
         TrMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dUmt8meN/c5qzy5lFr0nV8aXowqm32XSpnxoMdBrVgY=;
        fh=9jkkSC1CTOMe9uWty/cr5m7Is0Xn/gV6Ld2UUTJ74u0=;
        b=TD45fjxmsK1cnB3hvplyKx+f0lcUvYdG8mNaBhbOz9E8DNSuTqgg6u7X+dnto4PZgM
         lqTe1tIfiOwObgO5CCj5SwZYb0Bep1XMR+YX0FYO4rKPiIV2C7XuaunVyGemyCDxNG96
         Jgg3JVTUkdzftsQziw9Z02no/gw4chImsBGDv5gN1SeqehLh3UwibhcPz4r91IvnHskw
         I76CyAoc4IloP8PCvUYQeDOjXihMH4M5AwmdIfyBwcrpUzCl6pMKfbnO47qkL6B6wKr0
         Mf3U78uQ1+lhLrJby1p+oY++SxNb/y0yrSR0LLjOxAZB57WTmldbjGCz+CD6l0I7wXSV
         cnEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774940928; x=1775545728; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dUmt8meN/c5qzy5lFr0nV8aXowqm32XSpnxoMdBrVgY=;
        b=Q/Zj9uo+OAvdPPy/ZcXKyQnpUHC8x8wu6AqTA3LFg714x1ON0PtMU5k+gqj1hj+m8m
         PbB6rN0cjvH+8Ypqt3VEEjJ2yeFuRbUc/nZ/OBlFTkfe3T8gCm3QCjKpfYLq+6KOGhZL
         koJe640/x9PBpINldV1f9fzeFiHy1oXtplbBS4d1auKeqGGGRfnQCrhO6kT73mYQLkh/
         uLaxt8vZD5G7nf2IcFVDOwJ8iyfv41Q1b/mV0zm1c20962Jj4jsLyu0941KM7tlkHRL7
         c8+M43/xqTuEzlvR+ERFmX1eao7B/lJLERhyWMvg6t9VA7J2AvDwc9aHBnyGWnwK56jI
         6B9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774940928; x=1775545728;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dUmt8meN/c5qzy5lFr0nV8aXowqm32XSpnxoMdBrVgY=;
        b=ii0V0WFKpJ0RcKHGs99uPO5XySc+F+TV4YUBZ0cXdF3ME0k3qHmN0j5uTrQ8NzGCvA
         n6SrVOKWgXWGEzKqks9fXKSjp5oJRqCd7BeGdr5t2G8p4Vjt9OjE0UF+mjEtHSSVEKnP
         Vb7KUGOd5N5gYxdPyRyC1wr9BORBVvk8ONQBY3cfmkHpq2sb2EN4vMFLMjdyrKSP5/Gv
         XHd5wMjoGL4YVGO3oUZxApuw4jPzihPxDuUFCWLZ5lcP9osl5yhXzR+2XpJD9SBF8Lv5
         K6SSGgkpp55E2mzJGrECdi7zlWTcnmQgjHAyk4at6NhMw/eI9pCOgQ7Ma4tserFHWcBT
         ruyw==
X-Forwarded-Encrypted: i=1; AJvYcCVzdTKmMMzPj9eoewgHecXea+XGLU0z0Z12eKXkpguGp7Q7dR9dj1UYf9g+F8GBDETCBLnWqFc5Uhglng==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzbe9CpZDpd8Ro0opLKV1r6OGfncR9ihlVnZguFZ7Dzk+FTENDP
	JAmFHJuaTmCOgRMgY3Bze0slB3DKwTK252WtkgGtTpYOIMiaQCfsZzkpU0ZigxBTdpEhPXkb8TX
	/kRMqxCVI4sgHHradATgQCQR6IOeI54o=
X-Gm-Gg: ATEYQzweE4PLg7Wb0HDLW6H5hMXEppM0klx5AL8qFl5tf7anajJuqbgcV9/LKisUu3q
	Z2YwhiB1vr2cma1ythyvcz8DTI1kuydoVuLAL+1f0nvktDmUTo1nvDdioDPn7KvLMFCBKb34pXX
	5y34Kbfc2W8nL6GWHtlGdghtup/sZdLojI0mqirEtVhGvAomhEDUjCnja1vwtroKQJYrXi+ulxx
	foOZ/QCLc2iubIcpRXNlzCyXhC8455pvmjccCLJxj9eZf4HAo5/JLr/1hQgH1X9xgm1jFOoo9/l
	5aZRcGQEcNsmUT39xi5uK9Td8H3O3X8gjQ34qXKZ1gSrKQH7+f5UmQ6BLlFIjM32ogHcqgCm5ih
	8HfywihE=
X-Received: by 2002:a17:907:1c9e:b0:b98:40f3:47fc with SMTP id
 a640c23a62f3a-b9b50169017mr952031366b.1.1774940927909; Tue, 31 Mar 2026
 00:08:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260328192721.255493-1-azpijr@gmail.com> <20260328192721.255493-3-azpijr@gmail.com>
 <CAHp75VcOi_fhSGnYn0KzsRMdSFmFhzc1kzesW52XEQVJY06ndg@mail.gmail.com> <actitevm6DKddeWS@gmail.com>
In-Reply-To: <actitevm6DKddeWS@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 31 Mar 2026 10:08:11 +0300
X-Gm-Features: AQROBzBhgO6AYPbDodnfx8O76GNHhrFGbfX-axWRKmTMIZ6MM0GoHJ3Gt0op-MU
Message-ID: <CAHp75VfPir-=vS-UMJNp09cR5xk-6cx9RhWkmG=06K--87TWcg@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] media: atomisp: remove redundant call to ia_css_output0_configure()
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Cc: linux-staging@lists.linux.dev, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57719-lists,linux-media=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 27253364D2D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 9:03=E2=80=AFAM Jose A. Perez de Azpillaga
<azpijr@gmail.com> wrote:
> On Mon, Mar 30, 2026 at 12:01:21PM +0300, Andy Shevchenko wrote:
> > On Sat, Mar 28, 2026 at 9:27=E2=80=AFPM Jose A. Perez de Azpillaga
> > <azpijr@gmail.com> wrote:
> > >
> > > The function configure_isp_from_args() contained a duplicate call to
> > > ia_css_output0_configure() using the same output frame index. Remove
> > > the redundant call to simplify the configuration path.
> >
> > This requires more information, in particular to explain if the order
> > has no side effects. It might be that double configuration has side
> > effects and removal (wrong) one may lead to other currently hidden
> > issues.
>
> mhm... my bad for that,
>
> the ia_css_output0_configure() function acts as a configuration setter.
> it populates a struct ia_css_output0_configuration from the frame info
> and caches it in the binary parameters. calling it twice with the same
> out_frame[0] pointer merely overwrites the exact same state with
> identical values. it has no cumulative state, either does its order
> matter relative to ia_css_copy_output_configure().

So, no call in between accesses that parameter or relies on its state?
With this analysis in the commit message the change looks good.
Please, amend it in v2.

--=20
With Best Regards,
Andy Shevchenko

