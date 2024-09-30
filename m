Return-Path: <linux-media+bounces-18871-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4287A98A684
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 16:01:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6AC111C22944
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 14:01:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08F04192B86;
	Mon, 30 Sep 2024 13:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dmj3TWle"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4C019258A;
	Mon, 30 Sep 2024 13:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727704779; cv=none; b=Z1lK+8nl31ggtOQyJVvadONR1konbZHPMY6T5c2d/YsKTjxoVkbcIeP80vkZavmPvSnfLWOHHII9XWKLWp7vGC8VR4wuLmsDcSUMO35DkOugkH4xQpo27izReqpIZ+ixnuxaU/YlPJiXqdbMAWLyh4MA+7bWQyqtoHTx/K4EY5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727704779; c=relaxed/simple;
	bh=NlJwpxgXMuxcuSwKFC8yew5wFYtptuBoyy0PmRRBWXY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fiBnsD357Exn3GohucO7/VeyX6xUHFGXGeLCwUDQU9Jlapl28npuLfI7Xljy76XIi2ryTQhRhRHWTnhVFak+ynKjJh5hyW/r5j/zI8qMqW6/ldRJWeIjF3PHtrFkTxhOajXLGUel5eA9DzmEMBIAwNvbkpg155gUJe4kvbPjOHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dmj3TWle; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-509bd2e944dso516319e0c.2;
        Mon, 30 Sep 2024 06:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727704777; x=1728309577; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q2BYXLM5lmakS//B8yHpK4KdGUO6tiaDpeo8qFg24NI=;
        b=Dmj3TWleIolmDBd1U4s2pQ8fhnb5PkjZ/EDwpJUavYDd+/vOG3++ssV0oxAd0htSLs
         QMj2lSXlpOg4HPqx4iIswWsGHGcEL/D17qYgwr9bVoE75aWb6Zc1CJ+I+u6rJhiX4F5o
         EK8Yyi449LS0Dzi5QJWVdE+3CmRqKG6nIOs4D7E8Gv2v2Nv+EfVA3FlbqAGmQ/Q7KPD9
         EStA+OSt1jOKvHcnH1nd/0Hx/jEb955KFB1e0gfTnWBzVU/wjGwbVMshUCkhR5i6lOiU
         VwZa3EKlaMMMe/GFJtHwvORDjC4dYlsSFkE6whYMG5arYhXOLbr7ELxocMbTlXgWazlS
         f64g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727704777; x=1728309577;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q2BYXLM5lmakS//B8yHpK4KdGUO6tiaDpeo8qFg24NI=;
        b=wQBc3IruWkf4uRr55kOgoLIAqhEWNPqlEWJ5SnJ3ynayR1OPCoMc21bQC36F9NN8b4
         3SwIbI3z2Jq5GBVgxV/P/uPpkSE+iTzvD69ejhM5N1xBlQZ0E8OjET7X9R9Nq1WTPTvS
         i07o5Ba/LrE/q+tGuJJErpmeSm3JxAGkWWfI3uVvvqzVQ+KAVnE/wBBPZYalgCQcSW3J
         8ewQVq01hGCWaJuQzJWyJS24kB4Eg0qJRIsXMglgnYeQ43Lnv+7HDxCjmwGdewfHhVEV
         EafACaCZpG4NaqHrpUfGSP06zQItWBLAPDF/h/awfUBUjLtnZDxB09WWGPkE1PGyNTCB
         mD7A==
X-Forwarded-Encrypted: i=1; AJvYcCW5i6bJc/J4MQ0CHKCrZZi2idEJy0W5psDV5rZRljNlsOCLGhm1m+ZYxE4bBWWBO9yNZ2NCU5pQS/hjfjg=@vger.kernel.org, AJvYcCWhCpv0/CTd0RBB5Qtqc9Woy6qk9P2wes5dp+fcTlpV2GBdbk6eIaZnhzttNsag48tToRCSn7elk62NY+c=@vger.kernel.org, AJvYcCX3YF8I06ZVjHW5PzX2MM7biJfrT6jCCgXM6bntp+xilTi9Gs9xfSGwmk6ydl9VRW0YxS/sLzfNSjTZTlshbeFWMTk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdcovXmw5OggWOo8/X//dD91Plcl6vEwPXOah1RLwjm2wvNB1k
	IuaWh0C6SHejtZHtGnpzQQtNK82Hvfoee8luo3tTfhqGsmarDRXCaJog2cA7zcjBlP40B2/VLpZ
	bwm0D7zBGF0dYX6vNded/4KyH8nmCIIia
X-Google-Smtp-Source: AGHT+IH4bGDmbxYQUAoib0TDoCtrNJop4GdaUMAWMA5Ok6FU55s0vifzCmf0i4Kgf5WzWeFTqHRSx4DGUoTry2DtLwc=
X-Received: by 2002:a05:6122:5013:b0:508:4997:18c6 with SMTP id
 71dfb90a1353d-508499719d5mr4241359e0c.0.1727704776702; Mon, 30 Sep 2024
 06:59:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240910175357.229075-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240910175357.229075-16-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240927232057.GO12322@pendragon.ideasonboard.com>
In-Reply-To: <20240927232057.GO12322@pendragon.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 30 Sep 2024 14:59:10 +0100
Message-ID: <CA+V-a8sTFjCtJNDmVPzU9VHf1bVXqndPJ2ojjZNM=Lvkin3bcw@mail.gmail.com>
Subject: Re: [PATCH v2 15/16] media: renesas: rzg2l-cru: Refactor ICnDMR
 register configuration
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

On Sat, Sep 28, 2024 at 12:21=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> Thank you for the patch.
>
> On Tue, Sep 10, 2024 at 06:53:56PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Refactor the ICnDMR register configuration in
> > `rzg2l_cru_initialize_image_conv()` by adding a new member `icndmr` in =
the
> > `rzg2l_cru_ip_format` structure. This change introduces a new function
> > `rzg2l_cru_ip_pix_fmt_to_icndmr()` to map the pixel format to its
> > corresponding ICnDMR value.
>
> Skip this new function, use the function thar returns a
> rzg2l_cru_ip_format pointer, and access the icndmr field from there.
> rzg2l_cru_initialize_image_conv() already gets the format info pointer,
> so the code will be simpler and more efficient.
>
Agreed.

> >
> > Suggested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.c=
om>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h |  5 +++++
> >  drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c  | 12 ++++++++++++
> >  .../media/platform/renesas/rzg2l-cru/rzg2l-video.c   | 10 ++++------
> >  3 files changed, 21 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/dri=
vers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > index 24097df14881..3da9e8e7025a 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > @@ -31,6 +31,8 @@
> >  #define RZG2L_CRU_MIN_INPUT_HEIGHT   240
> >  #define RZG2L_CRU_MAX_INPUT_HEIGHT   4095
> >
> > +#define ICnDMR_YCMODE_UYVY           (1 << 4)
>
> Not a candidate for this patch, but I would recommend moving all the
> register definitions to this file, or to a rzg2l-cru-regs.h file.
>
OK, I'll create a new patch to move all reg defs to rzg2l-cru-regs.h file.

Cheers,
Prabhakar

