Return-Path: <linux-media+bounces-62842-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8AsGCB2CFmr6mwcAu9opvQ
	(envelope-from <linux-media+bounces-62842-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 07:33:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B14E55DF77E
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 07:33:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4BA6F3014377
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 05:33:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA52030C14F;
	Wed, 27 May 2026 05:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CnLVqX/L"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7D42BEFE8
	for <linux-media@vger.kernel.org>; Wed, 27 May 2026 05:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779859990; cv=pass; b=kqQipiOHOvpahuB7VG0LCFsT4n3ISMjIlhHeAHWakia3LaH9auSYgR00EDiWFj4y6OF08A9+KWCff++1t9+m/Y50WjB/uh8Oam7S08Uz+PCKBcs7660zwqIDHCvlRkmHE6C6ckjatmXjtKQnWRnGlt+sah2q4lV+ugZ1/1JMraw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779859990; c=relaxed/simple;
	bh=CdQ5y3m3plCpFHTVDW+jJU3RlvyhtZhUps0FPVqSHe4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t5haDnkEP4RfZiOJ0TMdxcg5bFAMFfifLOZ0kZj14sIur4+bxYORiey733FhYq5INCyscJKlugvN+FVxkZTqsToMhNTb0ldIswMhpTwg7zUNg2zVZLZSKhUN825xoBPJVoBAC0bbb+k1EYOsZx3AngzARptzvCk17aJhcl64Khw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CnLVqX/L; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-bd11a3729e8so1744588666b.0
        for <linux-media@vger.kernel.org>; Tue, 26 May 2026 22:33:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779859987; cv=none;
        d=google.com; s=arc-20240605;
        b=bdyF7+0114Bhl9p8VJVOhLS5EkvYrg4xHDJsiiXd5JaIzvbjmzA2UBkSn76PPesch4
         9NprxSBC7KP4iuTUZcRL6X80jTqmYyUzMhZ5OIZ+8v3wVuxwYpZz1/7RdmJJNHX01cLg
         djZO+T/HRB5+7qyL65PzNsZz8A+XKe0jkQWIwwuHjHZSVRgP1ITea65QupsePOT1/3Jv
         kLjR0HNigl4qQVKGf42ZdiKz81z5B0JSxj6Hh6QSqZd6RYK97bW0xHGJB/jKsFCL+KM0
         dH42rJ0l53v5IT4+mNGZaaGcl6O+xT99lcoE35Gat/Q4Xfbe8Wr4L0M4ckO9MpfsBZa0
         8PVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dHY96zMFiFa5xx2Vu2DkKYFRA8dKzIDr2HkZ6H6GDLo=;
        fh=4KLEfWIB8p9jrGG8OweJhd09CepV00nccP8VPgiHF2I=;
        b=Q+/2eJBh33I07VP61VbJ5QUWpAgYZ3FmfmjnoXvymM20kuMuRGk0bQVMpQ5pgn854j
         L25XTBjZKMgWxRE6K/5LFK+UW8Aqtw177ZbyCXa8I13KL4DU4X7wiDXwU+WV5IonTR2/
         avT86KClAtNO/PjrdhRNUu/ST14fdfU4TCWLeTPiAUUkND0ZbkJY9lRQEw/yNhZXriQe
         uWQTUa9/uOt7/yzD/UnHm3UHrZ/KntGN75+l30+7z4UCacpZm6zOLhH4/iGnbAW8PNW3
         wcih4p+vojBGbsR8PtNxJoZoho0PtwRCUm27UGuHfd5MGyIZy0zBtHmK8zNB5xowtBPj
         5RCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779859987; x=1780464787; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dHY96zMFiFa5xx2Vu2DkKYFRA8dKzIDr2HkZ6H6GDLo=;
        b=CnLVqX/L5GEeJ6V4MAy663TUzlXiKdyBf3v6mOvXpGxzNy0RHVjChjWCpYbICszHNd
         XBXz0Yb0fl2l4wwEY+mBzQQBy5UuEfuSyTP76PRzEO2S+4u21MuzAD09J6kWFWoJj0LS
         R1iYx2A2NRm+wKMSMYQmKYWtDfxReiOqLZ9mPB9oEsjHcHNneWZ3c9wyuenLLcJOYLCE
         XLTS6ZaRuPWLzk6Veoz17vX2BL6YHZR0oRIBfUY6fX03QY4fQkp+ZUe+TqgXRuB1/SHc
         MRExIKrAOgrq1FoVIRmc4UHV4ZM5X6QG32IqvfhoncwjuMX44stx+gqmhPEKrBZBzLhg
         USxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779859987; x=1780464787;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dHY96zMFiFa5xx2Vu2DkKYFRA8dKzIDr2HkZ6H6GDLo=;
        b=Xwk6ZxnDof5DbrPgFji5QMI7bLbDgLnyOcJwsMBrl+uSZFeP8tghdJRMiwbnoXTrT8
         rc0vtAb4duSM+RJRNURuS+pIK+PUa3SycWr4QoR0MdJ7nfCWgWbsV8iym81uLwuWIJ67
         m/Lg2QYdDlgz/kY8zu+6nn1i5JJxC1inPRxYIf4NpBInQZugpxrwGi3o5YBX2yd5CYVn
         Eja9uW7O4WYwSVtk1aJ+ddVsb9H0xLPgmwJlpRfpXQNMX0uMBfXOLXdOsfMfWzQ0bsES
         EZ+BeBfXIJBtb4Ua4F4MRqEZJ879DIOEkygOGLhIG51UMkRTA8aRTGEs2pG1ioZ2dY7I
         qafQ==
X-Forwarded-Encrypted: i=1; AFNElJ+RtGYpt++kr2PXrP6P6FnRT2us134j+AhMm67U1hZNqmaxlBB3iuvgxyMiITPncCkdsjJshfs24RPUzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7ZnTfDTjNKVK3yqnevHWeaYjxONtSAlttDzWTkDN9YxIqfnpw
	PspMngbOipbsQuOLS2/l7pNSwL2pxbvb6oBQxC1aTO1+7renJpcdQ9JVlOyQxDTEj+mEazEgOHQ
	iJ8q/Jp5ErBk1bYXjRD+3klSMZfbwh7g=
X-Gm-Gg: Acq92OHmwc6nqDFIJgRwu3IFt/mTrMCbUuLK+JiDg1uEHbIqqPgVXTRCamGlNNnjY4d
	iERzee0VepvHempV64db4PPc9ntrssJcXtRi6zVHBp7Nv4sHIrsM/X+P7w9yNH7t+zi8mQLflaF
	Ag3747nO8R5ukwku4nmDAyf9JTXJTfopbWPQmx+Zea171EaQtosLoE9y/J1+/a3z+LnKgptLNjB
	rwaeIJo8tesCNFe9/kBdmabz0H7AAYRNO/EEbbzxsIGQ17f3XqPZd7PX/0p0DvSJc888mH5LVw8
	wf1vCRA0HF08BrI7+1Ar/clkh9KqDgH9pgEtzTmHiVIUVIwcrYtApPKBeAsT1XZKPFGi4fEaRsi
	+66xiGPFQvAyNb7IQ+THFPzajlGdFcx0i4OmSLCCgPyw9jgY1AR4rqDG7wBMWoY7Kqw9rvyroBe
	Z0Olrz
X-Received: by 2002:a17:906:8a4a:b0:bcc:9130:69ee with SMTP id
 a640c23a62f3a-bdd25ce02ffmr865880566b.32.1779859986733; Tue, 26 May 2026
 22:33:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260523111511.865-1-marl0rd1080@gmail.com>
In-Reply-To: <20260523111511.865-1-marl0rd1080@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 27 May 2026 07:32:30 +0200
X-Gm-Features: AVHnY4LY7RvUaUmg5n0JcABR3Vc-msD4MmKBxytlv5D1-e7LccuF9wd_7hpJCbM
Message-ID: <CAHp75Vc913Dgo_fzqBGZBaPB03De7V41dwd4uLpw9gvUe-+JDQ@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: fix typo in rx.c
To: Marlon Trujillo <marl0rd1080@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org, 
	sakari.ailus@linux.intel.com, andy@kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62842-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: B14E55DF77E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, May 23, 2026 at 1:15=E2=80=AFPM Marlon Trujillo <marl0rd1080@gmail.=
com> wrote:
>
> Fix spelling mistake: inptu -> input

Is this the only one single typo in the whole driver?


> -       /* In this module the validity of the inptu variable should
> +       /* In this module the validity of the input variable should
>          * have been checked already, so we do not check for erroneous
>          * values. */

/*
 * While at it, fix the multi-line comment
 * style as shown in this example.
 */

But before doing that, invest your time into reading linux-media@
mailing list archive and see what others already sent
(lore.kernel.org/linux-media).

--=20
With Best Regards,
Andy Shevchenko

