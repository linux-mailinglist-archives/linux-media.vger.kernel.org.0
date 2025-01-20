Return-Path: <linux-media+bounces-24953-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 777F1A16B48
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 12:09:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D4941889608
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 11:09:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68C1B1DED7B;
	Mon, 20 Jan 2025 11:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JCT2Li57"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327BF33981;
	Mon, 20 Jan 2025 11:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737371374; cv=none; b=CL0WyRGtNNGFMgd3Yaka8qwUAHlg8wz0wDHf9fn4LTVV+5NUAzqz7qGteKBTNoouwXasxD04J0ZOgevgAnNb2Ki+gotSRVOgq8SLU3IOkCSiwJLD8+yv6/PnkU8ku8+kfoirHNh/dR3bsITPHwA3Qv2QuejJ6tZdIMzDOg0S1Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737371374; c=relaxed/simple;
	bh=C/8slwMxYHPYZ7IgYlF6PI/DXhPxH2Crdo5un7XWvss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=inhTf4wS75naeIriqR8JqyUOO+YsoOS3NYb2zmuDwuYPmBmrDSvONa5QiG2wifHjHQrbCjks1pAlhV4kU883Fdnr6yP1iNFlMlC+s6CftNPJ8xg7jFohaexJCWKyYn5WpOC7XUU5y7HbLN9kG5DJFIv1JiX/F19d/a2KdLqr9sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JCT2Li57; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5d647d5df90so7285637a12.2;
        Mon, 20 Jan 2025 03:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737371371; x=1737976171; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7qaj0KW7RnBiUNuAPOybcuggWXwJyvY8I3ofIIw5iYM=;
        b=JCT2Li57Bpb1N7b2mkV5K3/GfG2LG3B5V+dl7SyTMc2r07Oa/kJ1d2QKNwD5isO8fa
         UNjVWVp4amdaPACrUda6Gvg3mjaZ03ijtoDKgY34aOW38WXfGK7TTpaywbBC6aadcYUN
         3q0wyuk2mGhOIosgCHvL9SdQMQhoErcPufMLra84cKj7YbsOQlepOlU7holOsGzTSbyp
         hYqPqchBlvAFqytLzFJ+JJijYBnDfvYHqADxVBCN0Yu5OrgwrwZZSLbk9R6OKRwHGGe2
         znPWAQXXXALT/gSqLsn8YtOhT3Z6bG7XxGmeqorH0lGIC1eMW0KJawNFQ9Q5e8qD7rvs
         BTkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737371371; x=1737976171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7qaj0KW7RnBiUNuAPOybcuggWXwJyvY8I3ofIIw5iYM=;
        b=ClwGt5+lXuIaM6KLIpSe3wGnH4uuZxZZ06aNV76tJgWwBaqO4SWZSnfpjjmmjLP+pM
         1QpIt4zWn0aqvalz9haDZLrT+4WxYBdEkQyv9k+HCF1mMR2fXaD7qhcmfGXSPSd7ET07
         KDO8dF3IEghdUmR+Me809TK/sOrg8xH2FPBNegZHC1V91wDQH5yI4Vkpz4UHl2a2jfXN
         w7iFNcUkx0tidj3Mzx0XsokZgjHm81QINtVSxZrLsIw4k4To6xdqqtnRxb/qd4N5N82l
         SZqJLuz5n7373YDkRftIQfovGcXocQ6u2Fb2I5c+k25dUXYIlhjttPm3iJjN4WW5WFE7
         7JZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzoxfI+5lKRwtXTLwmpr7vBE1IggXt1CE+gXCCjeuq68Fm3sodgtkwW02c1xZtlqgovmB6JhEQl49k30w=@vger.kernel.org, AJvYcCW6l/O3v5hks9yBLT3HszVzM/ysG2tUNuTY6S0WSWgY7TgfKMFyL0kgcXpyEEq6kBJbAy0hJGNEXHPt9OEe@vger.kernel.org, AJvYcCXiu/3yKwaJ8wZ7DTVbcVGMPxmBdCaD7cXnV+aESjS9hKq8/pvE5C/5SlGB1HRASiMNBd5BXZEb3RdY@vger.kernel.org
X-Gm-Message-State: AOJu0YytxGoStiT75LWwNpWynKGpNSqXfq87I3uuHLejjGFupbnwsSL1
	bzIpqz7Tr59NEfIYfmjAWbjjQ0TGYL8fC/SRvHjAvf9zL8sUJ+hWO9QwhyPFW/MBXtRpZitLKCt
	VmjXWrUlA8iXRjQuZiJNwwnwlYrQ=
X-Gm-Gg: ASbGncttE3gmrGl8s9aAFLfqFcGJBnryTXwELh1GyG4sJ0OugGRsuP6iu3Nxl7YY8hO
	kOtzk3fO65tIrIEZ3eQjbpke/x/IfAY8kfEftbTaykITbqQAwfyMN
X-Google-Smtp-Source: AGHT+IFJbnfGgKBEfGXBQCzGxK1VPWjSIL+apN36rihKKImCKA+pklDj58k6rqAyLQg9sn08QrTqFv72g+W3E+zQiGs=
X-Received: by 2002:a05:6402:51c9:b0:5d9:a54:f8b4 with SMTP id
 4fb4d7f45d1cf-5db7d2f88b1mr12834456a12.11.1737371371231; Mon, 20 Jan 2025
 03:09:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241217-loongson1-nand-v11-0-b692c58988bb@gmail.com>
 <20241217-loongson1-nand-v11-2-b692c58988bb@gmail.com> <87v7ufnc0w.fsf@bootlin.com>
 <CAJhJPsWe+maw+zK6uiwvObTd_Ew73yjH=KddkgxwY7Zp0Y7ZYw@mail.gmail.com>
 <87plkli9fj.fsf@bootlin.com> <CAJhJPsVhH=8dKmUgmTSHnG8H1_9G3zvovX9hDv_VM6fSUR5oQw@mail.gmail.com>
 <874j1tykgz.fsf@bootlin.com>
In-Reply-To: <874j1tykgz.fsf@bootlin.com>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Mon, 20 Jan 2025 19:08:55 +0800
X-Gm-Features: AbW1kvYiHUFMi3J9u7EmrGEj7HKTebALQhzkmIOMoS-dRqts2ieN7d_omLskrlQ
Message-ID: <CAJhJPsU1eFJ_R1-emENs8T5rrKXUKjvk-cQx9RT2ztTvmOTZug@mail.gmail.com>
Subject: Re: [PATCH v11 2/2] mtd: rawnand: Add Loongson-1 NAND Controller Driver
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 20, 2025 at 4:10=E2=80=AFPM Miquel Raynal <miquel.raynal@bootli=
n.com> wrote:
>
>
> >> >> Don't you need a dma_addr_t here instead? You shall remap the resou=
rce.
> >> >>
> >> > Sorry, I don't quite understand.
> >> > 'dma_base' is already of type dma_addr_t.
> >>
> >> I didn't identify where the dma_base was remapped, but if that's alrea=
dy
> >> done then we're good.
> >
> > Perhaps I misunderstand the usage of dma_map_resource(). dma_base is
> > the physical address and will be written to the DMA controller
> > register at last.
>
> IIUC, yes and no. It is the remapped address of the physical address you
> want to reach, not the physical address itself. The type is dma_addr_t
> and not phys_addr_t and you can get a dma address out of a physical
> address with a call to dma_map_resource(). The numerical value might be
> the same if there is no IO-MMU involved, but the good practice is to
> remap anyway.

Got it. I will keep dma_map_resource() as it is, which is called in
ls1x_nand_probe().

+       res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "nand-dm=
a");
+       host->dma_base =3D dma_map_resource(dev, res->start, resource_size(=
res),
+                                         DMA_BIDIRECTIONAL, 0);
+       if (dma_mapping_error(dev, host->dma_base))
+               return -ENXIO;

>
> Thanks,
> Miqu=C3=A8l
>


--=20
Best regards,

Keguang Zhang

