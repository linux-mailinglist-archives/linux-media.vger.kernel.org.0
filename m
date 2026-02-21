Return-Path: <linux-media+bounces-53143-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKncKAopmmkJZQMAu9opvQ
	(envelope-from <linux-media+bounces-53143-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 21 Feb 2026 22:52:10 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA07B16E034
	for <lists+linux-media@lfdr.de>; Sat, 21 Feb 2026 22:52:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8DB2B302E7A3
	for <lists+linux-media@lfdr.de>; Sat, 21 Feb 2026 21:52:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 442E230DD16;
	Sat, 21 Feb 2026 21:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ShF5Gxwd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f194.google.com (mail-vk1-f194.google.com [209.85.221.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890E423AB8D
	for <linux-media@vger.kernel.org>; Sat, 21 Feb 2026 21:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771710722; cv=none; b=pGxDcWSKrPsLnWLZyEO3P8BmJhpgjMeRgJp8dnx/VbMK2g6cSNzHj+QRT0ueRaWCNQYE7OuR92CZSCjq10NEC5X9XTpqzdoLFlKj1Mmiczi9HylIEC/mfdZgNDjvxxISZIaSRzKtj1bf6PCrPyWk8mdyl/SJTSW7i6qsYYy/uf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771710722; c=relaxed/simple;
	bh=5nG6IxRdYMtDn2Q9JpcqhAyZTV8BhE0+6rzpe/dzGU4=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Z2SeXjR8ZJ6y/7zb4CYf7JFRfPNnC0JONQwEjVbm9N9bUe8B+iWyocCUlGYRUi+srseOwIlLShNIYZ5iKo0z5Wqjd5VVGsFUr91QuS/k8eyGwrMXmAFk0PoWzVop+I028qlFSZppGFzKT4EEtMmp9+IBw7g8S7ttYiERU5EmApQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ShF5Gxwd; arc=none smtp.client-ip=209.85.221.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f194.google.com with SMTP id 71dfb90a1353d-56637565faaso2680955e0c.1
        for <linux-media@vger.kernel.org>; Sat, 21 Feb 2026 13:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771710720; x=1772315520; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5nG6IxRdYMtDn2Q9JpcqhAyZTV8BhE0+6rzpe/dzGU4=;
        b=ShF5GxwdGL4Ldq7F2qh/f8Jt8+PzKfU78HNOlr0trilr2LHRJHgpM5TXH4OGYE9Gxb
         v5AwxQeSZaW4CaGA0+ZOazsVPLxzMxyZmodmjmjY6/eZlJ8XeztBzsm56DMeNxA8dMBq
         E1qfvjS9RksAOJ29gr+Z2EdJ1sVfrKeDapjCbyLjn1pqNuZcB64Mm5d8MCacrEXgxsxP
         A6/tmjgf+aOqncAtG7NItkFcHwuVsBZdcvbl8rmwfUznfxJKjRe+4AYp9CVQF15Lb1M8
         BvjrTERIUUiVyxEaYfAXXgwFyDNmL6IDAqOE10c2y1pSObUIVj9KgB44ehDYQdCChsr4
         ub/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771710720; x=1772315520;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5nG6IxRdYMtDn2Q9JpcqhAyZTV8BhE0+6rzpe/dzGU4=;
        b=GMSnR3kRbYqqIz5+l6PxZpTkD63YyBKUXsde6dHY/XKTEIl+G1OViYssoSCFy9117T
         L3ZbLtAfj1ld3fFfbFIK7ueiB71uryFafJBB+L3ecPmxTuXyn97Z65238XlUFv9NCZaJ
         0fhm4BXvxWFfwFuYbSEE2OM2T9N0fv9BdbJwApTl6m8nqwZY1VjEMFp3sIa9y2uUm3e9
         GyAe2yo1QMQM6Lk4VSD1i7h4cO6bYmXPsE3zwerRuPZPg3S9nPUGeJ8fCneoT3NDJ+Yn
         gtSdC7cS2nlZhJptyLVRHHZvDa3tSpbuonFhFk/zqA6yPIT0X8WNvxM0htA9Eg77IQ1k
         W0Uw==
X-Forwarded-Encrypted: i=1; AJvYcCWcENqccXkLyxh9pDHxUC2sLNVTm0dSUj9ZXvGS3z0t/6d2kF3q21+KwoD/kJSgopSGDetm+hfjsmDAcA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyslnZRSg7u8JGj+9APE/mpNzjUH4MCJB8ZXjymqFTHhoOSD4ki
	MN8C9uoGXo3LDa1el8sE6hOC5uf/j+JBUdhT2FQ5d0oX5cfN/2BQAwN/
X-Gm-Gg: AZuq6aJmM5H5QHRb14epvFpzp13VcbDxgvyQwNpExld6s2BtrzSUDZAB5oyPvYURdvp
	RCJgwmwEWKXbA3CKcjuoo/F9iiYN1KrHnkDuGF44zVURYRfIT2rG2ssTtPshNygVzPlH+Pqergh
	1ldzh3JsNFhkPnpsb/Dz2kLY+KMGilH0cwZIhJQUsCcC+1R1vzvRiDzQm7q3jkiImOmfCVrPYSA
	sgpN76J8TqpBY6KyBstNJymin0hPQ5q941A1WQH+TxSeN6TIdz5zkrJCTZ1cFR6AkX0/vpEsusX
	jcGxpc6XPOFIYIIrReI1gvLEGPbD6IOj3dDTYZsVEx/wye4cqyWXPhIc3Mezebfl7D9+H/4dOVh
	8DFwshz0U3B8CsioYzO+VAugNESlhQU/aCRz78lgc8Zf+xEEjbIQaxtgfUOu3+gi0xKOKqMJfsU
	AS/y+dpNgqMv6SCdEXnu3Kksi4xDU4mYBQcuR/a6Z6BI7b5N4xW+tkJNMEOPh0
X-Received: by 2002:a05:6102:2907:b0:5fe:2c9:667d with SMTP id ada2fe7eead31-5feb2e91949mr2883091137.2.1771710720503;
        Sat, 21 Feb 2026 13:52:00 -0800 (PST)
Received: from smtpclient.apple ([2804:14d:72b4:81ae:7df3:c7c1:3d5:28e6])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5feb643068asm3132599137.10.2026.02.21.13.51.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 21 Feb 2026 13:51:59 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v2] media: vidtv: fix pass-by-value structs causing MSAN
 warnings
From: Daniel Almeida <dwlsalmeida@gmail.com>
In-Reply-To: <20260221125618.133570-1-abd.masalkhi@gmail.com>
Date: Sat, 21 Feb 2026 18:51:44 -0300
Cc: mchehab@kernel.org,
 thomas.weissschuh@linutronix.de,
 dingyihan@uniontech.com,
 linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 syzbot+96f901260a0b2d29cd1a@syzkaller.appspotmail.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <F2A6B415-6F78-4EBA-97FB-106028E3526B@gmail.com>
References: <20260221125618.133570-1-abd.masalkhi@gmail.com>
To: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53143-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dwlsalmeida@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	APPLE_MAILER_COMMON(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,96f901260a0b2d29cd1a];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Queue-Id: EA07B16E034
X-Rspamd-Action: no action

Hi there, thanks for your contribution.

> On 21 Feb 2026, at 09:56, Abd-Alrhman Masalkhi =
<abd.masalkhi@gmail.com> wrote:
>=20
> vidtv_ts_null_write_into() and vidtv_ts_pcr_write_into() take their
> argument structs by value, causing MSAN to report uninit-value =
warnings.
> While only vidtv_ts_null_write_into() has triggered a report so far,
> both functions share the same issue.
>=20
> Fix by passing both structs by const pointer instead, avoiding the
> stack copy of the struct along with its MSAN shadow and origin =
metadata.
> The functions do not modify the structs, which is enforced by the =
const
> qualifier.
>=20
> Fixes: f90cf6079bf67 ("media: vidtv: add a bridge driver")
> Reported-by: syzbot+96f901260a0b2d29cd1a@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D96f901260a0b2d29cd1a
> Tested-by: syzbot+96f901260a0b2d29cd1a@syzkaller.appspotmail.com
> Suggested-by: Yihan Ding <dingyihan@uniontech.com>
> Signed-off-by: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
> =E2=80=94

I will eventually get to this patch.

=E2=80=94 Daniel


