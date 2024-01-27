Return-Path: <linux-media+bounces-4263-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E68F883EE21
	for <lists+linux-media@lfdr.de>; Sat, 27 Jan 2024 16:58:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 772C6284150
	for <lists+linux-media@lfdr.de>; Sat, 27 Jan 2024 15:58:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B79D2C183;
	Sat, 27 Jan 2024 15:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fa5J9WQd"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18CF128DCA;
	Sat, 27 Jan 2024 15:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706371119; cv=none; b=ed3XUUE1usKS2KlgRWOUoJY7kXI8PD7UAVrquM79xLCRiVdAuPYQCNBWm4/ReyrRFSij7WEQYEazh9ot+rwqDRInVlzcCKI4sJ7hTUjLxFFtcSFSrhdYvB/4NpHzR0jfZDCykaSOBRLVVvRiMNEmvb5RkoztLI6CAR58GrL1gnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706371119; c=relaxed/simple;
	bh=hBtf6FLBv/lirHB/qFxQDOfC3/JrgO9F5zuWntBY3Bo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b3ZASke+vhXwK4tNZAOXWg0RlyYnwRNPDPs7n2RXcx9rabuWQ4/50Rmu1ovaVpULSveB3ZYKnzyollYrrAZ0/tyi7aV+vsCidzNe056YC1/tgf5ABKliyt4T+yivyB9TTAPFwtfwm1tjbuTPSjgieWIJUteXn3Y2s3QYX6yNNRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fa5J9WQd; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706371116; x=1737907116;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hBtf6FLBv/lirHB/qFxQDOfC3/JrgO9F5zuWntBY3Bo=;
  b=fa5J9WQddtmcDXUGFz4Q66JK4ZipyxZBWTiROxl6qXEzrPzMIRTKdQqK
   DP6y99H5WsPBYlzMsPVe3kK8PA7is+hxytcLLW8i/zb3hj4JVsM2RcB8A
   Z8pWho1bBi8XGmpw3QD+j4O2jiJdFHc3xGQsOhCyDeJ84D54oAKufNNeQ
   Zb7Z/9hoGiLLBtb5SYx6swh/Xl8G1hq7TSn8jtBNg7XgMw83dhknjX0yU
   VxmvtpeP/Tp0+HwJVZMaRLaxP16EnNrvHBV+yuGV+dNVe8I1Er8cNp6Id
   2hQ7HfBJ8dRMC3r/5XrRV/YsdR4fqrMx3n5BzP2+/1Uv7ewAUAqFJWQ0I
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="10074283"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="10074283"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2024 07:58:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="787406022"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="787406022"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 27 Jan 2024 07:58:29 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTl4c-0002UU-1g;
	Sat, 27 Jan 2024 15:58:26 +0000
Date: Sat, 27 Jan 2024 23:57:54 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
	Frank Rowand <frowand.list@gmail.com>, Helge Deller <deller@gmx.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Ripard <mripard@kernel.org>, Michal Simek <monstr@monstr.eu>,
	Rob Herring <robh+dt@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Takashi Iwai <tiwai@suse.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-fbdev@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 11/13] fbdev: omapfb: use of_graph_get_next_port()
Message-ID: <202401272336.CCkvpjde-lkp@intel.com>
References: <874jf4ud77.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <874jf4ud77.wl-kuninori.morimoto.gx@renesas.com>

Hi Kuninori,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on linus/master v6.8-rc1 next-20240125]
[cannot apply to robh/for-next drm-misc/drm-misc-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kuninori-Morimoto/of-property-add-port-base-loop/20240123-081427
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/874jf4ud77.wl-kuninori.morimoto.gx%40renesas.com
patch subject: [PATCH 11/13] fbdev: omapfb: use of_graph_get_next_port()
config: i386-buildonly-randconfig-003-20240127 (https://download.01.org/0day-ci/archive/20240127/202401272336.CCkvpjde-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240127/202401272336.CCkvpjde-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401272336.CCkvpjde-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/video/fbdev/omap2/omapfb/dss/dss.c: In function 'dss_init_ports':
   drivers/video/fbdev/omap2/omapfb/dss/dss.c:925:9: error: implicit declaration of function 'of_graph_get_next_port'; did you mean 'of_get_next_parent'? [-Werror=implicit-function-declaration]
     port = of_graph_get_next_port(parent, NULL);
            ^~~~~~~~~~~~~~~~~~~~~~
            of_get_next_parent
>> drivers/video/fbdev/omap2/omapfb/dss/dss.c:925:7: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
     port = of_graph_get_next_port(parent, NULL);
          ^
   drivers/video/fbdev/omap2/omapfb/dss/dss.c:956:10: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
       (port = of_graph_get_next_port(parent, port)) != NULL);
             ^
   drivers/video/fbdev/omap2/omapfb/dss/dss.c: In function 'dss_uninit_ports':
   drivers/video/fbdev/omap2/omapfb/dss/dss.c:972:7: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
     port = of_graph_get_next_port(parent, NULL);
          ^
   drivers/video/fbdev/omap2/omapfb/dss/dss.c:1003:17: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
     } while ((port = of_graph_get_next_port(parent, port)) != NULL);
                    ^
   cc1: some warnings being treated as errors


vim +925 drivers/video/fbdev/omap2/omapfb/dss/dss.c

   915	
   916	static int dss_init_ports(struct platform_device *pdev)
   917	{
   918		struct device_node *parent = pdev->dev.of_node;
   919		struct device_node *port;
   920		int r, ret = 0;
   921	
   922		if (parent == NULL)
   923			return 0;
   924	
 > 925		port = of_graph_get_next_port(parent, NULL);
   926		if (!port)
   927			return 0;
   928	
   929		if (dss.feat->num_ports == 0)
   930			return 0;
   931	
   932		do {
   933			enum omap_display_type port_type;
   934			u32 reg;
   935	
   936			r = of_property_read_u32(port, "reg", &reg);
   937			if (r)
   938				reg = 0;
   939	
   940			if (reg >= dss.feat->num_ports)
   941				continue;
   942	
   943			port_type = dss.feat->ports[reg];
   944	
   945			switch (port_type) {
   946			case OMAP_DISPLAY_TYPE_DPI:
   947				ret = dpi_init_port(pdev, port);
   948				break;
   949			case OMAP_DISPLAY_TYPE_SDI:
   950				ret = sdi_init_port(pdev, port);
   951				break;
   952			default:
   953				break;
   954			}
   955		} while (!ret &&
   956			 (port = of_graph_get_next_port(parent, port)) != NULL);
   957	
   958		if (ret)
   959			dss_uninit_ports(pdev);
   960	
   961		return ret;
   962	}
   963	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

