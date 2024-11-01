Return-Path: <linux-media+bounces-20691-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 149F29B9025
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2024 12:21:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD7201F22544
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2024 11:21:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C87E919923A;
	Fri,  1 Nov 2024 11:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NijF8JIB"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031E016F8E5
	for <linux-media@vger.kernel.org>; Fri,  1 Nov 2024 11:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730460056; cv=none; b=QjuRRXFzuE1pnUsecbPAn5wBjXhsXOfGHILxLQJoMHzzzPZ+TBVMqPs9QwUBLXogfecMAtXw0+WYnTpvrTGUrAgacizOCnc4/Lk82TNmI424FcpmJkaC3rRpY6kDX1RFJUSE8kp0734Ml+1fwbp6hnu9k1D6thGZfizZ6O21SoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730460056; c=relaxed/simple;
	bh=VJdfdxjWY1lfmF/yt5s7f6SVsGBh+Cf0uLt2M5ubuYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JyobBlFSwwIAjL+174QiSa4GI3QaU/DIX4VHhXCe4nYYoMuxlhyvYKJeiwY8m0odlqx6uFS6QjOzGf83NSFti3WTZdGfQ57CACQPrB5IoaVfGViyXcagKYjYeNf1pKtkyZMpLZKZS9+b766wU4ZB8xKSt/RmsGfAJHgmYWgiEE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NijF8JIB; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730460055; x=1761996055;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VJdfdxjWY1lfmF/yt5s7f6SVsGBh+Cf0uLt2M5ubuYE=;
  b=NijF8JIB5GIwWA4SkuijHH2rnMP5XLa22usOcqF/aL0tXhPcCyKZ6UVA
   EjMllYTKLYKf8qJlIZBnjsKxxBHVKQfvNGtb9ajTLbhhJHiYxmUOxZfz1
   BEWjWIlHveDNA3r8tlaeDvTBcJKZKBJajn2D2zzfCdKxSaQwHmLKFtVR/
   6v4EsQV+XncMJXUr9cWuix+vCeVkWpvKrQtbRsjmjVF+eT/ZsKAWI9f7G
   yyVcltdsBBOCp/rxNDLmxVdBvbSb/Lcso0MyNdjh3LU0A7inCH0oE8VXS
   5hjsDrF0DfY9Q2EXjklcScDEWPj4O17l7vsJ8ImupczeElqjv8OidNaTf
   g==;
X-CSE-ConnectionGUID: roGZMD2OSfGEBv5p1r1t9g==
X-CSE-MsgGUID: W0lX42LCQBuRWSBppbQbdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29991821"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29991821"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 04:20:54 -0700
X-CSE-ConnectionGUID: 65o7TW+6QRyIm9XITN1zqg==
X-CSE-MsgGUID: xNQtaQzQTtS4qXCfiQaLPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="83273553"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 04:20:52 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 7D01C11FA28;
	Fri,  1 Nov 2024 13:20:49 +0200 (EET)
Date: Fri, 1 Nov 2024 11:20:49 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Hans de Goede <hdegoede@redhat.com>
Cc: Jason Chen <jason.z.chen@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH 1/2] media: ov08x40: Move
 fwnode_property_read_u32("clock-frequency") call down
Message-ID: <ZyS5kb_QCDdw11x7@kekkonen.localdomain>
References: <20241012115236.53998-1-hdegoede@redhat.com>
 <ac006721-6122-482d-9daf-2281f7e4f384@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac006721-6122-482d-9daf-2281f7e4f384@linaro.org>

On Sat, Oct 12, 2024 at 04:10:14PM +0100, Bryan O'Donoghue wrote:
> 20241010-b4-master-24-11-25-ov08x40-v6-4-cf966e34e685@linaro.org

Hans: could you rebase this, please? Bryan's set has been out for quite
some time (and now in my tree, devel branch).

-- 
Sakari Ailus

