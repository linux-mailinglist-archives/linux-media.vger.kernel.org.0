Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0228A61864C
	for <lists+linux-media@lfdr.de>; Thu,  3 Nov 2022 18:38:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230526AbiKCRiN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Nov 2022 13:38:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230389AbiKCRiM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Nov 2022 13:38:12 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9DE111157
        for <linux-media@vger.kernel.org>; Thu,  3 Nov 2022 10:38:11 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D57C34E6;
        Thu,  3 Nov 2022 18:38:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1667497089;
        bh=WCzN37xKsj7+IwxmmPhk49EHq5eCG/wnEbbYI31J0pw=;
        h=In-Reply-To:References:Subject:From:To:Date:From;
        b=I98r5l6dy+KbRtT7X6IKLVmpSv+IZbxHLRqxQFAhxHJBN38/1eLEN7atbWAc3QHgH
         SGYwZqp5L2ldE6EwMia9jkF+pkSCpsWX2aJ0kZWfgDKNu7xU0oIKz7n9OBeSD6eM54
         NK+T2ePgEB5YRE+o7YxUt88mpMTrX9Ou4z4F/2vQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <166749647604.2442643.7043909994527288745@Monstersaurus>
References: <20221103111427.000061f5@arducam.com> <166749647604.2442643.7043909994527288745@Monstersaurus>
Subject: Re: [PATCH v2 2/2] media: i2c: Add driver for IMX519 sensor
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
To:     lee <lee@arducam.com>, linux-media@vger.kernel.org
Date:   Thu, 03 Nov 2022 17:38:07 +0000
Message-ID: <166749708713.2442643.7281365060109003063@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Kieran Bingham (2022-11-03 17:27:56)
> Hi Lee,
>=20
> Quoting lee (2022-11-03 03:14:27)
> > Adds a driver for the 16MPix IMX519 CSI2 sensor.
> > Whilst the sensor supports 2 or 4 CSI2 data lanes, this driver
> > currently only supports 2 lanes.
> >=20
> > The following Bayer modes are currently available:
> >=20
> > 4656x3496 10-bit @ 10fps
> > 3840x2160 10-bit (cropped) @ 21fps
> > 2328x1748 10-bit (binned) @ 30fps
> > 1920x1080 10-bit (cropped/binned) @ 60fps
> > 1280x720 10-bit (cropped/binned) @ 120fps
> >=20
> > Signed-off-by: Lee Jackson <lee@arducam.com>

<snip>

> > +static const struct v4l2_ctrl_ops imx519_ctrl_ops =3D {
> > +       .s_ctrl =3D imx519_set_ctrl,
> > +};
> > +
> > +static int imx519_enum_mbus_code(struct v4l2_subdev *sd,
> > +                                struct v4l2_subdev_state *sd_state,
> > +                                struct v4l2_subdev_mbus_code_enum *cod=
e)
> > +{
> > +       struct imx519 *imx519 =3D to_imx519(sd);
> > +
> > +       mutex_lock(&imx519->mutex);
> > +
> > +       if (code->index > 0)
> > +               return -EINVAL;

In fact, this code path returns keeping the lock held ...

I suspect this is the cause of the deadlocks I've seen...

> > +
> > +       code->code =3D imx519_get_format_code(imx519);
> > +
> > +       mutex_unlock(&imx519->mutex);
> > +
> > +       return 0;
> > +}
> > +
> > +static int imx519_enum_frame_size(struct v4l2_subdev *sd,
> > +                                 struct v4l2_subdev_state *sd_state,
> > +                                 struct v4l2_subdev_frame_size_enum *f=
se)
> > +{
> > +       struct imx519 *imx519 =3D to_imx519(sd);
> > +
> > +       mutex_lock(&imx519->mutex);
>=20
> I've hit a deadlock here.
>=20
> [  139.389907] other info that might help us debug this:
> [  139.396435]  Possible unsafe locking scenario:
> [  139.396435]
> [  139.402353]        CPU0
> [  139.404797]        ----
> [  139.407243]   lock(&imx519->mutex);
> [  139.410737]   lock(&imx519->mutex);
> [  139.414230]
> [  139.414230]  *** DEADLOCK ***
> [  139.414230]
> [  139.420148]  May be due to missing lock nesting notation
> [  139.420148]
> [  139.426936] 1 lock held by cam/924:
> [  139.430425]  #0: ffff000003feb460 (&imx519->mutex){+.+.}-{3:3}, at: im=
x519_enum_mbus_code+0x3

Which should have been obvious if I just read ^^^ that line ;-)

--
Kieran
