Return-Path: <linux-media+bounces-19729-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A25D89A03C3
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 10:08:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F5C31F21C25
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 08:08:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A41CD1D461B;
	Wed, 16 Oct 2024 08:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KSIN7/l0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6025F1CB9E0;
	Wed, 16 Oct 2024 08:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729066009; cv=none; b=bHo0R/YS6edrBJC2WDB8QU80P0HErlfKg3Zwqp1B9YBpWAvWqbnPAaWPCPchQTEtVkQrdmWdSaZcDfaaaGL3M1X7bZtHhqYMvu4PDeNPXQDHNFpW8Tr0duT3Bjbq/tWX8s3qeMBjNeMPde5sYxpl9MMrKw2RwCOELOwjKod9tMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729066009; c=relaxed/simple;
	bh=PT4Vtun/BbMcllI5J6eSVCHRLB1s1MTkKtm9vhNHMKk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JQVru79JFa1TE50X4Ocy3z5XiiYv8N8ehbgcy/oproldEgzAQFR0uqr5Jb7g3osFB+cYTli0xoBdjohFBHT9xZJyurNYtweeC/5+tcG/TlatR+s6F7Y+YTMMSmrbmnZnsFgnRsIa6vMDaYSNolXndiV3BaYwybV4mmlbsvYGffw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KSIN7/l0; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5c40aea5c40so1308580a12.0;
        Wed, 16 Oct 2024 01:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729066006; x=1729670806; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IZ+Pwy0sO7KTFjfQbkx5Q5BjDMCnpAj1lw8a8QHrCPU=;
        b=KSIN7/l0MX1hgYGGPUn3Rwl6M1liBAvyF/QqsAQhmnD8hlMcUmDfI1LNYlk95PCFMY
         8hw3h4v6nps1bGDvFub1YgVB86xUE/SuOFttFVhwC46747c2Yf7H/sE3RQ5iF8ZzSLD7
         uAYVp9ZxR47xuSNF718Oobho+r9JG0BGc7nh5Z5Eyur62pziDbIPVcGrPNmAtI99KX8u
         0dWpQKvNMeEjFjd3Y4bTbyR2Q8BCypxuZA4kjzXHyIzVc6bPhWWCiIHAb+g/ZsYbfr8z
         74+du1a4gwQkJYoYpfuaiDIwjdtKFM5Q0t3txQLaiKWcuB6BKS4rAWDrLzI+ZS7RVkb2
         6d+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729066006; x=1729670806;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IZ+Pwy0sO7KTFjfQbkx5Q5BjDMCnpAj1lw8a8QHrCPU=;
        b=ZtR5cx2joR1kw5efTDYgxKwrpYhLX4jptLuey71wwaQYUSD/JF+Pi+LqNDWM25JTgt
         YNePG+PrTZJnm63Y5Noiku8ihrqiKWYA+MWUd+AgWWQOq9ZKGvZk+hd6sjsx1qoZUVUy
         vaR5/i2nGsMx/917HFuW5KBjh0wzI4VFZjAyCBmU7o41kkji2GqXxxMFx5XNvMbZ9JJq
         2NGuQgI/wsmRdMDKI9DMoWIPsFP2dMj0tXaY6vwgKw79Gjw4bWRbQ7CqUMbqwnj6bwoN
         0cI/Fe3z8Cx2n240qctrZXbKwHw0QXen9HQ+v7J4tSFKH17k919QzblJfbmOFs90Gj7n
         0Jyg==
X-Forwarded-Encrypted: i=1; AJvYcCWP6k+YdFj/IV6T3R/Mt7xFJZRPaahkBE+8ZRTVT8SqabR59KRF7C3MzUjxg8UVkdRVlUY52RIwbmRk4dk=@vger.kernel.org, AJvYcCX6FhmTOKMyFSCrpm77a28v5U5qJyQC8PjB14MxqeNILjFCPX8jsjqsnNvRcBI1I6IziOYFpxmlXgFB@vger.kernel.org, AJvYcCXJfEj3sA14IBQW1LP4GvzpCeIXRuZs/p8y5/W5zK+QYHruc4Am8r0pPNRHR8BUOrysWc2hRXvh5th35mWW@vger.kernel.org
X-Gm-Message-State: AOJu0YxeOexn2KoxWuQgPzkkbJAAMP1h217VwGJ4TX+4INDW+YuH+EDY
	NFbhBgk/TvQ3hQlRPZj0HM4urLZvPBryjeCmyWMnt+XDAxHL0Cy1/jWADePIYZMI5zGkLrgi8o2
	jCbdcee9lkwwfruJgE4XmTk+aBEg=
X-Google-Smtp-Source: AGHT+IELHAX1Zdgya2iptNDYcVweVOP5k9eiqHiaYUUTND9YWXi3LqGeoL60P6fovY+AORNzpYwtKnigCag2iUcXFao=
X-Received: by 2002:a05:6402:84d:b0:5c2:5f31:8888 with SMTP id
 4fb4d7f45d1cf-5c99498135amr3427379a12.15.1729066005384; Wed, 16 Oct 2024
 01:06:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241002-loongson1-nand-v10-0-17162eff80e2@gmail.com>
 <20241002-loongson1-nand-v10-1-17162eff80e2@gmail.com> <20241007161027.386e7409@xps-13>
In-Reply-To: <20241007161027.386e7409@xps-13>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Wed, 16 Oct 2024 16:06:09 +0800
Message-ID: <CAJhJPsW+cRY13in41NpTrEB4VP7jYLFdgrt8+9EJSwgkvXZR=g@mail.gmail.com>
Subject: Re: [PATCH v10 1/2] dt-bindings: mtd: Add Loongson-1 NAND Controller
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 7, 2024 at 10:10=E2=80=AFPM Miquel Raynal <miquel.raynal@bootli=
n.com> wrote:
>
> Hi Keguang,
>
> > +patternProperties:
> > +  "^nand@[0-3]$":
> > +    type: object
> > +    $ref: raw-nand-chip.yaml
> > +
> > +    required:
> > +      - nand-use-soft-ecc-engine
> > +      - nand-ecc-algo
>
> Actually I told you a mistake. The no-ecc-engine case should remain
> valid, so we cannot require these properties in the bindings.
>
Then, remove this section, right?

> My fault, sorry about that.
>
> Thanks,
> Miqu=C3=A8l



--=20
Best regards,

Keguang Zhang

