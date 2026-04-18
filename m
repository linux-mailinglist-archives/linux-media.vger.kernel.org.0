Return-Path: <linux-media+bounces-59080-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFYxOrSt42lTJwEAu9opvQ
	(envelope-from <linux-media+bounces-59080-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2026 18:13:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 401E34218B7
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2026 18:13:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 22DFD301BF61
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2026 16:13:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DDD8303C93;
	Sat, 18 Apr 2026 16:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NOdc0XHt"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A582DE709;
	Sat, 18 Apr 2026 16:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776528810; cv=none; b=k0IjfIxGHj0blhimJiOwLJzrdIOE3HdW/rdypw6yyDOdaUfXbEEhNkTmssyuSBv/SsQQ21XEwRxqvFsAZwiaxiF9ty88274a5kfW1AzJFg4vf60Wy3t+kyn7B4/Lvos6BsKg6stA9Mjl/y2FSW5ZxEgfAH3iQi+6aAdXZlMsqhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776528810; c=relaxed/simple;
	bh=OfJ6hcjMSopm7dYCgXtRGXIQFhrTj3OfmSn0nbgFHls=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QsbwZ3mwxAmtyPumX+FTrmcR8KhIsqxRzCHalWmT3/pPy3CQesnFU4YT2DA3TI3WZe8ZKzK7e67dnmDNH44LSDeILtoLy1nwHIcT/Z68O9n69+3QY9iQYCQ/21SestFWeFqIbkqQl4jVXVRB94aWUs7HEaFHEz2E1Ri8tQNshL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NOdc0XHt; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776528808; x=1808064808;
  h=date:from:to:cc:subject:message-id;
  bh=OfJ6hcjMSopm7dYCgXtRGXIQFhrTj3OfmSn0nbgFHls=;
  b=NOdc0XHtj1PTwnLCM2XmshS5sZEQsDMxkR8NEeqLV0w9N4ajlFFGIR0T
   KGLZ/uNbGba0+vjM+QhNQ5PAJBgnXDJ/Kzb0HnfiYpBkUoAGaUU77IWVB
   m5CaXRj4sDY6PRmhxIX+9DWKZnHuVCG4LU8JelNmkgGxBZblYHKMfUqIq
   CCk/zRqEManSSjcZdyY5tG2YBNmbmbZdXnKoD9C/uBsyMCLzFK/x5oe3X
   EQj8yHZaqy24VkTes98+Swf5v4GiahD3rMEiYODXTLpqtO76HXTNLRfy2
   l9MOpHtcdICzewqhSYrLaTsTvPOkVpvBkQ/WUfxyOJ1QbL7lDLRDUxtps
   w==;
X-CSE-ConnectionGUID: gDT15W5PTWum4olHDR0TSg==
X-CSE-MsgGUID: jU2f+6xJTcSqXSH/mX/Nww==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77586192"
X-IronPort-AV: E=Sophos;i="6.23,186,1770624000"; 
   d="scan'208";a="77586192"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2026 09:13:27 -0700
X-CSE-ConnectionGUID: Np+9Ss+eRniy32UFCdImng==
X-CSE-MsgGUID: zbNPn++LQO+FiDS67+srSw==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 18 Apr 2026 09:13:25 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wE8IM-000000001fV-3Zqb;
	Sat, 18 Apr 2026 16:13:22 +0000
Date: Sat, 18 Apr 2026 18:12:41 +0200
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Mirela Rabulea <mirela.rabulea@nxp.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, linux-doc@vger.kernel.org
Subject: [sailus-media-tree:metadata 50/114] htmldocs:
 Documentation/userspace-api/media/v4l/subdev-config-model.rst:6: WARNING:
 duplicate label media_subdev_config_model, other instance in
 Documentation/userspace-api/media/v4l/dev-subdev.rst
Message-ID: <202604181837.JkmT17KM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [1.09 / 15.00];
	LONG_SUBJ(1.75)[233];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59080-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,intel.com:dkim,intel.com:mid]
X-Rspamd-Queue-Id: 401E34218B7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   7bb838184fdc0d716c2a06795fc6ef1f1fb8350b
commit: 8e5bf1f62e3753a0172060ede618b246677f041e [50/114] media: Documentation: Add subdev configuration models, raw sensor model
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260418/202604181837.JkmT17KM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604181837.JkmT17KM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/userspace-api/landlock:526: ./include/uapi/linux/landlock.h:45: ERROR: Unknown target name: "network flags". [docutils]
   Documentation/userspace-api/landlock:526: ./include/uapi/linux/landlock.h:50: ERROR: Unknown target name: "scope flags". [docutils]
   Documentation/userspace-api/landlock:526: ./include/uapi/linux/landlock.h:24: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:535: ./include/uapi/linux/landlock.h:166: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:535: ./include/uapi/linux/landlock.h:189: ERROR: Unknown target name: "network flags". [docutils]
>> Documentation/userspace-api/media/v4l/subdev-config-model.rst:6: WARNING: duplicate label media_subdev_config_model, other instance in Documentation/userspace-api/media/v4l/dev-subdev.rst
>> Documentation/userspace-api/media/v4l/subdev-config-model.rst:35: WARNING: duplicate label media_subdev_config_model_common_raw_sensor, other instance in Documentation/userspace-api/media/v4l/dev-subdev.rst
>> Documentation/userspace-api/media/v4l/subdev-config-model.rst:: WARNING: duplicate label media_subdev_config_model_common_raw_sensor_subdev, other instance in Documentation/userspace-api/media/v4l/dev-subdev.rst
   Documentation/networking/skbuff:36: ./include/linux/skbuff.h:181: WARNING: Failed to create a cross reference. A title or caption not found: 'crc' [ref.ref]
   Documentation/userspace-api/media/drivers/camera-sensor.rst:147: WARNING: undefined label: 'media-metadata-layout-ccs' [ref.ref]


vim +6 Documentation/userspace-api/media/v4l/subdev-config-model.rst

     4	
     5	Sub-device configuration models
   > 6	===============================
     7	
     8	The V4L2 specification defines a subdev API that exposes three type of
     9	configuration elements: formats, selection rectangles and controls. The
    10	specification contains generic information about how those configuration
    11	elements behave, but not precisely how they apply to particular hardware
    12	features. We leave some leeway to drivers to decide how to map selection
    13	rectangles to device features, as long as they comply with the V4L2
    14	specification. This is needed as hardware features differ between devices, so
    15	it's the driver's responsibility to handle this mapping.
    16	
    17	Unfortunately, this lack of clearly defined mapping in the specification has led
    18	to different drivers mapping the same hardware features to different API
    19	elements, or implementing the API elements with slightly different
    20	behaviours. Furthermore, many drivers have implemented selection rectangles in
    21	ways that do not comply with the V4L2 specification. All of this makes userspace
    22	development difficult.
    23	
    24	Sub-device configuration models specify in detail what the user space can expect
    25	from a sub-device in terms of V4L2 sub-device interface support, semantics
    26	included.
    27	
    28	A sub-device may implement more than one configuration model at the same
    29	time. The implemented configuration models can be obtained from the sub-device's
    30	``V4L2_CID_CONFIG_MODEL`` control.
    31	
    32	.. _media_subdev_config_model_common_raw_sensor:
    33	
    34	Common raw camera sensor model
  > 35	------------------------------
    36	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

