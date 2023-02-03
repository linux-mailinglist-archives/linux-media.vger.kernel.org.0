Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82A3068927B
	for <lists+linux-media@lfdr.de>; Fri,  3 Feb 2023 09:40:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232391AbjBCIjt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Feb 2023 03:39:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230180AbjBCIjs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Feb 2023 03:39:48 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06F6268AC8
        for <linux-media@vger.kernel.org>; Fri,  3 Feb 2023 00:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1675413586; x=1706949586;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=imIDuyPUhDoLuIPs1Hgw9A5ODqz5TbpcdTbcfCXRcQc=;
  b=PH8/KNboEXH0J66lkGetz+CrhsVA9DIBytaIxkyeIL55Xq2tK8Flh1Tx
   DN9UK66/tQ/AQhuG0qqzFcB5bAcBBvzC1o17uQj6pbWvL1pfGWTB5ao9B
   oa5erBmLicvKbXxAXR3vzSFjl2cyMfpXi/5HY12ZGY+fn6FWicE7qJeHP
   UIeZxWGmkmQ17qgA06/1WlDJRHjC7SjPYRM4HCg+NOXG3FnpKntsxBnDh
   I2uzRoh3idPnP3hOrBYO3tRfMeG+1iKma0Olf/GJvsXxYQ25wwXbjf3JJ
   ksfcpK9lC6jmk1rUOD01Z1whoH8dIBw5fGSO0L73td9gt6PLmN3jwkknC
   A==;
X-IronPort-AV: E=Sophos;i="5.97,269,1669071600"; 
   d="scan'208";a="28847846"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 03 Feb 2023 09:39:44 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 03 Feb 2023 09:39:44 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 03 Feb 2023 09:39:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1675413584; x=1706949584;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=imIDuyPUhDoLuIPs1Hgw9A5ODqz5TbpcdTbcfCXRcQc=;
  b=WSDonefT0dwFn2lpsPO+PQQNnpth1q1yCD2h6+qSzKSwideuvJs8aR8T
   IM+VR2mjJxHvScya1DoHQNKTiQqkyIt7VVQyhKISZ/8G8JYPkx0ouPcnp
   DuW7E7DHwoDC4Pcz9AS2V4pPXgefKAzq3qeB/UU7OHQHHO+jMEVOh6lb3
   vrJwUiOnBmcUXUR4+21eBVkoRUdhOWkpXke5oAOaR4rtlRxjPIhWa/jWj
   DbgxfqNrxq3LMgGYE7RvwHvB1ZML21U8wOnGJpgd2YjOfhctLnaKKwtI1
   h7I4PASqqPOW+n2nax/5j0QP2YMqtAcWwbLxFm/sR9j0vWJLokSCtY/Fi
   w==;
X-IronPort-AV: E=Sophos;i="5.97,269,1669071600"; 
   d="scan'208";a="28847845"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 03 Feb 2023 09:39:43 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id AAB76280056;
        Fri,  3 Feb 2023 09:39:43 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 07/11] media: i2c: imx290: Convert V4L2_CID_HBLANK to read/write
Date:   Fri, 03 Feb 2023 09:39:43 +0100
Message-ID: <2595382.k3LOHGUjKi@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <CAPY8ntD=L1Mj7yyBfuX0JtTeiL2pTiZ9nd0QCbCC6zDv96EDZg@mail.gmail.com>
References: <20230131192016.3476937-1-dave.stevenson@raspberrypi.com> <8218660.NyiUUSuA9g@steina-w> <CAPY8ntD=L1Mj7yyBfuX0JtTeiL2pTiZ9nd0QCbCC6zDv96EDZg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

Am Freitag, 3. Februar 2023, 09:05:44 CET schrieb Dave Stevenson:
> Hi Alexander
> 
> On Fri, 3 Feb 2023 at 07:19, Alexander Stein
> 
> <alexander.stein@ew.tq-group.com> wrote:
> > Hi Dave,
> > 
> > thanks for the patch.
> > 
> > Am Dienstag, 31. Januar 2023, 20:20:12 CET schrieb Dave Stevenson:
> > > The driver exposed V4L2_CID_HBLANK as a read only control to allow
> > > for exposure calculations and determination of the frame rate.
> > > 
> > > Convert to a read/write control so that the frame rate can be
> > > controlled.
> > > 
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > ---
> > > 
> > >  drivers/media/i2c/imx290.c | 33 +++++++++++++++++++--------------
> > >  1 file changed, 19 insertions(+), 14 deletions(-)
> > > 
> > > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > > index 9ddd6382b127..9006be6e5e7c 100644
> > > --- a/drivers/media/i2c/imx290.c
> > > +++ b/drivers/media/i2c/imx290.c
> > > @@ -47,6 +47,7 @@
> > > 
> > >  #define IMX290_GAIN
> > 
> > IMX290_REG_8BIT(0x3014)
> > 
> > >  #define IMX290_VMAX
> > 
> > IMX290_REG_24BIT(0x3018)
> > 
> > >  #define IMX290_HMAX
> > 
> > IMX290_REG_16BIT(0x301c)
> > 
> > > +#define IMX290_HMAX_MAX                                      0xffff
> > > 
> > >  #define IMX290_SHS1
> > 
> > IMX290_REG_24BIT(0x3020)
> > 
> > >  #define IMX290_WINWV_OB
> > 
> > IMX290_REG_8BIT(0x303a)
> > 
> > >  #define IMX290_WINPV
> > 
> > IMX290_REG_16BIT(0x303c)
> > 
> > > @@ -167,7 +168,7 @@ struct imx290_regval {
> > > 
> > >  struct imx290_mode {
> > >  
> > >       u32 width;
> > >       u32 height;
> > > 
> > > -     u32 hmax;
> > > +     u32 hmax_min;
> > > 
> > >       u8 link_freq_index;
> > >       
> > >       const struct imx290_regval *data;
> > > 
> > > @@ -410,7 +411,7 @@ static const struct imx290_mode
> > > imx290_modes_2lanes[] =
> > > { {
> > > 
> > >               .width = 1920,
> > >               .height = 1080,
> > > 
> > > -             .hmax = 2200,
> > > +             .hmax_min = 2200,
> > > 
> > >               .link_freq_index = FREQ_INDEX_1080P,
> > >               .data = imx290_1080p_settings,
> > >               .data_size = ARRAY_SIZE(imx290_1080p_settings),
> > > 
> > > @@ -418,7 +419,7 @@ static const struct imx290_mode
> > > imx290_modes_2lanes[] =
> > > { {
> > > 
> > >               .width = 1280,
> > >               .height = 720,
> > > 
> > > -             .hmax = 3300,
> > > +             .hmax_min = 3300,
> > > 
> > >               .link_freq_index = FREQ_INDEX_720P,
> > >               .data = imx290_720p_settings,
> > >               .data_size = ARRAY_SIZE(imx290_720p_settings),
> > > 
> > > @@ -429,7 +430,7 @@ static const struct imx290_mode
> > > imx290_modes_4lanes[] =
> > > { {
> > > 
> > >               .width = 1920,
> > >               .height = 1080,
> > > 
> > > -             .hmax = 2200,
> > > +             .hmax_min = 2200,
> > > 
> > >               .link_freq_index = FREQ_INDEX_1080P,
> > >               .data = imx290_1080p_settings,
> > >               .data_size = ARRAY_SIZE(imx290_1080p_settings),
> > > 
> > > @@ -437,7 +438,7 @@ static const struct imx290_mode
> > > imx290_modes_4lanes[] =
> > > { {
> > > 
> > >               .width = 1280,
> > >               .height = 720,
> > > 
> > > -             .hmax = 3300,
> > > +             .hmax_min = 3300,
> > > 
> > >               .link_freq_index = FREQ_INDEX_720P,
> > >               .data = imx290_720p_settings,
> > >               .data_size = ARRAY_SIZE(imx290_720p_settings),
> > > 
> > > @@ -686,6 +687,12 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
> > 
> > You will need to remove V4L2_CID_HBLANK on the immediately return check at
> > the beginning of the function. Otherwise this setting will never reach
> > the device.
> What tree are you adding these patches to? I'm basing it on Sakari's
> tree at [1] - he's issued a pull for it, so that should be in 6.3.

Thanks for pointing this out. I'm based on linux-next as I need other patches 
for platform support. I've had Laurent's patches included, but only v2 :( my 
bad. With v3 included instead this seems to work.

> The only immediate return check at the start of imx290_set_ctrl is
> if (ctrl->flags & V4L2_CTRL_FLAG_READ_ONLY)
>    return 0;
> 
> The controls are no longer READ_ONLY, therefore they don't return early.
> There is no case for V4L2_CID_HBLANK.
> 
> Does this also account for the difference you're reporting with
> V4L2_CID_VBLANK?

Yes, things look good so far. Thanks

Best regards,
Alexander

> [1]
> https://git.linuxtv.org/sailus/media_tree.git/tree/drivers/media/i2c/imx290
> .c#n567
> > Best regards
> > Alexander
> > 
> > >               }
> > >               break;
> > > 
> > > +     case V4L2_CID_HBLANK:
> > > +             ret = imx290_write(imx290, IMX290_HMAX,
> > > +                                ctrl->val + imx290->current_mode-
> > >
> > >width,
> > >
> > > +                                NULL);
> > > +             break;
> > > +
> > > 
> > >       default:
> > >               ret = -EINVAL;
> > >               break;
> > > 
> > > @@ -716,12 +723,14 @@ static void imx290_ctrl_update(struct imx290
> > > *imx290,
> > > 
> > >                              const struct v4l2_mbus_framefmt *format,
> > >                              const struct imx290_mode *mode)
> > >  
> > >  {
> > > 
> > > -     unsigned int hblank = mode->hmax - mode->width;
> > > +     unsigned int hblank_min = mode->hmax_min - mode->width;
> > > +     unsigned int hblank_max = IMX290_HMAX_MAX - mode->width;
> > > 
> > >       unsigned int vblank = IMX290_VMAX_DEFAULT - mode->height;
> > >       
> > >       __v4l2_ctrl_s_ctrl(imx290->link_freq, mode->link_freq_index);
> > > 
> > > -     __v4l2_ctrl_modify_range(imx290->hblank, hblank, hblank, 1,
> > > hblank);
> > > +     __v4l2_ctrl_modify_range(imx290->hblank, hblank_min, hblank_max,
> > > 1,
> > > +                              hblank_min);
> > > 
> > >       __v4l2_ctrl_modify_range(imx290->vblank, vblank, vblank, 1,
> > >       vblank);
> > >  
> > >  }
> > > 
> > > @@ -778,10 +787,11 @@ static int imx290_ctrl_init(struct imx290 *imx290)
> > 
> > ARRAY_SIZE(imx290_test_pattern_menu) - 1,
> > 
> > >                                    0, 0, imx290_test_pattern_menu);
> > > 
> > > +     /*
> > > +      * Actual range will be set from imx290_ctrl_update later in the
> > 
> > probe.
> > 
> > > +      */
> > > 
> > >       imx290->hblank = v4l2_ctrl_new_std(&imx290->ctrls,
> > >       &imx290_ctrl_ops,
> > >       
> > >                                          V4L2_CID_HBLANK, 1, 1, 1,
> > 
> > 1);
> > 
> > > -     if (imx290->hblank)
> > > -             imx290->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > > 
> > >       imx290->vblank = v4l2_ctrl_new_std(&imx290->ctrls,
> > >       &imx290_ctrl_ops,
> > >       
> > >                                          V4L2_CID_VBLANK, 1, 1, 1,
> > 
> > 1);
> > 
> > > @@ -850,11 +860,6 @@ static int imx290_start_streaming(struct imx290
> > > *imx290, return ret;
> > > 
> > >       }
> > > 
> > > -     ret = imx290_write(imx290, IMX290_HMAX,
> > > imx290->current_mode->hmax,
> > > -                        NULL);
> > > -     if (ret)
> > > -             return ret;
> > > -
> > > 
> > >       /* Apply customized values from user */
> > >       ret = __v4l2_ctrl_handler_setup(imx290->sd.ctrl_handler);
> > >       if (ret) {




