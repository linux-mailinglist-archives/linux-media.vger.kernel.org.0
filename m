Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30B7061516E
	for <lists+linux-media@lfdr.de>; Tue,  1 Nov 2022 19:21:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230211AbiKASVQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Nov 2022 14:21:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230244AbiKASVH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Nov 2022 14:21:07 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 708911D0FE
        for <linux-media@vger.kernel.org>; Tue,  1 Nov 2022 11:21:04 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id l11so21775601edb.4
        for <linux-media@vger.kernel.org>; Tue, 01 Nov 2022 11:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Nsxf2SEy0/8nhDoXvVkEq7VtGIXEE0OvKiBirkFiP3w=;
        b=dTrXueTMRf6uhRiPtM2zBe2n7zxrii4DfYUkoqMfMCQUakBnoCeTQoL2o7s5LwKFRp
         /GB8AAU4h+99mCCYzYyE+8shlWB1lHUHymFzZ6vOrJTdt6BjAEANSWlj88QUMzRCzM9C
         CwNRvexvchiTwTj7MzcqYUoTwB4eLcMlFqZ4xShQpnfenvlMfTspW2fn2fAPsoHMe0el
         l4dnJTDhwcPaY4oV2EqGRqVhv6gJmIIQVcGtDNCA3UTTxQhzbNogZAOcw/n1s4bo+Lpu
         YwE0BXrOyGELnQ4To6SVgUDbD1GK2LfwRUFOMz5+boTNs59j/XKvee+WsHeUljl2QPw+
         lRSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nsxf2SEy0/8nhDoXvVkEq7VtGIXEE0OvKiBirkFiP3w=;
        b=bh6s4gQ0rNuLisSUmm3nQiqXOmMrysNGPuPpQBj21BT4A7LGGXeTkv1jg25u9kqW1r
         mwrS65Iv/dj/gvnWaVJAlzNUzfLk/6Gt8IxhwWDDGpTkWvQgoAGVAiKKotGzwP7bE5vi
         9PN1is3nfEO+FSU/CLRnyQpES32nSPIJ6/1JmiPjIqu42qNm1F9Sw4yJcM1txdrAIggS
         9tA5PfsymZv5mi3/TBE9oEZRIlg7SQab4CjRSy+YClXWiTFYRTGFm/0rUCH8NjU3IfLe
         0f4ayWEl66Hi+ALNBx6QsJHJS6BPezQPOX4WJ9hhDSeC9suQ4bTZTVmb4zMkYvcj/HHe
         y0hg==
X-Gm-Message-State: ACrzQf3hIRhjvs3p2yArS1C/nXs0Jj3m40PCfzoQ4tMWbyb5XaYmgTcv
        OEIPymz+z72bQGB2oXI4LY82GKSXa+yLcJonKrtMpg==
X-Google-Smtp-Source: AMsMyM5uA3f25upJPGxmsu010XYsO+UF4sXZkk7vOrRuSgAkSTS4ah5B84OTIsDp+ivzaux047DjfPzFScpt8AQSrlw=
X-Received: by 2002:a05:6402:c4d:b0:457:99ec:1837 with SMTP id
 cs13-20020a0564020c4d00b0045799ec1837mr19893836edb.86.1667326862796; Tue, 01
 Nov 2022 11:21:02 -0700 (PDT)
MIME-Version: 1.0
References: <20221028160902.2696973-1-dave.stevenson@raspberrypi.com>
 <3198230.aeNJFYEL58@steina-w> <CAPY8ntAjeyqxT0e+YPkCKm79YuvbLc4nU6qj8pGmMQ06QDp1+w@mail.gmail.com>
 <1742759.VLH7GnMWUR@steina-w>
In-Reply-To: <1742759.VLH7GnMWUR@steina-w>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 1 Nov 2022 18:20:47 +0000
Message-ID: <CAPY8ntC8iCy2S-AEV808k2yCmnQxiZzR7vQJZ1E+PcdjQJL9aw@mail.gmail.com>
Subject: Re: [PATCH v2 15/16] media: i2c: ov9282: Add support for 8bit readout
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     sakari.ailus@iki.fi, paul.j.murphy@intel.com,
        daniele.alessandrelli@intel.com, linux-media@vger.kernel.org,
        jacopo@jmondi.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alexander

On Tue, 1 Nov 2022 at 15:04, Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Hi Dave,
>
> thanks for the fast reply.
>
> Am Dienstag, 1. November 2022, 14:47:16 CET schrieb Dave Stevenson:
> > Hi Alexander
> >
> > On Tue, 1 Nov 2022 at 11:59, Alexander Stein
> >
> > <alexander.stein@ew.tq-group.com> wrote:
> > > Hello Dave,
> > >
> > > Am Freitag, 28. Oktober 2022, 18:09:01 CET schrieb Dave Stevenson:
> > > > The sensor supports 8 or 10 bit readout modes, but the
> > > > driver only supported 10 bit.
> > > >
> > > > Add 8 bit readout.
> > > >
> > > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > > ---
> > > >
> > > >  drivers/media/i2c/ov9282.c | 95 +++++++++++++++++++++++++++++++-------
> > > >  1 file changed, 78 insertions(+), 17 deletions(-)
> > > >
> > > > diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> > > > index c169b532ec8b..e2a98f480b58 100644
> > > > --- a/drivers/media/i2c/ov9282.c
> > > > +++ b/drivers/media/i2c/ov9282.c
> > > > @@ -21,6 +21,10 @@
> > > >
> > > >  #define OV9282_MODE_STANDBY  0x00
> > > >  #define OV9282_MODE_STREAMING        0x01
> > > >
> > > > +#define OV9282_REG_PLL_CTRL_0D       0x030d
> > > > +#define OV9282_PLL_CTRL_0D_RAW8              0x60
> > > > +#define OV9282_PLL_CTRL_0D_RAW10     0x50
> > > > +
> > > >
> > > >  #define OV9282_REG_TIMING_HTS        0x380c
> > > >  #define OV9282_TIMING_HTS_MAX        0x7fff
> > > >
> > > > @@ -48,6 +52,10 @@
> > > >
> > > >  /* Group hold register */
> > > >  #define OV9282_REG_HOLD              0x3308
> > > >
> > > > +#define OV9282_REG_ANA_CORE_2        0x3662
> > > > +#define OV9282_ANA_CORE2_RAW8        0x07
> > > > +#define OV9282_ANA_CORE2_RAW10       0x05
> > > > +
> > > >
> > > >  #define OV9282_REG_TIMING_FORMAT_1   0x3820
> > > >  #define OV9282_REG_TIMING_FORMAT_2   0x3821
> > > >  #define OV9282_FLIP_BIT                      BIT(2)
> > > >
> > > > @@ -63,8 +71,10 @@
> > > >
> > > >  #define OV9282_NUM_DATA_LANES        2
> > > >
> > > >  /* Pixel rate */
> > > >
> > > > -#define OV9282_PIXEL_RATE    (OV9282_LINK_FREQ * 2 * \
> > > > -                              OV9282_NUM_DATA_LANES / 10)
> > > > +#define OV9282_PIXEL_RATE_10BIT              (OV9282_LINK_FREQ * 2 * \
> > > > +                                      OV9282_NUM_DATA_LANES / 10)
> > > > +#define OV9282_PIXEL_RATE_8BIT               (OV9282_LINK_FREQ * 2 * \
> > > > +                                      OV9282_NUM_DATA_LANES / 8)
> > > >
> > > >  /*
> > > >
> > > >   * OV9282 native and active pixel array size.
> > > >
> > > > @@ -140,6 +150,7 @@ struct ov9282_mode {
> > > >
> > > >   * @again_ctrl: Pointer to analog gain control
> > > >   * @vblank: Vertical blanking in lines
> > > >   * @cur_mode: Pointer to current selected sensor mode
> > > >
> > > > + * @code: Mbus code currently selected
> > > >
> > > >   * @mutex: Mutex for serializing sensor controls
> > > >   * @streaming: Flag indicating streaming state
> > > >   */
> > > >
> > > > @@ -158,9 +169,11 @@ struct ov9282 {
> > > >
> > > >               struct v4l2_ctrl *exp_ctrl;
> > > >               struct v4l2_ctrl *again_ctrl;
> > > >
> > > >       };
> > > >
> > > > +     struct v4l2_ctrl *pixel_rate;
> > > >
> > > >       u32 vblank;
> > > >       bool noncontinuous_clock;
> > > >       const struct ov9282_mode *cur_mode;
> > > >
> > > > +     u32 code;
> > > >
> > > >       struct mutex mutex;
> > > >       bool streaming;
> > > >
> > > >  };
> > > >
> > > > @@ -178,7 +191,6 @@ static const s64 link_freq[] = {
> > > >
> > > >   */
> > > >
> > > >  static const struct ov9282_reg common_regs[] = {
> > > >
> > > >       {0x0302, 0x32},
> > > >
> > > > -     {0x030d, 0x50},
> > > >
> > > >       {0x030e, 0x02},
> > > >       {0x3001, 0x00},
> > > >       {0x3004, 0x00},
> > > >
> > > > @@ -516,19 +528,29 @@ static int ov9282_write_regs(struct ov9282
> > > > *ov9282,
> > > >
> > > >   * ov9282_update_controls() - Update control ranges based on streaming
> > > >   mode
> > > >
> > > > * @ov9282: pointer to ov9282 device
> > > >
> > > >   * @mode: pointer to ov9282_mode sensor mode
> > > >
> > > > + * @fmt: pointer to the requested mode
> > > >
> > > >   *
> > > >   * Return: 0 if successful, error code otherwise.
> > > >   */
> > > >
> > > >  static int ov9282_update_controls(struct ov9282 *ov9282,
> > > >
> > > > -                               const struct ov9282_mode *mode)
> > > > +                               const struct ov9282_mode *mode,
> > > > +                               const struct v4l2_subdev_format
> > >
> > > *fmt)
> > >
> > > >  {
> > > >
> > > >       u32 hblank_min;
> > > >
> > > > +     s64 pixel_rate;
> > > >
> > > >       int ret;
> > > >
> > > >       ret = __v4l2_ctrl_s_ctrl(ov9282->link_freq_ctrl, mode-
> > > >
> > > >link_freq_idx);
> > > >
> > > >       if (ret)
> > > >
> > > >               return ret;
> > > >
> > > > +     pixel_rate = (fmt->format.code == MEDIA_BUS_FMT_Y10_1X10) ?
> > > > +             OV9282_PIXEL_RATE_10BIT : OV9282_PIXEL_RATE_8BIT;
> > > > +     ret = __v4l2_ctrl_modify_range(ov9282->pixel_rate, pixel_rate,
> > > > +                                    pixel_rate, 1, pixel_rate);
> > > > +     if (ret)
> > > > +             return ret;
> > > > +
> > > >
> > > >       hblank_min = mode->hblank_min[ov9282->noncontinuous_clock ? 0 :
> > > >       1];
> > > >       ret =  __v4l2_ctrl_modify_range(ov9282->hblank_ctrl, hblank_min,
> > > >
> > > >                                       OV9282_TIMING_HTS_MAX -
> > >
> > > mode->width, 1,
> > >
> > > > @@ -698,10 +720,16 @@ static int ov9282_enum_mbus_code(struct
> > > > v4l2_subdev
> > > > *sd, struct v4l2_subdev_state *sd_state,
> > > >
> > > >                                struct v4l2_subdev_mbus_code_enum
> > >
> > > *code)
> > >
> > > >  {
> > > >
> > > > -     if (code->index > 0)
> > > > +     switch (code->index) {
> > > > +     case 0:
> > > > +             code->code = MEDIA_BUS_FMT_Y10_1X10;
> > > > +             break;
> > > > +     case 1:
> > > > +             code->code = MEDIA_BUS_FMT_Y8_1X8;
> > > > +             break;
> > > >
> > > > +     default:
> > > >               return -EINVAL;
> > > >
> > > > -
> > > > -     code->code = MEDIA_BUS_FMT_Y10_1X10;
> > > > +     }
> > > >
> > > >       return 0;
> > > >
> > > >  }
> > > >
> > > > @@ -721,7 +749,8 @@ static int ov9282_enum_frame_size(struct v4l2_subdev
> > > > *sd, if (fsize->index >= ARRAY_SIZE(supported_modes))
> > > >
> > > >               return -EINVAL;
> > > >
> > > > -     if (fsize->code != MEDIA_BUS_FMT_Y10_1X10)
> > > > +     if (fsize->code != MEDIA_BUS_FMT_Y10_1X10 &&
> > > > +         fsize->code != MEDIA_BUS_FMT_Y8_1X8)
> > > >
> > > >               return -EINVAL;
> > > >
> > > >       fsize->min_width = supported_modes[fsize->index].width;
> > > >
> > > > @@ -737,15 +766,17 @@ static int ov9282_enum_frame_size(struct
> > > > v4l2_subdev
> > > > *sd, *                            from selected sensor mode
> > > >
> > > >   * @ov9282: pointer to ov9282 device
> > > >   * @mode: pointer to ov9282_mode sensor mode
> > > >
> > > > + * @code: mbus code to be stored
> > > >
> > > >   * @fmt: V4L2 sub-device format need to be filled
> > > >   */
> > > >
> > > >  static void ov9282_fill_pad_format(struct ov9282 *ov9282,
> > > >
> > > >                                  const struct ov9282_mode *mode,
> > > >
> > > > +                                u32 code,
> > > >
> > > >                                  struct v4l2_subdev_format *fmt)
> > > >
> > > >  {
> > > >
> > > >       fmt->format.width = mode->width;
> > > >       fmt->format.height = mode->height;
> > > >
> > > > -     fmt->format.code = MEDIA_BUS_FMT_Y10_1X10;
> > > > +     fmt->format.code = code;
> > > >
> > > >       fmt->format.field = V4L2_FIELD_NONE;
> > > >       fmt->format.colorspace = V4L2_COLORSPACE_RAW;
> > > >       fmt->format.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
> > > >
> > > > @@ -775,7 +806,8 @@ static int ov9282_get_pad_format(struct v4l2_subdev
> > > > *sd, framefmt = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
> > > >
> > > >               fmt->format = *framefmt;
> > > >
> > > >       } else {
> > > >
> > > > -             ov9282_fill_pad_format(ov9282, ov9282->cur_mode, fmt);
> > > > +             ov9282_fill_pad_format(ov9282, ov9282->cur_mode, ov9282-
> > > >
> > > >code,
> > > >
> > > > +                                    fmt);
> > > >
> > > >       }
> > > >
> > > >       mutex_unlock(&ov9282->mutex);
> > > >
> > > > @@ -797,6 +829,7 @@ static int ov9282_set_pad_format(struct v4l2_subdev
> > > > *sd, {
> > > >
> > > >       struct ov9282 *ov9282 = to_ov9282(sd);
> > > >       const struct ov9282_mode *mode;
> > > >
> > > > +     u32 code;
> > > >
> > > >       int ret = 0;
> > > >
> > > >       mutex_lock(&ov9282->mutex);
> > > >
> > > > @@ -806,7 +839,12 @@ static int ov9282_set_pad_format(struct v4l2_subdev
> > > > *sd, width, height,
> > > >
> > > >                                     fmt->format.width,
> > > >                                     fmt->format.height);
> > > >
> > > > -     ov9282_fill_pad_format(ov9282, mode, fmt);
> > > > +     if (fmt->format.code == MEDIA_BUS_FMT_Y8_1X8)
> > > > +             code = MEDIA_BUS_FMT_Y8_1X8;
> > > > +     else
> > > > +             code = MEDIA_BUS_FMT_Y10_1X10;
> > > > +
> > > > +     ov9282_fill_pad_format(ov9282, mode, code, fmt);
> > > >
> > > >       if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
> > > >
> > > >               struct v4l2_mbus_framefmt *framefmt;
> > > >
> > > > @@ -814,9 +852,11 @@ static int ov9282_set_pad_format(struct v4l2_subdev
> > > > *sd, framefmt = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
> > > >
> > > >               *framefmt = fmt->format;
> > > >
> > > >       } else {
> > > >
> > > > -             ret = ov9282_update_controls(ov9282, mode);
> > > > -             if (!ret)
> > > > +             ret = ov9282_update_controls(ov9282, mode, fmt);
> > > > +             if (!ret) {
> > > >
> > > >                       ov9282->cur_mode = mode;
> > > >
> > > > +                     ov9282->code = code;
> > > > +             }
> > > >
> > > >       }
> > > >
> > > >       mutex_unlock(&ov9282->mutex);
> > > >
> > > > @@ -838,7 +878,8 @@ static int ov9282_init_pad_cfg(struct v4l2_subdev
> > > > *sd,
> > > >
> > > >       struct v4l2_subdev_format fmt = { 0 };
> > >
> > > >       fmt.which = sd_state ? V4L2_SUBDEV_FORMAT_TRY :
> > > V4L2_SUBDEV_FORMAT_ACTIVE;
> > >
> > > > -     ov9282_fill_pad_format(ov9282, &supported_modes[DEFAULT_MODE],
> > >
> > > &fmt);
> > >
> > > > +     ov9282_fill_pad_format(ov9282, &supported_modes[DEFAULT_MODE],
> > > > +                            ov9282->code, &fmt);
> > > >
> > > >       return ov9282_set_pad_format(sd, sd_state, &fmt);
> > > >
> > > >  }
> > > >
> > > > @@ -903,7 +944,17 @@ static int ov9282_get_selection(struct v4l2_subdev
> > > > *sd, */
> > > >
> > > >  static int ov9282_start_streaming(struct ov9282 *ov9282)
> > > >  {
> > > >
> > > > +     const struct ov9282_reg bitdepth_regs[2][2] = {
> > > > +             {
> > > > +                     {OV9282_REG_PLL_CTRL_0D,
> > >
> > > OV9282_PLL_CTRL_0D_RAW10},
> > >
> > > > +                     {OV9282_REG_ANA_CORE_2, OV9282_ANA_CORE2_RAW10},
> > > > +             }, {
> > > > +                     {OV9282_REG_PLL_CTRL_0D,
> > >
> > > OV9282_PLL_CTRL_0D_RAW8},
> > >
> > > > +                     {OV9282_REG_ANA_CORE_2, OV9282_ANA_CORE2_RAW8},
> > > > +             }
> > > > +     };
> > > >
> > > >       const struct ov9282_reg_list *reg_list;
> > > >
> > > > +     int bitdepth_index;
> > > >
> > > >       int ret;
> > > >
> > > >       /* Write common registers */
> > > >
> > > > @@ -914,6 +965,13 @@ static int ov9282_start_streaming(struct ov9282
> > > > *ov9282) return ret;
> > > >
> > > >       }
> > > >
> > > > +     bitdepth_index = ov9282->code == MEDIA_BUS_FMT_Y10_1X10 ? 0 : 1;
> > > > +     ret = ov9282_write_regs(ov9282, bitdepth_regs[bitdepth_index], 2);
> > > > +     if (ret) {
> > > > +             dev_err(ov9282->dev, "fail to write bitdepth regs");
> > > > +             return ret;
> > > > +     }
> > > > +
> > > >
> > > >       /* Write sensor mode registers */
> > > >       reg_list = &ov9282->cur_mode->reg_list;
> > > >       ret = ov9282_write_regs(ov9282, reg_list->regs, reg_list-
> > > >
> > > >num_of_regs);
> > > >
> > > > @@ -1235,9 +1293,11 @@ static int ov9282_init_controls(struct ov9282
> > > > *ov9282) 0, 1, 1, 1);
> > > >
> > > >       /* Read only controls */
> > > >
> > > > -     v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops,
> > > > V4L2_CID_PIXEL_RATE,
> > > > -                       OV9282_PIXEL_RATE, OV9282_PIXEL_RATE, 1,
> > > > -                       OV9282_PIXEL_RATE);
> > > > +     ov9282->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr,
> > > > &ov9282_ctrl_ops,
> > > > +                                            V4L2_CID_PIXEL_RATE,
> > > > +
> > >
> > > OV9282_PIXEL_RATE_10BIT,
> > >
> > > > +
> > >
> > > OV9282_PIXEL_RATE_10BIT, 1,
> > >
> > > > +
> > >
> > > OV9282_PIXEL_RATE_10BIT);
> > >
> > > >       ov9282->link_freq_ctrl = v4l2_ctrl_new_int_menu(ctrl_hdlr,
> > >
> > > &ov9282_ctrl_ops,
> > >
> > > > @@ -1319,6 +1379,7 @@ static int ov9282_probe(struct i2c_client *client)
> > > >
> > > >       /* Set default mode to first mode */
> > > >       ov9282->cur_mode = &supported_modes[DEFAULT_MODE];
> > > >
> > > > +     ov9282->code = MEDIA_BUS_FMT_Y10_1X10;
> > > >
> > > >       ov9282->vblank = ov9282->cur_mode->vblank;
> > > >
> > > >       ret = ov9282_init_controls(ov9282);
> > >
> > > Using this series I was able to do some camera playback on LVDS display on
> > > imx8mm based platform (TQMa8MxML). My command was 'gst-launch-1.0 v4l2src
> > > device=/dev/video0 ! video/x-
> > > raw,format=GRAY8,bpp=8,width=1280,height=720,framerate=30/1 ! videoconvert
> > > ! waylandsink'
> > > But due to SW colorspace conversion this is awfully slow.
> > > Using a testsink I get about 72FPS on 1280x720 for GREY. Is this to be
> > > expected?
> > > I used 'gst-launch-1.0 v4l2src device=/dev/video0 ! video/x-
> > > raw,format=GRAY8,bpp=8,width=1280,height=720,framerate=30/1 !
> > > fpsdisplaysink video-sink="testsink" text-overlay=false silent=false
> > > sync=false -v' for that.
> > AFAIK v4l2src doesn't map from a caps framerate=30/1 to the relevant
> > V4L2_CID_VBLANK and V4L2_CID_HBLANK controls used by raw sensors for
> > frame rate control (see docs at [1]). The sensor will therefore stream
> > at whatever rate the controls get left at.
>
> Yes I noticed the framerate caps has no effect. But I lack some kind of
> reference system to decide what should work and what not.

As per the docs link, raw sensors will be using the HBLANK and VBLANK
controls, not VIDIOC_S_PARM.
I don't know whether the GStreamer folks wish to add support to
v4l2src to set those - libcamerasrc is going to be the more normal
user of these sensors, but that generally means needing an ISP of some
form. With just v4l2src you've got no AE / AGC control loops, so it is
only of use in controlled lighting conditions.

I don't know the full details of the imx8 range, but believe the
libcamera folk were working with one of the imx8 platforms.

> > I'm assuming you're not using Media Controller either, as v4l2src
> > won't set up Media Controller links correctly either.
>
> Well, actually I am using Media Controller. But I need to configure it before
> gstreamer usage. There is no specific reason for gstreamer, but we use this to
> verify features on downstream kernel.
>
> For completeness here is one of my media-ctl setup:
> media-ctl -l "'ov9282 2-0060':0->'csis-32e30000.mipi-csi':0 [1]"
> media-ctl -V "'ov9282 2-0060':0 [fmt:Y8_1X8/1280x720 field:none
> colorspace:raw]"
> media-ctl -V "'csi':0 [fmt:Y8_1X8/1280x720 field:none colorspace:raw]"
> v4l2-ctl -d0 --set-fmt-video
> width=1280,height=720,pixelformat='GREY',field=none
> media-ctl -p
>
> Media controller API version 6.1.0
>
> Media device information
> ------------------------
> driver          imx7-csi
> model           imx-media
> serial
> bus info        platform:32e20000.csi
> hw revision     0x0
> driver version  6.1.0
>
> Device topology
> - entity 1: csi (2 pads, 2 links)
>             type V4L2 subdev subtype Unknown flags 0
>             device node name /dev/v4l-subdev0
>         pad0: Sink
>                 [fmt:Y8_1X8/1280x720 field:none colorspace:raw xfer:none
> ycbcr:601 quantization:full-range]
>                 <- "csis-32e30000.mipi-csi":1 [ENABLED,IMMUTABLE]
>         pad1: Source
>                 [fmt:Y8_1X8/1280x720 field:none colorspace:raw xfer:none
> ycbcr:601 quantization:full-range]
>                 -> "csi capture":0 [ENABLED,IMMUTABLE]
>
> - entity 4: csi capture (1 pad, 1 link)
>             type Node subtype V4L flags 0
>             device node name /dev/video0
>         pad0: Sink
>                 <- "csi":1 [ENABLED,IMMUTABLE]
>
> - entity 10: csis-32e30000.mipi-csi (2 pads, 2 links)
>              type V4L2 subdev subtype Unknown flags 0
>              device node name /dev/v4l-subdev1
>         pad0: Sink
>                 [fmt:Y8_1X8/1280x720 field:none colorspace:raw xfer:none]
>                 <- "ov9281 2-0060":0 [ENABLED]
>         pad1: Source
>                 [fmt:Y8_1X8/1280x720 field:none colorspace:raw xfer:none]
>                 -> "csi":0 [ENABLED,IMMUTABLE]
>
> - entity 15: ov9282 2-0060 (1 pad, 1 link)
>              type V4L2 subdev subtype Sensor flags 0
>              device node name /dev/v4l-subdev2
>         pad0: Source
>                 [fmt:Y8_1X8/1280x720 field:none colorspace:raw xfer:none
>                  crop.bounds:(8,8)/1280x800
>                  crop:(8,8)/1280x720]
>                 -> "csis-32e30000.mipi-csi":0 [ENABLED]
>
>
> > Running a Raspberry Pi in the same non-Media Controller mode:
> > v4l2-ctl -v width=1280,height=800,pixelformat=Y10P
> > v4l2-ctl --stream-mmap=3 --stream-count=1000 --stream-to=/dev/null
> > gives me 60.28fps.
> >
> > HBLANK defaults to 176, and VBLANK to 1022:
> > 160MPix/s / ((1280+176) * (800+1022)) = 60.3fps.
> >
> > v4l2-ctl -v width=1280,height=800,pixelformat=GREY
> > v4l2-ctl --stream-mmap=3 --stream-count=1000 --stream-to=/dev/null
> > Gives me 72.33fps as neither HBLANK nor VBLANK have been altered, but
> > V4L2_CID_PIXEL_RATE has been increased.
> >
> > Run the numbers the other way for eg 120fps
> > 200MPix/s / ( 120fps * (width 1280 + HBLANK 176)) - height (800) = VBLANK =
> > 344 v4l2-ctl --set-ctrl=vertical_blanking=344
> > Streaming with that gives me 115.17fps, so you're now making me
> > question the Y8 pixel rate.
> > 192MPix/s appears to be the right value to make the numbers work.
>
> Mh, using v4l2-ctl --set-ctrl=vertical_blanking=344 -d /dev/v4l-subdev2 I get
> 109.61fps for 1280x800.

The sensor has an external clock signal (XVCLK) which can be between 6
and 27MHz. The driver only supports 24MHz. Is your module using a
24MHz clock?

> > I don't recall where I'd got the 200MPix/s value from - it's not
> > documented in the datasheet, but presumably from 160 * 10 / 8
> > (switching from 10 to 8 bits at the same output rate). You're the
> > first to notice the rates are off, although at least it's less than
> > the factor of two that this driver used to be out by.
>
> I admit I'm not fully sure which results are correct and what they are
> expected to be. But here are some results using the v4l-ctrl approach:
>      | 1280x800 | 1280x720 | 640x400 |
> -----+----------+----------+---------+
> GREY |  68.84   |   72.0   |  73.50  |
> Y10  |  57.37   |   60.0   |  73.50  |
>
> All using their default vertical and horizontal blanking. Especially switching
> to 640x400 and then back to 1280x720 leaves the horizontal_blanking to the old
> (640) value, resulting in lower frame rates.

IMHO This isn't clear in the docs.
My understanding is that controls shouldn't change value when changing
modes unless the new mode requires updating the range for the control
such that the current value is invalid. This does mean that the
framerate will change if you change modes without reprogramming, but
what heuristics should be used if you did update it? Options:
1) retain the current frame rate by recomputing VBLANK, but there will
be conditions where you can't achieve the same frame rate in all
modes.
2) reset to a default frame rate, but how do you define that? Do you
have to detect change of mode vs just calling S_FMT with the same
mode?
3) adjust the limits but otherwise leave the control alone.
4) as 3, but update the default value to reflect some standard
framerate (but how do you define that standard?)

Different sensors are currently doing different things, so the only
approach you can really take is for userspace to set the controls
explicitly after setting a mode.
Sakari will normally point to the CCS driver as a model for raw
sensors, and that appears to adopt option 3. There was a thread with
Jacopo recently over this same subject, but no resolution. I think it
was on the ar0521 patchset.

Clean boot and testing in this order:
- 1280x720 Y10P 63.05fps
- 1280x800 Y10P 60.28fps
- 640x400 Y10P 77.22fps
Reboot so that the HBLANK change is reset
- 1280x720 GREY 75.65fps
- 1280x800 GREY 72.33fps
- 640x400 GREY 92.67fps.

I don't believe your GREY 640x400 number as it's the same as your
640x400 Y10 value, but all your other values except 1280x800 Y10
differ from mine by a factor of 1.0507. (1280x800 Y10 is x1.099).
I'd suggest measuring your XVCLK clock signal with an oscilloscope or
frequency counter as I suspect it isn't 24MHz. 22.8MHz would give
these results, but is a slightly strange frequency if from a dedicated
oscillator rather than a PLL.
Adding support for additional XVCLK frequencies isn't a huge task, but
involves computing the internal PLL settings. My datasheet only gives
settings for 24MHz, so it'd be back to the basic principles of PLL
config to do it.

  Dave

> > Sakari: Do you want a new version of the patchset, or just a fixup on top?
> >
> > [1]
> > https://www.kernel.org/doc/html/latest/driver-api/media/camera-sensor.html#
> > raw-camera-sensors
> > > Apparently gstreamer does not support Y10. Do you have a different way
> > > to actually use Y10?
> >
> > We're using libcamera on Raspberry Pi. The Pi ISP will happily consume
> > raw 8, 10, 12, 14, or 16, and spit out YUV or RGB.
> > The alternative is v4l2-ctl as above.
>
> There is no ISP on imx8mm, so I'm stuck to CPU conversion for now, as OpenGL
> based conversion in gstreamer does not work currently, but that's a different
> matter (it does work downstream on imx8mp though).
>
> > Depending on what unpacking your platform is capable of, you may be
> > able to request V4L2_PIX_FMT_Y10 (10bit sample in a 16bit word) and
> > then pass it through GStreamer as either GRAY16_LE or GRAY16_BE.
> > V4L2_PIX_FMT_Y10P is a bit of a pain to handle (4 pixels in 5 bytes as
> > described in [2]), but is more efficient on memory usage.
> >
> > Do note that this is still a raw image sensor and therefore the images
> > will generally have a non-zero black level, and quite probably lens
> > shading artifacts. They should not be considered as a standard luma
> > signal.
>
> Thanks for the hint about using GRAY16_LE and the explanations: I'm aware that
> there is more to configure, but right now I'm focusing on correct
> configuration and data transfer for the sensor data itself.
>
> Best regards
> Alexander
>
>
>
