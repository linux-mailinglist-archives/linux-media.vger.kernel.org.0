Return-Path: <linux-media+bounces-37992-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C4371B08B4A
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 12:56:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE0174A39A5
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 10:56:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A55E2BE7CF;
	Thu, 17 Jul 2025 10:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IQfYvIMm"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454C62BE049;
	Thu, 17 Jul 2025 10:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752749430; cv=none; b=BPzOeq42c5/AgNNnpjSRpgGdiqgDvmERoS9InhOpBq1bzJZdhOvvaft0SDFFH2wEIO4lfU7NFfYoQWz1d7SnXPjKKdXU258os9nm5g6ij1khzu6V6q+NxBTkjNd8bnXu0UIK2+8YuOFGL617T0kaeGwHwnD1ktoocQum+Iv8qWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752749430; c=relaxed/simple;
	bh=RnOYNCVbIcR1/NQHJ0LkvmKFRZrbUei/gDK1cnLHFC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d4yElsL6ceb/jUQvAXpLQBiDAmeJu1C+J5IS2bK9WngrJ165vDZ3NXSgGVpmI+5NmBzO0BqnKr5Of4W44NOUQUTiUvFt4thkA9YbZGU1GZzOYlGJOlMm46IsLyV3CiDSIYkGsZKrkeRG42OCiAEIh0YUoM+3ZGf48iu9HhVSLEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IQfYvIMm; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752749429; x=1784285429;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RnOYNCVbIcR1/NQHJ0LkvmKFRZrbUei/gDK1cnLHFC4=;
  b=IQfYvIMm+hNP7xIUp7t6Fc/+868ZwvjxX1hjr6QK5bLoLn1ng5j2yP1l
   9KWiEJ+k9LRjdO0stPHMA253ZelgbJ2aBgdnFZ4vdFAgMnPv4fBmJv+2Y
   BGkYGp4D9rsKVLeoENDC9E/FTtjK+3MOwEv9V3vEBi0Vj+4Dnzi4sRysU
   u3yAX6+LTaqZMZF6cegPuLzgWg9ilRhTPsz/OIZLhlOucmvxBuMZXh1Sd
   FSEc7xoo05UQQC2ZYGIq4DpRNOmGKaQXg+/8mpyctFKsPXTf+8xakTO94
   Rx/5Tge+lyZ0gOarsmGZgIHXYsEoQV9iQnux/lv06a73D3QArywl7e9sN
   w==;
X-CSE-ConnectionGUID: /P+uiFb+RaCzkcR6QwzNYg==
X-CSE-MsgGUID: lkWeexP1TKGHBClfOXdtew==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="66469903"
X-IronPort-AV: E=Sophos;i="6.16,318,1744095600"; 
   d="scan'208";a="66469903"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2025 03:50:28 -0700
X-CSE-ConnectionGUID: gcageXL1STip2wz8LQf76w==
X-CSE-MsgGUID: xMI0ELb7RQiRrcITnDokKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,318,1744095600"; 
   d="scan'208";a="161790908"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 17 Jul 2025 03:50:23 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucMBx-000DXj-0V;
	Thu, 17 Jul 2025 10:50:21 +0000
Date: Thu, 17 Jul 2025 18:49:45 +0800
From: kernel test robot <lkp@intel.com>
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, mchehab@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux@armlinux.org.uk, ardb@kernel.org,
	ebiggers@kernel.org, geert+renesas@glider.be,
	claudiu.beznea@tuxon.dev, bparrot@ti.com, andre.draszik@linaro.org,
	kuninori.morimoto.gx@renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	heikki.krogerus@linux.intel.com, kory.maincent@bootlin.com,
	florian.fainelli@broadcom.com, lumag@kernel.org,
	dale@farnsworth.org, sbellary@baylibre.com,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	dagriego@biglakesoftware.com, u-kumar1@ti.com,
	y-abhilashchandra@ti.com
Subject: Re: [PATCH V2 4/4] media: ti-vpe: Add the VIP driver
Message-ID: <202507171820.SxYjRSbE-lkp@intel.com>
References: <20250716111912.235157-5-y-abhilashchandra@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716111912.235157-5-y-abhilashchandra@ti.com>

Hi Yemike,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linuxtv-media-pending/master]
[also build test WARNING on sailus-media-tree/master next-20250716]
[cannot apply to robh/for-next linus/master sailus-media-tree/streams v6.16-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yemike-Abhilash-Chandra/MAINTAINERS-Update-maintainers-of-TI-VPE-and-CAL/20250716-192326
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20250716111912.235157-5-y-abhilashchandra%40ti.com
patch subject: [PATCH V2 4/4] media: ti-vpe: Add the VIP driver
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20250717/202507171820.SxYjRSbE-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250717/202507171820.SxYjRSbE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507171820.SxYjRSbE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/ti/vpe/vip.c: In function 'populate_desc_list':
>> drivers/media/platform/ti/vpe/vip.c:828:22: warning: variable 'list_length' set but not used [-Wunused-but-set-variable]
     828 |         unsigned int list_length;
         |                      ^~~~~~~~~~~
   drivers/media/platform/ti/vpe/vip.c: In function 'vip_create_streams':
>> drivers/media/platform/ti/vpe/vip.c:3382:43: warning: variable 'bus' set but not used [-Wunused-but-set-variable]
    3382 |         struct v4l2_mbus_config_parallel *bus;
         |                                           ^~~
   drivers/media/platform/ti/vpe/vip.c: In function 'vip_probe':
>> drivers/media/platform/ti/vpe/vip.c:3677:25: warning: variable 'pinctrl' set but not used [-Wunused-but-set-variable]
    3677 |         struct pinctrl *pinctrl;
         |                         ^~~~~~~


vim +/list_length +828 drivers/media/platform/ti/vpe/vip.c

   823	
   824	static void populate_desc_list(struct vip_stream *stream)
   825	{
   826		struct vip_port *port = stream->port;
   827		struct vip_dev *dev = port->dev;
 > 828		unsigned int list_length;
   829	
   830		stream->desc_next = stream->desc_list.buf.addr;
   831		add_stream_dtds(stream);
   832	
   833		list_length = stream->desc_next - stream->desc_list.buf.addr;
   834		vpdma_map_desc_buf(dev->shared->vpdma, &stream->desc_list.buf);
   835	}
   836	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

