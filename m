Return-Path: <linux-media+bounces-14071-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EB0915231
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 17:26:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 43424B2600F
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 15:26:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B242C19B59D;
	Mon, 24 Jun 2024 15:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VijO23Xe"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0668143743;
	Mon, 24 Jun 2024 15:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719242775; cv=none; b=UiPjM+wat4oH1xmiJLJaYhVg56Ysl8SuXg2yt6I8oLuycte1KXJiTcXEzdPX9+yWgcZGBeQ7qU0g9Cyd60PTPWOEMvasmZ69NrbAMQsgi4erMF8vgd5NSiqzro6EJnjOgY0hOBcEejRUykZou4XsChTFTmPNIsIR6fINGbusT9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719242775; c=relaxed/simple;
	bh=isSO8zhhTRh50IY8MzHYeg7mqSDdC0WjmZifBVHz8uA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uZcXoZ/27Xv5kcTmQ0UyIFJ5QxuroTFQ3erPOxH2CDN6GbDEH3GJxS9HRny1VyGz9ydHw/JhUiTLkUHdbfrv8Ul01MVhdZi7gwQdXjOigQK8hzM0EkquE5z6tpZW5Q2o4wgzRTp4WNH2T1VbbCQKIPyYjpb8f7CSlPAncFQADeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VijO23Xe; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719242773; x=1750778773;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=isSO8zhhTRh50IY8MzHYeg7mqSDdC0WjmZifBVHz8uA=;
  b=VijO23XeQdHuqBk/bOxGnDNS5fJ30MTMnISas4Nf9ThVoPHzlLQr+KYh
   /MS29T+wtySyvg32GHcVT7UgbUVU0pECdSQNcRnIJNM3+Bp6GSS12IQN0
   3/RIOfUcHbdjFl/MjeFxXgEWQcy2tKqhsyAqvrrtClwT6GKAua4U7Al0P
   +SCNLnMR1o6PTkQ3QZFM79bGeVUOyky96i0ukmHl5/YXC3Z0218S5sVfW
   G5bRcuSIMLp6hvYPPkorovfJDnWu95wODHXNgO4gaKyMaoYJIOmqKzyjg
   /KNxFgjksXW49su6SmTZEH42JZzcsJP/9cYZNtFeXaUMft0hGUkRRjvIg
   w==;
X-CSE-ConnectionGUID: AXM3aFJJSNCWlIoH+6jZ5g==
X-CSE-MsgGUID: D81VaETdStux1FGGe1bZrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="33761068"
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; 
   d="scan'208";a="33761068"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 08:26:12 -0700
X-CSE-ConnectionGUID: LYvArBnUSNK9f8uZoAK7xg==
X-CSE-MsgGUID: fnlpJt5WR3+nJBl3QPMjtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; 
   d="scan'208";a="43418208"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 24 Jun 2024 08:26:10 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sLla3-000DQe-2H;
	Mon, 24 Jun 2024 15:26:07 +0000
Date: Mon, 24 Jun 2024 23:25:51 +0800
From: kernel test robot <lkp@intel.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] media: dt-bindings: Add description of OmniVision
 OG01A1B image sensor
Message-ID: <202406242352.HSKkjAv2-lkp@intel.com>
References: <20240620124745.1265011-2-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240620124745.1265011-2-vladimir.zapolskiy@linaro.org>

Hi Vladimir,

kernel test robot noticed the following build warnings:

[auto build test WARNING on media-tree/master]
[also build test WARNING on sailus-media-tree/master krzk-dt/for-next robh/for-next linus/master v6.10-rc5 next-20240621]
[cannot apply to sailus-media-tree/streams]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vladimir-Zapolskiy/media-dt-bindings-Add-description-of-OmniVision-OG01A1B-image-sensor/20240624-161554
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20240620124745.1265011-2-vladimir.zapolskiy%40linaro.org
patch subject: [PATCH 1/3] media: dt-bindings: Add description of OmniVision OG01A1B image sensor
reproduce: (https://download.01.org/0day-ci/archive/20240624/202406242352.HSKkjAv2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406242352.HSKkjAv2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/power/wakeup-source.txt references a file that doesn't exist: Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/sound/fsl-asoc-card.txt references a file that doesn't exist: Documentation/devicetree/bindings/sound/fsl,asrc.txt
   Warning: Documentation/gpu/amdgpu/display/display-contributing.rst references a file that doesn't exist: Documentation/GPU/amdgpu/display/mpo-overview.rst
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/media/i2c/og01a1b.yaml
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

