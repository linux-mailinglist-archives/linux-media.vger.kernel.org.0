Return-Path: <linux-media+bounces-52610-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gO0nBsqWjGnhrQAAu9opvQ
	(envelope-from <linux-media+bounces-52610-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 15:48:42 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A280F125530
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 15:48:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A112E3005991
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 14:48:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFEF41632DD;
	Wed, 11 Feb 2026 14:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YsDJHcus"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B50229A2
	for <linux-media@vger.kernel.org>; Wed, 11 Feb 2026 14:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770821319; cv=none; b=adDZ7xSqfviiv1Vl3rcUiC7Ioj19CvIEk6cMrEFq6DMMLJ+pBxB/xlmyyRzSb4L4cNMzefxCCBHdHvmnO9s0AQhDH38FcKAUr/yj6hmaxSwyz9A3ETLNeOR1jY7vDuaDfVHwgFINDwjJEZBoO9GCs3x30UpQ/vjXGC3ULDSircQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770821319; c=relaxed/simple;
	bh=mBhv/ikmf+VJ9MEf6KxEZZCRfxKrD3eR8pUCYe2wTxE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=V8FJgqwLHvCkjMjNEpnJCTThYSmYnB7MO37uoT7OMECVs3IF/ZwQhunB4U6YMxBBodC+LWViW0DfGelpmT79pFF/VGQ15rO5GgXtCJFXtwmoJv/6FiP7JAvKThE1LqV+T3762y4YUod+dTpHla+hOSBbpbSnOtQ0Bv+xcOjLrCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YsDJHcus; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770821317; x=1802357317;
  h=date:from:to:cc:subject:message-id;
  bh=mBhv/ikmf+VJ9MEf6KxEZZCRfxKrD3eR8pUCYe2wTxE=;
  b=YsDJHcusLnXILQFLA1E89LabTvQ5wlIowOVbhiVhzN1tQVsesr45A0u5
   vT3PWn39XQ0xw6tXN5e5TmwghZ3H9ZUxjXPOPoZh9vuxviZ8oXJA5ZCnC
   UML2HSIndiPwyxIrYiYznWKH+6H+2Mn0maStZo4qLUM4wk4jqs19eYpFG
   t7Lofaz1jRFzTZX11w+T1R9PgKRUhRdfYArgbI78gbLq9tEfreXWKlEBt
   aEbJFoPG0piSU1jTOdPkiJtN1ChZEvPFroSbDIVGu9rNy8fYwTwGDT88w
   20dSBsNvIieWRn1vYwfuPyQ8t4KknbagU/UbU01CCvGsVzG9MmNMgrrN0
   Q==;
X-CSE-ConnectionGUID: dSvHnRpLTQe/l92gk2MlCg==
X-CSE-MsgGUID: YTso5JmcT1y7kj6bKWOvqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="83411539"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="83411539"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 06:48:37 -0800
X-CSE-ConnectionGUID: 2XhWwCrhQ8OxLNKGwuMUwQ==
X-CSE-MsgGUID: /ZsnW71cS4WFqK9+XKc26g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="216420295"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 11 Feb 2026 06:48:35 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqBW4-00000000q4u-3555;
	Wed, 11 Feb 2026 14:48:32 +0000
Date: Wed, 11 Feb 2026 22:47:35 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata-pre 14/14]
 drivers/staging/media/ipu7/ipu7-isys-subdev.c:101:5: error: conflicting types
 for 'ipu7_isys_subdev_set_fmt'
Message-ID: <202602112253.JRfzluk0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-52610-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_FIVE(0.00)[6];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,intel.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,01.org:url]
X-Rspamd-Queue-Id: A280F125530
X-Rspamd-Action: no action

tree:   git://linuxtv.org/sailus/media_tree.git metadata-pre
head:   11ab80de774b0527a7365d6f03ea5dcd0ace3e85
commit: 11ab80de774b0527a7365d6f03ea5dcd0ace3e85 [14/14] media: v4l2-subdev: Add struct v4l2_subdev_client_info argument to pad ops
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20260211/202602112253.JRfzluk0-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602112253.JRfzluk0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602112253.JRfzluk0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/staging/media/ipu7/ipu7-isys-subdev.c:101:5: error: conflicting types for 'ipu7_isys_subdev_set_fmt'
     101 | int ipu7_isys_subdev_set_fmt(struct v4l2_subdev *sd,
         |     ^
   drivers/staging/media/ipu7/ipu7-isys-subdev.h:33:5: note: previous declaration is here
      33 | int ipu7_isys_subdev_set_fmt(struct v4l2_subdev *sd,
         |     ^
   1 error generated.


vim +/ipu7_isys_subdev_set_fmt +101 drivers/staging/media/ipu7/ipu7-isys-subdev.c

a516d36bdc3d83 Bingbu Cao   2025-05-29  100  
a516d36bdc3d83 Bingbu Cao   2025-05-29 @101  int ipu7_isys_subdev_set_fmt(struct v4l2_subdev *sd,
11ab80de774b05 Sakari Ailus 2026-01-30  102  			     const struct v4l2_subdev_client_info *ci,
a516d36bdc3d83 Bingbu Cao   2025-05-29  103  			     struct v4l2_subdev_state *state,
a516d36bdc3d83 Bingbu Cao   2025-05-29  104  			     struct v4l2_subdev_format *format)
a516d36bdc3d83 Bingbu Cao   2025-05-29  105  {
a516d36bdc3d83 Bingbu Cao   2025-05-29  106  	struct ipu7_isys_subdev *asd = to_ipu7_isys_subdev(sd);
a516d36bdc3d83 Bingbu Cao   2025-05-29  107  	u32 code = asd->supported_codes[0];
a516d36bdc3d83 Bingbu Cao   2025-05-29  108  	struct v4l2_mbus_framefmt *fmt;
a516d36bdc3d83 Bingbu Cao   2025-05-29  109  	u32 other_pad, other_stream;
a516d36bdc3d83 Bingbu Cao   2025-05-29  110  	struct v4l2_rect *crop;
a516d36bdc3d83 Bingbu Cao   2025-05-29  111  	unsigned int i;
a516d36bdc3d83 Bingbu Cao   2025-05-29  112  	int ret;
a516d36bdc3d83 Bingbu Cao   2025-05-29  113  
a516d36bdc3d83 Bingbu Cao   2025-05-29  114  	/* No transcoding, source and sink formats must match. */
a516d36bdc3d83 Bingbu Cao   2025-05-29  115  	if ((sd->entity.pads[format->pad].flags & MEDIA_PAD_FL_SOURCE) &&
a516d36bdc3d83 Bingbu Cao   2025-05-29  116  	    sd->entity.num_pads > 1)
11ab80de774b05 Sakari Ailus 2026-01-30  117  		return v4l2_subdev_get_fmt(sd, NULL, state, format);
a516d36bdc3d83 Bingbu Cao   2025-05-29  118  
a516d36bdc3d83 Bingbu Cao   2025-05-29  119  	format->format.width = clamp(format->format.width, IPU_ISYS_MIN_WIDTH,
a516d36bdc3d83 Bingbu Cao   2025-05-29  120  				     IPU_ISYS_MAX_WIDTH);
a516d36bdc3d83 Bingbu Cao   2025-05-29  121  	format->format.height = clamp(format->format.height,
a516d36bdc3d83 Bingbu Cao   2025-05-29  122  				      IPU_ISYS_MIN_HEIGHT,
a516d36bdc3d83 Bingbu Cao   2025-05-29  123  				      IPU_ISYS_MAX_HEIGHT);
a516d36bdc3d83 Bingbu Cao   2025-05-29  124  
a516d36bdc3d83 Bingbu Cao   2025-05-29  125  	for (i = 0; asd->supported_codes[i]; i++) {
a516d36bdc3d83 Bingbu Cao   2025-05-29  126  		if (asd->supported_codes[i] == format->format.code) {
a516d36bdc3d83 Bingbu Cao   2025-05-29  127  			code = asd->supported_codes[i];
a516d36bdc3d83 Bingbu Cao   2025-05-29  128  			break;
a516d36bdc3d83 Bingbu Cao   2025-05-29  129  		}
a516d36bdc3d83 Bingbu Cao   2025-05-29  130  	}
a516d36bdc3d83 Bingbu Cao   2025-05-29  131  	format->format.code = code;
a516d36bdc3d83 Bingbu Cao   2025-05-29  132  	format->format.field = V4L2_FIELD_NONE;
a516d36bdc3d83 Bingbu Cao   2025-05-29  133  
a516d36bdc3d83 Bingbu Cao   2025-05-29  134  	/* Store the format and propagate it to the source pad. */
a516d36bdc3d83 Bingbu Cao   2025-05-29  135  	fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
a516d36bdc3d83 Bingbu Cao   2025-05-29  136  	if (!fmt)
a516d36bdc3d83 Bingbu Cao   2025-05-29  137  		return -EINVAL;
a516d36bdc3d83 Bingbu Cao   2025-05-29  138  
a516d36bdc3d83 Bingbu Cao   2025-05-29  139  	*fmt = format->format;
a516d36bdc3d83 Bingbu Cao   2025-05-29  140  
a516d36bdc3d83 Bingbu Cao   2025-05-29  141  	if (!(sd->entity.pads[format->pad].flags & MEDIA_PAD_FL_SINK))
a516d36bdc3d83 Bingbu Cao   2025-05-29  142  		return 0;
a516d36bdc3d83 Bingbu Cao   2025-05-29  143  
a516d36bdc3d83 Bingbu Cao   2025-05-29  144  	/* propagate format to following source pad */
a516d36bdc3d83 Bingbu Cao   2025-05-29  145  	fmt = v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
a516d36bdc3d83 Bingbu Cao   2025-05-29  146  							   format->stream);
a516d36bdc3d83 Bingbu Cao   2025-05-29  147  	if (!fmt)
a516d36bdc3d83 Bingbu Cao   2025-05-29  148  		return -EINVAL;
a516d36bdc3d83 Bingbu Cao   2025-05-29  149  
a516d36bdc3d83 Bingbu Cao   2025-05-29  150  	*fmt = format->format;
a516d36bdc3d83 Bingbu Cao   2025-05-29  151  
a516d36bdc3d83 Bingbu Cao   2025-05-29  152  	ret = v4l2_subdev_routing_find_opposite_end(&state->routing,
a516d36bdc3d83 Bingbu Cao   2025-05-29  153  						    format->pad,
a516d36bdc3d83 Bingbu Cao   2025-05-29  154  						    format->stream,
a516d36bdc3d83 Bingbu Cao   2025-05-29  155  						    &other_pad,
a516d36bdc3d83 Bingbu Cao   2025-05-29  156  						    &other_stream);
a516d36bdc3d83 Bingbu Cao   2025-05-29  157  	if (ret)
a516d36bdc3d83 Bingbu Cao   2025-05-29  158  		return -EINVAL;
a516d36bdc3d83 Bingbu Cao   2025-05-29  159  
a516d36bdc3d83 Bingbu Cao   2025-05-29  160  	crop = v4l2_subdev_state_get_crop(state, other_pad, other_stream);
a516d36bdc3d83 Bingbu Cao   2025-05-29  161  	/* reset crop */
a516d36bdc3d83 Bingbu Cao   2025-05-29  162  	crop->left = 0;
a516d36bdc3d83 Bingbu Cao   2025-05-29  163  	crop->top = 0;
a516d36bdc3d83 Bingbu Cao   2025-05-29  164  	crop->width = fmt->width;
a516d36bdc3d83 Bingbu Cao   2025-05-29  165  	crop->height = fmt->height;
a516d36bdc3d83 Bingbu Cao   2025-05-29  166  
a516d36bdc3d83 Bingbu Cao   2025-05-29  167  	return 0;
a516d36bdc3d83 Bingbu Cao   2025-05-29  168  }
a516d36bdc3d83 Bingbu Cao   2025-05-29  169  

:::::: The code at line 101 was first introduced by commit
:::::: a516d36bdc3d8373f904af57c95e76d6f921cf1c media: staging/ipu7: add IPU7 input system device driver

:::::: TO: Bingbu Cao <bingbu.cao@intel.com>
:::::: CC: Hans Verkuil <hverkuil@xs4all.nl>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

