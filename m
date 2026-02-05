Return-Path: <linux-media+bounces-52225-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WIiPNVg4hGn51AMAu9opvQ
	(envelope-from <linux-media+bounces-52225-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Feb 2026 07:27:36 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 312B2EF058
	for <lists+linux-media@lfdr.de>; Thu, 05 Feb 2026 07:27:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 47D0E302001E
	for <lists+linux-media@lfdr.de>; Thu,  5 Feb 2026 06:26:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E85E2D46D6;
	Thu,  5 Feb 2026 06:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MFTk1rJj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDBE301718
	for <linux-media@vger.kernel.org>; Thu,  5 Feb 2026 06:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770272799; cv=pass; b=fq7spMPZ6EnI+r6uVypxQKDnWSJDkkJiR8/KtElzH/OZashptzMmuaMflaTkpu9Z1S8ZJfzcaIv1mksHFkD1e7uo/Gbakfwlh6k2kT4t6fc53GjJhWOfFGJcfc4cDVQCBzlJCmCYfOdxoqzZXdtIfVqtA8FjJrm9CIR4x5ZnrS0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770272799; c=relaxed/simple;
	bh=HOndQQwWNEw2QRo4yx4D5ZgI/DczJrA9y1fkZPDQ/gc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VnGNs+a7QD3bhEadAeyELjNRePLfzVUqLKdFIRUABfMdQVQt/fs+WG4BcxgXFjA69KvAyZOGOZs7++u8nScCjQXsRsCRDcsu9bEUE8fqReqiAHOoA8+0krQYpRaUSsT7xpzTZ2o43iOttVPV7auBzlYbl2S8gYYl+dl23txtyJc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MFTk1rJj; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-65814266b08so819569a12.3
        for <linux-media@vger.kernel.org>; Wed, 04 Feb 2026 22:26:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770272798; cv=none;
        d=google.com; s=arc-20240605;
        b=eXnnOWY/i2b/UfMWx8TgCcU4DzxQFNRTWk6alfyYjptIx0ups2mKluRMM0m9OWq41z
         PuMnwg9Py/BUBnkuBmv25gYX+CBFq5tjqDhW4ODwyELicukMHNQarqUPViqUFVeKbYcG
         URcCN3kVzLVkADDT0KuUS7mpsDM//nRi0bHBgcdkL0wXeVwCAeXHsdqQ0IynbvNMyk3H
         KnwSChgAdS1Y535oQoC8wS0wax/bBQoyH6nxwq8IebRFHhpSD/r3DYRBCzTCOBxiyGeE
         QksNwVIMiqgA9C68FmaVSz12SyzmtdUuarI8iM0gCvC4p99EUy3geG0T8Q8cqkhZR8It
         DxBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HOndQQwWNEw2QRo4yx4D5ZgI/DczJrA9y1fkZPDQ/gc=;
        fh=oOJwwfvbxlia4ZVb2gQ+3FOZ9Qnagqt+YVDV1qWlj+g=;
        b=QaQaReAEC1yaxEc6FOCHFAPSSYojd0E+S/x5qW+2lm9wsW3rmWgkvdBW/Oz4Q8t2Vr
         Jn1RQEel4PtVrYzMPPCsnxlPoFjB5cszc9bVY5aT+JKLk59+KlHzjW+x46q1U90FPGfJ
         W+Gh/MThISCn4qw11W9lGijS6/pF3VZARF/CyWl+VWSfK/V443X2/MxFDiO0cp0JLYvV
         reVL9twwLyqmItq95tMAOYRoNii5e0L6qKUkQA8aOvzAI8MRXxyRCvVklrgpnhVv3QiD
         BWhVeNHXdhDkU2QCoiZzPhPJPqRe19iTWn1rX1tAXHyaw6awpXFznVJ0aOdcyvMruPHl
         YEvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770272798; x=1770877598; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HOndQQwWNEw2QRo4yx4D5ZgI/DczJrA9y1fkZPDQ/gc=;
        b=MFTk1rJjz2Ses/y77/3dPvC/4gcos7VjNClobm7A6ZLjVgQQXTgE6C9MvBTiqO6bnC
         YvX6uGkpc5dETOETZw2AQCdWVWOzHnoi5wFRi9KHvYb1jlApovL/YEflYNDFtlWQNhSn
         w+PH8d5ifhGJXqPwZFZh7CIAOFZzCCId922j4Lf+fzzq4FQOg81Hx7AJmf7NuSEHemN5
         6wEbKvdB4I9PtGgC7DignQQhpCV/a/+JCAYIJ6Dm4DiPQOreDoHhugY3fwroy10XgCOO
         g/7BXYH1TEEsi+B5J6IrHFW7Bz/Bujjj3uzMGK66HCuP73jvwDxmICKAJovhzWz0Sx3D
         IM3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770272798; x=1770877598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HOndQQwWNEw2QRo4yx4D5ZgI/DczJrA9y1fkZPDQ/gc=;
        b=qdDnaP0IW3lpmwhAk8EO8K3s++dGYCH/+mlfBDDmHY36GegH+msT3vjxJ1KeN8dyTm
         cXRh9+HIiHc342VxpyOP7l2Vlba9BwXIGutnr8/ZjKySDAYzKXVJ8B6UbGwdUTMt1ogQ
         gMhbF5Cw5dFnZXqkNWbkpnzoiD/rLelPQgj1ASRF5C6zn/owKzSGtghxeaHhzBSbwLjN
         dfQ/qHAwoYoe7f6seXhax6cCRSpbmeVm8G06erfx6goYpud1BeVBxJHxF02Bxy/w+Byv
         S9bhCMp9mOLuOXmTreWujW/OwlV/BFL9H3+zaS4vEDGTJKnn86Uvz/2GKvnOEU6KjzPl
         V2zw==
X-Forwarded-Encrypted: i=1; AJvYcCXyJBlBss5hQ1Dw7sMXy7hUGLDirr2e7op880I2H6OMWeRFFc5RFjTO84CzLm5xWApEckSPI3+QMRkRsg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKBcW+b6x4Rf2DbfLSxEOhqhXknnmx2wwMMEKqH/bnEJyGy51/
	lwpxVGum6jQpTGbzHpjNxq7AnjeEYPSYM4qz1bwrBnj0u+GJtazqWgJfO6LjVGFVK1Pv9AeLXm9
	ARv0oCKxDeQDNpCW7S4Di39NOAEOQ3S4=
X-Gm-Gg: AZuq6aI+ODDTWGEulE6VTXTer72MieF89i2j2U6yceLUR3R6Qy0H97lHOaOXTXvw2HB
	wGasWAEZF82TUov8EjOeNSo28/J2dVJDphU8YIZaPFGKehaa3+YG/lpklIzqAPBDaMKLWvyBc6d
	JHyjtFzb+Wp7iQuU6gKO4q1uOrC7744XYJvG+YKKPfcuMWq2Ct2ghHwvyyMNTIaaYkFhN5u8CiI
	TEfqBuneUwE1Iepij2nsaGMTl7H7QTsTw1ql0j3e6fQEoBFoqXbuplZR/z+MOT0cbFopsmog4wg
	lmrdG8NojAjdQR7bYf/+By0CAlQOh9e3zBsR+yoQJji8/6ddul95cEr3Gngp0w/2s0tsBt8=
X-Received: by 2002:a17:907:6d27:b0:b88:5e32:5357 with SMTP id
 a640c23a62f3a-b8e9f44745cmr277107466b.59.1770272797599; Wed, 04 Feb 2026
 22:26:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260205043730.3856488-1-n7l8m4@u.northwestern.edu>
In-Reply-To: <20260205043730.3856488-1-n7l8m4@u.northwestern.edu>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 5 Feb 2026 08:26:00 +0200
X-Gm-Features: AZwV_Qh4fqgQBhD-a4ZBOtLRrBeE7suJVrHRnVxUPxw0CPhZS7AhJABPuyuGGaA
Message-ID: <CAHp75VcU+pm-6LHBWB=ieJcy4yKDfo=us6TAGp2kGJhRLsm_-Q@mail.gmail.com>
Subject: Re: [PATCH] media: atomisp: add missing mutex in atomisp_vidioc_default()
To: Ziyi Guo <n7l8m4@u.northwestern.edu>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-52225-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshevchenko@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 312B2EF058
X-Rspamd-Action: no action

On Thu, Feb 5, 2026 at 6:37=E2=80=AFAM Ziyi Guo <n7l8m4@u.northwestern.edu>=
 wrote:
>
> atomisp_vidioc_default() calls atomisp_exp_id_unlock(),
> atomisp_exp_id_capture(), and atomisp_inject_a_fake_event() without
> holding isp->mutex. However, all three functions have
> lockdep_assert_held(&isp->mutex) indicating callers must hold this lock.

Did you get a splat on real HW?

> Other ioctl handlers in the same driver (e.g., atomisp_start_streaming)
> properly acquire the mutex before operating on ISP state.
>
> Add mutex_lock()/mutex_unlock() around these three ioctl cases to fix the
> missing lock protection.

How did you find the issue?

--=20
With Best Regards,
Andy Shevchenko

