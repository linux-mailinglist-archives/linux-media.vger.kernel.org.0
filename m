Return-Path: <linux-media+bounces-37932-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5C6B083A7
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 06:03:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8288E565007
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 04:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3429F1FAC23;
	Thu, 17 Jul 2025 04:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y4LMlswI"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DBC5464F;
	Thu, 17 Jul 2025 04:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752725006; cv=none; b=t9vB0QT0OMPhJU5QikRUHmxLOX1Er6aoS6gPtRh7f/SGl9wpAW61ECZH89OJsDNPJ0yLNwHnE4145nvQ7VcvWssdo+BucpwmAH2iMEfJZ05eVe4LkOMyzPgERRr+n3zL60zBhDZq1d9ex7vZP1AeKVzNixrgwWMn2gNbxyIr5wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752725006; c=relaxed/simple;
	bh=tnwJ0nfGdmO4kzHiCdsk8siEsbxTWszsH8I6n93yCl4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AF9w6x6HADQeBuvq9qr/i6S/u5bUJWwy2nsTtfkjRFSoCt9UkXro/YIq56E0VRm1kPUvtYDUxpzO/TIjWnEw8131I0Ett7N58AtQOKpO23iwfCrDevmvb41rrE/cGyPSy8nbKVHtiMaluXuM0R7tVLNBkKWAhIof1/7XcpjfQqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y4LMlswI; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752725005; x=1784261005;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tnwJ0nfGdmO4kzHiCdsk8siEsbxTWszsH8I6n93yCl4=;
  b=Y4LMlswIJAA0clxVHM2VpBmoH3KKkQ/pSvD2frbbWktt2w0HyjDpq3D4
   IP6jFXXyHN3Tpdfpip5LWRXzxrjOUEl+jK8WgaVC2P2DSBV7QsTZr0nTI
   4V4S4dD93sIi7dsO5ef/++uobZLtEi8uQNrGCZuQpb9aY6Cwyl30czTwD
   5yC2Y6Xv+qoxqUb+DvIvAQZ2wFXdcrN0YkR+9x5ys/WxjjhH/GycaFPsY
   JaM97LC+pXBEN/94djos/1s2KKSZp7mwgnRNJK1SshUa3i4H+seKWtvlm
   0HavT6L2B1JrAu/rPqG3FKLgR0wvSUjJHzuRjuWAcxif6OOSWMwRe0MXx
   g==;
X-CSE-ConnectionGUID: GsgffuGuT+SGRBU2MBALfw==
X-CSE-MsgGUID: jBJevU+TSyiB8EqMOTOUNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="57596038"
X-IronPort-AV: E=Sophos;i="6.16,317,1744095600"; 
   d="scan'208";a="57596038"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2025 21:03:24 -0700
X-CSE-ConnectionGUID: ADtF+glrTbmoNNNluCCIyQ==
X-CSE-MsgGUID: NlxNpl7gStqD4fOCL/DkCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,317,1744095600"; 
   d="scan'208";a="194810445"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 16 Jul 2025 21:03:20 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucFq1-000D7z-2t;
	Thu, 17 Jul 2025 04:03:17 +0000
Date: Thu, 17 Jul 2025 12:03:01 +0800
From: kernel test robot <lkp@intel.com>
To: Yassine Ouaissa via B4 Relay <devnull+yassine.ouaissa.allegrodvt.com@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Michal Simek <monstr@monstr.eu>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yassine OUAISSA <yassine.ouaissa@allegrodvt.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 4/4] media: allegro-dvt: Add Gen 3 IP stateful decoder
 driver
Message-ID: <202507171125.Cy8G5dte-lkp@intel.com>
References: <20250716-allegro_dvt_al300_dec_driver-v4-4-f87c01c9f7b5@allegrodvt.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716-allegro_dvt_al300_dec_driver-v4-4-f87c01c9f7b5@allegrodvt.com>

Hi Yassine,

kernel test robot noticed the following build errors:

[auto build test ERROR on 155a3c003e555a7300d156a5252c004c392ec6b0]

url:    https://github.com/intel-lab-lkp/linux/commits/Yassine-Ouaissa-via-B4-Relay/media-allegro-dvt-Move-the-current-driver-to-a-subdirectory/20250716-225824
base:   155a3c003e555a7300d156a5252c004c392ec6b0
patch link:    https://lore.kernel.org/r/20250716-allegro_dvt_al300_dec_driver-v4-4-f87c01c9f7b5%40allegrodvt.com
patch subject: [PATCH v4 4/4] media: allegro-dvt: Add Gen 3 IP stateful decoder driver
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20250717/202507171125.Cy8G5dte-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250717/202507171125.Cy8G5dte-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507171125.Cy8G5dte-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/platform/allegro-dvt/al300/al_codec_util.c: In function 'al_codec_cmd_cleanup':
>> drivers/media/platform/allegro-dvt/al300/al_codec_util.c:149:9: error: implicit declaration of function 'kfree' [-Wimplicit-function-declaration]
     149 |         kfree(cmd->reply);
         |         ^~~~~
   drivers/media/platform/allegro-dvt/al300/al_codec_util.c: In function 'al_codec_cmd_create':
>> drivers/media/platform/allegro-dvt/al300/al_codec_util.c:165:15: error: implicit declaration of function 'kmalloc'; did you mean 'mm_alloc'? [-Wimplicit-function-declaration]
     165 |         cmd = kmalloc(sizeof(*cmd), GFP_KERNEL);
         |               ^~~~~~~
         |               mm_alloc
>> drivers/media/platform/allegro-dvt/al300/al_codec_util.c:165:13: error: assignment to 'struct al_codec_cmd *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     165 |         cmd = kmalloc(sizeof(*cmd), GFP_KERNEL);
         |             ^
>> drivers/media/platform/allegro-dvt/al300/al_codec_util.c:169:20: error: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     169 |         cmd->reply = kmalloc(reply_size, GFP_KERNEL);
         |                    ^


vim +/kfree +149 drivers/media/platform/allegro-dvt/al300/al_codec_util.c

   144	
   145	static void al_codec_cmd_cleanup(struct kref *ref)
   146	{
   147		struct al_codec_cmd *cmd = container_of(ref, typeof(*cmd), refcount);
   148	
 > 149		kfree(cmd->reply);
   150		kfree(cmd);
   151	}
   152	
   153	void al_codec_cmd_put(struct al_codec_cmd *cmd)
   154	{
   155		if (WARN_ON(!cmd))
   156			return;
   157	
   158		kref_put(&cmd->refcount, al_codec_cmd_cleanup);
   159	}
   160	
   161	struct al_codec_cmd *al_codec_cmd_create(int reply_size)
   162	{
   163		struct al_codec_cmd *cmd;
   164	
 > 165		cmd = kmalloc(sizeof(*cmd), GFP_KERNEL);
   166		if (!cmd)
   167			return NULL;
   168	
 > 169		cmd->reply = kmalloc(reply_size, GFP_KERNEL);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

