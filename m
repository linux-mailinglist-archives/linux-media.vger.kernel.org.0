Return-Path: <linux-media+bounces-17657-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D341496D2DC
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 11:12:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DDAB91C24BA7
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 09:12:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CFF319754A;
	Thu,  5 Sep 2024 09:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JHqR8V1b"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F81A8F66;
	Thu,  5 Sep 2024 09:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725527544; cv=none; b=TIBTNBHXSzMV3GeiKCqegCnwpXdF/2GNR5+hA/QJVlQAXlOSsLlY+tL3HY/Kzr4Gw7aniPgkHbakH++uo+v5KDZwTRYRsh3EhCfXpUO8/cvyMtlyobytlNZ300TugVHI74t9lkphSQQkvOgY/KNiDlHFtfoGO4D6r0VaMASP1d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725527544; c=relaxed/simple;
	bh=GsmrF8NpILZT25SEjvmGH6FoLvoDtl+u9JqeVbt3tmM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NGyLEwsLkalpWYQBAuJpJdTxyGDfSjsFH3SK1sTR6QOKnDybxiWT/JHFbyL7ArMC87cG5ChLxSbg8Jf4305soREayjBw/OVj+gAtBJzBwERLi/j0LkwqBcizZFj0YqArTKUtRpOmg6vWJw3dRzmQEWDRgHcnl2RGepuOVpGalxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JHqR8V1b; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-4fce6fd54ebso273878e0c.1;
        Thu, 05 Sep 2024 02:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725527541; x=1726132341; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1HjoNmFSsI93w8LT0KZY47MJqv2yvPLw+2VxDDFXmGM=;
        b=JHqR8V1buP0z7N3eOGCF5BKc2fbWjq2mwt41mw5MYvQNeg/RvAoMB09wnMpBFSe1Jh
         hJtJNbDtRDinsxSLfOxM6YUk1NexCCsUlICoKHxZVOf6tJx4K9g8OJ8ok+bJB9yTyQlq
         H3S3Zf15WhwNmgk6BbvGlxB89yT6BPhsw9b5BqsCcTxKnLOGW/g88VSfBqI3cBVzZ6cz
         VK9af5DSrOfVQ2MuZlNjYfioyE2PL2ITAapFFWl1xKkEKLJuufEfhT4Ci/f+YZke+hkz
         o/RV/CUxdv87jF18EBIpcCetCOqUr0a5CLEJMf9i+pwoWFPvSKvxvk62e8NzRVhNHXsS
         emAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725527541; x=1726132341;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1HjoNmFSsI93w8LT0KZY47MJqv2yvPLw+2VxDDFXmGM=;
        b=ODFl1VY21Bn/oX4MxlZ826eAQ5Am20qOWcu/x+56CvVOpBNmf1uRG2oyofUg5LAfbS
         /9DJyu9Sko3E3xCOrxmUeYHXUX/cCbG0rkun7mjSpDnTogm29JSyOh7IafqCg8zY21Zp
         UOvTycZ+LHQVjM1FIUVg09DgqLNzmx8z9+t5kMKxAyGsZaY0fy5KB0UdwFs0TNO8h9Jw
         lmwF8xlQPbVftqjhRVF7rKadHDE+TNs8Vx+ZZZ1pTsnFQd6grrSg4ZmJJoWrjGI9+h8K
         pkBVaNjHNwhi9EDjAvexf8NlF4OYU3bVVs0iX4CUYLmNyVCaG/TMLkxI9VcdAIDRCiwf
         1hdg==
X-Forwarded-Encrypted: i=1; AJvYcCW4AkxxFNDop8uW/+GovPjPHqqrn8FlwH6MgO5Ja23C8BztZrKmY1rIv0czPK5S+EGYIhYjs08a6FKlatY=@vger.kernel.org, AJvYcCWXdO4RU2/vzwN3cJUJchqFOf4gNKgK1WNOB4ubIyyo9OC7UjOdBqgBI2+53wxqs5gDZpNsLcatutWx64nFovsanY4=@vger.kernel.org, AJvYcCXmvAAW82XBBgizZcetw96gcN3th1kPIDEkbyESXLX64vni7/EWovQZr1/c4PbTYxlTnT0Z67kQBcdRc+I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPVrAziMtZXU+RneKxd0wKYRXuPjiaNAKErxvQIrr88Gyx6S8n
	XSbBHYRE73Hs8Q/yiSoE+8y2ALEfdrxfYUecLlf+v1VoTfsRPOuVhfCfPZvBzCQu6P4kc6xhzBw
	6Xj7pU+b/asg4cExpfflevB0BNNBNn1wllyU=
X-Google-Smtp-Source: AGHT+IGTmVysXOt7m1UdWntoCPzWx47Ei25RPei+JfGF8/D4KmmO5PB4lzy7mSgEplIMs+REr2Z57bbxey1WtZtIvVY=
X-Received: by 2002:a05:6122:169c:b0:4fd:1632:d341 with SMTP id
 71dfb90a1353d-5009ac0002emr20778560e0c.3.1725527541129; Thu, 05 Sep 2024
 02:12:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240904210719.52466-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <3eeae62a-e22b-443a-aad4-f1a384c0a3f7@ideasonboard.com>
In-Reply-To: <3eeae62a-e22b-443a-aad4-f1a384c0a3f7@ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 5 Sep 2024 10:11:54 +0100
Message-ID: <CA+V-a8u9FY5Nd6Kdp6zy9OKmMDWiK2HG9KGfKDRKXch7-LozLg@mail.gmail.com>
Subject: Re: [RFC PATCH 00/12] media: ov5645: Add support for streams
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tomi,

Thanks for the feedback.

On Thu, Sep 5, 2024 at 7:48=E2=80=AFAM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
>
> On 05/09/2024 00:07, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Hi All,
> >
> > This patch series aims to add the below features,
> > - Support subdev active state
> > - Support for streams
> > - Support for virtual channel
> > - Code cleanup
> >
> > Sending this is as an RFC, I've done limited testing and Im seeing issu=
e
> > when route is updated and wanted some feedback on the implementation.
> >
> > When route is updated for the sensor with below command, and when start
> > streaming I get "Dangling sink streams: mask 0x1" error. Should the
> > corresponding bridge also need to support routes to fix this? or is it
> > something missing Ive missed in the current implementation.
> >
> > $ media-ctl -R "'ov5645 0-003c' [1/0->0/1[1]]"
> >
> > Output after route update:
> > - entity 4: ov5645 0-003c (2 pads, 1 link, 1 route)
> >              type V4L2 subdev subtype Sensor flags 0
> >              device node name /dev/v4l-subdev1
> >          routes:
> >                  1/0 -> 0/1 [ACTIVE]
> >          pad0: SOURCE
> >                  [stream:1 fmt:UYVY8_1X16/1920x1080 field:none colorspa=
ce:srgb
> >                   crop:(0,0)/1920x1080]
> >                  -> "csi-10830400.csi2":0 [ENABLED,IMMUTABLE]
> >          pad1: SINK,0x8
> >                  [stream:0 fmt:UYVY8_1X16/2592x1944 field:none colorspa=
ce:srgb
> >                   crop:(0,0)/1920x1080]
>
> I think you actually want 1/0->0/0 routing.
PAD1 -> Internal image pad Sink
PAD0 -> Source

The above combination works were pad1/stream0 ---> pad0/stream0

> The error says that the sink
> side device has routing which does not have a stream at stream ID 1, or
> no routing support at all, which implies a single stream at stream ID 0.
>
To support virtual channels I have the below routes,

    struct v4l2_subdev_route routes[OV5645_ROUTES_MAX] =3D {
        {
            .sink_pad =3D OV5645_PAD_IMAGE,
            .sink_stream =3D 0,
            .source_pad =3D OV5645_PAD_SOURCE,
            .source_stream =3D 0,
            .flags =3D V4L2_SUBDEV_ROUTE_FL_ACTIVE,
        },
        {
            .sink_pad =3D OV5645_PAD_IMAGE,
            .sink_stream =3D 0,
            .source_pad =3D OV5645_PAD_SOURCE,
            .source_stream =3D 1,
        },
        {
            .sink_pad =3D OV5645_PAD_IMAGE,
            .sink_stream =3D 0,
            .source_pad =3D OV5645_PAD_SOURCE,
            .source_stream =3D 2,
        },
        {
            .sink_pad =3D OV5645_PAD_IMAGE,
            .sink_stream =3D 0,
            .source_pad =3D OV5645_PAD_SOURCE,
            .source_stream =3D 3,
        },
    };

Where the image pad sink stream0 can connect source stream0/1/2/3

So to switch source stream1 I use the below:
$ media-ctl -R "'ov5645 0-003c' [1/0->0/1[1]]"

With the above I connect sink pad1 stream0 -> source pad0 stream1,
(unless Ive misunderstood the connection graph).

Cheers,
Prabhakar

