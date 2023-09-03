Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89391790E28
	for <lists+linux-media@lfdr.de>; Sun,  3 Sep 2023 23:21:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348476AbjICVVx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 3 Sep 2023 17:21:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229495AbjICVVx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 3 Sep 2023 17:21:53 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6719AE5;
        Sun,  3 Sep 2023 14:21:49 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213.211-177-91.adsl-dyn.isp.belgacom.be [91.177.211.213])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 96B8716C6;
        Sun,  3 Sep 2023 23:20:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1693776021;
        bh=ffNpebL5OHY9KK9uB5GFoD3Et558XBYASnrccXM+dno=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jDBN4qm6LbFWdvAie9nafJFE0Lv82hcNjLDY+5gW0yIlOaU5xJJS4z+zmbo61WODk
         xZWUSnkIgoWu6qHSO5If1+V6b7+zxaIN/nE5mqFvmzxUUAXtKMx+G7ExFx/LcR6uxa
         fw9+bWND/oCDEOAUVFMuuLKKPuo8UA4zahuREs50=
Date:   Mon, 4 Sep 2023 00:21:58 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Umang Jain <umang.jain@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        oe-kbuild-all@lists.linux.dev,
        Lee Jackson <lee.jackson@arducam.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Shawn Tu <shawnx.tu@intel.com>,
        Nicholas Roth <nicholas@rothemail.net>,
        Mikhail Rudenko <mike.rudenko@gmail.com>,
        kieran.bingham@ideasonboard.com,
        Marco Felsch <m.felsch@pengutronix.de>,
        jacopo.mondi@ideasonboard.com
Subject: Re: [PATCH 2/2] media: i2c: imx519: Support for the Sony IMX519
 sensor
Message-ID: <20230903212158.GF13794@pendragon.ideasonboard.com>
References: <20230727154108.308320-3-umang.jain@ideasonboard.com>
 <202307281538.bqZ5kcV9-lkp@intel.com>
 <1070170e-830c-4752-bad5-8f653ebd80a4@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1070170e-830c-4752-bad5-8f653ebd80a4@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Umang,

On Fri, Jul 28, 2023 at 01:47:36PM +0530, Umang Jain wrote:
> On 7/28/23 12:56 PM, kernel test robot wrote:
> > Hi Umang,
> >
> > kernel test robot noticed the following build errors:
> >
> > [auto build test ERROR on media-tree/master]
> > [also build test ERROR on soc/for-next linus/master v6.5-rc3 next-20230727]
> > [cannot apply to sailus-media-tree/streams]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Umang-Jain/media-dt-bindings-imx519-Add-IMX519-DT-bindings/20230727-234440
> > base:   git://linuxtv.org/media_tree.git master
> > patch link:    https://lore.kernel.org/r/20230727154108.308320-3-umang.jain%40ideasonboard.com
> > patch subject: [PATCH 2/2] media: i2c: imx519: Support for the Sony IMX519 sensor
> > config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230728/202307281538.bqZ5kcV9-lkp@intel.com/config)
> > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> > reproduce: (https://download.01.org/0day-ci/archive/20230728/202307281538.bqZ5kcV9-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202307281538.bqZ5kcV9-lkp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> >     drivers/media/i2c/imx519.c: In function 'imx519_open':
> >>> drivers/media/i2c/imx519.c:1170:30: error: 'MEDIA_BUS_FMT_SENSOR_DATA' undeclared (first use in this function)
> 
> This comes from the bcm2835-unicam for Rpi's that's being worked upon. 
> And I was testing this driver on top of it.

Please base the next version on top of Sakari's metadata series, provide
a branch with your patches and all dependencies in the cover letter, and
use the --base argument to git-format-patch to indicate the base
clearly.

> >      1170 |         try_fmt_meta->code = MEDIA_BUS_FMT_SENSOR_DATA;
> >           |                              ^~~~~~~~~~~~~~~~~~~~~~~~~
> >     drivers/media/i2c/imx519.c:1170:30: note: each undeclared identifier is reported only once for each function it appears in
> >     drivers/media/i2c/imx519.c: In function 'imx519_enum_mbus_code':
> >     drivers/media/i2c/imx519.c:1319:30: error: 'MEDIA_BUS_FMT_SENSOR_DATA' undeclared (first use in this function)
> >      1319 |                 code->code = MEDIA_BUS_FMT_SENSOR_DATA;
> >           |                              ^~~~~~~~~~~~~~~~~~~~~~~~~
> >     drivers/media/i2c/imx519.c: In function 'imx519_enum_frame_size':
> >     drivers/media/i2c/imx519.c:1346:34: error: 'MEDIA_BUS_FMT_SENSOR_DATA' undeclared (first use in this function)
> >      1346 |                 if (fse->code != MEDIA_BUS_FMT_SENSOR_DATA || fse->index > 0)
> >           |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~
> >     drivers/media/i2c/imx519.c: In function 'imx519_update_metadata_pad_format':
> >     drivers/media/i2c/imx519.c:1382:28: error: 'MEDIA_BUS_FMT_SENSOR_DATA' undeclared (first use in this function)
> >      1382 |         fmt->format.code = MEDIA_BUS_FMT_SENSOR_DATA;
> >           |                            ^~~~~~~~~~~~~~~~~~~~~~~~~
> >     drivers/media/i2c/imx519.c: In function 'imx519_get_pad_format':
> >     drivers/media/i2c/imx519.c:1404:33: error: 'MEDIA_BUS_FMT_SENSOR_DATA' undeclared (first use in this function)
> >      1404 |                                 MEDIA_BUS_FMT_SENSOR_DATA;
> >           |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~
> >
> >
> > vim +/MEDIA_BUS_FMT_SENSOR_DATA +1170 drivers/media/i2c/imx519.c
> >
> >    1149	
> >    1150	static int imx519_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> >    1151	{
> >    1152		struct imx519 *imx519 = to_imx519(sd);
> >    1153		struct v4l2_mbus_framefmt *try_fmt_img =
> >    1154			v4l2_subdev_get_try_format(sd, fh->state, IMAGE_PAD);
> >    1155		struct v4l2_mbus_framefmt *try_fmt_meta =
> >    1156			v4l2_subdev_get_try_format(sd, fh->state, METADATA_PAD);
> >    1157		struct v4l2_rect *try_crop;
> >    1158	
> >    1159		mutex_lock(&imx519->mutex);
> >    1160	
> >    1161		/* Initialize try_fmt for the image pad */
> >    1162		try_fmt_img->width = supported_modes_10bit[0].width;
> >    1163		try_fmt_img->height = supported_modes_10bit[0].height;
> >    1164		try_fmt_img->code = imx519_get_format_code(imx519);
> >    1165		try_fmt_img->field = V4L2_FIELD_NONE;
> >    1166	
> >    1167		/* Initialize try_fmt for the embedded metadata pad */
> >    1168		try_fmt_meta->width = IMX519_EMBEDDED_LINE_WIDTH;
> >    1169		try_fmt_meta->height = IMX519_NUM_EMBEDDED_LINES;
> >> 1170		try_fmt_meta->code = MEDIA_BUS_FMT_SENSOR_DATA;
> >    1171		try_fmt_meta->field = V4L2_FIELD_NONE;
> >    1172	
> >    1173		/* Initialize try_crop */
> >    1174		try_crop = v4l2_subdev_get_try_crop(sd, fh->state, IMAGE_PAD);
> >    1175		try_crop->left = IMX519_PIXEL_ARRAY_LEFT;
> >    1176		try_crop->top = IMX519_PIXEL_ARRAY_TOP;
> >    1177		try_crop->width = IMX519_PIXEL_ARRAY_WIDTH;
> >    1178		try_crop->height = IMX519_PIXEL_ARRAY_HEIGHT;
> >    1179	
> >    1180		mutex_unlock(&imx519->mutex);
> >    1181	
> >    1182		return 0;
> >    1183	}
> >    1184	

-- 
Regards,

Laurent Pinchart
