Return-Path: <linux-media+bounces-45950-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FEC3C1C989
	for <lists+linux-media@lfdr.de>; Wed, 29 Oct 2025 18:53:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 43F9F4E260D
	for <lists+linux-media@lfdr.de>; Wed, 29 Oct 2025 17:50:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E11A033F39F;
	Wed, 29 Oct 2025 17:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YZq8f74f"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9903446B5
	for <linux-media@vger.kernel.org>; Wed, 29 Oct 2025 17:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761760227; cv=none; b=dsxw3F4KVi6vPudRT9CgC28cFYo+Ns5ORxp2hMI+6lS6dBwZX51NmN+cHy+ol/NzLLek/vSeik7LvffkfRzxZ4wfQnrLFWqbUy+1sjEHr2SP1zoT0l0JNhH149EYJa96Ij3fg1SPAKUYgi4SwruviXqr57OiaUedzqWg1wjPFnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761760227; c=relaxed/simple;
	bh=HnD/iZE5u+PdaJo7rVMEbrC34FOrg+UL0LZWb3UwzSE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qrC0OcER01fR6KzqQeJa3xfbhBM5UavcDnYLFUQMC4zJTaWNaSYLYr9wAvzWhqKJ46saQ7gEkzY5yXGWjWmVAovLMorf4rJwnp1hAPi8pFFYxLFVZRsa04oflT5peAyLin+sUTO0GNNPj2yyxKpZhwgwOs2HAbw6Q4UfLMWt9Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YZq8f74f; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761760226; x=1793296226;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HnD/iZE5u+PdaJo7rVMEbrC34FOrg+UL0LZWb3UwzSE=;
  b=YZq8f74fHwF9tuaLeBOZ7vQOZawlvq9J2ZRMQn/SAXzHgByK+1PFFntn
   kPb1oUzSKrjM/XSiK7PQ28jGafrem9Aau/arWT3m6pHtZqYA9vUj8TTQD
   hf4b1OJw/uIuf4/4f3dvtvR48FUzbJFZwAbEHgeMEieFOxOwxJjZ9xPpH
   B+lf0fnDD8OlMQRiZ98uTKpDCjin6uz4IkhR7WuerficfD0oDG7LG4/28
   4r2e8X95ShtRVj5A+4AhN6DtWWLDsWvnuQ6ZyMQfMnh6u6GJ0qd1fKNcl
   svZSzCZe4ZLGW1LIqAEQl0ESAv8X94wAo+jUofxIhRnuH4aI/ZNMqbxRG
   w==;
X-CSE-ConnectionGUID: Vn4bT2ahQuu3KRZhsoNwDw==
X-CSE-MsgGUID: a9TQj4L9SyOedEFUNJqEuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="86519868"
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; 
   d="scan'208";a="86519868"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 10:50:26 -0700
X-CSE-ConnectionGUID: uiNymbGQTf2mstD1aRHwXg==
X-CSE-MsgGUID: 2mL9smu/R3+fErXrRWwaBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; 
   d="scan'208";a="216594072"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.118])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 10:50:24 -0700
Date: Wed, 29 Oct 2025 18:50:16 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Bingbu Cao <bingbu.cao@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 20/25] media: i2c: ov01a10: Remove values set by controls
 from global_setting[]
Message-ID: <23wwpuq4xtn3glp4csmivvskluu7smbnaiyqjkgrvw6huivxoo@5a4yj343t54k>
References: <20251014174033.20534-1-hansg@kernel.org>
 <20251014174033.20534-21-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014174033.20534-21-hansg@kernel.org>

Hi Hans,

Thank you for the patches!

On Tue, Oct 14, 2025 at 07:40:28PM +0200, Hans de Goede wrote:
> Registers 0x3501 (exposure), 0x3508 (analogue-gain) and 0x4503 (test-
> pattern) are already set through __v4l2_ctrl_handler_setup() drop them
> from ov01a10_global_setting[].
> 

Tested-by: Mehdi Djait <mehdi.djait@linux.intel.com> # Dell XPS 9315
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>

> Signed-off-by: Hans de Goede <hansg@kernel.org>

