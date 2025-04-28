Return-Path: <linux-media+bounces-31199-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA1AA9EF20
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 13:33:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0771617DFD4
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 11:33:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AD2D2620C6;
	Mon, 28 Apr 2025 11:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h0BNiikP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379031DE882;
	Mon, 28 Apr 2025 11:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745840008; cv=none; b=ngSwig/0ZlgJOCRzURJa6zzmJUU0f/hK9koRVkfAqA+NuSWK7bYqaEnFXWQBQqXog/ScwsZNeWCoK+1mG3G2R6D+iV781CHmB2LCSZbA1zbpgdWdWYhnut3IVxMNDe39W4y8JBgrW8ecV8yufZR1YwJsxrJmhVPvASuet3DXjEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745840008; c=relaxed/simple;
	bh=uqXV5dTssS0RGVPjHopB51Hz0cJB4AkxTLs+PR/83Qc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kgDdet/+oHnC/Goae4sqtRcUB1XQ0us6yqtZG7zAcZT2MO3/O4olVk4xG+3PTN+3jXMgYG2zqeZoyP8FIaszEzKjwk/Adme0Ap/Fm2ty/43AtQguSLdnyVk3H+lEgmLKQZqsIgpV7DFFOt9CFa8jFCo/LUqZBeaqXb+0fu40h70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h0BNiikP; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39ac56756f6so4706863f8f.2;
        Mon, 28 Apr 2025 04:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745840005; x=1746444805; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G2vLwCux/Eu5nlfc4ZLowdB9vE2DfPBXiivDInz5FEM=;
        b=h0BNiikPwrKQfvzc0PYBE3wo4J2EzSVyDOuONlDLpVhVSBfKlE9sonXQRKkKE8pCxD
         L1g81Bk/WTbf7VCm2YdbWT3FE/+5dbW67Jh7CrvZhxW7N/G05D+oNfM98dAfPcmWUmn9
         LzOJIs6LukwgGrOrb+ZngMxpUGXVWpki91kjckmFBRfHGDMBZpLw5/DX66ioWwpRjn8Q
         OTRn4CtNxkjWSrZDhATEl5K/Gb1KEyZu49dfn3i6BPIrvPXwDlBCDseElNqWWitsqQOG
         PCHC7N3xCjWTGPfdFj+xTpOIrfMQdE8rlG+UaqO+zHo3NzH+P6ZdT7EzeFIX6VWXRft3
         I/Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745840005; x=1746444805;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G2vLwCux/Eu5nlfc4ZLowdB9vE2DfPBXiivDInz5FEM=;
        b=KUYQ7i+48jLTw6Pbnza1Xaj6xy6xXv4YWbMB8oLYcKp+hjk1C4quemNm1eLL2JSmRn
         hHDrNJqok/WPJD0PpzD5pd6wjmMGru4kmtNUaE2MQHZ6dgnwYKOE4fd+r1cish9la/o9
         3U5YI0QnC7WZZ8W7t92CFeTP2TWhXhki0ORvJRdppq9XhTWTsDkMJdWmDIGVfSnZSFmA
         RHpZEhVWvn7bIlbKlZ1GjI81VFYTeTV10Rc+ZiWZ8SnknXMOYaG4uvAWct++uVp12UGK
         QUwuUSsgvbPCwUb4WFldwyiiDWP1J+4dqStlftkF9m2YgW1dirVgt2Nk5Kqs+OfHWeOx
         IUOA==
X-Forwarded-Encrypted: i=1; AJvYcCU1y3aniVBnN+oN4NxLMYfZiG9K3NUMLSPahLJ+O61pK6bSflPNLwtJplNsDiLePn0LUTohnR5lweKbkMLVtVTkExc=@vger.kernel.org, AJvYcCVZvItRTdmhHIllDmUT3XFBvFstsnFRi9P20l7bcZs7uQkx9YGlgpqp3Ws9SIqk+xjfWQjrr1v2Chq8jkc=@vger.kernel.org, AJvYcCVta/zo1012uqOut9UPWJMH7az7P4fYM5Py3jE5lrjC0yH8Zd94Y3gz2utsr1y6qXVn09fUomfh8uEKoIM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZreUCpqKQ0i27PkTlsO4SvkyGkNO53r9yqDjxHPIbFAaZ97tl
	lwaDladV1cULD+fW4F4On/xo8UGhFhDmbCkTADb3BukE9hruMrJS+QmVlnoWRYDeQmgPSg+aD0j
	ty8tRmjjV6yQzLdR/uE/m+uuT9qo=
X-Gm-Gg: ASbGncshU59pd0W7VQyVSDLcYUpO3xh6mZZsfSb46JDF/ueNytee7y2hgJdS3HCQlBM
	LkyKRMHn02q6ZKymjgVAVX4BFmZtRZ57s5q5x0Xc0aPDREpdk0wH/DAA0MsA5tRT2ZqlVmHuveN
	yLupI2AfCIBD2t+gkAoDJ0zMY=
X-Google-Smtp-Source: AGHT+IEpk4jBFeG0dkyjwmoFtO+FmHdu9xTLOGqUjmZgty2Ty7Q+Ulj0OPvDfi1i7279zcRfseUYFSm/tSJlGqNpbg4=
X-Received: by 2002:a05:6000:4024:b0:3a0:870e:ca5c with SMTP id
 ffacd0b85a97d-3a0870ecd08mr1343983f8f.5.1745840005271; Mon, 28 Apr 2025
 04:33:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250428095208.99062-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250428095940.GE3371@pendragon.ideasonboard.com> <CA+V-a8taFdmCgiUAwmDG93OA+P9UH-FEw3PeMFW4sLQ2KPnEPQ@mail.gmail.com>
 <20250428112516.GG3371@pendragon.ideasonboard.com>
In-Reply-To: <20250428112516.GG3371@pendragon.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 28 Apr 2025 12:32:59 +0100
X-Gm-Features: ATxdqUHkbl7FnMyQw0s2EAGowpeOFjCa09KnwySaJ9gAfmVTbwkECPaEQMHK_sc
Message-ID: <CA+V-a8vDDLZ422nZds7pEEW+gZ1n7s-U3eJjmG8DsOJT9uJygQ@mail.gmail.com>
Subject: Re: [PATCH] media: renesas: rzg2l-cru: Simplify FIFO empty check
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

On Mon, Apr 28, 2025 at 12:25=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Mon, Apr 28, 2025 at 12:17:54PM +0100, Lad, Prabhakar wrote:
> > On Mon, Apr 28, 2025 at 10:59=E2=80=AFAM Laurent Pinchart wrote:
> > > On Mon, Apr 28, 2025 at 10:52:08AM +0100, Prabhakar wrote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > Simplify the `rzg2l_fifo_empty()` helper by removing the redundant
> > > > comparison in the return path. Now the function explicitly returns =
`true`
> > > > if the FIFO write and read pointers match, and `false` otherwise, i=
mproving
> > > > readability without changing behavior.
> > > >
> > > > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > > Closes: https://lore.kernel.org/all/aAtQThCibZCROETx@stanley.mounta=
in/
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.c=
om>
> > > > ---
> > > >  drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c=
 b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > > index 067c6af14e95..97faefcd6019 100644
> > > > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > > @@ -348,7 +348,7 @@ bool rzg2l_fifo_empty(struct rzg2l_cru_dev *cru=
)
> > > >       if (amnfifopntr_w =3D=3D amnfifopntr_r_y)
> > > >               return true;
> > > >
> > > > -     return amnfifopntr_w =3D=3D amnfifopntr_r_y;
> > > > +     return false;
> > >
> > > So the function always returned true. This seems to be a bug fix, ple=
ase
> > > add a Fixes: tag. The commit message should also make it clear that
> > > you're fixing an issue, not just simplifying the code.
> >
> > No, the function returned true only if the pointers matched;
> > otherwise, amnfifopntr_w =3D=3D amnfifopntr_r_y would return false. I w=
as
> > simply removing the repetitive pointer check and directly returning
> > false at the end of the function, as we can be certain at that point.
> > Hence, I did not add a Fixes tag. Am I missing something?
>
> Oops, you're right, my bad.
>
> > > Personally I'd have written
> > >
> > > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b=
/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > index 067c6af14e95..3d0810b3c35e 100644
> > > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > @@ -345,8 +345,6 @@ bool rzg2l_fifo_empty(struct rzg2l_cru_dev *cru)
> > >         amnfifopntr_w =3D amnfifopntr & AMnFIFOPNTR_FIFOWPNTR;
> > >         amnfifopntr_r_y =3D
> > >                 (amnfifopntr & AMnFIFOPNTR_FIFORPNTR_Y) >> 16;
> > > -       if (amnfifopntr_w =3D=3D amnfifopntr_r_y)
> > > -               return true;
> > >
> > >         return amnfifopntr_w =3D=3D amnfifopntr_r_y;
> > >  }
> > >
> > > but that's also a bit of a style preference.
> >
> > I wanted to keep this consistent with the rz3e_fifo_empty(). If you
> > prefer the above I'll do that in v2.
>
> Up to you.
>
Thanks. OK, let's keep this patch as is to stay consistent with
rz3e_fifo_empty().

Cheers,
Prabhakar

