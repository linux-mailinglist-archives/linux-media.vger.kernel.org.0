Return-Path: <linux-media+bounces-31208-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BD5A9F22F
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 15:24:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 851A57A6873
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 13:23:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8D6526E145;
	Mon, 28 Apr 2025 13:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GzA8AWEz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6438F26D4F7;
	Mon, 28 Apr 2025 13:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745846645; cv=none; b=c99YCoSXaUaUdPwYyNAvvnOl4VBr6yF3kA8JX87dBSYItIi+BOUEyUO6C74PJiVeA0F60Cx1aUIuaWD4iHaGqDHivirFQcmF8+MTsPVwZyCAX4QTdb0trwi0iw2IGSVwI5Le7gLQvteg+kFobfe8OJeoXJeBIAaBvYD/rq6uzoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745846645; c=relaxed/simple;
	bh=mtrVEBVbbyiGKphaour8tRsBUKQ2C3N58hxuZ7tmB7I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O6p9CgDe4QrkgEeiDySyS++KLxFYvbibPjwWnKN6mc1KBRYGAMiZBm4zHMqua2Gpuy6QN0uoS7crxnOe18f1dORJ8eouL4hDDX2JUvn0xDLtBHMCJDtoHyvEi6rHN4+Ts92PZuOhPQKBz0YTHF0OlzY6arrPxWzYFajipWlqUL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GzA8AWEz; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cf848528aso34195925e9.2;
        Mon, 28 Apr 2025 06:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745846641; x=1746451441; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KOt7LYP0o0MmNgKvBUgcQAjLHuks+2HD1Cd4VMcaKnY=;
        b=GzA8AWEzNw9ATLKnxKqfP0fLlZc5vjTsmznCxCUj/rVEh68g2edSpGNPSwSJT2LtKm
         8TqUGUsiU3H6rUuIREBCQgjAITDZwtLkxvb6Xx3pGaV97S/G7nVa8SvptmXbcV9zLtci
         m2AoMIfv0KC0A29m1ete+CyZM10oXu2XHDF59hLeJbiaj0pF/aV3/rGotiJqa81A5Tb+
         E3XHkg5rkIpaW9frC8QAF9oTSTsSyUpwvzsnrxWor24DLMsCXMG6IhOMUkk2wJ9OmdD0
         7M45YdvGSq0hMEpOKqfutbDjRINVdCJJGLFN+OIvcABbM9MIct/8Pa/3V9YI7KJ7W4oS
         5r7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745846641; x=1746451441;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KOt7LYP0o0MmNgKvBUgcQAjLHuks+2HD1Cd4VMcaKnY=;
        b=e+nHoO6yJHRKFnEBQo0QgAa5dV/bM1Ur1FIAZQOQhUDLZ7q3vHxqCPTNjHsakcQgEO
         PReqneBVyPbGXxvVqxGMSnnB4Id2s3uyB5RYY29nw/HmgK5sU88R1jXkzMsTyZxrMn/T
         03KHv0Ia/C6cCvEUc6nfsktnmOQr9Yz3RHMU9U1rgCS5iRE0o94+qQ3j8KajHRigKiVA
         +hfpEvMAAF2UGvatU1+ARFEEhjr2HWu14NXesSfnN+qGZA50VWlBwg255i4BV6wNYop6
         m52/PlXLHPn2dSlytOJCuekzLoibRcBbLahMkFHwCNihx+r3pQIzPXksn+DS/g3Ia4uX
         t4ew==
X-Forwarded-Encrypted: i=1; AJvYcCU4NYnKdSoYB49BxpfA7QlCZls0DsXhtVT1IWgWIIhKcUUv93cWmms2vBPnY3FFCgq6QdEPnY9RLwhUpGdXe/gzSqI=@vger.kernel.org, AJvYcCV1NxbWUrz6t3jUGT2fb9PYNiRBuJ2/PrSfQ8mMtSHwEq5YIqnIZlQvZg65iLBLORX8hjIDH+vUFxxEBHQ=@vger.kernel.org, AJvYcCV9+sQWC/Q3zIjwJVEaiWnt7szf8Nwk5LVreqM3RuFIPYVnUqV6hBNFBzdE/afX0hqdqQf8dEgbN16scFM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8xl7Vt5G6O+98y9kji4abZSs+yFVxGhpryuAyZKyD9KvH3NX+
	J5cNJmOXb2+DqaT3SMMX8FasNhr7t3qQmcalJiueatUVyneNfubaCH+HqUVASU0kiVgz9KRnmfR
	62SV/xsIUUmpOq5SzUA0kBi6Uzhk=
X-Gm-Gg: ASbGnctQthNhNaA/P70Suzheux/QZtQPYHbZpHdJL9hXD4iufdVUbt/Xzo46eIGP+Bz
	5O7v4wWjKAmRehXWTCrLk0hHw0XB7STsp0k1Pl92UKW24nfaiqDMdbvYaQQQcNmAdMERGetL9Io
	BpRdl9gjNNBx7UoAaEsyGT0lo=
X-Google-Smtp-Source: AGHT+IGlN04rqVdFuOEepO7AbTc54inE06WheGOgH2LWChowLopCmMTshXJlj+WuBhyWSSFzB0OLlRXw+oR3SuKtF9Q=
X-Received: by 2002:a05:600c:a403:b0:440:6a37:be09 with SMTP id
 5b1f17b1804b1-440a66d9b60mr96000095e9.16.1745846641251; Mon, 28 Apr 2025
 06:24:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250428095208.99062-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250428095940.GE3371@pendragon.ideasonboard.com> <CA+V-a8taFdmCgiUAwmDG93OA+P9UH-FEw3PeMFW4sLQ2KPnEPQ@mail.gmail.com>
 <20250428112516.GG3371@pendragon.ideasonboard.com> <CA+V-a8vDDLZ422nZds7pEEW+gZ1n7s-U3eJjmG8DsOJT9uJygQ@mail.gmail.com>
 <TY3PR01MB11346E57A3DF8D8A90A405E4686812@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346E57A3DF8D8A90A405E4686812@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 28 Apr 2025 14:23:33 +0100
X-Gm-Features: ATxdqUGy3JZEMMWjf_6t9qT30Fm5jALjd_OmhnbnS5rET1WZZxaFDyc23qTwKtg
Message-ID: <CA+V-a8s8vRrN4+UWiovDvX4Rfj7veVUoQCerGKwPa2PnSvmWSQ@mail.gmail.com>
Subject: Re: [PATCH] media: renesas: rzg2l-cru: Simplify FIFO empty check
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "laurent.pinchart" <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2025 at 12:36=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.c=
om> wrote:
>
>
>
> > -----Original Message-----
> > From: Lad, Prabhakar <prabhakar.csengg@gmail.com>
> > Sent: 28 April 2025 12:33
> > Subject: Re: [PATCH] media: renesas: rzg2l-cru: Simplify FIFO empty che=
ck
> >
> > Hi Laurent,
> >
> > On Mon, Apr 28, 2025 at 12:25=E2=80=AFPM Laurent Pinchart <laurent.pinc=
hart@ideasonboard.com> wrote:
> > >
> > > On Mon, Apr 28, 2025 at 12:17:54PM +0100, Lad, Prabhakar wrote:
> > > > On Mon, Apr 28, 2025 at 10:59=E2=80=AFAM Laurent Pinchart wrote:
> > > > > On Mon, Apr 28, 2025 at 10:52:08AM +0100, Prabhakar wrote:
> > > > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > >
> > > > > > Simplify the `rzg2l_fifo_empty()` helper by removing the
> > > > > > redundant comparison in the return path. Now the function
> > > > > > explicitly returns `true` if the FIFO write and read pointers
> > > > > > match, and `false` otherwise, improving readability without cha=
nging behavior.
> > > > > >
> > > > > > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > > > > Closes:
> > > > > > https://lore.kernel.org/all/aAtQThCibZCROETx@stanley.mountain/
> > > > > > Signed-off-by: Lad Prabhakar
> > > > > > <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > > ---
> > > > > >  drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 2 +-
> > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git
> > > > > > a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > > > > b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > > > > index 067c6af14e95..97faefcd6019 100644
> > > > > > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > > > > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > > > > @@ -348,7 +348,7 @@ bool rzg2l_fifo_empty(struct rzg2l_cru_dev =
*cru)
> > > > > >       if (amnfifopntr_w =3D=3D amnfifopntr_r_y)
> > > > > >               return true;
> > > > > >
> > > > > > -     return amnfifopntr_w =3D=3D amnfifopntr_r_y;
> > > > > > +     return false;
> > > > >
> > > > > So the function always returned true. This seems to be a bug fix,
> > > > > please add a Fixes: tag. The commit message should also make it
> > > > > clear that you're fixing an issue, not just simplifying the code.
> > > >
> > > > No, the function returned true only if the pointers matched;
> > > > otherwise, amnfifopntr_w =3D=3D amnfifopntr_r_y would return false.=
 I
> > > > was simply removing the repetitive pointer check and directly
> > > > returning false at the end of the function, as we can be certain at=
 that point.
> > > > Hence, I did not add a Fixes tag. Am I missing something?
> > >
> > > Oops, you're right, my bad.
> > >
> > > > > Personally I'd have written
> > > > >
> > > > > diff --git
> > > > > a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > > > b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > > > index 067c6af14e95..3d0810b3c35e 100644
> > > > > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > > > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > > > @@ -345,8 +345,6 @@ bool rzg2l_fifo_empty(struct rzg2l_cru_dev *c=
ru)
> > > > >         amnfifopntr_w =3D amnfifopntr & AMnFIFOPNTR_FIFOWPNTR;
> > > > >         amnfifopntr_r_y =3D
> > > > >                 (amnfifopntr & AMnFIFOPNTR_FIFORPNTR_Y) >> 16;
> > > > > -       if (amnfifopntr_w =3D=3D amnfifopntr_r_y)
> > > > > -               return true;
> > > > >
> > > > >         return amnfifopntr_w =3D=3D amnfifopntr_r_y;  }
> > > > >
> > > > > but that's also a bit of a style preference.
> > > >
> > > > I wanted to keep this consistent with the rz3e_fifo_empty(). If you
> > > > prefer the above I'll do that in v2.
> > >
> > > Up to you.
> > >
> > Thanks. OK, let's keep this patch as is to stay consistent with rz3e_fi=
fo_empty().
>
> Looks a typo rz3e_fifo_empty()->rzg3e_fifo_empty(). Above as well.
>
Good catch, this typo needs fixing.

Cheers,
Prabhakar

