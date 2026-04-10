Return-Path: <linux-media+bounces-58530-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHJuMszJ2GmkiAgAu9opvQ
	(envelope-from <linux-media+bounces-58530-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 11:58:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0173D54FE
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 11:58:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DD4633007B02
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 09:58:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DDB33A783C;
	Fri, 10 Apr 2026 09:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AKXE8Fkc"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6069321CC5A
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 09:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775815110; cv=none; b=eAWSuJ2atlLrBphGmuTv2Ew8tQhgi4ZISHZS1jrmTJxWGKAkACm+Z3xrV2j0ebaKnyGxsaSRAtKtdfgQo1t0k9K//ILRFZ25V1tmMPkUqYp8Tdzm0zKwfY16mPFNo8gA1k+vvwM6yJ2tJ0kQHJQsl0GuIvK4Sw4xpHl/OzKgdtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775815110; c=relaxed/simple;
	bh=0XID9MjzbAMMVm0z+ekXB3Y+5LN0NooVElExEKdHCIA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sQhMc10YUOCPR7nNNZUyPzt0vkg4ElytpUz9U3R/x1VYNE4XaF5swKdO/NweTbNLflysICG2Ko8Fw/PU9TWpty42HL7Tc+APDL+QjmWsP+/6Av6y6u64lyNvhTVP0UTzXNxyc4jxWD5DpmilZ26fi5OU3WLlhag5skdwValAqfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AKXE8Fkc; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775815107; x=1807351107;
  h=date:from:to:cc:subject:message-id;
  bh=0XID9MjzbAMMVm0z+ekXB3Y+5LN0NooVElExEKdHCIA=;
  b=AKXE8FkcGEtcFByTK2WsaM2yjBhm/x50y0BbegrI5e/I2HI+XriJpZvM
   zXy2HC4u4iL7dXHahxaEi7k449esZDiLWfFjhBjr4fZ/sF9gsL0Bh3vNK
   H8YIb9x/Er7W24+DGGyKEmaRq0CryHaqNqT+1iJFS9KsoWI1j243QNZBj
   0xNs+4RiE5ZUIsOS/Y6jgfgLKD3JDsX15qoxSoWs2P8BwtBJBosq4wFFW
   aGbiKFs9VmqSQcugJDeOt3OKBVE0LS32T0xVMoVt7ZRzFpZsm+XL46fRa
   JtLo9QYF4bP6FMDEo1Gxnb+Q0q1cmzXiT0l9Ib/kCL+bmSbuwTZUV566/
   A==;
X-CSE-ConnectionGUID: T5QE2chdSyaXIJTIrKFzaA==
X-CSE-MsgGUID: eiUoyoaWS8mOVKKTcbUwMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="87461201"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="87461201"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 02:58:26 -0700
X-CSE-ConnectionGUID: HBLq59smTfC/PVvCC8WdBw==
X-CSE-MsgGUID: IfQFr6oUTQSUhQ1GgrA76g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="228204458"
Received: from lkp-server01.sh.intel.com (HELO 6449335cace3) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 10 Apr 2026 02:58:25 -0700
Received: from kbuild by 6449335cace3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wB8d5-000000003a9-05uI;
	Fri, 10 Apr 2026 09:58:23 +0000
Date: Fri, 10 Apr 2026 17:57:59 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata 92/115]
 drivers/media/i2c/imx219.c:511: undefined reference to `__aeabi_ldivmod'
Message-ID: <202604101719.IZnukkGx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58530-lists,linux-media=lfdr.de];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:dkim,intel.com:email,intel.com:mid]
X-Rspamd-Queue-Id: DB0173D54FE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   ace2f872475ed78b708d667f1b2d004b192eeeb1
commit: fbaf57c5f207a3fbab657d5bc757041ba26d5d69 [92/115] media: imx219: Allow configuring cropping and binning through CRSM
config: arm-randconfig-r072-20260408 (https://download.01.org/0day-ci/archive/20260410/202604101719.IZnukkGx-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
smatch: v0.5.0-9004-gb810ac53
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260410/202604101719.IZnukkGx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604101719.IZnukkGx-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/media/i2c/imx219.o: in function `imx219_apply_binning':
>> drivers/media/i2c/imx219.c:511: undefined reference to `__aeabi_ldivmod'
>> arm-linux-gnueabi-ld: drivers/media/i2c/imx219.c:512: undefined reference to `__aeabi_ldivmod'


vim +511 drivers/media/i2c/imx219.c

   484	
   485	static void imx219_apply_binning(struct v4l2_subdev_state *state,
   486					 struct v4l2_rect *crop, unsigned int index)
   487	{
   488		struct v4l2_rect *compose =
   489			v4l2_subdev_state_get_compose(state, IMX219_PAD_IMAGE);
   490		struct v4l2_mbus_framefmt *source_format =
   491			v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
   492						     IMX219_STREAM_IMAGE);
   493		struct v4l2_mbus_framefmt *embedded_source_format =
   494			v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
   495						     IMX219_STREAM_EDATA);
   496		s64 binning = imx219_binning_factors[index];
   497	
   498		crop->width = clamp(crop->width, IMX219_OUTPUT_X_SIZE_MIN *
   499				    V4L2_BINNING_FACTORS_HNUM(binning),
   500				    IMX219_VISIBLE_WIDTH) & ~1;
   501		crop->height = clamp(crop->height, IMX219_OUTPUT_Y_SIZE_MIN *
   502				     V4L2_BINNING_FACTORS_VNUM(binning),
   503				     IMX219_VISIBLE_HEIGHT) & ~1;
   504		crop->left = clamp((unsigned int)crop->left, IMX219_VISIBLE_LEFT,
   505				   IMX219_VISIBLE_LEFT + IMX219_VISIBLE_WIDTH -
   506				   crop->width);
   507		crop->top = clamp((unsigned int)crop->top, IMX219_VISIBLE_TOP,
   508				  IMX219_VISIBLE_TOP + IMX219_VISIBLE_HEIGHT -
   509				  crop->height);
   510	
 > 511		compose->width = crop->width / V4L2_BINNING_FACTORS_HNUM(binning);
 > 512		compose->height = crop->height / V4L2_BINNING_FACTORS_VNUM(binning);
   513	
   514		source_format->width = compose->width;
   515		source_format->height = compose->height;
   516	
   517		struct v4l2_mbus_framefmt *embedded_format =
   518			v4l2_subdev_state_get_format(state, IMX219_PAD_EDATA);
   519	
   520		embedded_format->width =
   521			embedded_source_format->width = source_format->width;
   522	}
   523	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

