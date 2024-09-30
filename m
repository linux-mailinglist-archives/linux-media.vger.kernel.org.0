Return-Path: <linux-media+bounces-18834-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 969F298A23F
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 14:25:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54DC51F24065
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 12:25:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD5EB1917FF;
	Mon, 30 Sep 2024 12:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T2f39q8f"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA86818E36E;
	Mon, 30 Sep 2024 12:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727698794; cv=none; b=BqY2GKJRfyWA1gXDBxrPhqqFr3wvsj8LW7Ldg5mv+PqJKhNiU0QbY+RSYaZa6K3RnFIEHa+/icYcpaeh7tYlJUlAHAaTvPbpEdwpjoGdJfsEgLGdSZUz3nR/XwBxpyCorqSG/EssuaSJOPahimfalZSCYa9lQnV1Z80xd95iCPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727698794; c=relaxed/simple;
	bh=T0H2p5SM8zMQRwZlExn1DGe8xJM1lRLrhXS6V1nVWiE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VEanycqqA6kF7yxSAfBiwYU+dqfABn6fVN0Q8V6X98BQwcx0vs1mp+CKZP1tu0+K/0byXhrqDk8rFXTsqo58vfuIsRhlLz9m9P2E5y7Dl8rsgGF/kzyTFSiokwfbyQLnh2NbOMPY/cPlEVbASG5IVcmc+duztH7RRt476xoqanA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T2f39q8f; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-84ea36b65cfso1145631241.0;
        Mon, 30 Sep 2024 05:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727698791; x=1728303591; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1WKbPMrVoX41jphFFXnvsCs/qisQx+D1m9p+KCH6szc=;
        b=T2f39q8f5hd5paSIyIu/uy5Pmpnne5XIb5VFQInCmBCiwMa+8ERvH8T94Tikpqb4Nn
         KUDTmwQvcXgAwrjrOaS7DJgg/B1tJdocgWW5vp7D1BMrLNm/PROWlxoNHizpvzx1QpEy
         G6ev3WOARSMJRFilKvwR+bItEKVgWOcuxgxuMYFVnMk3r3ZaUzODi6oOFf5q+7RqciZ0
         wOKQZwa23l7oXehDqiOtGAZbfpK6RW1cF8un+PxeYP2rIs8AaiVZCYgTOLQ7byf1yvyd
         ignX0s2e9qAtSU9GgJuNY4gnXSwoqZxXWXNVnW7EGLQIaT3HYuFJ4xoTIC48KTeyQTbY
         5Yug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727698791; x=1728303591;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1WKbPMrVoX41jphFFXnvsCs/qisQx+D1m9p+KCH6szc=;
        b=PfCNxkzrTnoWD9QKE9GExy6ZlEcFXBm01lzMULMPt9EC84peTZ/RM+j95vIoSa3lIC
         YKNidKXvxj1eOlHWOjC9M8VvBqZCCNYgblo9b6Yla1eVWBk+uKWI4xPudBJ5KN4dTqPK
         2qVHXNMqIQkApqZRYxx2QA6zUa9Z83HgIq56ik+tQghRsJuYrfz/4kY8NH8RKYmu2nM+
         opS8fIWzDZG9hvNRL7XIgbLuJibVyAXwALVBS6kf8OrDOru9spRfELJYFXu3N8XGNNtu
         sNdBwu/1JPAvwiccr05gTigSaU4W0yMtXI0yxr8pTD2ZJtjqniOUsONJP5tJ07dicHSN
         LA4A==
X-Forwarded-Encrypted: i=1; AJvYcCVrWQqI4NU5AsW3sU77OVJfEAfEO/WN/2yqhvx5tOxhWRNiBfUvhOQ7ouVGeezwhW/MMbcOzdJdEaPBYQgGC1TgHfk=@vger.kernel.org, AJvYcCW0qHSeXwFl9fcbIWUkef3KT3SyeWkXfnOEZnYPSI//RIAEMGbyuW+lEO6BgK4QwCb7o8p4iUAxKyWfdkY=@vger.kernel.org, AJvYcCXYpGxlEOe8TIz9/Ah35Y8vgbU1d3eQgc23y92OyB8xm7+9bnR8DcjEAUZRMvc5DYHlu07G70vQ06oFhOE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbBkJ+VJpq5zfyam9kthIR1uoSOqW/8iyp65kLnwccnL1Mkqoh
	lN26eN4uNQHMic0hXe9jYoAiNn/hMazOxfcTF8ebQeS+OjMpha4MvGLbFOFKAISLgFNctjZ4HIT
	h8j6InDMe7wB8vgqYf8awu+daTVM=
X-Google-Smtp-Source: AGHT+IGJ/jgjqICTkD+FA8y7IpA6SgFOyWL9OuXr/jASGSGYUFBYaxvJGwLZEpbxrRYhnwwFWkiPCGR1M8tXHgztkK0=
X-Received: by 2002:a05:6122:1e10:b0:4ef:280f:96ea with SMTP id
 71dfb90a1353d-507816da1bemr6769696e0c.4.1727698791502; Mon, 30 Sep 2024
 05:19:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240910175357.229075-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240910175357.229075-15-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240927231122.GN12322@pendragon.ideasonboard.com>
In-Reply-To: <20240927231122.GN12322@pendragon.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 30 Sep 2024 13:19:25 +0100
Message-ID: <CA+V-a8vzf7gjcO-jPTB2Sd=4GBmpSkUfWDCnAR8BbL1xohytvQ@mail.gmail.com>
Subject: Re: [PATCH v2 14/16] media: platform: rzg2l-cru: rzg2l-csi2: Make use
 of rzg2l_csi2_formats array in rzg2l_csi2_enum_frame_size()
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

On Sat, Sep 28, 2024 at 12:11=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> Thank you for the patch.
>
> I've just noticed that the subject line of most of your patches is much
> longer than the 72 characters limit. Please try to shorten them. You can
> replace the prefixes with "media: rzg2l-cru:", and reword the subject
> lines that mention long function names.
>
Ok, I'll rework the subject line so that it fits within 72 characters.

> On Tue, Sep 10, 2024 at 06:53:55PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Make use `rzg2l_csi2_formats` array in rzg2l_csi2_enum_frame_size().
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/dr=
ivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> > index 79d99d865c1f..e630283dd1f1 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> > @@ -570,7 +570,10 @@ static int rzg2l_csi2_enum_frame_size(struct v4l2_=
subdev *sd,
> >                                     struct v4l2_subdev_state *sd_state,
> >                                     struct v4l2_subdev_frame_size_enum =
*fse)
> >  {
> > -     if (fse->index !=3D 0)
> > +     if (fse->index >=3D ARRAY_SIZE(rzg2l_csi2_formats))
> > +             return -EINVAL;
>
> Same comment as in 11/16. With this fixed,
>
Ok, I'll drop this check.

> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>

Cheers,
Prabhakar

