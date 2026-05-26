Return-Path: <linux-media+bounces-62824-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJe+EAXdFWrTdQcAu9opvQ
	(envelope-from <linux-media+bounces-62824-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 19:48:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0560E5DAEC9
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 19:48:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C942B3012CF2
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 17:48:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E258C41C31B;
	Tue, 26 May 2026 17:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KNZXw6Ea"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F01F372EF1;
	Tue, 26 May 2026 17:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779817720; cv=none; b=R8TJKctB+YHoYs+eO+98VwrOTE3g9NVc8j4zMuatcFsJw628hOqFTM6XeMumygCHIbx2wa+HaObxovSMOOFmWSy7vaCaT0+vtrJHL1chKX3T2kw0EyPK1uccRr422zbwODhidwRDRno1/SfvH5AsJo1rr21mZJUBTZFiVdAlDUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779817720; c=relaxed/simple;
	bh=a5Ee7f09oAdBoMKIxduYTdY6R7xOpK2bD0sHpJz4/l0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UXs7BEe8IOt7/YM7kgVHbXf7IOvRZWy/Cs2xKJvOclEu07qSuJNcDFUZEXn/h1da5ZqyplTkVEfRDJoR/+YGRw0YFy5mxID8tZvF/RJMHJvULzIc8KNqBMSD3qtkS9GXfwqy7jvU3iGNm14OToH54E1dGfxenrLkEx2M2qla0+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KNZXw6Ea; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779817718; x=1811353718;
  h=date:from:to:cc:subject:message-id;
  bh=a5Ee7f09oAdBoMKIxduYTdY6R7xOpK2bD0sHpJz4/l0=;
  b=KNZXw6EaI7uYqH8F//a6w2O/5P6dEFKhfRsXV+NkemiKm38FEELGfV+e
   PdQELk+EETmHhe+s7W7OF+b4JgVUbzscHP9EQfrJ45Xf/drnlvsS0ctZR
   lrtlMkThIjRgq7Sfw1y9ONEcF7gnlrP05QLiHiGMrmxVznA/ycaFyFK9F
   FOfT2zRSoYN8OuJaH0NsCWs77gef3uwvT+1rqY9ANIJ9dYifowIE7oO1z
   4WhWVjPIPf6NzH025V/HJGKZ9zHp2joFuiy8iCycwGxCOMSBGRM97UUbe
   DRoza16uUUjm73y+IwzEc3KrHLbR1z33D6iQJuWuZF4IcDnrHRxXamAWm
   w==;
X-CSE-ConnectionGUID: sU4scsulRNOyf/rKYqBT2Q==
X-CSE-MsgGUID: EEITXgBVSByR5BM9ImSz0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="91211126"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="91211126"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 10:48:38 -0700
X-CSE-ConnectionGUID: 7NUp1wFST9aArxjbuvgHGA==
X-CSE-MsgGUID: fJ6uiUOWRfOcRcZbelprXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="246242838"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 26 May 2026 10:48:36 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRvtI-00000000CSf-3MYG;
	Tue, 26 May 2026 17:48:32 +0000
Date: Tue, 26 May 2026 19:47:33 +0200
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Mirela Rabulea <mirela.rabulea@nxp.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, linux-doc@vger.kernel.org
Subject: [sailus-media-tree:metadata 59/126] htmldocs:
 Documentation/userspace-api/media/v4l/subdev-config-model.rst:6: WARNING:
 duplicate label media_subdev_config_model, other instance in
 Documentation/userspace-api/media/v4l/dev-subdev.rst
Message-ID: <202605261948.2WptznsW-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62824-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,intel.com:email,intel.com:mid,intel.com:dkim]
X-Rspamd-Queue-Id: 0560E5DAEC9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   5b470f2ed717705b51f4a799722dffb34a37f10a
commit: 643ed29222de6019c0321bbb7d7d65e6a50fcf4f [59/126] media: Documentation: Add subdev configuration models, raw sensor model
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260526/202605261948.2WptznsW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605261948.2WptznsW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/userspace-api/landlock:550: ./include/uapi/linux/landlock.h:45: ERROR: Unknown target name: "network flags". [docutils]
   Documentation/userspace-api/landlock:550: ./include/uapi/linux/landlock.h:50: ERROR: Unknown target name: "scope flags". [docutils]
   Documentation/userspace-api/landlock:550: ./include/uapi/linux/landlock.h:24: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:559: ./include/uapi/linux/landlock.h:168: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:559: ./include/uapi/linux/landlock.h:191: ERROR: Unknown target name: "network flags". [docutils]
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

