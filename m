Return-Path: <linux-media+bounces-61633-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AP52CF21BmqKnAIAu9opvQ
	(envelope-from <linux-media+bounces-61633-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 07:55:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 06528549CAA
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 07:55:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 46A033044212
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 05:55:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09391372074;
	Fri, 15 May 2026 05:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cCMz19IH"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7AF936F90E
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 05:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778824533; cv=none; b=Km9fBpsurlV6zix+/AcctF3T/s6eyl3L4oSiJ2iannE7jdC5WvOKCCkX0Ax/3omt9kQUDPcvw0cZublmcrMxax2Xy7L3mOtay6YKxSyKI0yjxlh2etxGP0lOKGGE5Kmy/KACgtOgGeNfItl9jvDWgT7axKIfbq8Wi077FRBOXt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778824533; c=relaxed/simple;
	bh=XtCWUPD2JW9kuWZz3xjkvh+M3Al5Fgftizr/JU6PY4s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PRwtcjVpS8rZ5EqJEqF7yvokC8vt1j9szpvzstY3NuEYvYUaO0vxa5CMTQ93QfKK0CfQ1mMEQzGu5FzpeWuWbf8FjBjNjdYNsKcgTEIHrYe26JB+Jliv2g2QRMXC2oqMwQniURge/5+nhWBUd/igLCuNyZ62A5yf/Td6DzkVPT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cCMz19IH; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778824531; x=1810360531;
  h=date:from:to:cc:subject:message-id;
  bh=XtCWUPD2JW9kuWZz3xjkvh+M3Al5Fgftizr/JU6PY4s=;
  b=cCMz19IH6pc/Bt8fl/e/FAyAGSx1sQMvwySrELjpLR+E5bW0pnj/hN28
   ig7uAIaHpK3FXjrPtG2plnNPXjzcn7j9QFaNyjP0ONrGVeC7OA3RHKQtV
   1sRCxvzOhzXsc3mv4acciL2ZRK/rH9haPdoY12M2+1Z4cCTS9ZJ4Aor+D
   E4vXzi3EA6xWkyAreHlh45Iz8+jCowOBy+r+aZ0jRWwEErkV8WYgiFRnQ
   aH/rGXwfR4BuCbvBmSuIP8Bgi9J76zoPWaszcxApoh3gOkWY9QZIGb5rB
   VJ1/OMGsFenULmIT6TF22OTuMF7i7RDGPW4symFKToV6sw5bkAxXhoVuS
   Q==;
X-CSE-ConnectionGUID: SkdGz0alTeaVBoOdgewYdQ==
X-CSE-MsgGUID: EDIcyFaTQ3KF8sFy9RtWFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="90473481"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="90473481"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 22:55:30 -0700
X-CSE-ConnectionGUID: gfEZhikiT1yScFrCTexilw==
X-CSE-MsgGUID: Hkj75w9wTcm7iBzkUA+Xeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="262125470"
Received: from lkp-server02.sh.intel.com (HELO 7a33ad3e7d27) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 14 May 2026 22:55:28 -0700
Received: from kbuild by 7a33ad3e7d27 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNlWA-000000000yB-1VuL;
	Fri, 15 May 2026 05:55:26 +0000
Date: Fri, 15 May 2026 13:55:04 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-media@vger.kernel.org
Subject: [sailus-media-tree:frame-desc 13/17]
 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c:110:24: warning: format
 specifies type 'int' but the argument has type 'long'
Message-ID: <202605151324.0bRU6lCx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: 06528549CAA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61633-lists,linux-media=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:mid,intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

tree:   git://linuxtv.org/sailus/media_tree.git frame-desc
head:   a0e9f7cf4fcd819e3c994fd629a63789748d81c5
commit: 0cf56292ac3200bd6a515db66aa9ed69fa60b091 [13/17] media: rkisp1: Use v4l2_subdev_get_frame_desc()
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260515/202605151324.0bRU6lCx-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260515/202605151324.0bRU6lCx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605151324.0bRU6lCx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c:110:24: warning: format specifies type 'int' but the argument has type 'long' [-Wformat]
     109 |                         "failed to get frame descriptor from '%s':%u: %d\n",
         |                                                                       ~~
         |                                                                       %ld
     110 |                         source_sd->name, 0, PTR_ERR(fd));
         |                                             ^~~~~~~~~~~
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   1 warning generated.


vim +110 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c

    86	
    87	static int rkisp1_gasket_enable(struct rkisp1_device *rkisp1,
    88					struct media_pad *source)
    89	{
    90		struct v4l2_subdev *source_sd;
    91		struct v4l2_mbus_frame_desc *fd __free(v4l2_subdev_free_frame_desc) =
    92			NULL;
    93		unsigned int dt;
    94		u32 mask;
    95		u32 val;
    96	
    97		/*
    98		 * Configure and enable the gasket with the CSI-2 data type. Set the
    99		 * vsync polarity as active high, as that is what the ISP is configured
   100		 * to expect in ISP_ACQ_PROP. Enable left justification, as the i.MX8MP
   101		 * ISP has a 16-bit wide input and expects data to be left-aligned.
   102		 */
   103	
   104		source_sd = media_entity_to_v4l2_subdev(source->entity);
   105		fd = v4l2_subdev_get_frame_desc(source_sd, source->index,
   106						V4L2_MBUS_FRAME_DESC_TYPE_CSI2);
   107		if (IS_ERR(fd)) {
   108			dev_err(rkisp1->dev,
   109				"failed to get frame descriptor from '%s':%u: %d\n",
 > 110				source_sd->name, 0, PTR_ERR(fd));
   111			return PTR_ERR(fd);
   112		}
   113	
   114		if (fd->num_entries != 1) {
   115			dev_err(rkisp1->dev, "invalid frame descriptor for '%s':%u\n",
   116				source_sd->name, 0);
   117			return -EINVAL;
   118		}
   119	
   120		dt = fd->entry[0].bus.csi2.dt;
   121	
   122		if (rkisp1->gasket_id == 0) {
   123			mask = ISP_DEWARP_CONTROL_MIPI_CSI1_HS_POLARITY
   124			     | ISP_DEWARP_CONTROL_MIPI_CSI1_VS_SEL_MASK
   125			     | ISP_DEWARP_CONTROL_MIPI_ISP1_LEFT_JUST_MODE
   126			     | ISP_DEWARP_CONTROL_MIPI_ISP1_DATA_TYPE_MASK
   127			     | ISP_DEWARP_CONTROL_GPR_ISP_0_DISABLE;
   128			val = ISP_DEWARP_CONTROL_MIPI_CSI1_VS_SEL_POSITIVE
   129			    | ISP_DEWARP_CONTROL_MIPI_ISP1_LEFT_JUST_MODE
   130			    | ISP_DEWARP_CONTROL_MIPI_ISP1_DATA_TYPE(dt);
   131		} else {
   132			mask = ISP_DEWARP_CONTROL_MIPI_CSI2_HS_POLARITY
   133			     | ISP_DEWARP_CONTROL_MIPI_CSI2_VS_SEL_MASK
   134			     | ISP_DEWARP_CONTROL_MIPI_ISP2_LEFT_JUST_MODE
   135			     | ISP_DEWARP_CONTROL_MIPI_ISP2_DATA_TYPE_MASK
   136			     | ISP_DEWARP_CONTROL_GPR_ISP_1_DISABLE;
   137			val = ISP_DEWARP_CONTROL_MIPI_CSI2_VS_SEL_POSITIVE
   138			    | ISP_DEWARP_CONTROL_MIPI_ISP2_LEFT_JUST_MODE
   139			    | ISP_DEWARP_CONTROL_MIPI_ISP2_DATA_TYPE(dt);
   140		}
   141	
   142		regmap_update_bits(rkisp1->gasket, ISP_DEWARP_CONTROL, mask, val);
   143	
   144		return 0;
   145	}
   146	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

