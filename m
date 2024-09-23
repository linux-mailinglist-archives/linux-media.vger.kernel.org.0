Return-Path: <linux-media+bounces-18468-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA6797EA78
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2024 13:08:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18D301C21239
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2024 11:08:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 666FA19883C;
	Mon, 23 Sep 2024 11:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K6jHW0n9"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA3F19645C;
	Mon, 23 Sep 2024 11:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727089695; cv=none; b=Yqm2v52Uh9PwF0vQS2a45BQ7sBVEDvK6RPncmbgq9pPf3lMqfLnutrBmejGY8Wfpw805MZUnZEHj8eSjdc8GqTkmz5DnssR2GRTipJdw8NYUDZVz2lDmEOpWjBXzYkBS73PIuus7hFdg0mc4642jS6ZOwGov9Cuggol+BuhHf94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727089695; c=relaxed/simple;
	bh=P4OR9JP7067PpaiwXorXk0AJomemI4RJy5r+c7AD9ps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iED2bLrpf5ZX0948qj6Za4WK/LEbCQ2tgLOANuwt6fw1TKgFvKSrGzjLDIGyYy7msglOJ/HK+PMKECXcLQDMrNZy4MS89a9U+QYrvG0WV702ZDR3c57/NhJF6oR34oFJl25KAMd5LJfnt4VZJqaUolAGacuCnjjKhM0KHkP840g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K6jHW0n9; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727089694; x=1758625694;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=P4OR9JP7067PpaiwXorXk0AJomemI4RJy5r+c7AD9ps=;
  b=K6jHW0n9AESTXzEizC0sd8u8YD3VL0b5sGaKDsRxbj0KSSm0oF48OPtO
   bTZNUbfA+Zi0iL0DQbR1jv5izPNjRbaqi+qVusOEtKowblA4mb4zxpj1Q
   fyphOS4vkMhWhvYPY9/ugqxOgQu+2hYTLZoNpZuKbuRKhcl/bGxzQi3PZ
   ELgO0ZmzZbYh4Zh/eyA0Xg0y+FtZMHYacBkrfreTQPRtI60cCPBaj53TY
   MDlYGRXObwGQg6VBvU13GoIqwhfLR3VmDNWvXfJbFBEmYy4ZlLO+PWyBR
   HmD1Zhb6fQXCRwJoSME3MUXdPg6/xliSM7miTu/DS66mSKeE5vylSkB7f
   g==;
X-CSE-ConnectionGUID: Qm0ImSGxTHaZoFxUnG12Dg==
X-CSE-MsgGUID: V5Uq1PsISFGTGOxNcICUSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="29755123"
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; 
   d="scan'208";a="29755123"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 04:08:13 -0700
X-CSE-ConnectionGUID: Yyp27Pp0SDy9EiC9TLONfA==
X-CSE-MsgGUID: YYmtfhHKTNqErHl+7e75Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; 
   d="scan'208";a="75805265"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 04:08:09 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ssgvF-0000000BxoA-0UyB;
	Mon, 23 Sep 2024 14:08:05 +0300
Date: Mon, 23 Sep 2024 14:08:04 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jonathan Bergh <bergh.jonathan@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Roshan Khatri <topofeverest8848@gmail.com>,
	Dipendra Khadka <kdipendra88@gmail.com>,
	Sergio de Almeida Cipriano Junior <sergiosacj@riseup.net>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Kartik Kulkarni <kartik.koolks@gmail.com>,
	Kathara Sasikumar <katharasasikumar007@gmail.com>,
	Tchadel Icard <hello@tchadelicard.fr>, Kate Hsuan <hpa@redhat.com>,
	Colin Ian King <colin.i.king@gmail.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 1/1] media: atomisp: Remove License information
 boilerplate
Message-ID: <ZvFMFO3EjmV0BFp5@smile.fi.intel.com>
References: <20240923105539.3569110-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240923105539.3569110-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Sep 23, 2024 at 01:53:06PM +0300, Andy Shevchenko wrote:
> We have the respective SPDX identifiers that are already being applied
> to the files in question. Remove the License information boilerplate.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> 
> Here to fix one of the missed TODO item before moving from staging.
> This depends on 20240923085652.3457117-1-andriy.shevchenko@linux.intel.com.
> But can be applied before that (it's trivial to adjust).

Also worth to mention that this reduces a burden with all scripts running over
the driver code base, besides the improving the build performance (when it
makes files dropped by page size boundary, meaning one less page to map during
compilation) and reduced all Git operations for the developers.

-- 
With Best Regards,
Andy Shevchenko



