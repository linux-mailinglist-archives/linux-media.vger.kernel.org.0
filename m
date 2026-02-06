Return-Path: <linux-media+bounces-52320-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGSkBmwohmmLKAQAu9opvQ
	(envelope-from <linux-media+bounces-52320-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 18:44:12 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1DC1014A6
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 18:44:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D74BC305FBED
	for <lists+linux-media@lfdr.de>; Fri,  6 Feb 2026 17:42:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0F2C425CC6;
	Fri,  6 Feb 2026 17:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dmqlshof"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA5B423A9C
	for <linux-media@vger.kernel.org>; Fri,  6 Feb 2026 17:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770399732; cv=none; b=owZzabwZPQDuSw7wB3Jp1cXmh/KSHMzSk+0rS8iCqv4a+sF0Szu2OL7syxlZz2HFJEC+KbiRVszuJZcpvt+UF9RRJa49oX1n900U1AW2s+iyMxypy8Krtq7r/obNOUGFcKKJS825W2oUHtDjF0aOTSfz8UZv1Ehdwi6tINyjJq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770399732; c=relaxed/simple;
	bh=JDt+a/gYazs++ZGB4iN+c7wbmwnVO4l3RhEEUg9XDhs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EWsHiQBzdHT9ZGy3PIQokxPP0keRBhM5reCJj2iXFaLXQCvSuK0MZuH5P64yg7dBf/QQ30bhDxKWkGj2AcgWy7f0pUvPtqvLH9w7pfbgZL06i5yfS8Npid3dF29MoB5gbXGkht6Lwy8XqPRvJsrxBzHkdmJyhIAkq3AUW5gS134=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dmqlshof; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770399732; x=1801935732;
  h=date:from:to:cc:subject:message-id;
  bh=JDt+a/gYazs++ZGB4iN+c7wbmwnVO4l3RhEEUg9XDhs=;
  b=dmqlshofURDHyv5uhQ1EJtitM/eaPd6yFXzdCvCJc9NSlhFM7MQrh4QA
   N8Zk6Vab+/DytmNv6fZR6gzvUS/g1HTY8LYLZpZXcJEBwvPdlFSe+ep4v
   7JIka1M2AyNnTTgzdBOp3pJEESE1eYkYntxvLMUTT9HcyhBqByIUyyhnZ
   H55LTyXa2kDdUawUZ8AlToPB2h4eE/tfypQKb69njiMSzeRr4tSrXSctk
   dJ3LRGXwMlc/EwHtcQu3tPIBCYK9F0lsLQzYgTNj9GPtC//vXh2CPnEdI
   TDmdIiUPMzuVytkWG6pDdTgJVul/bANH92kSe1Dic5FdB5g1TovOkNJKT
   Q==;
X-CSE-ConnectionGUID: 7BbAUgZoSDK3CDeNmheanA==
X-CSE-MsgGUID: RuUoo/vTTW+RfXuwa4eCEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="71792159"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="71792159"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 09:42:11 -0800
X-CSE-ConnectionGUID: cGnulJS3Rqmh9yYlLLbFQg==
X-CSE-MsgGUID: RfOJlnddTRumcw22JYcu0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="233884349"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Feb 2026 09:42:08 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voPqH-00000000ky4-3oIj;
	Fri, 06 Feb 2026 17:42:05 +0000
Date: Sat, 07 Feb 2026 01:41:51 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata-pre 11/13]
 drivers/media/pci/saa7134/saa7134-empress.c:106:2: error: too few arguments
 to function call, expected 4, have 3
Message-ID: <202602070104.132QkQjg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52320-lists,linux-media=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,intel.com:mid,01.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,cisco.com:email]
X-Rspamd-Queue-Id: 8F1DC1014A6
X-Rspamd-Action: no action

tree:   git://linuxtv.org/sailus/media_tree.git metadata-pre
head:   1b58854744d17413b2855b20178e63a1c82d58f5
commit: e7ba02736fa5365cfe31dfd34c5557f10c4348fa [11/13] media: v4l2-subdev: Add struct v4l2_subdev_client_info pointer to pad ops
config: loongarch-randconfig-001-20260206 (https://download.01.org/0day-ci/archive/20260207/202602070104.132QkQjg-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602070104.132QkQjg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602070104.132QkQjg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/pci/saa7134/saa7134-empress.c:106:2: error: too few arguments to function call, expected 4, have 3
     106 |         saa_call_all(dev, pad, get_fmt, NULL, &fmt);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/pci/saa7134/saa7134.h:707:2: note: expanded from macro 'saa_call_all'
     707 |         v4l2_device_call_all(&(dev)->v4l2_dev, 0, o, f , ##args);       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-device.h:416:3: note: expanded from macro 'v4l2_device_call_all'
     416 |                 __v4l2_device_call_subdevs_p(v4l2_dev, __sd,            \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     417 |                         (grpid) == 0 || __sd->grp_id == (grpid), o, f , \
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     418 |                         ##args);                                        \
         |                         ~~~~~~~
   include/media/v4l2-device.h:297:34: note: expanded from macro '__v4l2_device_call_subdevs_p'
     297 |                                 (sd)->ops->o->f((sd) , ##args);         \
         |                                 ~~~~~~~~~~~~~~~              ^
   drivers/media/pci/saa7134/saa7134-empress.c:125:2: error: too few arguments to function call, expected 4, have 3
     125 |         saa_call_all(dev, pad, set_fmt, NULL, &format);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/pci/saa7134/saa7134.h:707:2: note: expanded from macro 'saa_call_all'
     707 |         v4l2_device_call_all(&(dev)->v4l2_dev, 0, o, f , ##args);       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-device.h:416:3: note: expanded from macro 'v4l2_device_call_all'
     416 |                 __v4l2_device_call_subdevs_p(v4l2_dev, __sd,            \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     417 |                         (grpid) == 0 || __sd->grp_id == (grpid), o, f , \
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     418 |                         ##args);                                        \
         |                         ~~~~~~~
   include/media/v4l2-device.h:297:34: note: expanded from macro '__v4l2_device_call_subdevs_p'
     297 |                                 (sd)->ops->o->f((sd) , ##args);         \
         |                                 ~~~~~~~~~~~~~~~              ^
   drivers/media/pci/saa7134/saa7134-empress.c:148:2: error: too few arguments to function call, expected 4, have 3
     148 |         saa_call_all(dev, pad, set_fmt, &pad_state, &format);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/pci/saa7134/saa7134.h:707:2: note: expanded from macro 'saa_call_all'
     707 |         v4l2_device_call_all(&(dev)->v4l2_dev, 0, o, f , ##args);       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-device.h:416:3: note: expanded from macro 'v4l2_device_call_all'
     416 |                 __v4l2_device_call_subdevs_p(v4l2_dev, __sd,            \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     417 |                         (grpid) == 0 || __sd->grp_id == (grpid), o, f , \
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     418 |                         ##args);                                        \
         |                         ~~~~~~~
   include/media/v4l2-device.h:297:34: note: expanded from macro '__v4l2_device_call_subdevs_p'
     297 |                                 (sd)->ops->o->f((sd) , ##args);         \
         |                                 ~~~~~~~~~~~~~~~              ^
   3 errors generated.
--
>> drivers/media/platform/marvell/mcam-core.c:1025:9: error: too few arguments to function call, expected 4, have 3
    1025 |                 ret = sensor_call(cam, pad, set_fmt, NULL, &format);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/marvell/mcam-core.c:96:2: note: expanded from macro 'sensor_call'
      96 |         v4l2_subdev_call(cam->sensor, o, f, ##args)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1909:20: note: expanded from macro 'v4l2_subdev_call'
    1908 |                         __result = v4l2_subdev_call_wrappers.o->f(      \
         |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1909 |                                                         __sd, ##args);  \
         |                                                                     ^
>> drivers/media/platform/marvell/mcam-core.c:1025:9: error: too few arguments to function call, expected 4, have 3
    1025 |                 ret = sensor_call(cam, pad, set_fmt, NULL, &format);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/marvell/mcam-core.c:96:2: note: expanded from macro 'sensor_call'
      96 |         v4l2_subdev_call(cam->sensor, o, f, ##args)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1911:43: note: expanded from macro 'v4l2_subdev_call'
    1911 |                         __result = __sd->ops->o->f(__sd, ##args);       \
         |                                    ~~~~~~~~~~~~~~~             ^
   drivers/media/platform/marvell/mcam-core.c:1365:8: error: too few arguments to function call, expected 4, have 3
    1365 |         ret = sensor_call(cam, pad, set_fmt, &pad_state, &format);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/marvell/mcam-core.c:96:2: note: expanded from macro 'sensor_call'
      96 |         v4l2_subdev_call(cam->sensor, o, f, ##args)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1909:20: note: expanded from macro 'v4l2_subdev_call'
    1908 |                         __result = v4l2_subdev_call_wrappers.o->f(      \
         |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1909 |                                                         __sd, ##args);  \
         |                                                                     ^
   drivers/media/platform/marvell/mcam-core.c:1365:8: error: too few arguments to function call, expected 4, have 3
    1365 |         ret = sensor_call(cam, pad, set_fmt, &pad_state, &format);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/marvell/mcam-core.c:96:2: note: expanded from macro 'sensor_call'
      96 |         v4l2_subdev_call(cam->sensor, o, f, ##args)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1911:43: note: expanded from macro 'v4l2_subdev_call'
    1911 |                         __result = __sd->ops->o->f(__sd, ##args);       \
         |                                    ~~~~~~~~~~~~~~~             ^
   4 errors generated.


vim +106 drivers/media/pci/saa7134/saa7134-empress.c

^1da177e4c3f41 drivers/media/video/saa7134/saa7134-empress.c Linus Torvalds        2005-04-16   96  
78b526a43561d7 drivers/media/video/saa7134/saa7134-empress.c Hans Verkuil          2008-05-28   97  static int empress_g_fmt_vid_cap(struct file *file, void *priv,
2c10e8a8985e41 drivers/media/video/saa7134/saa7134-empress.c Mauro Carvalho Chehab 2007-12-11   98  				struct v4l2_format *f)
^1da177e4c3f41 drivers/media/video/saa7134/saa7134-empress.c Linus Torvalds        2005-04-16   99  {
b9f63b25954495 drivers/media/pci/saa7134/saa7134-empress.c   Hans Verkuil          2013-12-14  100  	struct saa7134_dev *dev = video_drvdata(file);
da298c6d98d531 drivers/media/pci/saa7134/saa7134-empress.c   Hans Verkuil          2015-04-09  101  	struct v4l2_subdev_format fmt = {
da298c6d98d531 drivers/media/pci/saa7134/saa7134-empress.c   Hans Verkuil          2015-04-09  102  		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
da298c6d98d531 drivers/media/pci/saa7134/saa7134-empress.c   Hans Verkuil          2015-04-09  103  	};
da298c6d98d531 drivers/media/pci/saa7134/saa7134-empress.c   Hans Verkuil          2015-04-09  104  	struct v4l2_mbus_framefmt *mbus_fmt = &fmt.format;
^1da177e4c3f41 drivers/media/video/saa7134/saa7134-empress.c Linus Torvalds        2005-04-16  105  
da298c6d98d531 drivers/media/pci/saa7134/saa7134-empress.c   Hans Verkuil          2015-04-09 @106  	saa_call_all(dev, pad, get_fmt, NULL, &fmt);
^1da177e4c3f41 drivers/media/video/saa7134/saa7134-empress.c Linus Torvalds        2005-04-16  107  
da298c6d98d531 drivers/media/pci/saa7134/saa7134-empress.c   Hans Verkuil          2015-04-09  108  	v4l2_fill_pix_format(&f->fmt.pix, mbus_fmt);
^1da177e4c3f41 drivers/media/video/saa7134/saa7134-empress.c Linus Torvalds        2005-04-16  109  	f->fmt.pix.pixelformat  = V4L2_PIX_FMT_MPEG;
^1da177e4c3f41 drivers/media/video/saa7134/saa7134-empress.c Linus Torvalds        2005-04-16  110  	f->fmt.pix.sizeimage    = TS_PACKET_SIZE * dev->ts.nr_packets;
cabc6508984f2d drivers/media/pci/saa7134/saa7134-empress.c   Hans Verkuil          2013-06-01  111  	f->fmt.pix.bytesperline = 0;
2c10e8a8985e41 drivers/media/video/saa7134/saa7134-empress.c Mauro Carvalho Chehab 2007-12-11  112  
^1da177e4c3f41 drivers/media/video/saa7134/saa7134-empress.c Linus Torvalds        2005-04-16  113  	return 0;
^1da177e4c3f41 drivers/media/video/saa7134/saa7134-empress.c Linus Torvalds        2005-04-16  114  }
^1da177e4c3f41 drivers/media/video/saa7134/saa7134-empress.c Linus Torvalds        2005-04-16  115  

:::::: The code at line 106 was first introduced by commit
:::::: da298c6d98d531de778ba8dd6657b1093ef855d0 [media] v4l2: replace video op g_mbus_fmt by pad op get_fmt

:::::: TO: Hans Verkuil <hans.verkuil@cisco.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@osg.samsung.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

