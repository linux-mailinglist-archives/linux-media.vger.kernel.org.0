Return-Path: <linux-media+bounces-11820-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F76B8CD34D
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 15:11:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3553F1F224BB
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 13:11:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACC6913BAE3;
	Thu, 23 May 2024 13:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="czZ5TzqR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E082713B7A3;
	Thu, 23 May 2024 13:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716469909; cv=none; b=IP9Cdj8reQ/SDF4qv81kUEWbthCsdrF/Nyse1NrNXrrl7pOqnSnyrqHGivpXLpJWL7UiqUGQJ6GnNq2daboonsDT6sjSLoUv3QShe3iki4c6UUgGvCIBpMFqm/kMwAdXxVqx5Ru123JmOeE9hBkg/BfClX0+4RQIDYsfFnPTx2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716469909; c=relaxed/simple;
	bh=CTAi7uAh3hw0fyc/JAGHfY4QmcgVYQ7mafxfjLDxk7k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jkajT7mPmiPHNcS/jfXO1c62QoqItE2h+vhiJqSvvKfnnZV1EkcXmSp4KC7Q2fGFYJfghtUKccC+iILeFNJMcLEkmQ6el1nbabQtIaAjv/nZKtgnuMVegPNzsxsoCi+lRQeLc8Hz7GJxLNc+O0PrWWuBLwJWl/7c2uzWTH40l1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=czZ5TzqR; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2bd8e2fba43so2039221a91.1;
        Thu, 23 May 2024 06:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716469907; x=1717074707; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2DhGhb3qaQgpGCEagQ9gosBYwgoeJqPd2hTqiYo9NIw=;
        b=czZ5TzqR2QuTOXxuAHGuHasbpvaORPK6phObJKc6P/BUZhkcwafVDZZ4Rb1UQ/VyOb
         G5yk566a318HWzNo3vBOrFgyUR6o8VU0sC7spb4boq+ESrS4503zfVwlnC+p7MR74tX7
         CltXFNl+hilFsnLlDzkdADrCvhRhSnp0kLT+x+a+eUqt0Io/90e2nDqY+TAhbT0yysqD
         8OXOTWPE44AIWh2rQneYhMqYD67SZ76d+V6Pe+iWBUT1IgKz3R+Y6cBesHFEKawlJQfP
         +7e0ZyTxs0Z92X5OnOhQFF89qr652fE9+1g2zSgfNBdbLoHfd5MX+xpvfaDCwmcq5I6Y
         EOWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716469907; x=1717074707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2DhGhb3qaQgpGCEagQ9gosBYwgoeJqPd2hTqiYo9NIw=;
        b=rx5m1/Z87OYj8fy/L8ANvjD/7iJ/GY2qmgs5fqLMc4SxKQJ4ny2Dq36kOxs5kmqxlN
         S0DAutEXPhxW5awolGN2CO4UDJ8vRrqkqfxrPNNhvbw1t7XAl0ziYlgy6ISPoI92ms/t
         9FhPlDizkHzVq8zGcX70tj85r8keEKSjrnhi+wYbBoriYYAJFfDrRfc4YWtKXR1dC8wz
         kezLQWun3Y6SnJjomZ/3gchLSsAgasOsiUObUzAwqtju9BwLRbecQnlA1Y5H1P6FXN+p
         jhBzMD3VS0F+ozJfmGzfyikep5xEdXw+1uO9d6egD4x2jMLvO2zU0NaIjefZrIUz8cIn
         0lBA==
X-Forwarded-Encrypted: i=1; AJvYcCUXcGpV+8Pb06bCgZqmKytRgX3G9tbKK497k3k/Gk6Oxs3ZV0byZ9MqmusotBgly/x6mXYgspDtoRQLrgMMdjwRZB/P8J0oohd+J+mkr1G2jYb+JgkmhWUFcjE6sRp0LUs7aU6znpIpMLRc4fpW
X-Gm-Message-State: AOJu0Yz/9uQWRgsIGlCFNI6S79kuvmr2fnd9gfX/9Tf0zJfiexhPZ6Im
	eKehGipz/z9v+D1gUTTytBJiX+fGcgBLDmpwYUnEXztwy9KW4QOOf26oe4H3jvHmbxKAeEdSPZ7
	w/lL3ErVrKmaWZHagaAwGhptCyEex9neE
X-Google-Smtp-Source: AGHT+IGK+NIx15YUTmkJXHDilfoMMwZMHnFNcL/O+LXfRaWUbZOkx9O1XfTtWk6TG4ApmDtdA1FSKbrsr5PFoyySTME=
X-Received: by 2002:a17:90a:8d02:b0:2bb:b23e:14cc with SMTP id
 98e67ed59e1d1-2bd9f5bf56dmr6074131a91.42.1716469907088; Thu, 23 May 2024
 06:11:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240308121021.1732-1-yongsuyoo0215@gmail.com> <f5272fc5-8d79-4717-9ad8-c503d8abda87@web.de>
In-Reply-To: <f5272fc5-8d79-4717-9ad8-c503d8abda87@web.de>
From: YongSu Yoo <yongsuyoo0215@gmail.com>
Date: Thu, 23 May 2024 22:11:36 +0900
Message-ID: <CANXPkT59y5k_DXgk6DDHbGuR6aqwLN1ugeLhFrEmk=c246i9zg@mail.gmail.com>
Subject: Re: [PATCH] media: dvb_ca_en50221: Fix a bug for detecting CI MODULE
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, Hyunwoo Kim <v4bel@theori.io>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, yongsu.yoo@lge.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Markus Elfring
Can you explain what I shall do more ?
1. What is the "typo" ?
2. Can you take some examples which show the "Imperative wording" ?
3. Can you give me some examples for adding "Fixes" ?
   Do I have to use "Fixes" instead of "Fix" ?

2024=EB=85=84 5=EC=9B=94 2=EC=9D=BC (=EB=AA=A9) =EC=98=A4=EC=A0=84 1:25, Ma=
rkus Elfring <Markus.Elfring@web.de>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> =E2=80=A6
> > really connected on TV. This means that the CA_GET_SLOT_INFO ioctl
> > does not return right informtion. This is a Bug. We fix this bug.
>
> 1. I hope that typos will be avoided for subsequent change descriptions.
>
> 2. How do you think about to improve the patch further with a correspondi=
ng imperative wording?
>    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre=
e/Documentation/process/submitting-patches.rst?h=3Dv6.9-rc6#n94
>
> 3. Would you like to add the tag =E2=80=9CFixes=E2=80=9D accordingly?
>
> Regards,
> Markus

