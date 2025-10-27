Return-Path: <linux-media+bounces-45712-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 10EAAC10E33
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 20:23:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1AC025062B1
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 19:16:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E84631D39A;
	Mon, 27 Oct 2025 19:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lUDbXyGe"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEDB631D386;
	Mon, 27 Oct 2025 19:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761592470; cv=none; b=Z3tUYB+AAjSJHGY5WkOfVFutD5zwAEgx3hGYbd2DDMLYQMfsGoNfBlp4BzU6KW9yNrwJV1gYpCeWhrbUd6YpE6O7F6hEVUT2z/nEg+9oXkb0HmBvUoSmJqAApOP8J4BcOaKs21vB5AaBT1RuTZ65WfABeMeLjNIWd3MeQ6nNsfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761592470; c=relaxed/simple;
	bh=8mRpLE0o9FY+yBHT7Kxcga55BIh/Tobu9nuLuF6N0ro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hPbC/Ct/8TtCOZkNfiCoGFRx0KdibQfPap05rCsyaGiuL/B6EGHlkW/sECulYhvl4oIJL5JppMNS4zSMNmaIum92FVqZH343Ljt8NxzCKheJcN9RHu9nQ/rCvyNwsJnbBrEuSs1B4v2FFJ6YCHMTMoh4sHH8KWJC4LqQ4Itt+MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lUDbXyGe; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761592469; x=1793128469;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8mRpLE0o9FY+yBHT7Kxcga55BIh/Tobu9nuLuF6N0ro=;
  b=lUDbXyGeCZcrcajZzvzJy1IOWy+hW2ihFeAE1cA2GB9pR9jqaU/BWmxR
   dhGYKYG92yNbF/1ll1I2syC5X1mQb17Ui48B9JQGc1/ncW5IY46jESyd0
   E/IXzCvUZVtACaW1d3IiTzEokCL+9zIiB4p3ZaXtY1YKqhJ5+FddEpDFk
   36WYRt1CKpkcJ3sx82sDjd8zaSardzzmf/J2NIVfDDZmOmOZEpSZ++ekQ
   A6g+ZSoFQ9D6yz8A4qx/EB4XydgGAvx6Fy2RurA/lXbSqjuuYGfSGV+IE
   1kCRMzB5vOGVZUkbSCFSyiuUVo+SMdFHsfZfyF/Rp0ZNV+f/Rv2GhdyQo
   g==;
X-CSE-ConnectionGUID: Cv3vxbTOQjOF8sRDwEnlSA==
X-CSE-MsgGUID: i79gds8rSteqmrsQsEzNiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="51259141"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; 
   d="scan'208";a="51259141"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 12:14:28 -0700
X-CSE-ConnectionGUID: mR27ZqQsTDW8H2S8I4AqAA==
X-CSE-MsgGUID: xsvN/l4ARLukx3ouXhuAXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; 
   d="scan'208";a="184754834"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.83])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 12:14:27 -0700
Date: Mon, 27 Oct 2025 20:14:19 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Bingbu Cao <bingbu.cao@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 03/25] media: i2c: ov01a10: Fix gain range
Message-ID: <ehz4qjj76a2tjv35gjs6aa3ofb6d5n2pj6zqdotnd3ic4vyjho@5ytlsplk7gus>
References: <20251014174033.20534-1-hansg@kernel.org>
 <20251014174033.20534-4-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014174033.20534-4-hansg@kernel.org>

Hello Hans,

Thank you for the patches,


On Tue, Oct 14, 2025 at 07:40:11PM +0200, Hans de Goede wrote:
> A maximum gain of 0xffff / 65525 seems unlikely and testing indeed shows
> that the gain control wraps-around at 4096, so set the maximum gain to
> 0xfff / 4095.
> 
> The minimum gain of 0x100 is correct. Setting bits 8-11 to 0x0 results
> in the same gain values as setting these bits to 0x1, with bits 0-7
> still increasing the gain when going from 0x000 - 0x0ff in the exact
> same range as when going from 0x100 - 0x1ff.
> 

Two things:

1 - You could mention in the commit msg that this is about the analog gain.

2 - You can add a patch for the max digital gain: which is defined as
    follows:

#define OV01A10_DGTL_GAIN_MAX		0x3ffff

My testing shows that the digital_gain ctrl wraps-around at
16383 = 0x3fff

with that:

Tested-by: Mehdi Djait <mehdi.djait@linux.intel.com> # Dell XPS 9315
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>

> Fixes: 0827b58dabff ("media: i2c: add ov01a10 image sensor driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hans de Goede <hansg@kernel.org>

