Return-Path: <linux-media+bounces-45854-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A95E9C1607B
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 18:03:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AE0E14E9DAE
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 17:03:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3C92346E41;
	Tue, 28 Oct 2025 17:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lLFiRTZo"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E3028AAEE
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 17:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761670975; cv=none; b=j2ZGeO3Iza0hF+8wdAxF+IZGq5sHefQBFkVQHNY67AUyyUhFHRALTVV/i0zBFExM8g3I4l0XqyAKuZo5zGAGGadkhKp5scBxb/+d/uEURML7DsVKluz/C472vp+eZepMemckxdkqoxlMbKK7Iq91bIeR4TyUdvHSok88e3etQpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761670975; c=relaxed/simple;
	bh=HSZ9UYf9pim/vhonDPWjV59SPjx2mSAROBMjZzfp1nc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QTaUW5aIRVooOw5Jk30yEW2/js6kbd5ovooqpGGJR7FGRztlcKHS6TZRCQolsXqWqUZ30de7z77qF0sjoD0TZsYXOnunRWLyUW5S+PjcxW6+pe8HHdQNNBuWwMfHvVMoUDskyjUbkGnU39rKhxqOoARgxNYa/6Qq7J8KhigdUV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lLFiRTZo; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761670974; x=1793206974;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HSZ9UYf9pim/vhonDPWjV59SPjx2mSAROBMjZzfp1nc=;
  b=lLFiRTZoSMUjNyMtkAWrMZLFb7x3m3GIAiV6qqwKh9BzJFZZtYPCpSgd
   PL8dzObq/XpbE2M29S0K2ZLSjZrlPjmbwY0ii8X5yNaoNH3lPxOg9+eAn
   wruqrAs74JVf6p/JmTSKrt9xRyNePlwKGYwv0vKJZwM0oqo86i5k5zb01
   kO4+HocVpYkjYjMdtNq7l4q271PHTHZoMvEUbud8VmyVA4gs7IxLfRYQi
   JBpp8GnTaMZIHz0AKLWzvImevUtieCPTfvbAl2VB4oB4dyMQyA+5JnVC3
   sYMNPZo/OJkaOmCekX3/3QsuJ4cGuADir3gOZe0QKWAdzIy29w7pmQtnF
   A==;
X-CSE-ConnectionGUID: kh6GzTCMTUSPTXHLmMIPkg==
X-CSE-MsgGUID: Y832hYKlRPmBtMRcJ2Y/8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63681713"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63681713"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 10:02:54 -0700
X-CSE-ConnectionGUID: UP61iLZQTZiXkqdNIN9Kbw==
X-CSE-MsgGUID: OXLrEfzNSwaJtZG9hN5gyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="209011140"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.190])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 10:02:53 -0700
Date: Tue, 28 Oct 2025 18:02:45 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Bingbu Cao <bingbu.cao@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 09/25] media: i2c: ov01a10: Remove overly verbose probe()
 error reporting
Message-ID: <ji26l2rs5buo2d7vkh26fvhnwb5pzo23zcmecojxpwnbyrpqoa@f2lcsa5s247t>
References: <20251014174033.20534-1-hansg@kernel.org>
 <20251014174033.20534-10-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014174033.20534-10-hansg@kernel.org>

Hi Hans,

Thank you for the patches!

On Tue, Oct 14, 2025 at 07:40:17PM +0200, Hans de Goede wrote:
> Many of the functions called from ov01a10_probe() are expected to never
> fail and they should all already log some message if they fail. Remove
> the unnecessarily verbose dev_err[_probe]() calls from the error-exit
> paths in probe().
> 

Tested-by: Mehdi Djait <mehdi.djait@linux.intel.com> # Dell XPS 9315
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>

> Signed-off-by: Hans de Goede <hansg@kernel.org>

