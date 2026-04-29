Return-Path: <linux-media+bounces-59912-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 9QCyH+ii8WnejAEAu9opvQ
	(envelope-from <linux-media+bounces-59912-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 08:19:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D2748FB1B
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 08:19:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 21213300CA3E
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 06:19:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2823349B0D;
	Wed, 29 Apr 2026 06:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oCLFe86k"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87981330644
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 06:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777443555; cv=none; b=TVCMfXLV3Zz9keM3PjD9CXA6FQQXSwYahGvGFGvJNBlzhYZP/dCo6jpbz6sRo/t038S6cYjF31/Qthpb6MjpS/y9Zcn9J2mSZKAXautxhVA/8J3qjW0XHCk9+Vi/hTyZsM92CSxBaUo9f5p8akw0zKBLKnpytk3dLf/XDfviy3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777443555; c=relaxed/simple;
	bh=VSJQvZbEKju+ro5/SpQsP8PXG4iO55GUAX54VJPmYW8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=I2eVOTKyMPGZfWl5arGWXtQ0ajjLrTKQXht5tuTRZG4FmREtab1uVOUEvyXhNNkTCJ+qYKstSFU+surw2db3egcHj7501JNfTPs4pzwCXTzgL+rsaO6rDY5ZfBumbwgFWF5NPEhGgU/rOTUm9vypig/K4+7kk03RBdpkFjlGzJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oCLFe86k; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777443553; x=1808979553;
  h=date:from:to:cc:subject:message-id;
  bh=VSJQvZbEKju+ro5/SpQsP8PXG4iO55GUAX54VJPmYW8=;
  b=oCLFe86kG2CDJukmlu6fOs/ZVhBMnCrkSC3UYXmU2modlsy/TtvOdzNI
   I6zXPPcwT25iKdZGs/I+D++2eJWphiMgkvBRGf0zVQdrvAGRbSRM7UUij
   h9gQKmr/OBWf/31UMIXwcM9TghtGG32Zzz5ynW8npv8U1FioHUdpNo8Ul
   0IdC1HU7qXuheZvcSYlCovdDFgpEb2QkYQvYwRyH09O3PzMto4ixC9MKL
   pkpV0ySWR+sf66RyYJ49g+qbsHRwcPAgjZt5HpGfiafDuF733smJoFSYA
   Oouo/H5JfQ6uizmwV9m2oXp+LvikFYUobgicTtLLcNxuDBWD88lwLY+9/
   Q==;
X-CSE-ConnectionGUID: yxenGpLaQ9GzUFAwhapotA==
X-CSE-MsgGUID: Tn9TdhZ1Ra6GtMORF/hnqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="78380770"
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; 
   d="scan'208";a="78380770"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 23:19:13 -0700
X-CSE-ConnectionGUID: Hdv9++D3TReuA2yRuJg3yQ==
X-CSE-MsgGUID: abbiYpX1QC6MdQji24ORBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; 
   d="scan'208";a="234455134"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 28 Apr 2026 23:19:12 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wHyGK-00000000Ag4-32Gy;
	Wed, 29 Apr 2026 06:19:08 +0000
Date: Wed, 29 Apr 2026 14:18:49 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata 32/122]
 drivers/media/platform/renesas/vsp1/vsp1_entity.c:302:5: error: conflicting
 types for 'vsp1_subdev_set_pad_format'; have 'int(struct v4l2_subdev *, const
 struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct
 v4l2_subdev_format *)'
Message-ID: <202604291444.xozszFSV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: 08D2748FB1B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.45 / 15.00];
	LONG_SUBJ(2.11)[281];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59912-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:email,intel.com:dkim,intel.com:mid]

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   489ab6e79288be8d219b68525a13699fde0248ae
commit: 66bc8bdd8684ee2b5ae46e66fb88e8c3474e69eb [32/122] media: v4l2-subdev: Add struct v4l2_subdev_client_info argument to pad ops
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260429/202604291444.xozszFSV-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260429/202604291444.xozszFSV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604291444.xozszFSV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/platform/renesas/vsp1/vsp1_entity.c:302:5: error: conflicting types for 'vsp1_subdev_set_pad_format'; have 'int(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)'
     302 | int vsp1_subdev_set_pad_format(struct v4l2_subdev *subdev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/media/platform/renesas/vsp1/vsp1_entity.c:22:
   drivers/media/platform/renesas/vsp1/vsp1_entity.h:190:5: note: previous declaration of 'vsp1_subdev_set_pad_format' with type 'int(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)'
     190 | int vsp1_subdev_set_pad_format(struct v4l2_subdev *subdev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +302 drivers/media/platform/renesas/vsp1/vsp1_entity.c

076e834fee91db drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2016-02-24  290  
b4ccae1025f3c7 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2017-11-27  291  /*
b4ccae1025f3c7 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2017-11-27  292   * vsp1_subdev_set_pad_format - Subdev pad set_fmt handler
b4ccae1025f3c7 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2017-11-27  293   * @subdev: V4L2 subdevice
30d187cd74874a drivers/media/platform/renesas/vsp1/vsp1_entity.c Laurent Pinchart 2023-11-26  294   * @sd_state: V4L2 subdev state
b4ccae1025f3c7 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2017-11-27  295   * @fmt: V4L2 subdev format
b4ccae1025f3c7 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2017-11-27  296   *
b4ccae1025f3c7 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2017-11-27  297   * This function implements the subdev set_fmt pad operation for entities that
c247aa0b75d67c drivers/media/platform/renesas/vsp1/vsp1_entity.c Laurent Pinchart 2026-03-19  298   * do not support scaling or cropping. It defaults to the first supported media
b4ccae1025f3c7 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2017-11-27  299   * bus code if the requested code isn't supported, clamps the size to the
2cbf20a3fd8ffd drivers/media/platform/renesas/vsp1/vsp1_entity.c Laurent Pinchart 2026-03-19  300   * entity's limits, and propagates the sink pad format to the source pad.
b4ccae1025f3c7 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2017-11-27  301   */
b4ccae1025f3c7 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2017-11-27 @302  int vsp1_subdev_set_pad_format(struct v4l2_subdev *subdev,
66bc8bdd8684ee drivers/media/platform/renesas/vsp1/vsp1_entity.c Sakari Ailus     2026-01-30  303  			       const struct v4l2_subdev_client_info *ci,
0d346d2a6f54f0 drivers/media/platform/vsp1/vsp1_entity.c         Tomi Valkeinen   2021-06-10  304  			       struct v4l2_subdev_state *sd_state,
2cbf20a3fd8ffd drivers/media/platform/renesas/vsp1/vsp1_entity.c Laurent Pinchart 2026-03-19  305  			       struct v4l2_subdev_format *fmt)
b4ccae1025f3c7 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2017-11-27  306  {
b4ccae1025f3c7 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2017-11-27  307  	struct vsp1_entity *entity = to_vsp1_entity(subdev);
30d187cd74874a drivers/media/platform/renesas/vsp1/vsp1_entity.c Laurent Pinchart 2023-11-26  308  	struct v4l2_subdev_state *state;
b4ccae1025f3c7 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2017-11-27  309  	struct v4l2_mbus_framefmt *format;
3d7899c21fbba1 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2017-11-27  310  	struct v4l2_rect *selection;
b4ccae1025f3c7 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2017-11-27  311  	unsigned int i;
b4ccae1025f3c7 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2017-11-27  312  	int ret = 0;
b4ccae1025f3c7 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2017-11-27  313  
b4ccae1025f3c7 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2017-11-27  314  	mutex_lock(&entity->lock);
b4ccae1025f3c7 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2017-11-27  315  
30d187cd74874a drivers/media/platform/renesas/vsp1/vsp1_entity.c Laurent Pinchart 2023-11-26  316  	state = vsp1_entity_get_state(entity, sd_state, fmt->which);
30d187cd74874a drivers/media/platform/renesas/vsp1/vsp1_entity.c Laurent Pinchart 2023-11-26  317  	if (!state) {
b4ccae1025f3c7 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2017-11-27  318  		ret = -EINVAL;
b4ccae1025f3c7 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2017-11-27  319  		goto done;
b4ccae1025f3c7 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2017-11-27  320  	}
b4ccae1025f3c7 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2017-11-27  321  
0aaf7db0872677 drivers/media/platform/renesas/vsp1/vsp1_entity.c Laurent Pinchart 2023-11-12  322  	format = v4l2_subdev_state_get_format(state, fmt->pad);
b4ccae1025f3c7 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2017-11-27  323  
b4ccae1025f3c7 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2017-11-27  324  	if (fmt->pad == entity->source_pad) {
b4ccae1025f3c7 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2017-11-27  325  		/* The output format can't be modified. */
b4ccae1025f3c7 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2017-11-27  326  		fmt->format = *format;
b4ccae1025f3c7 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2017-11-27  327  		goto done;
b4ccae1025f3c7 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2017-11-27  328  	}
b4ccae1025f3c7 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2017-11-27  329  
b4ccae1025f3c7 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2017-11-27  330  	/*
b4ccae1025f3c7 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2017-11-27  331  	 * Default to the first media bus code if the requested format is not
b4ccae1025f3c7 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2017-11-27  332  	 * supported.
b4ccae1025f3c7 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2017-11-27  333  	 */
c247aa0b75d67c drivers/media/platform/renesas/vsp1/vsp1_entity.c Laurent Pinchart 2026-03-19  334  	for (i = 0; i < entity->num_codes; ++i) {
c247aa0b75d67c drivers/media/platform/renesas/vsp1/vsp1_entity.c Laurent Pinchart 2026-03-19  335  		if (fmt->format.code == entity->codes[i])
b4ccae1025f3c7 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2017-11-27  336  			break;
b4ccae1025f3c7 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2017-11-27  337  	}
b4ccae1025f3c7 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2017-11-27  338  
c247aa0b75d67c drivers/media/platform/renesas/vsp1/vsp1_entity.c Laurent Pinchart 2026-03-19  339  	format->code = i < entity->num_codes
c247aa0b75d67c drivers/media/platform/renesas/vsp1/vsp1_entity.c Laurent Pinchart 2026-03-19  340  		     ? entity->codes[i] : entity->codes[0];
b4ccae1025f3c7 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2017-11-27  341  	format->width = clamp_t(unsigned int, fmt->format.width,
2cbf20a3fd8ffd drivers/media/platform/renesas/vsp1/vsp1_entity.c Laurent Pinchart 2026-03-19  342  				entity->min_width, entity->max_width);
b4ccae1025f3c7 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2017-11-27  343  	format->height = clamp_t(unsigned int, fmt->format.height,
2cbf20a3fd8ffd drivers/media/platform/renesas/vsp1/vsp1_entity.c Laurent Pinchart 2026-03-19  344  				 entity->min_height, entity->max_height);
b4ccae1025f3c7 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2017-11-27  345  	format->field = V4L2_FIELD_NONE;
d5e3bc24d5ce4c drivers/media/platform/renesas/vsp1/vsp1_entity.c Laurent Pinchart 2025-04-30  346  
d5e3bc24d5ce4c drivers/media/platform/renesas/vsp1/vsp1_entity.c Laurent Pinchart 2025-04-30  347  	format->colorspace = fmt->format.colorspace;
d5e3bc24d5ce4c drivers/media/platform/renesas/vsp1/vsp1_entity.c Laurent Pinchart 2025-04-30  348  	format->xfer_func = fmt->format.xfer_func;
d5e3bc24d5ce4c drivers/media/platform/renesas/vsp1/vsp1_entity.c Laurent Pinchart 2025-04-30  349  	format->ycbcr_enc = fmt->format.ycbcr_enc;
d5e3bc24d5ce4c drivers/media/platform/renesas/vsp1/vsp1_entity.c Laurent Pinchart 2025-04-30  350  	format->quantization = fmt->format.quantization;
d5e3bc24d5ce4c drivers/media/platform/renesas/vsp1/vsp1_entity.c Laurent Pinchart 2025-04-30  351  
d5e3bc24d5ce4c drivers/media/platform/renesas/vsp1/vsp1_entity.c Laurent Pinchart 2025-04-30  352  	vsp1_entity_adjust_color_space(format);
b4ccae1025f3c7 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2017-11-27  353  
b4ccae1025f3c7 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2017-11-27  354  	fmt->format = *format;
b4ccae1025f3c7 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2017-11-27  355  
b4ccae1025f3c7 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2017-11-27  356  	/* Propagate the format to the source pad. */
0aaf7db0872677 drivers/media/platform/renesas/vsp1/vsp1_entity.c Laurent Pinchart 2023-11-12  357  	format = v4l2_subdev_state_get_format(state, entity->source_pad);
b4ccae1025f3c7 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2017-11-27  358  	*format = fmt->format;
b4ccae1025f3c7 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2017-11-27  359  
23a99e80e3082b drivers/media/platform/vsp1/vsp1_entity.c         Kieran Bingham   2018-08-31  360  	/* Reset the crop and compose rectangles. */
769d5fe4eb8e8f drivers/media/platform/renesas/vsp1/vsp1_entity.c Laurent Pinchart 2023-11-12  361  	selection = v4l2_subdev_state_get_crop(state, fmt->pad);
3d7899c21fbba1 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2017-11-27  362  	selection->left = 0;
3d7899c21fbba1 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2017-11-27  363  	selection->top = 0;
3d7899c21fbba1 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2017-11-27  364  	selection->width = format->width;
3d7899c21fbba1 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2017-11-27  365  	selection->height = format->height;
3d7899c21fbba1 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2017-11-27  366  
769d5fe4eb8e8f drivers/media/platform/renesas/vsp1/vsp1_entity.c Laurent Pinchart 2023-11-12  367  	selection = v4l2_subdev_state_get_compose(state, fmt->pad);
3d7899c21fbba1 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2017-11-27  368  	selection->left = 0;
3d7899c21fbba1 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2017-11-27  369  	selection->top = 0;
3d7899c21fbba1 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2017-11-27  370  	selection->width = format->width;
3d7899c21fbba1 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2017-11-27  371  	selection->height = format->height;
3d7899c21fbba1 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2017-11-27  372  
b4ccae1025f3c7 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2017-11-27  373  done:
b4ccae1025f3c7 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2017-11-27  374  	mutex_unlock(&entity->lock);
b4ccae1025f3c7 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2017-11-27  375  	return ret;
b4ccae1025f3c7 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2017-11-27  376  }
b4ccae1025f3c7 drivers/media/platform/vsp1/vsp1_entity.c         Laurent Pinchart 2017-11-27  377  

:::::: The code at line 302 was first introduced by commit
:::::: b4ccae1025f3c7dac3c35019369627622ec01e94 media: v4l: vsp1: Share the CLU, LIF and LUT set_fmt pad operation code

:::::: TO: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
:::::: CC: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

