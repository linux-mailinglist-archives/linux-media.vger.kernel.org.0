Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B3815777A8
	for <lists+linux-media@lfdr.de>; Sun, 17 Jul 2022 20:04:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229629AbiGQSEr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Jul 2022 14:04:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbiGQSEr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Jul 2022 14:04:47 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACD8413EA5
        for <linux-media@vger.kernel.org>; Sun, 17 Jul 2022 11:04:43 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id fy29so16521210ejc.12
        for <linux-media@vger.kernel.org>; Sun, 17 Jul 2022 11:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ud+TiF4m7po1mW1dB/x6b4A3m6M8l0fbva/VpZQi14c=;
        b=FxNWquaV+Q2u3r53vP3PvbW3SUDtJj1N3as3fbawmSweX+S4JIs9G56MhAXbCdFtPS
         i89HzEmOa702OM5Swsr7Rmx3JOddculd2jzyQsR+O4C30lnTHQS6QOWgcA3Btb7rkmb7
         C5kTCpHyiHF8W7L/o6KNDq09I24aUv9t/6GDrpC/G3vTkMGeWLvOQU/0SLRXEQE1FTck
         p5OLjv1nMlpV8fa1X6KzNDyokIU/IY+vKJxhmMZLmRaivx1REmESBnjBMfPIl20FjuIM
         oaB4X5NWbUzFkb3clks0JSNgw4c11OkDJ20D5JEWHOKXXUFV1YQj/9IzRuKtXRY9UH2w
         om9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ud+TiF4m7po1mW1dB/x6b4A3m6M8l0fbva/VpZQi14c=;
        b=ecE1Iw5HVx9OP50NMLZE6pDwz8Bw37CyzPEonnWY9+I/w0RclliiFdy99q9pgceCTa
         BGDZQ5lCNPeHa90B0Xzi2JKbhpHUUKQhfRAIMXf/rrOqoZMEHUbL2tzlOwf9Xf06GHn8
         pSRFF68n912upOqWJe50foJrXynt1DEsfAbY1rWw/b8Afu3m2dGLGd6pKoaOjoEgy1Ws
         1KNHl4Odl0L2M79nkzobvjWdxZxenQrcg6M2dW5XWLP8aysGySShHmbsFC6syXOHcxNK
         B6Sm8D3dSqCHHA6LtMJf+3OMXehtNADJCFuOo6e4cfup96twxttpe/QazavThk7S56Bq
         lE3w==
X-Gm-Message-State: AJIora99vF5usOD5ZhkH9GFE+BrlbZk2ClyoxOhlw2Fk2nUtrcDBSGMi
        QcaGg7Rk1S+aVd3LIsoyAqP6FVTh7CUQISEikJEgCCm+
X-Google-Smtp-Source: AGRyM1sggsKtIoIR3xT/PdFqUXyUnRgGplbzzeIJ9XlVHsoJIJaQT6uK7ehAMmkwjuzx/TSF4Fr2QNAkBhqLkbPBmU0=
X-Received: by 2002:a17:907:3f89:b0:72b:60ee:29cf with SMTP id
 hr9-20020a1709073f8900b0072b60ee29cfmr22624401ejc.316.1658081081230; Sun, 17
 Jul 2022 11:04:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220630230713.10580-1-laurent.pinchart@ideasonboard.com>
 <20220630230713.10580-49-laurent.pinchart@ideasonboard.com>
 <CAHCN7xKVzrExUvK+fEKiTXV71J5K-VOcqxVFrew0f2dN5mjAOQ@mail.gmail.com>
 <YtQjN6/hQpJautjv@pendragon.ideasonboard.com> <YtQpXg87MorpTnRd@pendragon.ideasonboard.com>
In-Reply-To: <YtQpXg87MorpTnRd@pendragon.ideasonboard.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Sun, 17 Jul 2022 13:04:30 -0500
Message-ID: <CAHCN7xJn8MENsPVxW6qUGBRJHx4=ZR6exJWVGWVFzHdxz-1jKg@mail.gmail.com>
Subject: Re: [PATCH v2 48/55] media: rkisp1: Add match data for i.MX8MP ISP
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media <linux-media@vger.kernel.org>,
        "open list:HANTRO VPU CODEC DRIVER" 
        <linux-rockchip@lists.infradead.org>,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Jul 17, 2022 at 10:23 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Adam,
>
> On Sun, Jul 17, 2022 at 05:56:56PM +0300, Laurent Pinchart wrote:
> > On Fri, Jul 15, 2022 at 06:56:57AM -0500, Adam Ford wrote:
> > > On Thu, Jun 30, 2022 at 6:27 PM Laurent Pinchart wrote:
> > > >
> > > > From: Paul Elder <paul.elder@ideasonboard.com>
> > > >
> > > > Add match data to the rkisp1 driver to match the i.MX8MP ISP.
> > >
> > > I am testing this series on an i.MX8MP with two Sony IMX219 cameras in
> > > 4-lane mode.
> > > From what I can tell, the ISP_1 doesn't enumerate if ISP_0 is already
> > > enumerated.  My guess is that the name of the ISP is hard-coded so the
> > > second instance isn't able to load because the names conflict.  I
> > > don't see any errors, so it's just a guess.
> >
> > I'll have a look.
Thanks!
>
> Both ISP instances probe successfully for me, with two different sensors
> though (IMX327 and IMX296). Can you share more information about your
> issue ?

I'll double check the repo I am using as my starting base when I get
back into the office tomorrow.  I'll rebase my device tree changes if
I don't have the latest and let you know what I am seeing.

adam
>
> > > > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> > > > ---
> > > >  .../platform/rockchip/rkisp1/rkisp1-dev.c     | 22 +++++++++++++++++++
> > > >  include/uapi/linux/rkisp1-config.h            |  3 +++
> > > >  2 files changed, 25 insertions(+)
> > > >
> > > > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > > > index f2475c6235ea..a41f89807dd7 100644
> > > > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > > > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > > > @@ -496,6 +496,24 @@ static const struct rkisp1_info rk3399_isp_info = {
> > > >         .features = RKISP1_FEATURE_MIPI_CSI2,
> > > >  };
> > > >
> > > > +static const char * const imx8mp_isp_clks[] = {
> > > > +       "isp",
> > > > +       "hclk",
> > > > +       "aclk",
> > > > +};
> > > > +
> > > > +static const struct rkisp1_isr_data imx8mp_isp_isrs[] = {
> > > > +       { NULL, rkisp1_isr },
> > > > +};
> > > > +
> > > > +static const struct rkisp1_info imx8mp_isp_info = {
> > > > +       .clks = imx8mp_isp_clks,
> > > > +       .clk_size = ARRAY_SIZE(imx8mp_isp_clks),
> > > > +       .isrs = imx8mp_isp_isrs,
> > > > +       .isr_size = ARRAY_SIZE(imx8mp_isp_isrs),
> > > > +       .isp_ver = IMX8MP_V10,
> > > > +};
> > > > +
> > > >  static const struct of_device_id rkisp1_of_match[] = {
> > > >         {
> > > >                 .compatible = "rockchip,px30-cif-isp",
> > > > @@ -505,6 +523,10 @@ static const struct of_device_id rkisp1_of_match[] = {
> > > >                 .compatible = "rockchip,rk3399-cif-isp",
> > > >                 .data = &rk3399_isp_info,
> > > >         },
> > > > +       {
> > > > +               .compatible = "fsl,imx8mp-isp",
> > > > +               .data = &imx8mp_isp_info,
> > > > +       },
> > > >         {},
> > > >  };
> > > >  MODULE_DEVICE_TABLE(of, rkisp1_of_match);
> > > > diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
> > > > index 583ca0d9a79d..40677d47825c 100644
> > > > --- a/include/uapi/linux/rkisp1-config.h
> > > > +++ b/include/uapi/linux/rkisp1-config.h
> > > > @@ -140,12 +140,15 @@
> > > >   * @RKISP1_V11: declared in the original vendor code, but not used
> > > >   * @RKISP1_V12: used at least in rk3326 and px30
> > > >   * @RKISP1_V13: used at least in rk1808
> > > > + * @IMX8MP_V10: used in at least imx8mp
> > > >   */
> > > >  enum rkisp1_cif_isp_version {
> > > >         RKISP1_V10 = 10,
> > > >         RKISP1_V11,
> > > >         RKISP1_V12,
> > > >         RKISP1_V13,
> > > > +       /* TODO Choose a better version for this */
> > > > +       IMX8MP_V10,
> > > >  };
> > > >
> > > >  enum rkisp1_cif_isp_histogram_mode {
>
> --
> Regards,
>
> Laurent Pinchart
