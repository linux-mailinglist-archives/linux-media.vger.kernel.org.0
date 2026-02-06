Return-Path: <linux-media+bounces-52329-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DK7CFhfhmnLMQQAu9opvQ
	(envelope-from <linux-media+bounces-52329-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 22:38:32 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2AB1037E5
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 22:38:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 13FA33047DF4
	for <lists+linux-media@lfdr.de>; Fri,  6 Feb 2026 21:38:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE66A3101C0;
	Fri,  6 Feb 2026 21:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QyNwumIz"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4803101CD
	for <linux-media@vger.kernel.org>; Fri,  6 Feb 2026 21:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770413902; cv=none; b=oYpRB9NtF2bJY4dvwzHlYgtYnMnMP7YG+RcxTusrsGe07tiuHX8keez4X4ZT+vJ4ZxRYcCBz9uir0nZiVoYe7z7OFSmRdDJ2bs+CYk78v57L9KK9bZQpJsiVA9Ky1PErpqGN/p+gTn0NVVIHLSCocKPXy0m4USpt8nKsm+xkD0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770413902; c=relaxed/simple;
	bh=Mow5AyywwMqa9njwaQfYLujpJaXuqgUJ6z1QFmPPrnM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EOYaCjQtY0icCauF2+YXWPyGVC0g3o03PWdqsxpCsw8+Gbab1MqYcmtJRXAKnSMSCnorVAo5nGzsLntvyJfoewIOsicFkXL5EAjWwytAZxUXMFX+b4d0D4MmUU1s5Gb9qHAbhQSA04ih3SK4+AH6MJMokXEfbN9fWsTGN4ZMZig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QyNwumIz; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770413902; x=1801949902;
  h=date:from:to:cc:subject:message-id;
  bh=Mow5AyywwMqa9njwaQfYLujpJaXuqgUJ6z1QFmPPrnM=;
  b=QyNwumIzOl1vLXnMefLwI7tCG84Ae/F2bts0JEHbrEt2yXf8oA7c1Jmg
   t1+obc2JuEKJfhjTb0XgU3osr2a0b6e45n3pxGRnUb5pF8kTk/5uMTBXy
   llNFqjhXxAaEHUDUT/sqK+1U6dBrhDbpIIMDE+vA6oqDFIQ7IE8Huz6FH
   hvE641G7YsDTbatII29YAWxluqzw2AvGJH/zkjiVk89qezwXtOtdEgPdL
   BKpo52lv9ddc/SpOY5Lmyic+muhrf7OyWzEYbXXrZMBkyKKZogfMwoh12
   xJZibw2qSnha8uTmSjW7sLdWU62kXtZiabJ8aAw8p4fAPWarlkld0e9g3
   A==;
X-CSE-ConnectionGUID: FNiri1CsTb+G4gSlwBf+hQ==
X-CSE-MsgGUID: F7YD4InqRNm1BEHHg5NxtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="83070740"
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="83070740"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 13:38:20 -0800
X-CSE-ConnectionGUID: eItm6pkeQ2K0ZqFmtQ0uPA==
X-CSE-MsgGUID: denRIxe1SIqiBy4KOqTDYg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 06 Feb 2026 13:38:18 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voTWq-00000000lBU-2Dtm;
	Fri, 06 Feb 2026 21:38:16 +0000
Date: Sat, 07 Feb 2026 05:37:31 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata-pre 13/13]
 drivers/media/platform/renesas/vsp1/vsp1_entity.c:161:5: error: conflicting
 types for 'vsp1_subdev_get_pad_format'
Message-ID: <202602070533.3Ybd45b6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52329-lists,linux-media=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email,intel.com:dkim,intel.com:mid,01.org:url]
X-Rspamd-Queue-Id: 8C2AB1037E5
X-Rspamd-Action: no action

tree:   git://linuxtv.org/sailus/media_tree.git metadata-pre
head:   1b58854744d17413b2855b20178e63a1c82d58f5
commit: 1b58854744d17413b2855b20178e63a1c82d58f5 [13/13] media: v4l: Add struct v4l2_subdev_client_info argument to pad ops
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260207/202602070533.3Ybd45b6-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602070533.3Ybd45b6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602070533.3Ybd45b6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/platform/renesas/vsp1/vsp1_entity.c:161:5: error: conflicting types for 'vsp1_subdev_get_pad_format'
     161 | int vsp1_subdev_get_pad_format(struct v4l2_subdev *subdev,
         |     ^
   drivers/media/platform/renesas/vsp1/vsp1_entity.h:178:5: note: previous declaration is here
     178 | int vsp1_subdev_get_pad_format(struct v4l2_subdev *subdev,
         |     ^
   1 error generated.


vim +/vsp1_subdev_get_pad_format +161 drivers/media/platform/renesas/vsp1/vsp1_entity.c

e790c3cb8d904c drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2015-11-15  151  
3f557220cc29d1 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2016-02-24  152  /*
3f557220cc29d1 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2016-02-24  153   * vsp1_subdev_get_pad_format - Subdev pad get_fmt handler
3f557220cc29d1 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2016-02-24  154   * @subdev: V4L2 subdevice
30d187cd74874a drivers/media/platform/renesas/vsp1/vsp1_entity.c Laurent Pinchart 2023-11-26  155   * @sd_state: V4L2 subdev state
3f557220cc29d1 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2016-02-24  156   * @fmt: V4L2 subdev format
3f557220cc29d1 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2016-02-24  157   *
3f557220cc29d1 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2016-02-24  158   * This function implements the subdev get_fmt pad operation. It can be used as
3f557220cc29d1 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2016-02-24  159   * a direct drop-in for the operation handler.
3f557220cc29d1 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2016-02-24  160   */
3f557220cc29d1 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2016-02-24 @161  int vsp1_subdev_get_pad_format(struct v4l2_subdev *subdev,
1b58854744d174 drivers/media/platform/renesas/vsp1/vsp1_entity.c Sakari Ailus     2026-01-30  162  			       const struct v4l2_subdev_client_info *ci,
0d346d2a6f54f0 drivers/media/platform/vsp1/vsp1_entity.c         Tomi Valkeinen   2021-06-10  163  			       struct v4l2_subdev_state *sd_state,
3f557220cc29d1 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2016-02-24  164  			       struct v4l2_subdev_format *fmt)
3f557220cc29d1 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2016-02-24  165  {
3f557220cc29d1 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2016-02-24  166  	struct vsp1_entity *entity = to_vsp1_entity(subdev);
30d187cd74874a drivers/media/platform/renesas/vsp1/vsp1_entity.c Laurent Pinchart 2023-11-26  167  	struct v4l2_subdev_state *state;
3f557220cc29d1 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2016-02-24  168  
30d187cd74874a drivers/media/platform/renesas/vsp1/vsp1_entity.c Laurent Pinchart 2023-11-26  169  	state = vsp1_entity_get_state(entity, sd_state, fmt->which);
30d187cd74874a drivers/media/platform/renesas/vsp1/vsp1_entity.c Laurent Pinchart 2023-11-26  170  	if (!state)
3f557220cc29d1 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2016-02-24  171  		return -EINVAL;
3f557220cc29d1 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2016-02-24  172  
34e77ed84b274d drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2016-06-26  173  	mutex_lock(&entity->lock);
0aaf7db0872677 drivers/media/platform/renesas/vsp1/vsp1_entity.c Laurent Pinchart 2023-11-12  174  	fmt->format = *v4l2_subdev_state_get_format(state, fmt->pad);
34e77ed84b274d drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2016-06-26  175  	mutex_unlock(&entity->lock);
3f557220cc29d1 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2016-02-24  176  
3f557220cc29d1 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2016-02-24  177  	return 0;
3f557220cc29d1 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2016-02-24  178  }
3f557220cc29d1 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2016-02-24  179  

:::::: The code at line 161 was first introduced by commit
:::::: 3f557220cc29d1961ef9efa2a8db04c7c5f6e6d4 [media] v4l: vsp1: Factorize get pad format code

:::::: TO: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@osg.samsung.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

