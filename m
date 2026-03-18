Return-Path: <linux-media+bounces-56220-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6BqSKejfumk3cwIAu9opvQ
	(envelope-from <linux-media+bounces-56220-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 18:24:56 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 153B02C0342
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 18:24:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E78F133B12AB
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 16:39:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13E7B3E4C75;
	Wed, 18 Mar 2026 16:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RVoO5zNh"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E59329E5A
	for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 16:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773850936; cv=none; b=S8nTPPU/Mem3xcnFtCdwxXgfYNklxQIVqJ7n0S8vw9MrZAWs2lEPaVZE3VVvCPGvH0jEiX51sMTySu7YrIl9Is3sFO5v2Mix0BexSNNlU/kh8IPOTUdXMvOIu9ChaDFWis8iCwiSJrxOZosCBVoQs+gRdPNCZbYcov75OLR33Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773850936; c=relaxed/simple;
	bh=ghFbrYT+B/wvkw03LhkhVValFVJzgMVxAtsx+uR5XoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zsxlc9IcLd0o7MznMMigA+Bc9vH90F33KwG193ZAEihgWWQwENXmnDNh3C0VgtnvXxeGGrr/G7NZL8LCFrBhEEMRsINItNDYX/W7je/bRX35oOmZv/R/D+wkR5/cG2GEhcuRqgcasU4jqgOywOg+2V2x353mHUHjdlD/AgpOgLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RVoO5zNh; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773850933; x=1805386933;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ghFbrYT+B/wvkw03LhkhVValFVJzgMVxAtsx+uR5XoQ=;
  b=RVoO5zNh4aQxPnlRswtFrVJl3wBk0wL7pAWCTPgj6W7FxDSMUsnA0Hpl
   nCHbFfaQcIVpaxC9cbEnyKWSjdRtAVpm9UyeF3nipFQ7nOgyq5OXbCgZe
   fGae9rlGiNBH2Tq74TnTH+dUD5Npsv4sgn03dX5K5un42avvGqpeWRd00
   7OWr45jI8UwD2nLaslGWa6homxSeFJ9Cu6AsnsqfozIzigUti9VLChj7r
   cCkVqoOWu7eDONfTT/09eUd32XNnSa5px6+/VmM2vqTx99+/0kVLZucVq
   M+TFgWMp/EraEEXrKh/oUOqCfbg7D6Iy0K6dYuKqjNf8Z4fqxtcQ4Z6w/
   w==;
X-CSE-ConnectionGUID: SGOAQUKSQ1GFkOxqGzCSfw==
X-CSE-MsgGUID: hObORXqYQYmz02yprMVMMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="86267666"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="86267666"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 09:22:12 -0700
X-CSE-ConnectionGUID: m4u0xVHtT4iCS6veRFwIyg==
X-CSE-MsgGUID: WtnD4pK/Rm6ZOD2hsxpnpA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 18 Mar 2026 09:22:11 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2ter-0000000037l-0MrM;
	Wed, 18 Mar 2026 16:22:09 +0000
Date: Thu, 19 Mar 2026 00:21:50 +0800
From: kernel test robot <lkp@intel.com>
To: Bradford Love <brad@nextdimension.cc>, linux-media@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Bradford Love <brad@nextdimension.cc>
Subject: Re: [PATCH 1/2] em28xx: Add support for Empia em2828X bridge
Message-ID: <202603190036.DvoHb1dH-lkp@intel.com>
References: <20260312224915.2907539-2-brad@nextdimension.cc>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312224915.2907539-2-brad@nextdimension.cc>
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56220-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.994];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url,git-scm.com:url,intel.com:dkim,intel.com:email,intel.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxtv.org:url]
X-Rspamd-Queue-Id: 153B02C0342
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bradford,

kernel test robot noticed the following build errors:

[auto build test ERROR on linuxtv-media-pending/master]
[also build test ERROR on media-tree/master sailus-media-tree/master linus/master v7.0-rc4 next-20260317]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bradford-Love/em28xx-Add-support-for-Empia-em2828X-bridge/20260318-090020
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20260312224915.2907539-2-brad%40nextdimension.cc
patch subject: [PATCH 1/2] em28xx: Add support for Empia em2828X bridge
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260319/202603190036.DvoHb1dH-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 4abb927bacf37f18f6359a41639a6d1b3bffffb5)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260319/202603190036.DvoHb1dH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603190036.DvoHb1dH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/usb/em28xx/em28xx-video.c:1154:17: error: incompatible pointer types assigning to 'struct media_entity *' from 'typeof (v4l2->decoder) *' (aka 'struct media_entity **'); dereference with * [-Wincompatible-pointer-types]
    1154 |                 v4l2->decoder = kzalloc_obj(v4l2->decoder, GFP_KERNEL);
         |                               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                 *(                                    )
   1 error generated.


vim +1154 drivers/media/usb/em28xx/em28xx-video.c

  1086	
  1087	static void em28xx_v4l2_create_entities(struct em28xx *dev)
  1088	{
  1089	#if defined(CONFIG_MEDIA_CONTROLLER)
  1090		struct em28xx_v4l2 *v4l2 = dev->v4l2;
  1091		int ret, i;
  1092	
  1093		/* Initialize Video, VBI and Radio pads */
  1094		v4l2->video_pad.flags = MEDIA_PAD_FL_SINK;
  1095		ret = media_entity_pads_init(&v4l2->vdev.entity, 1, &v4l2->video_pad);
  1096		if (ret < 0)
  1097			dev_err(&dev->intf->dev,
  1098				"failed to initialize video media entity!\n");
  1099	
  1100		if (em28xx_vbi_supported(dev)) {
  1101			v4l2->vbi_pad.flags = MEDIA_PAD_FL_SINK;
  1102			ret = media_entity_pads_init(&v4l2->vbi_dev.entity, 1,
  1103						     &v4l2->vbi_pad);
  1104			if (ret < 0)
  1105				dev_err(&dev->intf->dev,
  1106					"failed to initialize vbi media entity!\n");
  1107		}
  1108	
  1109		/* Webcams don't have input connectors */
  1110		if (dev->is_webcam)
  1111			return;
  1112	
  1113		/* Create entities for each input connector */
  1114		for (i = 0; i < MAX_EM28XX_INPUT; i++) {
  1115			struct media_entity *ent = &dev->input_ent[i];
  1116	
  1117			if (!INPUT(i)->type)
  1118				break;
  1119	
  1120			ent->name = iname[INPUT(i)->type];
  1121			ent->flags = MEDIA_ENT_FL_CONNECTOR;
  1122			dev->input_pad[i].flags = MEDIA_PAD_FL_SOURCE;
  1123	
  1124			switch (INPUT(i)->type) {
  1125			case EM28XX_VMUX_COMPOSITE:
  1126				ent->function = MEDIA_ENT_F_CONN_COMPOSITE;
  1127				break;
  1128			case EM28XX_VMUX_SVIDEO:
  1129				ent->function = MEDIA_ENT_F_CONN_SVIDEO;
  1130				break;
  1131			default: /* EM28XX_VMUX_TELEVISION or EM28XX_RADIO */
  1132				if (dev->tuner_type != TUNER_ABSENT || em28xx_analogtv_supported(dev))
  1133					ent->function = MEDIA_ENT_F_CONN_RF;
  1134				break;
  1135			}
  1136	
  1137			ret = media_entity_pads_init(ent, 1, &dev->input_pad[i]);
  1138			if (ret < 0)
  1139				dev_err(&dev->intf->dev,
  1140					"failed to initialize input pad[%d]!\n", i);
  1141	
  1142			ret = media_device_register_entity(dev->media_dev, ent);
  1143			if (ret < 0)
  1144				dev_err(&dev->intf->dev,
  1145					"failed to register input entity %d!\n", i);
  1146		}
  1147	
  1148		if (dev->board.decoder == EM28XX_BUILTIN) {
  1149			v4l2->decoder_pads[EM2828X_PAD_INPUT].flags = MEDIA_PAD_FL_SINK;
  1150			v4l2->decoder_pads[EM2828X_PAD_INPUT].sig_type = PAD_SIGNAL_ANALOG;
  1151			v4l2->decoder_pads[EM2828X_PAD_VID_OUT].flags = MEDIA_PAD_FL_SOURCE;
  1152			v4l2->decoder_pads[EM2828X_PAD_VID_OUT].sig_type = PAD_SIGNAL_DV;
  1153	
> 1154			v4l2->decoder = kzalloc_obj(v4l2->decoder, GFP_KERNEL);
  1155			v4l2->decoder->name = "em2828x_builtin";
  1156			v4l2->decoder->function = MEDIA_ENT_F_ATV_DECODER;
  1157	
  1158			ret = media_entity_pads_init(v4l2->decoder, EM2828X_NUM_PADS, &v4l2->decoder_pads[0]);
  1159			if (ret < 0)
  1160				dev_err(&dev->intf->dev, "failed to initialize decoder pads %d!\n", ret);
  1161	
  1162			ret = media_device_register_entity(dev->media_dev, v4l2->decoder);
  1163			if (ret < 0)
  1164				dev_err(&dev->intf->dev, "failed to register decoder entity %d!\n", ret);
  1165		}
  1166	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

