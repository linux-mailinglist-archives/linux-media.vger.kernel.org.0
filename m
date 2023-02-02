Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93831688311
	for <lists+linux-media@lfdr.de>; Thu,  2 Feb 2023 16:49:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233181AbjBBPtl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Feb 2023 10:49:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbjBBPtV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Feb 2023 10:49:21 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A683B7376B
        for <linux-media@vger.kernel.org>; Thu,  2 Feb 2023 07:48:47 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id be8so2216048plb.7
        for <linux-media@vger.kernel.org>; Thu, 02 Feb 2023 07:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DyTguZ4dkwc7WsdaMAFIAH+ZIualXI8BxNIYKo9xsUM=;
        b=EvAOHHrPbBAUN+dsr2W9YD0Rn5K9Aihe5hRxKDzYKI2jSK0PeETyMvjfm1RvCHktpg
         /Yur1kLedntsTGjBWq+ujDlhWr0A9+xQKJgVn83/rTOfR/rqk/LfVAYs/NJPzH3IzIoD
         SoAiKZBVjGLO45TmSQkFI3l1TAYkFd7w3WIlp6g8Q/IBj7Dw99YfXvkYx4Ol+gFk4cQk
         r+urTDkz7Zqo2/R1IhylWNNf4yFR4URZUC0Qza7iGZ+rK9TKgqf13NOy9p+w147unjDu
         mUSqhHNi88ABtb4Qfc0sW3gFwQtXRZDh4j4UMSeQFo/RaIRxdlfCqxOhgDEV9EienB46
         o4Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DyTguZ4dkwc7WsdaMAFIAH+ZIualXI8BxNIYKo9xsUM=;
        b=wmzkK3uv9lXzxq1EleR9AhkBIa3BH5b0xjMJpq+sc1qSgT6OIrdniXUNIutcfI6Xyr
         177JqDlVTLU7QFH9wC/jfzQ4QLph+4hyuVR0pn+Uf6SQmXpQOqhHA1uyzBQMZkrrxsis
         JjvqiBxWrl1G6z1GFxt8aN4v98XrbcekOOOfn6laLcO6K4zk2LvEtHjs+Q+Sxy/jgslO
         PH2oNVVXklZ6G3brcPJsd3Q3KWtXqkmOvOX8DRR3MfwOZmmXYor+A3uvXCzV+fVPqiiX
         I6J0/SDh2oSFyMGdDp1bpDoZNxltbm2vOBLLgTPU11Xzz9vhEuorsbiNHIFJyk9e5x3q
         WXAg==
X-Gm-Message-State: AO0yUKWTlh2w30beSRFQ1zEXu2rHNtnPMPBz523wOqxvZkgY+LWnyXaB
        ZGQUIqfa8nQveJnRTpC9aenq6PYdMNZ+DrigQqXuOFelISPPobzG
X-Google-Smtp-Source: AK7set/K1xmJA0oFYDUcHHcAkbYXQ6tGQzTzsgLSBZT0hKEDC5SjCowlbMmhUidXDLblxalSxfgb1i0YPSy0bVazmOE=
X-Received: by 2002:a17:90a:3b02:b0:22c:2df1:b82a with SMTP id
 d2-20020a17090a3b0200b0022c2df1b82amr747706pjc.4.1675352916290; Thu, 02 Feb
 2023 07:48:36 -0800 (PST)
MIME-Version: 1.0
References: <20230131192016.3476937-1-dave.stevenson@raspberrypi.com>
 <20230131192016.3476937-8-dave.stevenson@raspberrypi.com> <Y9vPo0UHCCx99LpX@pendragon.ideasonboard.com>
In-Reply-To: <Y9vPo0UHCCx99LpX@pendragon.ideasonboard.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Thu, 2 Feb 2023 15:48:19 +0000
Message-ID: <CAPY8ntDh9PtR1ariYH2ObnHqPjJ8gCqLoxuxCMmNYnvQVrEKZQ@mail.gmail.com>
Subject: Re: [PATCH 07/11] media: i2c: imx290: Convert V4L2_CID_HBLANK to read/write
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
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

Hi Laurent

On Thu, 2 Feb 2023 at 14:58, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Dave,
>
> Thank you for the patch.
>
> On Tue, Jan 31, 2023 at 07:20:12PM +0000, Dave Stevenson wrote:
> > The driver exposed V4L2_CID_HBLANK as a read only control to allow
> > for exposure calculations and determination of the frame rate.
> >
> > Convert to a read/write control so that the frame rate can be
> > controlled.
> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > ---
> >  drivers/media/i2c/imx290.c | 33 +++++++++++++++++++--------------
> >  1 file changed, 19 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > index 9ddd6382b127..9006be6e5e7c 100644
> > --- a/drivers/media/i2c/imx290.c
> > +++ b/drivers/media/i2c/imx290.c
> > @@ -47,6 +47,7 @@
> >  #define IMX290_GAIN                                  IMX290_REG_8BIT(0x3014)
> >  #define IMX290_VMAX                                  IMX290_REG_24BIT(0x3018)
> >  #define IMX290_HMAX                                  IMX290_REG_16BIT(0x301c)
> > +#define IMX290_HMAX_MAX                                      0xffff
> >  #define IMX290_SHS1                                  IMX290_REG_24BIT(0x3020)
> >  #define IMX290_WINWV_OB                                      IMX290_REG_8BIT(0x303a)
> >  #define IMX290_WINPV                                 IMX290_REG_16BIT(0x303c)
> > @@ -167,7 +168,7 @@ struct imx290_regval {
> >  struct imx290_mode {
> >       u32 width;
> >       u32 height;
> > -     u32 hmax;
> > +     u32 hmax_min;
> >       u8 link_freq_index;
> >
> >       const struct imx290_regval *data;
> > @@ -410,7 +411,7 @@ static const struct imx290_mode imx290_modes_2lanes[] = {
> >       {
> >               .width = 1920,
> >               .height = 1080,
> > -             .hmax = 2200,
> > +             .hmax_min = 2200,
>
> I didn't find in the documentation a mention that these values are the
> minimum the sensor supports. Did you use them as such based on the fact
> that anything higher than the nominal hblank value reported by the
> datasheet is hopefully guaranteed to work, and lower values are
> uncharted territory, or are these the real minimums ? I'm fine using
> them as minimum for now even if we could possibly go lower, leaving that
> for future patches. I would however mention this in a comment or in the
> commit message.

The datasheet shows varying HMAX to control frame rate.
Table "List of Setting Register for CSI-2 serial output" for all-pixel
mode gives HMAX values of :
0x14a0 for 25fps
0x1130 for 30fps
0x0a50 for 50fps
0x0898 for 60 fps
0x0528 for 100fps (needs FRSEL = 0 and higher link frequency)
0x044c for 120fps (ditto)

VMAX is fixed at 0x465 (1125 decimal) for all frame rates in all-pixel
(1080p) mode.

The 2200 listed here is the 0x898 for 60fps - the nominal max with the
configured lane / link frequency combinations.

Doing the maths, 4 lanes at 445.5Mbit/s/lane = 1782Mbit/s.
2200 * 1125 * 12bpp * 60fps = 1782Mbit/s. Pixel clock is therefore the
same as link bandwidth at this point. I have no information about
blanking and clock lane behaviour for this sensor, but can believe
that it needs that time for low level CSI2 transitions.

AIUI you'll only be able to decrease this further if you add support
for 891Mbit/s/lane (445.5MHz link freq) on 4 lanes, and drop to 10 bit
readout. Programming HMAX also then becomes more entertaining as it
appears to be half the expected value (0x44c = 1100 decimal, which is
smaller than the width), so it'll need a fair amount of messing to get
all the controls to behave as expected.
That's all outside the scope of this patch set - 60fps was the only
frame rate previously supported, and we've expanded on that with
slower frame rate support.


FWIW I have checked with Sony over the 120fps modes, and experimented a little.
Sony will only support 120fps in 10bit. The flyer for IMX462 that
implies it does 1920x1080@120fps in 12 bit mode is incorrect.
Experimentation had 720p120 working in 12bit, but trying to work
through limiting the various bit depth and resolution options is going
to get really ugly in the driver.

  Dave

> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> >               .link_freq_index = FREQ_INDEX_1080P,
> >               .data = imx290_1080p_settings,
> >               .data_size = ARRAY_SIZE(imx290_1080p_settings),
> > @@ -418,7 +419,7 @@ static const struct imx290_mode imx290_modes_2lanes[] = {
> >       {
> >               .width = 1280,
> >               .height = 720,
> > -             .hmax = 3300,
> > +             .hmax_min = 3300,
> >               .link_freq_index = FREQ_INDEX_720P,
> >               .data = imx290_720p_settings,
> >               .data_size = ARRAY_SIZE(imx290_720p_settings),
> > @@ -429,7 +430,7 @@ static const struct imx290_mode imx290_modes_4lanes[] = {
> >       {
> >               .width = 1920,
> >               .height = 1080,
> > -             .hmax = 2200,
> > +             .hmax_min = 2200,
> >               .link_freq_index = FREQ_INDEX_1080P,
> >               .data = imx290_1080p_settings,
> >               .data_size = ARRAY_SIZE(imx290_1080p_settings),
> > @@ -437,7 +438,7 @@ static const struct imx290_mode imx290_modes_4lanes[] = {
> >       {
> >               .width = 1280,
> >               .height = 720,
> > -             .hmax = 3300,
> > +             .hmax_min = 3300,
> >               .link_freq_index = FREQ_INDEX_720P,
> >               .data = imx290_720p_settings,
> >               .data_size = ARRAY_SIZE(imx290_720p_settings),
> > @@ -686,6 +687,12 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
> >               }
> >               break;
> >
> > +     case V4L2_CID_HBLANK:
> > +             ret = imx290_write(imx290, IMX290_HMAX,
> > +                                ctrl->val + imx290->current_mode->width,
> > +                                NULL);
> > +             break;
> > +
> >       default:
> >               ret = -EINVAL;
> >               break;
> > @@ -716,12 +723,14 @@ static void imx290_ctrl_update(struct imx290 *imx290,
> >                              const struct v4l2_mbus_framefmt *format,
> >                              const struct imx290_mode *mode)
> >  {
> > -     unsigned int hblank = mode->hmax - mode->width;
> > +     unsigned int hblank_min = mode->hmax_min - mode->width;
> > +     unsigned int hblank_max = IMX290_HMAX_MAX - mode->width;
> >       unsigned int vblank = IMX290_VMAX_DEFAULT - mode->height;
> >
> >       __v4l2_ctrl_s_ctrl(imx290->link_freq, mode->link_freq_index);
> >
> > -     __v4l2_ctrl_modify_range(imx290->hblank, hblank, hblank, 1, hblank);
> > +     __v4l2_ctrl_modify_range(imx290->hblank, hblank_min, hblank_max, 1,
> > +                              hblank_min);
> >       __v4l2_ctrl_modify_range(imx290->vblank, vblank, vblank, 1, vblank);
> >  }
> >
> > @@ -778,10 +787,11 @@ static int imx290_ctrl_init(struct imx290 *imx290)
> >                                    ARRAY_SIZE(imx290_test_pattern_menu) - 1,
> >                                    0, 0, imx290_test_pattern_menu);
> >
> > +     /*
> > +      * Actual range will be set from imx290_ctrl_update later in the probe.
> > +      */
> >       imx290->hblank = v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
> >                                          V4L2_CID_HBLANK, 1, 1, 1, 1);
> > -     if (imx290->hblank)
> > -             imx290->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> >
> >       imx290->vblank = v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
> >                                          V4L2_CID_VBLANK, 1, 1, 1, 1);
> > @@ -850,11 +860,6 @@ static int imx290_start_streaming(struct imx290 *imx290,
> >               return ret;
> >       }
> >
> > -     ret = imx290_write(imx290, IMX290_HMAX, imx290->current_mode->hmax,
> > -                        NULL);
> > -     if (ret)
> > -             return ret;
> > -
> >       /* Apply customized values from user */
> >       ret = __v4l2_ctrl_handler_setup(imx290->sd.ctrl_handler);
> >       if (ret) {
>
> --
> Regards,
>
> Laurent Pinchart
