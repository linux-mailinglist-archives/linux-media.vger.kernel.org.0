Return-Path: <linux-media+bounces-54841-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OBfIKReGq2n/dgEAu9opvQ
	(envelope-from <linux-media+bounces-54841-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 07 Mar 2026 02:57:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B40B229895
	for <lists+linux-media@lfdr.de>; Sat, 07 Mar 2026 02:57:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0FDA53017011
	for <lists+linux-media@lfdr.de>; Sat,  7 Mar 2026 01:56:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E91A27CB02;
	Sat,  7 Mar 2026 01:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NljlpHBh"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8C42EC54A;
	Sat,  7 Mar 2026 01:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772848596; cv=none; b=mvkxaJgZO4qqX5a9Ihs2w68aatzYF5TN79jFV3LQnaYKdBnu1syFNhKH7DVkdtj9bK8S6WSmWMxmFfuzoZVgUIzlof/Z9egUnsdKM3INutgeeXXe5lNWHO4+ynhbNZzYjTecd9GUtx2IBCkUpbrfsmwl5IKNbZzaw2b7sPjsVp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772848596; c=relaxed/simple;
	bh=hqVYElnpCdQVeBz6UnNsyzabvMkwFnQc5aLj+dZzy0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WEssTR0C+dOMBYGN+Ifw33q/Ja21tXb5TnQjLr/GaOHWiMqd5aFRcJHY7CbMT/nX+9t1BSmnKuHrDAivJsoajO1sufjFgMOO4T6lCmWcmbDRWcRVjrP1Wh1yUvZYT3x8iYgWa6zYJLYj5uCWs+cqaLOCKmlTb0NuDEPGSqZaZU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NljlpHBh; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772848591; x=1804384591;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hqVYElnpCdQVeBz6UnNsyzabvMkwFnQc5aLj+dZzy0Y=;
  b=NljlpHBhrojxe+8bV76BIbGWik6J9fj4i2P5dSYrn960wTTBwGDgoEBU
   PF5hIhJfQtncalegDM6QYn1vJ7pJVAxsssF7rA4FnJFNzv0ADdFkO0Hyb
   J0Oi22CI9NP2VxEA7VRDqW88owi6zpabzxyAcNNwuVNGyIaev5I6AYGP5
   uHMJ19Rl0MoAfGqma5HPv6NLUrmmiDSe/fz1j9scOEikOzEDLfY4YL0tM
   qtWPTghuLPFVOGHDmsA1ZNXt3PUO+2NrwXR7w7TfJpQkdDsmWDH0ELqOy
   8DUGqgUGhSwr+WwlISMqNNHv+/aPEvNSRl3BwEzKA4rd+yVrshPiRb6z+
   w==;
X-CSE-ConnectionGUID: 5TX76IOmTveCvF5dNBd1fQ==
X-CSE-MsgGUID: iwhwDfIpSAKRzFpUYDZLPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="91347066"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="91347066"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 17:56:31 -0800
X-CSE-ConnectionGUID: RBpUvLrvQy6Lta3cFjp12A==
X-CSE-MsgGUID: ebLjcGhtRda/4iE21pTdGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="223659732"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 06 Mar 2026 17:56:28 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vygu1-000000001aD-1LZm;
	Sat, 07 Mar 2026 01:56:25 +0000
Date: Sat, 7 Mar 2026 09:56:12 +0800
From: kernel test robot <lkp@intel.com>
To: Tarang Raval <tarang.raval@siliconsignals.io>,
	sakari.ailus@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev, mehdi.djait@linux.intel.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 13/13] media: i2c: os05b10: add 2-lane support
Message-ID: <202603070920.GtWqPt5Q-lkp@intel.com>
References: <20260306123304.76722-14-tarang.raval@siliconsignals.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306123304.76722-14-tarang.raval@siliconsignals.io>
X-Rspamd-Queue-Id: 0B40B229895
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_FROM(0.00)[bounces-54841-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.965];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,01.org:url,intel.com:dkim,intel.com:email,intel.com:mid,git-scm.com:url]
X-Rspamd-Action: no action

Hi Tarang,

kernel test robot noticed the following build errors:

[auto build test ERROR on sailus-media-tree/master]
[also build test ERROR on linus/master v7.0-rc2 next-20260306]
[cannot apply to sailus-media-tree/streams]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tarang-Raval/media-i2c-os05b10-drop-unused-group-hold-programming/20260306-212656
base:   git://linuxtv.org/sailus/media_tree.git master
patch link:    https://lore.kernel.org/r/20260306123304.76722-14-tarang.raval%40siliconsignals.io
patch subject: [PATCH 13/13] media: i2c: os05b10: add 2-lane support
config: openrisc-randconfig-r071-20260307 (https://download.01.org/0day-ci/archive/20260307/202603070920.GtWqPt5Q-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9004-gb810ac53
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260307/202603070920.GtWqPt5Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603070920.GtWqPt5Q-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/i2c/os05b10.c: In function 'os05b10_parse_endpoint':
>> drivers/media/i2c/os05b10.c:1228:56: error: 'struct v4l2_fwnode_endpoint' has no member named 'link_frequencies_2lane'; did you mean 'link_frequencies'?
    1228 |                                                bus_cfg.link_frequencies_2lane,
         |                                                        ^~~~~~~~~~~~~~~~~~~~~~
         |                                                        link_frequencies
>> drivers/media/i2c/os05b10.c:1229:56: error: 'struct v4l2_fwnode_endpoint' has no member named 'nr_of_link_frequencies_2lane'; did you mean 'nr_of_link_frequencies'?
    1229 |                                                bus_cfg.nr_of_link_frequencies_2lane,
         |                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                                        nr_of_link_frequencies
>> drivers/media/i2c/os05b10.c:1240:56: error: 'struct v4l2_fwnode_endpoint' has no member named 'link_frequencies_4lane'; did you mean 'link_frequencies'?
    1240 |                                                bus_cfg.link_frequencies_4lane,
         |                                                        ^~~~~~~~~~~~~~~~~~~~~~
         |                                                        link_frequencies
>> drivers/media/i2c/os05b10.c:1241:56: error: 'struct v4l2_fwnode_endpoint' has no member named 'nr_of_link_frequencies_4lane'; did you mean 'nr_of_link_frequencies'?
    1241 |                                                bus_cfg.nr_of_link_frequencies_4lane,
         |                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                                        nr_of_link_frequencies


vim +1228 drivers/media/i2c/os05b10.c

  1196	
  1197	static int os05b10_parse_endpoint(struct os05b10 *os05b10)
  1198	{
  1199		struct v4l2_fwnode_endpoint bus_cfg = {
  1200			.bus_type = V4L2_MBUS_CSI2_DPHY
  1201		};
  1202		unsigned long link_freq_bitmap;
  1203		struct fwnode_handle *ep;
  1204		int ret;
  1205	
  1206		ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(os05b10->dev), 0, 0, 0);
  1207		if (!ep) {
  1208			dev_err(os05b10->dev, "Failed to get next endpoint\n");
  1209			return -EINVAL;
  1210		}
  1211	
  1212		ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
  1213		fwnode_handle_put(ep);
  1214		if (ret)
  1215			return ret;
  1216	
  1217		if (bus_cfg.bus.mipi_csi2.num_data_lanes != 4 &&
  1218		    bus_cfg.bus.mipi_csi2.num_data_lanes != 2) {
  1219			ret = dev_err_probe(os05b10->dev, -EINVAL,
  1220					    "4 and 2 data lanes are supported\n");
  1221			goto error_out;
  1222		}
  1223	
  1224		os05b10->data_lanes = bus_cfg.bus.mipi_csi2.num_data_lanes;
  1225	
  1226		if (os05b10->data_lanes == 2) {
  1227			ret = v4l2_link_freq_to_bitmap(os05b10->dev,
> 1228						       bus_cfg.link_frequencies_2lane,
> 1229						       bus_cfg.nr_of_link_frequencies_2lane,
  1230						       link_frequencies_2lane,
  1231						       ARRAY_SIZE(link_frequencies_2lane),
  1232						       &link_freq_bitmap);
  1233			if (ret) {
  1234				dev_err(os05b10->dev,
  1235					"For 2 lane 750MHz frequency is available\n");
  1236				goto error_out;
  1237			}
  1238		} else {
  1239			ret = v4l2_link_freq_to_bitmap(os05b10->dev,
> 1240						       bus_cfg.link_frequencies_4lane,
> 1241						       bus_cfg.nr_of_link_frequencies_4lane,
  1242						       link_frequencies_4lane,
  1243						       ARRAY_SIZE(link_frequencies_4lane),
  1244						       &link_freq_bitmap);
  1245			if (ret) {
  1246				dev_err(os05b10->dev,
  1247					"For 4 lane 600MHz frequency is available\n");
  1248				goto error_out;
  1249			}
  1250		}
  1251	
  1252		os05b10->link_freq_index = __ffs(link_freq_bitmap);
  1253	
  1254	error_out:
  1255		v4l2_fwnode_endpoint_free(&bus_cfg);
  1256	
  1257		return ret;
  1258	}
  1259	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

