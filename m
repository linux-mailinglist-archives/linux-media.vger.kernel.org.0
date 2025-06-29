Return-Path: <linux-media+bounces-36199-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B67DAED018
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 21:20:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 85FE67A5A86
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 19:18:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F3B5239E74;
	Sun, 29 Jun 2025 19:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dmwLp9g5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6BFA21CFF6;
	Sun, 29 Jun 2025 19:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751224791; cv=none; b=WGPpA6sZPy9G07gs8MBkobIz+fjsRkZitShUtayJxxg13byHaxtp1AgMvSpXxo5xQ3IZ9MbQS7qH6ebprbJ9XxpmGMZlwIVfGCYN6Vgpg/o7XBoEcE3pvy2VZwh4Bly3aauLbkZf2wGmVhxGLgAe95SAMzMZIj5GIO0G9OblObI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751224791; c=relaxed/simple;
	bh=fqvFj4fP57bdlkH2Z9EVvhU1TU+soWmoIpIUNeszUe4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mPXLdPKyaaY7s//G7UM/yLAmv6dN6WTiJAnpJS0OIyLyBj/r79etSHLd1bg15TQx1o6iQVT32Vpf0FgS5oi27nDr2UVy4iu3SaQkoBoD/psGgWpdGYTX/Aioa8DHiqAWAmUUrwjpYjuGBkV3Z0sSNwXfnq/RjnDzqZBPHBg3/YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dmwLp9g5; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2352b04c7c1so3688635ad.3;
        Sun, 29 Jun 2025 12:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751224789; x=1751829589; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fqvFj4fP57bdlkH2Z9EVvhU1TU+soWmoIpIUNeszUe4=;
        b=dmwLp9g5RER2DwnUvMce6caI6UPTupllN2ghcnKTm4cac/OIToLYB0tt+RfeymJHGo
         snSFR/mZzkZawGqKX7jXPXOSbHxUZ8ZZOU6T+/Q8dTpt5m8/0Z+OJDC752+QJbKIVUL7
         tGL48HDRl/+GCOEmNKgDvkVof79+qQsGxq29NIAP1lbOwgq7NmogIpqkZ48Kj4YBNgLb
         Kh1kKjaS2EBmllQDVEPL6NyvaZrN2cMCH2m+QhEmi4PxDDWjgRBPXsE8CdIVHkGAFlZA
         N/anDu+gya4iRyjRguWcm8qsYcJufWl/bxbppW3oetTQfBBmJKn6isDxkiH3bcb3T6vr
         uGSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751224789; x=1751829589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fqvFj4fP57bdlkH2Z9EVvhU1TU+soWmoIpIUNeszUe4=;
        b=dvZ+eLyjfBhrf7Lvy/CNJlRcgfF+tO7tqg+mBpv4XC3iqBc1Y3WOH565lG5mkPg8lh
         6Vn3d2VO4EV7v0sSbeVi9DC21QLcRh6l/+eJdK30FpC+g07KVPEXECP8M33NKZsWNmTT
         0DIgSg/qPFCVAKe96ZvrVRyYgqdtL4su5G9laKXY0AONE4dSY7GL9mTHChtRCLa21QmN
         zel7pWcris+8MOyMwCHoIHErfVEjBXhzc2/b9JGoUmIOEFe8HDNtohBpJ9ik0xrQh7lK
         IlENiVUaKP6v0fFhZt71IScEoUNOLA+HFUhHkZNsXllXMC2yYy7rajL8aHlICkALy2iv
         iTbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvER8yGFwo58ia7gNmkMv/E6ptsb2CjrN55PpwEoPVWEZ2kPzyj0eHKVrYWuMLkJHUu2ndSqdVwt8rReI=@vger.kernel.org, AJvYcCWe7dvLctOfc6GKxC5Dx/bpt0of1sL9n/OU3zHxYhBVJTFGpjm8VeKe8T+6acRqRWKBslmQQugVAK3SWZE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnvgSecDVKZpjOwIq/CR2hA4OqXAt9/Zwobrvj16BvY1OC+Ufd
	bdUoB8yYmsG6JEDy8DH/7fuOno3/uCEf/Q5T1HT8TNPtemQeNT3dXcmVfzSkN7v0V15MgSHInhL
	PDE4t5DRsIKNvknygFLEVeeaMaSQIZdw=
X-Gm-Gg: ASbGncsNYLmPQhS8W6hk3QSi0yUQNiF+4H5jY72GrkRyNFVpZoeYFZFHqVGa5vbXLZk
	DDbmLTxF15Lq+8hgzx3U0NpxgUe6npeblKIBiiAJ6T5H9X4Z7YR+Ft2lId+qfwJFlohXrVBqk6S
	z3Tu8P/47p/y/hWar/cfbUdoPH/1CNtI8chxrryyfyWSY=
X-Google-Smtp-Source: AGHT+IHaVfsV20gbxGDGp7LaY+Szjj4MSE87ay8AXbrRlFNzSCMZkBxp3FxomgpoZ7gVrxtk8A6cpio/2KB/6lEK1OQ=
X-Received: by 2002:a17:903:1a68:b0:234:bfe3:c4a3 with SMTP id
 d9443c01a7336-23ae86b628emr36405245ad.0.1751224788949; Sun, 29 Jun 2025
 12:19:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250629113050.58138-1-zaq14760@gmail.com> <092f5109-ca31-4949-bda8-7e0d946c3aa0@kernel.org>
 <CAHp75VfoJ17a=3P3fXHa2mN00S+hdz-vRtLfjmsT7-+i2NfWEw@mail.gmail.com>
In-Reply-To: <CAHp75VfoJ17a=3P3fXHa2mN00S+hdz-vRtLfjmsT7-+i2NfWEw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 29 Jun 2025 21:19:36 +0200
X-Gm-Features: Ac12FXyWIHNh1JvbdxU6VSHhJ3heIYBUycyIfCLNs5T8MXPWmqc3XrvDjIWToRg
Message-ID: <CANiq72nu3KKovTfkoSofNX05ScvP83Dc2GusP7JJwWD1g2rbog@mail.gmail.com>
Subject: Re: [PATCH v7] staging: media: atomisp: code style cleanup series
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, LiangCheng Wang <zaq14760@gmail.com>, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, andy@kernel.org, gregkh@linuxfoundation.org, 
	nathan@kernel.org, nick.desaulniers+lkml@gmail.com, morbo@google.com, 
	justinstitt@google.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 29, 2025 at 9:13=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> Yeah, that what I was afraid of. I don't know clang-format well
> enough, but it might be that tweaking existing .clang-format in the
> kernel can give something better.

Yeah, there are some proposed changes for the config that I have in
the backlog, and with a minimum upgrade we can also improve it further
(some things just couldn't be done well with the options that were
available at the time when I introduced it). That is why, at least so
far, clang-format worked best for formatting snippets or for new
files.

Cheers,
Miguel

