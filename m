Return-Path: <linux-media+bounces-18787-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCD998A158
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 14:04:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 407C21C20FCE
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 12:04:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31E8A18E031;
	Mon, 30 Sep 2024 12:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IUmCL5lv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CCCB21105;
	Mon, 30 Sep 2024 12:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727697840; cv=none; b=npWOyLshVEjO9AeD1QU7yWmOxlyrs5e1FJdm7wMRni60U0ZIlRXGT+sHBvZdez+coLhixI2Dm4LxjEYDVrR1ScZODdlgEOi+LoldsshqB+J2BEGDfprQnFnf3Wkl4jJX1cD8xHoiNxJ1u/f662msMDxXK8rQTcP1TVtshvuGxrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727697840; c=relaxed/simple;
	bh=zG4Gu/rlJhrf5Knf71hbugwnS/g3fSNxlmO9u/hpQWE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hR4F0XckSkVGT0Xh421IDGs2Sy0B3ZTv/P/O9ln3vxtz/llH4nrl8QQFM2FaiPazT1UH0OuFTbFBMjYj8ABwb9xr1Jle7mI3Q0vk6138oSB2YPTp6NQ8OuKdluqwoux7OzBDWCzDR0SpLvRJa6kc/NJmKsaIed4Oa4eCNZRxNyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IUmCL5lv; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-709339c91f9so1413185a34.0;
        Mon, 30 Sep 2024 05:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727697838; x=1728302638; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IwP7caGLeqYlVwxEWL8tTd/ThO9zJjNgMBWaLUC6pu0=;
        b=IUmCL5lvnfhMSD7Mx0X2XgO9UPiOjgHzH5OUFYX/iQG1mKLTrevppaSfOejjvUHMgT
         0Y5yTSbp3hiLeTj87UYfJgyPSsxb2mIFmJyX5sX/KRq89PWKwCoOhKZxuLlCJIH8J0ee
         hLdng2P9gfDzEWavqYk1Hff906Iws8OPxiYeQQ2zIATSLYlOSwvsnU3rYwCTEIWOXhGM
         8Sh8uJyz7Z54rIx/YCStfqc7JubpOfCHc2gtghs4tEx+JX3bK1KUIC1UxRBZXdb3g6V/
         KEd31xCaYWqjp+8Mf732HORUawd4zqTY9u+rzZ2GyZN2RPjqVroeX4q12rTvDRIS0drd
         qV3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697838; x=1728302638;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IwP7caGLeqYlVwxEWL8tTd/ThO9zJjNgMBWaLUC6pu0=;
        b=SWtdvaUjsbk/7LY5zYlNdnHHtp4kcfU9Hm/nRmRJMPfF4MjiFJCOq74NeDWRUf6zXm
         eWokZrKtqGzNkgt+UW7pLa/sXf/NnxVirsytiXbGxgpIi9JH1aozhij3g6oNMOPKiqi+
         TJMOkpNEv/6w56gfYePvQRX8aX7bYzp8lU+SiNKyWZcgvkHa82HAbN5xrVNyeHA3aSDZ
         kQPzTJOOm4xAF7VC8De1aRV5cprbDn1VHzvFFF8CdKX1O0fzgd0wRkvPMUS3OmDaj31S
         EJ1/QdC2ySyP7ZxDVc1eQu/nmCPDWlo7CUpx8gJfEIm1P21oJAgtC278wg+VU9ep7t/E
         h/Hw==
X-Forwarded-Encrypted: i=1; AJvYcCUSsORxua8szxrPiTBzceRHdmjyf+m3/nljEjVtU/gX2b3xLUdwIs9jARxXCwPmVnEC5bYdP3rTGFYo0Wo=@vger.kernel.org, AJvYcCV0ladIvnyet819bv4y8apUeXdvcju1om4UHUyMs3QmKkVmZRxrPURrPhXBy3/BPxBGBH18+nK8iFwx/C/F9cha9fc=@vger.kernel.org, AJvYcCVWf8uzFu9sthPi0EQLqJuRk3REX0DpdKIaWKgsUnuAKXYOqLwbQcELrMd0pfUkXx1X1J1uVCiTVjkPa0M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyllpZuuD+SsW3A4dbqKaGfwcyhw50wTCKmCkZWxeWoZyT2fn5G
	fdWd1U1xh0/vsVUDZiZ5JPrBIJhgC6NzzJqqjEChYp3nEtq03cZNNqJzR2os5sYMhBRsfFk7CB9
	vylID/ulwK2T64SU+pLVa82rqpdo=
X-Google-Smtp-Source: AGHT+IFtsJEe2U27M5FF1HqnDsSt21XyBhConV4H6Z9wQ//aETDC7UHhxT45tU9IxtTpeDDlT+bdRxyNIYNFtxxy1Jc=
X-Received: by 2002:a05:6830:6a9b:b0:713:8387:9f1b with SMTP id
 46e09a7af769-714fbe73386mr7564727a34.6.1727697838124; Mon, 30 Sep 2024
 05:03:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240910175357.229075-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240910175357.229075-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240927222620.GF12322@pendragon.ideasonboard.com>
In-Reply-To: <20240927222620.GF12322@pendragon.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 30 Sep 2024 13:03:32 +0100
Message-ID: <CA+V-a8vnkjq-B6xabWWaZU821+KBUQzszdEXPpcqMT=fgvJ1PA@mail.gmail.com>
Subject: Re: [PATCH v2 04/16] media: platform: rzg2l-cru: rzg2l-csi2: Make use
 of NR_OF_RZG2L_CSI2_PAD
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

Thank you for the review.

On Fri, Sep 27, 2024 at 11:26=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> Thank you for the patch.
>
> On Tue, Sep 10, 2024 at 06:53:45PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Make use of NR_OF_RZG2L_CSI2_PAD enum entry in media_entity_pads_init()
> > instead of magic number.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/dr=
ivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> > index 2f4c87ede8bf..10b8b0c87c1f 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> > @@ -804,7 +804,7 @@ static int rzg2l_csi2_probe(struct platform_device =
*pdev)
> >        */
> >       csi2->pads[RZG2L_CSI2_SOURCE].flags =3D MEDIA_PAD_FL_SOURCE |
> >                                             MEDIA_PAD_FL_MUST_CONNECT;
> > -     ret =3D media_entity_pads_init(&csi2->subdev.entity, 2, csi2->pad=
s);
> > +     ret =3D media_entity_pads_init(&csi2->subdev.entity, NR_OF_RZG2L_=
CSI2_PAD, csi2->pads);
>
> Better, I would use ARRAY_SIZE
>
>         ret =3D media_entity_pads_init(&csi2->subdev.entity, ARRAY_SIZE(c=
si2->pads),
>                                      csi2->pads);
>
> With this (and an updated commit message),
>
Ok, I will update the code to above suggestion and update the commit
description.

> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
And I will add the RB tag.

Cheers,
Prabhakar

