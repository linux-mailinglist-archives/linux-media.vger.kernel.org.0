Return-Path: <linux-media+bounces-1660-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 583B38053AB
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 12:58:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0BE861F2143C
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 11:58:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5DAF59E50;
	Tue,  5 Dec 2023 11:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a771OJF3"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BF7298
	for <linux-media@vger.kernel.org>; Tue,  5 Dec 2023 03:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701777518; x=1733313518;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fPeAcvfdU+TNNzNqrZlOEHkS1vgOvCMGwp7S8pVPa7o=;
  b=a771OJF3sfWt2Q79PDGdoiVsc3Y5jos+6vUXyhl9VnE61wc4V4GSuu85
   kdBimkAtsqZIhFIEK5EQVEpfn+mi7ywKen+nWUnQieSE6ivIpvMTHj0c5
   1Tgl/hjRaBNaaMeIkvxRJhsxIZ+BMyDuiN+Q8aPkOtGHVCBgv05Yc7h2Z
   D9XKGUyL3C+yv7niozhgUM/ineFHw/MheNlsaulFE691RuCIvT8V7Qith
   9TGdNDuDEO8NKAIiCJoq1G8M4qf8+zUTe3tZ+45TfRXhZsGq1leMarz25
   CI19whD2gIr9pv/eenrOsBb3HNaPONb4uiD0X51oOz47PNuUr72ewLh7h
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="384281012"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="384281012"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 03:58:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="1018200375"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="1018200375"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 05 Dec 2023 03:58:35 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAU4P-0008va-2n;
	Tue, 05 Dec 2023 11:58:33 +0000
Date: Tue, 5 Dec 2023 19:57:35 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [linux-next:master 2291/4884] drivers/media/i2c/saa6752hs.c:598:18:
 error: implicit declaration of function 'v4l2_subdev_state_get_format'
Message-ID: <202312051913.e5iif8Qz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0f5f12ac05f36f117e793656c3f560625e927f1b
commit: bc0e8d91feec72b19199298dca470c5816a52105 [2291/4884] media: v4l: subdev: Switch to stream-aware state functions
config: arc-randconfig-c031-20221114 (https://download.01.org/0day-ci/archive/20231205/202312051913.e5iif8Qz-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231205/202312051913.e5iif8Qz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312051913.e5iif8Qz-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/i2c/saa6752hs.c: In function 'saa6752hs_set_fmt':
>> drivers/media/i2c/saa6752hs.c:598:18: error: implicit declaration of function 'v4l2_subdev_state_get_format' [-Werror=implicit-function-declaration]
     598 |                 *v4l2_subdev_state_get_format(sd_state, 0) = *f;
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/saa6752hs.c:598:17: error: invalid type argument of unary '*' (have 'int')
     598 |                 *v4l2_subdev_state_get_format(sd_state, 0) = *f;
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/v4l2_subdev_state_get_format +598 drivers/media/i2c/saa6752hs.c

   564	
   565	static int saa6752hs_set_fmt(struct v4l2_subdev *sd,
   566			struct v4l2_subdev_state *sd_state,
   567			struct v4l2_subdev_format *format)
   568	{
   569		struct v4l2_mbus_framefmt *f = &format->format;
   570		struct saa6752hs_state *h = to_state(sd);
   571		int dist_352, dist_480, dist_720;
   572	
   573		if (format->pad)
   574			return -EINVAL;
   575	
   576		f->code = MEDIA_BUS_FMT_FIXED;
   577	
   578		dist_352 = abs(f->width - 352);
   579		dist_480 = abs(f->width - 480);
   580		dist_720 = abs(f->width - 720);
   581		if (dist_720 < dist_480) {
   582			f->width = 720;
   583			f->height = 576;
   584		} else if (dist_480 < dist_352) {
   585			f->width = 480;
   586			f->height = 576;
   587		} else {
   588			f->width = 352;
   589			if (abs(f->height - 576) < abs(f->height - 288))
   590				f->height = 576;
   591			else
   592				f->height = 288;
   593		}
   594		f->field = V4L2_FIELD_INTERLACED;
   595		f->colorspace = V4L2_COLORSPACE_SMPTE170M;
   596	
   597		if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
 > 598			*v4l2_subdev_state_get_format(sd_state, 0) = *f;
   599			return 0;
   600		}
   601	
   602		/*
   603		  FIXME: translate and round width/height into EMPRESS
   604		  subsample type:
   605	
   606		  type   |   PAL   |  NTSC
   607		  ---------------------------
   608		  SIF    | 352x288 | 352x240
   609		  1/2 D1 | 352x576 | 352x480
   610		  2/3 D1 | 480x576 | 480x480
   611		  D1     | 720x576 | 720x480
   612		*/
   613	
   614		if (f->code != MEDIA_BUS_FMT_FIXED)
   615			return -EINVAL;
   616	
   617		if (f->width == 720)
   618			h->video_format = SAA6752HS_VF_D1;
   619		else if (f->width == 480)
   620			h->video_format = SAA6752HS_VF_2_3_D1;
   621		else if (f->height == 576)
   622			h->video_format = SAA6752HS_VF_1_2_D1;
   623		else
   624			h->video_format = SAA6752HS_VF_SIF;
   625		return 0;
   626	}
   627	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

