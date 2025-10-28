Return-Path: <linux-media+bounces-45864-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 73916C1665E
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 19:11:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D2A3E4F9667
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 18:07:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFD27336EDC;
	Tue, 28 Oct 2025 18:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T14EMSRV"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDC634D92D
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 18:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761674825; cv=none; b=hPaOMyZWhl9kJSHTsHJJARCYIDsd9W9jTI6t3TspMmYezOOyaS3SHPd8D87kFlh6n234fvzGkPGRtktt3zOjCwM8Mv4TzxhN+CpUJBo10naqiteo0f+ciFwSHt0QJbojiKi7vZMbXTII8EstgDxjEuNC5HiCTxJ6SBcjrUYWI04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761674825; c=relaxed/simple;
	bh=OGXlfE5LIU1tI3zukb4jDeZN+D+MgX+0sRiuuftoXDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o3ln4YBKU5SyPLlxtBmXsle8xLOmOqfo4aQdpqOcVl1v+Bd9ncXACPRwL/941M7JcwuPzgEmiSQXvqU2sVpDUfiqDRNeM+Vq+8QS5L0YbGytygCiAxTAzpjB1jqfwSAS0NL+ZxKjgr29Kzg/tIC4WsA6SUoi9CPp83osaJH+Euc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T14EMSRV; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761674824; x=1793210824;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OGXlfE5LIU1tI3zukb4jDeZN+D+MgX+0sRiuuftoXDk=;
  b=T14EMSRVQX4XmxMv/PNOkVDTfso1CFs3kE+Zxw9E3w/r7L61am5cZXo8
   EKXFHmdwDhqektr8N7r7h26iMAQePr8mGD2QWoNJ7DzxfTaxqLLXecFcG
   xvqinxxa3f+E3IXfem5VfH1StsnjJWA0SOPbpf5+jkZPSo2aETGP0QW19
   oY/5YvCJZHO55iCyBTGjl8W8TPHRkVHd1a3hLUo/eg2RwfGKGatxwWVAx
   2xJ/gmpRovMyl3wjm99PwP8/8/Fx0wMHzhbisSMroSldQ8SXy4pUcUeD/
   6G+s2h6O+6Wdm3wQ1/jiQGsfPwKmipm2amfNmUA3z2/UU6I/CmnN99H14
   w==;
X-CSE-ConnectionGUID: DlgSbrEvQUK0tuLaM8nDDA==
X-CSE-MsgGUID: hkssIB/pQPGLK4iQNQvaqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="81207387"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="81207387"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 11:07:03 -0700
X-CSE-ConnectionGUID: u3N1k+GTSSGtkHGNKyf5dg==
X-CSE-MsgGUID: bI46Oj+7RkGdlFDls8Hf8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="190608390"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.190])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 11:07:01 -0700
Date: Tue, 28 Oct 2025 19:06:49 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Bingbu Cao <bingbu.cao@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 12/25] media: i2c: ov01a10: Add power on/off sequencing
 support
Message-ID: <eaaeyukyv6hgoibrlfqgefvrle34vfzi3hxk6shblk4sbc2nbw@apctl6ox2knc>
References: <20251014174033.20534-1-hansg@kernel.org>
 <20251014174033.20534-13-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014174033.20534-13-hansg@kernel.org>

Hi Hans,

Thank you for the patches!

On Tue, Oct 14, 2025 at 07:40:20PM +0200, Hans de Goede wrote:
> So far the ov01a10 driver has only been used on laptops with an IVSC chip
> where the IVSC chip controls the power on/off sequencing of the sensor.
> 
> But there are also designs with an ov01a10 sensor where the kernel needs
> to directly take care of the power-sequencing, controlling clks, regulators
> and GPIOs. Add support for these designs.
> 
> The 2 ms minimum reset assertion time is taken from other Omnivision sensor
> drivers like the ov5675. The 20 ms delay after reset de-assert comes from
> the out of tree ov01a1s driver.
> 

Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>

> Signed-off-by: Hans de Goede <hansg@kernel.org>

