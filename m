Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C06C5427DE4
	for <lists+linux-media@lfdr.de>; Sun, 10 Oct 2021 00:35:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230342AbhJIWhr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 Oct 2021 18:37:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230116AbhJIWhr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 9 Oct 2021 18:37:47 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A267EC061570
        for <linux-media@vger.kernel.org>; Sat,  9 Oct 2021 15:35:49 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D99CB49C;
        Sun, 10 Oct 2021 00:35:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1633818946;
        bh=43/cjfDhiEMqF/DFfaZzhxrCSsUXslRXMEL2+ipclHE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=WvZAtbzyylv9W6Gp0+Aci3a0gLgLogZ5OQ2QdFnrKchey2XyvLIZ7KHFYMbdEkTbS
         FICbLSofemmazXT1/5a0/cnIaFRiXaJBIadGyvb1pq/3ndg4RGy2BI7NpsEcI7YmTC
         o9I/I/eKq5nEIZY9h8+pgZMxG903lmjme7Q06t6M=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <a98be4b4-82e6-d7be-6c6a-63ad0842a2c1@gmail.com>
References: <61620df7.1c69fb81.2f253.48daSMTPIN_ADDED_MISSING@mx.google.com> <a98be4b4-82e6-d7be-6c6a-63ad0842a2c1@gmail.com>
Subject: Re: [PATCH v4 1/3] media: ipu3-cio2: Toggle sensor streaming in pm runtime ops
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        jeanmichel.hautbois@ideasonboard.com
To:     Daniel Scally <djrscally@gmail.com>, linux-media@vger.kernel.org
Date:   Sat, 09 Oct 2021 23:35:45 +0100
Message-ID: <163381894500.1724220.6028301372991897003@Monstersaurus>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Daniel Scally (2021-10-09 23:18:00)
> Hi Kieran
>=20
> On 09/10/2021 22:47, Kieran Bingham wrote:
> > Hi Dan,
> >
> > Quoting Daniel Scally (2021-10-09 00:05:13)
> >> The .suspend() and .resume() runtime_pm operations for the ipu3-cio2
> >> driver currently do not handle the sensor's stream. Setting .s_stream(=
) on
> >> or off for the sensor subdev means that sensors will pause and resume =
the
> >> stream at the appropriate time even if their drivers don't implement t=
hose
> >> operations.
> >>
> >> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> >> ---
> >> Changes since v3:
> >>
> >>         - None
> >>
> >>  drivers/media/pci/intel/ipu3/ipu3-cio2-main.c | 15 ++++++++++++++-
> >>  1 file changed, 14 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/m=
edia/pci/intel/ipu3/ipu3-cio2-main.c
> >> index 47db0ee0fcbf..7bb86e246ebe 100644
> >> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> >> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> >> @@ -1973,12 +1973,19 @@ static int __maybe_unused cio2_suspend(struct =
device *dev)
> >>         struct pci_dev *pci_dev =3D to_pci_dev(dev);
> >>         struct cio2_device *cio2 =3D pci_get_drvdata(pci_dev);
> >>         struct cio2_queue *q =3D cio2->cur_queue;
> >> +       int r;
> >> =20
> >>         dev_dbg(dev, "cio2 suspend\n");
> >>         if (!cio2->streaming)
> >>                 return 0;
> >> =20
> >>         /* Stop stream */
> >> +       r =3D v4l2_subdev_call(q->sensor, video, s_stream, 0);
> >> +       if (r) {
> >> +               dev_err(dev, "failed to stop sensor streaming\n");
> >> +               return r;
> >> +       }
> >> +
> >>         cio2_hw_exit(cio2, q);
> >>         synchronize_irq(pci_dev->irq);
> >> =20
> >> @@ -2013,8 +2020,14 @@ static int __maybe_unused cio2_resume(struct de=
vice *dev)
> >>         }
> >> =20
> >>         r =3D cio2_hw_init(cio2, q);
> >> -       if (r)
> >> +       if (r) {
> >>                 dev_err(dev, "fail to init cio2 hw\n");
> >> +               return r;
> >> +       }
> >> +
> >> +       r =3D v4l2_subdev_call(q->sensor, video, s_stream, 1);
> >> +       if (r)
> > If this fails, do we need to do anything to undo the effects of
> > cio2_hw_init()?
>=20
> Ah - thank you yes, I think I should be calling cio2_hw_exit() there.
> I'll add that for v5.
> >
> > Should this always call s_stream, 1? Or should the streaming state be
> > stored during cio2_suspend, and that stored state value be set here?
> > I.e. we shouldn't necessarily call s_stream if it wasn't already
> > streaming?
>=20
>=20
> I think it's ok as is, on the grounds that in cio2_resume()=C2=A0 there's=
 a
> guard to do nothing if the cio2 isn't streaming:
>=20
>=20
> if (!cio2->streaming)
>=20
> =C2=A0=C2=A0=C2=A0 return 0;
>=20
>=20
> And in cio2_vb2_start_streaming() (which sets that cio2->streaming flag
> true) there's the same call to v4l2_subdev_call() to set s_stream(1) for
> the sensor. So I think the only time we can reach this point, the sensor
> is expected to be streaming.

Ahh, that's fine then, I didn't see beyond the context in the patch.

So with the cleanup on the cio2_hw_exit():

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

>=20
> >
> >> +               dev_err(dev, "fail to start sensor streaming\n");
> >> =20
> >>         return r;
> >>  }
> >> --=20
> >> 2.25.1
> >>
