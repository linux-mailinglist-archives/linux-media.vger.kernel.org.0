Return-Path: <linux-media+bounces-37698-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD269B046BD
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 19:39:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B15A41882B09
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 17:39:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47323267701;
	Mon, 14 Jul 2025 17:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C5cHz/3O"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2389E25F97D;
	Mon, 14 Jul 2025 17:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752514645; cv=none; b=U8BUoFicA68D1trcnCU3UcLa0+dbvLKgFPpLDjMnGjyYgiE54cq2ikZaD1QBoGV0cv5EAJgzQS/V13Di0Zg9B8vfp8y7pZImmXo+r0j87n1EGuS0tdGEfyvc3uM1r+VzqpP4Mlf7FoB/ePoE1ily/9k3ltBTjzKtVgomDLe0mFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752514645; c=relaxed/simple;
	bh=6pEZ7I/Q2GU5GEstfXRLF6p8IiymWe8ubsklJS8QlRQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n6issBVrwWpTgCAuIOTED3pumPU/lbTkaZ5+deMlAFyzlVoR3nidVdBMzCzx8CXgqWy+UJbvVYhEQb2YOV1/tJKD1DIN8Bk5Tn+5C8D+tuPF4E9lK3+YS2fZF3VU3wXDOPaUN7aynLVL2aXrijG6LsUq2UOLOLSJTZhLZdDDbFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C5cHz/3O; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ae6f8d3bcd4so790627966b.1;
        Mon, 14 Jul 2025 10:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752514642; x=1753119442; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6pEZ7I/Q2GU5GEstfXRLF6p8IiymWe8ubsklJS8QlRQ=;
        b=C5cHz/3OXis2QUtouz5mBYHNZIGxFecKht4GOVjQnw3rnQDJ8m5kPI0tP/CCmmK7f+
         5tCyc4Gt0/LrHZ8QqOUQqJxX4nkkufGnbGoAvWbTA2Hi8HxlkHAlzDGo/WgmYTApdSFh
         1cwbtO0vfxBMpm8yW6MJ7w42xV7ZYUdPGZtqORD0GBqjrDTki8IHnHH7KmgIkJxeJNlT
         vgkf4Z8LpHDR2jOHegt7ph/VBZhVl2dXZc6qFnpRYsgpCf4w10z4MVQVqXY3bjuHoli1
         1t1mOUwrQirKpQt99N5sDdwX5hZenJyYOXOif+GLdqR7lmH6srTT45aNtMKdA9Y0RH56
         ve1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752514642; x=1753119442;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6pEZ7I/Q2GU5GEstfXRLF6p8IiymWe8ubsklJS8QlRQ=;
        b=Wt5KvgO9knQWW/nvBwMr/bNrbn3ACT66kL1yOwEgRbbjS8S+sN+zdRVutd97l5jjpe
         Yd4EINEfrQFSx1szVhjEXysD5EXHQVAjUqc01hjdxdFcT3U3wQhqBCW5LLvVOWoHu/kG
         Wj1iJK/H7EMiMAmtSG/whnoyYrbk8c5G1HFrZcjOMUg50Q3FgIQmyMw8pXHWHIuUdyW4
         ck/eoR02cV3oZTyQgi1I63xFF1Vpo4ZsyjUcnmQ4siT7KN/eS3JlFg8KHlljBBN9Xpmg
         uSbwB8mWmdtwNYX1PzGqYOo0ixAjSqKVJhSCKUYAUY9MxJ/D/MbJ4fH1KIynE1LlsZT0
         6upw==
X-Forwarded-Encrypted: i=1; AJvYcCX2q8FsWfsJUyXjjNrndivqDDDdEEWOyUXcg0RxgzS3CKRusYB2BFds9OjsJQHoAGcL9LiulLu1yQXWMT4=@vger.kernel.org, AJvYcCXTaPC5j5cA6t8f1pi3cgK6hkQtgrCvFIax57/OFN6dr1juaJqTE8/c/BC75FrL8rFJDZZoiGNOkY+bHzY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgSXIQah38klnDENpoGRSNX2FAd2QgSCJxMV1h9e2E9FdXIfr1
	zkZGzOIW+GeJPCc4au2lh0FuhzJt/vGR4lQ6ruB400CVLJRxkTLgAjZ4x1HtnexAfYJH+/Kc8PG
	WtH+rZZHHd3dyqshg+kAiyJagKrWLB8se//tMJcI=
X-Gm-Gg: ASbGnctmFy1jlXdYyGiu7clD6irq9TBjy5yWGyS3FXYNWdD3OrUphVahFs6kQUI611o
	gqKW3e5nN/yqi9c7XeJlOv8dLDGNGvT1pPIQQYwaLqwKe06SSeWOb291CRot6W62VPI2qtkaLAQ
	TqxqvYnUou5WBbC/GMI+uB5tu/pdVu5aiZtuBFX/6i/Atm60O1XYPXdktdu9IO8UYeoHR815kp6
	zjZqnM=
X-Google-Smtp-Source: AGHT+IHS8CYjJ4Uox34B5QwX+bOoDFcJsRHXN/gnJP52JWMnOUQ5TMhVd6PKJIQJ4J0wH94fnk6IQbcllBpE6ThbE/g=
X-Received: by 2002:a17:907:3e9f:b0:ae0:a245:2fef with SMTP id
 a640c23a62f3a-ae70112fbc6mr1213767866b.20.1752514642203; Mon, 14 Jul 2025
 10:37:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250714140651.213850-1-woohee9527@gmail.com>
In-Reply-To: <20250714140651.213850-1-woohee9527@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 14 Jul 2025 20:36:45 +0300
X-Gm-Features: Ac12FXzZXTwWek-3E3s0kT-QtlLxqkYpdEk3lPMglBFHQC3lg24MEnkpPCDn3r0
Message-ID: <CAHp75VdsiettsHRQr3cEmTiaFMUUZwGYUzgmY4ECKCwVFnsH=A@mail.gmail.com>
Subject: Re: [PATCH v2] stating: media: atomisp: fix open brace placement
To: Woohee Yang <woohee9527@gmail.com>, Jongmin Kim <jmkim@debian.org>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	~lkcamp/patches@lists.sr.ht, koike@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 14, 2025 at 5:07=E2=80=AFPM Woohee Yang <woohee9527@gmail.com> =
wrote:
>
> Fix checkpatch error "ERROR: that open brace { should be on the previous
> line" in isp_param.c

Missing period at the end.

...

> Hey, this is my first patch, I appreciate any feedback, thank you!

Already second iteration of it :-)

Is this the only file in that driver with the same issue? There is
another patch floating around, perhaps you can combine the efforts, so
only one patch for the same issue for the whole driver can be applied?

--=20
With Best Regards,
Andy Shevchenko

