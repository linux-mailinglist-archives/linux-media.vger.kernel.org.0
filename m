Return-Path: <linux-media+bounces-37701-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB0DB046C1
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 19:41:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 00BA31777CB
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 17:41:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D7CE266B46;
	Mon, 14 Jul 2025 17:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BC4iwI5y"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A91525B2E3;
	Mon, 14 Jul 2025 17:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752514865; cv=none; b=ZRYpDy6UcZkBV1bxpc1tlQDLOtasrHzVOHu+b7EELceIptmwkKlIeOdrJT2W0VW2+R5/UnvbvGS353UP/l9C/dp++L910SHK3aaNWW1yNoD9cqTsl63JDcQRGBosd6WSFXzEJFkrpVkxqvzD/rcwUCJcta/RrQytbx1mDllvPT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752514865; c=relaxed/simple;
	bh=NPFd3R8ciXJFzWHMJJumcx2y8sJv394JB4rAdNTOTZg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GvIBQwKzSgqKaSLg6SeN+VihVAfE8hjj9CSW7gMlMXLVlUde/hVwQ0nMgrsV/+KFCzWQqzpDTWaECgz7gZZJN6X9V7PFcQJDNcAhOaj/ZUIm9e2IYjSYhNQpL6TXuT2TXR89PcvSYR5JrC4W/QBQxajVkBmdGAF1vKpDvEtRztY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BC4iwI5y; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-60c3aafae23so11670977a12.1;
        Mon, 14 Jul 2025 10:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752514862; x=1753119662; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NPFd3R8ciXJFzWHMJJumcx2y8sJv394JB4rAdNTOTZg=;
        b=BC4iwI5yTOfDUcFGVe4m+E1kgIIDIk7oy3gdDScjmHHYIsDlJvhCPgVLOpPO17mY6b
         3l8NuE7+b0RsolYWH4WQWlRETfZTsvy/MfCy7DKXjqE3IzLInneQV9D9x6bIXbzzc/kP
         tTZ0KFCiXKTNpzty424NbOLeUAr1Q/UMSbj5GZ4cVtXlXxmpCIW7xaRsACsvOaaueerx
         e7zCIlanjatsEZ3X5ZwZcindOteMJFFrib8MF6OLB5qS6XmmisqZ/YQct55OGUgh6HXs
         KC/klTqfhcwV25WQ+RjMCS62cKbKbCc9I+5VEGDqY/k8cOr4/XG/rXSHQSePLcWB23TK
         G2dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752514862; x=1753119662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NPFd3R8ciXJFzWHMJJumcx2y8sJv394JB4rAdNTOTZg=;
        b=gTXFS1qdyd+GP8vnCVV5W9wgehQIUs1s9EVkQ6htpgEYLLjOP3NwHVFFNofAjRK3Sk
         9rKrDcV9PusODhlr9mdnxNnU5d+/pZTB3tHrWcz4sqOj4zb8BimEbHp+giBv6K6OzX9K
         ijXWflqCFuNZ7bsamH56fAu2zFj2VwgL7d7dokes91cvCpNkfuIoxaSbXQ8aGvtQbHBT
         6dA30E5oPsUIXcT5ypVwTbt9AVOgaGj6Qz+D2Pv4eJhYbv5NKYawJTuper8k2lAOco0A
         kEuyIXdWdoPSZEjgesexe8SFwKKFDf87x/svYMpj3hMqesUnBeQFVFFRs2yV93apTKE2
         4F7g==
X-Forwarded-Encrypted: i=1; AJvYcCWgYjLZaGYprP5a9LkcBOrYs2XAsalMtTIQsursOxCgt77K8EbC3FA/laiyL9Yn6FATDRWcErYQCuWt1qk=@vger.kernel.org, AJvYcCXYttmRcFb2vl4IfD3Ino8BKqRmtByU5r19ezktN+wAUpPIbrq3lku0adPCyLDTmPzMLoC8iKVgBJtIaG8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgCKbXE275RZWeIAqPYc8WBvLRgLKO6jiR8RN6vkKVe/pFnh7d
	3mF4d5+qXGx3fZWe2+GSSFwMXpMvbXWZsDjehsq6s2KbRstvOuh2qRM674O9xWhNprHPQ5ReUfO
	ogQAjyeBqqo+83U2aeF82nA20BijE2Nc=
X-Gm-Gg: ASbGnctoHQX7y1bmzx8fdxXqAzxL9HjvBgh8ope8jK6Hfm9Rg3kuoti1ILRU/OkBLjo
	QPJv08egFIUh/JN1M44Nj/1ToSMW/ijRXmJtydOGKnMrpB58c9FFZ3ur1U7kMS+f2ygUPZoJjYb
	vwdl2Qjhl67O53uv7j6SgcodVBxp3V4yVhtht9Veew9/bzYyTogf04ViOTBHqkp2JEoRcSXMKNT
	b9OqOg=
X-Google-Smtp-Source: AGHT+IEXKFgpazo2t8Our8NWjsZVR9xU7lCVsLBI4sXrZBBdTjy4XX9xQS1xqz2uAv9NTIz6K+dT9Chhb64cXkuf+g8=
X-Received: by 2002:a17:907:7283:b0:ad8:91e4:a931 with SMTP id
 a640c23a62f3a-ae9b5cb0f68mr48082666b.26.1752514861527; Mon, 14 Jul 2025
 10:41:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250714134119.67280-1-jmkim@debian.org>
In-Reply-To: <20250714134119.67280-1-jmkim@debian.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 14 Jul 2025 20:40:25 +0300
X-Gm-Features: Ac12FXwPYmMO1EkQwRChQx0VnT-S9mLxYW7JoqtZdWg7MeU_PNj3a38ix5xAwm0
Message-ID: <CAHp75VfPZNaQsUCJOyhmwUd+GT-mkujTz2o5Ofx6oRK+QTuSFg@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: fix open brace placement
To: Jongmin Kim <jmkim@debian.org>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	~lkcamp/patches@lists.sr.ht, koike@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 14, 2025 at 4:41=E2=80=AFPM Jongmin Kim <jmkim@debian.org> wrot=
e:
>
> Fix checkpatch errors "ERROR: open brace '{' following function definitio=
ns
> go on the next line" in binary.c.

It seems you are doing something that another person is already doing.
Please, coordinate.
In case Hans wants to apply this as is,
Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko

