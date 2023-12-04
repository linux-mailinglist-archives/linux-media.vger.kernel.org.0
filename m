Return-Path: <linux-media+bounces-1615-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA5E803AC9
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 17:49:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC5F61C20B19
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 16:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0117528DDF;
	Mon,  4 Dec 2023 16:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KxHpKMV4"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 391B6D7
	for <linux-media@vger.kernel.org>; Mon,  4 Dec 2023 08:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701708551; x=1733244551;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=G+3TbJW/b+Fcpauv3GMDfD1w/AMne74G4nkgRw55VyI=;
  b=KxHpKMV4xuguE8dnnNjXWa4M6x6kYCzbJGZf47wJl83Y5/8D4Zwc524F
   QNntF30yy7ZCnyuRT1cIUOxNiUeweOB/HGRS3cjZdPcDz2iWi5hAoRCF4
   JLZjcC1CHbpbot+gt2h1Rq6qV6fObliJJDEkfoDT4u/azR5hyOZLxNlsd
   y7+6exZvnJ7esKoXbByLyNyzep7zhYvR19P9c7pTxj/uWeB6DbXRhO5OV
   AH/D+pRxcD+DEvtOQP2rscKi9GySjjm2ubS1xdEteG3eLhet+/ZQlk1JO
   T1nG/ianY5ceaIaiCUahtWxxrnEzxb2P4lyU7ZqkcJQnJyG92UnDLcwU9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="12477123"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="12477123"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 08:49:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="774308986"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="774308986"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 08:49:08 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rAC81-00000001o5b-1CNQ;
	Mon, 04 Dec 2023 18:49:05 +0200
Date: Mon, 4 Dec 2023 18:49:04 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: bingbu.cao@intel.com, linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
	"Martti Groenen (19174837)" <M.Groenen@student.hhs.nl>,
	ilpo.jarvinen@linux.intel.com, andreaskleist@gmail.com,
	claus.stovgaard@gmail.com, tfiga@chromium.org,
	senozhatsky@chromium.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@linux.intel.com, tian.shu.qiu@intel.com,
	hongju.wang@intel.com
Subject: Re: [PATCH v2 00/15] Intel IPU6 and IPU6 input system drivers
Message-ID: <ZW4DAMh8BSLmsq_o@smile.fi.intel.com>
References: <20231024112924.3934228-1-bingbu.cao@intel.com>
 <e1b060be-793f-4482-b0dc-670984bbbd84@hansg.org>
 <4768df6c-3b2d-4bca-afcd-553a272dc9fd@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4768df6c-3b2d-4bca-afcd-553a272dc9fd@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Dec 04, 2023 at 05:35:16PM +0100, Hans de Goede wrote:
> On 11/8/23 12:59, Hans de Goede wrote:

...

> Talking about a next version I would think it is about
> time to post a v3 of this ?

Yes, would be wonderful to see v3 sooner than later.


-- 
With Best Regards,
Andy Shevchenko



