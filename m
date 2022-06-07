Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 311FF53F750
	for <lists+linux-media@lfdr.de>; Tue,  7 Jun 2022 09:35:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231752AbiFGHfy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Jun 2022 03:35:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230134AbiFGHfx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Jun 2022 03:35:53 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8562A69B62
        for <linux-media@vger.kernel.org>; Tue,  7 Jun 2022 00:35:51 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5D4776D4;
        Tue,  7 Jun 2022 09:35:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1654587349;
        bh=DjY9WxgQB06V1Ps5A+FwMVbosvSXaRVyFXdTyoDIRMY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=jGrJmPQIghrH1uVlmwzmaa4TgzDz32XHTRKt2jXzLyKyFRq+ak/3dqy9Rl/nm1aXe
         nhoVCo3+hwziQlGQCUYz3Tt+Kj70+OZkr2nojBYQmaDfNOknvkkSPjFHMTwxOvxnok
         XlEgL5+sa2Jh0mIxTsavV9ckrFeO1XnKzR5IlmBo=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <d0a7b646-deae-1c05-5833-eaf2394956d8@gmail.com>
References: <20220506211555.1364864-1-djrscally@gmail.com> <d0a7b646-deae-1c05-5833-eaf2394956d8@gmail.com>
Subject: Re: [PATCH] media: ipu3-cio2: Move functionality from .complete() to .bound()
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com
To:     Daniel Scally <djrscally@gmail.com>, linux-media@vger.kernel.org
Date:   Tue, 07 Jun 2022 08:35:47 +0100
Message-ID: <165458734700.4123576.298830375612187304@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Daniel Scally (2022-06-06 18:04:40)
> Hello all
>=20
> On 06/05/2022 22:15, Daniel Scally wrote:
> > Creating links and registering subdev nodes during the .complete()
> > callback has the unfortunate effect of preventing all cameras that
> > connect to a notifier from working if any one of their drivers fails
> > to probe. Moving the functionality from .complete() to .bound() allows
> > those camera sensor drivers that did probe correctly to work regardless.
> >
> > Signed-off-by: Daniel Scally <djrscally@gmail.com>
> > ---
> >
> > This results in v4l2_device_register_subdev_nodes() being called multip=
le times
> > but since it's a no-op where the devnode exists already, I think that i=
t's ok.
>=20
>=20
> There ended up being a problem with this. If a camera sensor driver
> registers a notifier via v4l2_async_register_subdev_sensor(), the
> devnodes for any device that bound to that notifier (a lens controller
> for example) would be created where v4l2_device_register_subdev_nodes()
> is called by the ipu3-cio2 driver's .complete() callback. This is
> because it won't be called until the lens controller's driver has
> probed. On the other hand, if the lens controller's driver probes late
> (after all the camera sensor drivers) then its devnodes _won't_ be
> created because it'll miss the calls to
> v4l2_device_register_subdev_nodes() when ipu3-cio2's .bound() is
> triggered as their drivers probe. The effect of this is that we still
> need a call to v4l2_device_register_subdev_nodes() in .complete() to
> make sure we catch anything that's bound to a notifier registered by one
> of the camera sensor drivers. This kinda defeats the purpose of the
> patch as if an ISP has one sensor linked to a lens controller and one
> one sensor without a lens controller, failure during probe of the driver
> for the lens-less sensor will mean .complete() is never called, and so
> the devnodes for the lens controller won't get created, and so the
> sensor with a lens won't work properly anyway.
>=20
>=20
> So - more thought needed on this I think. I still think it's the right
> approach to refactor such that a failure in one sensor driver's probe
> does not prevent any other sensors present from working provided _they_
> probe correctly, but I'm not sure the best way to achieve it now.


As highlighted by Jacopo, I've proposed [0] that we talk more about this and
really figure out a path to solving this (and planning to get it done I
hope) at the media summit which will hopefully be held in Dublin.

I last discussed this at the media summit in 2018! (life moves fast...)
and my slides are at [1].  I guess we've had time to think about it all
a bit more now since 2018, ... And certainly more usecases for this have
come up since.

Of course, ELCE/Summit is in September, so we can still work on this
topic before then too!

[0] https://lore.kernel.org/linux-media/165337661126.402452.101076820657826=
70158@Monstersaurus/
[1] https://docs.google.com/presentation/d/1Vdydt46QQtcYC0Sb7pn4qpL-ifnQdaC=
l0AkTSUIKE3U

--
Kieran



> >  drivers/media/pci/intel/ipu3/ipu3-cio2-main.c | 65 +++++++------------
> >  1 file changed, 23 insertions(+), 42 deletions(-)
> >
> > diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/me=
dia/pci/intel/ipu3/ipu3-cio2-main.c
> > index 93cc0577b6db..6a1bcb20725d 100644
> > --- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> > +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> > @@ -1387,7 +1387,10 @@ static int cio2_notifier_bound(struct v4l2_async=
_notifier *notifier,
> >  {
> >       struct cio2_device *cio2 =3D to_cio2_device(notifier);
> >       struct sensor_async_subdev *s_asd =3D to_sensor_asd(asd);
> > +     struct device *dev =3D &cio2->pci_dev->dev;
> >       struct cio2_queue *q;
> > +     unsigned int pad;
> > +     int ret;
> > =20
> >       if (cio2->queue[s_asd->csi2.port].sensor)
> >               return -EBUSY;
> > @@ -1398,7 +1401,26 @@ static int cio2_notifier_bound(struct v4l2_async=
_notifier *notifier,
> >       q->sensor =3D sd;
> >       q->csi_rx_base =3D cio2->base + CIO2_REG_PIPE_BASE(q->csi2.port);
> > =20
> > -     return 0;
> > +     for (pad =3D 0; pad < q->sensor->entity.num_pads; pad++)
> > +             if (q->sensor->entity.pads[pad].flags &
> > +                                     MEDIA_PAD_FL_SOURCE)
> > +                     break;
> > +
> > +     if (pad =3D=3D q->sensor->entity.num_pads) {
> > +             dev_err(dev, "failed to find src pad for %s\n",
> > +                     q->sensor->name);
> > +             return -ENXIO;
> > +     }
> > +
> > +     ret =3D media_create_pad_link(&q->sensor->entity, pad, &q->subdev=
.entity,
> > +                                 CIO2_PAD_SINK, 0);
> > +     if (ret) {
> > +             dev_err(dev, "failed to create link for %s\n",
> > +                     q->sensor->name);
> > +             return ret;
> > +     }
> > +
> > +     return v4l2_device_register_subdev_nodes(&cio2->v4l2_dev);
> >  }
> > =20
> >  /* The .unbind callback */
> > @@ -1412,50 +1434,9 @@ static void cio2_notifier_unbind(struct v4l2_asy=
nc_notifier *notifier,
> >       cio2->queue[s_asd->csi2.port].sensor =3D NULL;
> >  }
> > =20
> > -/* .complete() is called after all subdevices have been located */
> > -static int cio2_notifier_complete(struct v4l2_async_notifier *notifier)
> > -{
> > -     struct cio2_device *cio2 =3D to_cio2_device(notifier);
> > -     struct device *dev =3D &cio2->pci_dev->dev;
> > -     struct sensor_async_subdev *s_asd;
> > -     struct v4l2_async_subdev *asd;
> > -     struct cio2_queue *q;
> > -     unsigned int pad;
> > -     int ret;
> > -
> > -     list_for_each_entry(asd, &cio2->notifier.asd_list, asd_list) {
> > -             s_asd =3D to_sensor_asd(asd);
> > -             q =3D &cio2->queue[s_asd->csi2.port];
> > -
> > -             for (pad =3D 0; pad < q->sensor->entity.num_pads; pad++)
> > -                     if (q->sensor->entity.pads[pad].flags &
> > -                                             MEDIA_PAD_FL_SOURCE)
> > -                             break;
> > -
> > -             if (pad =3D=3D q->sensor->entity.num_pads) {
> > -                     dev_err(dev, "failed to find src pad for %s\n",
> > -                             q->sensor->name);
> > -                     return -ENXIO;
> > -             }
> > -
> > -             ret =3D media_create_pad_link(
> > -                             &q->sensor->entity, pad,
> > -                             &q->subdev.entity, CIO2_PAD_SINK,
> > -                             0);
> > -             if (ret) {
> > -                     dev_err(dev, "failed to create link for %s\n",
> > -                             q->sensor->name);
> > -                     return ret;
> > -             }
> > -     }
> > -
> > -     return v4l2_device_register_subdev_nodes(&cio2->v4l2_dev);
> > -}
> > -
> >  static const struct v4l2_async_notifier_operations cio2_async_ops =3D {
> >       .bound =3D cio2_notifier_bound,
> >       .unbind =3D cio2_notifier_unbind,
> > -     .complete =3D cio2_notifier_complete,
> >  };
> > =20
> >  static int cio2_parse_firmware(struct cio2_device *cio2)
