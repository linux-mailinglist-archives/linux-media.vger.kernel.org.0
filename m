Return-Path: <linux-media+bounces-52330-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBkbLkGGhmn7OQQAu9opvQ
	(envelope-from <linux-media+bounces-52330-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 07 Feb 2026 01:24:33 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E478A104461
	for <lists+linux-media@lfdr.de>; Sat, 07 Feb 2026 01:24:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A8FEC3032079
	for <lists+linux-media@lfdr.de>; Sat,  7 Feb 2026 00:24:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED1621E5B95;
	Sat,  7 Feb 2026 00:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GIyhgGjY"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1571DDC1D
	for <linux-media@vger.kernel.org>; Sat,  7 Feb 2026 00:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770423867; cv=none; b=RkCeOT3th5ycahU6Idbxynpiww6fNVHZwP7t2PiTCdJvEjlnJgtxAgpQ06PExX9BQ4DtqTf9yqTK0g98PiZYfqktfwR9JFxxZu9QM6trI3351PpiCBkyKbTIwCCo6jfa3C1cOgMS/zFrj51LLKn+Pj3WS7RYQyCJLbBciWMQ8R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770423867; c=relaxed/simple;
	bh=8iajhs/wxRSmEgg9+nl9643u3zxchGO1AYxf+OscVUQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=M+5e15L+iW8FlhOf3iqQbtf31qI1YJfZxnk3AwSlGw7IQA2ctD9GZgzI1hgtoRhPFyg6K2Ly9bva8jw8LW7M/mM1CzxGP25eeJmTnEs7VuOIz9drai14TFMB4iIU5N7ubzVp4UHr+jCig7brIaWZ7OgD0ddr7kraJ27D2r2FpfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GIyhgGjY; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770423866; x=1801959866;
  h=date:from:to:cc:subject:message-id;
  bh=8iajhs/wxRSmEgg9+nl9643u3zxchGO1AYxf+OscVUQ=;
  b=GIyhgGjYJ1g0XN6PFzsWLIRdfqHDDF5OBy8W7lmkf0fxF2MkbQbcNIsH
   XXvDREqvJCEilDScnep2Xa50pwlNHYvBBiun2xxjkv9jihjbjCO8jzCRA
   z7R1OUwZfwo4KLoQKktDNzU/hoydDJq+RmjK0uhiwnLBnsayXMRptoSFP
   POJ3lXcAlQ8aswQf8U7i7XLoBDMPDs+QnvIjI9w7us1ExxbEDr3aNlMBa
   ziMakPlSGZujSuxSEqkxwss2B5Q4DKTJnbekeb6oa4/+o+WKeFdTH/hrb
   D5LD64oDd3EcdxuL9Klk5utM0jB+ArW7EL8F4b5eSm6Dz6IOa8XNLH1z/
   Q==;
X-CSE-ConnectionGUID: glS0FaoORxG4QofNGmhECw==
X-CSE-MsgGUID: S8ATR2MKTdu2POxIp/B1Fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="59203181"
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="59203181"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 16:24:25 -0800
X-CSE-ConnectionGUID: i5CzfvN6Qt+3tT1Axe8noQ==
X-CSE-MsgGUID: 2326Ko59Qv+fJ0MKufWzOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="210809568"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 06 Feb 2026 16:24:24 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voW7Z-00000000lHo-2286;
	Sat, 07 Feb 2026 00:24:21 +0000
Date: Sat, 07 Feb 2026 08:23:59 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata-pre 13/13]
 drivers/media/platform/renesas/vsp1/vsp1_entity.c:161:5: error: conflicting
 types for 'vsp1_subdev_get_pad_format'; have 'int(struct v4l2_subdev *, const
 struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct
 v4l2_subdev_format *)'
Message-ID: <202602070821.c9SviwgN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.47 / 15.00];
	LONG_SUBJ(2.13)[284];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52330-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.997];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: E478A104461
X-Rspamd-Action: no action

tree:   git://linuxtv.org/sailus/media_tree.git metadata-pre
head:   1b58854744d17413b2855b20178e63a1c82d58f5
commit: 1b58854744d17413b2855b20178e63a1c82d58f5 [13/13] media: v4l: Add struct v4l2_subdev_client_info argument to pad ops
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20260207/202602070821.c9SviwgN-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602070821.c9SviwgN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602070821.c9SviwgN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/platform/renesas/vsp1/vsp1_entity.c:161:5: error: conflicting types for 'vsp1_subdev_get_pad_format'; have 'int(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)'
     161 | int vsp1_subdev_get_pad_format(struct v4l2_subdev *subdev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/media/platform/renesas/vsp1/vsp1_entity.c:19:
   drivers/media/platform/renesas/vsp1/vsp1_entity.h:178:5: note: previous declaration of 'vsp1_subdev_get_pad_format' with type 'int(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)'
     178 | int vsp1_subdev_get_pad_format(struct v4l2_subdev *subdev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +161 drivers/media/platform/renesas/vsp1/vsp1_entity.c

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

