Return-Path: <linux-media+bounces-59238-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +N9UKBy952mu/wEAu9opvQ
	(envelope-from <linux-media+bounces-59238-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 20:08:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6238C43E665
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 20:08:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2C9F7301FC37
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 18:08:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C1033A8750;
	Tue, 21 Apr 2026 18:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SXeWqKYq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4702639BFEA
	for <linux-media@vger.kernel.org>; Tue, 21 Apr 2026 18:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776794901; cv=pass; b=HPA0Fi2tEtRU2FBauw1cKr90e/zU2limJAwDodiyhTn4+NrX9LKK7peof8cvo8iz1SQNNdRlIGAFT3CnHWaO1CFbdaqRK8Uv1mzvc5Ea/z/joqN6SYNbJcSdw8/HjuLkNnoGQGq5AJP4mLR/iVkwmmnFxLSZ2Qol7JylP0c5NZ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776794901; c=relaxed/simple;
	bh=ek1GauTOeUTfZm4I0HR5V6ZSK+6ijir9oGykKRevXQ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uraFJ7inNFl7+5HQDo+85M4H8GevJGEDeGARRvZGrH3NFsTyQE1BsuLIv891lxgi0l8CKayGCYBdj8FaM9ABbH5yrBBrECRDcJn7Ddwsa5qEa6tgq+TsUHZT4LSjooiPU5ar3hSYX/ryM9aF6OV7L1b/SAEwdPyHrBpSUiD2A7g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SXeWqKYq; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ba7a1cc0380so504286766b.2
        for <linux-media@vger.kernel.org>; Tue, 21 Apr 2026 11:08:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776794899; cv=none;
        d=google.com; s=arc-20240605;
        b=dzGLLhVFTUGScj+4Lk5XsFDVe1hEjLEeXOgU5farlSVYtXng7ALlZaNkGEfiZNUVO6
         /ZZATcy3k1+W7M9GG133JGkqtow5EGS9IlU0l2uO+cRa5jO+nvcd5zXiKiaqRi5zZzW5
         PQZuvBCaRhLathG1Ef6FT2rnkllIr+NBJPc2/gvHXJCy3GVAExDOw4hblGKWnuJfDN7M
         hjUkSKr244mt6EtPzWVOBXS757TjOUm3GdTTtZdxuZurxUIsC5aei9pMNnIP2JNGOhxG
         y7l4OKROgH0oJ4EplWFSQ6XAFHsMDYga40t6EqdiXLaS+sl2iY9CaD30R8FUFwJ3yZRd
         QT8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ek1GauTOeUTfZm4I0HR5V6ZSK+6ijir9oGykKRevXQ4=;
        fh=PH31APIdXqW9ldx4QJj4GCbtAaft1Fi1g3At0wL3A3Q=;
        b=W7OJUHxlAYUXqjT1LPDCl5P9EJ5XOI9HvJSL/RPwZ+AmvzrQfAiXRkt3NGCqkPcoCP
         xZCXYQ6cXCFc3zMFuWb9lWNbbtKbVmK1iqS1m3gi6mYbeLovRfaaU8gCVhT34jefQ5kq
         LEyHydyVrZUK2/IYijogtRn3+2YtgZ9nna1NaM1UHu0x8zcpDS9OE4ngKNVPblIgHtpD
         Alhj+6g8gbQ/J35reNX8AyGvhOakTvwil2EnWdB5WhmX1pRRojPycFhHiMwJl0h90k+o
         p4GYNdEpclfQzLyx2tKDSVeq49gtqz5AH9zDQZQBzdeYYSSTr6tsVhpO7+SZY6Bzj/tj
         PyXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776794899; x=1777399699; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ek1GauTOeUTfZm4I0HR5V6ZSK+6ijir9oGykKRevXQ4=;
        b=SXeWqKYqgtt1RNZnU5I4vpABsXDXFN+Y853fH46yMRlHtUyyQKIa9dv8UThE2KrjJ7
         hyLKKemYImKvUZYKXP+C/xWNE6skWSc2G7hVJrjpLJCZao4M4ahsN7x/1VU7e8M5oFNI
         7yiPsDKSOy3IDL2WiZjnLQTMY8m4fO6Et3mtZmdj5Z3jIolsHP74pUrOhnOc3HYrHYvo
         trc2OXbPalq8lWEpqCpFVAYqOul1YX3DAuvyipeV7y9ukJ6aXFf0R3rFr0BC/rhrAHFy
         gn8yoOohQusEDh9gZufZ6E+1xhtb0/VkPmAusOrRLhwvH+M5e9NhIKqy9vdWn2adKLOr
         5MSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776794899; x=1777399699;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ek1GauTOeUTfZm4I0HR5V6ZSK+6ijir9oGykKRevXQ4=;
        b=mo0dR5J3k1TZLQti+AM7F3kU8I0uVaQ4jUHlBY2e5kcltHCR5gqQ0WMjOe9UCH2qVq
         yUl6k6nbHNmj2NKiT1BUrAdftkjR2zP1L82x/LXkRUiH+EA+i7hYynum5tVpsq6SobBr
         Ej/qlegRr+merVQwL9OeEQZIrMKiBZVhM//mqTPDVDvzJfklDy2KLoHFNmm/iLmu4iRn
         n+VoTHtfvDktNJgh85iyLqVTyKfGpaRv0r4Po0pCcyrRHzafTGEDaBhZzimP0UvAkVEw
         sB+9ef9xqgBQggZVAE6llSfIg1jIyC/7DGbHbJqUWvzH8hFCrHHZu1ufLLO2boTI3hG4
         hohg==
X-Forwarded-Encrypted: i=1; AFNElJ+iR+aVo2a00W+LreMQG2daZMwwY6gy9ky33rSUZUcJXRjiVMlex4b79RSiZfs40Nosrxq3sY8fdHqwGA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu5suMNEVC96GFaa+wU14qwoUvUlXsviJ1p3MAC+v9lhyoLDai
	BigyGoCASG8TjRWpTY52GtYFtBlXQFXr1vwN91FGIGYtWtIyb0zhOL5dJCMmTkrMrHCre6Jbsrl
	mJuztlnX4RcfHHpHomUXzOF9vDNXj5BA=
X-Gm-Gg: AeBDiesIYAxkxgoi4qNvtcxXYc/AFtvt/T6iVRuicNnP1cDrNhRj64lJRJxL7ttT575
	5NKnp8mgHqvhbPxdZgLq118/Ncys6fIFhuVfrHE/48AqRPk2EXvnASPZxSSD8FJzepe3lCRLCGE
	AE3NcGeJKEgb4NFhpFOUuubyvgF4H+WVqjFUDe3l2MJQXL1eixE2T9FXu1s3wncdZWkF04l8cvk
	eJqk2MJC6nN1o34ZalD7LncjfdRy0+hWBZQB7t+Y3lPzKmkg4c37PfJnh86hgFaTQA5l6JGmFgg
	5iS6eszKcZ26dHanUPYic+t8DQP5k3dApyZt/+LNRO3ThJDRxIOnbZm6QgXXz72oXTIJOSxj5G7
	sL1PZ4ouhjZmfToyEBw==
X-Received: by 2002:a17:907:3f8d:b0:ba7:3d21:c137 with SMTP id
 a640c23a62f3a-ba73d31091dmr527575566b.17.1776794898316; Tue, 21 Apr 2026
 11:08:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260416134214.130665-2-pontescpedro@gmail.com>
 <CAHp75VeyCRCdR4VD8+KM33zYv3OMBSRGaeSE5B2Wc5hn9Q9hEA@mail.gmail.com> <aeerOursgkNeoMQo@kekkonen.localdomain>
In-Reply-To: <aeerOursgkNeoMQo@kekkonen.localdomain>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 21 Apr 2026 21:07:41 +0300
X-Gm-Features: AQROBzAqxTIrCxCx8aizkHTcNkVcluVKd3UYhySBdWYgZD3G-w61LqAKuK729zk
Message-ID: <CAHp75VfVXGeKcuEewuRC0E7tXj5AokWHQLmzsSF+mVQjQ16KwQ@mail.gmail.com>
Subject: Re: [PATCH] media: atomisp: use kmalloc_objs for array allocations
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Pedro Pontes <pontescpedro@gmail.com>, hansg@kernel.org, gregkh@linuxfoundation.org, 
	mchehab@kernel.org, andy@kernel.org, kees@kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59238-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linuxfoundation.org,vger.kernel.org,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6238C43E665
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 21, 2026 at 7:52=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
> On Thu, Apr 16, 2026 at 09:26:47PM +0300, Andy Shevchenko wrote:
> > On Thu, Apr 16, 2026 at 4:46=E2=80=AFPM Pedro Pontes <pontescpedro@gmai=
l.com> wrote:
> > >
> > > Convert manual kmalloc() multiplications to the modern kmalloc_objs()
> > > interface to improve type safety and prevent potential integer
> > > overflows.
> >
> > There is already a patch doing it in a slightly better way. Have you
> > followed the mailing list?
>
> I must have missed it, too. :-\

https://lore.kernel.org/all/CAHp75VcoNkEQs7QQLDg8xZjdouNc8Yc6Vjg+Pdqb7LViqS=
Kysg@mail.gmail.com/

> > Please, better to help with this driver is to subscribe to the mailing
> > list and review already
> > submitted ones.

--=20
With Best Regards,
Andy Shevchenko

