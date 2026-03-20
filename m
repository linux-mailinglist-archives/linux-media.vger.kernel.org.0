Return-Path: <linux-media+bounces-56514-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPxxCEc2vWkN7wIAu9opvQ
	(envelope-from <linux-media+bounces-56514-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 12:57:59 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 916F82D9DC9
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 12:57:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CB1F5301980F
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 11:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC44439A7E0;
	Fri, 20 Mar 2026 11:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lQNK+Lrj"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92753A5435
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 11:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774007864; cv=none; b=mjWEBA2OF+hYsCM0Fh3WsRth9jtRaOjZqmVrrtsGEX78eU2FPbOT+kgNxrJjOLmOwF8xoYIGKOI3Hs8R/g8O/NqhL7zWQhdpDNPL3QQpIWz99Zj7Ob9wnUmtGS3Kry/1vHtQH55Y8woR4BeY47WdR7qx8Qw39cUo5O58g2UXJbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774007864; c=relaxed/simple;
	bh=6QllHB4KYJSvd6qB7im849nTcQ5o+Z7wG85iNdSLzqo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=la2uBQCeSkXrkptWaaTTZ+jVSGdz655+b4cDNK5wN9NijyJZn5sMGIwRFTRS2fjhl3SIWHJmIqQecNiGjvEPsL8ET0U/6+wU8q6XQImz34mWtroQy4vU9xGSTDHs7NFL6zdEmohF6Z0y361cw/tUekbXOCcY/VBvCnfbd+0U4CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lQNK+Lrj; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774007862; x=1805543862;
  h=date:from:to:cc:subject:message-id;
  bh=6QllHB4KYJSvd6qB7im849nTcQ5o+Z7wG85iNdSLzqo=;
  b=lQNK+LrjfL4Mgt4gqF3a0ZjK+WMeTdcBXELGMYqfvghJ70xlTGTipkls
   cXEGM3BNE8IpKuwl5zSru3gqT4d42SYUhVZYthPcFqAiESCVgm82unm7P
   IQSIcIX+PqVXBLCXWTWP9fPAl5QiMBQxrO5c9GU7irJmqM0uwfviUt5S/
   m/Mp+fUxMAyzMplpzMtDD52592kkDJFeaq5N1fVHlBx4oALn0BLd6EA0H
   +3bOxIAj/ZWijIAvM8Os/LhQVmOXuoX93Ea3k0e3XgN3yNX7tHX7iQkHv
   i3+7GH6CKK97iMoRshiFeyit9+dc3ihjVM1bGfTiv8g5BlKbhT6QCSnbi
   A==;
X-CSE-ConnectionGUID: Yw/KYlPqSdSWuMdqmsO4JQ==
X-CSE-MsgGUID: 709ILw7ZRbKPhmdtwq+ZnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="75277282"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="75277282"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 04:57:42 -0700
X-CSE-ConnectionGUID: V17c0GxgThi9HXUdHPNAig==
X-CSE-MsgGUID: d9rJVqrITTqI+5Oc54jNhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="225195552"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 20 Mar 2026 04:57:39 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3YTf-000000002Jt-0gGR;
	Fri, 20 Mar 2026 11:57:26 +0000
Date: Fri, 20 Mar 2026 19:57:00 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata 19/106]
 drivers/media/platform/renesas/vsp1/vsp1_rwpf.c:280:13: error: incompatible
 function pointer types initializing 'int (*)(struct v4l2_subdev *, const
 struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct
 v4l2_subdev_format *)' with an expres...
Message-ID: <202603201906.5eCaoTIU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [1.54 / 15.00];
	LONG_SUBJ(2.21)[294];
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
	TAGGED_FROM(0.00)[bounces-56514-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.968];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:email,intel.com:dkim,intel.com:email,intel.com:mid,01.org:url]
X-Rspamd-Queue-Id: 916F82D9DC9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   7a108073e0c1f6e9035329a152d5835f9d4f9507
commit: bdc96b4bd0deb40af6350382e510ddfa0850d656 [19/106] media: v4l2-subdev: Add struct v4l2_subdev_client_info pointer to pad ops
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260320/202603201906.5eCaoTIU-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260320/202603201906.5eCaoTIU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603201906.5eCaoTIU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/platform/renesas/sh_vou.c:716:8: error: too few arguments to function call, expected 4, have 3
     716 |         ret = v4l2_device_call_until_err(&vou_dev->v4l2_dev, 0, pad,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     717 |                                          set_fmt, NULL, &format);
         |                                          ~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-device.h:448:2: note: expanded from macro 'v4l2_device_call_until_err'
     448 |         __v4l2_device_call_subdevs_until_err_p(v4l2_dev, __sd,          \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     449 |                         (grpid) == 0 || __sd->grp_id == (grpid), o, f , \
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     450 |                         ##args);                                        \
         |                         ~~~~~~~
   include/media/v4l2-device.h:356:41: note: expanded from macro '__v4l2_device_call_subdevs_until_err_p'
     356 |                         __err = (sd)->ops->o->f((sd) , ##args);         \
         |                                 ~~~~~~~~~~~~~~~              ^
   drivers/media/platform/renesas/sh_vou.c:976:2: error: too few arguments to function call, expected 4, have 3
     976 |         v4l2_device_call_until_err(&vou_dev->v4l2_dev, 0, pad,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     977 |                                    set_selection, NULL, &sd_sel);
         |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-device.h:448:2: note: expanded from macro 'v4l2_device_call_until_err'
     448 |         __v4l2_device_call_subdevs_until_err_p(v4l2_dev, __sd,          \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     449 |                         (grpid) == 0 || __sd->grp_id == (grpid), o, f , \
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     450 |                         ##args);                                        \
         |                         ~~~~~~~
   include/media/v4l2-device.h:356:41: note: expanded from macro '__v4l2_device_call_subdevs_until_err_p'
     356 |                         __err = (sd)->ops->o->f((sd) , ##args);         \
         |                                 ~~~~~~~~~~~~~~~              ^
   drivers/media/platform/renesas/sh_vou.c:980:8: error: too few arguments to function call, expected 4, have 3
     980 |         ret = v4l2_device_call_until_err(&vou_dev->v4l2_dev, 0, pad,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     981 |                                          set_fmt, NULL, &format);
         |                                          ~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-device.h:448:2: note: expanded from macro 'v4l2_device_call_until_err'
     448 |         __v4l2_device_call_subdevs_until_err_p(v4l2_dev, __sd,          \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     449 |                         (grpid) == 0 || __sd->grp_id == (grpid), o, f , \
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     450 |                         ##args);                                        \
         |                         ~~~~~~~
   include/media/v4l2-device.h:356:41: note: expanded from macro '__v4l2_device_call_subdevs_until_err_p'
     356 |                         __err = (sd)->ops->o->f((sd) , ##args);         \
         |                                 ~~~~~~~~~~~~~~~              ^
   3 errors generated.
--
>> drivers/media/platform/renesas/rcar-vin/rcar-dma.c:1184:6: error: too few arguments to function call, expected 4, have 3
    1184 |         if (v4l2_subdev_call(sd, pad, get_fmt, NULL, &fmt))
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1931:20: note: expanded from macro 'v4l2_subdev_call'
    1930 |                         __result = v4l2_subdev_call_wrappers.o->f(      \
         |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1931 |                                                         __sd, ##args);  \
         |                                                                     ^
>> drivers/media/platform/renesas/rcar-vin/rcar-dma.c:1184:6: error: too few arguments to function call, expected 4, have 3
    1184 |         if (v4l2_subdev_call(sd, pad, get_fmt, NULL, &fmt))
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1933:43: note: expanded from macro 'v4l2_subdev_call'
    1933 |                         __result = __sd->ops->o->f(__sd, ##args);       \
         |                                    ~~~~~~~~~~~~~~~             ^
   2 errors generated.
--
>> drivers/media/platform/st/stm32/stm32-dcmi.c:741:9: error: too few arguments to function call, expected 4, have 3
     741 |                 ret = v4l2_subdev_call(subdev, pad, set_fmt, NULL, &fmt);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1931:20: note: expanded from macro 'v4l2_subdev_call'
    1930 |                         __result = v4l2_subdev_call_wrappers.o->f(      \
         |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1931 |                                                         __sd, ##args);  \
         |                                                                     ^
>> drivers/media/platform/st/stm32/stm32-dcmi.c:741:9: error: too few arguments to function call, expected 4, have 3
     741 |                 ret = v4l2_subdev_call(subdev, pad, set_fmt, NULL, &fmt);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1933:43: note: expanded from macro 'v4l2_subdev_call'
    1933 |                         __result = __sd->ops->o->f(__sd, ##args);       \
         |                                    ~~~~~~~~~~~~~~~             ^
   drivers/media/platform/st/stm32/stm32-dcmi.c:1066:8: error: too few arguments to function call, expected 4, have 3
    1066 |         ret = v4l2_subdev_call_state_try(dcmi->source, pad, set_fmt, &format);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1998:15: note: expanded from macro 'v4l2_subdev_call_state_try'
    1998 |                         __result = v4l2_subdev_call(sd, o, f, state, ##args); \
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1931:20: note: expanded from macro 'v4l2_subdev_call'
    1930 |                         __result = v4l2_subdev_call_wrappers.o->f(      \
         |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1931 |                                                         __sd, ##args);  \
         |                                                                     ^
   drivers/media/platform/st/stm32/stm32-dcmi.c:1066:8: error: too few arguments to function call, expected 4, have 3
    1066 |         ret = v4l2_subdev_call_state_try(dcmi->source, pad, set_fmt, &format);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1998:15: note: expanded from macro 'v4l2_subdev_call_state_try'
    1998 |                         __result = v4l2_subdev_call(sd, o, f, state, ##args); \
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1933:43: note: expanded from macro 'v4l2_subdev_call'
    1933 |                         __result = __sd->ops->o->f(__sd, ##args);       \
         |                                    ~~~~~~~~~~~~~~~             ^
   drivers/media/platform/st/stm32/stm32-dcmi.c:1199:8: error: too few arguments to function call, expected 4, have 3
    1199 |         ret = v4l2_subdev_call(dcmi->source, pad, get_fmt, NULL, &fmt);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1931:20: note: expanded from macro 'v4l2_subdev_call'
    1930 |                         __result = v4l2_subdev_call_wrappers.o->f(      \
         |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1931 |                                                         __sd, ##args);  \
         |                                                                     ^
   drivers/media/platform/st/stm32/stm32-dcmi.c:1199:8: error: too few arguments to function call, expected 4, have 3
    1199 |         ret = v4l2_subdev_call(dcmi->source, pad, get_fmt, NULL, &fmt);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1933:43: note: expanded from macro 'v4l2_subdev_call'
    1933 |                         __result = __sd->ops->o->f(__sd, ##args);       \
         |                                    ~~~~~~~~~~~~~~~             ^
   drivers/media/platform/st/stm32/stm32-dcmi.c:1227:8: error: too few arguments to function call, expected 4, have 3
    1227 |         ret = v4l2_subdev_call_state_try(dcmi->source, pad, set_fmt, &format);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1998:15: note: expanded from macro 'v4l2_subdev_call_state_try'
    1998 |                         __result = v4l2_subdev_call(sd, o, f, state, ##args); \
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1931:20: note: expanded from macro 'v4l2_subdev_call'
    1930 |                         __result = v4l2_subdev_call_wrappers.o->f(      \
         |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1931 |                                                         __sd, ##args);  \
         |                                                                     ^
   drivers/media/platform/st/stm32/stm32-dcmi.c:1227:8: error: too few arguments to function call, expected 4, have 3
    1227 |         ret = v4l2_subdev_call_state_try(dcmi->source, pad, set_fmt, &format);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1998:15: note: expanded from macro 'v4l2_subdev_call_state_try'
    1998 |                         __result = v4l2_subdev_call(sd, o, f, state, ##args); \
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1933:43: note: expanded from macro 'v4l2_subdev_call'
    1933 |                         __result = __sd->ops->o->f(__sd, ##args);       \
         |                                    ~~~~~~~~~~~~~~~             ^
   drivers/media/platform/st/stm32/stm32-dcmi.c:1249:8: error: too few arguments to function call, expected 4, have 3
    1249 |         ret = v4l2_subdev_call(dcmi->source, pad, get_selection,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1250 |                                NULL, &bounds);
         |                                ~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1931:20: note: expanded from macro 'v4l2_subdev_call'
    1930 |                         __result = v4l2_subdev_call_wrappers.o->f(      \
         |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1931 |                                                         __sd, ##args);  \
         |                                                                     ^
   drivers/media/platform/st/stm32/stm32-dcmi.c:1249:8: error: too few arguments to function call, expected 4, have 3
    1249 |         ret = v4l2_subdev_call(dcmi->source, pad, get_selection,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1250 |                                NULL, &bounds);
         |                                ~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1933:43: note: expanded from macro 'v4l2_subdev_call'
    1933 |                         __result = __sd->ops->o->f(__sd, ##args);       \
         |                                    ~~~~~~~~~~~~~~~             ^
   10 errors generated.
--
>> drivers/media/platform/ti/omap3isp/ispccdc.c:1160:7: error: too few arguments to function call, expected 4, have 3
    1160 |         if (!v4l2_subdev_call(sensor, pad, get_fmt, NULL, &fmt_src)) {
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1931:20: note: expanded from macro 'v4l2_subdev_call'
    1930 |                         __result = v4l2_subdev_call_wrappers.o->f(      \
         |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1931 |                                                         __sd, ##args);  \
         |                                                                     ^
>> drivers/media/platform/ti/omap3isp/ispccdc.c:1160:7: error: too few arguments to function call, expected 4, have 3
    1160 |         if (!v4l2_subdev_call(sensor, pad, get_fmt, NULL, &fmt_src)) {
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1933:43: note: expanded from macro 'v4l2_subdev_call'
    1933 |                         __result = __sd->ops->o->f(__sd, ##args);       \
         |                                    ~~~~~~~~~~~~~~~             ^
   drivers/media/platform/ti/omap3isp/ispccdc.c:2496:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    2496 |         .get_fmt = ccdc_get_format,
         |                    ^~~~~~~~~~~~~~~
   drivers/media/platform/ti/omap3isp/ispccdc.c:2497:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    2497 |         .set_fmt = ccdc_set_format,
         |                    ^~~~~~~~~~~~~~~
   drivers/media/platform/ti/omap3isp/ispccdc.c:2498:19: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_selection *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_selection *)' [-Wincompatible-function-pointer-types]
    2498 |         .get_selection = ccdc_get_selection,
         |                          ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/ti/omap3isp/ispccdc.c:2499:19: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_selection *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_selection *)' [-Wincompatible-function-pointer-types]
    2499 |         .set_selection = ccdc_set_selection,
         |                          ^~~~~~~~~~~~~~~~~~
   6 errors generated.
--
>> drivers/media/platform/renesas/vsp1/vsp1_rwpf.c:280:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
     280 |         .get_fmt = vsp1_subdev_get_pad_format,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/renesas/vsp1/vsp1_rwpf.c:281:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
     281 |         .set_fmt = vsp1_rwpf_set_format,
         |                    ^~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/renesas/vsp1/vsp1_rwpf.c:282:19: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_selection *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_selection *)' [-Wincompatible-function-pointer-types]
     282 |         .get_selection = vsp1_rwpf_get_selection,
         |                          ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/renesas/vsp1/vsp1_rwpf.c:283:19: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_selection *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_selection *)' [-Wincompatible-function-pointer-types]
     283 |         .set_selection = vsp1_rwpf_set_selection,
         |                          ^~~~~~~~~~~~~~~~~~~~~~~
   4 errors generated.
--
>> drivers/media/platform/renesas/vsp1/vsp1_clu.c:160:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
     160 |         .get_fmt = vsp1_subdev_get_pad_format,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/renesas/vsp1/vsp1_clu.c:161:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
     161 |         .set_fmt = clu_set_format,
         |                    ^~~~~~~~~~~~~~
   2 errors generated.
--
>> drivers/media/platform/renesas/vsp1/vsp1_hsit.c:126:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
     126 |         .get_fmt = vsp1_subdev_get_pad_format,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/renesas/vsp1/vsp1_hsit.c:127:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
     127 |         .set_fmt = hsit_set_format,
         |                    ^~~~~~~~~~~~~~~
   2 errors generated.
--
>> drivers/media/platform/renesas/vsp1/vsp1_lut.c:136:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
     136 |         .get_fmt = vsp1_subdev_get_pad_format,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/renesas/vsp1/vsp1_lut.c:137:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
     137 |         .set_fmt = lut_set_format,
         |                    ^~~~~~~~~~~~~~
   2 errors generated.
--
>> drivers/media/platform/renesas/vsp1/vsp1_brx.c:267:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
     267 |         .get_fmt = vsp1_subdev_get_pad_format,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/renesas/vsp1/vsp1_brx.c:268:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
     268 |         .set_fmt = brx_set_format,
         |                    ^~~~~~~~~~~~~~
   drivers/media/platform/renesas/vsp1/vsp1_brx.c:269:19: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_selection *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_selection *)' [-Wincompatible-function-pointer-types]
     269 |         .get_selection = brx_get_selection,
         |                          ^~~~~~~~~~~~~~~~~
   drivers/media/platform/renesas/vsp1/vsp1_brx.c:270:19: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_selection *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_selection *)' [-Wincompatible-function-pointer-types]
     270 |         .set_selection = brx_set_selection,
         |                          ^~~~~~~~~~~~~~~~~
   4 errors generated.
--
>> drivers/media/platform/renesas/vsp1/vsp1_sru.c:262:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
     262 |         .get_fmt = vsp1_subdev_get_pad_format,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/renesas/vsp1/vsp1_sru.c:263:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
     263 |         .set_fmt = sru_set_format,
         |                    ^~~~~~~~~~~~~~
   2 errors generated.
--
>> drivers/media/platform/renesas/vsp1/vsp1_uds.c:249:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
     249 |         .get_fmt = vsp1_subdev_get_pad_format,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/renesas/vsp1/vsp1_uds.c:250:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
     250 |         .set_fmt = uds_set_format,
         |                    ^~~~~~~~~~~~~~
   2 errors generated.
..


vim +280 drivers/media/platform/renesas/vsp1/vsp1_rwpf.c

bd2fdd5aa919e3 drivers/media/platform/vsp1/vsp1_rwpf.c         Laurent Pinchart 2015-11-01  276  
42d62b7e47d582 drivers/media/platform/renesas/vsp1/vsp1_rwpf.c Laurent Pinchart 2023-10-24  277  static const struct v4l2_subdev_pad_ops vsp1_rwpf_pad_ops = {
c6c8efb656ff21 drivers/media/platform/vsp1/vsp1_rwpf.c         Laurent Pinchart 2015-11-22  278  	.enum_mbus_code = vsp1_rwpf_enum_mbus_code,
c6c8efb656ff21 drivers/media/platform/vsp1/vsp1_rwpf.c         Laurent Pinchart 2015-11-22  279  	.enum_frame_size = vsp1_rwpf_enum_frame_size,
3f557220cc29d1 drivers/media/platform/vsp1/vsp1_rwpf.c         Laurent Pinchart 2016-02-24 @280  	.get_fmt = vsp1_subdev_get_pad_format,
c6c8efb656ff21 drivers/media/platform/vsp1/vsp1_rwpf.c         Laurent Pinchart 2015-11-22  281  	.set_fmt = vsp1_rwpf_set_format,
c6c8efb656ff21 drivers/media/platform/vsp1/vsp1_rwpf.c         Laurent Pinchart 2015-11-22  282  	.get_selection = vsp1_rwpf_get_selection,
c6c8efb656ff21 drivers/media/platform/vsp1/vsp1_rwpf.c         Laurent Pinchart 2015-11-22  283  	.set_selection = vsp1_rwpf_set_selection,
c6c8efb656ff21 drivers/media/platform/vsp1/vsp1_rwpf.c         Laurent Pinchart 2015-11-22  284  };
c6c8efb656ff21 drivers/media/platform/vsp1/vsp1_rwpf.c         Laurent Pinchart 2015-11-22  285  

:::::: The code at line 280 was first introduced by commit
:::::: 3f557220cc29d1961ef9efa2a8db04c7c5f6e6d4 [media] v4l: vsp1: Factorize get pad format code

:::::: TO: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@osg.samsung.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

