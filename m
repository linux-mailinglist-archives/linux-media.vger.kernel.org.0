Return-Path: <linux-media+bounces-45821-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C407C148C0
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 13:12:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 54C4948336A
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 12:08:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21CCE316912;
	Tue, 28 Oct 2025 12:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="emKbS9/i"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDBF932A3E1;
	Tue, 28 Oct 2025 12:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761653326; cv=none; b=q0j/n/5TPO1iegid4ETU83OF8+kYKnrYE2WAhM5jOjxJ90JUfXdyzv3AuU3kHq1YFTZFLZMAg81PtFXBwgNEVMdByhgN6UlUhS6UJQUq6VcCTDVwevDMNDOZOfRRIh7JXV5KVfiWIccpO1tXl+A/HIwV4tM07A9GEis4rGvU5Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761653326; c=relaxed/simple;
	bh=ytKe3aKJsEHa3Tfbht51N9IlsKHgY3cgoOtKT6K+kDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RtFmpxFh7s2cGKYbYJvFn5yQ0Fy6cJe7Rdx92oNRDgcAk9jmoVBReCFjnEBfxswPQTtxREs7qeHmI8BbLp5aGg6NNspGT+cPjKiS/T5jWU6+r4XvW3KtC7/8JVdmIsdCdhFDFuxKiAGeCQzwl85Q5BH3pk0S6dsroi25yQxoNQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=emKbS9/i; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761653324; x=1793189324;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ytKe3aKJsEHa3Tfbht51N9IlsKHgY3cgoOtKT6K+kDc=;
  b=emKbS9/irfTnsjcrqaF5EhJ755jYde/0qSJ05sniBCFfbElFGqtz5JOm
   56+Oi5dRljMsNn4N0z8cMF1xEA6w66pzfBkULW9MdnwIHhgVJenkze2zB
   CPPh1328MJoVxaozZQqKUyIwmmPoYQyl38dGhudvG3niMxQ6U4FU2BYsB
   dJY9iqSHhQbCKS+XvCY7vbK/DJUDHHQUPJR/B69vdGBWk8WhUaZK9Bku5
   f++QJXrt0Ug04pK5ZD8mIy4q76hdvmj2leM78UtgytDjMApdz94OSZchs
   b4TIPp5naFneKBT6vcRbEUi65GJkcq7HFhalQAJcLpznh+pjAZB6lBvjb
   A==;
X-CSE-ConnectionGUID: AqvMdWVJS7qqgdK4PkLWwQ==
X-CSE-MsgGUID: KjQprbrcS6mJdlJ6Hok9oA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="51324427"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="51324427"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 05:08:42 -0700
X-CSE-ConnectionGUID: MRl5Ix9iS0+qGHcKiBFDKQ==
X-CSE-MsgGUID: BWy4UT7WQFyOj/9g81NtTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="184957708"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.131])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 05:08:40 -0700
Date: Tue, 28 Oct 2025 13:08:32 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Bingbu Cao <bingbu.cao@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 06/25] media: i2c: ov01a10: Fix test-pattern disabling
Message-ID: <rywqbh2ku7aexskohujwsiv7yzgn7lipgdqol3rqtkcvqrmn3q@c6oe7wc45hti>
References: <20251014174033.20534-1-hansg@kernel.org>
 <20251014174033.20534-7-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014174033.20534-7-hansg@kernel.org>

Hi Hans,

Thank you for the patches!

On Tue, Oct 14, 2025 at 07:40:14PM +0200, Hans de Goede wrote:
> When the test-pattern control gets set to 0 (Disabled) 0 should be written
> to the test-pattern register, rather then doing nothing.
> 

A small question: Do you see any difference between test_pattern 1 and
test_pattern 2 or I did not look hard enough at the screen ?

Tested-by: Mehdi Djait <mehdi.djait@linux.intel.com> # Dell XPS 9315
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>

> Fixes: 0827b58dabff ("media: i2c: add ov01a10 image sensor driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hans de Goede <hansg@kernel.org>

