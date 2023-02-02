Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8056D6885A7
	for <lists+linux-media@lfdr.de>; Thu,  2 Feb 2023 18:43:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232147AbjBBRnG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Feb 2023 12:43:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231695AbjBBRnD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Feb 2023 12:43:03 -0500
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com [IPv6:2607:f8b0:4864:20::e34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60095CA1F
        for <linux-media@vger.kernel.org>; Thu,  2 Feb 2023 09:43:01 -0800 (PST)
Received: by mail-vs1-xe34.google.com with SMTP id m1so788078vst.7
        for <linux-media@vger.kernel.org>; Thu, 02 Feb 2023 09:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PRH3FVpHvPgtURg+3Pg8e2vysYfB8800TBTcF/HXV+A=;
        b=jiqyPCv38kVmlk4PwAT599/22wXygip5oFbIccsf4ZAjh05LU7Xo25WZYyLHftpzB+
         W/m7kjScqh7D0XdFZZZ0/7gsJrWKRI5oYby2VctZeW6r8OSW0CFyNU4lyJDAjGMQ0/n3
         469eb+pWCKQQ3tr/6YWCvZE7uOnYz+GuaEQWg5yhdzTSjIylEEBvbjJzwI0IypQ7iXiS
         8jUxyxwPwA5m5HIELDxMe5PpOu/ZxMpV8P9rzkEcuJGfOqghMaR7oC5L8BKXpuKhYCQ1
         l8ACtSa4NPpMynOBWt85EJoMRxPG+q4UEUyMSuPs81irx83BZ0Ntn4uHr5yT+g+iOIXC
         RPNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PRH3FVpHvPgtURg+3Pg8e2vysYfB8800TBTcF/HXV+A=;
        b=zi8o2cj1k9/0nt2CUVAjlbAYQX6hS9XlUv3zoJLJxnay6RaZqiskeaQiOrW6ARoxXX
         FLRJPx+1w9iORzu4M3pcAA7643n6ps62bptiIYqbryfSwrrc+Kkg5xo2hsz1Gv6DaHea
         J5gMFvGp5L5mUqVncQc2YjWndtqeXpvi8dVYQ0yQn7QJxCCXS4v5qplqxHgPB+prnJKG
         z5nupWfnmU8MOw5+Tke0HPB24tCvx3puWRw3TrwtFN/1bGqloZJRSJ6jzVydzjmCA9a2
         bGwBK1JlhCIxv+qGuxxfx3M67VspP6JYLBDJiP08wsjUzIW0xN1KvFY37RGJ5KdWw597
         WCpQ==
X-Gm-Message-State: AO0yUKW6zC8NOOGZviFH6DtRnAFqZ2etXFQnOxPr2Gean6H1psC6k6vB
        tAiy6NFtaJGfHQi+z+0RTTP4BOIbHm6Hy7UN6WU6Xw==
X-Google-Smtp-Source: AK7set/QkpqyhlU5wzquDeLhWXtkxw2LgUIHaA5Ejzr9qOtj28ts+F+PP0/Tzvb1pHfltC7hwE14e0jqpE1by07LHDQ=
X-Received: by 2002:a67:ef41:0:b0:3f2:edef:718f with SMTP id
 k1-20020a67ef41000000b003f2edef718fmr1246160vsr.28.1675359780353; Thu, 02 Feb
 2023 09:43:00 -0800 (PST)
MIME-Version: 1.0
References: <20230131192016.3476937-1-dave.stevenson@raspberrypi.com>
 <20230131192016.3476937-9-dave.stevenson@raspberrypi.com> <8178322.T7Z3S40VBb@steina-w>
 <CAPY8ntBu9tbOm=2BvMBWDF1rFA=ARHfnSZCEyApn2dabTZ=nug@mail.gmail.com>
In-Reply-To: <CAPY8ntBu9tbOm=2BvMBWDF1rFA=ARHfnSZCEyApn2dabTZ=nug@mail.gmail.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Thu, 2 Feb 2023 17:42:43 +0000
Message-ID: <CAPY8ntCsXk83+tpjEpRVU8g8x=6x3_7F4v56L0SmWxZCib=zkQ@mail.gmail.com>
Subject: Re: [PATCH 08/11] media: i2c: imx290: Convert V4L2_CID_VBLANK to read/write
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 2 Feb 2023 at 16:04, Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> Hi Alexander
>
> On Thu, 2 Feb 2023 at 15:40, Alexander Stein
> <alexander.stein@ew.tq-group.com> wrote:
> >
> > Hi Dave,
> >
> > thanks for working on this.
> >
> > Am Dienstag, 31. Januar 2023, 20:20:13 CET schrieb Dave Stevenson:
> > > The driver exposed V4L2_CID_HBLANK as a read only control to allow
> > > for exposure calculations and determination of the frame rate.
> > >
> > > Convert to a read/write control so that the frame rate can be
> > > controlled.
> > > V4L2_CID_VBLANK also sets the limits for the exposure control,
> > > therefore exposure ranges have to be updated when vblank changes.
> > >
> > > This also updates the default VMAX in 720p mode from 1125 to
> > > 750 to achieve 60fps and follow the datasheet.
> > >
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > ---
> > >  drivers/media/i2c/imx290.c | 57 ++++++++++++++++++++++++++++++--------
> > >  1 file changed, 45 insertions(+), 12 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > > index 9006be6e5e7c..3413d83369ba 100644
> > > --- a/drivers/media/i2c/imx290.c
> > > +++ b/drivers/media/i2c/imx290.c
> > > @@ -46,6 +46,7 @@
> > >  #define IMX290_BLKLEVEL
> > IMX290_REG_16BIT(0x300a)
> > >  #define IMX290_GAIN
> > IMX290_REG_8BIT(0x3014)
> > >  #define IMX290_VMAX
> > IMX290_REG_24BIT(0x3018)
> > > +#define IMX290_VMAX_MAX                                      0x3ffff
> > >  #define IMX290_HMAX
> > IMX290_REG_16BIT(0x301c)
> > >  #define IMX290_HMAX_MAX                                      0xffff
> > >  #define IMX290_SHS1
> > IMX290_REG_24BIT(0x3020)
> > > @@ -106,8 +107,6 @@
> > >  #define IMX290_PGCTRL_THRU                           BIT(1)
> > >  #define IMX290_PGCTRL_MODE(n)                                ((n) <<
> > 4)
> > >
> > > -#define IMX290_VMAX_DEFAULT                          1125
> > > -
> > >  #define IMX290_PIXEL_RATE                            148500000
> > >  /*
> > >   * The IMX290 pixel array is organized as follows:
> > > @@ -169,6 +168,7 @@ struct imx290_mode {
> > >       u32 width;
> > >       u32 height;
> > >       u32 hmax_min;
> > > +     u32 vmax_min;
> > >       u8 link_freq_index;
> > >
> > >       const struct imx290_regval *data;
> > > @@ -206,6 +206,7 @@ struct imx290 {
> > >       struct v4l2_ctrl *link_freq;
> > >       struct v4l2_ctrl *hblank;
> > >       struct v4l2_ctrl *vblank;
> > > +     struct v4l2_ctrl *exposure;
> > >  };
> > >
> > >  static inline struct imx290 *to_imx290(struct v4l2_subdev *_sd)
> > > @@ -219,7 +220,6 @@ static inline struct imx290 *to_imx290(struct
> > > v4l2_subdev *_sd)
> > >
> > >  static const struct imx290_regval imx290_global_init_settings[] = {
> > >       { IMX290_CTRL_07, IMX290_WINMODE_1080P },
> > > -     { IMX290_VMAX, IMX290_VMAX_DEFAULT },
> > >       { IMX290_EXTCK_FREQ, 0x2520 },
> > >       { IMX290_WINWV_OB, 12 },
> > >       { IMX290_WINPH, 0 },
> > > @@ -412,6 +412,7 @@ static const struct imx290_mode imx290_modes_2lanes[] =
> > > { .width = 1920,
> > >               .height = 1080,
> > >               .hmax_min = 2200,
> > > +             .vmax_min = 1125,
> > >               .link_freq_index = FREQ_INDEX_1080P,
> > >               .data = imx290_1080p_settings,
> > >               .data_size = ARRAY_SIZE(imx290_1080p_settings),
> > > @@ -420,6 +421,7 @@ static const struct imx290_mode imx290_modes_2lanes[] =
> > > { .width = 1280,
> > >               .height = 720,
> > >               .hmax_min = 3300,
> > > +             .vmax_min = 750,
> > >               .link_freq_index = FREQ_INDEX_720P,
> > >               .data = imx290_720p_settings,
> > >               .data_size = ARRAY_SIZE(imx290_720p_settings),
> > > @@ -431,6 +433,7 @@ static const struct imx290_mode imx290_modes_4lanes[] =
> > > { .width = 1920,
> > >               .height = 1080,
> > >               .hmax_min = 2200,
> > > +             .vmax_min = 1125,
> > >               .link_freq_index = FREQ_INDEX_1080P,
> > >               .data = imx290_1080p_settings,
> > >               .data_size = ARRAY_SIZE(imx290_1080p_settings),
> > > @@ -439,6 +442,7 @@ static const struct imx290_mode imx290_modes_4lanes[] =
> > > { .width = 1280,
> > >               .height = 720,
> > >               .hmax_min = 3300,
> > > +             .vmax_min = 750,
> > >               .link_freq_index = FREQ_INDEX_720P,
> > >               .data = imx290_720p_settings,
> > >               .data_size = ARRAY_SIZE(imx290_720p_settings),
> > > @@ -645,7 +649,7 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
> > >                                            struct imx290, ctrls);
> > >       const struct v4l2_mbus_framefmt *format;
> > >       struct v4l2_subdev_state *state;
> > > -     int ret = 0;
> > > +     int ret = 0, vmax;
> > >
> > >       /*
> > >        * Return immediately for controls that don't need to be applied to
> > the
> > > @@ -654,6 +658,18 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
> > >       if (ctrl->flags & V4L2_CTRL_FLAG_READ_ONLY)
> > >               return 0;
> > >
> > > +     if (ctrl->id == V4L2_CID_VBLANK) {
> > > +             u32 vmax = ctrl->val + imx290->current_mode->height;
> > > +
> > > +             /*
> > > +              * Changing vblank changes the allowed range for exposure.
> > > +              * We don't supply the current exposure as default here as
> > it
> > > +              * may lie outside the new range. We will reset it just
> > below.
> > > +              */
> > > +             __v4l2_ctrl_modify_range(imx290->exposure,
> > > +                                      1, vmax - 2, 1, vmax - 2);
> > > +     }
> > > +
> > >       /* V4L2 controls values will be applied only when power is already
> > up */
> > >       if (!pm_runtime_get_if_in_use(imx290->dev))
> > >               return 0;
> > > @@ -666,9 +682,23 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
> > >               ret = imx290_write(imx290, IMX290_GAIN, ctrl->val, NULL);
> > >               break;
> > >
> > > +     case V4L2_CID_VBLANK:
> > > +             ret = imx290_write(imx290, IMX290_VMAX,
> > > +                                ctrl->val + imx290->current_mode-
> > >height,
> > > +                                NULL);
> > > +             /*
> > > +              * Due to the way that exposure is programmed in this
> > sensor in
> > > +              * relation to VMAX, we have to reprogramme it whenever
> > VMAX is
> > > +              * changed.
> > > +              * Update ctrl so that the V4L2_CID_EXPOSURE case can
> > refer to
> > > +              * it.
> > > +              */
> > > +             ctrl = imx290->exposure;
> > > +             fallthrough;
> > >       case V4L2_CID_EXPOSURE:
> > > +             vmax = imx290->vblank->val + imx290->current_mode->height;
> > >               ret = imx290_write(imx290, IMX290_SHS1,
> > > -                                IMX290_VMAX_DEFAULT - ctrl->val -
> > 1, NULL);
> > > +                                vmax - ctrl->val - 1, NULL);
> > >               break;
> > >
> > >       case V4L2_CID_TEST_PATTERN:
> > > @@ -725,13 +755,15 @@ static void imx290_ctrl_update(struct imx290 *imx290,
> > >  {
> > >       unsigned int hblank_min = mode->hmax_min - mode->width;
> > >       unsigned int hblank_max = IMX290_HMAX_MAX - mode->width;
> > > -     unsigned int vblank = IMX290_VMAX_DEFAULT - mode->height;
> > > +     unsigned int vblank_min = mode->vmax_min - mode->height;
> > > +     unsigned int vblank_max = IMX290_VMAX_MAX - mode->height;
> > >
> > >       __v4l2_ctrl_s_ctrl(imx290->link_freq, mode->link_freq_index);
> > >
> > >       __v4l2_ctrl_modify_range(imx290->hblank, hblank_min, hblank_max, 1,
> > >                                hblank_min);
> > > -     __v4l2_ctrl_modify_range(imx290->vblank, vblank, vblank, 1, vblank);
> > > +     __v4l2_ctrl_modify_range(imx290->vblank, vblank_min, vblank_max, 1,
> > > +                              vblank_min);
> >
> > You are missing setting the range for V4L2_CID_EXPOSURE. So it stays at 1
> > resulting in a black image.
>
> You're right.
> I'm always testing with libcamera which will set V4L2_CID_VBLANK to
> configure the frame rate, and that will update the exposure range.

Actually I'm going to backtrack somewhat, although I may have
misunderstood your comment.

imx290_subdev_init calls imx290_ctrl_update. VBLANK was created with
min/max/def all set to 1. The update sets a range of 45 to 261063, so
the old value is now invalid and the new default is adopted. That
means set_ctrl is called for VBLANK, and that triggers the exposure
range to be updated. There is no need to update the exposure range in
imx290_ctrl_update on that basis.
It is missed when changing mode as the current VBLANK value is still
within range, therefore it doesn't need to change, and doesn't update
the exposure range. I'll fix that.


Are you relying on the initial exposure to be some particular value?
Is the initial value for any setting actually guaranteed in the spec?
If your application is expecting max exposure by default, then that
sounds very fragile and not portable to other sensors, but it can be
fixed up.

Do note that switching to 1280x720 mode will limit the exposure range
to 1-763. Switching back to 1920x1080 mode will increase the range
again, but as the current value is still in range the exposure setting
will not be changed. What controls get reset when changing mode is
undefined, but AIUI it should update the ranges and leave everything
else alone, which is what is done here. Some drivers pepper
v4l2_ctrl_s_ctrl calls around the place, but what value to adopt seems
random.

  Dave

>   Dave
>
> > Best regards,
> > Alexander
> >
> > >  }
> > >
> > >  static int imx290_ctrl_init(struct imx290 *imx290)
> > > @@ -761,9 +793,12 @@ static int imx290_ctrl_init(struct imx290 *imx290)
> > >       v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
> > >                         V4L2_CID_ANALOGUE_GAIN, 0, 100, 1, 0);
> > >
> > > -     v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
> > > -                       V4L2_CID_EXPOSURE, 1, IMX290_VMAX_DEFAULT - 2,
> > 1,
> > > -                       IMX290_VMAX_DEFAULT - 2);
> > > +     /*
> > > +      * Correct range will be determined through imx290_ctrl_update
> > setting
> > > +      * V4L2_CID_VBLANK.
> > > +      */
> > > +     imx290->exposure = v4l2_ctrl_new_std(&imx290->ctrls,
> > &imx290_ctrl_ops,
> > > +                                          V4L2_CID_EXPOSURE, 1,
> > 1, 1, 1);
> > >
> > >       /*
> > >        * Set the link frequency, pixel rate, horizontal blanking and
> > vertical
> > > @@ -795,8 +830,6 @@ static int imx290_ctrl_init(struct imx290 *imx290)
> > >
> > >       imx290->vblank = v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
> > >                                          V4L2_CID_VBLANK, 1, 1, 1,
> > 1);
> > > -     if (imx290->vblank)
> > > -             imx290->vblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > >
> > >       v4l2_ctrl_new_fwnode_properties(&imx290->ctrls, &imx290_ctrl_ops,
> > >                                       &props);
> >
> >
> >
> >
