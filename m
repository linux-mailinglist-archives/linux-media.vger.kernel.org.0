Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 896E6577235
	for <lists+linux-media@lfdr.de>; Sun, 17 Jul 2022 01:11:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232574AbiGPXLE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 16 Jul 2022 19:11:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229619AbiGPXLD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 16 Jul 2022 19:11:03 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AE3E3AA;
        Sat, 16 Jul 2022 16:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658013062; x=1689549062;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hzULYEvoiu2+cjOVVPjIerySW8CycA9JilWDFs3+7lU=;
  b=XyGihDPCjv0+R/Rd56OWxdDjcAoPYws4NRj2Ttb7XtRyk0CxUeiHHqYS
   G+j55t6k3EzO/QNWX+jro+ABEoVcQVExj9xGuNXuoX4gOgWnK2kL1diDP
   qjIMKz23ezchWQ0gKFg8R7kePqO+yuPaDNWpxCCG6/0aqxFv+Zq7F5YFy
   XBClQF0qJB5vHu7u+nCJ0pZaRPaTZxflr4rSA9/c9Nve/pVJUwuIs6tbx
   mty4NZ4x27ZG2lsuR/nHvNhR/fChrNtvknRST79u8qN/KM5Og3g1erZnU
   K/8gt4HiyTQRKK280l7YKAZedyv/AuzWgdlOF+mZEePEp4uxU8q9hSVzG
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10410"; a="286034110"
X-IronPort-AV: E=Sophos;i="5.92,278,1650956400"; 
   d="scan'208";a="286034110"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2022 16:11:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,278,1650956400"; 
   d="scan'208";a="723463391"
Received: from lkp-server02.sh.intel.com (HELO ff137eb26ff1) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 16 Jul 2022 16:10:58 -0700
Received: from kbuild by ff137eb26ff1 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1oCqw5-0002Ho-TG;
        Sat, 16 Jul 2022 23:10:57 +0000
Date:   Sun, 17 Jul 2022 07:10:36 +0800
From:   kernel test robot <lkp@intel.com>
To:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, stanimir.varbanov@linaro.org,
        laurent.pinchart@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
        robh+dt@kernel.org, nicolas@ndufresne.ca,
        alexander.stein@ew.tq-group.com, ezequiel@vanguardiasur.com.ar
Cc:     kbuild-all@lists.01.org,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v8 5/6] media: dw100: Add i.MX8MP dw100 dewarper driver
Message-ID: <202207170714.QdpDmTNJ-lkp@intel.com>
References: <20220715135329.975400-6-xavier.roumegue@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220715135329.975400-6-xavier.roumegue@oss.nxp.com>
X-Spam-Status: No, score=-5.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PDS_OTHER_BAD_TLD,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Xavier,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on media-tree/master]
[also build test ERROR on linus/master v5.19-rc6 next-20220715]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xavier-Roumegue/i-MX8MP-DW100-dewarper-driver/20220716-222346
base:   git://linuxtv.org/media_tree.git master
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20220717/202207170714.QdpDmTNJ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/49c9ce2fbbca7da795c8b503c0af12f77fe8fc16
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Xavier-Roumegue/i-MX8MP-DW100-dewarper-driver/20220716-222346
        git checkout 49c9ce2fbbca7da795c8b503c0af12f77fe8fc16
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/media/platform/nxp/dw100/dw100.c: In function 'dw100_s_fmt':
>> drivers/media/platform/nxp/dw100/dw100.c:830:23: error: implicit declaration of function '__v4l2_ctrl_modify_dimensions'; did you mean '__v4l2_ctrl_modify_range'? [-Werror=implicit-function-declaration]
     830 |                 ret = __v4l2_ctrl_modify_dimensions(ctrl, dims);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                       __v4l2_ctrl_modify_range
   cc1: some warnings being treated as errors


vim +830 drivers/media/platform/nxp/dw100/dw100.c

   776	
   777	static int dw100_s_fmt(struct dw100_ctx *ctx, struct v4l2_format *f)
   778	{
   779		struct dw100_q_data *q_data;
   780		struct vb2_queue *vq;
   781	
   782		vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
   783		if (!vq)
   784			return -EINVAL;
   785	
   786		q_data = dw100_get_q_data(ctx, f->type);
   787		if (!q_data)
   788			return -EINVAL;
   789	
   790		if (vb2_is_busy(vq)) {
   791			dev_dbg(&ctx->dw_dev->pdev->dev, "%s queue busy\n", __func__);
   792			return -EBUSY;
   793		}
   794	
   795		q_data->fmt = dw100_find_format(f);
   796		q_data->pix_fmt = f->fmt.pix_mp;
   797		q_data->crop.top = 0;
   798		q_data->crop.left = 0;
   799		q_data->crop.width = f->fmt.pix_mp.width;
   800		q_data->crop.height = f->fmt.pix_mp.height;
   801	
   802		/* Propagate buffers encoding */
   803	
   804		if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
   805			struct dw100_q_data *dst_q_data =
   806				dw100_get_q_data(ctx,
   807						 V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
   808	
   809			dst_q_data->pix_fmt.colorspace = q_data->pix_fmt.colorspace;
   810			dst_q_data->pix_fmt.ycbcr_enc = q_data->pix_fmt.ycbcr_enc;
   811			dst_q_data->pix_fmt.quantization = q_data->pix_fmt.quantization;
   812			dst_q_data->pix_fmt.xfer_func = q_data->pix_fmt.xfer_func;
   813		}
   814	
   815		dev_dbg(&ctx->dw_dev->pdev->dev,
   816			"Setting format for type %u, wxh: %ux%u, fmt: %p4cc\n",
   817			f->type, q_data->pix_fmt.width, q_data->pix_fmt.height,
   818			&q_data->pix_fmt.pixelformat);
   819	
   820		if (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
   821			int ret;
   822			u32 dims[V4L2_CTRL_MAX_DIMS] = {};
   823			struct v4l2_ctrl *ctrl = ctx->ctrls[DW100_CTRL_DEWARPING_MAP];
   824	
   825			dims[0] = dw100_get_n_vertices_from_length(q_data->pix_fmt.width);
   826			dims[1] = dw100_get_n_vertices_from_length(q_data->pix_fmt.height);
   827	
   828			v4l2_ctrl_lock(ctrl);
   829			ctx->user_map_is_valid = false;
 > 830			ret = __v4l2_ctrl_modify_dimensions(ctrl, dims);
   831			v4l2_ctrl_unlock(ctrl);
   832	
   833			if (ret) {
   834				dev_err(&ctx->dw_dev->pdev->dev,
   835					"Modifying LUT dimensions failed with error %d\n",
   836					ret);
   837				return ret;
   838			}
   839		}
   840	
   841		return 0;
   842	}
   843	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
