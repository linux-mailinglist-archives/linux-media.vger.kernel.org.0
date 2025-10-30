Return-Path: <linux-media+bounces-45960-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DD9C1E39B
	for <lists+linux-media@lfdr.de>; Thu, 30 Oct 2025 04:40:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9C78B34D0EA
	for <lists+linux-media@lfdr.de>; Thu, 30 Oct 2025 03:40:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95C782D47F5;
	Thu, 30 Oct 2025 03:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LMN0IIwW"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE95021ABAC;
	Thu, 30 Oct 2025 03:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761795629; cv=none; b=GxsIhFbVfPdGKDIi0Q0Y7kZNRS4NtZZDvOhuEA0dOnOIIA2IuFnJEDRFsvKZkIFRWrleXPPsm87swQH2m9dpfiJKXn4X807WQc5UOgF0+dWwxjJEArBmnWCUn8nZWrd7Sw0rDy2rO9smGrRAnOcuJlx0XhchHUIv37/QdcX2iMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761795629; c=relaxed/simple;
	bh=eP+v44bFnQV6pzfjh1fsjAmhu/NjG8eSqtbS6lHqGyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=progKE2uBwQf8Oa6v783LuBMr5ECTL14Pc9l7BPhjrGP/WSF+vIYXzEVC1fK+pgy7b5CXN8gXrZGCv8SkdOCAMWuwdQfdRUWYm1yuNv6eKikLGfC+NsZBIegnNJ5nmVp5B6y/kLVKxFmx1zcvcJBl5YWnzGgEr0GrITyg++clrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LMN0IIwW; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761795626; x=1793331626;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=eP+v44bFnQV6pzfjh1fsjAmhu/NjG8eSqtbS6lHqGyo=;
  b=LMN0IIwWIa4r8Bfe+VJqkoh+xIvfELrc4DCSOEauIp+Hh7Tzqm6R1+JU
   UcD+k4HLxE+5j/bXnNduQbzqBRR/hXJpI5eLv5JJdUAMzg3BshDujZcjT
   6CXBGbIQqlJjNUYNtP+05/Ra19+OdiZ4BxgwT+tWjc+DIKq7VZdrPebz/
   Rs8naQZa9Ki0NApf3IsP22mv4+V89lkU/JcB3I6cNK/L5r9Xqq2lFA+1G
   iiVXgHcApgppvV9TwC7FhFYyHFwtPOEyOycZ5y9ULnVEm3d+zPlgB77O3
   zH1yu7u+tL1nd/DwkpitSUhvK3jbqKiMVtkbhDC8s1fStruX0LsZxbA6t
   w==;
X-CSE-ConnectionGUID: Q6PUKDdhR7e+31tYN6x1qw==
X-CSE-MsgGUID: LeCEIcaZTLacXzEAaGLPNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="74528614"
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="74528614"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 20:40:25 -0700
X-CSE-ConnectionGUID: IXqawMBZRs6YZejWKU1Vmw==
X-CSE-MsgGUID: 4mtAaMg5T9eoMBdWxPoang==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="216694173"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 29 Oct 2025 20:40:22 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEJUw-000LQF-12;
	Thu, 30 Oct 2025 03:39:33 +0000
Date: Thu, 30 Oct 2025 11:38:32 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Apitzsch via B4 Relay <devnull+git.apitzsch.eu@kernel.org>,
	Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vincent Knecht <vincent.knecht@mailoo.org>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
Subject: Re: [PATCH v7 3/4] media: qcom: camss: Add support for MSM8939
Message-ID: <202510301103.9EJIzPFp-lkp@intel.com>
References: <20251028-camss-8x39-vbif-v7-3-91ee8becda85@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251028-camss-8x39-vbif-v7-3-91ee8becda85@apitzsch.eu>

Hi André,

kernel test robot noticed the following build warnings:

[auto build test WARNING on f7d2388eeec24966fc4d5cf32d706f0514f29ac5]

url:    https://github.com/intel-lab-lkp/linux/commits/Andr-Apitzsch-via-B4-Relay/media-dt-bindings-Add-qcom-msm8939-camss/20251029-053926
base:   f7d2388eeec24966fc4d5cf32d706f0514f29ac5
patch link:    https://lore.kernel.org/r/20251028-camss-8x39-vbif-v7-3-91ee8becda85%40apitzsch.eu
patch subject: [PATCH v7 3/4] media: qcom: camss: Add support for MSM8939
config: parisc-randconfig-001-20251030 (https://download.01.org/0day-ci/archive/20251030/202510301103.9EJIzPFp-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251030/202510301103.9EJIzPFp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510301103.9EJIzPFp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/qcom/camss/camss.c:4458:3: error: 'const struct camss_resources' has no member named 'link_entities'
     .link_entities = camss_link_entities
      ^~~~~~~~~~~~~
>> drivers/media/platform/qcom/camss/camss.c:4458:19: warning: excess elements in struct initializer
     .link_entities = camss_link_entities
                      ^~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss.c:4458:19: note: (near initialization for 'msm8939_resources')


vim +4458 drivers/media/platform/qcom/camss/camss.c

  4448	
  4449	static const struct camss_resources msm8939_resources = {
  4450		.version = CAMSS_8x39,
  4451		.csiphy_res = csiphy_res_8x39,
  4452		.csid_res = csid_res_8x39,
  4453		.ispif_res = &ispif_res_8x39,
  4454		.vfe_res = vfe_res_8x39,
  4455		.csiphy_num = ARRAY_SIZE(csiphy_res_8x39),
  4456		.csid_num = ARRAY_SIZE(csid_res_8x39),
  4457		.vfe_num = ARRAY_SIZE(vfe_res_8x39),
> 4458		.link_entities = camss_link_entities
  4459	};
  4460	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

