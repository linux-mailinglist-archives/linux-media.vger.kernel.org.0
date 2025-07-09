Return-Path: <linux-media+bounces-37232-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8109FAFF3E7
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 23:27:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D22425A8433
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 21:27:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20BFF24167D;
	Wed,  9 Jul 2025 21:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iWu8FOaP"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF84623AB86;
	Wed,  9 Jul 2025 21:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752096432; cv=none; b=gzn+spHMC4a1lfTutxBOlSif93jKaDnG/4w/Rz6LJPX7DSbzXcxS9dw3f/OqfWi4cVhQcSXdqw69SmB7Im/6sUDSc3p8M0C/laTSCoLriMUg/9Cv8aFT/yi2BWnwOHSEyhDKmnmUfHPPbOckpfNzVQ2Te3A2ZMdX7nCsTRoQPrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752096432; c=relaxed/simple;
	bh=o/6eAdwXe8kwygDHQLmflx9S6oy/pExr1Gk1bJKmMqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DjYsQzHx6dYoBb6WkIIb/KSgPnJtsgCDu8oNYLzQX86NCcnDHnW3U5Lf/G4tj4wF5lgVb1PUX9fxjPDfuu4LUw91lQFCmT2lTHupITJ7iQ3oGa1Ifqf+ieWq7V2j4nUb2RJLbCjK7Pwq08YiAZLFKdp0frvn+j372CUf6QwMjWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iWu8FOaP; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752096431; x=1783632431;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o/6eAdwXe8kwygDHQLmflx9S6oy/pExr1Gk1bJKmMqg=;
  b=iWu8FOaPPIH6IpRRbkwCj8/6CaGurFAqkCId/WVSJUCpg6AE6nCIJwUo
   CjqqJcz9IQ/UG7e4skkof0+foSX3oTfnPG1Ug75xNH+gjbaEYKf1PPKhy
   obSjyc7AMqZx7ClL+lbaZmOeGkG6QC10Ova0EGqer9+YypKtPNeT0fRDk
   ZI8oU3Tzw3Iydm3dJ15u8Yf7nJ+1CY7arXOhJyrnUCBaoojnzg5pOIIy/
   YF+lvdL/oyS8XQgDU0iy2Wv8oRpM4p53+aQDym65lE3P3CXuzGqwcpMYM
   07IYJdVL9tsRapb4dX4CP4tp9goPmQ4uaE2uHUJiBpO3mG42rBG+a1jzA
   A==;
X-CSE-ConnectionGUID: DTMg55YXT2Gfwdlfs8xfCw==
X-CSE-MsgGUID: a5TjDOorThe26l3SwuB30A==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="64627268"
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; 
   d="scan'208";a="64627268"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 14:27:10 -0700
X-CSE-ConnectionGUID: gxL5CNZTQbKzIuK97dCfjQ==
X-CSE-MsgGUID: 9SI7xn6mTN2FV8TJkjoPbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; 
   d="scan'208";a="160217273"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.15])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 14:27:09 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 215C511FBA7;
	Thu, 10 Jul 2025 00:27:06 +0300 (EEST)
Date: Wed, 9 Jul 2025 21:27:06 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-media@vger.kernel.org, hans@jjverkuil.nl
Subject: Re: linux-next: Tree for Jul 8 (drivers/staging/media/ipu7/ipu7.c)
Message-ID: <aG7eqpsMgclt60Od@kekkonen.localdomain>
References: <20250708201124.25e87f2a@canb.auug.org.au>
 <e5f0a46d-401e-476b-a388-db3cce4b135d@infradead.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5f0a46d-401e-476b-a388-db3cce4b135d@infradead.org>

Hi Randy,

On Tue, Jul 08, 2025 at 08:40:05PM -0700, Randy Dunlap wrote:
> drivers/staging/media/ipu7/ipu7.c:2775:1: error: type defaults to 'int' in declaration of 'module_pci_driver' [-Wimplicit-int]
> drivers/staging/media/ipu7/ipu7.c:2775:1: error: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]
> drivers/staging/media/ipu7/ipu7.c:2764:26: warning: 'ipu7_pci_driver' defined but not used [-Wunused-variable]
>  2764 | static struct pci_driver ipu7_pci_driver = {
>       |                          ^~~~~~~~~~~~~~~

Arnd has a fix (<20250709145735.126674-1-arnd@kernel.org>) which we'll try
to get in Soon.

-- 
Kind regards,

Sakari Ailus

