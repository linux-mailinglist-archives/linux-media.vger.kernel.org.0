Return-Path: <linux-media+bounces-18900-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A84EA98B6D4
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 10:24:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D8D81F22562
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 08:24:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C77EF38396;
	Tue,  1 Oct 2024 08:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iJ0Rnyb+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDDAB199FB7;
	Tue,  1 Oct 2024 08:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727771061; cv=none; b=l4o4f6hImX+d7YjSR5vuJvYPeYrY9IY05rpytt6yaWtFjGXads7MtKaK6ZWb164r8XIO/cxaUf2Zu9bU/uiUYB67YwXdeFdZGGCuSvqKlEzGxXXy73ZNrtrEikw+lNqM/4WuhIKhEl5n2kKPVRD1mKmpunyrwKSEZOyZFA3aiug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727771061; c=relaxed/simple;
	bh=4aYeJqfVM+UBTVmgpt2L5qLuf9PzAtiqvs5TWauk3kc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uo62lXW2gCf/bGN72z9YrPmz/9LRG3Wwj8LN3x4zQxqB2i9q+BcusGaA8gAs20aKya9As3Xol1P71NnSPnf/F4U/e/4FyAwLF+9BvRbU3AYFABeThvWsA9avlX/q1cwbYELdVqJbKEG/Na1VZ4OjMOutfi0Yf+p7MKSiKVRa2UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iJ0Rnyb+; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3a0c9ff90b1so17618965ab.0;
        Tue, 01 Oct 2024 01:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727771059; x=1728375859; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6hay4qyyqvHx/zFHX2AwpWBTeYS4cuDqgVMRov7aBas=;
        b=iJ0Rnyb+gZ8DQrt1nDskrjEcVx9b/2s33BBca5K3U7hWrYP3vHiTwkErlFSQ5J3PqG
         S6Gg87mt3AnKTLK4WxqIqLq6QLud9hNZSXZcagqsWJkEJWMv6Q+FFp0LvU9NPC6a9emq
         V2UMJOglumHcAG1/wp5ODAk6W3Pm+BfCRXHhufmKhg9TyZggnVA13fX6C5TaowAApkRJ
         h1A0mVcMWUM+5r3WkNPVl2FvRXajH1ka1OsoTte5diNM/5dUscCJ5qIhSRfoYqHgejTq
         kZudcNBk2gQVZoSm+pG4Si7AhU2Sm3vxzc1d3CDVZ6cDVsPTPcDouLQFZLSQJIW03gvi
         E/Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727771059; x=1728375859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6hay4qyyqvHx/zFHX2AwpWBTeYS4cuDqgVMRov7aBas=;
        b=Z/5kG/KTosATUVebRUZz1l6QQqKSMmULNBnpEC3kaV8+c4aMryoxQ+2ETjnjGfgmmz
         ToehZK0qQZv5+n8O2FjMAk8QvmXmLQeXjgzzh9jKMpLufcT1nMfKhjkI4jH5fjJtYC4D
         9X//jHPMu6TedlTsELwH3IxqK3WhZfGYeABkXNyka9WTUD7rtYj3eIDuKjUqIUz3Kg1G
         //+CnBmAYfImmEGRAvBuuvdnT69o2zpQ00Ot1i7e1fiQa1D2ukPYeai7ivaT9wkprXY5
         RGRgAFy0QFzQX4cF9VfTHT2g3hvNrOpeI0I71+QvtdUueWsirQRyljrxsAhegjEyxqeX
         o5AQ==
X-Forwarded-Encrypted: i=1; AJvYcCUk9Vv0mvJUMLnoNk4n05ptfPU+zwf88FHIdErLJi+q6+vuLkWU78ECu5HWgVLFRWwbpqH7nerSxbcHK0w=@vger.kernel.org, AJvYcCWRV8BW/Dva/XiMYlSzG240efhFPAEQ9JCsuPnoa4zIVUZCr3z16jreZkNKpFJ/praYG6d09pC6G6rx@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6NX6Nrs+zw0wuxN5lsDamJFzDohvE9cdV3HTHccMCAWNNlpv8
	PczA9cCgascpXg767v7bnXMoVtfPjyj1YBhr9HHit8eH9RWpK1J2pM/U96N0nvF7ZA0oz++FxPc
	7CtqFiPDlqQigrIu2d68AalCjNJ7PMNEd
X-Google-Smtp-Source: AGHT+IHrQCLlxQsomQIlcok+Q50oQJVpkCHGtVWam8sjavYpUbkKeVdrdFOdAWRVgOGAdYBp7uUGJs6u4obMBbLY/xA=
X-Received: by 2002:a05:6e02:1a0a:b0:39f:36f3:1957 with SMTP id
 e9e14a558f8ab-3a345148113mr129934285ab.3.1727771058796; Tue, 01 Oct 2024
 01:24:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240830070117.9534-1-eagle.alexander923@gmail.com> <2566e769-45d6-4b15-887b-86449181645d@ideasonboard.com>
In-Reply-To: <2566e769-45d6-4b15-887b-86449181645d@ideasonboard.com>
From: Alexander Shiyan <eagle.alexander923@gmail.com>
Date: Tue, 1 Oct 2024 11:24:07 +0300
Message-ID: <CAP1tNvTHVeTRnaBX46Fabfwm5Hd2um8WOCUShbdihZKSWewkEw@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: dt-bindings: i2c: ds90ub960: Add DS90UB954
 chip to DS90UB960 bindings
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, devicetree@vger.kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Toni.

I don't know how to use condition blocks for YAML format. Can You help me?
If I understand correctly, it is necessary to create conditions here
for ti,ds90ub954-q1:
"link@[0-1]$" instead of "link@[0-3]$" and rewrite all port@x part.

Thanks!

=D0=B2=D1=82, 10 =D1=81=D0=B5=D0=BD=D1=82. 2024=E2=80=AF=D0=B3. =D0=B2 11:4=
4, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>:
>
> Hi,
>
> On 30/08/2024 10:01, Alexander Shiyan wrote:
> > The ds90ub960 driver can now be used for the DS90UB954 chip as it has
> > a similar register set and configuration.
> > Let's add an additional compatibility line to the bindings.
> >
> > Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
> > ---
> >   Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.y=
aml b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
> > index 0b71e6f911a8..86d43d949dd3 100644
> > --- a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
> > +++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
> > @@ -19,6 +19,7 @@ allOf:
> >   properties:
> >     compatible:
> >       enum:
> > +      - ti,ds90ub954-q1
> >         - ti,ds90ub960-q1
> >         - ti,ds90ub9702-q1
> >
>
> The binding lists 6 ports as required, but UB954 only has 3 ports.

