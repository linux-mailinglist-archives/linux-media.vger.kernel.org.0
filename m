Return-Path: <linux-media+bounces-23959-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA659F99E2
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 20:01:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 298511886DD9
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 18:59:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19F5D220680;
	Fri, 20 Dec 2024 18:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bg01dOhv"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFFDD208AD;
	Fri, 20 Dec 2024 18:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734721149; cv=none; b=IBVGGq4+hM/9rJF8DVEMCVcdnXDOvAq/p+SxbEQTFndABbaE40QRQUHUcIKHCqL/KrbW7iuHMcZQbFkULLzVlXFru6GKsG8H6cdX1h6rhnCpYZxAGDe3c7C0DsBdUjFEPzzQmUxCzvWMmVcSsbzvIFZwUBUBTB0aCxpZSwUSWmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734721149; c=relaxed/simple;
	bh=STeUxUhBa15XpzjqHXj7grCaqugfSBd2WtpSvp8CpCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UnAU+cMNGGrsmpXOtpb9fF5trk7p0PbacwNwo1f7wwivMH+rq5WZegACNfy3Eb6mrGpv1CsokBnWu9AQWs68+rGOJBwGOfOlRk6FgtHeM7LFVPD5av9hucpaYlxSxm+kvyhHO5XePeMDcem8TmTi1K0eaD2grCzBGAj3W18EeYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bg01dOhv; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734721148; x=1766257148;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=STeUxUhBa15XpzjqHXj7grCaqugfSBd2WtpSvp8CpCQ=;
  b=Bg01dOhv4fVJ4thJO8a5o76DMMrhreuIprdLRZsdxBYC7MpTmCj+F+vb
   8uOUfBH/TKt5UhIOd4WssN0VPWCi2Rd6RdX5JmXPEMZVU4NJ3ClPL4ry+
   1/+qyXWur+NE9JdB4GB3oK3vwz2/HGKWXIjCp0K4P1olDAfwmcYrC4pPi
   +LYZ4vwdxNHlXU8alRNkGVQstPOd4EAFJKlDEbj9ePkvcvoD4hgV4bGve
   6w/HCDIxmwhaDJ7yXo3IAeks6FMR9OEYr7E64uXofJgmUpFzKEoJn0sZF
   8R9aYCSygNekVp6qg/Hd3gktBtBhquBVqZpO7y+I/frGrAxuesHoqVB9s
   Q==;
X-CSE-ConnectionGUID: 9xY+tJ6bR0Ca00F3Wc4Jcw==
X-CSE-MsgGUID: xo5Hnt88R6+2jNM3H8GTTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="34598301"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; 
   d="scan'208";a="34598301"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 10:59:07 -0800
X-CSE-ConnectionGUID: gnoJoCBASKqYI3VJPFmTtQ==
X-CSE-MsgGUID: 2EZ86WctQ+uAiZGIqJCN0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; 
   d="scan'208";a="99110429"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 20 Dec 2024 10:59:03 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOiDF-0001aZ-0g;
	Fri, 20 Dec 2024 18:59:01 +0000
Date: Sat, 21 Dec 2024 02:58:40 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	John Cox <john.cox@raspberrypi.com>,
	Dom Cobley <dom@raspberrypi.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 5/7] media: platform: Add Raspberry Pi HEVC decoder driver
Message-ID: <202412210220.jZ2hzj8t-lkp@intel.com>
References: <20241220-media-rpi-hevc-dec-v1-5-0ebcc04ed42e@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241220-media-rpi-hevc-dec-v1-5-0ebcc04ed42e@raspberrypi.com>

Hi Dave,

kernel test robot noticed the following build warnings:

[auto build test WARNING on e90c9612ac3969cb8206029a26bcd2b6f5d4a942]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Stevenson/RFC-media-Add-media_request_-pin-unpin-API/20241221-002633
base:   e90c9612ac3969cb8206029a26bcd2b6f5d4a942
patch link:    https://lore.kernel.org/r/20241220-media-rpi-hevc-dec-v1-5-0ebcc04ed42e%40raspberrypi.com
patch subject: [PATCH 5/7] media: platform: Add Raspberry Pi HEVC decoder driver
reproduce: (https://download.01.org/0day-ci/archive/20241221/202412210220.jZ2hzj8t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412210220.jZ2hzj8t-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
   Warning: Documentation/hwmon/isl28022.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/isl,isl28022.yaml
   Warning: Documentation/translations/ja_JP/SubmittingPatches references a file that doesn't exist: linux-2.6.12-vanilla/Documentation/dontdiff
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/media/raspberrypi,rpi_hevc_dec.yaml
   Warning: lib/Kconfig.debug references a file that doesn't exist: Documentation/dev-tools/fault-injection/fault-injection.rst
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

