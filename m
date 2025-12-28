Return-Path: <linux-media+bounces-49614-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BF0CE56C3
	for <lists+linux-media@lfdr.de>; Sun, 28 Dec 2025 20:52:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3BD68300B8C2
	for <lists+linux-media@lfdr.de>; Sun, 28 Dec 2025 19:52:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1D9A27F75C;
	Sun, 28 Dec 2025 19:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D4uPRD9a"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC9D4C6D;
	Sun, 28 Dec 2025 19:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766951561; cv=none; b=lPqXgBU7nK//ssW05CkAsv16EPCuN/EaGfQMsmI80qqQJNNkk+rmaBMynugToN9IerjSgVpEYk475qaSdIrgFo/OPlTzQabhA/nYY80zkhwCITnYuTu3607qSBVWeja1taU0QMUuRbawchUP5ppaBlVmCn9N8UApeYd/YX2E3Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766951561; c=relaxed/simple;
	bh=CLZFuHzdYKmpXaLBoFOiGEJ4mMD+4XmYOUyE4NhWtcI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jk3YzroIR5BGpd+4WI3iQZldEoEsZgyt4tNWBNn+rPFtUviAn/b5PR2zvS/scFu14FFCxaNDeZpy6TlBSGZIaAE2Y1b1Bd9/EQij1GUJs8viU39DBwiesK/TRjZ/ZklDnuOxf7wKToPfsp/v/qcH0Jygmp1NF81D2nMahiMe3SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D4uPRD9a; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766951559; x=1798487559;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CLZFuHzdYKmpXaLBoFOiGEJ4mMD+4XmYOUyE4NhWtcI=;
  b=D4uPRD9aGOX3iHTHI+i7/Rj5quzSl4K5w8PgCFbEmDwwl6fgAhTxusjP
   2SII+oQTXhajSwylyG2sM0ki+FOhu9vtxgiingL1tCpCiQr2qlkrGsDRq
   C68vY3BDspdk0aatoGLe0je/KhhJTNCs4JC3KGCTjULV6COukaFGMIWII
   l2xGAvxPJxdUa5vaRwOSfaq/HHgpC/KMbs707XNqL9Mo5ViBspGPBa1JL
   svEaoipZEXOKE/fIkm2JXK6kw20itpRZQoBboydqJTh4k2exix0hfEzuf
   Rpe+W85FTSyDrMzY9hGzzph8M+a323cEz/dV9m2IAULRstKBEYcxO3BBN
   A==;
X-CSE-ConnectionGUID: hvZ4or9cQb+ia8nDe8uzKQ==
X-CSE-MsgGUID: bmFwvD+0Q5u1Y4H3i1pAng==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="68744780"
X-IronPort-AV: E=Sophos;i="6.21,184,1763452800"; 
   d="scan'208";a="68744780"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2025 11:52:39 -0800
X-CSE-ConnectionGUID: X9q+9PVhSNeQgEGQxFk9DQ==
X-CSE-MsgGUID: uP1jKirGRXerjBg/OJx9hA==
X-ExtLoop1: 1
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.236])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2025 11:52:35 -0800
Date: Sun, 28 Dec 2025 21:52:33 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Mikhail Dmitrichenko <mdmitrichenko@astralinux.ru>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Thomas Andreatta <thomas.andreatta2000@gmail.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Ingo Molnar <mingo@kernel.org>, Alan Cox <alan@linux.intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, lvc-project@linuxtesting.org
Subject: Re: [PATCH] media: staging: atomisp: remove unnecessary NULL checks
 in sensor drivers
Message-ID: <aVGKgdso3-cnEIsP@smile.fi.intel.com>
References: <20251212123814.78238-1-mdmitrichenko@astralinux.ru>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251212123814.78238-1-mdmitrichenko@astralinux.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Dec 12, 2025 at 03:38:14PM +0300, Mikhail Dmitrichenko wrote:
> There are unnecessary NULL checks for v4l2_subdev_format::format
> pointer in ov2722 and gc2235 sensor driver format operations.
> The fmt pointer is derived from &format->format where format
> is a pointer to an embedded struct v4l2_mbus_framefmt inside
> struct v4l2_subdev_format, therefore fmt cannot be NULL.
> 
> Remove unnecessary NULL checks for v4l2_subdev_format::format
> pointer to avoid unnecessary computations and make code
> clearer.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Sakari, can you pick this up?

> Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")

This is not needed. There is no bug to test non-NULL pointer.

> Signed-off-by: Mikhail Dmitrichenko <mdmitrichenko@astralinux.ru>

-- 
With Best Regards,
Andy Shevchenko



