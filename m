Return-Path: <linux-media+bounces-2037-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8E180B1F8
	for <lists+linux-media@lfdr.de>; Sat,  9 Dec 2023 05:06:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A1481C20A46
	for <lists+linux-media@lfdr.de>; Sat,  9 Dec 2023 04:06:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FB4915B5;
	Sat,  9 Dec 2023 04:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BRqO7oFL"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E813E10F8;
	Fri,  8 Dec 2023 20:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702094754; x=1733630754;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yoX7G71dBc3ilXiJ6HSl5MYXlWSuv39nmPLE4s0uJdU=;
  b=BRqO7oFLtATEzr9XJUWkEyvaLEWkCHk6YgNePA33nzuqSz5N38mS+4PS
   MPT/5lVyDsu4oWix+B+/hSA6XmBv9Huxo4hlNjy5BLtWjptUY1AJdQTFH
   k9KPkdABhVba08w1pnzde2erxDXcGPod21VYOEiukYgXXKcBxzuhIOn5u
   ymMzZcqLiEP/dZhBcjBwNgExzGyNNL7cqjOPXWP02BDr5EuwVrbwoXeKj
   7bK4zK7rB9wJ+KLdxypUzlorjAt0AVeOJqHDNn7Kutsxkmxbfk9cN48ib
   JTghmxowjw7jtLAm9FEtkug9qG0u3KtZejYMJ2Rh5FHF4ZUEWscw5xMm6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="458808769"
X-IronPort-AV: E=Sophos;i="6.04,262,1695711600"; 
   d="scan'208";a="458808769"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2023 20:05:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="748562107"
X-IronPort-AV: E=Sophos;i="6.04,262,1695711600"; 
   d="scan'208";a="748562107"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 08 Dec 2023 20:05:52 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBob8-000Emn-1F;
	Sat, 09 Dec 2023 04:05:50 +0000
Date: Sat, 9 Dec 2023 12:05:27 +0800
From: kernel test robot <lkp@intel.com>
To: Julien Massot <julien.massot@collabora.com>, devicetree@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, kernel@collabora.com,
	Julien Massot <julien.massot@collabora.com>
Subject: Re: [PATCH v2 4/4] media: i2c: add MAX96717 driver
Message-ID: <202312091123.dCDq07Qy-lkp@intel.com>
References: <20231208143359.469049-5-julien.massot@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231208143359.469049-5-julien.massot@collabora.com>

Hi Julien,

kernel test robot noticed the following build warnings:

[auto build test WARNING on media-tree/master]
[also build test WARNING on linuxtv-media-stage/master linus/master v6.7-rc4 next-20231208]
[cannot apply to sailus-media-tree/streams]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Julien-Massot/dt-bindings-media-add-Maxim-MAX96714F-GMSL2-Deserializer/20231208-223758
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20231208143359.469049-5-julien.massot%40collabora.com
patch subject: [PATCH v2 4/4] media: i2c: add MAX96717 driver
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20231209/202312091123.dCDq07Qy-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231209/202312091123.dCDq07Qy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312091123.dCDq07Qy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/i2c/max96717.c: In function 'max96717_set_fmt':
>> drivers/media/i2c/max96717.c:332:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     332 |         int ret;
         |             ^~~
   drivers/media/i2c/max96717.c: In function 'max96717_clk_set_rate':
   drivers/media/i2c/max96717.c:697:15: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
     697 |         val = FIELD_PREP(REFGEN_PREDEF_FREQ_MASK,
         |               ^~~~~~~~~~
   drivers/media/i2c/max96717.c: In function 'max96717_init_csi_lanes':
   drivers/media/i2c/max96717.c:804:12: warning: 'ret' is used uninitialized [-Wuninitialized]
     804 |         if (ret)
         |            ^
   drivers/media/i2c/max96717.c:798:13: note: 'ret' was declared here
     798 |         int ret;
         |             ^~~
   cc1: some warnings being treated as errors


vim +/ret +332 drivers/media/i2c/max96717.c

   325	
   326	static int max96717_set_fmt(struct v4l2_subdev *sd,
   327				    struct v4l2_subdev_state *state,
   328				    struct v4l2_subdev_format *format)
   329	{
   330		struct max96717_priv *priv = sd_to_max96717(sd);
   331		struct v4l2_mbus_framefmt *fmt;
 > 332		int ret;
   333		u64 stream_source_mask;
   334	
   335		if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE &&
   336		    priv->enabled_source_streams)
   337			return -EBUSY;
   338	
   339		/* No transcoding, source and sink formats must match. */
   340		if (format->pad == MAX96717_PAD_SOURCE)
   341			return v4l2_subdev_get_fmt(sd, state, format);
   342	
   343		/* Set sink format */
   344		fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
   345		if (!fmt)
   346			return -EINVAL;
   347	
   348		*fmt = format->format;
   349	
   350		/* Propagate to source format */
   351		fmt = v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
   352								   format->stream);
   353		if (!fmt)
   354			return -EINVAL;
   355		*fmt = format->format;
   356	
   357		stream_source_mask = BIT(format->stream);
   358		ret = v4l2_subdev_state_xlate_streams(state, MAX96717_PAD_SOURCE,
   359						      MAX96717_PAD_SINK,
   360						      &stream_source_mask);
   361		return 0;
   362	}
   363	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

