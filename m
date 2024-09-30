Return-Path: <linux-media+bounces-18766-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B52F989C15
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 09:59:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EFC061F21BC2
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 07:59:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4BB716F282;
	Mon, 30 Sep 2024 07:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e2Tk30iK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D262E16A92E
	for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 07:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727683170; cv=none; b=RpMId6A+ekPCLa3S11bvYbOBgfQvNr88Sa62P7KGWOl1SWA0y+d4hPmVUke9IQn1+JqP7JyGnR82C/mv7Cjobt3318uxutyCaq4oWHRB8cs5zl8h77u3cInQ/VNzMojCT9c7MSFiZZLSvmQ9HjhoQoUVctY6+m5vA9+KZpW58VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727683170; c=relaxed/simple;
	bh=b+eRIAGCd3YYfsgZzG0U8MoV013Euh2P/SlDpNnXS7Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O0OwYqddIadCbxBzZojUXJ3PrzkI7LMAdk2hhDYJ+SqXwk0FokDkIx2XSQ3SXZmOa8G2nJxmqQHEZvJjU7W117LRvC1cd2P5CX6GI1C+MtHWDeRLYR5l8wEoKc1qAg+ENzIDjfT8L6YW86xIQ7UdHY9UNHNBBW+G2x+gshshO6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e2Tk30iK; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-50ac0c8cd48so166362e0c.1
        for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 00:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727683168; x=1728287968; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z00/Hjl86Oeb73mUgqv788a2BO6QJV84RaeUftS+cFo=;
        b=e2Tk30iKazflCK/V76xD6TsPUQfKFCj2xaZKbzXKxzQ4cYxQdFlcuxRS8HBlmOaFWv
         dK8VQjtSaN6x/SupUUdUvR1aXMf9Ei5widcbwt2oSc+Z6MK148Ke1rpI946Vwn2WdGGg
         NwxA2uTmnTyXkfEyxL5nsqRKWMQfeKt4sBLiqXLWie2RV+X+G39gRJNUMmcPZOuaXnEM
         tJ9C5vRSFsECPQ4CfZKuADRPzP8JD1oQxTC3Mr5nqIjeeIvy7RhZOdvQPh2DghglZoYQ
         TjhOmkannUaVRu6cXGc136k0NhbzUmX6mBw34hgiwRMscSknNujhE5wHYL5MrRcuc1vU
         wRKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727683168; x=1728287968;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z00/Hjl86Oeb73mUgqv788a2BO6QJV84RaeUftS+cFo=;
        b=aqVzWQBq67MBfcW64VQ4y43J57FPpSIViOwLDlrw6yFg0WXZVtsXUw+xa+PxUCRguW
         bPa2LZR9XDiIupi9SF3XU6C5lsEI7Joaj4i/4xf3h381+A181AT1e/oIpvuvAF05Haaj
         dOsl5BlhFDBCj1EvA/Jg6YxdE8QjoELkT9fhSNbgdHWTj6Ld9dIfTzTAdPPOxsJdXAUu
         KzuiPe41UNE9LYhgDtKxRYSyenLJ5L0toL9JBiiueG5ZoTEOm3cTl3D0IhxM4RtRQ98I
         ruW1OZpnVq1Z/tefieyIilG4rL5bjZdU5CT+25/uxwMxujZVbZpu6bMSRkspa0a6xnsG
         4klw==
X-Forwarded-Encrypted: i=1; AJvYcCVwamO+NxcTZYmH9iWiViPkiBXPtqxcwWkoO5qPa9Nztkh5TEPZQD9IETHBlLzLlu57svepFfZ0bpBbrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpgkU6IXR5sYlwP2nHvyO+ryCfqR55oSMXoCjjgtTEWRbLc0LP
	LRxsQXLewMv5VhLX/mR9BQRqeGJRWddngEVnape0f6wkDgCA3kWcAhbXD6uK0OslXWd1+3wUR3m
	HrLPAYqEX+qo/NWvX5ui6bz+M8bt3Dw==
X-Google-Smtp-Source: AGHT+IHni9+9dwKnVVa2AUweB8Pyzzh3dP1PEd5ZflrkoPE4WXmNkRZSZ/NAGJSPRVGA1hoKzpc7m/yrIgdDWaYhUgg=
X-Received: by 2002:a05:6122:1e03:b0:4ec:f8f0:7175 with SMTP id
 71dfb90a1353d-507818d02f8mr6870802e0c.11.1727683167548; Mon, 30 Sep 2024
 00:59:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240920124115.375748-1-dan.scally@ideasonboard.com>
 <20240920124115.375748-4-dan.scally@ideasonboard.com> <OSZPR01MB7019254D2E2BC702CE6222ACAA6B2@OSZPR01MB7019.jpnprd01.prod.outlook.com>
 <20240927232729.GR12322@pendragon.ideasonboard.com>
In-Reply-To: <20240927232729.GR12322@pendragon.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 30 Sep 2024 08:59:01 +0100
Message-ID: <CA+V-a8vYWi3u2+DjAgwbSGuALze4V-NdGdV=a-kCw18oHg_=Yg@mail.gmail.com>
Subject: Re: [PATCH 3/4] media: platform: rzg2l-cru: Use v4l2_fill_pixfmt()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Daniel Scally <dan.scally@ideasonboard.com>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>, 
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>, 
	Daniel Scally <dan.scally+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

On Sat, Sep 28, 2024 at 12:27=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Fri, Sep 27, 2024 at 12:51:24PM +0000, Prabhakar Mahadev Lad wrote:
> > Hi Daniel,
> >
> > Thank you for the patch.
> >
> >
> > > From: Daniel Scally <dan.scally+renesas@ideasonboard.com>
> > >
> > > Rather than open-code a calculation of the format's bytesperline and
> > > sizeimage, use the v4l2_fill_pixfmt() helper. This makes it easier to
> > > support the CRU packed pixel formats without over complicating the dr=
iver.
> > >
> > > This change makes the .bpp member of struct rzg2l_cru_ip_format and t=
he
> > > rzg2l_cru_ip_pix_fmt_to_bpp() function superfluous - remove them both=
.
> > >
> > > Signed-off-by: Daniel Scally <dan.scally+renesas@ideasonboard.com>
> > > ---
> > >  .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  3 ---
> > >  .../platform/renesas/rzg2l-cru/rzg2l-ip.c     | 16 --------------
> > >  .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 21 ++---------------=
--
> > >  3 files changed, 2 insertions(+), 38 deletions(-)
> > >
> > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > This patch doesn't apply cleanly on top of media-stage + [0]
> >
> > [0] https://lore.kernel.org/all/20240910175357.229075-1-prabhakar.mahad=
ev-lad.rj@bp.renesas.com/
>
> Is it fine with you to wait for v3 of your series and rebase this one on
> top ?
>
Yep, sounds good to me.

Cheers,
Prabhakar

