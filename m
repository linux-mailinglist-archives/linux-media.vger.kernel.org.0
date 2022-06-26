Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4396F55B167
	for <lists+linux-media@lfdr.de>; Sun, 26 Jun 2022 13:07:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234347AbiFZLHp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Jun 2022 07:07:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234345AbiFZLHo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Jun 2022 07:07:44 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 528F9E029
        for <linux-media@vger.kernel.org>; Sun, 26 Jun 2022 04:07:43 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E6A4947C;
        Sun, 26 Jun 2022 13:07:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1656241660;
        bh=l5MwWhDeebXQoASP278Isyfeu3tY6emg+jOGo6Dfkcc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kD2NWrXX9B3rUaSes0mI09Dlb8d3kJpZegXAx+3M0KCc7Q7zQwbOAY51l+Fhk79/f
         gEf4nQTFnVicfHb9qua9GRQIDC+77NLIiDf4Ytn5EjvTCuubAdiXsvfXVh9SyTd/oF
         ztEDRHbKH6s8cIHU/3BPMZb2cp6IAAXeYCuBicy0=
Date:   Sun, 26 Jun 2022 14:07:22 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dafna Hirschfeld <dafna@fastmail.com>
Cc:     Paul Elder <paul.elder@ideasonboard.com>,
        linux-media@vger.kernel.org, heiko@sntech.de,
        jeanmichel.hautbois@ideasonboard.com, jacopo@jmondi.org,
        djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 48/55] media: rkisp1: Add match data for i.MX8MP ISP
Message-ID: <Yrg96r2vRewNpMFl@pendragon.ideasonboard.com>
References: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
 <20220614191127.3420492-49-paul.elder@ideasonboard.com>
 <Yq0NnksDldH1PDfp@pendragon.ideasonboard.com>
 <20220626040543.jswxbusyyydfoxfd@guri>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220626040543.jswxbusyyydfoxfd@guri>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Jun 26, 2022 at 07:05:43AM +0300, Dafna Hirschfeld wrote:
> On 18.06.2022 02:26, Laurent Pinchart wrote:
> > On Wed, Jun 15, 2022 at 04:11:20AM +0900, Paul Elder wrote:
> >> Add match data to the rkisp1 driver to match the i.MX8MP ISP.
> >>
> >> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> >> ---
> >>  .../platform/rockchip/rkisp1/rkisp1-dev.c     | 22 +++++++++++++++++++
> >>  include/uapi/linux/rkisp1-config.h            |  3 +++
> >>  2 files changed, 25 insertions(+)
> >>
> >> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> >> index 62fa2bd275fe..3a0115bdcee5 100644
> >> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> >> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> >> @@ -486,6 +486,24 @@ static const struct rkisp1_info rk3399_isp_info = {
> >>  	.features = RKISP1_FEATURE_MIPI_CSI2,
> >>  };
> >>
> >> +static const char * const imx8mp_isp_clks[] = {
> >> +	"isp",
> >> +	"hclk",
> >> +	"aclk",
> >> +};
> >> +
> >> +static const struct rkisp1_isr_data imx8mp_isp_isrs[] = {
> >> +	{ NULL, rkisp1_isr },
> >> +};
> >> +
> >> +static const struct rkisp1_info imx8mp_isp_info = {
> >> +	.clks = imx8mp_isp_clks,
> >> +	.clk_size = ARRAY_SIZE(imx8mp_isp_clks),
> >> +	.isrs = imx8mp_isp_isrs,
> >> +	.isr_size = ARRAY_SIZE(imx8mp_isp_isrs),
> >> +	.isp_ver = IMX8MP_V10,
> >> +};
> >> +
> >>  static const struct of_device_id rkisp1_of_match[] = {
> >>  	{
> >>  		.compatible = "rockchip,px30-cif-isp",
> >> @@ -495,6 +513,10 @@ static const struct of_device_id rkisp1_of_match[] = {
> >>  		.compatible = "rockchip,rk3399-cif-isp",
> >>  		.data = &rk3399_isp_info,
> >>  	},
> >> +	{
> >> +		.compatible = "fsl,imx8mp-isp",
> >> +		.data = &imx8mp_isp_info,
> >> +	},
> >>  	{},
> >>  };
> >>  MODULE_DEVICE_TABLE(of, rkisp1_of_match);
> >> diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
> >> index 583ca0d9a79d..40677d47825c 100644
> >> --- a/include/uapi/linux/rkisp1-config.h
> >> +++ b/include/uapi/linux/rkisp1-config.h
> >> @@ -140,12 +140,15 @@
> >>   * @RKISP1_V11: declared in the original vendor code, but not used
> >>   * @RKISP1_V12: used at least in rk3326 and px30
> >>   * @RKISP1_V13: used at least in rk1808
> >> + * @IMX8MP_V10: used in at least imx8mp
> >>   */
> >>  enum rkisp1_cif_isp_version {
> >>  	RKISP1_V10 = 10,
> >>  	RKISP1_V11,
> >>  	RKISP1_V12,
> >>  	RKISP1_V13,
> >> +	/* TODO Choose a better version for this */
> >> +	IMX8MP_V10,
> >
> > Time to address this ? :-)
> >
> > Does anyone know where the current versioning scheme come from ?
> 
> It was added by Heiko Stübner, basically trying to figure out the
> versions from the vedor code,
> see https://lore.kernel.org/all/20210121144407.9045-6-dafna.hirschfeld@collabora.com/

Is that public code ? Heiko, do you have any pointer to it ?

As far as I understand, this ISP IP has been forked, and is now
developed in parallel by Rockchip (for their own SoCs) and by
VeriSilicon (under the name of ISP8000Nano). The versioning schemes on
the two sides are different, and may have common roots. The fact that
the ISP8000Nano can be customized at synthesis time also complicates
this.

The question at hand is how to expose a single coherent versioning
scheme to userspace in this driver. The hardware has a version
identification register that we could use, but I don't know if it gives
us enough information (as in guaranteeing that the same version value
won't be used for different IP versions that would need to be
distinguished from each other in userspace). The fact that Rockchip and
VeriSilicon probably develop their own new versions without cooperating
increases the risk of collision.

We will also have to tackle the question of UABI. Newer ISP versions
will require extensions to the ISP parameters structure. The i.MX8MP has
extra processing blocks that are not supported by the driver today. One
option would be to duplicate the top-level rkisp1_params_cfg structure
per ISP version, as well as a set of lower-level structure where
appropriate (how to handle that easily and efficiently on the driver
side will be interesting to figure out). Another option is to only add
parameters to the end of the rkisp1_params_cfg structure, but I fear
that won't scale. We'll end up with a large structure where lots of data
will be irrelevant for any particular ISP version, and that will be
error-prone.

Comments and idea will be appreciated.

> >>  };
> >>
> >>  enum rkisp1_cif_isp_histogram_mode {

-- 
Regards,

Laurent Pinchart
