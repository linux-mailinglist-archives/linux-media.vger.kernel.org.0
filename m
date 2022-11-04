Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22D29619691
	for <lists+linux-media@lfdr.de>; Fri,  4 Nov 2022 13:52:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231968AbiKDMwM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Nov 2022 08:52:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231967AbiKDMwI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Nov 2022 08:52:08 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4FB6EE31
        for <linux-media@vger.kernel.org>; Fri,  4 Nov 2022 05:52:05 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 45EC9496;
        Fri,  4 Nov 2022 13:52:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1667566324;
        bh=iOGxc5yFgSbaUdFvFwJjSL54R1sc+x8R6ZF78PgOLz0=;
        h=In-Reply-To:References:Subject:From:To:Date:From;
        b=OyUZBSpFJK/yg0JKMgCJcXqHVHW51/yTYyfTrFBcXEQ+0BzN+hHlG40+UB3jLljxq
         iNBQLb3B3EMtIQMhF4/FG1ryccQfkrtShFaid6w/mrIDq/z4Ku/2aQCQXuqvQ4qM2q
         Ie+fGX4bhTcrkmLTZkhe0kB1DYKjWe7TKiyqSRzc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <166749647604.2442643.7043909994527288745@Monstersaurus>
References: <20221103111427.000061f5@arducam.com> <166749647604.2442643.7043909994527288745@Monstersaurus>
Subject: Re: [PATCH v2 2/2] media: i2c: Add driver for IMX519 sensor
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
To:     lee <lee@arducam.com>, linux-media@vger.kernel.org
Date:   Fri, 04 Nov 2022 12:52:01 +0000
Message-ID: <166756632179.3962897.9453952584484143218@Monstersaurus>
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
> > ---

Found another location with deadlock:


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
> 4/0x70
> [  139.439490]
> [  139.439490] stack backtrace:
> [  139.443847] CPU: 3 PID: 924 Comm: cam Not tainted 6.1.0-rc2-14364-g9c4=
7c8d45623 #41
> [  139.451505] Hardware name: Polyhex Debix Model A i.MX8MPlus board (DT)
> [  139.458033] Call trace:
> [  139.460479]  dump_backtrace+0xe4/0x140
> [  139.464234]  show_stack+0x20/0x50
> [  139.467555]  dump_stack_lvl+0x9c/0xd8
> [  139.471223]  dump_stack+0x18/0x34
> [  139.474544]  __lock_acquire+0x103c/0x1920
> [  139.478556]  lock_acquire.part.0+0xf0/0x26c
> [  139.482743]  lock_acquire+0x68/0x84
> [  139.486234]  __mutex_lock+0x8c/0x414
> [  139.489815]  mutex_lock_nested+0x34/0x40
> [  139.493741]  imx519_enum_frame_size+0x34/0xa4
> [  139.498101]  call_enum_frame_size_state+0x8c/0x130
> [  139.502895]  subdev_do_ioctl+0x910/0xdf0
> [  139.506823]  subdev_do_ioctl_lock+0x164/0x220
> [  139.511183]  video_usercopy+0x2ec/0x86c
> [  139.515021]  subdev_ioctl+0x20/0x30
> [  139.518512]  v4l2_ioctl+0x48/0x6c
> [  139.521835]  __arm64_sys_ioctl+0x44c/0xd70
> [  139.525936]  invoke_syscall.constprop.0+0x58/0xf0
> [  139.530645]  do_el0_svc+0x74/0x1a0
> [  139.534052]  el0_svc+0x54/0x124
> [  139.537198]  el0t_64_sync_handler+0xbc/0x13c
> [  139.541470]  el0t_64_sync+0x18c/0x190
>=20
>=20
> > +
> > +       if (fse->index >=3D ARRAY_SIZE(supported_modes_10bit))
> > +               return -EINVAL;

And both this

> > +
> > +       if (fse->code !=3D imx519_get_format_code(imx519))
> > +               return -EINVAL;

And this ...

Can leave the function with the mutex held locked forever...

--
Kieran


> > +
> > +       fse->min_width =3D supported_modes_10bit[fse->index].width;
> > +       fse->max_width =3D fse->min_width;
> > +       fse->min_height =3D supported_modes_10bit[fse->index].height;
> > +       fse->max_height =3D fse->min_height;
> > +
> > +       mutex_unlock(&imx519->mutex);
> > +
> > +       return 0;
> > +}

--
Kieran
