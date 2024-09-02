Return-Path: <linux-media+bounces-17340-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4400C9685C4
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 13:09:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F16A42867C0
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 11:09:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEA751D54EA;
	Mon,  2 Sep 2024 11:07:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433DB186E20
	for <linux-media@vger.kernel.org>; Mon,  2 Sep 2024 11:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725275224; cv=none; b=RCV5XGFXVwG9B75PrrqqqtTAFzt5dxBqPPuqqsY3s0Z1ljINdfpTrj1wCjOg4O8q8RlLs4fLc+G3H5vEnUlAT466wRazN6O4kH1UQIGxXtovPtawWIKqD8LnsQce2bbgcE459oNVOmKiz3gyUsErerKKtSHdH+JX4jKOO/t+CTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725275224; c=relaxed/simple;
	bh=LJmJvZd9BSZz6OcHQN8bzwPLoiJR9eBSoNYQT5qfNek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aPSa3Vi2DXQa1I71+XuK5myInzm0xpU6X1qyAUjjqHWtKEWiycxNmoLer5jRpBcxwd81cFdJyIN24ugZ6yEB6lp/DgDmw8PIpQoKsmyc+f+5fneigS800kd8Prl3FjnDWgb4qZM8cDe3F4PlufR08C+HrWiszP6xZ04pEJ92rpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: E+7IPefGRMaLBsnA12sjQQ==
X-CSE-MsgGUID: T8lHJ5UxREC0/jSKxMcVig==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="24032183"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="24032183"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 04:07:02 -0700
X-CSE-ConnectionGUID: /oCKMwWcQrO5+d7fL2T5ZQ==
X-CSE-MsgGUID: 17k7hU+MSf+Ys7rfEHylZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="102033802"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 04:07:00 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy@kernel.org>)
	id 1sl4td-00000004KrI-1A7K;
	Mon, 02 Sep 2024 14:06:57 +0300
Date: Mon, 2 Sep 2024 14:06:57 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 2/3] media: atomisp: Drop dev_dbg() calls from
 hmm_[alloc|free]()
Message-ID: <ZtWcUc0MO0f8ofKu@smile.fi.intel.com>
References: <20240902095229.59059-1-hdegoede@redhat.com>
 <20240902095229.59059-2-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240902095229.59059-2-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Sep 02, 2024 at 11:52:28AM +0200, Hans de Goede wrote:
> Debug logging every alloc + free just polutes the debug logs without
> adding much value, remove the alloc + free dev_dbg() calls.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

Agree on the point and ideally we should remove/replace most of (all?) the
messages by trace points.

-- 
With Best Regards,
Andy Shevchenko



