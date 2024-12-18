Return-Path: <linux-media+bounces-23690-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0D79F61D1
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 10:34:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C0DD2189497C
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 09:34:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DA2419993B;
	Wed, 18 Dec 2024 09:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K33igeB8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6521586C8;
	Wed, 18 Dec 2024 09:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734514313; cv=none; b=MgTxObFmsB/+pv5l5yptzGRkDY36WycWZUHxHt4UgKIygC9A/Xe7FdOTYVXiZNAsYbvUSrndqAI1dQZvqD/Q0StyKROOJN/Un+7na5a/5ioNlrP4sqxkBK91yC+khvHPlyoZk9k07GN4i55TsFzl4ImQEwPf6IcKD1Z61YtD+yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734514313; c=relaxed/simple;
	bh=xe2AmEwFUOiVHTu5xyqxJhNtbQkqQ1XTqqjjp0c/c60=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n2j7pJxSh9oP+7ANZv2hlROp3/U9lD/HCU1RRLPsStJ1J7hAxrgk1mV7/zetX11AMFqq7aQkfKFBkRqiNcaX8du2f4gkHw/RzkD3obW/WBBhIHtrqG9nvnuf7FBISe9MxxZqSuYKijc0j+tEojj6ox4jlgDZqkD9nMrY/BHNh2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K33igeB8; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5d414b8af7bso12760848a12.0;
        Wed, 18 Dec 2024 01:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734514310; x=1735119110; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lZ1YdJtb3rH3TiiKBjVM/1DqFETQgib8Q1Jqh/ZOeHQ=;
        b=K33igeB8jDDnXV/F38J7ZYwhRCskR3YvYgdkttVSmcVOdLrRPc+W3g+XP70R5/Uo7M
         gsj8lWTt/aFaQriJJgPDmjS/C+g6CQP5BcQZaUTQYH7bnZw3RVNKz/++veTGwBfWbKA6
         BrIilvYNr+O+YAoKxl6WLHWGLN/RavFZhrKIZ/bNKF/2yjPBwBwltM+qjVIGvJCoDkIt
         WHwWsY1YYd2Tb3FQaRE1Fp2xfNpNvJV64zZZUCpersrxJbNWo9PYN967KXctzV2x/OMQ
         wA29om+UcpNojbl61AhwZR+zrBcnT99aIxtPuCvNOciyX3fpE/YJzrWtt2B1bM8pVJzs
         hCdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734514310; x=1735119110;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lZ1YdJtb3rH3TiiKBjVM/1DqFETQgib8Q1Jqh/ZOeHQ=;
        b=Fn6idlVX+uggIJimzfBFI+z+FIkj+F1KHGmugVcpKHbj3Eu62AmG+fK5ctI6eURzGJ
         TzHgVRtoH69kn4PGgeaT/VaOUnSK0/JEHvswg8TdAShYvVK1vlDVaWF1R72JP2HGQTJj
         xjhUFezojSHLeYNwq0dUmPbUGHwq3Gs0+/R6JSBiZWWxXNfNFMEVyV5OshceP2Cd76S0
         M7wrJkfPbsWvwSzbQS27ogtloM7Mvgt0+SPWbwZwhWMbjv8ukkkZeKF/PxS3rgFts7ja
         3GQ8TiJMfJzeigE2jQ9o9xj7+cjiPGkd/7YG6XY3oLfN2DJi/iELKiQ1kPIi2comLToR
         9WOw==
X-Forwarded-Encrypted: i=1; AJvYcCU28tAEHIgQXL3LdUG71sdI+sW8Oq7dXtkWPuOIac2m1D5HSlnqFeTeydeal6YKyqHDAbndMx0caN6/wqw=@vger.kernel.org, AJvYcCUTr2AkccvqcC5U5j2x9JeMoGqASad5zE8MpsXfLYTKvzZ9pL9EzpRFYLYg2+eux+68obBZBWb8qz9Ez0Zh@vger.kernel.org, AJvYcCVbo9SIpWqavaYHM46bV6XKmF35AmpaP2WBLGeLx4rdw41dpGEr684E0sbJmNQs5kmYXNRNmLVyU69Y@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb3PSJbu+vAyMUmD+7zCM60cTfdmNdRBUFtrrfJ2uKFMN6aXHA
	73deikn9d++g4yM3sezfWKRbAkLd/gKZPSyVBqqkxj9Cn2ws2FXOENsHpQ937tLBesNhS9nMLvp
	RI0MthF/0fgNzoYFo+GQK8Ucklxs=
X-Gm-Gg: ASbGncspVj5Yq65NZV0eFtjRKzq/vuvzL6q8HL9SMbAdPNBOEObmwtBtVzgstH+pWtK
	tTATPn50ZO+txi+mhQfVYVMRznW3UOuY6ZqSn9lc=
X-Google-Smtp-Source: AGHT+IF/HJ3QAgvFxebOkkyGf3IJ/58S2RyS6Isz4e20ApGWFi/5XJPLoatg0C6IO+UJMagSFd9s235qMqMYJQbhRJU=
X-Received: by 2002:a05:6402:430e:b0:5d0:e2c8:dc8d with SMTP id
 4fb4d7f45d1cf-5d7ee3d5b5amr2063811a12.20.1734514310075; Wed, 18 Dec 2024
 01:31:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241217-loongson1-nand-v11-0-b692c58988bb@gmail.com>
 <20241217-loongson1-nand-v11-1-b692c58988bb@gmail.com> <x5hka7t2sxeac6nesr5r47s5bmbbiksyvky5hqoelkvaxcuhiy@7fsxv2y7deag>
In-Reply-To: <x5hka7t2sxeac6nesr5r47s5bmbbiksyvky5hqoelkvaxcuhiy@7fsxv2y7deag>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Wed, 18 Dec 2024 17:31:13 +0800
Message-ID: <CAJhJPsWdbmOHTtqPxXDjr+hn1RhxpWobr6m+Vinc+xBT8QhctA@mail.gmail.com>
Subject: Re: [PATCH v11 1/2] dt-bindings: mtd: Add Loongson-1 NAND Controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2024 at 5:01=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Tue, Dec 17, 2024 at 06:16:49PM +0800, Keguang Zhang wrote:
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - enum:
> > +          - loongson,ls1b-nand-controller
> > +          - loongson,ls1c-nand-controller
> > +      - items:
> > +          - enum:
> > +              - loongson,ls1a-nand-controller
> > +          - const: loongson,ls1b-nand-controller
> > +
> > +  reg:
> > +    maxItems: 2
> > +
> > +  reg-names:
> > +    items:
> > +      - const: nand
> > +      - const: nand-dma
>
> Are you sure these are separate address spaces?
> <0x1fe78000 0x24>, <0x1fe78040 0x4>
> spacing/distance of !4 words...
>
Sure. That=E2=80=99s exactly what the user manual states.

> Best regards,
> Krzysztof
>



--
Best regards,

Keguang Zhang

