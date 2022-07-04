Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61614565279
	for <lists+linux-media@lfdr.de>; Mon,  4 Jul 2022 12:36:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233862AbiGDKgg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Jul 2022 06:36:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233477AbiGDKgf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Jul 2022 06:36:35 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4917AE0CB
        for <linux-media@vger.kernel.org>; Mon,  4 Jul 2022 03:36:34 -0700 (PDT)
Received: from pyrite.rasen.tech (softbank036240127029.bbtec.net [36.240.127.29])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 65A1C735;
        Mon,  4 Jul 2022 12:36:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1656930991;
        bh=4HYhwVxv0cO37GEKoq6/N1bKLFEbQ4Ole4I76e5nS1A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UbM3hwG8ZlpUCE4Qvw5H8dV7gfaBOaCScwbI7ynXonyN0ihNcm87F70NyaRMY9/6t
         +7vcz3AAr5nEKxE+LRLQ4K3wm9rtIowiDtmnNcsbzF4jCY1L6YuoW3o2Sx3Dn8NALo
         uH0GK01Qfw8uvL6jsjoNEIiZRYieN8yo3EkGo6wo=
Date:   Mon, 4 Jul 2022 19:36:21 +0900
From:   paul.elder@ideasonboard.com
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Dafna Hirschfeld <dafna@fastmail.com>, linux-media@vger.kernel.org,
        heiko@sntech.de, jeanmichel.hautbois@ideasonboard.com,
        jacopo@jmondi.org, djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 48/55] media: rkisp1: Add match data for i.MX8MP ISP
Message-ID: <20220704103621.GD3886060@pyrite.rasen.tech>
References: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
 <20220614191127.3420492-49-paul.elder@ideasonboard.com>
 <Yq0NnksDldH1PDfp@pendragon.ideasonboard.com>
 <20220626040543.jswxbusyyydfoxfd@guri>
 <Yrg96r2vRewNpMFl@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yrg96r2vRewNpMFl@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On Sun, Jun 26, 2022 at 02:07:22PM +0300, Laurent Pinchart wrote:
> On Sun, Jun 26, 2022 at 07:05:43AM +0300, Dafna Hirschfeld wrote:
> > On 18.06.2022 02:26, Laurent Pinchart wrote:
> > > On Wed, Jun 15, 2022 at 04:11:20AM +0900, Paul Elder wrote:
> > >> Add match data to the rkisp1 driver to match the i.MX8MP ISP.
> > >>
> > >> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> > >> ---
> > >>  .../platform/rockchip/rkisp1/rkisp1-dev.c     | 22 +++++++++++++++++++
> > >>  include/uapi/linux/rkisp1-config.h            |  3 +++
> > >>  2 files changed, 25 insertions(+)
> > >>
> > >> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > >> index 62fa2bd275fe..3a0115bdcee5 100644
> > >> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > >> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > >> @@ -486,6 +486,24 @@ static const struct rkisp1_info rk3399_isp_info = {
> > >>  	.features = RKISP1_FEATURE_MIPI_CSI2,
> > >>  };
> > >>
> > >> +static const char * const imx8mp_isp_clks[] = {
> > >> +	"isp",
> > >> +	"hclk",
> > >> +	"aclk",
> > >> +};
> > >> +
> > >> +static const struct rkisp1_isr_data imx8mp_isp_isrs[] = {
> > >> +	{ NULL, rkisp1_isr },
> > >> +};
> > >> +
> > >> +static const struct rkisp1_info imx8mp_isp_info = {
> > >> +	.clks = imx8mp_isp_clks,
> > >> +	.clk_size = ARRAY_SIZE(imx8mp_isp_clks),
> > >> +	.isrs = imx8mp_isp_isrs,
> > >> +	.isr_size = ARRAY_SIZE(imx8mp_isp_isrs),
> > >> +	.isp_ver = IMX8MP_V10,
> > >> +};
> > >> +
> > >>  static const struct of_device_id rkisp1_of_match[] = {
> > >>  	{
> > >>  		.compatible = "rockchip,px30-cif-isp",
> > >> @@ -495,6 +513,10 @@ static const struct of_device_id rkisp1_of_match[] = {
> > >>  		.compatible = "rockchip,rk3399-cif-isp",
> > >>  		.data = &rk3399_isp_info,
> > >>  	},
> > >> +	{
> > >> +		.compatible = "fsl,imx8mp-isp",
> > >> +		.data = &imx8mp_isp_info,
> > >> +	},
> > >>  	{},
> > >>  };
> > >>  MODULE_DEVICE_TABLE(of, rkisp1_of_match);
> > >> diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
> > >> index 583ca0d9a79d..40677d47825c 100644
> > >> --- a/include/uapi/linux/rkisp1-config.h
> > >> +++ b/include/uapi/linux/rkisp1-config.h
> > >> @@ -140,12 +140,15 @@
> > >>   * @RKISP1_V11: declared in the original vendor code, but not used
> > >>   * @RKISP1_V12: used at least in rk3326 and px30
> > >>   * @RKISP1_V13: used at least in rk1808
> > >> + * @IMX8MP_V10: used in at least imx8mp
> > >>   */
> > >>  enum rkisp1_cif_isp_version {
> > >>  	RKISP1_V10 = 10,
> > >>  	RKISP1_V11,
> > >>  	RKISP1_V12,
> > >>  	RKISP1_V13,
> > >> +	/* TODO Choose a better version for this */
> > >> +	IMX8MP_V10,
> > >
> > > Time to address this ? :-)
> > >
> > > Does anyone know where the current versioning scheme come from ?
> > 
> > It was added by Heiko Stübner, basically trying to figure out the
> > versions from the vedor code,
> > see https://lore.kernel.org/all/20210121144407.9045-6-dafna.hirschfeld@collabora.com/
> 
> Is that public code ? Heiko, do you have any pointer to it ?
> 
> As far as I understand, this ISP IP has been forked, and is now
> developed in parallel by Rockchip (for their own SoCs) and by
> VeriSilicon (under the name of ISP8000Nano). The versioning schemes on
> the two sides are different, and may have common roots. The fact that
> the ISP8000Nano can be customized at synthesis time also complicates
> this.
> 
> The question at hand is how to expose a single coherent versioning
> scheme to userspace in this driver. The hardware has a version
> identification register that we could use, but I don't know if it gives
> us enough information (as in guaranteeing that the same version value
> won't be used for different IP versions that would need to be
> distinguished from each other in userspace). The fact that Rockchip and
> VeriSilicon probably develop their own new versions without cooperating
> increases the risk of collision.
> 
> We will also have to tackle the question of UABI. Newer ISP versions
> will require extensions to the ISP parameters structure. The i.MX8MP has
> extra processing blocks that are not supported by the driver today. One
> option would be to duplicate the top-level rkisp1_params_cfg structure
> per ISP version, as well as a set of lower-level structure where
> appropriate (how to handle that easily and efficiently on the driver
> side will be interesting to figure out). Another option is to only add
> parameters to the end of the rkisp1_params_cfg structure, but I fear
> that won't scale. We'll end up with a large structure where lots of data
> will be irrelevant for any particular ISP version, and that will be
> error-prone.
> 
> Comments and idea will be appreciated.

Thinking out loud:

The most sure way is clearly to have feature flags for each feature.
Maybe one set of internal ones that only affect the driver, and another
set for userspace to see what the hardware is capable of. On the other
hand, from the top of my head, the ones that userspace cares about could
be probed in other ways, like the presence of the self path can be
obtained from the media graph, and available controls/formats from...
the list of available controls/formats.

Also if we have flags then... what's the point of the version number? Is
there any value in letting userspace know some version number if it
doesn't particularly correlate with the actual features that are
available? Plus, we run the risk of version numbers (from the version
register) colliding between VeriSilicon and Rockchip. Plus my
understanding is that the current version number that we have right now
(V10 ~ V13) is fairly arbitrary anyway? (but we have to keep it for
compatibility reasons.)

So...

1 - Do we need a precise version number for the purpose of probing
capabilities? Can it just be replaced with feature flags?
2 - Do we need feature flags? Can all information (that userspace cares
about be obtained by some other source? (I guess this needs more
investigation)
3 - Maybe userspace doesn't care about the precise version number at
all? We could just continue with an aribitrary version number (like
IMX_V10)?
4 - Or we could just expand the version number with what we get from the
version register? And have different... labels (?) based on the vendor?

Lots of thinking out loud with no clear conclusion :D


Paul

> 
> > >>  };
> > >>
> > >>  enum rkisp1_cif_isp_histogram_mode {
