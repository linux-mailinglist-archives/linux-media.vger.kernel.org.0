Return-Path: <linux-media+bounces-4194-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F2D83C7EB
	for <lists+linux-media@lfdr.de>; Thu, 25 Jan 2024 17:28:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D89571C25339
	for <lists+linux-media@lfdr.de>; Thu, 25 Jan 2024 16:28:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DB66129A8C;
	Thu, 25 Jan 2024 16:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hck4aF7H"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B335573177;
	Thu, 25 Jan 2024 16:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706200092; cv=none; b=iLn/TdK9YBE/aiHDqBpHTcFfktty1OU4sLicvIxrHH4XHOJI+ycwgJ+A+oOi7/p2dU5Mbk2KRDGnKvnIGRs80ZQZBV6m3pyFj736wldBxRfdgbhE8oQiBxTbTv/6vNeaIFr+BBp3LplHgI8jU8gaRffiMRWC3r+fGmf8rQV2l4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706200092; c=relaxed/simple;
	bh=CKkmBUyrGKT7WEXHgCcuZ9+Ns5iuzV63djC+5Ja6ZoU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=leOczJezXoEqwpRd5ecJt6S4naWJRq9BjjAqHK88Bal/THJYw+YjNukXym4/2XKQkRnMTRUxS8AbyEYEBfV2sD1s9Vsg9ZAPx77vAEh1vVqR+G8aImHWnFPmxrv/pgxTrKl+L4UNCWLQ2iF4V+emhjgXoGQ1hueM1Ov7cv6NsWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hck4aF7H; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706200090; x=1737736090;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CKkmBUyrGKT7WEXHgCcuZ9+Ns5iuzV63djC+5Ja6ZoU=;
  b=Hck4aF7HffONCk7xZzKOVMv8A2Et6FAAypStGW1B9gmKodAbZo5lwXqc
   9f/2b7rsKyYK9c6fosfuFrKT1VSawein1nwOCdqZDy01iQ8bm5fLUljCH
   bZQAuvy6/M56OPkwRAocPriWurTVFsZaixNrreUOb3Q5holezVd76VbVs
   BgfkZkEPYa9SkLoq9et32MKdjmj3SkqvByJqGdO7V2bEegi4Hskg0kbD+
   O5ewLrwG4J751FgVbhOFAz+0BeOK2GcPT93YzIX3z7tc8EmZaPj55utRX
   Svb+VHS4Sl5F1ruKPlOISwi9fR4BBXipYM687tROhtInSB3IjzxwGK7YD
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="15575268"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="15575268"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2024 08:28:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2309411"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 25 Jan 2024 08:28:04 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rT2a9-0000C0-0i;
	Thu, 25 Jan 2024 16:28:01 +0000
Date: Fri, 26 Jan 2024 00:27:32 +0800
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
Subject: Re: [PATCH 03/13] of: property: add of_graph_get_next_endpoint_raw()
Message-ID: <202401260024.txulvo50-lkp@intel.com>
References: <87fryoud8t.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87fryoud8t.wl-kuninori.morimoto.gx@renesas.com>

Hi Kuninori,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on drm-misc/drm-misc-next linus/master v6.8-rc1 next-20240125]
[cannot apply to robh/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kuninori-Morimoto/of-property-add-port-base-loop/20240123-081427
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/87fryoud8t.wl-kuninori.morimoto.gx%40renesas.com
patch subject: [PATCH 03/13] of: property: add of_graph_get_next_endpoint_raw()
config: i386-buildonly-randconfig-002-20240125 (https://download.01.org/0day-ci/archive/20240126/202401260024.txulvo50-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240126/202401260024.txulvo50-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401260024.txulvo50-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/of/property.c:681: warning: Function parameter or struct member 'port' not described in 'of_graph_get_next_endpoint_raw'
>> drivers/of/property.c:681: warning: Excess function parameter 'parent' description in 'of_graph_get_next_endpoint_raw'


vim +681 drivers/of/property.c

   670	
   671	/**
   672	 * of_graph_get_next_endpoint_raw() - get next endpoint node
   673	 * @parent: pointer to the target port node
   674	 * @endpoint: current endpoint node, or NULL to get first
   675	 *
   676	 * Return: An 'endpoint' node pointer with refcount incremented. Refcount
   677	 * of the passed @prev node is decremented.
   678	 */
   679	struct device_node *of_graph_get_next_endpoint_raw(const struct device_node *port,
   680							   struct device_node *endpoint)
 > 681	{
   682		if (!port)
   683			return NULL;
   684	
   685		do {
   686			endpoint = of_get_next_child(port, endpoint);
   687			if (!endpoint)
   688				break;
   689		} while (!of_node_name_eq(endpoint, "endpoint"));
   690	
   691		return endpoint;
   692	}
   693	EXPORT_SYMBOL(of_graph_get_next_endpoint_raw);
   694	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

