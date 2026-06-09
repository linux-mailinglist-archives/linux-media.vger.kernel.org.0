Return-Path: <linux-media+bounces-64290-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id W9V1N7DvJ2p95wIAu9opvQ
	(envelope-from <linux-media+bounces-64290-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 12:49:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC1265F1EE
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 12:49:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Jd9lODiO;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64290-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64290-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4B1D630D21FF
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2026 10:42:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C968C3F5BC5;
	Tue,  9 Jun 2026 10:42:46 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002B33A1692
	for <linux-media@vger.kernel.org>; Tue,  9 Jun 2026 10:42:44 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781001766; cv=pass; b=tebWKcvGyUnkSFHzSSmFK76LB5iwhNVb/HHeeP3PlKih8SWKiYSIW8wBAuAoq28g/Hred0gyZK3NpPE1jcHZMpJbLjxPn/ZaHNdiJ9Bkf+03FUwy8hT+3242hs0RSJ+cq6D00+VvB1/UaXB684Aznqz+FSw6jqxvuHGpu49YtOk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781001766; c=relaxed/simple;
	bh=8Npnda7vylBuqhopj0ud5BgSPx1uHH6U/z/Q1ikLsAw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jjs2OU4S26c4eHUWz2x+tWSyGazMlolPHDescxjQUxHn5tmi4l6mnOYv3SRNsB9BJt7xs0MR3y2ZM7xa5zgOhG09mzBbwz8wTPAxJEcC4FWLUWuZIx39V37zRqGDkpZVL1B2BhmsAzGreBQx8Y+svAHiQNjNECv0as7sKhM6GJI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jd9lODiO; arc=pass smtp.client-ip=209.85.208.43
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-68f36e1663cso9520877a12.3
        for <linux-media@vger.kernel.org>; Tue, 09 Jun 2026 03:42:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781001763; cv=none;
        d=google.com; s=arc-20240605;
        b=cgL2ZaRVWjaJF1uu8QtZFZvKq6WAyL1ZHiRJWxVD3AwdFvkhBx9IOKg9Kvw6Y5aeN1
         Abz4umWSn3WM1poiEiECjCg1Jf9WtTJLCDpQ+Xy8Zi8bT+EL5idctZYPJZ4+8F6A6fn1
         LxKmWtpWlnDY2obZZvRm0yyjBK6PX95VHI98wURnwA+CA8yXmRIbqvOYf7Hnv7/Js/JX
         wiaOWMmbZheUGwsT9Yf+YGRCfoIVWr4kE3mNVvJd/1k38nIq7v2WIcw9F8fPd1jms5kq
         hSljmYwSOlWmJyS4IT5bXAWjg28+9VgYctRO7jaoFgF57I+xriXPI5rY2KK9icaRQ1XQ
         OlhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8Npnda7vylBuqhopj0ud5BgSPx1uHH6U/z/Q1ikLsAw=;
        fh=tvnb0VyePnoH7cO99f2RmuXM1uuqB4eOnjZBPDwXLaQ=;
        b=ipX/6WFrPRLpWsPSggpgrJ/uAfKAdi7c3v5glmLfKxF0Veqy+d2PoIxJKigRXkL81e
         NP9YpGpw/+4b7TZeP+ge57f85mLzY97srK5d8dEZELzC+OjKO8zobnLNfcq3jQykOAx4
         UmC1GDMtXWL/ilf+uXyORxmvJ1cntibt0/rihB3TgwMUXm7gGra14Ns8whZy1eAowkiJ
         vm5O3q5nXlq3/oYCb6jArbGMWD0bV2SwbafoEWO/fPSgunYucI1Ng1e9cm8bS2VpsIWM
         dPMjxfulE5Ca2IS8MiH7JRJvML4m+feoYNk5wXXu7qJThGx/4CHh5hvBjrOACXa4+OBU
         2nzA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781001763; x=1781606563; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Npnda7vylBuqhopj0ud5BgSPx1uHH6U/z/Q1ikLsAw=;
        b=Jd9lODiOjz5NBTSxTg4Zo63Qor65FCHK43lUZHX2AwkJVausmj5+/pIdNpVF+6/xyM
         746E5lwQLw6jmYfLUi7euq4rYUSxpP0r9+3nwYvXFYKSNgImG42y9H0ycmVUZtwvsDtr
         ArHUN5NrGYoTbbj5tJklZx0RtqnLdueBq1R1AkU9oPThnCbXfb32llSFGRZmi+w3NfPw
         o1tIpBoog2N5Ha8RrYyYA1+yS8ibLTNmR3QgrTi7qRkV0NJeX095Fpk3EdeTVwYSBgx4
         MqePN3dJzO4a4gHvL50JmKvPUBdms2i1VpPiAAc+4Bz6hSL15tq8/Y86AYWk2rPhMLvA
         3WXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781001763; x=1781606563;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8Npnda7vylBuqhopj0ud5BgSPx1uHH6U/z/Q1ikLsAw=;
        b=N0NbKZnVH8MbU1fo0i5zhMLnVb5KVRrumc826+wXlY5OUieGiT1E5AZWGQwN32lv9A
         dL63iyILuji1GpLV8eFGF17PVEN41Kg95la2oDkqPJS9laNnhmDWpxgS4q8QqvJm5Egk
         bONzFFMwDT1xUEhM1ReRoVHAk5khqQ7Xi6qCFrH//PJbRgpW1ydsa50vh1DtowXRXx6B
         BJEmZfAMwNJsWqSSmiqsu7RIIMRP7jP6k2GQOykaN6Z8y0X0+NXKfIA435n4Bc4CsP1M
         mekauJmCW5HsWVaGQ2LLN8gTeK+kbr7dgMmhcJzykEsDbIui5DAmd0eZwCF4FB0vdydi
         9gTw==
X-Forwarded-Encrypted: i=1; AFNElJ8bcyYeZ/KeQKWrJ/F60YNt3yqfAIDZKNY8caXvJ6W99b2rnncIspPZRWFO4HdBOrs1zcSIe+NW5KN9+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFOoq83dkECFp947o6QAOXCeqSGhulTWy4dsmK5LRAB1YamPsL
	id8ld3Il4lYdkOod2vzE9JOXvLYZoX+/9wEx+l10E22FfQTifd+xG8UT9V0tfIPKnPmb2FG/d6t
	4TD0z7ISBrAEvH+Pt3K2wjYs6nJOgZxM=
X-Gm-Gg: Acq92OFHYJKKySLTrskLCjnRjfBwh7mmpuc/flHvW+hD/3q47i6OKdwPWkPvkgZC4yu
	Q+/G35jOYtDy8+3drJgQh4x6y3fZ8IVvCQrEkkMd1HFaa+sWNE3i4oDR3n+dhT8Op60ESTghCWD
	IoZX/pUS0Ok3UlWGdzcLRs1Cia5llE3qbi6XEpgGMohYvMEo+HCrAFZfGKfmfr4se9Snaw762mu
	YYjvq7APn5KQUnS5zyPZl8EQom0+opu7+CORJGIAXXxf09vtyQnLmARGDZOp5Z0uwnI1uOcjIUS
	ARn+X330K0zi8uQ6pLxgF/fxu8Cl4BNcW2h/biR2AuI6wW1deF4nNgyrvjPJivJfwpro1F+SBsU
	ogx8Ypi89R9WsfbGw7RdTRmYQ2rSdhLfkx04bqa6i4pAcSyEYCzilxKYbTYfL4gFbuviPLo/Uvo
	u7V10=
X-Received: by 2002:a17:907:7425:b0:bf5:dfd2:4ea8 with SMTP id
 a640c23a62f3a-bf5dfd259d0mr413829966b.41.1781001763037; Tue, 09 Jun 2026
 03:42:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260608151617.3393471-1-rhys@tumelty.co.uk>
In-Reply-To: <20260608151617.3393471-1-rhys@tumelty.co.uk>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 9 Jun 2026 13:42:06 +0300
X-Gm-Features: AVVi8Ce0UHL4o4s3y2b5093fUndEoCXTxSIRIaaI1mp2XkTHwCZNcHoAQhmWuBM
Message-ID: <CAHp75Ve3Cs95e4CLHDfO0_T=gSDa2tDBS+eZTAJoHxWd_zWMAA@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: fix variable shadowing warnings
To: Rhys Tumelty <rhys@tumelty.co.uk>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Dan Carpenter <dan.carpenter@linaro.org>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-64290-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rhys@tumelty.co.uk,m:hansg@kernel.org,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:andy@kernel.org,m:sakari.ailus@linux.intel.com,m:dan.carpenter@linaro.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[andyshevchenko@gmail.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshevchenko@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4BC1265F1EE

On Mon, Jun 8, 2026 at 6:16=E2=80=AFPM Rhys Tumelty <rhys@tumelty.co.uk> wr=
ote:
>
> Fix local variable shadowing warnings, flagged by a W=3D2
> kernel build, due to -Werror=3Dshadow.
>
> In atomisp_css_stop(), an inner loop 'i' index shadows
> an outer unsigned int i. Rename the inner loop index to 'k'
>
> In ia_css_stream_create(), the block-local 'effective_res'
> struct shadows an outer local declaration. Rename the
> block scoped instance in the loop over pipes to
> 'pipe_effective_res' to clearly show context.

Before even looking towards (some of) the W=3D2 warnings, please pay
attention to the real issues the driver has.

--=20
With Best Regards,
Andy Shevchenko

