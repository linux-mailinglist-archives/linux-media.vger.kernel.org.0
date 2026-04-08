Return-Path: <linux-media+bounces-58209-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLOVJpAJ1mlnAwgAu9opvQ
	(envelope-from <linux-media+bounces-58209-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 09:53:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C543B8996
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 09:53:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 45650304D738
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2026 07:51:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65644387564;
	Wed,  8 Apr 2026 07:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a6OG4mNX"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00803396D3C
	for <linux-media@vger.kernel.org>; Wed,  8 Apr 2026 07:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775634663; cv=none; b=lqGTAwrsCZSGiGFoz3RYsVOIPyOXu23bg+U2scvPtvzSrBLnDIBFvcbhIbMhA1z2BLWYa/9WyzGNZC83yHalb0Pk7WuRKiyUl9fvKYL9HKMW39MhLCueyhlrL6fV4eXxWwuWo0NivllRfpCjKuN00lcamYtw9KjQ9/bUAo1NSAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775634663; c=relaxed/simple;
	bh=NAXhOUQe4RCftNvGyxSnkFGFvbamB7e1U2GEX1xAGrA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cBRNiREGynnHxSMSGj94aoLqevaXtTw0JC9JPlBiMHfovG2agsfOvOet8Awr5qlMj6GqD0oGEGtj6bY8nTnathXvS8ohAairBPnr7RvtLg24cyCb9q+8WtdtvaE7TkANsQ0aMn++Lj9QEsv3LI5DZEHET3FelZxnwMyXw0JhLXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a6OG4mNX; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775634661; x=1807170661;
  h=date:from:to:cc:subject:message-id;
  bh=NAXhOUQe4RCftNvGyxSnkFGFvbamB7e1U2GEX1xAGrA=;
  b=a6OG4mNXWy9XfhwjYMl6HPVFmdke4s+l5Kch5oPBUpYGIsbbj8Jl7r6H
   bCt7b4agFdTeRi30bJbKSixEK42sj7RwuekQdttTCrbyIWtiEm5Ap+X1k
   7g301Pxx8GP4B89I9cA9Ts2J56ZES3w4Q9jOTIAhIo/veEo/hoVBLW9+D
   2JI7eeAuf8VDSxoyzMFswp7IUZgWa4YFyLZVbbzrQDrBwIzkXx03lAKIT
   Wgc4NQAJOvjs6cWZaUmrSGFNv14AmhFkT85HPZrJLoUq/qQEXDSoTx8b3
   iMKTpGU50WzoTtbGukYIAWliGAH9fIFiWX4xiNA7FJ2q25dmO6dAVvZzv
   g==;
X-CSE-ConnectionGUID: R51bbOn3Qg2mQvw7x6DOHw==
X-CSE-MsgGUID: GIFhT9LlSTq7cx8OVoGczw==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="87238040"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="87238040"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 00:51:01 -0700
X-CSE-ConnectionGUID: Gnr1xLMDRJm+OppVPKtOEw==
X-CSE-MsgGUID: 98HtKanwS1Ch51CpsrT57A==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 08 Apr 2026 00:50:59 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wANge-000000001aT-3rMJ;
	Wed, 08 Apr 2026 07:50:56 +0000
Date: Wed, 08 Apr 2026 15:50:11 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata 28/115]
 drivers/media/platform/renesas/vsp1/vsp1_entity.c:164:5: error: conflicting
 types for 'vsp1_subdev_get_pad_format'
Message-ID: <202604081508.HhYdRWpG-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58209-lists,linux-media=lfdr.de];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,samsung.com:email,ideasonboard.com:email,01.org:url,intel.com:dkim,intel.com:email,intel.com:mid]
X-Rspamd-Queue-Id: E4C543B8996
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   0788d31c6570b12fdf54d8ecc25877ece44318d9
commit: b0b1469354e8ad8b1555fa966ac3c8c14a6a70c7 [28/115] media: v4l2-subdev: Add struct v4l2_subdev_client_info argument to pad ops
config: arm-randconfig-001-20260408 (https://download.01.org/0day-ci/archive/20260408/202604081508.HhYdRWpG-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260408/202604081508.HhYdRWpG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604081508.HhYdRWpG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/platform/renesas/vsp1/vsp1_entity.c:164:5: error: conflicting types for 'vsp1_subdev_get_pad_format'
    int vsp1_subdev_get_pad_format(struct v4l2_subdev *subdev,
        ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/media/platform/renesas/vsp1/vsp1_entity.c:22:
   drivers/media/platform/renesas/vsp1/vsp1_entity.h:187:5: note: previous declaration of 'vsp1_subdev_get_pad_format' was here
    int vsp1_subdev_get_pad_format(struct v4l2_subdev *subdev,
        ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/vsp1_subdev_get_pad_format +164 drivers/media/platform/renesas/vsp1/vsp1_entity.c

e790c3cb8d904c4 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2015-11-15  154  
3f557220cc29d19 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2016-02-24  155  /*
3f557220cc29d19 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2016-02-24  156   * vsp1_subdev_get_pad_format - Subdev pad get_fmt handler
3f557220cc29d19 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2016-02-24  157   * @subdev: V4L2 subdevice
30d187cd74874aa drivers/media/platform/renesas/vsp1/vsp1_entity.c Laurent Pinchart 2023-11-26  158   * @sd_state: V4L2 subdev state
3f557220cc29d19 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2016-02-24  159   * @fmt: V4L2 subdev format
3f557220cc29d19 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2016-02-24  160   *
3f557220cc29d19 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2016-02-24  161   * This function implements the subdev get_fmt pad operation. It can be used as
3f557220cc29d19 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2016-02-24  162   * a direct drop-in for the operation handler.
3f557220cc29d19 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2016-02-24  163   */
3f557220cc29d19 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2016-02-24 @164  int vsp1_subdev_get_pad_format(struct v4l2_subdev *subdev,
b0b1469354e8ad8 drivers/media/platform/renesas/vsp1/vsp1_entity.c Sakari Ailus     2026-01-30  165  			       const struct v4l2_subdev_client_info *ci,
0d346d2a6f54f06 drivers/media/platform/vsp1/vsp1_entity.c         Tomi Valkeinen   2021-06-10  166  			       struct v4l2_subdev_state *sd_state,
3f557220cc29d19 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2016-02-24  167  			       struct v4l2_subdev_format *fmt)
3f557220cc29d19 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2016-02-24  168  {
3f557220cc29d19 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2016-02-24  169  	struct vsp1_entity *entity = to_vsp1_entity(subdev);
30d187cd74874aa drivers/media/platform/renesas/vsp1/vsp1_entity.c Laurent Pinchart 2023-11-26  170  	struct v4l2_subdev_state *state;
3f557220cc29d19 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2016-02-24  171  
30d187cd74874aa drivers/media/platform/renesas/vsp1/vsp1_entity.c Laurent Pinchart 2023-11-26  172  	state = vsp1_entity_get_state(entity, sd_state, fmt->which);
30d187cd74874aa drivers/media/platform/renesas/vsp1/vsp1_entity.c Laurent Pinchart 2023-11-26  173  	if (!state)
3f557220cc29d19 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2016-02-24  174  		return -EINVAL;
3f557220cc29d19 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2016-02-24  175  
34e77ed84b274d2 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2016-06-26  176  	mutex_lock(&entity->lock);
0aaf7db08726773 drivers/media/platform/renesas/vsp1/vsp1_entity.c Laurent Pinchart 2023-11-12  177  	fmt->format = *v4l2_subdev_state_get_format(state, fmt->pad);
34e77ed84b274d2 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2016-06-26  178  	mutex_unlock(&entity->lock);
3f557220cc29d19 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2016-02-24  179  
3f557220cc29d19 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2016-02-24  180  	return 0;
3f557220cc29d19 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2016-02-24  181  }
3f557220cc29d19 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2016-02-24  182  

:::::: The code at line 164 was first introduced by commit
:::::: 3f557220cc29d1961ef9efa2a8db04c7c5f6e6d4 [media] v4l: vsp1: Factorize get pad format code

:::::: TO: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@osg.samsung.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

