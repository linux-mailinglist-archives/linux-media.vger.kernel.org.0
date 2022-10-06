Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C5385F6567
	for <lists+linux-media@lfdr.de>; Thu,  6 Oct 2022 13:51:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229897AbiJFLvm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Oct 2022 07:51:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229701AbiJFLvl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Oct 2022 07:51:41 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0CFA97D7B
        for <linux-media@vger.kernel.org>; Thu,  6 Oct 2022 04:51:35 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id u21so2411249edi.9
        for <linux-media@vger.kernel.org>; Thu, 06 Oct 2022 04:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=4zNNXwE75ScmPUy/WDaOvXUjsgav46DKvMjjFqEvpYM=;
        b=fmsgbz/Gf8ylo5lowUx0ekfDPDmsPl5HC+OulWFPH2M12B99UCzkjvX7Ep1SMDKeKt
         lmgaoEnYm0zz9H0Gk5rtMxRspqpHc3VKPhwcEPJ7Ez0dbFBfyYRkfKFDCwgJLY169UGG
         4k5Pv6gG0Yp66p41PnV3yapoBhbDY72EfLPKx9nB2SG3Yl+JW5f6ROpa/r4x5Zv6fJDE
         eOG0nF0XtEOMImGGP6emjaG8DE6LPnXCJXqlF+bCxFbhDgAc6iQofbs9n0Xo3NSKmlvK
         mDFxb/RC64jYxyrOkaBuddSjhGxJ7fjyrbrXaXE1F1mgXGUtnGZ2qRRyzgHuSqeqykFs
         dYiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=4zNNXwE75ScmPUy/WDaOvXUjsgav46DKvMjjFqEvpYM=;
        b=ATGK9AW5MLXarf39g+fxAfu02VNL1tVYgTliI/BuYaA2wOdXd4euRxtQuHNHjM2Zpv
         qE0W+2JVUf643Yy0a0A6Qf4/pIgTazjqy3lZWGGUjJzJdDs2i4SnRjOSZ1zL+WTQ+905
         FtFj/UlqPsO+HtSywPAQI+shPAgT2NbYZVWL0ArEGFGY1oDBS7JGw2jhRRfR3RJxtWth
         MOc01/PIlllOCZYhVd3iYH04bpe7M+jJciHlTNSp46PxEUJKuQ3Zh9KsgngZupp60TZV
         Gbi8PtOBPlu/iLg4wRXG4LMuZxSPP72cGhLvW03qdZq/PW1buz99rtmRyInpHBNHF6tR
         t1Pg==
X-Gm-Message-State: ACrzQf2Doh3aZhJS3Jgdyp3saV6z6569JZHwcqjpDDTPclZFln3jcgsA
        XGghOtdeDBECh+P07M/xxe9XhI6WnTpMZmFBkzSLyg==
X-Google-Smtp-Source: AMsMyM6zmgNWAq5vM0dQEqqgfJzesUEmiInKoGlXWQG8E/DfUPmcMnf6DDGp2YWn2Jr5krRYUaMWILyv+vcEbhUdgSg=
X-Received: by 2002:a05:6402:550e:b0:456:f79f:2bed with SMTP id
 fi14-20020a056402550e00b00456f79f2bedmr4263591edb.106.1665057094310; Thu, 06
 Oct 2022 04:51:34 -0700 (PDT)
MIME-Version: 1.0
References: <20221005152809.3785786-1-dave.stevenson@raspberrypi.com>
 <20221005152809.3785786-5-dave.stevenson@raspberrypi.com> <20221006091730.mtphbem33dufubd4@uno.localdomain>
In-Reply-To: <20221006091730.mtphbem33dufubd4@uno.localdomain>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Thu, 6 Oct 2022 12:51:17 +0100
Message-ID: <CAPY8ntAg=-miPFbnP+vtyOAU0Bo_nv3+cUb23OtfU=DQieLhvQ@mail.gmail.com>
Subject: Re: [PATCH 04/16] media: i2c: ov9282: Remove pixel rate from mode definition
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
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

Hi Jacopo

Thanks for the review

On Thu, 6 Oct 2022 at 10:17, Jacopo Mondi <jacopo@jmondi.org> wrote:
>
> Hi Dave
>
> On Wed, Oct 05, 2022 at 04:27:57PM +0100, Dave Stevenson wrote:
> > The pixel rate is determined by the PLL setup in the common
> > registers, not by the mode specific registers, therefore
> > remove it from the mode definition and define it for all modes.
> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > ---
> >  drivers/media/i2c/ov9282.c | 17 +++++++----------
> >  1 file changed, 7 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> > index 1c77b77427f0..798ff8ba50bd 100644
> > --- a/drivers/media/i2c/ov9282.c
> > +++ b/drivers/media/i2c/ov9282.c
> > @@ -53,6 +53,10 @@
> >  #define OV9282_LINK_FREQ     400000000
> >  #define OV9282_NUM_DATA_LANES        2
> >
> > +/* Pixel rate */
> > +#define OV9282_PIXEL_RATE    (OV9282_LINK_FREQ * 2 * \
> > +                              OV9282_NUM_DATA_LANES / 10)
>
> This will work as long as there's a single Y10 supported mode.
> I haven't looked at the rest of the series yet but if Y8 gets
> supported it might be worth dynamically re-computing the PIXEL_RATE
> when a new mode is applied.
>
> For now this is good, and if Y10 remains the default format is fine to
> initialize PIXEL_RATE assuming 10 bpp

Y8 support comes later in the series. At this point there are many
checks that the format is Y10.

  Dave

> Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
>
> Thanks
>   j
>
> > +
> >  #define OV9282_REG_MIN               0x00
> >  #define OV9282_REG_MAX               0xfffff
> >
> > @@ -92,7 +96,6 @@ struct ov9282_reg_list {
> >   * @vblank: Vertical blanking in lines
> >   * @vblank_min: Minimum vertical blanking in lines
> >   * @vblank_max: Maximum vertical blanking in lines
> > - * @pclk: Sensor pixel clock
> >   * @link_freq_idx: Link frequency index
> >   * @reg_list: Register list for sensor mode
> >   */
> > @@ -103,7 +106,6 @@ struct ov9282_mode {
> >       u32 vblank;
> >       u32 vblank_min;
> >       u32 vblank_max;
> > -     u64 pclk;
> >       u32 link_freq_idx;
> >       struct ov9282_reg_list reg_list;
> >  };
> > @@ -118,7 +120,6 @@ struct ov9282_mode {
> >   * @inclk: Sensor input clock
> >   * @ctrl_handler: V4L2 control handler
> >   * @link_freq_ctrl: Pointer to link frequency control
> > - * @pclk_ctrl: Pointer to pixel clock control
> >   * @hblank_ctrl: Pointer to horizontal blanking control
> >   * @vblank_ctrl: Pointer to vertical blanking control
> >   * @exp_ctrl: Pointer to exposure control
> > @@ -138,7 +139,6 @@ struct ov9282 {
> >       struct regulator_bulk_data supplies[OV9282_NUM_SUPPLIES];
> >       struct v4l2_ctrl_handler ctrl_handler;
> >       struct v4l2_ctrl *link_freq_ctrl;
> > -     struct v4l2_ctrl *pclk_ctrl;
> >       struct v4l2_ctrl *hblank_ctrl;
> >       struct v4l2_ctrl *vblank_ctrl;
> >       struct {
> > @@ -269,7 +269,6 @@ static const struct ov9282_mode supported_mode = {
> >       .vblank = 1022,
> >       .vblank_min = 151,
> >       .vblank_max = 51540,
> > -     .pclk = 160000000,
> >       .link_freq_idx = 0,
> >       .reg_list = {
> >               .num_of_regs = ARRAY_SIZE(mode_1280x720_regs),
> > @@ -1006,11 +1005,9 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
> >                                               1, mode->vblank);
> >
> >       /* Read only controls */
> > -     ov9282->pclk_ctrl = v4l2_ctrl_new_std(ctrl_hdlr,
> > -                                           &ov9282_ctrl_ops,
> > -                                           V4L2_CID_PIXEL_RATE,
> > -                                           mode->pclk, mode->pclk,
> > -                                           1, mode->pclk);
> > +     v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops, V4L2_CID_PIXEL_RATE,
> > +                       OV9282_PIXEL_RATE, OV9282_PIXEL_RATE, 1,
> > +                       OV9282_PIXEL_RATE);
> >
> >       ov9282->link_freq_ctrl = v4l2_ctrl_new_int_menu(ctrl_hdlr,
> >                                                       &ov9282_ctrl_ops,
> > --
> > 2.34.1
> >
