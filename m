Return-Path: <linux-media+bounces-52326-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WMdwLj5VhmlzMAQAu9opvQ
	(envelope-from <linux-media+bounces-52326-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 21:55:26 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A551034AC
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 21:55:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DA990303BA6C
	for <lists+linux-media@lfdr.de>; Fri,  6 Feb 2026 20:55:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDA85311599;
	Fri,  6 Feb 2026 20:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T/gH0gIY"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6496730E83C
	for <linux-media@vger.kernel.org>; Fri,  6 Feb 2026 20:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770411320; cv=none; b=EAKwBc8eWc+OiFZ4+5+0q7//y6MWnfsQOu1JD20KaNlJVLKEchXduvdHgxsNvLya4uyUTzuFcLkWR/dgxI89asQHWsDYZtUTaPDDK+VYW7hAeLVGeLvqkh1i5276V+cd2QRN1U3eROYkEcypW7ZtEcqLyyU+ElrnUHAsVSigfz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770411320; c=relaxed/simple;
	bh=ziDT9QCEHaO7kXhspDjk7nQ8y1IOr/pOlBit3kY6WEY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AU8JH1aBNmAMUOpxIUytmo1Cy9hF0GzB98m8Gs+i9Y3r3y0Wf1DOqRTETPYpKWGEZdLIWVBNUJvdfDTsMZOero4DFJVU+LAoE7/FwAvTxqk5GjUr6juUzgLrlV1QcZQJIYIInPwFGucKaMGtXUL5f02dYirEfdl7IqKEfZbzm/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T/gH0gIY; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770411319; x=1801947319;
  h=date:from:to:cc:subject:message-id;
  bh=ziDT9QCEHaO7kXhspDjk7nQ8y1IOr/pOlBit3kY6WEY=;
  b=T/gH0gIYL2N4PMTFktYS+pks36nAd7nA8L+RJCM4X4C8cTm6RmrkfY/v
   RSRUDi+mL+W8t+Lg9IBeChQ4M6JUuOhT43Zybs8YkRw2TAMlf+rVw/NRJ
   KxOpCo0h25Yw+phSK1fiW1HDtwJJ/g42CaLKCEzG2rgrBzt3FGR7eqv2/
   I8TCXdrXJ4cmpRxsdjm9lZfIs/jY9HjB7BniKPuT6PO7VhIwzdiARW7tA
   OQ8B/wSXNznwOIdSeWyuzsneLDMKTT0xCosUNr+Vlb3osgYXU3pgVy70X
   K/RwzQlNtmQxXf5awFN/Ut5dX1+p/ufFrKk8uzXGEgeeN1Rl7/4HEy02i
   w==;
X-CSE-ConnectionGUID: YWoNtCxhRQ+g4WedmRZj3A==
X-CSE-MsgGUID: l7qggMQgSNC6G7QgUnTIaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="71515669"
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="71515669"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 12:55:19 -0800
X-CSE-ConnectionGUID: tPcgdwg2SMSeaBEzJXS8/w==
X-CSE-MsgGUID: YUW552YkQQu+7J56bpvmvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="215945782"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 Feb 2026 12:55:17 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voSrC-00000000l8c-3Jjx;
	Fri, 06 Feb 2026 20:55:14 +0000
Date: Sat, 07 Feb 2026 04:54:54 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata 51/88]
 drivers/media/i2c/ov2740.c:1301:19: error: incompatible function pointer
 types initializing 'int (*)(struct v4l2_subdev *, const struct
 v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct
 v4l2_subdev_selection *)' with an expression of type 'int...
Message-ID: <202602070437.4jphZAGt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.54 / 15.00];
	LONG_SUBJ(2.20)[293];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52326-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,intel.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 20A551034AC
X-Rspamd-Action: no action

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   17d48829c902c064710e9518b453bd252674ae5e
commit: bd8706aed5a5e6b8d7c0fcc9dbbdc5896b6684a4 [51/88] media: ov2740: Add support for G_SELECTION IOCTL
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260207/202602070437.4jphZAGt-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602070437.4jphZAGt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602070437.4jphZAGt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/i2c/ov2740.c:1301:19: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_selection *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_selection *)' [-Wincompatible-function-pointer-types]
    1301 |         .get_selection = ov2740_get_selection,
         |                          ^~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +1301 drivers/media/i2c/ov2740.c

  1297	
  1298	static const struct v4l2_subdev_pad_ops ov2740_pad_ops = {
  1299		.get_fmt = v4l2_subdev_get_fmt,
  1300		.set_fmt = ov2740_set_format,
> 1301		.get_selection = ov2740_get_selection,
  1302		.enum_mbus_code = ov2740_enum_mbus_code,
  1303		.enum_frame_size = ov2740_enum_frame_size,
  1304		.enable_streams = ov2740_enable_streams,
  1305		.disable_streams = ov2740_disable_streams,
  1306		.get_frame_desc = ov2740_get_frame_desc,
  1307	};
  1308	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

