Return-Path: <linux-media+bounces-18879-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1304598AACE
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 19:13:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B72621F22BBD
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 17:13:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85C0318C01E;
	Mon, 30 Sep 2024 17:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RsBcdVE6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8D9198A0D;
	Mon, 30 Sep 2024 17:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727716369; cv=none; b=uqD5+v3t9UNkdgaPzlQGgxdaWLOL1b8p659QY1MYM+Ks36BRlnGEBhwK0CIiUAKg6QkscylMqHFACCLLm+8RYW6CYGxVA/3GnngSjah7VJURvweOoF+ZpgQoSETc2QuB0PdpIl+Frln0hxjRiNxuUhjcDn0BQiXqt1OmM1w0teI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727716369; c=relaxed/simple;
	bh=YEzdSQNhrdBnEv5ZnZ7OwOy1E0VsRh5p70r2rRyYh8I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fFaaU/4sd/Fy+9NzqelY72oy6MR5Jw+hU93fmHSy0bUfq65qki/e0dbLhrVEun0Y8BHb60OXECX7IRsTz6SkOf7dtkrETW1YnEYxQ2Yr+P1g/1M/XRbc3hOJR3opW7lvOEqahBN5XR7OPdj5BwJmz2ninHpMdLXFgpkheBWYJDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RsBcdVE6; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-50ab5e0c482so372043e0c.1;
        Mon, 30 Sep 2024 10:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727716367; x=1728321167; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V7i2nP7oIqIXZg+ExE2suICLJsXwuJoLSOBktdlrWHo=;
        b=RsBcdVE6r7ZLoXtdlKldSq+hYHFtLO4oI/0bAvGxFG11nCP1hfUE/PBJAHwOZvuKWi
         31ldxWYD4AVS6o+XEOOptvZr/8RTguZSGTsJcqtQAQveinMiCjja7ds0HOc1ijptibOr
         P4mO9kZnSLWYvf7ud8b+AOil2tBMSVI9CxhbSnuDkhxbfBTAQWGcg3Loee6h4FSwhBk3
         9vHXegXMCKLm9gvQOwFGRrhG5Y/BnF/9N/2YtBe98XugO3VRk9E58FH47//qeRtyd6mT
         5YTo7jrfiSkkYy4L3JZyYzYplaR8X7YFJO0dkBDqvE4HfKRMDgFdjVINbQUcQCWPooFa
         crsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727716367; x=1728321167;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V7i2nP7oIqIXZg+ExE2suICLJsXwuJoLSOBktdlrWHo=;
        b=C7E+2sriWXAlyJwBX6oNaEmqzSG31o/N814ITgAsFgZC5CadEbHmYqek3P3RqOv/Ex
         XSjg76NuRbopZzoL0FNNXMYX20bLs+e1v469tu71IXCwyvQgnomgzyVrqXXSVydGTF2B
         jCDbq1FW1QSIAn3JfEebPQ/qtV02iZb2tnnl/hpmjkwdqpKHGYdSg2M1zMcgFcPQjcJs
         g5HE01o1VnkDcI82LoXdvokrNF+y8Cjmkk6aojrR9++QJd6C/N8kmJWSQfGv7FMlB/9f
         HOwbiHG5hy6nBrMOUV4besSu//MqgNVXES4DDRzx8gDSjcPVOoHq+NziO0jNYaF4v6Q8
         G0gQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBZk0xutHNrceZ63biwvrfrSpvJ7ECK0NjxuekeGqD+LA9BNYKoOYUgcaCTDWjV2UKR+UOXP6v+dM7okU=@vger.kernel.org, AJvYcCUqkSPMFfTSU9ydXxCC5M4MsgMCJL9cKr7b7++JYQLMQSSEoHa1wczM1p5sNwzfKZsYwWuC3BFTUG+65AU=@vger.kernel.org, AJvYcCWGRF32WWPJgukeoLwOGquXViANXzKt4iRRPPTJKmjEDOdSfyrJJutvGGaZTUVUWk018lufoJEZa6P12/i0L8EGGsw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5y/oW/cR3zuc235RSPYZYtwZDfbAQtqZjr+FLRX/YhWvEYc2v
	cO1CAWVSHKKUpiVexiT954jC7rqHUnCpnBDri0PKMgJ68rKe1pRlDomMOpeGE47Hp8/q62WXpo6
	Dei9Y8lxEiD9XiBkv+ZZ4X4p1HmA=
X-Google-Smtp-Source: AGHT+IGsSI301dsuHnczzrL0W10qgO3yHWun+13wXZ1nYAnktHmRQHbNE9X0zyHz9auG7pkPAKGQ5fSwVbGbf4b2V3U=
X-Received: by 2002:a05:6122:2210:b0:4f5:23e4:b7c with SMTP id
 71dfb90a1353d-50781517913mr8056506e0c.0.1727716366878; Mon, 30 Sep 2024
 10:12:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240910175357.229075-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240910175357.229075-14-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240927230909.GM12322@pendragon.ideasonboard.com>
In-Reply-To: <20240927230909.GM12322@pendragon.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 30 Sep 2024 18:12:20 +0100
Message-ID: <CA+V-a8sB2DuB8TOsoAmzNgY2c8qBbgGtumGzcCbzxj38wnGqbg@mail.gmail.com>
Subject: Re: [PATCH v2 13/16] media: platform: rzg2l-cru: rzg2l-video: Use
 rzg2l_cru_ip_code_to_fmt() to validate format
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

On Sat, Sep 28, 2024 at 12:09=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> Thank you for the patch.
>
> On Tue, Sep 10, 2024 at 06:53:54PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Utilize `rzg2l_cru_ip_code_to_fmt()` in `rzg2l_cru_mc_validate_format()=
`
> > to validate whether the format is supported. This change removes the ne=
ed
> > to manually add new entries when a new format is added to the CRU drive=
r,
> > simplifying the validation process.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 6 +-----
> >  1 file changed, 1 insertion(+), 5 deletions(-)
> >
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/d=
rivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > index 014c0ff2721b..c32608c557a3 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > @@ -201,12 +201,8 @@ static int rzg2l_cru_mc_validate_format(struct rzg=
2l_cru_dev *cru,
> >       if (v4l2_subdev_call_state_active(sd, pad, get_fmt, &fmt))
> >               return -EPIPE;
> >
> > -     switch (fmt.format.code) {
> > -     case MEDIA_BUS_FMT_UYVY8_1X16:
> > -             break;
> > -     default:
> > +     if (!rzg2l_cru_ip_code_to_fmt(fmt.format.code))
> >               return -EPIPE;
> > -     }
>
> This looks fine, but I think you should take it one step further and
> perform format validation in .link_validate(). See
> https://lore.kernel.org/all/20240826124106.3823-8-laurent.pinchart+renesa=
s@ideasonboard.com/
>
OK, I'll implement link_validate() and do format checking in there and
get rid of rzg2l_cru_mc_validate_format(). Thanks for the pointer.

Cheers,
Prabhakar

