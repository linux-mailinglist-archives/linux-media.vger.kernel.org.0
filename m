Return-Path: <linux-media+bounces-2054-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 010CD80B82F
	for <lists+linux-media@lfdr.de>; Sun, 10 Dec 2023 01:00:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1F2A280F3E
	for <lists+linux-media@lfdr.de>; Sun, 10 Dec 2023 00:00:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52C622031D;
	Sun, 10 Dec 2023 00:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iJ0iweTF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D68DE126;
	Sat,  9 Dec 2023 15:59:56 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-28659b38bc7so3232713a91.0;
        Sat, 09 Dec 2023 15:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702166396; x=1702771196; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n7u/6Kwg7oxrjY82trCXpaLTJNUXXfWY7g8riBVNbTo=;
        b=iJ0iweTFyOFHwPCQPEvaQvzbzYO8WWpxpMRy6ed6A2Wc+HWstxTynJkqhmzWw5X1mR
         gNQESuWzYDkCl5PjGOTXWNU+nbvsm4SO9V8xUI6bNXqNNVLLGchysIp8uk7F5fi4gwR7
         ItYN6CbvHEuJVrjLvEdQdlIPR7zWTppQy5FfFYgofugVJDgFXDsKWSXK52c4PG6GdYlQ
         SwEvvfG+wAjchUTcGsjHqRBWCWZPZ97XeZ5NWifpHedJtUO8H4sFeaEwopKcSdwYwzjz
         ic4OHrzrw/z3DhVt4Lao3VSrSF2U9U8DyF7tFwSfkpDze4wlILnCFlJSP+71NFXpxBDS
         yY3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702166396; x=1702771196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n7u/6Kwg7oxrjY82trCXpaLTJNUXXfWY7g8riBVNbTo=;
        b=aJFUIL7MYgjdJAhI46OhcyEXjLKZwEFLz3OA4uOVVFXh9C9J3AosRwuj4ptm+EA/Mv
         lbWO7Nn86ber9yg7a0zVEl8Bby6E1LSvbYK7VvTXqE2ECSLCk2PFVq6E4hKfTEug6A6E
         G+KHslKXZ7Zo99B2DxDGRiRC9mYQ1OEfObtTxVWfk+ygdo3AxyTGE1jjHhhXjDhEiAJu
         ZQJ4eA0jNZ6UIrIFDC4/TL3tg/hurlNwMZDu9BBOiN9yLDsR8lLsiVytRbrfpA6J7LZY
         a8WCNQBvsEoZVZOh5Qt/F12l3xYWns8Xo3hxecIYJBGZe/wnsRxwHLsn1C8NUUD+Fwro
         w0RQ==
X-Gm-Message-State: AOJu0YxNEwPZHeSkyPonACeu7SBi2sZnxSkUOEc8BekDhbRGVb+vT/hp
	kKmcY8jQY8ntUCiR0BFeSxrspYpNwQNh/DxtjKv6cJzZOV4=
X-Google-Smtp-Source: AGHT+IFsamNcb3DC4qLzGDXYQB1aroJmpC4Bc/B7GM7eJDGJgncM5//HfAAKB4ZMUMMoIFjSyuJ10ZuAnhBAHf+c0Fw=
X-Received: by 2002:a17:90a:9c15:b0:286:9d14:65c with SMTP id
 h21-20020a17090a9c1500b002869d14065cmr1639230pjp.63.1702166395915; Sat, 09
 Dec 2023 15:59:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231129092759.242641-1-paul.elder@ideasonboard.com>
 <CAHCN7xLgypy8YMhxM1g27DWU7hY3nwAYLYRSMMDtODeGdd_CQg@mail.gmail.com> <ZWhZzNQ6VWcfvWZy@pyrite.rasen.tech>
In-Reply-To: <ZWhZzNQ6VWcfvWZy@pyrite.rasen.tech>
From: Adam Ford <aford173@gmail.com>
Date: Sat, 9 Dec 2023 17:59:44 -0600
Message-ID: <CAHCN7x+_pow1_3yODH4BMCrUfCQDhrZK4AQMtt6df_7PC92kPg@mail.gmail.com>
Subject: Re: [PATCH v4 00/11] media: rkisp1: Add support for i.MX8MP
To: Paul Elder <paul.elder@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, kieran.bingham@ideasonboard.com, 
	tomi.valkeinen@ideasonboard.com, umang.jain@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2023 at 3:45=E2=80=AFAM Paul Elder <paul.elder@ideasonboard=
.com> wrote:
>
> On Wed, Nov 29, 2023 at 05:36:25AM -0600, Adam Ford wrote:
> > On Wed, Nov 29, 2023 at 3:28=E2=80=AFAM Paul Elder <paul.elder@ideasonb=
oard.com> wrote:
> > >
> > > This series extends the rkisp1 driver to support the ISP found in the
> > > NXP i.MX8MP SoC.
> > >
> > > The ISP IP cores in the Rockchip RK3399 (known as the "Rockchip ISP1"=
)
> > > and in the NXP i.MX8MP have the same origin, and have slightly diverg=
ed
> > > over time as they are now independently developed (afaik) by Rockchip
> > > and VeriSilicon. The latter is marketed under the name "ISP8000Nano",
> > > and is close enough to the RK3399 ISP that it can easily be supported=
 by
> > > the same driver.
> > >
> > > The last two patches add support for UYVY output format, which can be
> > > implemented on the ISP version in the i.MX8MP but not in the one in t=
he
> > > RK3399.
> > >
> > > This version of the series specifically has been tested on a Polyhex
> > > Debix model A with an imx219 (Raspberry Pi cam v2).
> >
> > I have tested previous versions with a imx219 camera running in 4-lane
> > mode with great success.  Should I apply this series against
> > linux-next, or do I need to apply it against something in the media
> > tree to test?  I hope to test it tonight or tomorrow.
>
> I have it applied on 6.7-rc1.
>

For the series,

Tested-by:  Adam Ford <aford173@gmail.com> #imx8mp-beacon

>
> Thanks,
>
> Paul
>
> > >
> > > Laurent Pinchart (2):
> > >   media: rkisp1: Add and use rkisp1_has_feature() macro
> > >   media: rkisp1: Configure gasket on i.MX8MP
> > >
> > > Paul Elder (9):
> > >   media: rkisp1: Support setting memory stride for main path
> > >   media: rkisp1: Support devices lacking self path
> > >   media: rkisp1: Support devices lacking dual crop
> > >   media: rkisp1: Fix RSZ_CTRL bits for i.MX8MP
> > >   dt-bindings: media: rkisp1: Add i.MX8MP ISP to compatible
> > >   media: rkisp1: Add match data for i.MX8MP ISP
> > >   media: rkisp1: Shift DMA buffer addresses on i.MX8MP
> > >   media: rkisp1: Add YC swap capability
> > >   media: rkisp1: Add UYVY as an output format
> > >
> > >  .../bindings/media/rockchip-isp1.yaml         |  37 ++++-
> > >  .../platform/rockchip/rkisp1/rkisp1-capture.c | 128 ++++++++++++----=
-
> > >  .../platform/rockchip/rkisp1/rkisp1-common.h  |  35 ++++-
> > >  .../platform/rockchip/rkisp1/rkisp1-dev.c     |  66 +++++++--
> > >  .../platform/rockchip/rkisp1/rkisp1-isp.c     | 131 ++++++++++++++++=
+-
> > >  .../platform/rockchip/rkisp1/rkisp1-regs.h    |  32 +++++
> > >  .../platform/rockchip/rkisp1/rkisp1-resizer.c |  27 ++--
> > >  include/uapi/linux/rkisp1-config.h            |   2 +
> > >  8 files changed, 398 insertions(+), 60 deletions(-)
> > >
> > > --
> > > 2.39.2
> > >

