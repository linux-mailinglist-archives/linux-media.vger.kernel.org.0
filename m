Return-Path: <linux-media+bounces-23482-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C287A9F351D
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 16:58:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2061C16295C
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 15:58:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 531D114AD1A;
	Mon, 16 Dec 2024 15:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OINSEsZ3"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2923D1494B2;
	Mon, 16 Dec 2024 15:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734364679; cv=none; b=YiyZeC0tI7m3RF+fVONOVk/XqOBPs1kTJ/4Ru6ot4a9qromFouEJHGrrdRt/Byi0Q6EfMSMcUXOsynURho7KKW2aphPPQR+SxMR5q2RO4IMJO9mETo1ZvYtIiXpF4ScdcdXFvW9s7/n22+21lu+mCkvostBiFToBIuF2EsZfqkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734364679; c=relaxed/simple;
	bh=q15iHX2Lfk8uXnNgAsqcrVlAQRpHKuG10UtywdbepG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HBN8y7e6qItOeMh+Ae1+u66N6jM+d1E7g7w3ub8NgiGYgJTkbRpm244vKF8RiZ/5gEPDhrHlyNAJFXuh5ZsB8OsX3vO1x56R5Qq6zg1grqaXJ36tcdanV9dx7DBDEJ5TnnQRKvVoVcu6wB/AxpXj9z2EIucjZ1D+JST3QpGXdaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OINSEsZ3; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734364679; x=1765900679;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q15iHX2Lfk8uXnNgAsqcrVlAQRpHKuG10UtywdbepG0=;
  b=OINSEsZ3RkH3fhR5MatH2q/mCTKZWvLlLWEAVzThDuHs9V1d4Axw2ujl
   dZ8SunmskIZhwGwJpTDDiefIoI2Si6s5jrWL1bAZi45Oe5d5il5Hp4YhA
   d4YjPIcdFIvA1OD3Yeo9MrSQ9i7nkoeYmn7trl3kgO1Jf6cbIy67Wzare
   PfWMXUAKpequtYUpXsq45XDht7pAVZWZtyfrxPxdi2hze6AE64KYuqqb6
   o5j+80cAC7vgcxA/xoS/OB+8EhdDPCfl0LhSeca108iS3fafnCRdi252C
   AnsyoLGcu7Q5+vVonGdCASSPfGXcfTi5B5otr0qMVrYGnBNapJdx3eK5D
   w==;
X-CSE-ConnectionGUID: ocvkMN8mTmyvVi5ouQvL6A==
X-CSE-MsgGUID: l7h1joaeQWKIXJcMvE7a2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="34901799"
X-IronPort-AV: E=Sophos;i="6.12,239,1728975600"; 
   d="scan'208";a="34901799"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 07:57:58 -0800
X-CSE-ConnectionGUID: hqu0stp2QZaveuPMOkUZfg==
X-CSE-MsgGUID: Rp0SQjpPQGWDuoTR4dOmrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,239,1728975600"; 
   d="scan'208";a="97117413"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 07:57:55 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 0FAB111FA2A;
	Mon, 16 Dec 2024 17:57:52 +0200 (EET)
Date: Mon, 16 Dec 2024 15:57:52 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: Documentation: ipu3: Remove unused footnotes
Message-ID: <Z2BOAHleNCsuCoHq@kekkonen.localdomain>
References: <20241216-ipu-doc-v1-1-e07f0b4f9065@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216-ipu-doc-v1-1-e07f0b4f9065@chromium.org>

Hi Ricardo,

On Mon, Dec 16, 2024 at 03:51:28PM +0000, Ricardo Ribalda wrote:
> These footnotes are not used, or they are used in a codeblock:
> Documentation/media/admin-guide/ipu3.rst:592: WARNING: Footnote [#] is not referenced. [ref.footnote]
> Documentation/media/admin-guide/ipu3.rst:598: WARNING: Footnote [#] is not referenced. [ref.footnote]
> 
> Remove them for now.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

You seem to have written the same patch I have. :-)

I'm about to send a PR soon, however if you can get this merged before
that, let me know and feel free to add:

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus

