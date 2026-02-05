Return-Path: <linux-media+bounces-52269-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJbYCH/bhGkV6AMAu9opvQ
	(envelope-from <linux-media+bounces-52269-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Feb 2026 19:03:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD18F649B
	for <lists+linux-media@lfdr.de>; Thu, 05 Feb 2026 19:03:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 425E330069A9
	for <lists+linux-media@lfdr.de>; Thu,  5 Feb 2026 18:03:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1653E306B1B;
	Thu,  5 Feb 2026 18:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YTaYSFCJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B411305E01
	for <linux-media@vger.kernel.org>; Thu,  5 Feb 2026 18:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770314610; cv=none; b=R2i563t88z6hQaZt4xZQduH9M/619WzszKDLgMnFbDOS087MEhQzW4u1Gw3xif4AKaRnxhcEDJ9fapY9MLt097Quqp4doV2emJW3k9z3G0pM8osvWrAN7svsLpOZaB2MmPgPO1msDHSsk5MQyoSIADA9CKhARc+Q/GdfycxJu4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770314610; c=relaxed/simple;
	bh=5NtoODkKCCVjOPYzWrQzbJ6AYgdGm0luLnL1NkDQaMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fk/BInw9SlkGum9WQrAMHwmQen8MLLpnbZowAESofbTLrEsefW66KsQIGYuFKvRByBMJaugXLMyrn9x3m045IA5oKj77E4cSahBlgFy0EdUPuI+FFpEwdlWBWrttCz2+P1A1dAL3v3r9q/AoW3Ufok4zKl/N4wQWwProezvBBDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YTaYSFCJ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770314610; x=1801850610;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5NtoODkKCCVjOPYzWrQzbJ6AYgdGm0luLnL1NkDQaMk=;
  b=YTaYSFCJdGHqZdee0jwVmnpNAOWalQJ3SEr66hTBhkv8sMz34ROtdSSR
   CJp75LDJnTysd2j09hf+RagGArJRPA8M1//Ar++07PtqyglyUaVfzqaM9
   mHB7QLlT3HKE7CySJr90KGQ9vQqCkpd+5k6C5PUHyq2b0iHRALA9Mfpia
   9pH8qs8h+1njTyZD2slHpyLEV6hHKFF5xRWU0rDpQ+DfDcURnlto/Ebgf
   UIzfIU3CpT/SrQ3SInxmarzQLlxl7TxHnk5IfhypT3yzR5ApSNGL5mzyB
   Q30j59zuGTwToD6r33qSflduzMWFxFt6fRqc/xMcjws3+0VgAOu5RuQym
   Q==;
X-CSE-ConnectionGUID: 3FB/V/egRjqvqmDo344Dhg==
X-CSE-MsgGUID: KcgiGMZMTdmigNnAA4STNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="71412707"
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; 
   d="scan'208";a="71412707"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 10:03:30 -0800
X-CSE-ConnectionGUID: juxLIeDVQvqxqoQDCy6p1Q==
X-CSE-MsgGUID: J8WbRXcuQK20IRwrSG2eXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; 
   d="scan'208";a="209940800"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 05 Feb 2026 10:03:27 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vo3hN-000000004DJ-1SwO;
	Thu, 05 Feb 2026 18:03:25 +0000
Date: Thu, 5 Feb 2026 19:03:20 +0100
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sean Young <sean@mess.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Hans Verkuil <hverkuil@kernel.org>
Subject: Re: [PATCHv7 1/3] docs: media: update maintainer-entry-profile for
 multi-committers
Message-ID: <202602051948.uPjQl80E-lkp@intel.com>
References: <4478ae7ad952117a76b648ee2db7f8f92775ddf7.1769511207.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4478ae7ad952117a76b648ee2db7f8f92775ddf7.1769511207.git.hverkuil+cisco@kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_FROM(0.00)[bounces-52269-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[git-scm.com:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,01.org:url,intel.com:email,intel.com:dkim,intel.com:mid]
X-Rspamd-Queue-Id: 5CD18F649B
X-Rspamd-Action: no action

Hi Hans,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lwn/docs-next]
[also build test WARNING on linuxtv-media-pending/master media-tree/master linus/master v6.19-rc8 next-20260205]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hans-Verkuil/docs-media-update-maintainer-entry-profile-for-multi-committers/20260205-024420
base:   git://git.lwn.net/linux.git docs-next
patch link:    https://lore.kernel.org/r/4478ae7ad952117a76b648ee2db7f8f92775ddf7.1769511207.git.hverkuil%2Bcisco%40kernel.org
patch subject: [PATCHv7 1/3] docs: media: update maintainer-entry-profile for multi-committers
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260205/202602051948.uPjQl80E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602051948.uPjQl80E-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/userspace-api/landlock:453: ./include/uapi/linux/landlock.h:45: ERROR: Unknown target name: "network flags". [docutils]
   Documentation/userspace-api/landlock:453: ./include/uapi/linux/landlock.h:50: ERROR: Unknown target name: "scope flags". [docutils]
   Documentation/userspace-api/landlock:453: ./include/uapi/linux/landlock.h:24: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:462: ./include/uapi/linux/landlock.h:153: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:462: ./include/uapi/linux/landlock.h:176: ERROR: Unknown target name: "network flags". [docutils]
>> Documentation/driver-api/media/maintainer-entry-profile.rst:340: WARNING: undefined label: 'kernel_org_trust_repository' [ref.ref]


vim +/kernel_org_trust_repository +340 Documentation/driver-api/media/maintainer-entry-profile.rst

   339	
 > 340	The authenticity of developers submitting pull requests and merge requests
   341	shall be validated by using PGP signing at some moment.
   342	See: :ref:`kernel_org_trust_repository`.
   343	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

