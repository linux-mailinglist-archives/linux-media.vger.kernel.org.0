Return-Path: <linux-media+bounces-18455-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E97197E78A
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2024 10:29:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C8EF0B217D0
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2024 08:28:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B51E194082;
	Mon, 23 Sep 2024 08:28:48 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E6817BA9;
	Mon, 23 Sep 2024 08:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727080127; cv=none; b=gg4e/3wdrwIqLUCm7KwDP8E6QovnTB8YSSaERP8Q8HuneVxTcKDpybV8R7EHGx55VlpcpQYGc0oW14ED5QCNLDCq1y/rnt3PEaz+eBg10/NC+yLh5bsQuAQz43paVhFpywiBQ2YSwe/viqFmM83B6MrDXVPhRe9NjrIRHF9/QoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727080127; c=relaxed/simple;
	bh=bqYS7NG/TTAv5KFw/yj69rgZ7vuYOb6OxEau6P1Cjts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QH+IUMMlWj66xdW+RqIKRwz+8fZldUrE5xW1Oyv40UzxSsH6R9JzlPoBUkmyG/2Dwj40g8eCpgR9H3m/klYJB5dUOxNqxVo0jE39L5C4ztt2ZQTxnOgd/RAwazFX6R0h/KsCV7JUitm+MrK/G8fjgYRrO/ElJ3fhTt203gG8hAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: 8bpcRnytQPK11YKEe0QdcQ==
X-CSE-MsgGUID: iGTv/oT/R5igyTPVGe3Pmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="28911001"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="28911001"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 01:28:46 -0700
X-CSE-ConnectionGUID: DR5YYbDSQQOxMWCTzpvLqw==
X-CSE-MsgGUID: b/f2OnmpTu+qHnqUYRWSug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="71138690"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 01:28:42 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy@kernel.org>)
	id 1sseQx-0000000BtPG-2A1g;
	Mon, 23 Sep 2024 11:28:39 +0300
Date: Mon, 23 Sep 2024 11:28:39 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: Yu Jiaoliang <yujiaoliang@vivo.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Jonathan Bergh <bergh.jonathan@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
	Dipendra Khadka <kdipendra88@gmail.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, opensource.kernel@vivo.com
Subject: Re: [PATCH v1] media: atomisp: Fix typos in comment
Message-ID: <ZvEmt92VqqiIqJtG@smile.fi.intel.com>
References: <20240923033032.2420839-1-yujiaoliang@vivo.com>
 <25ec1b00-02fc-4ecb-853c-de9c8a12f9fc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <25ec1b00-02fc-4ecb-853c-de9c8a12f9fc@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Sep 23, 2024 at 07:44:51AM +0200, Philipp Hortmann wrote:
> On 9/23/24 5:30 AM, Yu Jiaoliang wrote:

...

> Please make your "Subject" line more unique. Consider that we may end up
> with having dozen of commits like yours, all of them referring to different
> removals and all without the necessary information to tell what they differ
> in (except the driver/subsystem). So it would help if you add the changed
> file or function to make it more unique.

For _this_ driver the Subject is good enough, no need to change.
We all know that
1) AtomISP is in staging;
2) AtomISP is unique driver in the entire kernel.

> Please improve your patch description. Better omit what you are changing as
> this can be seen in the change itself. Do focus on why this patch makes the
> code better. Your sentence is fine. Just remove what you change.
> 
> If you send in a second version of this patch please use a change history.
> Description from Dan under:
> https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

The above is a good advice, thanks.

-- 
With Best Regards,
Andy Shevchenko



