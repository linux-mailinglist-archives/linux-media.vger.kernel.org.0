Return-Path: <linux-media+bounces-54459-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLgDAesSqGm/ngAAu9opvQ
	(envelope-from <linux-media+bounces-54459-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 12:09:31 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 054571FEB34
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 12:09:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2077A3024A33
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2026 11:09:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 872173A451B;
	Wed,  4 Mar 2026 11:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ICKMibiA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C1F37F751
	for <linux-media@vger.kernel.org>; Wed,  4 Mar 2026 11:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772622564; cv=pass; b=jm7m34T4Hy+PSnfeh0nrvdfCis8NZ/DXKlWmNkvxpcTFC69VTi1qNAf6XSzyX+s0VbrdEh0bw0XIARYEs0skO65WIinBNNMIgLtLYfUeF/60aZQ96GuWTLnJcPuXVpApZ6VLVwBxCJ641pAwtBugii5UkEa4hD2NxH9vvcNLDYw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772622564; c=relaxed/simple;
	bh=y4NQJAZynNNf0JBYelVG2U1QpNmcWPfMySRNjhmFsNo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DQ4jueJVc7MvcCl3c0q6ninVS5DyyRZWsmePPbPFjO4Huj+wRE0zDEZkYX8UyKfaMnLsqMQ0JIboIHaBDxp6nCDNjhV3dlECeJLo491Prvl27Yq+JmJY+4rQHc94PHpJBONbOypVRHlXxelmFQdFYbhrEHZ1nAxN7SLFBTi2azQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ICKMibiA; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b93695f7cdcso834402866b.3
        for <linux-media@vger.kernel.org>; Wed, 04 Mar 2026 03:09:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772622561; cv=none;
        d=google.com; s=arc-20240605;
        b=fmm4K/orxZXamSwcntYaQdghRC2OE1lHJiBZYsgTshCTRsZhTHWKCBWSWSpZt/hBnM
         L2YbEtnTuteqch//kYEXRNXrCDmqrDsCnNcPGTsjVZES8nFlq1UgVBktyiSp5Nod+25l
         VQx0hTtHuVDxKHrhbBfSKm9RdWkNn3c3yL/edDdwy7k45CULQxkwUj6ucm3ZkauE1el5
         AXpDLq+BvA6xIH3s1dAixL1OB5d4EixHKTHl44w8n4qqsdSk6awmckCHcgNeK2k+0bNb
         UUihmvwa4FbMGCW9vBCpiprnwKRBFDV4DIDxqw//xhZjrAxq8Ai3R3lk/I3h2KQLrpT6
         a3oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qDo+rusOHseiN3CWJfYPtdU0M1v1VMbfGCkkCjhmH8g=;
        fh=7qDamC+HfltBU16ttMNuj28AqbI+aLlg2UqVKx6nvUE=;
        b=CN6ITCFps1TL5xL1Lrcbl2eBHqM0emrYV5na314M4nbdT5wtnjrFpBAgwZhTzEU1Tn
         g37R06a/86pIar/+KS9NuWsNsYN3/50/ljFiKtkPA659Gfcd3JCGeonfDbDBiObZhveL
         DyNMWhs8IVHNcBZYjhh8jfiaVAvt7B1H8IK/KatK6OtSrH5HigEnq7ssypmfxbDYxpPw
         9rduCirdFbqGRrFZSjot51fw4iJYmfW15bll9/0otGjVGQlXOGuIBB3UgRnPi8AfwgWy
         wMQ9mcfKX4BGdsGdTbCLsv6XeKzH1MCwhocg5eCSH0jdf0LXJbwIrnHiOG0R1tJEGx++
         o2mQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772622561; x=1773227361; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qDo+rusOHseiN3CWJfYPtdU0M1v1VMbfGCkkCjhmH8g=;
        b=ICKMibiALN8AJvxRT2v76bRtutSfsUsa54/pU5Ho+uCY9C0krMUBSyb+r60VXUCQOo
         vjMRzXMBsc5y3ybBk1iSL2Tam7gzduzYnXaElKkzwdYJBEBLrBgKH6hl+mGiEM2QAB1i
         Nx5hc/hsj4pG5TrGGmi9XlEPkWT+CCFkQsSZ/Kw7JxdwAlWf3wRlWErStXFxCUs5PdMq
         06/bY701I/by5fRygMfEXLSm9Bsk0LMRulJQSqnI/vu7qzWiMxXRXfsjM57ZkkRiPXaz
         UOPxPt81Vkpg6P4jvW8AAj3RC6UV5Ts/gdecQ4FQWigcvjJfmBDwHOcPAvHijZqGD/wz
         CBTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772622561; x=1773227361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qDo+rusOHseiN3CWJfYPtdU0M1v1VMbfGCkkCjhmH8g=;
        b=M3s73JbWYCXzpe2tt2qKsDGm1GcxxLWl9a0ZIbhT+DMf+vaoEWrkv7xfRHC3FU4tR8
         srVpq6yosapPLsjYd5dfE1LDjcdGcrL27hq8vBBww8TQIkn+toTUivYVjpwxCbiBGXeD
         YXSws+XOG9opOWjm1Kb/IS/jurL+d/6Pixroq5E6KC61uPuquisIXm9tPxIpYlgiWBr1
         avn6rw0gx4LptSFqiiOmZ010Fs48RVSfa5hjTc5qsaEX9WGQguWwr84ksT+j3Pfg1soD
         9qHG3BYVajIC2PNiL0JjPT9daUfBm+uRK4opBrSBIojgmAmvFWmvkWsHaDpSvKsER5PW
         kv7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXEYE1NfrIwM0hbwTMvQkWDk2kPhsRPqVkX18+wWGrUAUhewZhdz6cf/n7wx/IpVyZHWc8+yZwQxK9FKA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3c4HCueAMD3eHJkfMPo5KuN+Hn+qUo7AP+6g4Kw0Kc9+vuLAv
	cB+TlcY/WhDB90AlH4OSTBSN2VCnPWEQNGtAYRRRSr7u93Adt5vUO9pHN6eR6sIPavJ69BY4weC
	LI6k4vGL2XE8G1Bq4kW+RKmx3IMRb1Dc=
X-Gm-Gg: ATEYQzxHhgEOViHxSu00d8/W6b3D/mFhl1KoPaVsxLCosFGdi91RhTqg9rv3i4SMTwG
	hThIyjDrzGBtrU02eS9yvmKbIRYvWn6TbmybE8G8ESt8KAImXTlyyK43rN3MKMBkcaoxicmb9pD
	7Q8Asae1CIkatmcUkUd3Hfe17FBxVUKTfEbc0n96W7tpBe0IdoA8f8HGOkhPVTVRhWZGcOnUFdf
	DmbgouLibVwuHqqePrv/4Zrn8/Ax9rd+h6yl7/cnJ6q9KFFe9Kptasu+/A0LABqg7crdPIR29F3
	imJeNRjtD/VdzKCd42bBaH2c4CzU+eJDQyAk4vj/zrtoIJXsiuqfQB/t1YfRy8KMj18HW5QZA3N
	SpJ1xCTM=
X-Received: by 2002:a17:907:9611:b0:b93:8995:8f3a with SMTP id
 a640c23a62f3a-b93f10f83a8mr106274566b.3.1772622560728; Wed, 04 Mar 2026
 03:09:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260303083501.3886922-1-sakari.ailus@linux.intel.com>
 <CAHp75VdaYxvQ+tx51WDPFYSzFOSWqHqFKB4xaNTOt-rx4O9CPw@mail.gmail.com>
 <aabfJEGDJGGP49bS@kekkonen.localdomain> <aabnORpRlVBN5_aj@ashevche-desk.local>
 <aaflMrn55oP0_3JJ@kekkonen.localdomain>
In-Reply-To: <aaflMrn55oP0_3JJ@kekkonen.localdomain>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 4 Mar 2026 13:08:42 +0200
X-Gm-Features: AaiRm52XTxnjTKPIb1ZKzzRRCWvSNzvGCpnrIZFqF8dYHbmYnHOF8kZ200l94nM
Message-ID: <CAHp75Ve+ntMquDiG12Qoz5HwQPVceXQHzo3ef4nJT8ep22Q=iA@mail.gmail.com>
Subject: Re: [PATCH 1/1] staging: media: atomisp: Disallow all private IOCTLs
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, linux-media@vger.kernel.org, 
	andy@kernel.org, hansg@kernel.org, mchehab@kernel.org, 
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	Soufiane Dani <soufianeda@tutanota.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 054571FEB34
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-54459-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshevchenko@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,intel.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Wed, Mar 4, 2026 at 9:54=E2=80=AFAM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
> On Tue, Mar 03, 2026 at 03:50:49PM +0200, Andy Shevchenko wrote:
> > On Tue, Mar 03, 2026 at 03:16:20PM +0200, Sakari Ailus wrote:
> > > On Tue, Mar 03, 2026 at 11:21:02AM +0200, Andy Shevchenko wrote:
> > > > On Tue, Mar 3, 2026 at 10:34=E2=80=AFAM Sakari Ailus
> > > > <sakari.ailus@linux.intel.com> wrote:

...

> > > > > Fixes: ad85094b293e ("Revert "media: staging: atomisp: Remove dri=
ver"")
> > > >
> > > > Is it the correct one? Driver was before that, so I believe this ne=
eds
> > > > to go deeper.
> > >
> > > Technically yes, but even this one is from 2020 and the patch removin=
g it
> > > was merged in 2018, for v4.18. These aren't supported anymore.
> >
> > It doesn't matter, the Fixes should be correct one, the Revert patch is=
 not
> > the initial one where the code appeared.
>
> Both patches actually separately introduce the bug. I'll use both Fixes:
> tags then.

WFM, thanks!

...

> > > > > +       /* Disable all private IOCTLs for now! */
> > > > > +       if (cmd)
> > > > > +               return -EINVAL;
> > > >
> > > > Maybe even a warning?
> > >
> > > That'd be just filling the logs, wouldn't it?
> >
> > dev_warn_once()
>
> Would that warning be useful? We don't warn about other unsupported IOCTL=
s
> either...

The question here: will it be helpful to speedup / motivate moving
users to the standard IOCTLs? If not, no need.

--=20
With Best Regards,
Andy Shevchenko

