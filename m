Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF2D35BCBDE
	for <lists+linux-media@lfdr.de>; Mon, 19 Sep 2022 14:34:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229819AbiISMeM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Sep 2022 08:34:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229942AbiISMeA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Sep 2022 08:34:00 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46CA72DA89
        for <linux-media@vger.kernel.org>; Mon, 19 Sep 2022 05:33:59 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id a10so820397ljq.0
        for <linux-media@vger.kernel.org>; Mon, 19 Sep 2022 05:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=XSpy2ORjSiTrqPXgwtf+2GKThTWQze4O+VRyLruhFjc=;
        b=aEq9+mE/beaz0aiXLm0As+/t/wGNhfg+Km4PNLgTJs6l4m7zRhct6lWDog6HQc0Dpt
         SSVI0c7uF0cu3jht3MWbU/2eo/qx3d0LpM99n1tt/1LWLNSPj+6FBYplryI4tYvQ1DZx
         H3C0KaGU+EI3QMNZ2LhXO/f5uluCK5AC2+IG2SXLzK/xM9QoPbqZfRJ4pXJLEGnazVLR
         LkajGYCC/At0XKWbYsnK4cC0G9wrIY+hUAGNyIzthFwbbql4hGTwj0+NmD1+Jc86fmqe
         BjEo7pl1EzIsp2C953J6e4WenPKCM6wOBvUCrLsrFJcCoYWzN7AMRTFPiygJsNnmwJbx
         fviw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=XSpy2ORjSiTrqPXgwtf+2GKThTWQze4O+VRyLruhFjc=;
        b=WoctZ9R8SulDADkGnth29XJYPBBeiecXH+MfNjDe6HuL7R0NT3yUj1qnnE1pAx60Dx
         06vtS8gbWbzlaTVKd4FIHUzTuD12rv6pay85dluBjY1CW2zWC/BL5CglqKUeAMCUF0HA
         4C1EjqUKtbIJb+GXEyFk5ExnVIz0/CTD/odCcYIA98egkdRRputxQPDUcg32sDe6G9+O
         0DsHqhFwI21SiMvTiYcIMhjgNUU84+iAoMHIMM4Ihay5+vsxy+lavGmoP7cmMI82Rgj5
         8OoniGyd8aEswTRLsVlrH5T7wVbCvR4OkKBf4dxFkm5wzvWhFcHpHmbpeqVp4hlnqnpm
         3IJw==
X-Gm-Message-State: ACrzQf0UCGAcuezrxp6AJP4p9tk03CoPFozHqU15yd2bXWRQAS5/g7lI
        s9QIw/6TAn4Y+lweG69kIGUrg0Z7WArBAAo9YPQ=
X-Google-Smtp-Source: AMsMyM6wWbWtS1df4sjbx6TdkvrpAB99a0t4pRhUdmMPC0vGI2qklF152H2CXbv8KCCHxcpZqFnNkpsiSJ+GRSTHQKY=
X-Received: by 2002:a2e:391b:0:b0:26a:c75c:ff6e with SMTP id
 g27-20020a2e391b000000b0026ac75cff6emr4860012lja.99.1663590837486; Mon, 19
 Sep 2022 05:33:57 -0700 (PDT)
MIME-Version: 1.0
References: <4386345.LvFx2qVVIh@tool> <YyhQu5UMoF/BDJCv@gofer.mess.org>
In-Reply-To: <YyhQu5UMoF/BDJCv@gofer.mess.org>
From:   =?UTF-8?Q?Daniel_Gonz=C3=A1lez_Cabanelas?= <dgcbueu@gmail.com>
Date:   Mon, 19 Sep 2022 14:33:45 +0200
Message-ID: <CABwr4_tQrE0xmCAM4A7W7K4Dpdr-TXZ_zMM-a6-5DWzhsfcMjw@mail.gmail.com>
Subject: Re: [PATCH v2] media: cx88: add IR remote support for NotOnlyTV LV3H
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sean,

some amount of delay is required or the loop won't be effective
enough. I made tests with delays up to 8 ms and they worked ok. The
precision isn't important, so msleep will work ok here.

Regards

Daniel

El lun, 19 sept 2022 a las 13:21, Sean Young (<sean@mess.org>) escribi=C3=
=B3:
>
> Hi Daniel,
>
> Sorry about the long delay for reviewing this. I missed this patch, sorry=
.
>
> On Mon, Feb 07, 2022 at 03:51:41PM +0100, Daniel Gonz=C3=A1lez Cabanelas =
wrote:
> > The PCI hybrid card NotOnlyTV LV3H has a built-in IR receiver connected
> > via I2C bus, currently not supported. This receiver is probably present
> > in more Geniatech cards. It has no capability for repeating when a key =
is
> > held down.
> >
> > Add support for this built-in IR receiver. Use the existing Total Media
> > In Hand_02 remote keytable (Geniatech Mygica X8507) which matches exact=
ly
> > the LV3H remote.
> >
> > Signed-off-by: Daniel Gonz=C3=A1lez Cabanelas <dgcbueu@gmail.com>
> > Signed-off-by: Marek Kidawski <mark_kiddy@wp.pl>
> > ---
> > changes in v2:
> >  - Save a bitwise operation when no key is pressed
> >  - Simplify the code
> >
> >  drivers/media/i2c/ir-kbd-i2c.c      | 47 +++++++++++++++++++++++++++++
> >  drivers/media/pci/cx88/cx88-input.c |  2 +-
> >  drivers/media/pci/cx88/cx88-video.c |  1 +
> >  include/media/i2c/ir-kbd-i2c.h      |  1 +
> >  4 files changed, 50 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/i2c/ir-kbd-i2c.c b/drivers/media/i2c/ir-kbd-=
i2c.c
> > index 566741735..145abfd13 100644
> > --- a/drivers/media/i2c/ir-kbd-i2c.c
> > +++ b/drivers/media/i2c/ir-kbd-i2c.c
> > @@ -238,6 +238,43 @@ static int get_key_knc1(struct IR_i2c *ir, enum rc=
_proto *protocol,
> >       return 1;
> >  }
> >
> > +static int get_key_geniatech(struct IR_i2c *ir, enum rc_proto *protoco=
l,
> > +                          u32 *scancode, u8 *toggle)
> > +{
> > +     int i, rc;
> > +     unsigned char b;
> > +
> > +     /* poll IR chip */
> > +     for (i =3D 0; i < 4; i++) {
> > +             rc =3D i2c_master_recv(ir->c, &b, 1);
> > +             if (rc =3D=3D 1)
> > +                     break;
> > +             msleep(1);
>
> checkpatch.pl rightfully points out the following:
>
> WARNING: msleep < 20ms can sleep for up to 20ms; see Documentation/timers=
/timers-howto.rst
>
> msleep(1) will sleep for at least 20ms. I think this is what you want her=
e;
> mdelay(1) might introduce busy-cycles every second, surely we do not what=
 to
> that.
>
> Is the sleep needed at all?
>
> Thanks
>
> Sean
>
>
> > +     }
> > +     if (rc !=3D 1) {
> > +             dev_dbg(&ir->rc->dev, "read error\n");
> > +             if (rc < 0)
> > +                     return rc;
> > +             return -EIO;
> > +     }
> > +
> > +     /* don't repeat the key */
> > +     if (ir->old =3D=3D b)
> > +             return 0;
> > +     ir->old =3D b;
> > +
> > +     /* decode to RC5 */
> > +     b &=3D 0x7f;
> > +     b =3D (b - 1) / 2;
> > +
> > +     dev_dbg(&ir->rc->dev, "key %02x\n", b);
> > +
> > +     *protocol =3D RC_PROTO_RC5;
> > +     *scancode =3D b;
> > +     *toggle =3D ir->old >> 7;
> > +     return 1;
> > +}
> > +
> >  static int get_key_avermedia_cardbus(struct IR_i2c *ir, enum rc_proto =
*protocol,
> >                                    u32 *scancode, u8 *toggle)
> >  {
> > @@ -766,6 +803,13 @@ static int ir_probe(struct i2c_client *client, con=
st struct i2c_device_id *id)
> >               rc_proto    =3D RC_PROTO_BIT_OTHER;
> >               ir_codes    =3D RC_MAP_EMPTY;
> >               break;
> > +     case 0x33:
> > +             name        =3D "Geniatech";
> > +             ir->get_key =3D get_key_geniatech;
> > +             rc_proto    =3D RC_PROTO_BIT_RC5;
> > +             ir_codes    =3D RC_MAP_TOTAL_MEDIA_IN_HAND_02;
> > +             ir->old     =3D 0xfc;
> > +             break;
> >       case 0x6b:
> >               name        =3D "FusionHDTV";
> >               ir->get_key =3D get_key_fusionhdtv;
> > @@ -825,6 +869,9 @@ static int ir_probe(struct i2c_client *client, cons=
t struct i2c_device_id *id)
> >               case IR_KBD_GET_KEY_KNC1:
> >                       ir->get_key =3D get_key_knc1;
> >                       break;
> > +             case IR_KBD_GET_KEY_GENIATECH:
> > +                     ir->get_key =3D get_key_geniatech;
> > +                     break;
> >               case IR_KBD_GET_KEY_FUSIONHDTV:
> >                       ir->get_key =3D get_key_fusionhdtv;
> >                       break;
> > diff --git a/drivers/media/pci/cx88/cx88-input.c b/drivers/media/pci/cx=
88/cx88-input.c
> > index ce0ef0b81..a04a1d33f 100644
> > --- a/drivers/media/pci/cx88/cx88-input.c
> > +++ b/drivers/media/pci/cx88/cx88-input.c
> > @@ -586,7 +586,7 @@ void cx88_i2c_init_ir(struct cx88_core *core)
> >  {
> >       struct i2c_board_info info;
> >       static const unsigned short default_addr_list[] =3D {
> > -             0x18, 0x6b, 0x71,
> > +             0x18, 0x33, 0x6b, 0x71,
> >               I2C_CLIENT_END
> >       };
> >       static const unsigned short pvr2000_addr_list[] =3D {
> > diff --git a/drivers/media/pci/cx88/cx88-video.c b/drivers/media/pci/cx=
88/cx88-video.c
> > index c17ad9f7d..4d78acf66 100644
> > --- a/drivers/media/pci/cx88/cx88-video.c
> > +++ b/drivers/media/pci/cx88/cx88-video.c
> > @@ -1388,6 +1388,7 @@ static int cx8800_initdev(struct pci_dev *pci_dev=
,
> >       }
> >               fallthrough;
> >       case CX88_BOARD_DVICO_FUSIONHDTV_5_PCI_NANO:
> > +     case CX88_BOARD_NOTONLYTV_LV3H:
> >               request_module("ir-kbd-i2c");
> >       }
> >
> > diff --git a/include/media/i2c/ir-kbd-i2c.h b/include/media/i2c/ir-kbd-=
i2c.h
> > index 9f47d6a48..0b58f8b9e 100644
> > --- a/include/media/i2c/ir-kbd-i2c.h
> > +++ b/include/media/i2c/ir-kbd-i2c.h
> > @@ -35,6 +35,7 @@ enum ir_kbd_get_key_fn {
> >       IR_KBD_GET_KEY_PIXELVIEW,
> >       IR_KBD_GET_KEY_HAUP,
> >       IR_KBD_GET_KEY_KNC1,
> > +     IR_KBD_GET_KEY_GENIATECH,
> >       IR_KBD_GET_KEY_FUSIONHDTV,
> >       IR_KBD_GET_KEY_HAUP_XVR,
> >       IR_KBD_GET_KEY_AVERMEDIA_CARDBUS,
> > --
> > 2.35.1
> >
> >
> >
