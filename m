Return-Path: <linux-media+bounces-65120-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dfdsGaifMmqa2wUAu9opvQ
	(envelope-from <linux-media+bounces-65120-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 15:22:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 116E669A0DD
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 15:22:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=d0cmWZl2;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65120-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-65120-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4990C30386F1
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 13:22:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF029405C30;
	Wed, 17 Jun 2026 13:22:16 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE4C3BA24F;
	Wed, 17 Jun 2026 13:22:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781702536; cv=none; b=aBV4KjXyhRRxe3+MO7JM7wjGoofXMYhxJGkoj3o8uHunyoAZPZ++ipuw/WrdbtPwho8zmtR1fS4llFYSzCvrMelCJARG54JQVyutFhePVKUTutrdXyRqRjWxVO0sAeMQhpytDXBSa95Da4AoQqyTv75KaVQjjpDnw+LbNX9xWbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781702536; c=relaxed/simple;
	bh=pNGaGpSrgWGb3l5YxS2grAl6BpAaLl1oDeZXOLOP+po=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qrY41Kbrus1eOOkxmDWH1wjcC7MN20mGQk6LuDMnSflVwCxWhSuKW6j4OBTGhhhBxczaVCEdWAOP8A49lv9FqXXabTvljggXAEObsmoYMWEcj6qOUk1S4PschgfAsuXCN0EJRYUcxeRgSXBTsBgsqa/pctKty/k4JYOBmCjEeZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d0cmWZl2; arc=none smtp.client-ip=192.198.163.18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781702533; x=1813238533;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pNGaGpSrgWGb3l5YxS2grAl6BpAaLl1oDeZXOLOP+po=;
  b=d0cmWZl2of6JMdILARVXUdzx/DyUHq1I03q5AwRXlX9Rht8GI2wt1U71
   YexmHCK9HHV7dxmD3ko0AginjQ5rLvP2qoGZfTwGm2TzgjpvofwuwZWlc
   ZXIAxGDjMhbaA5Cl2ok/uzDqvm8HHRO4nDi8OGBp6eckkE8ynzdEtNe+F
   4kWw9sbp/HY3PcUZ7jHn3A8eJ0DdOOg6bPqMabUIXuYr27r5/tB7j/vWW
   7SI2aPlvrdKP66vYiBST1CHy8xI5vcTUdRRxC1Lh1JkViT7V8tQqIU/Ka
   aQmSWQh5s05I5CUj/djaTY4JkwX2e8d5I9sCsSAy5B9T8gxZZ9ER1R0x8
   A==;
X-CSE-ConnectionGUID: 3geVtneKRtaqCSDH+D4XUg==
X-CSE-MsgGUID: KoM3HaYJThKJuzYu4JgOkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="81622520"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; 
   d="scan'208";a="81622520"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 06:22:13 -0700
X-CSE-ConnectionGUID: jHZb6Hf2QYisk4wQS+ctGQ==
X-CSE-MsgGUID: LkjlwfBCSnqRbu2TzKMc0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; 
   d="scan'208";a="249968387"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 17 Jun 2026 06:22:11 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZqDZ-000000005Kj-0MGh;
	Wed, 17 Jun 2026 13:22:09 +0000
Date: Wed, 17 Jun 2026 15:21:14 +0200
From: kernel test robot <lkp@intel.com>
To: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bod@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Subject: Re: [PATCH 3/3] media: iris: Add ROI support framework for iris
 video encoder
Message-ID: <202606171554.03yt9utn-lkp@intel.com>
References: <20260616-enc_roi_enable-v1-3-fefcc4e76f33@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260616-enc_roi_enable-v1-3-fefcc4e76f33@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65120-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:deepa.madivalara@oss.qualcomm.com,m:mchehab@kernel.org,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:oe-kbuild-all@lists.linux.dev,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,intel.com:dkim,intel.com:email,intel.com:mid,intel.com:from_mime,01.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 116E669A0DD

Hi Deepa,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 06cb687a5132fcffe624c0070576ab852ac6b568]

url:    https://github.com/intel-lab-lkp/linux/commits/Deepa-Guthyappa-Madivalara/media-uapi-Introduce-new-control-for-video-encoder-ROI/20260617-074155
base:   06cb687a5132fcffe624c0070576ab852ac6b568
patch link:    https://lore.kernel.org/r/20260616-enc_roi_enable-v1-3-fefcc4e76f33%40oss.qualcomm.com
patch subject: [PATCH 3/3] media: iris: Add ROI support framework for iris video encoder
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260617/202606171554.03yt9utn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606171554.03yt9utn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/userspace-api/landlock:550: ./include/uapi/linux/landlock.h:50: ERROR: Unknown target name: "scope flags". [docutils]
   Documentation/userspace-api/landlock:550: ./include/uapi/linux/landlock.h:24: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:559: ./include/uapi/linux/landlock.h:168: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:559: ./include/uapi/linux/landlock.h:191: ERROR: Unknown target name: "network flags". [docutils]
   Documentation/networking/skbuff:36: ./include/linux/skbuff.h:181: WARNING: Failed to create a cross reference. A title or caption not found: 'crc' [ref.ref]
>> include/uapi/linux/videodev2.h:1998: WARNING: Invalid xref: std:ref:`v4l2-ctrl-type-s8`. Possible alternatives:
   c:type:`V4L.v4l2_ctrl_type` (from userspace-api/media/v4l/vidioc-queryctrl)
   c:struct:`v4l2_ctrl_type_ops` (from driver-api/media/v4l2-controls)
   c:struct:`v4l2_ctrl_ops` (from driver-api/media/v4l2-controls) [ref.missing]
>> include/uapi/linux/videodev2.h:1998: WARNING: undefined label: 'v4l2-ctrl-type-s8' [ref.ref]


vim +1998 include/uapi/linux/videodev2.h

  1944	
  1945	enum v4l2_ctrl_type {
  1946		V4L2_CTRL_TYPE_INTEGER	     = 1,
  1947		V4L2_CTRL_TYPE_BOOLEAN	     = 2,
  1948		V4L2_CTRL_TYPE_MENU	     = 3,
  1949		V4L2_CTRL_TYPE_BUTTON	     = 4,
  1950		V4L2_CTRL_TYPE_INTEGER64     = 5,
  1951		V4L2_CTRL_TYPE_CTRL_CLASS    = 6,
  1952		V4L2_CTRL_TYPE_STRING        = 7,
  1953		V4L2_CTRL_TYPE_BITMASK       = 8,
  1954		V4L2_CTRL_TYPE_INTEGER_MENU  = 9,
  1955	
  1956		/* Compound types are >= 0x0100 */
  1957		V4L2_CTRL_COMPOUND_TYPES     = 0x0100,
  1958		V4L2_CTRL_TYPE_U8	     = 0x0100,
  1959		V4L2_CTRL_TYPE_U16	     = 0x0101,
  1960		V4L2_CTRL_TYPE_U32	     = 0x0102,
  1961		V4L2_CTRL_TYPE_AREA          = 0x0106,
  1962		V4L2_CTRL_TYPE_RECT	     = 0x0107,
  1963	
  1964		V4L2_CTRL_TYPE_HDR10_CLL_INFO		= 0x0110,
  1965		V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY	= 0x0111,
  1966	
  1967		V4L2_CTRL_TYPE_H264_SPS             = 0x0200,
  1968		V4L2_CTRL_TYPE_H264_PPS		    = 0x0201,
  1969		V4L2_CTRL_TYPE_H264_SCALING_MATRIX  = 0x0202,
  1970		V4L2_CTRL_TYPE_H264_SLICE_PARAMS    = 0x0203,
  1971		V4L2_CTRL_TYPE_H264_DECODE_PARAMS   = 0x0204,
  1972		V4L2_CTRL_TYPE_H264_PRED_WEIGHTS    = 0x0205,
  1973	
  1974		V4L2_CTRL_TYPE_FWHT_PARAMS	    = 0x0220,
  1975	
  1976		V4L2_CTRL_TYPE_VP8_FRAME            = 0x0240,
  1977	
  1978		V4L2_CTRL_TYPE_MPEG2_QUANTISATION   = 0x0250,
  1979		V4L2_CTRL_TYPE_MPEG2_SEQUENCE       = 0x0251,
  1980		V4L2_CTRL_TYPE_MPEG2_PICTURE        = 0x0252,
  1981	
  1982		V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR	= 0x0260,
  1983		V4L2_CTRL_TYPE_VP9_FRAME		= 0x0261,
  1984	
  1985		V4L2_CTRL_TYPE_HEVC_SPS			= 0x0270,
  1986		V4L2_CTRL_TYPE_HEVC_PPS			= 0x0271,
  1987		V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS	= 0x0272,
  1988		V4L2_CTRL_TYPE_HEVC_SCALING_MATRIX	= 0x0273,
  1989		V4L2_CTRL_TYPE_HEVC_DECODE_PARAMS	= 0x0274,
  1990		V4L2_CTRL_TYPE_HEVC_EXT_SPS_ST_RPS	= 0x0275,
  1991		V4L2_CTRL_TYPE_HEVC_EXT_SPS_LT_RPS	= 0x0276,
  1992	
  1993		V4L2_CTRL_TYPE_AV1_SEQUENCE	    = 0x280,
  1994		V4L2_CTRL_TYPE_AV1_TILE_GROUP_ENTRY = 0x281,
  1995		V4L2_CTRL_TYPE_AV1_FRAME	    = 0x282,
  1996		V4L2_CTRL_TYPE_AV1_FILM_GRAIN	    = 0x283,
  1997	
> 1998		V4L2_CTRL_TYPE_S8		    = 0x284,
  1999	};
  2000	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

