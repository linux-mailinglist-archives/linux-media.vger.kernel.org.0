Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31A292F9DD1
	for <lists+linux-media@lfdr.de>; Mon, 18 Jan 2021 12:17:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388871AbhARKrK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Jan 2021 05:47:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388307AbhARJ2Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Jan 2021 04:28:24 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BE0EC061573
        for <linux-media@vger.kernel.org>; Mon, 18 Jan 2021 01:27:40 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E75B82BB;
        Mon, 18 Jan 2021 10:27:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1610962059;
        bh=TdYT+A4Se1C9EwXIKCnQd/ef8sV86Nya2+7Z0vuBVyQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CvoPUiOmYULYS1rMKc0wQdN3TDNvUEOsKyARmcanDJEtpATCHlGFXw8fQXvb5Ncu+
         wVH73sCUQIFWcz5MjMecuOb9BZe21B9Shs6AYnjqAVCpl8Y61eewVLRyfzSWkGgYgK
         UJyR4Ic/jMruItCcy0NlBHIsjbrxatbMmBXvn/Lg=
Date:   Mon, 18 Jan 2021 11:27:23 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        helen.koike@collabora.com, linux-media@vger.kernel.org,
        mchehab@kernel.org, hverkuil@xs4all.nl,
        linux-rockchip@lists.infradead.org, ezequiel@collabora.com,
        christoph.muellner@theobroma-systems.com, tfiga@chromium.org
Subject: Re: [PATCH v4 2/3] media: rockchip: rkisp1: carry ip version
 information
Message-ID: <YAVUe+H0K/j7GROl@pendragon.ideasonboard.com>
References: <20210115163829.217131-1-heiko@sntech.de>
 <2867818.687JKscXgg@diego>
 <f67aadb1-0965-e2eb-6b50-842e548e0043@collabora.com>
 <2673307.AiC22s8V5E@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2673307.AiC22s8V5E@diego>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jan 18, 2021 at 10:21:40AM +0100, Heiko Stübner wrote:
> Am Montag, 18. Januar 2021, 10:19:41 CET schrieb Dafna Hirschfeld:
> > Am 15.01.21 um 21:29 schrieb Heiko Stübner:
> >> Am Freitag, 15. Januar 2021, 20:42:41 CET schrieb Laurent Pinchart:
> >>> On Fri, Jan 15, 2021 at 05:38:28PM +0100, Heiko Stuebner wrote:
> >>>> From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> >>>>
> >>>> The IP block evolved from its rk3288/rk3399 base and the vendor
> >>>> designates them with a numerical version. rk3399 for example
> >>>> is designated V10 probably meaning V1.0.
> >>>>
> >>>> There doesn't seem to be an actual version register we could read that
> >>>> information from, so allow the match_data to carry that information
> >>>> for future differentiation.
> >>>>
> >>>> Also carry that information in the hw_revision field of the media-
> >>>> controller API, so that userspace also has access to that.
> >>>>
> >>>> The added versions are:
> >>>> - V10: at least rk3288 + rk3399
> >>>> - V11: seemingly unused as of now, but probably appeared in some soc
> >>>> - V12: at least rk3326 + px30
> >>>> - V13: at least rk1808
> >>>
> >>> In addition to changes to the ISP itself, are there changes in how it is
> >>> integrated in the system, in particular in how it is connected to CSI-2
> >>> receivers ?
> >> 
> >> Hooking up my camera on the px30 was pretty straightforward.
> >> As you can see in [0] the actual csi-phy block is different, but structurally
> >> everything else stayed the same and the px30 series merely accounts
> >> for some isp-specific changes, like the split interrupts and the V12-specific
> >> parts.
> >> 
> >>> Do all the above SoCs have two ISP instances ?
> >> 
> >> Nope, I think only the rk3399 has two ISPs.
> >> 
> >> All others only seem to have one instance and maybe an additional more
> >> simple video input processor. (like the rk3288 has both an ISP and something
> >> called VIP - a simpler block)
> >> 
> >> Similar is the rk3326/px30 (same soc) which has an ISP as well as a VIP that
> >> Maxime Chevallier is working on [1]
> >> 
> >> Heiko
> >> 
> >> [0] https://lore.kernel.org/linux-media/20210108193311.3423236-1-heiko@sntech.de/
> >> [1] https://lore.kernel.org/linux-devicetree/20201229161724.511102-1-maxime.chevallier@bootlin.com/
> >> 
> >>>> Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> >>>> Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
> >>>> ---
> >>>>   Documentation/admin-guide/media/rkisp1.rst    | 16 ++++++++++++++
> >>>>   .../platform/rockchip/rkisp1/rkisp1-dev.c     | 21 +++++++++++--------
> >>>>   include/uapi/linux/rkisp1-config.h            | 16 ++++++++++++++
> >>>>   3 files changed, 44 insertions(+), 9 deletions(-)
> >>>>
> >>>> diff --git a/Documentation/admin-guide/media/rkisp1.rst b/Documentation/admin-guide/media/rkisp1.rst
> >>>> index 2267e4fb475e..ccf418713623 100644
> >>>> --- a/Documentation/admin-guide/media/rkisp1.rst
> >>>> +++ b/Documentation/admin-guide/media/rkisp1.rst
> >>>> @@ -13,6 +13,22 @@ This file documents the driver for the Rockchip ISP1 that is part of RK3288
> >>>>   and RK3399 SoCs. The driver is located under drivers/staging/media/rkisp1
> >>>>   and uses the Media-Controller API.
> >>>>   
> >>>> +Revisions
> >>>> +=========
> >>>> +
> >>>> +There exist multiple smaller revisions to this ISP that got introduced in
> >>>> +later SoCs. Revisions can be found in the enum :c:type:`rkisp1_cif_isp_version`
> >>>> +in the UAPI and the revision of the ISP inside the running SoC can be read
> >>>> +in the field hw_revision of struct media_device_info as returned by
> >>>> +ioctl MEDIA_IOC_DEVICE_INFO.
> >>>> +
> >>>> +Versions in use are:
> >>>> +
> >>>> +- RKISP1_V10: used at least in rk3288 and rk3399
> >>>> +- RKISP1_V11: declared in the original vendor code, but not used
> >>>> +- RKISP1_V12: used at least in rk3326 and px30
> >>>> +- RKISP1_V13: used at least in rk1808
> >>>> +
> >>>>   Topology
> >>>>   ========
> >>>>   .. _rkisp1_topology_graph:
> >>>> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> >>>> index 68da1eed753d..f7e9fd305548 100644
> >>>> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> >>>> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> >>>> @@ -104,6 +104,7 @@
> >>>>   struct rkisp1_match_data {
> >>>>   	const char * const *clks;
> >>>>   	unsigned int size;
> >>>> +	enum rkisp1_cif_isp_version isp_ver;
> >>>>   };
> >>>>   
> >>>>   /* ----------------------------------------------------------------------------
> >>>> @@ -411,15 +412,16 @@ static const char * const rk3399_isp_clks[] = {
> >>>>   	"hclk",
> >>>>   };
> >>>>   
> >>>> -static const struct rkisp1_match_data rk3399_isp_clk_data = {
> >>>> +static const struct rkisp1_match_data rk3399_isp_match_data = {
> >>>>   	.clks = rk3399_isp_clks,
> >>>>   	.size = ARRAY_SIZE(rk3399_isp_clks),
> >>>> +	.isp_ver = RKISP1_V10,
> >>>>   };
> >>>>   
> >>>>   static const struct of_device_id rkisp1_of_match[] = {
> >>>>   	{
> >>>>   		.compatible = "rockchip,rk3399-cif-isp",
> >>>> -		.data = &rk3399_isp_clk_data,
> >>>> +		.data = &rk3399_isp_match_data,
> >>>>   	},
> >>>>   	{},
> >>>>   };
> >>>> @@ -457,15 +459,15 @@ static void rkisp1_debug_init(struct rkisp1_device *rkisp1)
> >>>>   
> >>>>   static int rkisp1_probe(struct platform_device *pdev)
> >>>>   {
> >>>> -	const struct rkisp1_match_data *clk_data;
> >>>> +	const struct rkisp1_match_data *match_data;
> >>>>   	struct device *dev = &pdev->dev;
> >>>>   	struct rkisp1_device *rkisp1;
> >>>>   	struct v4l2_device *v4l2_dev;
> >>>>   	unsigned int i;
> >>>>   	int ret, irq;
> >>>>   
> >>>> -	clk_data = of_device_get_match_data(&pdev->dev);
> >>>> -	if (!clk_data)
> >>>> +	match_data = of_device_get_match_data(&pdev->dev);
> >>>> +	if (!match_data)
> >>>>   		return -ENODEV;
> >>>>   
> >>>>   	rkisp1 = devm_kzalloc(dev, sizeof(*rkisp1), GFP_KERNEL);
> >>>> @@ -494,15 +496,16 @@ static int rkisp1_probe(struct platform_device *pdev)
> >>>>   
> >>>>   	rkisp1->irq = irq;
> >>>>   
> >>>> -	for (i = 0; i < clk_data->size; i++)
> >>>> -		rkisp1->clks[i].id = clk_data->clks[i];
> >>>> -	ret = devm_clk_bulk_get(dev, clk_data->size, rkisp1->clks);
> >>>> +	for (i = 0; i < match_data->size; i++)
> >>>> +		rkisp1->clks[i].id = match_data->clks[i];
> >>>> +	ret = devm_clk_bulk_get(dev, match_data->size, rkisp1->clks);
> >>>>   	if (ret)
> >>>>   		return ret;
> >>>> -	rkisp1->clk_size = clk_data->size;
> >>>> +	rkisp1->clk_size = match_data->size;
> >>>>   
> >>>>   	pm_runtime_enable(&pdev->dev);
> >>>>   
> >>>> +	rkisp1->media_dev.hw_revision = match_data->isp_ver;
> >>>>   	strscpy(rkisp1->media_dev.model, RKISP1_DRIVER_NAME,
> >>>>   		sizeof(rkisp1->media_dev.model));
> >>>>   	rkisp1->media_dev.dev = &pdev->dev;
> >>>> diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
> >>>> index ba443771cc0b..9fecb6bc457d 100644
> >>>> --- a/include/uapi/linux/rkisp1-config.h
> >>>> +++ b/include/uapi/linux/rkisp1-config.h
> >>>> @@ -124,6 +124,22 @@
> >>>>   #define RKISP1_CIF_ISP_STAT_AFM           (1U << 2)
> >>>>   #define RKISP1_CIF_ISP_STAT_HIST          (1U << 3)
> >>>>   
> >>>> +
> >>>> +/**
> >>>> + * enum rkisp1_cif_isp_version - ISP variants
> >>>> + *
> >>>> + * @RKISP1_V10: used at least in rk3288 and rk3399
> >>>> + * @RKISP1_V11: declared in the original vendor code, but not used
> >>>> + * @RKISP1_V12: used at least in rk3326 and px30
> >>>> + * @RKISP1_V13: used at least in rk1808
> >>>> + */
> >>>> +enum rkisp1_cif_isp_version {
> >>>> +	RKISP1_V10 = 0,
> > 
> > I wonder if it is useful to start the enum with:
> > RKISP1_V10 = 10,
> > 
> > So when printing the hw revision it always prints a positive number.
> 
> makes sense ... also if userspace prints the value somewhere, it's
> readable without knowing the constants - will change with the v5
> I'm preparing.

It's also useful for userspace to differenciate between 0 = RKISP1_V10
and 0 = older driver that doesn't set the version.

-- 
Regards,

Laurent Pinchart
