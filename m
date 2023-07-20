Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FD2075B4C4
	for <lists+linux-media@lfdr.de>; Thu, 20 Jul 2023 18:44:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230246AbjGTQoN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jul 2023 12:44:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231458AbjGTQoH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jul 2023 12:44:07 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 203681986
        for <linux-media@vger.kernel.org>; Thu, 20 Jul 2023 09:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689871440; x=1721407440;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xoxtiQOAYTyfKEOYySyB8ypZEmhx2V3bvr/BCHgmWEw=;
  b=j5XK5Jak1S+js35r3kwgHpkQfjg+mtenlTdfNWIiQ4bt3dhqlIA1iu2E
   /0iEAARHSaZ/xnAbIh5ahACavoREEjIvYtOrP4A/f7MyKLnp7qxpFcg2/
   IkK95GJwAxH8TWDKj/gcNN6G1rmiZn4XCrNp+OMn+cV6NeqMrT8dIV3q8
   HgQ4hM0kHcbc2C0lndOtFuRIA6fhiQL0e74b2CHvOfgvqyGCs0G6MSZGK
   nCBBKk34o5rgI+GACj3p+OLlLNbLkE90ii9IKFrQSOA8lX3E+4houjRl9
   nY9+8DzMc9IuzUstR/wDO/LV2M57+YV703HATgA1fTFMpYd/UTGCuSCHC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="356783285"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; 
   d="scan'208";a="356783285"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 09:43:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="898376422"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; 
   d="scan'208";a="898376422"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 20 Jul 2023 09:43:55 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qMWkt-0006Hl-0R;
        Thu, 20 Jul 2023 16:43:55 +0000
Date:   Fri, 21 Jul 2023 00:43:48 +0800
From:   kernel test robot <lkp@intel.com>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Tim Harvey <tharvey@gateworks.com>
Cc:     oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] media: imx: imx7-media-csi: Fix applying format
 constraints
Message-ID: <202307210050.s7hfCvwG-lkp@intel.com>
References: <20230720074129.3680269-2-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230720074129.3680269-2-alexander.stein@ew.tq-group.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alexander,

kernel test robot noticed the following build warnings:

[auto build test WARNING on media-tree/master]
[also build test WARNING on linus/master v6.5-rc2 next-20230720]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Stein/media-imx-imx7-media-csi-Fix-applying-format-constraints/20230720-154426
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20230720074129.3680269-2-alexander.stein%40ew.tq-group.com
patch subject: [PATCH 2/2] media: imx: imx7-media-csi: Fix applying format constraints
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230721/202307210050.s7hfCvwG-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230721/202307210050.s7hfCvwG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307210050.s7hfCvwG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/nxp/imx7-media-csi.c: In function '__imx7_csi_video_try_fmt':
>> drivers/media/platform/nxp/imx7-media-csi.c:1120:13: warning: variable 'walign' set but not used [-Wunused-but-set-variable]
    1120 |         u32 walign;
         |             ^~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SM_GCC_8350
   Depends on [n]: COMMON_CLK [=y] && COMMON_CLK_QCOM [=m] && (ARM64 || COMPILE_TEST [=n])
   Selected by [m]:
   - SM_VIDEOCC_8350 [=m] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=m]
   WARNING: unmet direct dependencies detected for SM_GCC_8450
   Depends on [n]: COMMON_CLK [=y] && COMMON_CLK_QCOM [=m] && (ARM64 || COMPILE_TEST [=n])
   Selected by [m]:
   - SM_GPUCC_8450 [=m] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=m]
   - SM_VIDEOCC_8450 [=m] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=m]
   WARNING: unmet direct dependencies detected for SM_GCC_8550
   Depends on [n]: COMMON_CLK [=y] && COMMON_CLK_QCOM [=m] && (ARM64 || COMPILE_TEST [=n])
   Selected by [m]:
   - SM_GPUCC_8550 [=m] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=m]
   - SM_VIDEOCC_8550 [=m] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=m]


vim +/walign +1120 drivers/media/platform/nxp/imx7-media-csi.c

01ac6b7542872e drivers/staging/media/imx/imx7-media-csi.c  Laurent Pinchart 2022-05-09  1114  
e352833d32e693 drivers/staging/media/imx/imx7-media-csi.c  Laurent Pinchart 2022-05-09  1115  static const struct imx7_csi_pixfmt *
31959b981c231f drivers/staging/media/imx/imx7-media-csi.c  Laurent Pinchart 2022-05-09  1116  __imx7_csi_video_try_fmt(struct v4l2_pix_format *pixfmt,
31959b981c231f drivers/staging/media/imx/imx7-media-csi.c  Laurent Pinchart 2022-05-09  1117  			 struct v4l2_rect *compose)
01ac6b7542872e drivers/staging/media/imx/imx7-media-csi.c  Laurent Pinchart 2022-05-09  1118  {
e352833d32e693 drivers/staging/media/imx/imx7-media-csi.c  Laurent Pinchart 2022-05-09  1119  	const struct imx7_csi_pixfmt *cc;
bef1bb620ca693 drivers/media/platform/nxp/imx7-media-csi.c Alexander Stein  2023-04-19 @1120  	u32 walign;
01ac6b7542872e drivers/staging/media/imx/imx7-media-csi.c  Laurent Pinchart 2022-05-09  1121  
6f482c4729d904 drivers/media/platform/nxp/imx7-media-csi.c Alexander Stein  2023-04-19  1122  	if (compose) {
6f482c4729d904 drivers/media/platform/nxp/imx7-media-csi.c Alexander Stein  2023-04-19  1123  		compose->width = pixfmt->width;
6f482c4729d904 drivers/media/platform/nxp/imx7-media-csi.c Alexander Stein  2023-04-19  1124  		compose->height = pixfmt->height;
6f482c4729d904 drivers/media/platform/nxp/imx7-media-csi.c Alexander Stein  2023-04-19  1125  	}
6f482c4729d904 drivers/media/platform/nxp/imx7-media-csi.c Alexander Stein  2023-04-19  1126  
01ac6b7542872e drivers/staging/media/imx/imx7-media-csi.c  Laurent Pinchart 2022-05-09  1127  	/*
01ac6b7542872e drivers/staging/media/imx/imx7-media-csi.c  Laurent Pinchart 2022-05-09  1128  	 * Find the pixel format, default to the first supported format if not
01ac6b7542872e drivers/staging/media/imx/imx7-media-csi.c  Laurent Pinchart 2022-05-09  1129  	 * found.
01ac6b7542872e drivers/staging/media/imx/imx7-media-csi.c  Laurent Pinchart 2022-05-09  1130  	 */
2d35c1ff83c095 drivers/staging/media/imx/imx7-media-csi.c  Laurent Pinchart 2022-05-10  1131  	cc = imx7_csi_find_pixel_format(pixfmt->pixelformat);
01ac6b7542872e drivers/staging/media/imx/imx7-media-csi.c  Laurent Pinchart 2022-05-09  1132  	if (!cc) {
a1a60e7ac274dc drivers/staging/media/imx/imx7-media-csi.c  Laurent Pinchart 2022-05-10  1133  		pixfmt->pixelformat = IMX7_CSI_DEF_PIX_FORMAT;
2d35c1ff83c095 drivers/staging/media/imx/imx7-media-csi.c  Laurent Pinchart 2022-05-10  1134  		cc = imx7_csi_find_pixel_format(pixfmt->pixelformat);
01ac6b7542872e drivers/staging/media/imx/imx7-media-csi.c  Laurent Pinchart 2022-05-09  1135  	}
01ac6b7542872e drivers/staging/media/imx/imx7-media-csi.c  Laurent Pinchart 2022-05-09  1136  
6f482c4729d904 drivers/media/platform/nxp/imx7-media-csi.c Alexander Stein  2023-04-19  1137  	/*
bef1bb620ca693 drivers/media/platform/nxp/imx7-media-csi.c Alexander Stein  2023-04-19  1138  	 * The width alignment is 8 bytes as indicated by the
bef1bb620ca693 drivers/media/platform/nxp/imx7-media-csi.c Alexander Stein  2023-04-19  1139  	 * CSI_IMAG_PARA.IMAGE_WIDTH documentation. Convert it to pixels.
6f482c4729d904 drivers/media/platform/nxp/imx7-media-csi.c Alexander Stein  2023-04-19  1140  	 *
bef1bb620ca693 drivers/media/platform/nxp/imx7-media-csi.c Alexander Stein  2023-04-19  1141  	 * TODO: Implement configurable stride support.
6f482c4729d904 drivers/media/platform/nxp/imx7-media-csi.c Alexander Stein  2023-04-19  1142  	 */
bef1bb620ca693 drivers/media/platform/nxp/imx7-media-csi.c Alexander Stein  2023-04-19  1143  	walign = 8 * 8 / cc->bpp;
75ab3b3196c39c drivers/media/platform/nxp/imx7-media-csi.c Alexander Stein  2023-07-20  1144  	v4l2_apply_frmsize_constraints(&pixfmt->width, &pixfmt->height,
75ab3b3196c39c drivers/media/platform/nxp/imx7-media-csi.c Alexander Stein  2023-07-20  1145  				       &imx7_csi_frmsize_stepwise);
01ac6b7542872e drivers/staging/media/imx/imx7-media-csi.c  Laurent Pinchart 2022-05-09  1146  
6f482c4729d904 drivers/media/platform/nxp/imx7-media-csi.c Alexander Stein  2023-04-19  1147  	pixfmt->bytesperline = pixfmt->width * cc->bpp / 8;
6f482c4729d904 drivers/media/platform/nxp/imx7-media-csi.c Alexander Stein  2023-04-19  1148  	pixfmt->sizeimage = pixfmt->bytesperline * pixfmt->height;
79bb4c7df8af76 drivers/media/platform/nxp/imx7-media-csi.c Alexander Stein  2023-04-19  1149  	pixfmt->field = V4L2_FIELD_NONE;
01ac6b7542872e drivers/staging/media/imx/imx7-media-csi.c  Laurent Pinchart 2022-05-09  1150  
01ac6b7542872e drivers/staging/media/imx/imx7-media-csi.c  Laurent Pinchart 2022-05-09  1151  	return cc;
01ac6b7542872e drivers/staging/media/imx/imx7-media-csi.c  Laurent Pinchart 2022-05-09  1152  }
01ac6b7542872e drivers/staging/media/imx/imx7-media-csi.c  Laurent Pinchart 2022-05-09  1153  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
