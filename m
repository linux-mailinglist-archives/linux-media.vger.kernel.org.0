Return-Path: <linux-media+bounces-61180-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MK0fHJpmAmqhsQEAu9opvQ
	(envelope-from <linux-media+bounces-61180-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 01:30:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF40B5174B6
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 01:30:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C97563022FA6
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 23:30:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36DFF2FF66B;
	Mon, 11 May 2026 23:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hszuLZ6K"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE55734216C;
	Mon, 11 May 2026 23:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778542227; cv=none; b=Wy1Jmw/BkynPkhmXXqbTzrUwrHdqNb7T1gTDQrag6mlWfnwu/eE8jRtiGqWxJ0ZHQew38EbRcI5z3ePUVzVkAIa3K0RGHueOkHPwwxovFetxwDJGrEmo2YSgfY/4h5YF3rnuFquifYnp93T/dLuA+p2k0szRCzUFr+RqAbVrHfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778542227; c=relaxed/simple;
	bh=GvAJBnrtFKgXQtZB4E7zOI5jH5LH1X1JwsiYoQttBQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fDzsF4I16HCoMX0bs+9GrDVQ9G5v3BTaW3cp5feze6KQYLIYuUJeDwwRKUhjs3aq6ygoMSMfBCu1ZNQBViWDee6v/lXrbwadWcprnqbX5Q4KxW579MZGopRPl7ie6PGFPsTQA7KeNqEpK5EWDmrUUF0kZ79xpDljKg5P4BweXfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hszuLZ6K; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778542225; x=1810078225;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GvAJBnrtFKgXQtZB4E7zOI5jH5LH1X1JwsiYoQttBQM=;
  b=hszuLZ6Kyws+ZhktVCx3niwigij15Cv1QPXZhQ1NmHxEVd5xMP6SRmt/
   ledVMwc7tJG1agFXvjxcln8CJ4RQpc1OjLDOrUA1cjz59qRfCFASIDhY6
   PQdF4tbDENTicTZyhkNL+ZD/13piGcEilYU2gA8osfVo/jio+b/4Expj6
   2JM/yvs6K1g6ddaS8Oioa3fbGkAOjPxxmUd4+JkOkCL4AGOWd6lHO6N9E
   2/uv3CIJ3a7FcH7kSdkhF5JWPI5UuKhX6sFscpIN2m3dPMZP/pczfgbNz
   VWHFY1cDgyaZr9gIlc0FE52/ioqs5sr8nS3PN+Kv1QVTthTMDXqmeVmL8
   A==;
X-CSE-ConnectionGUID: syuYTtp1Teem5TQX7fzzNQ==
X-CSE-MsgGUID: w8zdkc7WRJ+xfgYja78G7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="90826306"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="90826306"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 16:30:24 -0700
X-CSE-ConnectionGUID: jCl0O/RfSIShfmrfe1B/RA==
X-CSE-MsgGUID: gKEJ9YQFRpCXzXlco7TVVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="241947502"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 May 2026 16:30:21 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMa4n-000000001HB-1zox;
	Mon, 11 May 2026 23:30:17 +0000
Date: Tue, 12 May 2026 07:30:01 +0800
From: kernel test robot <lkp@intel.com>
To: Everton Colombo <e.rcolombo2@gmail.com>, andy@kernel.org,
	hansg@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
	koike@igalia.com, ~lkcamp/patches@lists.sr.ht,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Everton Colombo <e.rcolombo2@gmail.com>
Subject: Re: [PATCH v2] media: atomisp: remove returns from void functions
Message-ID: <202605120751.1V5xT63P-lkp@intel.com>
References: <20260506173028.24417-1-e.rcolombo2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260506173028.24417-1-e.rcolombo2@gmail.com>
X-Rspamd-Queue-Id: AF40B5174B6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61180-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.linux.dev,kernel.org,linux.intel.com,linuxfoundation.org,igalia.com,lists.sr.ht,vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:mid,intel.com:dkim,01.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi Everton,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]
[also build test ERROR on staging/staging-next staging/staging-linus linus/master v7.1-rc3 next-20260508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Everton-Colombo/media-atomisp-remove-returns-from-void-functions/20260510-154432
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20260506173028.24417-1-e.rcolombo2%40gmail.com
patch subject: [PATCH v2] media: atomisp: remove returns from void functions
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20260512/202605120751.1V5xT63P-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260512/202605120751.1V5xT63P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605120751.1V5xT63P-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:443:1: error: function definition is not allowed here
     443 | {
         | ^
   drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:808:1: error: function definition is not allowed here
     808 | {
         | ^
   drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:825:1: error: function definition is not allowed here
     825 | {
         | ^
   drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:840:1: error: function definition is not allowed here
     840 | {
         | ^
   drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:854:1: error: function definition is not allowed here
     854 | {
         | ^
   drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:879:1: error: function definition is not allowed here
     879 | {
         | ^
   drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:947:1: error: function definition is not allowed here
     947 | {
         | ^
   drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:977:1: error: function definition is not allowed here
     977 | {
         | ^
   drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:1012:1: error: function definition is not allowed here
    1012 | {
         | ^
   drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:1026:1: error: function definition is not allowed here
    1026 | {
         | ^
   drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:1041:1: error: function definition is not allowed here
    1041 | {
         | ^
   drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:1050:1: error: function definition is not allowed here
    1050 | {
         | ^
   drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:1069:1: error: function definition is not allowed here
    1069 | {
         | ^
   drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:1105:1: error: function definition is not allowed here
    1105 | {
         | ^
   drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:1115:1: error: function definition is not allowed here
    1115 | {
         | ^
   drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:1160:1: error: function definition is not allowed here
    1160 | {
         | ^
   drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:1370:1: error: function definition is not allowed here
    1370 | {
         | ^
   drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:1401:1: error: function definition is not allowed here
    1401 | {
         | ^
   drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:1413:1: error: function definition is not allowed here
    1413 | {
         | ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.
--
>> drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c:114:1: error: function definition is not allowed here
     114 | {
         | ^
   drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c:124:1: error: function definition is not allowed here
     124 | {
         | ^
   drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c:133:1: error: function definition is not allowed here
     133 | {
         | ^
   drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c:141:1: error: function definition is not allowed here
     141 | {
         | ^
   drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c:150:1: error: function definition is not allowed here
     150 | {
         | ^
   drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c:161:1: error: function definition is not allowed here
     161 | {
         | ^
   drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c:175:1: error: function definition is not allowed here
     175 | {
         | ^
   drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c:185:1: error: function definition is not allowed here
     185 | {
         | ^
   drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c:192:1: error: function definition is not allowed here
     192 | {
         | ^
   drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c:209:1: error: function definition is not allowed here
     209 | {
         | ^
   drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c:296:1: error: function definition is not allowed here
     296 | {
         | ^
   drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c:343:1: error: function definition is not allowed here
     343 | {
         | ^
   drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c:370:1: error: function definition is not allowed here
     370 | {
         | ^
   drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c:392:1: error: function definition is not allowed here
     392 | {
         | ^
   drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c:403:1: error: function definition is not allowed here
     403 | {
         | ^
   drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c:425:1: error: function definition is not allowed here
     425 | {
         | ^
   drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c:449:1: error: function definition is not allowed here
     449 | {
         | ^
   drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c:472:1: error: function definition is not allowed here
     472 | {
         | ^
   drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c:490:1: error: function definition is not allowed here
     490 | {
         | ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.
--
>> drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c:638:1: error: function definition is not allowed here
     638 | {
         | ^
>> drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c:646:2: error: expected '}'
     646 | }
         |  ^
   drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c:543:1: note: to match this '{'
     543 | {
         | ^
   2 errors generated.


vim +443 drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c

ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  387  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  388  void ia_css_debug_binary_print(const struct ia_css_binary *bi)
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  389  {
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  390  	unsigned int i;
bdfe0beb95eebc drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  391  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  392  	debug_binary_info_print(bi->info);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  393  	ia_css_debug_dtrace(2,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  394  			    "input:  %dx%d, format = %d, padded width = %d\n",
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  395  			    bi->in_frame_info.res.width,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  396  			    bi->in_frame_info.res.height,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  397  			    bi->in_frame_info.format,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  398  			    bi->in_frame_info.padded_width);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  399  	ia_css_debug_dtrace(2,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  400  			    "internal :%dx%d, format = %d, padded width = %d\n",
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  401  			    bi->internal_frame_info.res.width,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  402  			    bi->internal_frame_info.res.height,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  403  			    bi->internal_frame_info.format,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  404  			    bi->internal_frame_info.padded_width);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  405  	for (i = 0; i < IA_CSS_BINARY_MAX_OUTPUT_PORTS; i++) {
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  406  		if (bi->out_frame_info[i].res.width != 0) {
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  407  			ia_css_debug_dtrace(2,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  408  					    "out%d:    %dx%d, format = %d, padded width = %d\n",
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  409  					    i,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  410  					    bi->out_frame_info[i].res.width,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  411  					    bi->out_frame_info[i].res.height,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  412  					    bi->out_frame_info[i].format,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  413  					    bi->out_frame_info[i].padded_width);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  414  		}
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  415  	}
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  416  	ia_css_debug_dtrace(2,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  417  			    "vf out: %dx%d, format = %d, padded width = %d\n",
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  418  			    bi->vf_frame_info.res.width,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  419  			    bi->vf_frame_info.res.height,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  420  			    bi->vf_frame_info.format,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  421  			    bi->vf_frame_info.padded_width);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  422  	ia_css_debug_dtrace(2, "online = %d\n", bi->online);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  423  	ia_css_debug_dtrace(2, "input_buf_vectors = %d\n",
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  424  			    bi->input_buf_vectors);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  425  	ia_css_debug_dtrace(2, "deci_factor_log2 = %d\n", bi->deci_factor_log2);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  426  	ia_css_debug_dtrace(2, "vf_downscale_log2 = %d\n",
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  427  			    bi->vf_downscale_log2);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  428  	ia_css_debug_dtrace(2, "dis_deci_factor_log2 = %d\n",
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  429  			    bi->dis.deci_factor_log2);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  430  	ia_css_debug_dtrace(2, "dis hor coef num = %d\n",
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  431  			    bi->dis.coef.pad.width);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  432  	ia_css_debug_dtrace(2, "dis ver coef num = %d\n",
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  433  			    bi->dis.coef.pad.height);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  434  	ia_css_debug_dtrace(2, "dis hor proj num = %d\n",
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  435  			    bi->dis.proj.pad.height);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  436  	ia_css_debug_dtrace(2, "sctbl_width_per_color = %d\n",
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  437  			    bi->sctbl_width_per_color);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  438  	ia_css_debug_dtrace(2, "s3atbl_width = %d\n", bi->s3atbl_width);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  439  	ia_css_debug_dtrace(2, "s3atbl_height = %d\n", bi->s3atbl_height);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  440  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  441  void ia_css_debug_frame_print(const struct ia_css_frame *frame,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  442  			      const char *descr)
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19 @443  {
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  444  	char *data = NULL;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  445  
bdfe0beb95eebc drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  446  	assert(frame);
bdfe0beb95eebc drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  447  	assert(descr);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  448  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  449  	data = (char *)HOST_ADDRESS(frame->data);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  450  	ia_css_debug_dtrace(2, "frame %s (%p):\n", descr, frame);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  451  	ia_css_debug_dtrace(2, "  resolution    = %dx%d\n",
9a29f5fc340406 drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c                  Hans de Goede         2022-10-14  452  			    frame->frame_info.res.width, frame->frame_info.res.height);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  453  	ia_css_debug_dtrace(2, "  padded width  = %d\n",
9a29f5fc340406 drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c                  Hans de Goede         2022-10-14  454  			    frame->frame_info.padded_width);
9a29f5fc340406 drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c                  Hans de Goede         2022-10-14  455  	ia_css_debug_dtrace(2, "  format        = %d\n", frame->frame_info.format);
9a29f5fc340406 drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c                  Hans de Goede         2022-10-14  456  	switch (frame->frame_info.format) {
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  457  	case IA_CSS_FRAME_FORMAT_NV12:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  458  	case IA_CSS_FRAME_FORMAT_NV16:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  459  	case IA_CSS_FRAME_FORMAT_NV21:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  460  	case IA_CSS_FRAME_FORMAT_NV61:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  461  		ia_css_debug_dtrace(2, "  Y = %p\n",
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  462  				    data + frame->planes.nv.y.offset);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  463  		ia_css_debug_dtrace(2, "  UV = %p\n",
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  464  				    data + frame->planes.nv.uv.offset);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  465  		break;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  466  	case IA_CSS_FRAME_FORMAT_YUYV:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  467  	case IA_CSS_FRAME_FORMAT_UYVY:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  468  	case IA_CSS_FRAME_FORMAT_CSI_MIPI_YUV420_8:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  469  	case IA_CSS_FRAME_FORMAT_CSI_MIPI_LEGACY_YUV420_8:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  470  	case IA_CSS_FRAME_FORMAT_YUV_LINE:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  471  		ia_css_debug_dtrace(2, "  YUYV = %p\n",
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  472  				    data + frame->planes.yuyv.offset);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  473  		break;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  474  	case IA_CSS_FRAME_FORMAT_YUV420:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  475  	case IA_CSS_FRAME_FORMAT_YUV422:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  476  	case IA_CSS_FRAME_FORMAT_YUV444:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  477  	case IA_CSS_FRAME_FORMAT_YV12:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  478  	case IA_CSS_FRAME_FORMAT_YV16:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  479  	case IA_CSS_FRAME_FORMAT_YUV420_16:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  480  	case IA_CSS_FRAME_FORMAT_YUV422_16:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  481  		ia_css_debug_dtrace(2, "  Y = %p\n",
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  482  				    data + frame->planes.yuv.y.offset);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  483  		ia_css_debug_dtrace(2, "  U = %p\n",
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  484  				    data + frame->planes.yuv.u.offset);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  485  		ia_css_debug_dtrace(2, "  V = %p\n",
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  486  				    data + frame->planes.yuv.v.offset);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  487  		break;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  488  	case IA_CSS_FRAME_FORMAT_RAW_PACKED:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  489  		ia_css_debug_dtrace(2, "  RAW PACKED = %p\n",
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  490  				    data + frame->planes.raw.offset);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  491  		break;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  492  	case IA_CSS_FRAME_FORMAT_RAW:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  493  		ia_css_debug_dtrace(2, "  RAW = %p\n",
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  494  				    data + frame->planes.raw.offset);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  495  		break;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  496  	case IA_CSS_FRAME_FORMAT_RGBA888:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  497  	case IA_CSS_FRAME_FORMAT_RGB565:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  498  		ia_css_debug_dtrace(2, "  RGB = %p\n",
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  499  				    data + frame->planes.rgb.offset);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  500  		break;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  501  	case IA_CSS_FRAME_FORMAT_QPLANE6:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  502  		ia_css_debug_dtrace(2, "  R    = %p\n",
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  503  				    data + frame->planes.plane6.r.offset);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  504  		ia_css_debug_dtrace(2, "  RatB = %p\n",
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  505  				    data + frame->planes.plane6.r_at_b.offset);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  506  		ia_css_debug_dtrace(2, "  Gr   = %p\n",
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  507  				    data + frame->planes.plane6.gr.offset);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  508  		ia_css_debug_dtrace(2, "  Gb   = %p\n",
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  509  				    data + frame->planes.plane6.gb.offset);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  510  		ia_css_debug_dtrace(2, "  B    = %p\n",
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  511  				    data + frame->planes.plane6.b.offset);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  512  		ia_css_debug_dtrace(2, "  BatR = %p\n",
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  513  				    data + frame->planes.plane6.b_at_r.offset);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  514  		break;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  515  	case IA_CSS_FRAME_FORMAT_BINARY_8:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  516  		ia_css_debug_dtrace(2, "  Binary data = %p\n",
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  517  				    data + frame->planes.binary.data.offset);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  518  		break;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  519  	default:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  520  		ia_css_debug_dtrace(2, "  unknown frame type\n");
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  521  		break;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  522  	}
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  523  }
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  524  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

