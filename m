Return-Path: <linux-media+bounces-12376-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B278D6F71
	for <lists+linux-media@lfdr.de>; Sat,  1 Jun 2024 13:11:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16127283312
	for <lists+linux-media@lfdr.de>; Sat,  1 Jun 2024 11:11:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5C858172E;
	Sat,  1 Jun 2024 11:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B+uvVjmW"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F1954750
	for <linux-media@vger.kernel.org>; Sat,  1 Jun 2024 11:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717240281; cv=none; b=jghG5kEuf+PwHEi/LVijSqSqoxxrsSmNpzGtCxxaSEU9eCirUeUAUBpPwlSeJD1K9PdB8qy3y6DJwSQGST1kvRDpgKAnIfuHJFkDah73ZrdyN/qXnUHIATo41rhr8Q0JXdsyTT/cr6fXcQhOglix5GktBWO156nEHwzFj65Rhyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717240281; c=relaxed/simple;
	bh=vl5JEWYlqNjopFPJxK4avobfRkxgy+W3g8PcEkYIVio=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bRyr0uI4Uh7ofOmw8HQXHQXkxgp7cSimkfFQAHP2bcJmnku//nixDpya0GIwP42kaLVQgVVvgCYTq0+NXwKvcJrNcHMfXIcgMOD88GfKNXgQmKFEKt8VY+eC/AwIgmfbBBFXFdwCKvE1qXrLDJovUdwpQuqmTi3ciqRKVzsiruo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B+uvVjmW; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717240280; x=1748776280;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vl5JEWYlqNjopFPJxK4avobfRkxgy+W3g8PcEkYIVio=;
  b=B+uvVjmWuxnaKCWymW8l0OavHET8xNQGVKWHmLanSg2LjBf6FZxIPGkv
   guX2afvo9AETFVesl6IM9LMPulzfFhfhjNE5kQPse+wHkhcjyeXL1YINL
   XBetkmhfoJUJJQeTwmcANCV1EdbtUPo8iYuBSZxp7NLtL3C7DiPenHfru
   xszDfYq80blsdEbXC7HYbX+F5t43YgAccfAgjyLaKKZilO7aEuNpLTnEU
   7DIaT0hHns/CUvFWA0zmU9Ye/DHpTPQzz6f73YzwjvQlpSiDsrSQiIV07
   kqOeNNIdfpxRavu+BdTHCy3Rus+KlZoNZnZPIvwjbpTnxcvJcXDJowlJj
   g==;
X-CSE-ConnectionGUID: OpUZcZz7Rv6BD0ODo2hPiQ==
X-CSE-MsgGUID: MUxO5A1kRQ6/NLU9Xbc8FA==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="24443586"
X-IronPort-AV: E=Sophos;i="6.08,207,1712646000"; 
   d="scan'208";a="24443586"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2024 04:11:20 -0700
X-CSE-ConnectionGUID: kMEIuTZtSLyyeDz3GhYuAg==
X-CSE-MsgGUID: HZasSXrBT/iyRYGhVrsgSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,207,1712646000"; 
   d="scan'208";a="36428674"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 01 Jun 2024 04:11:18 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sDMdn-000Iky-1Z;
	Sat, 01 Jun 2024 11:11:15 +0000
Date: Sat, 1 Jun 2024 19:10:19 +0800
From: kernel test robot <lkp@intel.com>
To: Julien Massot <julien.massot@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [sailus-media-tree:test 53/55] drivers/media/i2c/max96717.c:124:16:
 error: too many arguments to function 'i2c_mux_add_adapter'
Message-ID: <202406011928.HPsUpFHI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/sailus/media_tree.git test
head:   94e408a1547ef00f59477a072c6f943d62d7a097
commit: b22ddf6b6ea346fb256ed4adca4cb8c085a2d7fb [53/55] media: i2c: add MAX96717 driver
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240601/202406011928.HPsUpFHI-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240601/202406011928.HPsUpFHI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406011928.HPsUpFHI-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/i2c/max96717.c: In function 'max96717_i2c_mux_init':
>> drivers/media/i2c/max96717.c:124:16: error: too many arguments to function 'i2c_mux_add_adapter'
     124 |         return i2c_mux_add_adapter(priv->mux, 0, 0, 0);
         |                ^~~~~~~~~~~~~~~~~~~
   In file included from drivers/media/i2c/max96717.c:14:
   include/linux/i2c-mux.h:58:5: note: declared here
      58 | int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
         |     ^~~~~~~~~~~~~~~~~~~


vim +/i2c_mux_add_adapter +124 drivers/media/i2c/max96717.c

   115	
   116	static int max96717_i2c_mux_init(struct max96717_priv *priv)
   117	{
   118		priv->mux = i2c_mux_alloc(priv->client->adapter, &priv->client->dev,
   119					  1, 0, I2C_MUX_LOCKED | I2C_MUX_GATE,
   120					  max96717_i2c_mux_select, NULL);
   121		if (!priv->mux)
   122			return -ENOMEM;
   123	
 > 124		return i2c_mux_add_adapter(priv->mux, 0, 0, 0);
   125	}
   126	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

