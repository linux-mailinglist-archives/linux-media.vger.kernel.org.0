Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88FC4675A10
	for <lists+linux-media@lfdr.de>; Fri, 20 Jan 2023 17:35:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230336AbjATQfA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Jan 2023 11:35:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230057AbjATQe6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Jan 2023 11:34:58 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E36E707ED
        for <linux-media@vger.kernel.org>; Fri, 20 Jan 2023 08:34:22 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <pza@pengutronix.de>)
        id 1pIuKH-0004MW-47; Fri, 20 Jan 2023 17:33:13 +0100
Received: from pza by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <pza@pengutronix.de>)
        id 1pIuKF-0005Ti-88; Fri, 20 Jan 2023 17:33:11 +0100
Date:   Fri, 20 Jan 2023 17:33:11 +0100
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Aishwarya Kothari <aishwaryakothari75@gmail.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, kernel@pengutronix.de,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        francesco.dolcini@toradex.com, marcel.ziswiler@toradex.com
Subject: Re: [PATCH] media: v4l2-async: fix binding async subdevs with
 multiple source ports
Message-ID: <20230120163311.GA15915@pengutronix.de>
References: <20220810104848.846783-1-p.zabel@pengutronix.de>
 <Y8afrhfjw+EhAH4o@paasikivi.fi.intel.com>
 <Y8aivWrN6Hg/O7Wr@pendragon.ideasonboard.com>
 <d45fa085-ce6f-2141-fba9-ac4e6094ef2a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d45fa085-ce6f-2141-fba9-ac4e6094ef2a@gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: pza@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Wed, Jan 18, 2023 at 02:14:54PM +0100, Aishwarya Kothari wrote:
[...]
> I stumbled over the commit 1f391df44607 ("media: v4l2-async: Use endpoints
> in __v4l2_async_nf_add_fwnode_remote()") and started this discussion :
> https://lore.kernel.org/linux-media/Y8AIRPd4RFYmssal@valkosipuli.retiisi.eu/
> 
> I applied this patch on top of the commit c1649ec55708.The hardware used is
> Apalis iMX6 (i.MX 6Q) with ov5640 mipi-csi2 camera.
> 
> The /dev/media0 is created and pipeline was configured using below script :
> root@apalis-imx6-10774951:~# cat ov5640.sh
> media-ctl -l "'ov5640 1-003c':0 -> 'imx6-mipi-csi2':0[1]"
> media-ctl -l "'imx6-mipi-csi2':2 -> 'ipu1_csi1':0[1]"
> media-ctl -l "'ipu1_csi1':2 -> 'ipu1_csi1 capture':0[1]"
> # Configure pads
> media-ctl -V "'ov5640 1-003c':0 [fmt:UYVY8_1X16/1920x1080 field:none]"
> media-ctl -V "'imx6-mipi-csi2':2 [fmt:UYVY8_1X16/1920x1080 field:none]"
> media-ctl -V "'ipu1_csi1':2 [fmt:UYVY8_1X16/1920x1080 field:none]"
> 
> But it gives the following error when trying to set up the pipeline:
> 
> [   37.211276] ipu1_csi1: entity ov5640 1-003c does not implement
> get_mbus_config()
> [   37.218872] ipu1_csi1: failed to get upstream media bus configuration
> 
> When adding the missing functionality as follows:
> 
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index e0f908af581b..618c677ec89b 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -3733,6 +3733,17 @@ static int ov5640_init_cfg(struct v4l2_subdev *sd,
>         return 0;
>  }
> 
> +static int ov5640_get_mbus_config(struct v4l2_subdev *sd,
> +                                  unsigned int pad,
> +                                  struct v4l2_mbus_config *cfg)
> +{
> +       cfg->type = V4L2_MBUS_CSI2_DPHY;
> +       cfg->bus.mipi_csi2.num_data_lanes = 1;

Isn't OV5640 dual-lane by default?

> +       cfg->bus.mipi_csi2.flags = 0;
> +
> +       return 0;
> +}
> +
>  static const struct v4l2_subdev_core_ops ov5640_core_ops = {
>         .log_status = v4l2_ctrl_subdev_log_status,
>         .subscribe_event = v4l2_ctrl_subdev_subscribe_event,
> @@ -3753,6 +3764,7 @@ static const struct v4l2_subdev_pad_ops ov5640_pad_ops
> = {
>         .get_selection = ov5640_get_selection,
>         .enum_frame_size = ov5640_enum_frame_size,
>         .enum_frame_interval = ov5640_enum_frame_interval,
> +       .get_mbus_config = ov5640_get_mbus_config,
>  };
> 
>  static const struct v4l2_subdev_ops ov5640_subdev_ops = {
> 
> The script was executed correctly without any errors and the links were
> created. Now when running the Gstreamer it gives the below output :
> 
> root@apalis-imx6-10774951:~# gst-launch-1.0 v4l2src device='/dev/video3' !
> videoconvert ! waylandsink
> Setting pipeline to PAUSED ...
> Pipeline is live and does not need PREROLL ...
> Pipeline is PREROLLED ...
> Setting pipeline to PLAYING ...
> New clock: GstSystemClock
> [  192.526110] imx6-mipi-csi2: LP-11 wait timeout, likely a sensor driver
> bug, expect capture failures.
> [  192.535550] imx6-mipi-csi2: phy_state = 0x00000200

This is timing out in the imx6-mipi-csi2 driver, waiting for OV5640 to
signal the LP-11 stop state on lane 0 (phy_state bit 4).

> [  192.833456] ov5640 1-003c: ov5640_write_reg: error: reg=3008, val=2

A write to the SYS_CTRL0 register failed, presumably trying to clear the
software reset or power down bits. Could this be the reason that OV5640
doesn't put the MIPI CSI-2 link into LP-11 as expected?

All further errors follow from the timeout above.

[...]
> While going through the dmesg kernel logs I found this :
> 
>     4.333202] imx6-mipi-csi2 21dc000.mipi: Consider updating driver
> imx6-mipi-csi2 to match on endpoints
> [    4.347001] imx6-mipi-csi2 21dc000.mipi: Consider updating driver
> imx6-mipi-csi2 to match on endpoints
> [    5.173588] video-mux 20e0000.iomuxc-gpr:ipu2_csi1_mux: Consider updating
> driver video-mux to match on endpoints

These shouldn't cause any issue. These drivers should be updated
to set the subdev->fwnode field to an endpoint fwnode before calling
v4l2_async_register_subdev().

regards
Philipp
