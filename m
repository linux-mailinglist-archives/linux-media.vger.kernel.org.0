Return-Path: <linux-media+bounces-1553-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FBB8033CD
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 14:07:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8E917B209B9
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 13:07:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C74B24A0E;
	Mon,  4 Dec 2023 13:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jVPAaYDy"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 463C2A7;
	Mon,  4 Dec 2023 05:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701695230; x=1733231230;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UXznonBwZSh6vXkSOTRxTtrLALPBPOcd61xsNDWj4+I=;
  b=jVPAaYDyH7Qfu6aYzAqic98Wlrl/0ukje+B8DWj5adDdPsVOjFd6rOmQ
   N6Fa4B0+ed1pJbgXRY2UPuomb2L9xpb7l+SXLkp3SSBUdiywbj+TAbZrU
   v8Seex1XCVqaxR6m/dOj7hd4hYLHR+v/vCg29WBMEmyUFECb/FGZkgMZC
   NvRSQGrLNZA8Cah0to6uDHZ/lEpQ1zvY3+V4c7YXgvZH3R4n1TMiPIUoD
   nfIEl+ieJZyXAr/847vedbdRgczqhqS5TuukfldvmQYaxsr0+OcVuJRv8
   8Cbvyx0v487JQIsZ8hVaBAU59nTpQ2mRO1ig+CCOXLnrpYqC4xpawvmrP
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="15274919"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="15274919"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 05:05:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="763935407"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="763935407"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 05:05:41 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rA8dl-00000001kpu-0ppK;
	Mon, 04 Dec 2023 15:05:37 +0200
Date: Mon, 4 Dec 2023 15:05:36 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Yury Norov <yury.norov@gmail.com>, linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, Jan Kara <jack@suse.cz>,
	Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>,
	Matthew Wilcox <willy@infradead.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>,
	Alexey Klimov <klimov.linux@gmail.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: Re: [PATCH v2 27/35] media: em28xx: cx231xx: fix opencoded
 find_and_set_bit()
Message-ID: <ZW3OoLzNYe2IytMn@smile.fi.intel.com>
References: <20231203192422.539300-1-yury.norov@gmail.com>
 <20231203193307.542794-1-yury.norov@gmail.com>
 <20231203193307.542794-26-yury.norov@gmail.com>
 <40783b7c-4353-4366-ad49-95ac87c5f8be@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <40783b7c-4353-4366-ad49-95ac87c5f8be@xs4all.nl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Dec 04, 2023 at 09:39:59AM +0100, Hans Verkuil wrote:
> On 03/12/2023 20:32, Yury Norov wrote:
> > Functions in the media/usb drivers opencode find_and_set_bit() by
> > polling on a found bit in a while-loop.

...

> It's a nice improvement.

Wouldn't it be even nicer to utilise IDA framework?

-- 
With Best Regards,
Andy Shevchenko



