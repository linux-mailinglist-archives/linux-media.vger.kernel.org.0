Return-Path: <linux-media+bounces-35831-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D42AE7067
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 22:13:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D7CE11BC3F50
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 20:13:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12F722E6D0F;
	Tue, 24 Jun 2025 20:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ekQhmdJl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B920D23BD1B
	for <linux-media@vger.kernel.org>; Tue, 24 Jun 2025 20:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750795971; cv=none; b=iDXDYY6TfyrVXFUzBlgq5otspXTzSrQ1XejeQ7V0OoGkd01PqHGEB1tSUDFrnmGebcqT/gzgeNSyyC4z//pWIWgfWRz14Ab3nQPzGHzIRfgGeCZkI/xqnw4TuAyyWa6ru8SRoOC0UQuHGqlEyPIEnkL/g3qgjosksVf1VxANCuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750795971; c=relaxed/simple;
	bh=9uE6soxMZhgTlZ7KC7XYJ/6iHxKd+MAc+jNEAJayiFs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RZppTUDkQEDUSzUT4sbtjVUddCl9o8wGsyyu1M17meew5kWlACsgGsWArs46+tVWEf8X1mucIB0UbxbZBSXsvYHJDx5xgeIs/xyCj75dHxi5V0njPpNLKLNCaSpnbhV1iNldOUwn9vzWByEC7itOKFG1WWpb3317VIGiaRP54Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ekQhmdJl; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a510432236so4262375f8f.0
        for <linux-media@vger.kernel.org>; Tue, 24 Jun 2025 13:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750795968; x=1751400768; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hkLI5FjwJr7J0sSKVEiRJPglq27XduyLmRVF9ebXLCM=;
        b=ekQhmdJlLm1CpZwSoYHMR/EW8EkXUMbgrSYGqlMA7f2MAcXwB/ef6Sk9FJOdpbsSN8
         QCzlRlGc6S0Ke+eKPHuh6Y41YCM01VTwCbp2+TsLGatHOoaqAi9OcdyZc0hXZoaSH2B5
         2PDeNB2fNyGG7eTyaJ+i7w7XjVDsnmUrU7BQI/5vKdfqGYo71ijrDQsxU7xYM+uKAhkU
         7u0kRTlymX+1h2CAIUedUjau++cvzXEq66yjaOfe60NZUB86nrHehFVMD2sssAQKjMVW
         OpTdOrFn607LSMOHoWsOxEFIMebalfVQwEllZoIMFIh+6rqddGP8Jv39HaMOd6qweqfg
         XpdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750795968; x=1751400768;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hkLI5FjwJr7J0sSKVEiRJPglq27XduyLmRVF9ebXLCM=;
        b=Ywzhiq409BxJvvpQKKf5rfC4VLdMPPwUzA1hWNG3bg7uGcGr6YdAQUUBgM8sT2xwMl
         aYrxXE2xFHGiLlB5uuLKaCKTM4yGmSer4XLGtf1gUu8S+cthcap5V/JNinOyWTfWEwCu
         cunMMuS8WpM9BXGrUwq//bXlsI2WyZYrmK9fulMQPDSzHjk0ZUjknkUaCO5d9Cg4GEQH
         1f0rURdEJa9/vVmHJzg1DbylxB065TiTayLyiz5MUSfFt4fTcbJwS7YzNAKY7lBK9IHh
         oznftulZjJfM4XQUzOtAP8NfLlwuM0vw/GDvdgqccih7aWKLnELu2kb6wJVkwE2Dav+e
         nIvg==
X-Gm-Message-State: AOJu0YwuPo0s0gfENpkGKDbSCWDOneLvywIg90HJkTVmcYoUa9UPipZV
	ZaF+3ceDehQ/5aTgjTu8Ipa0T109HrIpNl2vgi/eQwpuYc2KkRNKgOQ6FtqE47OSkfXd2TyI9zM
	dtK+CqND8rYavS72IB99psCcTJFNErk8=
X-Gm-Gg: ASbGncuGeEkQ5SoDs0s7YjH74zF45mvdY7heU4Jc3SLNou+m2ezgvsaiLQMgRHiDI9d
	bJQyHCEcErteHIHonPlwd338iepMGgUR7fEIoHJhh/4/M/aDGm030PEl+3Jiayx77ABtsQ+F4Vh
	O2U7cSzJQJD7bBapWDV+moO8AJ2XpdW0PZh1N68MTHNx6YVdfUbTu2+Grm
X-Google-Smtp-Source: AGHT+IHmV/P5VaepBOeOXDXRPQRqlUwr8M5ctNvymqYyHE0t2Teb9liPriyjPS2jbnZq9HYDqPFe85k11mvb0dWODfc=
X-Received: by 2002:a05:6000:2b09:b0:3a5:2e9c:edb with SMTP id
 ffacd0b85a97d-3a6ed64b8f6mr48611f8f.47.1750795967759; Tue, 24 Jun 2025
 13:12:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250619204712.16099-1-laurent.pinchart@ideasonboard.com> <20250619204712.16099-2-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20250619204712.16099-2-laurent.pinchart@ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 24 Jun 2025 21:12:09 +0100
X-Gm-Features: Ac12FXyDpYWcy3WR-b-iph7UQJMdFhGhk8TnhXPnIPvcjmlshVQ-hr7TpErg0bw
Message-ID: <CA+V-a8vHW1mCYNycrxMxVqvt0GCffm8z7CxW1ij5Q+EUk3i11w@mail.gmail.com>
Subject: Re: [PATCH 1/5] media: v4l2-subdev: Limit the number of active routes
 to V4L2_FRAME_DESC_ENTRY_MAX
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Julien Massot <julien.massot@collabora.com>, Sakari Ailus <sakari.ailus@iki.fi>, 
	Hans Verkuil <hans@jjverkuil.nl>, Tommaso Merciai <tomm.merciai@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025 at 9:47=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Drivers that implement routing need to report a frame descriptor
> accordingly, with up to one entry per route. The number of frame
> descriptor entries is fixed to V4L2_FRAME_DESC_ENTRY_MAX, currently
> equal to 8. Multiple drivers therefore limit the number of routes to
> V4L2_FRAME_DESC_ENTRY_MAX, with a note indicating that the limit should
> be lifted when frame descriptor entries will be allocated dynamically.
>
> Duplicating the check in multiple drivers isn't ideal. Move it to the
> VIDIOC_SUBDEV_S_ROUTING handling code in the v4l2-subdev core.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-c=
ore/v4l2-subdev.c
> index e99647200e49..013ebb14b37b 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -985,6 +985,7 @@ static long subdev_do_ioctl(struct file *file, unsign=
ed int cmd, void *arg,
>                 struct v4l2_subdev_route *routes =3D
>                         (struct v4l2_subdev_route *)(uintptr_t)routing->r=
outes;
>                 struct v4l2_subdev_krouting krouting =3D {};
> +               unsigned int num_active_routes =3D 0;
>                 unsigned int i;
>
>                 if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS))
> @@ -1019,8 +1020,21 @@ static long subdev_do_ioctl(struct file *file, uns=
igned int cmd, void *arg,
>                         if (!(pads[route->source_pad].flags &
>                               MEDIA_PAD_FL_SOURCE))
>                                 return -EINVAL;
> +
> +                       if (route->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE)
> +                               num_active_routes++;
>                 }
>
> +               /*
> +                * Drivers that implement routing need to report a frame
> +                * descriptor accordingly, with up to one entry per route=
. Until
> +                * the frame descriptors entries get allocated dynamicall=
y,
> +                * limit the number of active routes to
> +                * V4L2_FRAME_DESC_ENTRY_MAX.
> +                */
> +               if (num_active_routes > V4L2_FRAME_DESC_ENTRY_MAX)
> +                       return -E2BIG;
> +
>                 /*
>                  * If the driver doesn't support setting routing, just re=
turn
>                  * the routing table.
> --
> Regards,
>
> Laurent Pinchart
>
>

