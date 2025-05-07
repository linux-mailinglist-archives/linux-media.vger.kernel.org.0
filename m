Return-Path: <linux-media+bounces-31890-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DD142AAD5D9
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 08:19:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EAA0C3BF83B
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 06:18:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E39991FDE33;
	Wed,  7 May 2025 06:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SdBRjx2z"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68514A00
	for <linux-media@vger.kernel.org>; Wed,  7 May 2025 06:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746598740; cv=none; b=uNM6Vhu2zGXiSw3+n9DVXzktSfmOrRb6Ec8FCpRHE18lhVLYMkc2tpzYRS95YGtuVvBuaOJCtQIdBmGMoAKsAjR/GP3i3pjGIDIcRuxdCCdVICbVtXCfWoaNzmBZPeMJ+Udqij9YlArPhJ+fS47UDL3C81M7XyWToqNOUvy4B/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746598740; c=relaxed/simple;
	bh=jRzauxG8qR7DrFH2M3BxChSU26/fzr30MFQS+Co3yB8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tqAjvR3FoND0M/aKQa+H64Of7fA7jDF4VgPzltcX2OIfOp1ICTcTa1P4uNQ8vMbaZIMT8pAE+6loXESJmJJylShuMMJIGJAJqG/6CPJiHFbMcump2hQsGbjJWwszBcr7i2u0xlcVdn8nznVpf+5xouqz6nVQXCkPNE5bxkhcPZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SdBRjx2z; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5fbed53b421so587956a12.0
        for <linux-media@vger.kernel.org>; Tue, 06 May 2025 23:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746598737; x=1747203537; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jRzauxG8qR7DrFH2M3BxChSU26/fzr30MFQS+Co3yB8=;
        b=SdBRjx2zrkZvuWw8vkgEGbn8IXnhmYtOxdmn13Rme0vQvXRwWH4epmiFyAmWn71bBR
         zXW8nL8mK4N/uswKH0v+WZKznog2fNtJGj61zDqU9sydlAjWpk0brVQK1QpHQl/MGkA3
         rbjWSGg85FoNQVDBk4eFZzNn0RrKnoSpPv6RgK+c50RGfmDMICmWCjKbsdi5tgYcQRjc
         hgkJsAY8HBrXTlGEE/QX45Up4Pt8tpfKlkSFmxqPGHbvcYkhE35bltk+oUKitlFjKqO8
         7XwsJLWqKrK9/HFtECXxYn9snS/JREv1PSqdXCcbaFJM8M4J8slQnsHjbqTv69Ligmdk
         O9jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746598737; x=1747203537;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jRzauxG8qR7DrFH2M3BxChSU26/fzr30MFQS+Co3yB8=;
        b=RLSuuINP1gtgBgeUC9vu1wPhe9OysHSfhAetqnBtN9Mniy17x5k3BE28eX0amT4WcC
         yijGu4y/wtZQQ14IaDcpMrPGL1bRpVGJV7ZVkrL19nZbI9Nxz8S+JmDCdLqry2XgOxzr
         xS0XYrWK4ouv1kAyBV8o8j4pjQgRiZ/PJyVnr6HXgS0wrBfhZKehz1bnkHqcx0B9fo/L
         IbooviTcWHho3rRdUXhFa7E1+UbObLPUNzYuFX9iGjytpzc5FcNZ5mpTtCRULbMxgkz4
         FWFwNgF1ooLXPDJJ8RzTeta9LL2N2ia9dWYfnO5Ifo28HdIEUlz4bzwJprUgeHR+AFiq
         x03A==
X-Forwarded-Encrypted: i=1; AJvYcCWbGswmCiAzG3K4EYxrAMy193+slf9fxY1tJtcBJCqRfyvP1+v61g+e+ko4DwWJaCSd0DaY/LUronujZg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzetF5vDIy4JKQfw83pPCV9EblT7V0/v09V+QviVRZ4jRHiHKir
	ETQ1D+EccKcQ1nqrUj02cSTE0lZD1UBQGMaWat2RlVJrHK4PpDywJRaBDe1FMwCLSp1fJS9805f
	QcZ3PZ0jIQyB3r4lspoqlR27OmW0=
X-Gm-Gg: ASbGnctDhxiAMQRjHzOovDtxhOBUShxe1N+KV58z1UEpPNA5QUJ3TXoSW1+yZvjfEKJ
	S5A6qgt4pUy2E05zAFaSotLgl3qwL2cK+tUA+6hmpRcZFtr132TuwZvq/h8rWHxhsPIBnrto1ug
	1zZFmZlfJOEVMiTZbu/pnNUw==
X-Google-Smtp-Source: AGHT+IFoiChcX3Mm92XkfslD6rEY9k9x/OT7pcl49YY1UjXsKYau0uSOP8q25/rbEJUFDNgANTycINla39qXcHW9Tck=
X-Received: by 2002:a17:907:720a:b0:ac7:cfcb:c3e3 with SMTP id
 a640c23a62f3a-ad1e8d21cf1mr203257766b.45.1746598736807; Tue, 06 May 2025
 23:18:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250505210008.152659-1-hdegoede@redhat.com>
In-Reply-To: <20250505210008.152659-1-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 7 May 2025 09:18:20 +0300
X-Gm-Features: ATxdqUENbfJlxUl-dosBPStrL_9CYjBiZybCHXfYQAYi3xXPEImqLzYT0J-xWrE
Message-ID: <CAHp75Vf_v0YbXttzPz0H7joVc4J84kKUzZi3t-PHaEO-NS7=Ag@mail.gmail.com>
Subject: Re: [PATCH 0/5] media: atomisp: stream start/stop error handling improvements
To: Hans de Goede <hdegoede@redhat.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 12:00=E2=80=AFAM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Hi All,
>
> While working on the mt9m114 driver I introduced a problem where
> the sensor's s_stream callback would fail, which turned out to be a good
> test-case for the stream start/stop error handling in the atomisp driver.
>
> This series is the result of fixing various error-handling issues which
> popped up using this (and other) test-cases.

LGTM,
Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko

