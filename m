Return-Path: <linux-media+bounces-31197-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A49BFA9EEE6
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 13:21:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5EC3E1892284
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 11:20:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B393263C69;
	Mon, 28 Apr 2025 11:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FwGeB5/s"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE401C5D63;
	Mon, 28 Apr 2025 11:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745839104; cv=none; b=Sswp0e7DpfOt9loJo3nmObeLKCdywaUC+vlfK1Tre6rvhCsnXsJbydqMY+U7Gtbm+HvhIdOLQRcNu0HnFoq826e3YHValn3jvoKAifoWbdNlI6lSTUjg1K67FjbyoNpWndGUojobXy5wn/LliPqrM/oshRsQo2rOemnQZbfNW+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745839104; c=relaxed/simple;
	bh=kE2q6PyfwIz3u3D35Rq0H6ItVVBQ6cZNkCx74Y+T4JA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IRAuOaMAhOgKqegWcHmgcZS7Mt1GLU+KqwUhgLOgUAq7AT1ZW77Wr7dRNOjkdf2hEaRJxeilK7PHf4Jlp1hZAvq/FfGMkWdgROqKXN8tuTQR9rmODN+0uRdlpiDL0qTb/rvx4vdURwQLW0ZygUdHRV1BsvyGDbOOKssXoao87Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FwGeB5/s; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-39efc1365e4so2188942f8f.1;
        Mon, 28 Apr 2025 04:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745839101; x=1746443901; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sLSrnCvsqMd1UKvovx8WYXrY84ebPf2yd+dETS/dXM0=;
        b=FwGeB5/sbcV+PtGETeJNVHOEs5z9TRQ4pSZtRg0HuSF7c+MpuywEI5NEs0cTjOuMoU
         RNAAObnpFjUF+aG9KPhkXnqznG8TsL5+yJH0+MJb8nIeksDWe6JzB2ow5Dxcog9SvlkR
         m5kDQSbX8dg1JoUL2JroiSIL3fKcYuQzDOTacXSv2BALrmib5m+fkQJsDD3AHYW5/J+z
         nWm1kJK3jnuSyNSJidLDWX82oJxbH15brD/jgW101ocCZi4EePe9oq0tcVgkm6lKb22a
         H7gj/eENFZUZBRfrXOoBKVcaTj1zit+YNoNxDWAmiVUsEZAwlSVus9/3kUF/viMHb1vP
         jseQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745839101; x=1746443901;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sLSrnCvsqMd1UKvovx8WYXrY84ebPf2yd+dETS/dXM0=;
        b=VAtEwJMIOhtTAebRp2KqrHivi13KEPNqHAk4YtZyry0OYY9X+EdFmn04fGMowZGExy
         k5AT7uKA78zzZUQKsmuWpEPT831kEGNp6afTAILEGNFstjxPr7FEi3q+q5n9e4Y7gBeE
         WqTyCPBn7cGt6o6JS+2v85D1iqD6zSsFX9mUct0PXT/tJOX5CQc+g1vMiVj7td3roIAJ
         jVNe+0Lo8sXht8cr0On/r7AJB4d7DjaLOW4K57otRCOzkx1AWlHwZxIdJwf2fQOyskFt
         l24s+B3PE5NCFEsIiHDGOeuyeWVZ7hzhUloZlJNTPVE9M66kFrFHsxJYmX2j1FKmtWCl
         9vdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUz6s43QLXWwQNtiaCBMudrn+lwMwJxiuj5hcAgYgAaQpdcLXnY9xd4hmpbK/bQmD5T779B4EfTOtBJUlo=@vger.kernel.org, AJvYcCVW0HN9ojq0JLdONGHMqRwpNyKWgfH3Mii31kilj/0siPKPGOIxYIwKU5zYQKfGYZYa2V+FNQuSXVbsx6EI9P8oYpY=@vger.kernel.org, AJvYcCWUM96PnsaReyn9A9REoBnIRlji3k5uvOEnVM+x/aW8WAxC/n4pR5LMlWKofE/oAUUgy3I/P5eduIxvRTA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOf/s3VYS7SaiC34E9IcQTGMzUqR8ouDjeaf8vtGcG0rydpvHH
	hzmvrxKvNmXygTvyBlkL4ScN9HiD9csMXxc8KxApzdQL6MW5q9yEsy9vGP98/CeGPkh9aKbVLGa
	jRu0frnZQN7+4eBE8DcYrlg2jGXQ=
X-Gm-Gg: ASbGnctW7IK668Y0oAnKUrGDXDvnTCnKaXBI/ENZpXolZ70PG8rSlPgShN0hxpAq8s1
	nIAYE6pYpiqk2mLQ2IiTCuEmJ5ZGrhHgXElOMCy5brktFhXPGbPPq0P5APeoJj2OopYUzymtOvu
	SKxsvrLRulOcZN0AV/7cPEYio=
X-Google-Smtp-Source: AGHT+IHwF8neALcoTE/zLWU7CtLZPLtAC+f74+P4wnzqn5Yd2P+kde0y1wbgPUVpUUwdOFkNou8edbnrm28KiZwWAPA=
X-Received: by 2002:a05:6000:420b:b0:3a0:8819:3b69 with SMTP id
 ffacd0b85a97d-3a088193c8bmr452320f8f.21.1745839100653; Mon, 28 Apr 2025
 04:18:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250428095208.99062-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250428095940.GE3371@pendragon.ideasonboard.com>
In-Reply-To: <20250428095940.GE3371@pendragon.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 28 Apr 2025 12:17:54 +0100
X-Gm-Features: ATxdqUF7svHFGSaMoIsqW18j8sdGEYekSPY9dFmbjkkk5rXbhdt8zL2z0qp7a8Q
Message-ID: <CA+V-a8taFdmCgiUAwmDG93OA+P9UH-FEw3PeMFW4sLQ2KPnEPQ@mail.gmail.com>
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

Thank you for the review.

On Mon, Apr 28, 2025 at 10:59=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> Thank you for the patch.
>
> On Mon, Apr 28, 2025 at 10:52:08AM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Simplify the `rzg2l_fifo_empty()` helper by removing the redundant
> > comparison in the return path. Now the function explicitly returns `tru=
e`
> > if the FIFO write and read pointers match, and `false` otherwise, impro=
ving
> > readability without changing behavior.
> >
> > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > Closes: https://lore.kernel.org/all/aAtQThCibZCROETx@stanley.mountain/
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/d=
rivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > index 067c6af14e95..97faefcd6019 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > @@ -348,7 +348,7 @@ bool rzg2l_fifo_empty(struct rzg2l_cru_dev *cru)
> >       if (amnfifopntr_w =3D=3D amnfifopntr_r_y)
> >               return true;
> >
> > -     return amnfifopntr_w =3D=3D amnfifopntr_r_y;
> > +     return false;
>
> So the function always returned true. This seems to be a bug fix, please
> add a Fixes: tag. The commit message should also make it clear that
> you're fixing an issue, not just simplifying the code.
>
No, the function returned true only if the pointers matched;
otherwise, amnfifopntr_w =3D=3D amnfifopntr_r_y would return false. I was
simply removing the repetitive pointer check and directly returning
false at the end of the function, as we can be certain at that point.
Hence, I did not add a Fixes tag. Am I missing something?

> Personally I'd have written
>
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/dri=
vers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index 067c6af14e95..3d0810b3c35e 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -345,8 +345,6 @@ bool rzg2l_fifo_empty(struct rzg2l_cru_dev *cru)
>         amnfifopntr_w =3D amnfifopntr & AMnFIFOPNTR_FIFOWPNTR;
>         amnfifopntr_r_y =3D
>                 (amnfifopntr & AMnFIFOPNTR_FIFORPNTR_Y) >> 16;
> -       if (amnfifopntr_w =3D=3D amnfifopntr_r_y)
> -               return true;
>
>         return amnfifopntr_w =3D=3D amnfifopntr_r_y;
>  }
>
> but that's also a bit of a style preference.
>
I wanted to keep this consistent with the rz3e_fifo_empty(). If you
prefer the above I'll do that in v2.

Cheers,
Prabhakar

