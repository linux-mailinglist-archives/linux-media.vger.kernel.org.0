Return-Path: <linux-media+bounces-2921-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D3481CF3C
	for <lists+linux-media@lfdr.de>; Fri, 22 Dec 2023 21:25:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4ACCD286DF1
	for <lists+linux-media@lfdr.de>; Fri, 22 Dec 2023 20:25:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90E1C2E83C;
	Fri, 22 Dec 2023 20:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U/twPxBy"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3295028DB1
	for <linux-media@vger.kernel.org>; Fri, 22 Dec 2023 20:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703276743; x=1734812743;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h+knBHtFkz1Owc4ScM4riZfJft7wonhkNRVqIZyW/D8=;
  b=U/twPxByv9M0rSCm0ret9rV29iLXsZTqCqr4XdYVgheYCsYvWcRgiMeT
   6z0X6oA2BBSAOyFfi9aVNl3aEryyAUd6bd+WJ+2xwzh6oVrlW6rJMi+fb
   y2S/tBVZTZatt5vxxQ5RxpZ1CSaDfH/V3S8KSLJt7hdymS4IVQq2pw34a
   vK3QkPAWiHzj84NUMikjsCB/KKzYUhfpSXbQ2biaJYHaBcldVurlCwh+p
   HC7ICR2mm24EsAdEL6jrOtkYy4wUmjCfV0JQImu77XzVPTCibFLxL/ECn
   IRfAQAMASrlIDvtYsoiCFo4UArBo6yybEOlhf5p1Ux1nc98xsGg67vopo
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="2989685"
X-IronPort-AV: E=Sophos;i="6.04,297,1695711600"; 
   d="scan'208";a="2989685"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2023 12:25:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="1108551012"
X-IronPort-AV: E=Sophos;i="6.04,297,1695711600"; 
   d="scan'208";a="1108551012"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 22 Dec 2023 12:25:41 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rGm3l-0009qd-2v;
	Fri, 22 Dec 2023 20:24:29 +0000
Date: Sat, 23 Dec 2023 04:20:31 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata 36/36]
 drivers/media/i2c/ov2740.c:1074:45: error: 'format' is a pointer; did you
 mean to use '->'?
Message-ID: <202312230444.LOoNKr3Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   bef5b741be2fd2b49dc6b8ac2dfadb5b58e97c1d
commit: bef5b741be2fd2b49dc6b8ac2dfadb5b58e97c1d [36/36] media: ov2740: Add support for embedded data
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20231223/202312230444.LOoNKr3Q-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231223/202312230444.LOoNKr3Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312230444.LOoNKr3Q-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/media/v4l2-subdev.h:15,
                    from include/media/v4l2-device.h:13,
                    from drivers/media/i2c/ov2740.c:16:
   drivers/media/i2c/ov2740.c: In function '__ov2740_set_format':
>> drivers/media/i2c/ov2740.c:1074:45: error: 'format' is a pointer; did you mean to use '->'?
    1074 |                                       format.width, format.height);
         |                                             ^
   include/media/v4l2-common.h:419:25: note: in definition of macro 'v4l2_find_nearest_size'
     419 |                         width, height);                                 \
         |                         ^~~~~
   drivers/media/i2c/ov2740.c:1074:59: error: 'format' is a pointer; did you mean to use '->'?
    1074 |                                       format.width, format.height);
         |                                                           ^
   include/media/v4l2-common.h:419:32: note: in definition of macro 'v4l2_find_nearest_size'
     419 |                         width, height);                                 \
         |                                ^~~~~~
   drivers/media/i2c/ov2740.c: In function 'ov2740_init_state':
>> drivers/media/i2c/ov2740.c:1175:35: error: 'ov2740' undeclared (first use in this function)
    1175 |         ov2740_update_pad_format(&ov2740->supported_modes[0], &format);
         |                                   ^~~~~~
   drivers/media/i2c/ov2740.c:1175:35: note: each undeclared identifier is reported only once for each function it appears in


vim +1074 drivers/media/i2c/ov2740.c

  1041	
  1042	static int __ov2740_set_format(struct v4l2_subdev *sd,
  1043				       struct v4l2_subdev_state *sd_state,
  1044				       struct v4l2_mbus_framefmt *format,
  1045				       enum v4l2_subdev_format_whence which,
  1046				       unsigned int pad, unsigned int stream)
  1047	{
  1048		struct v4l2_mbus_framefmt *src_pix_fmt, *src_meta_fmt, *pix_fmt,
  1049			*meta_fmt;
  1050		struct ov2740 *ov2740 = to_ov2740(sd);
  1051		const struct ov2740_mode *mode;
  1052		s32 vblank_def, h_blank;
  1053	
  1054		/*
  1055		 * Allow setting format on internal pixel pad as well as the source
  1056		 * pad's pixel stream (for compatibility).
  1057		 */
  1058		if (pad == OV2740_PAD_SOURCE || pad == OV2740_PAD_META ||
  1059		    stream == OV2740_STREAM_META) {
  1060			*format = *v4l2_subdev_state_get_format(sd_state, pad, stream);
  1061			return 0;
  1062		}
  1063	
  1064		pix_fmt = v4l2_subdev_state_get_format(sd_state, OV2740_PAD_PIXEL, 0);
  1065		meta_fmt = v4l2_subdev_state_get_format(sd_state, OV2740_PAD_META, 0);
  1066		src_pix_fmt = v4l2_subdev_state_get_format(sd_state, OV2740_PAD_SOURCE,
  1067							   OV2740_STREAM_PIXEL);
  1068		src_meta_fmt = v4l2_subdev_state_get_format(sd_state, OV2740_PAD_SOURCE,
  1069							    OV2740_STREAM_META);
  1070	
  1071		mode = v4l2_find_nearest_size(ov2740->supported_modes,
  1072					      ov2740->supported_modes_count,
  1073					      width, height,
> 1074					      format.width, format.height);
  1075		ov2740_update_pad_format(mode, pix_fmt);
  1076		*format = *src_pix_fmt = *pix_fmt;
  1077	
  1078		meta_fmt->code = MEDIA_BUS_FMT_OV2740_EMBEDDED;
  1079		meta_fmt->width = OV2740_META_WIDTH;
  1080		meta_fmt->height = OV2740_META_HEIGHT;
  1081		*src_meta_fmt = *meta_fmt;
  1082		src_meta_fmt->code = MEDIA_BUS_FMT_META_8;
  1083	
  1084		if (which == V4L2_SUBDEV_FORMAT_TRY)
  1085			return 0;
  1086	
  1087		ov2740->cur_mode = mode;
  1088		__v4l2_ctrl_s_ctrl(ov2740->link_freq, mode->link_freq_index);
  1089		__v4l2_ctrl_s_ctrl_int64(ov2740->pixel_rate,
  1090					 to_pixel_rate(mode->link_freq_index));
  1091	
  1092		/* Update limits and set FPS to default */
  1093		vblank_def = mode->vts_def - mode->height;
  1094		__v4l2_ctrl_modify_range(ov2740->vblank,
  1095					 mode->vts_min - mode->height,
  1096					 mode->vts_max - mode->height, 1, vblank_def);
  1097		__v4l2_ctrl_s_ctrl(ov2740->vblank, vblank_def);
  1098		h_blank = mode->hts - mode->width;
  1099		__v4l2_ctrl_modify_range(ov2740->hblank, h_blank, h_blank, 1, h_blank);
  1100	
  1101		return 0;
  1102	}
  1103	
  1104	static int ov2740_set_format(struct v4l2_subdev *sd,
  1105				     struct v4l2_subdev_state *sd_state,
  1106				     struct v4l2_subdev_format *fmt)
  1107	{
  1108		return __ov2740_set_format(sd, sd_state, &fmt->format, fmt->which,
  1109					   fmt->pad, fmt->stream);
  1110	}
  1111	
  1112	static int ov2740_enum_mbus_code(struct v4l2_subdev *sd,
  1113					 struct v4l2_subdev_state *sd_state,
  1114					 struct v4l2_subdev_mbus_code_enum *code)
  1115	{
  1116		if (code->index > 0)
  1117			return -EINVAL;
  1118	
  1119		code->code = MEDIA_BUS_FMT_SGRBG10_1X10;
  1120	
  1121		return 0;
  1122	}
  1123	
  1124	static int ov2740_enum_frame_size(struct v4l2_subdev *sd,
  1125					  struct v4l2_subdev_state *sd_state,
  1126					  struct v4l2_subdev_frame_size_enum *fse)
  1127	{
  1128		struct ov2740 *ov2740 = to_ov2740(sd);
  1129		const struct ov2740_mode *supported_modes = ov2740->supported_modes;
  1130	
  1131		if (fse->index >= ov2740->supported_modes_count)
  1132			return -EINVAL;
  1133	
  1134		if (fse->code != MEDIA_BUS_FMT_SGRBG10_1X10)
  1135			return -EINVAL;
  1136	
  1137		fse->min_width = supported_modes[fse->index].width;
  1138		fse->max_width = fse->min_width;
  1139		fse->min_height = supported_modes[fse->index].height;
  1140		fse->max_height = fse->min_height;
  1141	
  1142		return 0;
  1143	}
  1144	
  1145	static int ov2740_init_state(struct v4l2_subdev *sd,
  1146				     struct v4l2_subdev_state *sd_state)
  1147	{
  1148		struct v4l2_subdev_route routes[] = {
  1149			{
  1150				.sink_pad = OV2740_PAD_PIXEL,
  1151				.source_pad = OV2740_PAD_SOURCE,
  1152				.source_stream = OV2740_STREAM_PIXEL,
  1153				.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
  1154			}, {
  1155				.sink_pad = OV2740_PAD_META,
  1156				.source_pad = OV2740_PAD_SOURCE,
  1157				.source_stream = OV2740_STREAM_META,
  1158				.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
  1159			},
  1160		};
  1161		struct v4l2_subdev_krouting routing = {
  1162			.routes = routes,
  1163			.num_routes = ARRAY_SIZE(routes),
  1164		};
  1165		struct v4l2_subdev_state *active_state;
  1166		struct v4l2_mbus_framefmt format = { 0 };
  1167		int ret;
  1168	
  1169		ret = v4l2_subdev_set_routing(sd, sd_state, &routing);
  1170		if (ret)
  1171			return ret;
  1172	
  1173		active_state = v4l2_subdev_get_locked_active_state(sd);
  1174	
> 1175		ov2740_update_pad_format(&ov2740->supported_modes[0], &format);
  1176	
  1177		return __ov2740_set_format(sd, sd_state, &format,
  1178					   active_state == sd_state ?
  1179					   V4L2_SUBDEV_FORMAT_ACTIVE :
  1180					   V4L2_SUBDEV_FORMAT_TRY, OV2740_PAD_PIXEL, 0);
  1181	}
  1182	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

