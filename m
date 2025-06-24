Return-Path: <linux-media+bounces-35833-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 973A2AE706D
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 22:14:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10EC917D5A1
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 20:14:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E59632E92D0;
	Tue, 24 Jun 2025 20:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ij40LSTa"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14EBE23BD1B
	for <linux-media@vger.kernel.org>; Tue, 24 Jun 2025 20:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750796082; cv=none; b=k4AZ+O+5gaj7hEQAd5BPOWt3xC+unRKHv3mEh3OMxMahzNzcQkrQpaL0O+lUnpW9Y3hlR36+AWHNs6Pt8YlvEihXux4Yd2ApMZxpoH5EJVfNWVXXL0FqDdrApoHF3C3A9O+iEWwl9/+tgstthf3M3HakP6Dww8Ap6nZxNFRPBL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750796082; c=relaxed/simple;
	bh=FLsjB6LDkEkviyhH1QN439gwGYk+fvHYJ2mH13wKzWw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LQSlC/PeXbgzMImGFLGWaOp/QcPmc5vpweAvQIVCQyqQ5ba/qbmIkEViT3md0GRI61xf9A0aHeeauDRdwWqSMLztHOCHrrvf56TNCh/6Z4xbH1CxSINeZy8g2F7eHoCixAhaqxCFSnetBr2LUpeTkl3hbTn/b0L32fx2Xy1iCpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ij40LSTa; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-453398e90e9so39792915e9.1
        for <linux-media@vger.kernel.org>; Tue, 24 Jun 2025 13:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750796078; x=1751400878; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a1lSNyT5ts8p5OfDDng0iWEtAN3aXewnSGMeX61dvqI=;
        b=ij40LSTabOPowODqAXRh98FcowZiaoYw4fjcad7yW4B9XFNWvY4U8v6zz4bX5zeb0h
         HdNKiOQmzM/2YqZgRGyv38AAghD4MNysPUostjia9sxIO6AtkvWjhcIOXXNTEWEu6ETj
         awQ16aUux3NNVUCRZ/1VpxSKqHKneiY7UqoN7zX3cVK5oxcc4/4keWDt6iQfeY2AQ8ra
         wlrDKwPSQ2UGmut6yYgC+T8cNmx8+xqrjn3OX8SgHAJtqYSTvj4KPt7+qyULpKqnUbMh
         ZdPpZdmV1EiAgQ8lhI9lO0ThmAxSUh9wY55NHuB5b0K2+cLvQCr6mn9+qwMz6zATBgg9
         cwqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750796078; x=1751400878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a1lSNyT5ts8p5OfDDng0iWEtAN3aXewnSGMeX61dvqI=;
        b=VZTaFTRmnrL1ps327b0tL/fweb4uMpxjL+DYtUdZLam5kKQ4O/Mt+TvNWDBYN7svP4
         VvqkDW45xhaS+W/EmT0x2xK2/b+7jBxeO12yIcqnxg4cpcLMPM7x/Icz2CzfpWBekzDT
         qjO9JZ4wysipzNpw8uNXEaRTnhOqI4MUhc/hkT8d6cBcmlalTcYfFlGNkQWGdAujy3s4
         NAunFJU95FutSt5UcYBvaFD/88c6r1fEh0AkQm0PCB074GVyeMd60UIffhDAWR6DmPCO
         G1nWSU/XBNluBDtrYK340jPJhFSs/N1ByVUJ0p7AJh6OLx4msnAk9MuwWGxbJ3Iexsr3
         607Q==
X-Gm-Message-State: AOJu0Yyl2niQJTOJqSuA8rcP3IE5z0RVIi9AKpRv2QmlyEiuwHeCz9E7
	QT+xkxCrvHrts4EVVPg205sw7GkFlUVOKk4qc5YJnSMUjep9yxPgEkiGXHFSvq5ufvyq33nFPbV
	AQUhHhoKjauIzLQ/i8KFbTEc6HBSaxbU=
X-Gm-Gg: ASbGncuzqJ3wuoyUH521v5Myy5AJMGBE41PqLcU2qU30Zr3GiPEU6C6exA2KVd3DfKM
	4G08v4b+G2WyH9eXKsRxqfkXD5TswmgvBPPideqmrPELUEf+XcZ4X4UbAKEASk4JnQSkOVFZtsh
	RsfHjsYbtZZoDvQ3LczIUPl1m6L01k8P3M31tBoS69SO1Q4A==
X-Google-Smtp-Source: AGHT+IH36a0SwMIT+LtWGCwGO4L2SKfkYoLbMnCGzqZwycd3DQNSFj9Bba+qvAq8rCHA5kdGqVvd4OUoUCxs3ubIWpc=
X-Received: by 2002:a05:600c:190e:b0:43d:563:6fef with SMTP id
 5b1f17b1804b1-45381ae9028mr2509315e9.21.1750796078336; Tue, 24 Jun 2025
 13:14:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250619204712.16099-1-laurent.pinchart@ideasonboard.com> <20250619204712.16099-4-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20250619204712.16099-4-laurent.pinchart@ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 24 Jun 2025 21:14:11 +0100
X-Gm-Features: Ac12FXznPs6pA19mFf_1yC31v2JMlDYDilvtrJU6-xw64C9IMwRCfHdZ1f5CynI
Message-ID: <CA+V-a8s2Wr+BzSb0PDdmotVzssth=BH9RaCSHXXTr7W1vRqxrw@mail.gmail.com>
Subject: Re: [PATCH 3/5] media: i2c: ds90ub953: Drop check on number of active routes
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Julien Massot <julien.massot@collabora.com>, Sakari Ailus <sakari.ailus@iki.fi>, 
	Hans Verkuil <hans@jjverkuil.nl>, Tommaso Merciai <tomm.merciai@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025 at 9:48=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> The subdev core now limits the number of active routes to
> V4L2_FRAME_DESC_ENTRY_MAX. Drop the duplicated check in the ds90ub953
> driver.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/i2c/ds90ub953.c | 8 --------
>  1 file changed, 8 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.=
c
> index 46569381b332..c80f5061a13a 100644
> --- a/drivers/media/i2c/ds90ub953.c
> +++ b/drivers/media/i2c/ds90ub953.c
> @@ -456,14 +456,6 @@ static int _ub953_set_routing(struct v4l2_subdev *sd=
,
>         };
>         int ret;
>
> -       /*
> -        * Note: we can only support up to V4L2_FRAME_DESC_ENTRY_MAX, unt=
il
> -        * frame desc is made dynamically allocated.
> -        */
> -
> -       if (routing->num_routes > V4L2_FRAME_DESC_ENTRY_MAX)
> -               return -EINVAL;
> -
>         ret =3D v4l2_subdev_routing_validate(sd, routing,
>                                            V4L2_SUBDEV_ROUTING_ONLY_1_TO_=
1);
>         if (ret)
> --
> Regards,
>
> Laurent Pinchart
>
>

