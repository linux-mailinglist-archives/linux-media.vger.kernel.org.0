Return-Path: <linux-media+bounces-29500-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 895CDA7DD99
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 14:26:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A1B161885976
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 12:27:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A2132459FD;
	Mon,  7 Apr 2025 12:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YiyD3tXE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259441A5BA3
	for <linux-media@vger.kernel.org>; Mon,  7 Apr 2025 12:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744028808; cv=none; b=UAFImZq2DEmMhs+wqLbrYFNVTTknVCHQK9JvhgvLL/bhZO/3W7Hxk4dFNNa0QyxnHBqnXREzutTgnLb73EbJASVYiZHZKjCtWzuz/UKzUVRUn9WcfayV+m7j+IZJmQSY0On1d94xrfL1CbKalSgYhoHly9NaxhuFOaEIK5ueMb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744028808; c=relaxed/simple;
	bh=suWDlZjE6ctcOExI78i3ePT+xHDpOdW3uvb+MflX828=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OoKXPvKZx9LvKm4EvmqNWbxSXbH5dvPGpI+RP+vXg/vY2YBLQCgUUr0i/3qfX8yMvFeulwRKKT1rYCzEHFdbf1Rp1qjStKjVwSq56nCHUIO/3OIp61d+JgmyE7TIOleoDvmuLycVzrjGnM38gbIu4k+rOZKa2fmoM91gCM/Evdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YiyD3tXE; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-47662449055so22133471cf.1
        for <linux-media@vger.kernel.org>; Mon, 07 Apr 2025 05:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744028805; x=1744633605; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/4u5RYrNZsh+9smymDd4urY0c2xmRwtoKbTHADTmKzY=;
        b=YiyD3tXExE41dREqj9cEll3IKqkOe8hmEFjzHjeGVE0mLn7koYFl71BVum6cpLrolj
         NaJ+hsTTUlWA9wllhIcq3RpYfXaFOKqPsjqMcxzjwyjPJ9J8pmZX10V/+YZunHmvh5Am
         sMQG7S9ni0EC1bAXRSd33MjSBdg1vJ3EIwz4YULuCgLn7cYKisnzK4bWb6KbfpuKpozc
         P82gx/59/uixfFKIt073P5+8mK14PUAgwoSc/0d7ASmO22lEqQoRSiCoC+MtWHBt8Ea2
         oJD7DnJprk6oHbjYLXRDd86k5kKm9g3CUYXW6LFiSz/srmOaUM7nniL4W75vRfvdhMPT
         VGRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744028805; x=1744633605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/4u5RYrNZsh+9smymDd4urY0c2xmRwtoKbTHADTmKzY=;
        b=GHGUkXtVK64pE0GiR1lw7fBjj+6+UDRX52x5ert+EKZnRx6i4UYav6tHoxV+jcNTtm
         L+Jn087isgrExIB91VAcQkSbZkje8jDqC12SYcETMmHSly4MWzI3+OeO4QsZzYfSa+hk
         LiZAvcNAExaareYhjCN6jMb1ZcBu15pGATwaFGISQKKYoYz0Hw1BIUCkvrYK9E2JEhU1
         JM+DOBfTSU7edi2gcJuhw3yjNFaZ4bYUv+azxNa5LxgVf5YwnNPnfSayTMNpL1ImTaSV
         1siO4mYqqP3hYqTMKr8l3ZE+KuIoPO+KZ6nWQMOrn/BOZ3jSwC2n3GffrWPeuDzWu3q6
         DNEg==
X-Gm-Message-State: AOJu0YyrnQiou4ADMdZ5sQ9UBEpCKVTlkS/PL063alMIpyS7B1KIKFMk
	UD/oCii/qhhR6G/Rxw2YM5ciXoiOoEDC1WUV7W6uB4B7AdiLmZ1VJFf6rxZOWdUweiRsbJ8t+jH
	s7dvCuRb+T2NcUoJ/mIr3Qg73L5s=
X-Gm-Gg: ASbGnctkpTx3heXmA7ljAIVJ/ahkdDwY1B+I2JpdRntfDeDLbY/YP9O89RmvbeO6nfP
	x5HKlYtiwiol796UlsR5Gme30LPdgiXO1vJ0vIf138IpmJyGBYiGa7aG1s1tkLPNcxkFCK+JM6P
	Li8z6h2Mnr7lB9EDW3DgiaQ2B2mtJhpgFWpVIw5H9m0qzaSb8vBqLcMVTHeMoKczacrrCD
X-Google-Smtp-Source: AGHT+IEGrSORxMMHd21/PqXfGT0C/JWcELX6SedAIkTUNLGAxpmWvnIlmh2k5wd7lyxAyTp7UKt/Cpe5OgEoByWcw44=
X-Received: by 2002:ac8:5743:0:b0:476:8d3d:adb6 with SMTP id
 d75a77b69052e-4792598c12emr164828761cf.23.1744028804904; Mon, 07 Apr 2025
 05:26:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402135851.13627-1-gshahrouzi@gmail.com> <1a973afd-0ac7-4ba6-8b00-818d1405ebac@xs4all.nl>
In-Reply-To: <1a973afd-0ac7-4ba6-8b00-818d1405ebac@xs4all.nl>
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Date: Mon, 7 Apr 2025 08:26:00 -0400
X-Gm-Features: ATxdqUG8RliFIZGd21dQ15vb3wgr08edfBbspy_ARY5Wf9Xx4cPBZE_HIvj4CFY
Message-ID: <CAKUZ0zLoLbM3aN6VC+2kot9YxgHTMf4YuFjNSfL08ydL_+Bz0w@mail.gmail.com>
Subject: Re: [PATCH v4] staging: media: Remove unnecessary braces for single
 statement block
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	slongerbeam@gmail.com, p.zabel@pengutronix.de, mchehab@kernel.org, 
	gregkh@linuxfoundation.org, skhan@linuxfoundation.org, 
	kernelmentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 7:23=E2=80=AFAM Hans Verkuil <hverkuil@xs4all.nl> wr=
ote:
>
> On 02/04/2025 15:58, Gabriel Shahrouzi wrote:
> > Remove unnecessary braces in single statement block to comply with kern=
el
> > coding style.
>
> Please add the driver in the subject line. So:
>
> [PATCH v4] staging: media: imx: Remove unnecessary braces for single stat=
ement block
>
> That way it is clear that this is a patch for a specific driver.
Got it. Will send revision.
>
> Regards,
>
>         Hans
>
> >
> > Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> > ---
> >
> > Changes in v2:
> >       - Add missing author.
> >       - Fix title of email.
> > Changes in v3:
> >         - Resend using git send-email to fix formatting issues in email=
 body.
> > Changes in v4:
> >       - Use correct patch version.
> > ---
> >  drivers/staging/media/imx/imx-media-of.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/staging/media/imx/imx-media-of.c b/drivers/staging=
/media/imx/imx-media-of.c
> > index bb28daa4d713..7413551052ae 100644
> > --- a/drivers/staging/media/imx/imx-media-of.c
> > +++ b/drivers/staging/media/imx/imx-media-of.c
> > @@ -57,9 +57,8 @@ int imx_media_add_of_subdevs(struct imx_media_dev *im=
xmd,
> >               of_node_put(csi_np);
> >               if (ret) {
> >                       /* unavailable or already added is not an error *=
/
> > -                     if (ret =3D=3D -ENODEV || ret =3D=3D -EEXIST) {
> > +                     if (ret =3D=3D -ENODEV || ret =3D=3D -EEXIST)
> >                               continue;
> > -                     }
> >
> >                       /* other error, can't continue */
> >                       return ret;
>

