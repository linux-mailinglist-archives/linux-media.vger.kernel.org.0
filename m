Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBD2F4DC142
	for <lists+linux-media@lfdr.de>; Thu, 17 Mar 2022 09:31:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231312AbiCQIcc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Mar 2022 04:32:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231297AbiCQIca (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Mar 2022 04:32:30 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD2A6196D55
        for <linux-media@vger.kernel.org>; Thu, 17 Mar 2022 01:31:13 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 412B6493;
        Thu, 17 Mar 2022 09:31:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647505871;
        bh=zckWkHxnQHSG9CY9FWrVavqbKhRpSzeNobeFaVXdGkY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=r+VR2yMWdA5zzd3LDHdRtmMQdp61iZ27KbYlTA+E1I+/io9Jp3IRdeFNGTjDhR5kH
         XJv8ZmJSltlDIi/nwXAPZxdDIO5JgwHPo3cIDvgyqvM4haCGt/s79ORgjp+x0sbG6i
         v27cnhdvSuHtIcT3+DsRUMnYmqP3A889MtSyi0mI=
Date:   Thu, 17 Mar 2022 10:30:54 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     kernel test robot <lkp@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        kbuild-all@lists.01.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-media@vger.kernel.org
Subject: Re: [linux-next:master 12222/13209] ERROR: modpost:
 "v4l2_subdev_link_validate" [drivers/media/platform/nxp/imx-mipi-csis.ko]
 undefined!
Message-ID: <YjLxvsxQNCxP8OwW@pendragon.ideasonboard.com>
References: <202203170501.AhqUekoF-lkp@intel.com>
 <20220317081943.imr6o6l5nyhoehxi@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220317081943.imr6o6l5nyhoehxi@uno.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Thu, Mar 17, 2022 at 09:19:43AM +0100, Jacopo Mondi wrote:
> Laurent, Mauro,
> 
>         I'm having a bit of troubles to get what's missing in the CSIS Kconfig
> 
> On Thu, Mar 17, 2022 at 05:31:13AM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   8a11187eb62b8b910d2c5484e1f5d160e8b11eb4
> > commit: 67d841549e43ddcfc8ecc75cf86df1c5b48fe007 [12222/13209] media: platform/*/Kconfig: make manufacturer menus more uniform
> > config: nios2-randconfig-r014-20220317 (https://download.01.org/0day-ci/archive/20220317/202203170501.AhqUekoF-lkp@intel.com/config)
> > compiler: nios2-linux-gcc (GCC) 11.2.0
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=67d841549e43ddcfc8ecc75cf86df1c5b48fe007
> >         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> >         git fetch --no-tags linux-next master
> >         git checkout 67d841549e43ddcfc8ecc75cf86df1c5b48fe007
> >         # save the config file to linux build tree
> >         mkdir build_dir
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=nios2 SHELL=/bin/bash
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> >
> > All errors (new ones prefixed by >>, old ones prefixed by <<):
> >
> > >> ERROR: modpost: "v4l2_subdev_link_validate" [drivers/media/platform/nxp/imx-mipi-csis.ko] undefined!
> > >> ERROR: modpost: "v4l2_subdev_get_fwnode_pad_1_to_1" [drivers/media/platform/nxp/imx-mipi-csis.ko] undefined!
> > >> ERROR: modpost: "v4l_bound_align_image" [drivers/media/platform/nxp/imx-mipi-csis.ko] undefined!
> > >> ERROR: modpost: "v4l2_async_register_subdev" [drivers/media/platform/nxp/imx-mipi-csis.ko] undefined!
> > >> ERROR: modpost: "v4l2_async_subdev_nf_register" [drivers/media/platform/nxp/imx-mipi-csis.ko] undefined!
> > >> ERROR: modpost: "__v4l2_async_nf_add_fwnode_remote" [drivers/media/platform/nxp/imx-mipi-csis.ko] undefined!
> > >> ERROR: modpost: "v4l2_fwnode_endpoint_parse" [drivers/media/platform/nxp/imx-mipi-csis.ko] undefined!
> > >> ERROR: modpost: "v4l2_async_nf_init" [drivers/media/platform/nxp/imx-mipi-csis.ko] undefined!
> > >> ERROR: modpost: "v4l2_subdev_init" [drivers/media/platform/nxp/imx-mipi-csis.ko] undefined!
> > >> ERROR: modpost: "v4l2_async_unregister_subdev" [drivers/media/platform/nxp/imx-mipi-csis.ko] undefined!
> > WARNING: modpost: suppressed 5 unresolved symbol warnings because there were too many)
> 
> The missing symbols here are from v4l2-subdev.c v4l2-async.c and
> v4l2-fwnode.c.
> 
> The CSIS Kconfig entry looks like this
> 
> # SPDX-License-Identifier: GPL-2.0-only
> 
> -------------------------------------------------------------------------------
> menuconfig VIDEO_IMX
> 	bool "V4L2 capture drivers for NXP i.MX devices"
> 	depends on ARCH_MXC || COMPILE_TEST
> 	depends on VIDEO_DEV && VIDEO_V4L2
> 	help
> 	  Say yes here to enable support for capture drivers on i.MX SoCs.
> 	  Support for the single SoC features are selectable in the sub-menu
> 	  options.
> 
> if VIDEO_IMX
> 
> config VIDEO_IMX_MIPI_CSIS
> 	tristate "MIPI CSI-2 CSIS receiver found on i.MX7 and i.MX8 models"
> 	select MEDIA_CONTROLLER
> 	select V4L2_FWNODE
> 	select VIDEO_V4L2_SUBDEV_API
> 	default n
> 	help
> 	  Video4Linux2 sub-device driver for the MIPI CSI-2 CSIS receiver
> 	  v3.3/v3.6.3 found on some i.MX7 and i.MX8 SoCs.
> 
> endif # VIDEO_IMX
> -------------------------------------------------------------------------------
> 
> The VIDEO_V4L2 dependency on the menu entry should make sure
> v4l2-subdev.c is selected
> 
> ------- drivers/media/v4l2-core/Makefile --------------
> 
> videodev-objs	:=	v4l2-dev.o v4l2-ioctl.o v4l2-device.o v4l2-fh.o \
> 			v4l2-event.o v4l2-subdev.o v4l2-common.o \
> 			v4l2-ctrls-core.o v4l2-ctrls-api.o \
> 			v4l2-ctrls-request.o v4l2-ctrls-defs.o
> 
> obj-$(CONFIG_VIDEO_V4L2) += videodev.o
> --------------------------------------------------------
> 
> and the driver selects V4L2_FWNODE and VIDEO_V4L2_SUBDEV_API.
> 
> I understand v4l2-async might be missing, but why are the other
> symbols not selected as it seems to me they should be ?
> 
> >
> > Kconfig warnings: (for reference only)
> >    WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
> >    Depends on MEDIA_SUPPORT && VIDEO_DEV && MEDIA_CONTROLLER
> 
> VIDEO_DEV is not selected in the config file used by the robot to
> generate this report,
> 
> CONFIG_MEDIA_SUPPORT=m
> # CONFIG_VIDEO_DEV is not set
> CONFIG_MEDIA_CONTROLLER=y
> 
> so in this case CSIS should not be selectable as the parent menuconfig
> should not be visible if !VIDEO_DEV ?

I think this is now fixed in the latest media tree, by

commit e4e92b9a6d86fe4122290e521f50d64dc1404a4c
Author: Mauro Carvalho Chehab <mchehab@kernel.org>
Date:   Sun Mar 13 07:25:46 2022 +0100

    media: Kconfig: cleanup VIDEO_DEV dependencies

> >    Selected by
> >    - VIDEO_IMX_MIPI_CSIS && MEDIA_SUPPORT && MEDIA_PLATFORM_SUPPORT && MEDIA_PLATFORM_DRIVERS
> >
> > ---
> > 0-DAY CI Kernel Test Service
> > https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

-- 
Regards,

Laurent Pinchart
