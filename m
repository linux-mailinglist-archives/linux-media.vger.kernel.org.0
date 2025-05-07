Return-Path: <linux-media+bounces-31940-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 809BEAADA9F
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 11:01:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA2774E47E5
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 09:01:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D73821D3F0;
	Wed,  7 May 2025 09:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pi7pvp58"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21BA4A0C;
	Wed,  7 May 2025 09:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746608486; cv=none; b=NHo2zSzGlXjUTgJ3LuQ4jdpCGxxNg66L79r4oP6C6KikFA/clJYePY97u6k0tqYYmWgfjF8khcfowxEOsPhMEhDOFQFvbzcEx5lj2sndKQsHoJ6WTMjRxFdgB9r1GA0QmZ0uzzGEFEp3TRNPBfWCEQ2MpTlILz/prXb65damu0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746608486; c=relaxed/simple;
	bh=92ZAl/vce9aK0X2fiuFITENMdA5Xo80gVxEbtjW8PDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gx6vGsP0L99G66/Dk0LD9UV97T1TxVP4co4agLToXbUhnSe4cn03UR3bkmpNf/zgxXLH0EOmatBUWfwwTbeDwDmMbipPaYHIm1lLercS4npyNVZDZsVOodATEhLKqRFKdUHNCDngNOp794FLtdrsg8QIMOjX4QuMHaic+4jCEl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pi7pvp58; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746608484; x=1778144484;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=92ZAl/vce9aK0X2fiuFITENMdA5Xo80gVxEbtjW8PDA=;
  b=Pi7pvp58o+fNrX3HJt4x7vs0EQ5R4BtllRiKAt8ubMvBUtM+AbIIfleV
   TKX0kGHDRoClhYssA0To8OyG5fWhVgSBvJ46yXR2Y4t5urmBbQhvj7aaq
   lJxW4eZHzyxE+t21JCVhrc36WmCE1drJPqrP6tzPkBy4uLOrm+4Asyqv9
   pA/iPUC+KQpUSZipVUxWaIUY1ENztEhtPJaOIoV0JamRAgw1gJvJ/n2+s
   JmnZlSzqSo3UReO/9Ti+4vyk84MHSv2EkxHulc8iMKG753mswWOCQUt7R
   DZ3Xyqq0RNqK8xxwlaQbB4UtDRa+5U/NNm0uX9CypzyRL1Cn+AABSPGR6
   Q==;
X-CSE-ConnectionGUID: aMcWrWr1S2KyTx789MsSKQ==
X-CSE-MsgGUID: hLH4XKRaRZyL10QKO3pGwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="59677622"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="59677622"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 02:01:23 -0700
X-CSE-ConnectionGUID: j7W8zLZESAW6HBJcRejCAw==
X-CSE-MsgGUID: B3g8VEZ6SB6FdaFGxpb19w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="135762779"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 07 May 2025 02:01:20 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCaeT-0007SD-1Y;
	Wed, 07 May 2025 09:01:17 +0000
Date: Wed, 7 May 2025 17:01:12 +0800
From: kernel test robot <lkp@intel.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: media: qcom,x1e80100-camss: Tighten the
 property regex pattern
Message-ID: <202505071636.546zWm4r-lkp@intel.com>
References: <20250502204142.2064496-2-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502204142.2064496-2-vladimir.zapolskiy@linaro.org>

Hi Vladimir,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20250502]
[cannot apply to robh/for-next v6.15-rc4 v6.15-rc3 v6.15-rc2 linus/master v6.15-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vladimir-Zapolskiy/dt-bindings-media-qcom-x1e80100-camss-Tighten-the-property-regex-pattern/20250503-044307
base:   next-20250502
patch link:    https://lore.kernel.org/r/20250502204142.2064496-2-vladimir.zapolskiy%40linaro.org
patch subject: [PATCH 1/3] dt-bindings: media: qcom,x1e80100-camss: Tighten the property regex pattern
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250507/202505071636.546zWm4r-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071636.546zWm4r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071636.546zWm4r-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/scsi/qedf/qedf_main.c:702:9: warning: braces around scalar initializer
     702 |         {
         |         ^
   drivers/scsi/qedf/qedf_main.c:702:9: note: (near initialization for 'qedf_cb_ops.get_login_failures')
>> drivers/scsi/qedf/qedf_main.c:703:17: error: field name not in record or union initializer
     703 |                 .link_update = qedf_link_update,
         |                 ^
   drivers/scsi/qedf/qedf_main.c:703:17: note: (near initialization for 'qedf_cb_ops.get_login_failures')
>> drivers/scsi/qedf/qedf_main.c:703:32: error: initialization of 'u32 (*)(void *)' {aka 'unsigned int (*)(void *)'} from incompatible pointer type 'void (*)(void *, struct qed_link_output *)' [-Werror=incompatible-pointer-types]
     703 |                 .link_update = qedf_link_update,
         |                                ^~~~~~~~~~~~~~~~
   drivers/scsi/qedf/qedf_main.c:703:32: note: (near initialization for 'qedf_cb_ops.get_login_failures')
   drivers/scsi/qedf/qedf_main.c:704:17: error: field name not in record or union initializer
     704 |                 .bw_update = qedf_bw_update,
         |                 ^
   drivers/scsi/qedf/qedf_main.c:704:17: note: (near initialization for 'qedf_cb_ops.get_login_failures')
   drivers/scsi/qedf/qedf_main.c:704:30: warning: excess elements in scalar initializer
     704 |                 .bw_update = qedf_bw_update,
         |                              ^~~~~~~~~~~~~~
   drivers/scsi/qedf/qedf_main.c:704:30: note: (near initialization for 'qedf_cb_ops.get_login_failures')
   drivers/scsi/qedf/qedf_main.c:705:17: error: field name not in record or union initializer
     705 |                 .schedule_recovery_handler = qedf_schedule_recovery_handler,
         |                 ^
   drivers/scsi/qedf/qedf_main.c:705:17: note: (near initialization for 'qedf_cb_ops.get_login_failures')
   drivers/scsi/qedf/qedf_main.c:705:46: warning: excess elements in scalar initializer
     705 |                 .schedule_recovery_handler = qedf_schedule_recovery_handler,
         |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/qedf/qedf_main.c:705:46: note: (near initialization for 'qedf_cb_ops.get_login_failures')
   drivers/scsi/qedf/qedf_main.c:706:17: error: field name not in record or union initializer
     706 |                 .dcbx_aen = qedf_dcbx_handler,
         |                 ^
   drivers/scsi/qedf/qedf_main.c:706:17: note: (near initialization for 'qedf_cb_ops.get_login_failures')
   drivers/scsi/qedf/qedf_main.c:706:29: warning: excess elements in scalar initializer
     706 |                 .dcbx_aen = qedf_dcbx_handler,
         |                             ^~~~~~~~~~~~~~~~~
   drivers/scsi/qedf/qedf_main.c:706:29: note: (near initialization for 'qedf_cb_ops.get_login_failures')
   drivers/scsi/qedf/qedf_main.c:707:17: error: field name not in record or union initializer
     707 |                 .get_generic_tlv_data = qedf_get_generic_tlv_data,
         |                 ^
   drivers/scsi/qedf/qedf_main.c:707:17: note: (near initialization for 'qedf_cb_ops.get_login_failures')
   drivers/scsi/qedf/qedf_main.c:707:41: warning: excess elements in scalar initializer
     707 |                 .get_generic_tlv_data = qedf_get_generic_tlv_data,
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/qedf/qedf_main.c:707:41: note: (near initialization for 'qedf_cb_ops.get_login_failures')
   drivers/scsi/qedf/qedf_main.c:708:17: error: field name not in record or union initializer
     708 |                 .get_protocol_tlv_data = qedf_get_protocol_tlv_data,
         |                 ^
   drivers/scsi/qedf/qedf_main.c:708:17: note: (near initialization for 'qedf_cb_ops.get_login_failures')
   drivers/scsi/qedf/qedf_main.c:708:42: warning: excess elements in scalar initializer
     708 |                 .get_protocol_tlv_data = qedf_get_protocol_tlv_data,
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/qedf/qedf_main.c:708:42: note: (near initialization for 'qedf_cb_ops.get_login_failures')
   drivers/scsi/qedf/qedf_main.c:709:17: error: field name not in record or union initializer
     709 |                 .schedule_hw_err_handler = qedf_schedule_hw_err_handler,
         |                 ^
   drivers/scsi/qedf/qedf_main.c:709:17: note: (near initialization for 'qedf_cb_ops.get_login_failures')
   drivers/scsi/qedf/qedf_main.c:709:44: warning: excess elements in scalar initializer
     709 |                 .schedule_hw_err_handler = qedf_schedule_hw_err_handler,
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/qedf/qedf_main.c:709:44: note: (near initialization for 'qedf_cb_ops.get_login_failures')
   drivers/scsi/qedf/qedf_main.c:702:9: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     702 |         {
         |         ^
   drivers/scsi/qedf/qedf_main.c:702:9: note: (near initialization for 'qedf_cb_ops')
   cc1: some warnings being treated as errors
--
   drivers/net/ethernet/qlogic/qede/qede_main.c:206:9: warning: braces around scalar initializer
     206 |         {
         |         ^
   drivers/net/ethernet/qlogic/qede/qede_main.c:206:9: note: (near initialization for 'qede_ll_ops.force_mac')
   drivers/net/ethernet/qlogic/qede/qede_main.c:208:17: error: field name not in record or union initializer
     208 |                 .arfs_filter_op = qede_arfs_filter_op,
         |                 ^
   drivers/net/ethernet/qlogic/qede/qede_main.c:208:17: note: (near initialization for 'qede_ll_ops.force_mac')
>> drivers/net/ethernet/qlogic/qede/qede_main.c:208:35: error: initialization of 'void (*)(void *, u8 *, bool)' {aka 'void (*)(void *, unsigned char *, _Bool)'} from incompatible pointer type 'void (*)(void *, void *, u8)' {aka 'void (*)(void *, void *, unsigned char)'} [-Werror=incompatible-pointer-types]
     208 |                 .arfs_filter_op = qede_arfs_filter_op,
         |                                   ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/qlogic/qede/qede_main.c:208:35: note: (near initialization for 'qede_ll_ops.force_mac')
   drivers/net/ethernet/qlogic/qede/qede_main.c:210:17: error: field name not in record or union initializer
     210 |                 .link_update = qede_link_update,
         |                 ^
   drivers/net/ethernet/qlogic/qede/qede_main.c:210:17: note: (near initialization for 'qede_ll_ops.force_mac')
   drivers/net/ethernet/qlogic/qede/qede_main.c:210:32: warning: excess elements in scalar initializer
     210 |                 .link_update = qede_link_update,
         |                                ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/qlogic/qede/qede_main.c:210:32: note: (near initialization for 'qede_ll_ops.force_mac')
   drivers/net/ethernet/qlogic/qede/qede_main.c:211:17: error: field name not in record or union initializer
     211 |                 .schedule_recovery_handler = qede_schedule_recovery_handler,
         |                 ^
   drivers/net/ethernet/qlogic/qede/qede_main.c:211:17: note: (near initialization for 'qede_ll_ops.force_mac')
   drivers/net/ethernet/qlogic/qede/qede_main.c:211:46: warning: excess elements in scalar initializer
     211 |                 .schedule_recovery_handler = qede_schedule_recovery_handler,
         |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/qlogic/qede/qede_main.c:211:46: note: (near initialization for 'qede_ll_ops.force_mac')
   drivers/net/ethernet/qlogic/qede/qede_main.c:212:17: error: field name not in record or union initializer
     212 |                 .schedule_hw_err_handler = qede_schedule_hw_err_handler,
         |                 ^
   drivers/net/ethernet/qlogic/qede/qede_main.c:212:17: note: (near initialization for 'qede_ll_ops.force_mac')
   drivers/net/ethernet/qlogic/qede/qede_main.c:212:44: warning: excess elements in scalar initializer
     212 |                 .schedule_hw_err_handler = qede_schedule_hw_err_handler,
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/qlogic/qede/qede_main.c:212:44: note: (near initialization for 'qede_ll_ops.force_mac')
   drivers/net/ethernet/qlogic/qede/qede_main.c:213:17: error: field name not in record or union initializer
     213 |                 .get_generic_tlv_data = qede_get_generic_tlv_data,
         |                 ^
   drivers/net/ethernet/qlogic/qede/qede_main.c:213:17: note: (near initialization for 'qede_ll_ops.force_mac')
   drivers/net/ethernet/qlogic/qede/qede_main.c:213:41: warning: excess elements in scalar initializer
     213 |                 .get_generic_tlv_data = qede_get_generic_tlv_data,
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/qlogic/qede/qede_main.c:213:41: note: (near initialization for 'qede_ll_ops.force_mac')
   drivers/net/ethernet/qlogic/qede/qede_main.c:214:17: error: field name not in record or union initializer
     214 |                 .get_protocol_tlv_data = qede_get_eth_tlv_data,
         |                 ^
   drivers/net/ethernet/qlogic/qede/qede_main.c:214:17: note: (near initialization for 'qede_ll_ops.force_mac')
   drivers/net/ethernet/qlogic/qede/qede_main.c:214:42: warning: excess elements in scalar initializer
     214 |                 .get_protocol_tlv_data = qede_get_eth_tlv_data,
         |                                          ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/qlogic/qede/qede_main.c:214:42: note: (near initialization for 'qede_ll_ops.force_mac')
   drivers/net/ethernet/qlogic/qede/qede_main.c:206:9: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     206 |         {
         |         ^
   drivers/net/ethernet/qlogic/qede/qede_main.c:206:9: note: (near initialization for 'qede_ll_ops')
   drivers/net/ethernet/qlogic/qede/qede_main.c:216:22: warning: initialized field overwritten [-Woverride-init]
     216 |         .force_mac = qede_force_mac,
         |                      ^~~~~~~~~~~~~~
   drivers/net/ethernet/qlogic/qede/qede_main.c:216:22: note: (near initialization for 'qede_ll_ops.force_mac')
   cc1: some warnings being treated as errors


vim +703 drivers/scsi/qedf/qedf_main.c

61d8658b4a435e Dupuis, Chad   2017-02-15  700  
61d8658b4a435e Dupuis, Chad   2017-02-15  701  static struct qed_fcoe_cb_ops qedf_cb_ops = {
61d8658b4a435e Dupuis, Chad   2017-02-15  702  	{
61d8658b4a435e Dupuis, Chad   2017-02-15 @703  		.link_update = qedf_link_update,
6e7c8eea929e54 Saurav Kashyap 2020-04-16  704  		.bw_update = qedf_bw_update,
f6b172f21999cf Chad Dupuis    2020-04-16  705  		.schedule_recovery_handler = qedf_schedule_recovery_handler,
61d8658b4a435e Dupuis, Chad   2017-02-15  706  		.dcbx_aen = qedf_dcbx_handler,
8673daf4f55bf3 Chad Dupuis    2018-05-22  707  		.get_generic_tlv_data = qedf_get_generic_tlv_data,
642a0b37e66946 Chad Dupuis    2018-05-22  708  		.get_protocol_tlv_data = qedf_get_protocol_tlv_data,
55e049910e08ca Saurav Kashyap 2020-09-07  709  		.schedule_hw_err_handler = qedf_schedule_hw_err_handler,
61d8658b4a435e Dupuis, Chad   2017-02-15  710  	}
61d8658b4a435e Dupuis, Chad   2017-02-15  711  };
61d8658b4a435e Dupuis, Chad   2017-02-15  712  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

