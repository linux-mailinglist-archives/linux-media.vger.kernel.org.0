Return-Path: <linux-media+bounces-58216-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +J08Efgl1mnYBQgAu9opvQ
	(envelope-from <linux-media+bounces-58216-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 11:55:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A52C73BA285
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 11:55:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 253CB30455C9
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2026 09:55:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 592C53ACEE1;
	Wed,  8 Apr 2026 09:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TjOiM2SY"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF693B2FC7
	for <linux-media@vger.kernel.org>; Wed,  8 Apr 2026 09:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775642099; cv=none; b=Kc0qVuFXOYGNyNXZ+/QQsFHozGfzFsp/JVbHIhygpYnXYZA81XV4HbJemp0dyZVX723UkAqXat9BK6YEu7kotAZ5iHejIWm6C81kj1iWFgLTR2ChG1QOVLZdBuPK4sqidGy29OF+ftY5wFew9N9oegUSwlHC2izm9u0oOA0ci5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775642099; c=relaxed/simple;
	bh=JiHqG/HCXbHuxuAMeL5xOFEGwxlYZQADnsAQuBWxRrs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QlSz3+oBjOCNt/NYYih9ds1Y1woKxiZzSvbAzffDLWGX0+H6ge0fRPQ1Ake9G0RlmCSylYFLeMSujhEK9gkzkrpR49Aw9UFOHGpwqRSOFtDIjOUjhu6MJtCREC70MYnQV99QDee8QY2oBZya0SS7+KuVCu+KFloesvusyo2Pm4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TjOiM2SY; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775642090; x=1807178090;
  h=date:from:to:cc:subject:message-id;
  bh=JiHqG/HCXbHuxuAMeL5xOFEGwxlYZQADnsAQuBWxRrs=;
  b=TjOiM2SYqD7Lcucs3H94MOhzM+now7F+IGDRnEZ250+8aqjIMFMiRwCq
   x70DcS9XUMAsb02ut3uJff2NGCQ7206ON4VOj+c0GAFaD5jN4V/9+M/iE
   MKUDfvNhFFOtUza3u7R709Qx0yqL1LRvlzeyDWxP2YjymC01HMunI0yAF
   TG6jqAykk9FqQSCznAY1mR1KiSNUTvLuDAANfidSuA6rNXYsmzlxaSDf6
   YMaEEUu8pTK1UFPdndwUAbMyCiDff0anfMPggzibyONwbGAWL2jAL7r0q
   893tRrkEd9E27lsP2gsAMKN8HCOxOoJomR5IWy9nBI8GQf1aEq8dV1uMR
   g==;
X-CSE-ConnectionGUID: QaHjNCyhRqevTdprcyFi7Q==
X-CSE-MsgGUID: KCoosUhiQBKc3PcJ3l/EjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="94008764"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="94008764"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 02:54:49 -0700
X-CSE-ConnectionGUID: 9khumiFdRPeqExO23dilsQ==
X-CSE-MsgGUID: gQHL75WDR8S49imDAGoMsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="224136007"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 08 Apr 2026 02:54:47 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wAPcS-000000001h7-3zxE;
	Wed, 08 Apr 2026 09:54:44 +0000
Date: Wed, 08 Apr 2026 17:54:04 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata 28/115]
 drivers/staging/media/ipu7/ipu7-isys-subdev.c:101:5: error: conflicting types
 for 'ipu7_isys_subdev_set_fmt'; have 'int(struct v4l2_subdev *, const struct
 v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct
 v4l2_subdev_format *)'
Message-ID: <202604081724.BEqPpWm0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [1.40 / 15.00];
	LONG_SUBJ(2.06)[275];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58216-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,intel.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,xs4all.nl:email]
X-Rspamd-Queue-Id: A52C73BA285
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   0788d31c6570b12fdf54d8ecc25877ece44318d9
commit: b0b1469354e8ad8b1555fa966ac3c8c14a6a70c7 [28/115] media: v4l2-subdev: Add struct v4l2_subdev_client_info argument to pad ops
config: i386-randconfig-015-20260408 (https://download.01.org/0day-ci/archive/20260408/202604081724.BEqPpWm0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260408/202604081724.BEqPpWm0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604081724.BEqPpWm0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/staging/media/ipu7/ipu7-isys-subdev.c:101:5: error: conflicting types for 'ipu7_isys_subdev_set_fmt'; have 'int(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)'
     101 | int ipu7_isys_subdev_set_fmt(struct v4l2_subdev *sd,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/staging/media/ipu7/ipu7-isys-csi2.h:12,
                    from drivers/staging/media/ipu7/ipu7-isys.h:25,
                    from drivers/staging/media/ipu7/ipu7-isys-subdev.c:19:
   drivers/staging/media/ipu7/ipu7-isys-subdev.h:33:5: note: previous declaration of 'ipu7_isys_subdev_set_fmt' with type 'int(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)'
      33 | int ipu7_isys_subdev_set_fmt(struct v4l2_subdev *sd,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~


vim +101 drivers/staging/media/ipu7/ipu7-isys-subdev.c

a516d36bdc3d83 Bingbu Cao   2025-05-29  100  
a516d36bdc3d83 Bingbu Cao   2025-05-29 @101  int ipu7_isys_subdev_set_fmt(struct v4l2_subdev *sd,
b0b1469354e8ad Sakari Ailus 2026-01-30  102  			     const struct v4l2_subdev_client_info *ci,
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
b0b1469354e8ad Sakari Ailus 2026-01-30  117  		return v4l2_subdev_get_fmt(sd, NULL, state, format);
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

