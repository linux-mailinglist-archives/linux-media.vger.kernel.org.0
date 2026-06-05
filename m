Return-Path: <linux-media+bounces-63862-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IkEGGaFfImpgVgEAu9opvQ
	(envelope-from <linux-media+bounces-63862-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 07:33:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3276452D7
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 07:33:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=ezPh6ZdQ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63862-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63862-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C18C3300CC00
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 05:33:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED44E32B125;
	Fri,  5 Jun 2026 05:33:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906F3311C2C
	for <linux-media@vger.kernel.org>; Fri,  5 Jun 2026 05:33:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780637593; cv=none; b=NI/qmKKukWDzW5wLeeACjfD5d+NXi8BtxYd8+NoYUE86FBTDXmK3/Oq/leUU3pWF6MwtL0yMERAoMGf3VUy66Hm+H15elNx8kHzduT/YeWPL37TdZLEjCTGXdPUop6y6EeaBKvxO+sieCRHv9spiSKjUZSRxo2QDGOo1OPlT1eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780637593; c=relaxed/simple;
	bh=sO54mWHlnpCQgD136qmtopLdsghhIszMhGkC7/GBhwE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=q60Tyb50w+/Q/3a4jsYvr49lq4bk8IprhtYhoqQqxzSBApkpOiuBtCqd4klNELIp4R6A4T4t7DdKN5c0MpHO8a7RWWjs6nlw2B9dMF7guumSd7ikAs16Eo72PjlHfo+WC7FMwNrhusxik4H0fb3sziFITRX0L18vLsi958LU8Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ezPh6ZdQ; arc=none smtp.client-ip=192.198.163.16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780637591; x=1812173591;
  h=date:from:to:cc:subject:message-id;
  bh=sO54mWHlnpCQgD136qmtopLdsghhIszMhGkC7/GBhwE=;
  b=ezPh6ZdQgKieQdP5bucqFxFHJuV5t0e9LDsw/8u4ueO2uCvYx2/uEYNt
   9VrKZSc0GaOGZEc42tSEov2wcXT4FfjS59YFMtf8JQtPTgyVGcUVK1+j4
   oAwDTNep3IbFoWWXwoFtXnsYBmR+7JMyBO2q+wVcTI5BPDOL9dCXv8/vo
   LE43AVbTMsOY1qiBUs9ycuXpruxRt521dp1Xi8eMy1mklBFmT+OYC1ia3
   af9KK0R+qEpi9js/DHBWyi6MbSf5GdYI6PKrMUxrGHx5+F00+T6e9+hqH
   LI3kKH9F5/qODMmFaKVsJvR6COnTUdf9LZ0cgg1eVk7bBFQWCd1r6TGkI
   w==;
X-CSE-ConnectionGUID: ABzt8uC3StOXMY+w7nne8A==
X-CSE-MsgGUID: krkCZergSFeApPR8H0TTHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="69004705"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="69004705"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 22:33:11 -0700
X-CSE-ConnectionGUID: HSsG5ReBRMqt5zaIncpEpQ==
X-CSE-MsgGUID: y5u+oSraSe6d2CpukCuDCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="238398074"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 04 Jun 2026 22:33:09 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVNB5-000000002UH-2jS1;
	Fri, 05 Jun 2026 05:33:07 +0000
Date: Fri, 05 Jun 2026 07:32:45 +0200
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: [sailus-media-tree:partial-reg 7/9] htmldocs:
 include/uapi/linux/media.h:399: WARNING: Invalid xref:
 std:ref:`media_ioc_unsubscribe_event`. Possible alternatives:
Message-ID: <202606050733.iEIhymOp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63862-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:oe-kbuild-all@lists.linux.dev,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,intel.com:mid,intel.com:dkim,intel.com:from_mime,intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,01.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2D3276452D7

tree:   git://linuxtv.org/sailus/media_tree.git partial-reg
head:   b7d01dab7d47849d483b459ff2abf50497b52149
commit: 4d67653aa3bd15cbaf60bbe6f4d0dce10d0dccbc [7/9] media: mc: Add MEDIA_IOC_DQEVENT
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260605/202606050733.iEIhymOp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606050733.iEIhymOp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   std:label:`vidioc_subscribe_event` (from userspace-api/media/v4l/vidioc-subscribe-event)
   c:macro:`V4L.VIDIOC_UNSUBSCRIBE_EVENT` (from userspace-api/media/v4l/vidioc-subscribe-event)
   std:label:`vidioc_unsubscribe_event` (from userspace-api/media/v4l/vidioc-subscribe-event)
   c:function:`v4l2_ctrl_subscribe_event` (from driver-api/media/v4l2-controls) [ref.missing]
   include/uapi/linux/media.h:398: WARNING: undefined label: 'media_ioc_subscribe_event' [ref.ref]
>> include/uapi/linux/media.h:399: WARNING: Invalid xref: std:ref:`media_ioc_unsubscribe_event`. Possible alternatives:
   c:macro:`V4L.VIDIOC_UNSUBSCRIBE_EVENT` (from userspace-api/media/v4l/vidioc-subscribe-event)
   std:label:`vidioc_unsubscribe_event` (from userspace-api/media/v4l/vidioc-subscribe-event)
   c:macro:`V4L.VIDIOC_SUBSCRIBE_EVENT` (from userspace-api/media/v4l/vidioc-subscribe-event)
   std:label:`vidioc_subscribe_event` (from userspace-api/media/v4l/vidioc-subscribe-event)
   c:function:`v4l2_ctrl_subscribe_event` (from driver-api/media/v4l2-controls) [ref.missing]
>> include/uapi/linux/media.h:399: WARNING: undefined label: 'media_ioc_unsubscribe_event' [ref.ref]
>> include/uapi/linux/media.h:369: WARNING: Invalid xref: std:ref:`media-event-all`. Possible alternatives:
   std:label:`media-ent-f-lens` (from userspace-api/media/mediactl/media-types)
   c:macro:`media_entity_call` (from driver-api/media/mc-core)
   std:label:`media-request-api` (from userspace-api/media/mediactl/request-api) [ref.missing]
>> include/uapi/linux/media.h:369: WARNING: undefined label: 'media-event-all' [ref.ref]
>> include/uapi/linux/media.h:371: WARNING: Invalid xref: c:type:`MC.media_event`. Possible alternatives:
   c:function:`media_device_init` (from driver-api/media/mc-core)
   c:struct:`media_entity` (from driver-api/media/mc-core)
   c:struct:`media_device` (from driver-api/media/mc-core) [ref.missing]
>> include/uapi/linux/media.h:383: WARNING: Invalid xref: c:type:`MC.media_event_subscription`. Possible alternatives:
   c:type:`V4L.v4l2_event_subscription` (from userspace-api/media/v4l/vidioc-subscribe-event)
   c:struct:`tipc_subscription` (from networking/tipc)
   c:functionParam:`mmu_notifier_register.subscription` (from core-api/mm-api)
   c:functionParam:`mmu_notifier_put.subscription` (from core-api/mm-api) [ref.missing]


vim +399 include/uapi/linux/media.h

   368	
 > 369	#define MEDIA_EVENT_ALL		0
   370	
 > 371	struct media_event {
   372		__u32 type;
   373		union {
   374			__u8 data[64];
   375		} u;
   376		__u32 reserved[8];
   377		__u32 pending;
   378		__u32 sequence;
   379		__u64 timestamp;
   380		__u32 id;
   381	} __attribute__((packed));
   382	
 > 383	struct media_event_subscription {
   384		__u32 type;
   385		__u32 id;
   386		__u32 flags;
   387		__u32 reserved[5];
   388	} __attribute__((packed));
   389	
   390	/* ioctls */
   391	
   392	#define MEDIA_IOC_DEVICE_INFO	_IOWR('|', 0x00, struct media_device_info)
   393	#define MEDIA_IOC_ENUM_ENTITIES	_IOWR('|', 0x01, struct media_entity_desc)
   394	#define MEDIA_IOC_ENUM_LINKS	_IOWR('|', 0x02, struct media_links_enum)
   395	#define MEDIA_IOC_SETUP_LINK	_IOWR('|', 0x03, struct media_link_desc)
   396	#define MEDIA_IOC_G_TOPOLOGY	_IOWR('|', 0x04, struct media_v2_topology)
   397	#define MEDIA_IOC_REQUEST_ALLOC	_IOR ('|', 0x05, int)
   398	#define MEDIA_IOC_SUBSCRIBE_EVENT _IOWR ('|', 0x06, struct media_event_subscription)
 > 399	#define MEDIA_IOC_UNSUBSCRIBE_EVENT _IOWR ('|', 0x07, struct media_event_subscription)
   400	#define MEDIA_IOC_DQEVENT	_IOWR('|', 0x08, struct media_event)
   401	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

