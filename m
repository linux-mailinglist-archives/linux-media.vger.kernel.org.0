Return-Path: <linux-media+bounces-52776-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKK9OBFoj2lHQwEAu9opvQ
	(envelope-from <linux-media+bounces-52776-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 19:06:09 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E96A138CDB
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 19:06:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 215F53019528
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 18:05:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C637337BBB;
	Fri, 13 Feb 2026 18:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gtKhs31o"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DAD016DC28;
	Fri, 13 Feb 2026 18:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771005956; cv=none; b=nZZWsj8yx0bEYdln4hk9wy25UvhqPx1EzdOoPeEaaRM8fY0BpsHB5tjkiqaM3deQluiZQgZLV06ZOYhWnn3HTSJChiARjtHYBygFc8KHOZDveyyFB9Cuky7SVMv9LFqoNb0H2zr2FR9hjGJdyfsiiJUxIQ57rrjVlG49KcNcM4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771005956; c=relaxed/simple;
	bh=pXI4ce7bv7t1mseVAckXbauP5KC8DVNYW4kqv4q6JZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lUDCdwbiTQqDGcL3xrDtTPEqvQyHHqMX6WFU3jL9RICiEWTIhmW8pAvWxMI+H4l020XxLzr74h1WQjZs+1rOfxcbsEw4uHDbGk0SNYX3IeUHgZlxU9rpBsV2M/2bJfBGhZ/BRHFNFd9ER2GvDrAXbchsyUg2A7TLB9wsPzr2KDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gtKhs31o; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771005953; x=1802541953;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pXI4ce7bv7t1mseVAckXbauP5KC8DVNYW4kqv4q6JZo=;
  b=gtKhs31o1wX3NduQ2tdC0YcbRRVqeoz94Ea1vSwBk2+3guMdh+ql4D+3
   0dIljfFK3Hl1M7ZE2PvOFMbKycM/WDgmfvWgPF1jycfvv7RElkOcPU7AO
   dsvaWLY+Wqln2OPk/4zlUFQhek6w4MdZDYlle7l8fLkxAvtOjGuzsSBbv
   s/1t7QTIkYf7LnMCXuJr1FwlMlWPNj5mst8XiYloQJFxuvQ4AzyA/dytc
   Y/ObgpNFXlWb+kHdQdIU4sKE2/Frphbwlb8CmRct+WExJkXgXsOL2xODe
   ZttOCwVh1OHX0bY8AHqDG4zmzWK6rcg82oATWKr7IOZ8wv9TYR2ZjdGN+
   Q==;
X-CSE-ConnectionGUID: oneAk6meQp2fSMZG3sdHyQ==
X-CSE-MsgGUID: yVp1mrosSN2sXTenBRVZ+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="72098982"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="72098982"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 10:05:52 -0800
X-CSE-ConnectionGUID: /qafZan4TuO/rc090c6Y0A==
X-CSE-MsgGUID: Lj4E4sb6SNSuOeo1w2hEig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="250641684"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 13 Feb 2026 10:05:49 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqxY3-000000001e5-37ON;
	Fri, 13 Feb 2026 18:05:47 +0000
Date: Fri, 13 Feb 2026 19:04:53 +0100
From: kernel test robot <lkp@intel.com>
To: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bod@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] media: v4l2-ctrls: add encoder maximum bitrate
 control
Message-ID: <202602131921.PUY3mqyw-lkp@intel.com>
References: <20260213-b4-add_sc7280_mbr-v1-1-e8d95b4e4809@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260213-b4-add_sc7280_mbr-v1-1-e8d95b4e4809@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52776-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,01.org:url]
X-Rspamd-Queue-Id: 0E96A138CDB
X-Rspamd-Action: no action

Hi Sachin,

kernel test robot noticed the following build errors:

[auto build test ERROR on c824345288d11e269ce41b36c105715bc2286050]

url:    https://github.com/intel-lab-lkp/linux/commits/Sachin-Kumar-Garg/media-v4l2-ctrls-add-encoder-maximum-bitrate-control/20260213-180753
base:   c824345288d11e269ce41b36c105715bc2286050
patch link:    https://lore.kernel.org/r/20260213-b4-add_sc7280_mbr-v1-1-e8d95b4e4809%40oss.qualcomm.com
patch subject: [PATCH 1/2] media: v4l2-ctrls: add encoder maximum bitrate control
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260213/202602131921.PUY3mqyw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602131921.PUY3mqyw-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   The parent of level 2 sections cannot be reached. The parser is at section level 2 but the current node has only 0 parent section(s).
   One reason may be a high level section used in a directive that parses its content into a base node not attached to the document
   (up to Docutils 0.21, these sections were silently dropped). [docutils]
   WARNING: ./net/bridge/br_private.h:267 struct member 'tunnel_hash' not described in 'net_bridge_vlan_group'
>> Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst:581: WARNING: Bullet list ends without a blank line; unexpected unindent. [docutils]
>> Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst:570: ERROR: Error parsing content block for the "flat-table" directive: two-level bullet list expected, but row 4 does not contain a second-level bullet list.


vim +570 Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst

4f14e3272f1ca1 Documentation/media/uapi/v4l/ext-ctrls-codec.rst          Hans Verkuil      2019-02-08  561  
4f14e3272f1ca1 Documentation/media/uapi/v4l/ext-ctrls-codec.rst          Hans Verkuil      2019-02-08  562  ``V4L2_CID_MPEG_VIDEO_BITRATE_MODE``
4f14e3272f1ca1 Documentation/media/uapi/v4l/ext-ctrls-codec.rst          Hans Verkuil      2019-02-08  563      (enum)
4f14e3272f1ca1 Documentation/media/uapi/v4l/ext-ctrls-codec.rst          Hans Verkuil      2019-02-08  564  
4f14e3272f1ca1 Documentation/media/uapi/v4l/ext-ctrls-codec.rst          Hans Verkuil      2019-02-08  565  enum v4l2_mpeg_video_bitrate_mode -
4f14e3272f1ca1 Documentation/media/uapi/v4l/ext-ctrls-codec.rst          Hans Verkuil      2019-02-08  566      Video bitrate mode. Possible values are:
4f14e3272f1ca1 Documentation/media/uapi/v4l/ext-ctrls-codec.rst          Hans Verkuil      2019-02-08  567  
4f14e3272f1ca1 Documentation/media/uapi/v4l/ext-ctrls-codec.rst          Hans Verkuil      2019-02-08  568  
4f14e3272f1ca1 Documentation/media/uapi/v4l/ext-ctrls-codec.rst          Hans Verkuil      2019-02-08  569  
4f14e3272f1ca1 Documentation/media/uapi/v4l/ext-ctrls-codec.rst          Hans Verkuil      2019-02-08 @570  .. flat-table::
4f14e3272f1ca1 Documentation/media/uapi/v4l/ext-ctrls-codec.rst          Hans Verkuil      2019-02-08  571      :header-rows:  0
4f14e3272f1ca1 Documentation/media/uapi/v4l/ext-ctrls-codec.rst          Hans Verkuil      2019-02-08  572      :stub-columns: 0
4f14e3272f1ca1 Documentation/media/uapi/v4l/ext-ctrls-codec.rst          Hans Verkuil      2019-02-08  573  
4f14e3272f1ca1 Documentation/media/uapi/v4l/ext-ctrls-codec.rst          Hans Verkuil      2019-02-08  574      * - ``V4L2_MPEG_VIDEO_BITRATE_MODE_VBR``
4f14e3272f1ca1 Documentation/media/uapi/v4l/ext-ctrls-codec.rst          Hans Verkuil      2019-02-08  575        - Variable bitrate
4f14e3272f1ca1 Documentation/media/uapi/v4l/ext-ctrls-codec.rst          Hans Verkuil      2019-02-08  576      * - ``V4L2_MPEG_VIDEO_BITRATE_MODE_CBR``
4f14e3272f1ca1 Documentation/media/uapi/v4l/ext-ctrls-codec.rst          Hans Verkuil      2019-02-08  577        - Constant bitrate
4ad1b0d410c88c Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst Maheshwar Ajja    2020-05-23  578      * - ``V4L2_MPEG_VIDEO_BITRATE_MODE_CQ``
4ad1b0d410c88c Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst Maheshwar Ajja    2020-05-23  579        - Constant quality
9e046466b28d68 Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst Sachin Kumar Garg 2026-02-13  580      * - ``V4L2_MPEG_VIDEO_BITRATE_MODE_MBR``
9e046466b28d68 Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst Sachin Kumar Garg 2026-02-13 @581        MBR Rate Control is a VBR Rate Control mode optimized for
9e046466b28d68 Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst Sachin Kumar Garg 2026-02-13  582        surveillance video contents which has high temporal correlation
9e046466b28d68 Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst Sachin Kumar Garg 2026-02-13  583        due to static camera positions. This Rate Control smartly identifies
9e046466b28d68 Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst Sachin Kumar Garg 2026-02-13  584        key-frames in the scene, and allocates more bits to them to improve
9e046466b28d68 Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst Sachin Kumar Garg 2026-02-13  585        the coding efficiency by taking advantage of high temporal
9e046466b28d68 Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst Sachin Kumar Garg 2026-02-13  586        correlation in surveillance videos.
4f14e3272f1ca1 Documentation/media/uapi/v4l/ext-ctrls-codec.rst          Hans Verkuil      2019-02-08  587  
4f14e3272f1ca1 Documentation/media/uapi/v4l/ext-ctrls-codec.rst          Hans Verkuil      2019-02-08  588  
4f14e3272f1ca1 Documentation/media/uapi/v4l/ext-ctrls-codec.rst          Hans Verkuil      2019-02-08  589  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

