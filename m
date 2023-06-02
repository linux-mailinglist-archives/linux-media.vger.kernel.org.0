Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72420720833
	for <lists+linux-media@lfdr.de>; Fri,  2 Jun 2023 19:13:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236859AbjFBRNN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Jun 2023 13:13:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235544AbjFBRNM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Jun 2023 13:13:12 -0400
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com [IPv6:2607:f8b0:4864:20::e2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08D551A8
        for <linux-media@vger.kernel.org>; Fri,  2 Jun 2023 10:13:11 -0700 (PDT)
Received: by mail-vs1-xe2b.google.com with SMTP id ada2fe7eead31-43b2ab9297fso200619137.1
        for <linux-media@vger.kernel.org>; Fri, 02 Jun 2023 10:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1685725990; x=1688317990;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sgzsS75kXqE+x/nYYWZpPxfxzFW609nA7iNUZapD6uE=;
        b=VPo6y09JiUZLI6s9Pa4OpvcsN78s2ESpR+qy8OvlD/uEFadWfViSHNAghm2/fCxfbi
         2AnCuOHT+dLilEjQ8b8UV5K0gt3yxg4Ezhx7k/0jcnGoJ08dOwRigGnjJEAiwCf+oBa4
         A3/4/BQQfaHjlhtzJhZ8Y6YC0h7CMzvjlU2uSH0o1kd4/V5p74+sKmV+nnJH33IcDzIw
         AgF0hD1wVUhoJNVIK2rMIbK5GQDU1ST1FryjUkkDL3H0/0swtxBBV3qMAxI5/zEzXfHd
         u3c5QvQl6J6MojhEy63d0AFyi2E6DfMW7AW8aFqFIn2HNT53qfMT73g0TWGQbC8ocdgp
         r/Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685725990; x=1688317990;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sgzsS75kXqE+x/nYYWZpPxfxzFW609nA7iNUZapD6uE=;
        b=LWM2LJsutSeoeqB5A232rtbYRPSreAF1xGQCqxagg/3XszagQGB9Rlr5NhCAtapez+
         OhfUL+HsdvBzacRI/t/yXlakmMy/4jwi1SOTKe6MLaMAzHAvwoB342WhtJ46pFO6Hxpr
         bGve2rllhbHq/XfkeBHhct6zpzhVgChf7kRxp8xrmYcS93JtCADmwdaMHJ+jnamM+Vff
         Qpbo99muwH0FQb3TF289/K8pKfSaTyS6AzJk9St9b6WUqKfHu0DiHel2p83f/An/tIVj
         +ppgrrKt4byU34+DvDZan6mGJVRWz15DHph26M+rlWkT5DeLOxIvjd0wRM7b/BMGUL7n
         L9Aw==
X-Gm-Message-State: AC+VfDzqqTSr3Ha+yXsKDlu76FoP8cBS9U8LFpFTukEGgMSD3DEw3PYo
        ydLTq3/BfVRKkU3Dl49kYc6phkP1B0tJ0UeSacMdAmnSe52OTB41geA=
X-Google-Smtp-Source: ACHHUZ7+Ia0WDhjEIVIPHG/AhVa7C9CNFpMSUeDc/GoyyHSSmyOMLcfa0GwqtKlgFohitl5ZQkDB4QfePpR5cuarVuI=
X-Received: by 2002:a05:6102:409:b0:430:1fa:87c5 with SMTP id
 d9-20020a056102040900b0043001fa87c5mr4365097vsq.32.1685725990154; Fri, 02 Jun
 2023 10:13:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230530173000.3060865-1-dave.stevenson@raspberrypi.com>
 <20230530173000.3060865-15-dave.stevenson@raspberrypi.com> <i7epfbavk5z7imvlsecitwqcdhmu7yh6z25guu7utfes2e7yyz@l7iz5vrit7h7>
In-Reply-To: <i7epfbavk5z7imvlsecitwqcdhmu7yh6z25guu7utfes2e7yyz@l7iz5vrit7h7>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Fri, 2 Jun 2023 18:12:54 +0100
Message-ID: <CAPY8ntA33yeHgd-ZiC3Eew52_svUDDMegAo3_2Wwk=em5oToVg@mail.gmail.com>
Subject: Re: [PATCH 14/21] media: i2c: imx258: Add support for long exposure modes
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        Naushir Patuck <naush@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo

On Fri, 2 Jun 2023 at 14:38, Jacopo Mondi <jacopo.mondi@ideasonboard.com> wrote:
>
> Hi Dave
>
> On Tue, May 30, 2023 at 06:29:53PM +0100, Dave Stevenson wrote:
> > The sensor has a register CIT_LSHIFT which extends the exposure
> > and frame times by the specified power of 2 for longer
> > exposure times.
> >
> > Add support for this by configuring this register via V4L2_CID_VBLANK
> > and extending the V4L2_CID_EXPOSURE range accordingly.
> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > ---
> >  drivers/media/i2c/imx258.c | 38 ++++++++++++++++++++++++++++++++------
> >  1 file changed, 32 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
> > index f5199e3243e8..1e424058fcb9 100644
> > --- a/drivers/media/i2c/imx258.c
> > +++ b/drivers/media/i2c/imx258.c
> > @@ -69,6 +69,10 @@
> >  #define IMX258_HDR_RATIO_STEP                1
> >  #define IMX258_HDR_RATIO_DEFAULT     0x0
> >
> > +/* Long exposure multiplier */
> > +#define IMX258_LONG_EXP_SHIFT_MAX    7
> > +#define IMX258_LONG_EXP_SHIFT_REG    0x3002
> > +
> >  /* Test Pattern Control */
> >  #define IMX258_REG_TEST_PATTERN              0x0600
> >
> > @@ -629,6 +633,8 @@ struct imx258 {
> >       struct v4l2_ctrl *vblank;
> >       struct v4l2_ctrl *hblank;
> >       struct v4l2_ctrl *exposure;
> > +     /* Current long exposure factor in use. Set through V4L2_CID_VBLANK */
> > +     unsigned int long_exp_shift;
> >
> >       /* Current mode */
> >       const struct imx258_mode *cur_mode;
> > @@ -793,6 +799,26 @@ static void imx258_adjust_exposure_range(struct imx258 *imx258)
> >                                exposure_def);
> >  }
> >
> > +static int imx258_set_frame_length(struct imx258 *imx258, unsigned int val)
> > +{
> > +     int ret;
> > +
> > +     imx258->long_exp_shift = 0;
> > +
> > +     while (val > IMX258_VTS_MAX) {
> > +             imx258->long_exp_shift++;
> > +             val >>= 1;
> > +     }
> > +
> > +     ret = imx258_write_reg(imx258, IMX258_REG_VTS,
> > +                            IMX258_REG_VALUE_16BIT, val);
> > +     if (ret)
> > +             return ret;
> > +
> > +     return imx258_write_reg(imx258, IMX258_LONG_EXP_SHIFT_REG,
> > +                             IMX258_REG_VALUE_08BIT, imx258->long_exp_shift);
> > +}
> > +
> >  static int imx258_set_ctrl(struct v4l2_ctrl *ctrl)
> >  {
> >       struct imx258 *imx258 =
> > @@ -823,7 +849,7 @@ static int imx258_set_ctrl(struct v4l2_ctrl *ctrl)
> >       case V4L2_CID_EXPOSURE:
> >               ret = imx258_write_reg(imx258, IMX258_REG_EXPOSURE,
> >                               IMX258_REG_VALUE_16BIT,
> > -                             ctrl->val);
> > +                             ctrl->val >> imx258->long_exp_shift);
>
> Shouldn't this be done only if vblank > VTS_MAX ?

You're partly right, and it's a bug in our imx477 and imx708 drivers
too. (cc Naush for info)

Computing imx258->long_exp_shift should be done in the early part of
imx258_set_ctrl before the pm_runtime_get_if_in_use check. Otherwise
the __v4l2_ctrl_handler_setup call will potentially be setting
exposure before vblank, and exposure register will be based on the
wrong shift.
If (vblank + mode->height) <= VTS_MAX then long_exp_shift will be 0,
so the value written here will be the same.

The slightly more awkward one to handle is that if long_exp_shift
changes then we need to recompute and write IMX258_REG_EXPOSURE based
on the new shift. You have to love the niggles.

Thanks
  Dave

> >               break;
> >       case V4L2_CID_DIGITAL_GAIN:
> >               ret = imx258_update_digital_gain(imx258, IMX258_REG_VALUE_16BIT,
> > @@ -855,9 +881,8 @@ static int imx258_set_ctrl(struct v4l2_ctrl *ctrl)
> >               }
> >               break;
> >       case V4L2_CID_VBLANK:
> > -             ret = imx258_write_reg(imx258, IMX258_REG_VTS,
> > -                                    IMX258_REG_VALUE_16BIT,
> > -                                    imx258->cur_mode->height + ctrl->val);
> > +             ret = imx258_set_frame_length(imx258,
> > +                                           imx258->cur_mode->height + ctrl->val);
> >               break;
> >       default:
> >               dev_info(&client->dev,
> > @@ -983,8 +1008,9 @@ static int imx258_set_pad_format(struct v4l2_subdev *sd,
> >                            imx258->cur_mode->height;
> >               __v4l2_ctrl_modify_range(
> >                       imx258->vblank, vblank_min,
> > -                     IMX258_VTS_MAX - imx258->cur_mode->height, 1,
> > -                     vblank_def);
> > +                     ((1 << IMX258_LONG_EXP_SHIFT_MAX) * IMX258_VTS_MAX) -
> > +                                             imx258->cur_mode->height,
> > +                     1, vblank_def);
> >               __v4l2_ctrl_s_ctrl(imx258->vblank, vblank_def);
> >               h_blank =
> >                       imx258->link_freq_configs[mode->link_freq_index].pixels_per_line
> > --
> > 2.25.1
> >
