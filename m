Return-Path: <linux-media+bounces-63896-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iQBeIcfCImpXdQEAu9opvQ
	(envelope-from <linux-media+bounces-63896-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 14:36:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0061C64837E
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 14:36:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b="D/0S3EMg";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63896-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63896-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A47663073D35
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 12:33:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 074B0389460;
	Fri,  5 Jun 2026 12:33:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E4938F931
	for <linux-media@vger.kernel.org>; Fri,  5 Jun 2026 12:33:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780662824; cv=none; b=kVLURzBKwtLAY4k348olJsSlGsOipgL8DIcMrdOBHHD3M/wD+c4j6m6/txH6cQlzm6FUfHl34L8UrENLESfVP39C7EZ1P+cxpReWfTMF5cUaqzrswfniTS4J3e6AFgj5CYx9Brvf3FLgNFG3bFOzmjRgf9NIowMVI9YT3NW5iZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780662824; c=relaxed/simple;
	bh=MUJoif134ARHegV9T8Yl2vrZgXr8aFbYLKqhmDgVYak=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cHNcFtHwwr5EGTIDghqnJIFhbF//Tgbq5O67Um4kMPdnxyfaQJutpe1IiK/j/K1NPVNDMMrsU66Sjmid0SppG8zT5KB/z7D2UsncktL8Mz6H2H3HtxA1NBx3U79kwZTrK6pJxEq7XgkvG6gA7PMlKwrIOJUQ78+FZ+mRe4lLRuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D/0S3EMg; arc=none smtp.client-ip=192.198.163.13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780662822; x=1812198822;
  h=date:from:to:cc:subject:message-id;
  bh=MUJoif134ARHegV9T8Yl2vrZgXr8aFbYLKqhmDgVYak=;
  b=D/0S3EMgTzufLwIA7vlJ3GMQ1K1K1OldwzI2w8B31HPzEQE7crDRReEm
   N4tpoQ8t1ThcGNSx9cbzfuknxq9ZUwym/gbNaoPf9mC4ilpqOUWNjKcjV
   QTbJ07WMlgIzww2b4VgVPc7V01iVvGIP7M1MKUZaLpnyy3aX1lAMprY6N
   i0LFfieQOXrC+vKC9pffPfQD+fjNyGJzW2nykmywpk9g3qhwaPxNJYukw
   QmRw6AESSeCQ5uIvTXjk/dpgGhgxFZY+2MCG1cr6r9Nv3KMc6290/Tv09
   7d7SKE5y5CH6ara9VbXhr37YTF4RXwzQvsLvsUBWS1jGHyAK4hiOdA4Nd
   Q==;
X-CSE-ConnectionGUID: Maz3MEbGSCC3aSYpelX5rg==
X-CSE-MsgGUID: YoKWhq1MTXmPqEnncm65Bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="84075133"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="84075133"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 05:33:42 -0700
X-CSE-ConnectionGUID: 4sSKngXnTfWrArDBw2unwQ==
X-CSE-MsgGUID: InVIJakoQuyjWv32BD+k/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="243740653"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 05 Jun 2026 05:33:40 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVTk1-00000000FyU-2Ls5;
	Fri, 05 Jun 2026 12:33:37 +0000
Date: Fri, 05 Jun 2026 20:32:54 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: [sailus-media-tree:partial-reg 7/9]
 drivers/media/mc/mc-device.c:26:10: fatal error: media/media-event.h: No such
 file or directory
Message-ID: <202606052044.b4pvupEW-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63896-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:oe-kbuild-all@lists.linux.dev,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,intel.com:mid,intel.com:dkim,intel.com:from_mime,intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0061C64837E

tree:   git://linuxtv.org/sailus/media_tree.git partial-reg
head:   b7d01dab7d47849d483b459ff2abf50497b52149
commit: 4d67653aa3bd15cbaf60bbe6f4d0dce10d0dccbc [7/9] media: mc: Add MEDIA_IOC_DQEVENT
config: arm-randconfig-r073-20260605 (https://download.01.org/0day-ci/archive/20260605/202606052044.b4pvupEW-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260605/202606052044.b4pvupEW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606052044.b4pvupEW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/mc/mc-device.c:26:10: fatal error: media/media-event.h: No such file or directory
    #include <media/media-event.h>
             ^~~~~~~~~~~~~~~~~~~~~
   compilation terminated.
--
>> drivers/media/mc/mc-event.c:17:10: fatal error: media/media-event.h: No such file or directory
    #include <media/media-event.h>
             ^~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +26 drivers/media/mc/mc-device.c

    22	
    23	#include <media/media-device.h>
    24	#include <media/media-devnode.h>
    25	#include <media/media-entity.h>
  > 26	#include <media/media-event.h>
    27	#include <media/media-fh.h>
    28	#include <media/media-request.h>
    29	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

