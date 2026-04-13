Return-Path: <linux-media+bounces-58628-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDUwH2qa3GkxUAkAu9opvQ
	(envelope-from <linux-media+bounces-58628-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 09:25:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C95FA3E82F1
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 09:25:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C5668301B70B
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 07:24:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A344B3932CA;
	Mon, 13 Apr 2026 07:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rdf4Sbpp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5C0363C79
	for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 07:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776065087; cv=pass; b=fPvINCABqXdXNxQ9TLGxZzE7oJvJd5pHCYEbNKgm98dwTEYn4uIDjPhntwtgB8jq4ssjr5r8JJMSik1l3iZkTMdokn1VJzdDJHPvQJ3m/+vPrviyGSd9Zig6KgtiSIHv2tA6y/irR3otJJQnniXrgvua4QRR/f82ZpiLTQPWDsk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776065087; c=relaxed/simple;
	bh=7ZHUD+kBQSpfUlxq49/apHzHgrZaXw2nBrklekUGpgc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mELAltpJsXxRMFAfPk2/oipMuCe8+XTzr8gRuyWjmif8yFnxlrmHXSvj7iIy+ixdgLlX2BfADE6ONR6IsgeE9rqJ1bFxDru74AMq2mVaVRQjN9ukGnDt3gTrvtVSxGTM0Iz5kotbpZXnc02SLCL660ZIcxIa4MOsALoKxHE+JQ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rdf4Sbpp; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6718f336888so835332a12.1
        for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 00:24:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776065084; cv=none;
        d=google.com; s=arc-20240605;
        b=B4h3h3/Z5cxZf6Y93kAZr6UFzk6K0V3pTwhuDtrYeL/qA4CpPxvlWOheTaPqKfhKAW
         ak2K+/LGHV8WYcY2bFRRaNhMOY1ipuYniHSyjhlbjZLp3oWOEiXuTnwMaLjT4/VhMAre
         Z9iBSBsKEuq81u/vxrTBgl5UfBAPnC9uGrfj7eRSXdAsQsqCxFqD9MuapTmX6Cbk1hxO
         CZ/ybNn634pjXVydqLe+N2YrDQbYN0gg9aPPVNVAi/xngxdVILQ7nyTuG/tRbt3LUyZf
         ne3cq0JCiRuJOwgiJWvfqqiwsjcK0NF/Pqv4rnnc9eu5iwtLEayzAINpdXDiQp7/Bcql
         rOIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7ZHUD+kBQSpfUlxq49/apHzHgrZaXw2nBrklekUGpgc=;
        fh=JhrivHkODbNudelnLrlAfsnKCZiB8vHMbypojvjGMQk=;
        b=hIzz9gFN1YqX3w++aHJjqaW5hMCw+OyjzkCJBclCDnobjVNAhxOwsjvc/c2kjGDhkW
         htENR1f3fylAE8wrhL2VVb3euuv4YgLM7kWxZMasdElb3mH/O2G93+7TVIC9pVkNjLuv
         931dkYIGSMm1aIHAakOY039Qd+GX1WOoeN4qDaAIpSMc8/WCwupLknL0hip1ZIOCQqZr
         /cqlWIXFHpigXq5bm4fWh2YmG6ueN4y9V2K8I6dc0U+kCTwidUnGChYWxQrCwl3gV6iH
         yeqU7yzHjJj9mfb2axwEvgUk8NWyC/8sMcehRZONiWmAIDn5S5tMKnqK3aJ45EmLV1gI
         7viw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776065084; x=1776669884; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ZHUD+kBQSpfUlxq49/apHzHgrZaXw2nBrklekUGpgc=;
        b=rdf4SbppA7sd9cBNo+H+3OAGLqdlBBZp5XupJIOiqKJqlIDpuBo50yyk4xlfadgLNs
         dJAGCTtZoMYoV7MKVmiTcv9jPq8nvUCPNn9rWZ0973kdUy4bwG4QQdTD+NQ/H8VbOdmA
         Bbbqby0HcCFeuAJlsD8UF/73m+AsQNXFwS7YQnPH0QR4E3LuXNg8yzEm7C4RgRBxrFNI
         vXrvuyqkJkAP3/Gzap92GBPgn3IPrbdr65/PzgjTxx9uHb0pnXEXl6VZX2AHK5JqzjFK
         uBbadvfvLUGju0xsxvGi9WEeBhEF8FMShplIDJRil5LHmP7FkLOMOB0AYwyNj11eNago
         VZaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776065084; x=1776669884;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7ZHUD+kBQSpfUlxq49/apHzHgrZaXw2nBrklekUGpgc=;
        b=HTPNwIZ6tRu9SSdykK4FKeeoRWr290DiCkG4iDLDR42R0nQasBH4T1j6336fHeHO/t
         PWcCJZhj8/nObQz8+x7L4rZwhyIZE9oS6jsvGEX0HIgEWDWixM55jz5iL24GJl/CvAfz
         3BAIPc5Ls4IBgbQ/OUhC783PqEik9WmkP2kvgdydGj+WkKt6X+1om1may+m9NGJ20yDJ
         D/Y5heNaC9rgDAOvLjW3HzQFKeztYU2Xd9ABE190DM7hmoITgpI0UwD6PubJfVw2gKnB
         fMJ8o9EAsj56XWJuIYPVg4TB9ifsYceMGHftIUZcaa8WPXRFyuagdJLLXUAR9BAd8kai
         qGyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIQlIGNawmvW2oU8MrnjSzGcZM/ijGGwVenEt2+1jHEkTMzuqYDI3/uf5EhNNLgr5yL0LGmB/UIVkXJw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1fSDv1ZwzYznZcHd/GiLszM2AGQgKd+62dlpw68tXis5r+jdY
	7VepImbD1V6Qw54FsGiGHzQ2sFpWSB/maHutUVzSZZhcVoOjKlCXpMCR8J3TIkd8ThiyJGTJ+pU
	I2s/DIIEsQqtrnlsHs3UMF414YUPKkzg=
X-Gm-Gg: AeBDiesltdSOcPSc8tJezZ4XEbxeqCV+jX8JW0CV1J6BlzSDCDyVImuhTztMnezpbJn
	fO6UDwuYeeuQ44pmaSraXRf5ior4ibBvZZB3LyeEv9nUWpuvQcX94P9srn6rv5CO03LDI2/zdV1
	fGl/+6BgasteiD31E8aEfxdDi+nEpqxggN1r/v/YnGGrG8fTLzJ/c8OfZVHjj1WM8ZyJasezUQc
	MfhpuGFJyKe8L+aPMj7cC61/CL77f4fTaDKjNJm+8PspE0Qgp/jXNdAK4XcZ61S7ADi7ZzvfmMo
	YIWOUMVw+owGMvIrOA55PLx4qrQtz8Zl1bCeZTAqFefdP1R0pW6+bE322IiR1wHXTcJzjcurym4
	lxTkJ7ic=
X-Received: by 2002:a17:907:1c16:b0:b9c:d04:e05f with SMTP id
 a640c23a62f3a-b9d72658a55mr682490766b.32.1776065084003; Mon, 13 Apr 2026
 00:24:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260411005512.46142-1-mugrinphoto@gmail.com> <adont11Sr92pi0_N@stanley.mountain>
 <20260411154223.3091eb45@pumpkin> <CAEiYE9hBGiDgP9FmMAuU0qyVygmwU0FrxVGcuy5g7JLO4KWMLQ@mail.gmail.com>
In-Reply-To: <CAEiYE9hBGiDgP9FmMAuU0qyVygmwU0FrxVGcuy5g7JLO4KWMLQ@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 13 Apr 2026 10:24:07 +0300
X-Gm-Features: AQROBzC8r5p418XMvH2NBWJUbqFPIOpGj32dYkPtq6_FWukEQoF6OL5Gq0THpKA
Message-ID: <CAHp75VcbDRHOeBW+i-FTLJ58C_hpOJoaKLu_qwLZEhRocSXFcA@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: fix indentation to use tabs
 instead of spaces
To: Michael Ugrin <mugrinphoto@gmail.com>
Cc: David Laight <david.laight.linux@gmail.com>, Dan Carpenter <error27@gmail.com>, hansg@kernel.org, 
	mchehab@kernel.org, sakari.ailus@linux.intel.com, andy@kernel.org, 
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58628-lists,linux-media=lfdr.de];
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
	FROM_NEQ_ENVFROM(0.00)[andyshevchenko@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: C95FA3E82F1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 11, 2026 at 8:14=E2=80=AFPM Michael Ugrin <mugrinphoto@gmail.co=
m> wrote:
>
> Thanks for the review, Dan and David.
>
> I'll work on a v2,replacing the ternary with umin() for that strscpy
> call and the other strscpy calls in the function.

Why not simply min()? Wouldn't it work (if type of p is aligned accordingly=
)?

Note, we prefer the (more) real patches, id est what David suggested
seems to me more useful to this driver to have in the long term.

--=20
With Best Regards,
Andy Shevchenko

