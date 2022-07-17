Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E223957770B
	for <lists+linux-media@lfdr.de>; Sun, 17 Jul 2022 17:23:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233219AbiGQPXs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Jul 2022 11:23:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233210AbiGQPXq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Jul 2022 11:23:46 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2477E9E
        for <linux-media@vger.kernel.org>; Sun, 17 Jul 2022 08:23:44 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E50B133F;
        Sun, 17 Jul 2022 17:23:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1658071423;
        bh=jMp437tLgRiVuTndBgfm5bVxwewP3wJErJnmyB02dAw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bd21Nu9nm0GyB6q9FuqAqR2tm89kGgi/GfRotNsegqcOz8dku+LfBmRXTId0OgYiD
         cZCbdQuWgz0MuHiLYNzPQIkSV0SRok/MGuKqZdIywzVfuj4XsAcg6cpJMZhRVvUDR2
         ts9t1bUGON8vlzDOkb4YDG8RIoV5nPaXSTNdZJto=
Date:   Sun, 17 Jul 2022 18:23:10 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     linux-media <linux-media@vger.kernel.org>,
        "open list:HANTRO VPU CODEC DRIVER" 
        <linux-rockchip@lists.infradead.org>,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: Re: [PATCH v2 48/55] media: rkisp1: Add match data for i.MX8MP ISP
Message-ID: <YtQpXg87MorpTnRd@pendragon.ideasonboard.com>
References: <20220630230713.10580-1-laurent.pinchart@ideasonboard.com>
 <20220630230713.10580-49-laurent.pinchart@ideasonboard.com>
 <CAHCN7xKVzrExUvK+fEKiTXV71J5K-VOcqxVFrew0f2dN5mjAOQ@mail.gmail.com>
 <YtQjN6/hQpJautjv@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YtQjN6/hQpJautjv@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Adam,

On Sun, Jul 17, 2022 at 05:56:56PM +0300, Laurent Pinchart wrote:
> On Fri, Jul 15, 2022 at 06:56:57AM -0500, Adam Ford wrote:
> > On Thu, Jun 30, 2022 at 6:27 PM Laurent Pinchart wrote:
> > >
> > > From: Paul Elder <paul.elder@ideasonboard.com>
> > >
> > > Add match data to the rkisp1 driver to match the i.MX8MP ISP.
> > 
> > I am testing this series on an i.MX8MP with two Sony IMX219 cameras in
> > 4-lane mode.
> > From what I can tell, the ISP_1 doesn't enumerate if ISP_0 is already
> > enumerated.  My guess is that the name of the ISP is hard-coded so the
> > second instance isn't able to load because the names conflict.  I
> > don't see any errors, so it's just a guess.
> 
> I'll have a look.

Both ISP instances probe successfully for me, with two different sensors
though (IMX327 and IMX296). Can you share more information about your
issue ?

> > > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> > > ---
> > >  .../platform/rockchip/rkisp1/rkisp1-dev.c     | 22 +++++++++++++++++++
> > >  include/uapi/linux/rkisp1-config.h            |  3 +++
> > >  2 files changed, 25 insertions(+)
> > >
> > > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > > index f2475c6235ea..a41f89807dd7 100644
> > > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > > @@ -496,6 +496,24 @@ static const struct rkisp1_info rk3399_isp_info = {
> > >         .features = RKISP1_FEATURE_MIPI_CSI2,
> > >  };
> > >
> > > +static const char * const imx8mp_isp_clks[] = {
> > > +       "isp",
> > > +       "hclk",
> > > +       "aclk",
> > > +};
> > > +
> > > +static const struct rkisp1_isr_data imx8mp_isp_isrs[] = {
> > > +       { NULL, rkisp1_isr },
> > > +};
> > > +
> > > +static const struct rkisp1_info imx8mp_isp_info = {
> > > +       .clks = imx8mp_isp_clks,
> > > +       .clk_size = ARRAY_SIZE(imx8mp_isp_clks),
> > > +       .isrs = imx8mp_isp_isrs,
> > > +       .isr_size = ARRAY_SIZE(imx8mp_isp_isrs),
> > > +       .isp_ver = IMX8MP_V10,
> > > +};
> > > +
> > >  static const struct of_device_id rkisp1_of_match[] = {
> > >         {
> > >                 .compatible = "rockchip,px30-cif-isp",
> > > @@ -505,6 +523,10 @@ static const struct of_device_id rkisp1_of_match[] = {
> > >                 .compatible = "rockchip,rk3399-cif-isp",
> > >                 .data = &rk3399_isp_info,
> > >         },
> > > +       {
> > > +               .compatible = "fsl,imx8mp-isp",
> > > +               .data = &imx8mp_isp_info,
> > > +       },
> > >         {},
> > >  };
> > >  MODULE_DEVICE_TABLE(of, rkisp1_of_match);
> > > diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
> > > index 583ca0d9a79d..40677d47825c 100644
> > > --- a/include/uapi/linux/rkisp1-config.h
> > > +++ b/include/uapi/linux/rkisp1-config.h
> > > @@ -140,12 +140,15 @@
> > >   * @RKISP1_V11: declared in the original vendor code, but not used
> > >   * @RKISP1_V12: used at least in rk3326 and px30
> > >   * @RKISP1_V13: used at least in rk1808
> > > + * @IMX8MP_V10: used in at least imx8mp
> > >   */
> > >  enum rkisp1_cif_isp_version {
> > >         RKISP1_V10 = 10,
> > >         RKISP1_V11,
> > >         RKISP1_V12,
> > >         RKISP1_V13,
> > > +       /* TODO Choose a better version for this */
> > > +       IMX8MP_V10,
> > >  };
> > >
> > >  enum rkisp1_cif_isp_histogram_mode {

-- 
Regards,

Laurent Pinchart
