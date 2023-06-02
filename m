Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4D957204BF
	for <lists+linux-media@lfdr.de>; Fri,  2 Jun 2023 16:43:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236179AbjFBOnQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Jun 2023 10:43:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236173AbjFBOnO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Jun 2023 10:43:14 -0400
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com [IPv6:2607:f8b0:4864:20::e2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 257C5E46
        for <linux-media@vger.kernel.org>; Fri,  2 Jun 2023 07:43:09 -0700 (PDT)
Received: by mail-vs1-xe2c.google.com with SMTP id ada2fe7eead31-43b2c2947ceso86179137.3
        for <linux-media@vger.kernel.org>; Fri, 02 Jun 2023 07:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1685716988; x=1688308988;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q5DsGEeFIU7S2qjJFcRC07Q+PVvX0RwO1FEv6+zxQis=;
        b=gyd5HnsqBsfy9l5IbuHhhhqTkNxeqt7JDdlM1XsKX98cQAx85Ciy3GiE523QujH18q
         ufKpsHsiUOVlgxnIjSTDHJ8yYFLKB1yYzWrzEGc074c0n3w9m6R0qxymfEJv1Z/aFGmS
         JXqRi0CM87Av6zmGli6xInj9a9FBUc37pQRDCQZ2x4Rn90FwY4oGr6QZUd6Lln8QPERK
         hETQxFSZVhXkU/KEqmWG5iV/mJsrCO/s8ivRQLLZA9s3dmE4SF6DqM/cQ3uOjnLkznEJ
         nKTKFK+24xFJTB263/u19wOTEL9NTBqBm5Huqaht2w60Q5tcKnFxXW4CaAyKGLlWHi0I
         ai+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685716988; x=1688308988;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q5DsGEeFIU7S2qjJFcRC07Q+PVvX0RwO1FEv6+zxQis=;
        b=OOJ3RNqnRy+OLCbWKga8dROvXLFCj17/odwDhJsCLF1wgYK6S9HZUU+USUw/eJGjTf
         FLIWvxeg1pVRSPv8q8J/aw83fmrfxOMOfq5vnvteQFw8E3NsxU7tuTcKgYz4C9onbOHr
         hf26FxCQdl0YJ7XWkBVTE2UyFgyV+ZqFqBAqf2KTVq/4x+XfloVtKSMGoMfq8QogCYHp
         GTd6eBKJrc8YM5EHbqM+jnHgT9PNeiqefclRPQ08O3cRM9PduEHMDgsR/r4RJBmwI3EL
         L5aKnMKpARx3lpWT/+bHBacOS5dOqfAchEodtK7aguCmuroxYtyRwp2R59S9QhUXXl8J
         6PyQ==
X-Gm-Message-State: AC+VfDydK+JrGFjFX0IuqFU3DgT+jPq6VHsGHtmP5f2ypcm5jmQiXCs+
        w9Xrypma+94gt6W2qLs1CvhXIZM3BAKYczZScrv8PQ==
X-Google-Smtp-Source: ACHHUZ5BtAIg2gehTksnBUYzE534xIDy9zMGqI/tX7t3Q6vZwjyz8pLQnSfBm+JNxlaO66d0DHoAK8piHoH1qBruoVI=
X-Received: by 2002:a05:6102:3641:b0:439:3730:c524 with SMTP id
 s1-20020a056102364100b004393730c524mr3742804vsu.7.1685716987938; Fri, 02 Jun
 2023 07:43:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230530173000.3060865-1-dave.stevenson@raspberrypi.com>
 <20230530173000.3060865-22-dave.stevenson@raspberrypi.com> <bqz2iyucj3fzprzmouu5genmm4e4h33oeye5cng5bekaqen2t4@tjlftixka3oq>
In-Reply-To: <bqz2iyucj3fzprzmouu5genmm4e4h33oeye5cng5bekaqen2t4@tjlftixka3oq>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Fri, 2 Jun 2023 15:42:51 +0100
Message-ID: <CAPY8ntAc8FELe0rPpumK=5Spk9ixugKg-JzGq=Ak-+9A-wKFgw@mail.gmail.com>
Subject: Re: [PATCH 21/21] media: i2c: imx258: Make HFLIP and VFLIP controls writable
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
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

On Fri, 2 Jun 2023 at 14:58, Jacopo Mondi <jacopo.mondi@ideasonboard.com> wrote:
>
> Hi Dave
>
> On Tue, May 30, 2023 at 06:30:00PM +0100, Dave Stevenson wrote:
> > The sensor supports H & V flips, but the controls were READ_ONLY.
> >
> > Note that the Bayer order changes with these flips, therefore
> > they set the V4L2_CTRL_FLAG_MODIFY_LAYOUT property.
>
> Nice!
>
> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > ---
> >  drivers/media/i2c/imx258.c | 99 ++++++++++++++++++++++++--------------
> >  1 file changed, 64 insertions(+), 35 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
> > index 98b5c1e3abff..cf90ac66e14c 100644
> > --- a/drivers/media/i2c/imx258.c
> > +++ b/drivers/media/i2c/imx258.c
> > @@ -83,8 +83,8 @@
> >
> >  /* Orientation */
> >  #define REG_MIRROR_FLIP_CONTROL              0x0101
> > -#define REG_CONFIG_MIRROR_FLIP               0x03
> > -#define REG_CONFIG_FLIP_TEST_PATTERN 0x02
> > +#define REG_CONFIG_MIRROR_HFLIP              0x01
> > +#define REG_CONFIG_MIRROR_VFLIP              0x02
> >
> >  /* IMX258 native and active pixel array size. */
> >  #define IMX258_NATIVE_WIDTH          4224U
> > @@ -484,6 +484,23 @@ static const struct imx258_variant_cfg imx258_pdaf_cfg = {
> >       .num_regs = ARRAY_SIZE(imx258_pdaf_cfg_regs),
> >  };
> >
> > +/*
> > + * The supported formats.
> > + * This table MUST contain 4 entries per format, to cover the various flip
> > + * combinations in the order
> > + * - no flip
> > + * - h flip
> > + * - v flip
> > + * - h&v flips
> > + */
> > +static const u32 codes[] = {
> > +     /* 10-bit modes. */
> > +     MEDIA_BUS_FMT_SRGGB10_1X10,
> > +     MEDIA_BUS_FMT_SGRBG10_1X10,
> > +     MEDIA_BUS_FMT_SGBRG10_1X10,
> > +     MEDIA_BUS_FMT_SBGGR10_1X10
> > +};
> > +
> >  static const char * const imx258_test_pattern_menu[] = {
> >       "Disabled",
> >       "Solid Colour",
> > @@ -677,6 +694,8 @@ struct imx258 {
> >       struct v4l2_ctrl *vblank;
> >       struct v4l2_ctrl *hblank;
> >       struct v4l2_ctrl *exposure;
> > +     struct v4l2_ctrl *hflip;
> > +     struct v4l2_ctrl *vflip;
> >       /* Current long exposure factor in use. Set through V4L2_CID_VBLANK */
> >       unsigned int long_exp_shift;
> >
> > @@ -780,9 +799,22 @@ static int imx258_write_regs(struct imx258 *imx258,
> >       return 0;
> >  }
> >
> > +/* Get bayer order based on flip setting. */
> > +static u32 imx258_get_format_code(struct imx258 *imx258)
>
> can struct imx258 be const ?

It can

> > +{
> > +     unsigned int i;
> > +
> > +     lockdep_assert_held(&imx258->mutex);
> > +
> > +     i = (imx258->vflip->val ? 2 : 0) |
> > +         (imx258->hflip->val ? 1 : 0);
> > +
> > +     return codes[i];
> > +}
>
> An empty line wouldn't hurt

Done

> >  /* Open sub-device */
> >  static int imx258_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> >  {
> > +     struct imx258 *imx258 = to_imx258(sd);
> >       struct v4l2_mbus_framefmt *try_fmt =
> >               v4l2_subdev_get_try_format(sd, fh->state, 0);
> >       struct v4l2_rect *try_crop;
> > @@ -790,7 +822,7 @@ static int imx258_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> >       /* Initialize try_fmt */
> >       try_fmt->width = supported_modes[0].width;
> >       try_fmt->height = supported_modes[0].height;
> > -     try_fmt->code = MEDIA_BUS_FMT_SBGGR10_1X10;
> > +     try_fmt->code = imx258_get_format_code(imx258);
> >       try_fmt->field = V4L2_FIELD_NONE;
> >
> >       /* Initialize try_crop */
> > @@ -903,10 +935,6 @@ static int imx258_set_ctrl(struct v4l2_ctrl *ctrl)
> >               ret = imx258_write_reg(imx258, IMX258_REG_TEST_PATTERN,
> >                               IMX258_REG_VALUE_16BIT,
> >                               ctrl->val);
> > -             ret = imx258_write_reg(imx258, REG_MIRROR_FLIP_CONTROL,
> > -                             IMX258_REG_VALUE_08BIT,
> > -                             !ctrl->val ? REG_CONFIG_MIRROR_FLIP :
> > -                             REG_CONFIG_FLIP_TEST_PATTERN);
> >               break;
> >       case V4L2_CID_WIDE_DYNAMIC_RANGE:
> >               if (!ctrl->val) {
> > @@ -928,6 +956,15 @@ static int imx258_set_ctrl(struct v4l2_ctrl *ctrl)
> >               ret = imx258_set_frame_length(imx258,
> >                                             imx258->cur_mode->height + ctrl->val);
> >               break;
> > +     case V4L2_CID_VFLIP:
> > +     case V4L2_CID_HFLIP:
> > +             ret = imx258_write_reg(imx258, REG_MIRROR_FLIP_CONTROL,
> > +                                    IMX258_REG_VALUE_08BIT,
> > +                                    (imx258->hflip->val ?
> > +                                     REG_CONFIG_MIRROR_HFLIP : 0) |
> > +                                    (imx258->vflip->val ?
> > +                                     REG_CONFIG_MIRROR_VFLIP : 0));
> > +             break;
> >       default:
> >               dev_info(&client->dev,
> >                        "ctrl(id:0x%x,val:0x%x) is not handled\n",
> > @@ -949,11 +986,13 @@ static int imx258_enum_mbus_code(struct v4l2_subdev *sd,
> >                                 struct v4l2_subdev_state *sd_state,
> >                                 struct v4l2_subdev_mbus_code_enum *code)
> >  {
> > -     /* Only one bayer order(GRBG) is supported */
> > +     struct imx258 *imx258 = to_imx258(sd);
> > +
> > +     /* Only one bayer format (10 bit) is supported */
> >       if (code->index > 0)
> >               return -EINVAL;
> >
> > -     code->code = MEDIA_BUS_FMT_SBGGR10_1X10;
> > +     code->code = imx258_get_format_code(imx258);
> >
> >       return 0;
> >  }
> > @@ -962,10 +1001,11 @@ static int imx258_enum_frame_size(struct v4l2_subdev *sd,
> >                                 struct v4l2_subdev_state *sd_state,
> >                                 struct v4l2_subdev_frame_size_enum *fse)
> >  {
> > +     struct imx258 *imx258 = to_imx258(sd);
> >       if (fse->index >= ARRAY_SIZE(supported_modes))
> >               return -EINVAL;
> >
> > -     if (fse->code != MEDIA_BUS_FMT_SBGGR10_1X10)
> > +     if (fse->code != imx258_get_format_code(imx258))
> >               return -EINVAL;
> >
> >       fse->min_width = supported_modes[fse->index].width;
> > @@ -976,12 +1016,13 @@ static int imx258_enum_frame_size(struct v4l2_subdev *sd,
> >       return 0;
> >  }
> >
> > -static void imx258_update_pad_format(const struct imx258_mode *mode,
> > +static void imx258_update_pad_format(struct imx258 *imx258,
> > +                                  const struct imx258_mode *mode,
>
> Can't you get mode from imx258->cur_mode ?

It's called from imx258_set_pad_format for both SET and TRY, so needs
to be able to work on the new mode to be selected/tried as well as the
current mode.

> >                                    struct v4l2_subdev_format *fmt)
> >  {
> >       fmt->format.width = mode->width;
> >       fmt->format.height = mode->height;
> > -     fmt->format.code = MEDIA_BUS_FMT_SBGGR10_1X10;
> > +     fmt->format.code = imx258_get_format_code(imx258);
> >       fmt->format.field = V4L2_FIELD_NONE;
> >  }
> >
> > @@ -994,7 +1035,7 @@ static int __imx258_get_pad_format(struct imx258 *imx258,
> >                                                         sd_state,
> >                                                         fmt->pad);
> >       else
> > -             imx258_update_pad_format(imx258->cur_mode, fmt);
> > +             imx258_update_pad_format(imx258, imx258->cur_mode, fmt);
> >
> >       return 0;
> >  }
> > @@ -1030,13 +1071,12 @@ static int imx258_set_pad_format(struct v4l2_subdev *sd,
> >
> >       mutex_lock(&imx258->mutex);
> >
> > -     /* Only one raw bayer(GBRG) order is supported */
> > -     fmt->format.code = MEDIA_BUS_FMT_SBGGR10_1X10;
> > +     fmt->format.code = imx258_get_format_code(imx258);
> >
> >       mode = v4l2_find_nearest_size(supported_modes,
> >               ARRAY_SIZE(supported_modes), width, height,
> >               fmt->format.width, fmt->format.height);
> > -     imx258_update_pad_format(mode, fmt);
> > +     imx258_update_pad_format(imx258, mode, fmt);
> >       if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
> >               framefmt = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
> >               *framefmt = fmt->format;
> > @@ -1186,15 +1226,6 @@ static int imx258_start_streaming(struct imx258 *imx258)
> >               return ret;
> >       }
> >
> > -     /* Set Orientation be 180 degree */
> > -     ret = imx258_write_reg(imx258, REG_MIRROR_FLIP_CONTROL,
> > -                            IMX258_REG_VALUE_08BIT, REG_CONFIG_MIRROR_FLIP);
> > -     if (ret) {
> > -             dev_err(&client->dev, "%s failed to set orientation\n",
> > -                     __func__);
> > -             return ret;
> > -     }
> > -
> >       /* Apply customized values from user */
> >       ret =  __v4l2_ctrl_handler_setup(imx258->sd.ctrl_handler);
> >       if (ret)
> > @@ -1383,7 +1414,6 @@ static int imx258_init_controls(struct imx258 *imx258)
> >       struct i2c_client *client = v4l2_get_subdevdata(&imx258->sd);
> >       const struct imx258_link_freq_config *link_freq_cfgs;
> >       struct v4l2_fwnode_device_properties props;
> > -     struct v4l2_ctrl *vflip, *hflip;
> >       struct v4l2_ctrl_handler *ctrl_hdlr;
> >       const struct imx258_link_cfg *link_cfg;
> >       s64 vblank_def;
> > @@ -1408,16 +1438,15 @@ static int imx258_init_controls(struct imx258 *imx258)
> >       if (imx258->link_freq)
> >               imx258->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> >
> > -     /* The driver only supports one bayer order and flips by default. */
> > -     hflip = v4l2_ctrl_new_std(ctrl_hdlr, &imx258_ctrl_ops,
> > -                               V4L2_CID_HFLIP, 1, 1, 1, 1);
> > -     if (hflip)
> > -             hflip->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > +     imx258->hflip = v4l2_ctrl_new_std(ctrl_hdlr, &imx258_ctrl_ops,
> > +                                       V4L2_CID_HFLIP, 0, 1, 1, 1);
> > +     if (imx258->hflip)
> > +             imx258->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> >
> > -     vflip = v4l2_ctrl_new_std(ctrl_hdlr, &imx258_ctrl_ops,
> > -                               V4L2_CID_VFLIP, 1, 1, 1, 1);
> > -     if (vflip)
> > -             vflip->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > +     imx258->vflip = v4l2_ctrl_new_std(ctrl_hdlr, &imx258_ctrl_ops,
> > +                                       V4L2_CID_VFLIP, 0, 1, 1, 1);
> > +     if (imx258->vflip)
> > +             imx258->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
>
> if flips are now writable, should they be enabled by default ?

This is the potential debate.

An existing userspace app is using this driver and it renders as
desired. Merge this change and suddenly all their images are upside
down, and that's assuming they haven't hard coded the Bayer order
which has now changed due to correcting the cropping registers.
Some would say that is a regression.

I know you'd discussed it with Sakari, but wasn't totally clear on the
final decision. It's part of the reason why I had this as the final
patch, because then it's easy to drop whilst discussing it.

  Dave

> >
> >       link_freq_cfgs = &imx258->link_freq_configs[0];
> >       link_cfg = link_freq_cfgs[imx258->lane_mode_idx].link_cfg;
> > --
> > 2.25.1
> >
