Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A36C017CE45
	for <lists+linux-media@lfdr.de>; Sat,  7 Mar 2020 14:03:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726134AbgCGNDe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 7 Mar 2020 08:03:34 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:36895 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726043AbgCGNDe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 7 Mar 2020 08:03:34 -0500
Received: by mail-oi1-f194.google.com with SMTP id q65so5501312oif.4;
        Sat, 07 Mar 2020 05:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=6pgNNlcavLuVjj49GMK+wfXOssMj69a2cB8yGId4NYQ=;
        b=kHPC1Cbso2QiFygJ85SMacvt12NOT6uZqn/DoWRVLm60z0YcE63a2NZFtHTWlBRofT
         JwBks+FmsyoUImjcYPpQe/Fn5KG4Ptec+vQesKcHvvfSdTWBz8ise8LqZKIIx2ale9LA
         9HDi/sxRPjtjXplwMY1Zv1wII9Ip0CgJQMu5EbL0/cSPSm95TIS1qeKCry1sHqtAN6pE
         6ATzT9PeU0jm3ti3OuWT2jc4jWJJ1kkifakYXx6iEWiTb/hhTcaRew1/5VeXHp7rbteZ
         IVGGmq6+CT0qm4YrdQpnw1q9V5LtZfZrMqrQcQOryVFFTPcuFtxwGjgxV1oD+G46dhgi
         jKzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6pgNNlcavLuVjj49GMK+wfXOssMj69a2cB8yGId4NYQ=;
        b=p/Yy5mLCsy2dEFj+7Hj759ywUVB1SrFeuQI8PIr5rbMv3J1cqOr71Fd5uQrtZYkqPO
         43HzrSYQoQG5Fsxp9/bKov/6oPrNEE7XUcgkz/9oaJDCQ7a22MC09EMkI86tz9zC05Rm
         JOd1ZZF7x3Kbid53acGh6E4efRbtj8VtdoD0liSe0TDhgU9NLLgwhw0zEoWaeB2QUGv1
         nqixLBW+JOVaXNkscjsScf20Y4UhtMzxSUh172sJkVf4afVQa1sfV4MLBpdF2Iylhu5p
         vsHd9LjF6XxPsTu3f+l70Ek/0FpVpwgNeIcmQK4uoAuMABEFV5tpX0ZDSXzRrd2Blayk
         L8gA==
X-Gm-Message-State: ANhLgQ11LfB3I7J/NWi8cou8FwtnZWKSG45FeCPblM2+JMMrit93EPbm
        Lq4BrYOufj5f1JiM7BFVmt586ubL/S3exkhmYRYmWitR
X-Google-Smtp-Source: ADFU+vsFjKRpKP1FY2AISTU9jdkvs1VcpproCi+zI9mfkHt+92OJN0c1Rigdv4o+9F6A/9j277d25GPdxY0HMhCh4qU=
X-Received: by 2002:aca:f405:: with SMTP id s5mr5809255oih.93.1583586211093;
 Sat, 07 Mar 2020 05:03:31 -0800 (PST)
MIME-Version: 1.0
References: <20200228165011.17898-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200228165011.17898-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <20200304204715.GC1791497@oden.dyn.berto.se>
In-Reply-To: <20200304204715.GC1791497@oden.dyn.berto.se>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Sat, 7 Mar 2020 13:03:04 +0000
Message-ID: <CA+V-a8sV9CUoyp1C6+ZPhBbP17ypdsCD_KuPnCd+-miO2npaXQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] media: rcar-csi2: Fix registering camera endpoint to VIN
To:     Niklas <niklas.soderlund@ragnatech.se>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

Thank you for the review.

On Wed, Mar 4, 2020 at 8:47 PM Niklas <niklas.soderlund@ragnatech.se> wrote=
:
>
> Hi Lad,
>
> Thanks for your work.
>
> On 2020-02-28 16:50:10 +0000, Lad Prabhakar wrote:
> > CSI2 registers camera/sensor as v4l2 async sub device with fwnode is
> > remote endpoint and the camera/sensor register itself as v4l2 sub devic=
e
> > with fwnode is remote device as a result the match.fwnode should be
> > fwnode_graph_get_remote_port_parent and not
> > fwnode_graph_get_remote_endpoint.
> >
> > This patch makes use of v4l2 helper function
> > v4l2_async_notifier_add_fwnode_remote_subdev() which uses
> > fwnode_graph_get_remote_port_parent as match.fwnode fixing the issue
> > of registering camera endpoint to the driver.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> I'm afraid this is not the right solution. The rcar-csi2 driver uses the
> v4l2-async framework to do endpoint matching instead of node matching.
> This is needed as it needs to work with the adv748x driver which
> register it self in v4l2-async using endpoints instead of nodes. The
> reason for this is that from a single DT node it creates multiple
> subdevices, one for each endpoint IIRC.
>
> Without this patch the two CSI-2 receivers on R-Car M3-n registers the
> two following 'paths' in v4l2 to be able to find the two subdevice CSI-2
> transmitters created by the ADV748x.
>
> rcar-csi2 fea80000.csi2: '/soc/i2c@e66d8000/video-receiver@70/port@b/endp=
oint'
> rcar-csi2 feaa0000.csi2: '/soc/i2c@e66d8000/video-receiver@70/port@a/endp=
oint'
>
> With this patch applied it registers the following which can't be found
> as they are not present in the v4l2-async list of subdevices (as they
> are registerd as above).
>
> rcar-csi2 fea80000.csi2: '/soc/i2c@e66d8000/video-receiver@70'
> rcar-csi2 feaa0000.csi2: '/soc/i2c@e66d8000/video-receiver@70'
> rcar-csi2: probe of feaa0000.csi2 failed with error -17
>
> This patch may unlock your use-case as it's a known problem that
> endpoint and node matching do not mix. But it will break the already
> upstream use-case and for that reason, I'm really sorry about this.
>
Completely missed it, thank you for pointing out.

> Nacked-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>
>
> The real solution to this problem IMHO is to make all of v4l2-async
> operate using endpoint matching or possibly some kind of fallback to
> node matching if no endpoint can be found. Never the less some work is
> required in the v4l2-async core to sort out node and endpoint matching
> coexistence.
>
Thank you for the pointers, I shall do some digging in v4l2-asyn.

Cheers,
--Prabhakar

> > ---
> >  drivers/media/platform/rcar-vin/rcar-csi2.c | 14 ++++++--------
> >  1 file changed, 6 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/medi=
a/platform/rcar-vin/rcar-csi2.c
> > index faa9fb23a2e9..5b04e4768eb1 100644
> > --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> > +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> > @@ -833,20 +833,18 @@ static int rcsi2_parse_dt(struct rcar_csi2 *priv)
> >               return ret;
> >       }
> >
> > -     priv->asd.match.fwnode =3D
> > -             fwnode_graph_get_remote_endpoint(of_fwnode_handle(ep));
> > -     priv->asd.match_type =3D V4L2_ASYNC_MATCH_FWNODE;
> > -
> > -     of_node_put(ep);
> > -
> >       v4l2_async_notifier_init(&priv->notifier);
> >
> > -     ret =3D v4l2_async_notifier_add_subdev(&priv->notifier, &priv->as=
d);
> > +     ret =3D v4l2_async_notifier_add_fwnode_remote_subdev(&priv->notif=
ier,
> > +                                                        of_fwnode_hand=
le(ep),
> > +                                                        &priv->asd);
> >       if (ret) {
> > -             fwnode_handle_put(priv->asd.match.fwnode);
> > +             of_node_put(ep);
> >               return ret;
> >       }
> >
> > +     of_node_put(ep);
> > +
> >       priv->notifier.ops =3D &rcar_csi2_notify_ops;
> >
> >       dev_dbg(priv->dev, "Found '%pOF'\n",
> > --
> > 2.20.1
> >
>
> --
> Regards,
> Niklas S=C3=B6derlund
