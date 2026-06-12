Return-Path: <linux-media+bounces-64638-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lKvmH+yLK2rN/QMAu9opvQ
	(envelope-from <linux-media+bounces-64638-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 06:32:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E86576769E3
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 06:32:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=JEHgCuqS;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64638-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64638-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ABCBC30B4567
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 04:32:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4BF11D61B7;
	Fri, 12 Jun 2026 04:32:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1419C2F6931;
	Fri, 12 Jun 2026 04:32:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781238755; cv=none; b=gFycjDSS2qMRaW6idAv1j0cJbaAQwSbdYIg6ScGLAk5P2XCI3r52uy1sfwp6nFBfSJIwEtu9IsV+hBh9vJg1vNKYcZT0fEdGGjjTjOPHvWe5fmAz2VxozRs2YEyjwGmMeCVc0lmXy9EIC+GV7WIkX4YonirWctLp79ml6WzqaAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781238755; c=relaxed/simple;
	bh=khstqJkF3ATYBmmus/0LM5+7K5YtO6cGJKSvZ7jF6ac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QNQuIaJzNmQV6MJSXYvIRHlukWYUY2V4pG/XGc95jTNw4rUCWdaz1u4/j0D5ZgplXZQBkDIjopUiJhJbXCmC2VgZVw9V5YW/0rJzkYgMGI2xkZRw4gaYGh8Yz/09Rm6EMifk72APWCB/FPhYyHIA4S81KBgfdJ0uWAh/rrh0iiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JEHgCuqS; arc=none smtp.client-ip=198.175.65.17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781238754; x=1812774754;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=khstqJkF3ATYBmmus/0LM5+7K5YtO6cGJKSvZ7jF6ac=;
  b=JEHgCuqS6/EAzBgZbHZYi7Dc4p0EhHZaWFPTC4Yg6awQTsVyAH64AAmY
   ySh9itDJq2t7cNG6pqdOHGqr7BDTIsdGjAaRvrZL2D137tbzfHnLR1aZb
   FDJXUYmxYfiEWve7Jf6F9r3umtwpNcOF3XxN8hdDdI79UfE2eynpv/Y6u
   hAwrgLgfmwTXnZ4Qrnmha+mcoGYYnw5p9C0AgOpeVUDc8tk90uS9P/402
   CKmHT9D9V+NI2b8RUtQBINqbzlRB6A4RgeoAeKf9PvHHhFcYEbOWju1i9
   O9SJ1AhD2HTsNrGw1s1tkSVJSCWvwSiXB0v6QGs+scVPEwSya4gpGOuvg
   g==;
X-CSE-ConnectionGUID: vMb5bc81S7anZoGdZ+PfWw==
X-CSE-MsgGUID: qpB5m0hrSU2dzjfrjBYv2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82072626"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="82072626"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 21:32:34 -0700
X-CSE-ConnectionGUID: SV4yh9qbThagVXMe3VqKzA==
X-CSE-MsgGUID: j1RAI94jTU6xaVcXGCNT+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="245614402"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 11 Jun 2026 21:32:29 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXtZC-00000000OJh-2H3e;
	Fri, 12 Jun 2026 04:32:26 +0000
Date: Fri, 12 Jun 2026 12:31:49 +0800
From: kernel test robot <lkp@intel.com>
To: Eugen Hristev <ehristev@kernel.org>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
	Naushir Patuck <naush@raspberrypi.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Eugen Hristev <ehristev@kernel.org>
Subject: Re: [PATCH] media: bcm2835-unicam: Fix querycap multiple caps
Message-ID: <202606121218.nV4fMXUr-lkp@intel.com>
References: <20260611-bcmpiqcap-v1-1-10cf7fb438df@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611-bcmpiqcap-v1-1-10cf7fb438df@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64638-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ehristev@kernel.org,m:kernel-list@raspberrypi.com,m:mchehab@kernel.org,m:florian.fainelli@broadcom.com,m:rjui@broadcom.com,m:sbranden@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:sakari.ailus@linux.intel.com,m:dave.stevenson@raspberrypi.com,m:laurent.pinchart@ideasonboard.com,m:jeanmichel.hautbois@yoseli.org,m:naush@raspberrypi.com,m:oe-kbuild-all@lists.linux.dev,m:linux-media@vger.kernel.org,m:hverkuil@kernel.org,m:linux-rpi-kernel@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,intel.com:mid,intel.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E86576769E3

Hi Eugen,

kernel test robot noticed the following build errors:

[auto build test ERROR on a87737435cfa134f9cdcc696ba3080759d04cf72]

url:    https://github.com/intel-lab-lkp/linux/commits/Eugen-Hristev/media-bcm2835-unicam-Fix-querycap-multiple-caps/20260611-141320
base:   a87737435cfa134f9cdcc696ba3080759d04cf72
patch link:    https://lore.kernel.org/r/20260611-bcmpiqcap-v1-1-10cf7fb438df%40kernel.org
patch subject: [PATCH] media: bcm2835-unicam: Fix querycap multiple caps
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20260612/202606121218.nV4fMXUr-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606121218.nV4fMXUr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606121218.nV4fMXUr-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/platform/broadcom/bcm2835-unicam.c: In function 'unicam_querycap':
>> drivers/media/platform/broadcom/bcm2835-unicam.c:1836:27: error: 'node' undeclared (first use in this function)
    1836 |         if (is_image_node(node))
         |                           ^~~~
   drivers/media/platform/broadcom/bcm2835-unicam.c:1836:27: note: each undeclared identifier is reported only once for each function it appears in


vim +/node +1836 drivers/media/platform/broadcom/bcm2835-unicam.c

  1825	
  1826	/* -----------------------------------------------------------------------------
  1827	 *  V4L2 video device operations
  1828	 */
  1829	
  1830	static int unicam_querycap(struct file *file, void *priv,
  1831				   struct v4l2_capability *cap)
  1832	{
  1833		strscpy(cap->driver, UNICAM_MODULE_NAME, sizeof(cap->driver));
  1834		strscpy(cap->card, UNICAM_MODULE_NAME, sizeof(cap->card));
  1835	
> 1836		if (is_image_node(node))
  1837			cap->capabilities |= V4L2_CAP_VIDEO_CAPTURE;
  1838		else
  1839			cap->capabilities |= V4L2_CAP_META_CAPTURE;
  1840	
  1841		return 0;
  1842	}
  1843	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

