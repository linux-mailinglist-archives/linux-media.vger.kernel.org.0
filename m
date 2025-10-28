Return-Path: <linux-media+bounces-45873-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B4FC16940
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 20:13:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6989F1C250E1
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 19:13:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5005A34EEF5;
	Tue, 28 Oct 2025 19:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lsN3AIK9"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA7221FF23
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 19:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761678798; cv=none; b=oC0kApv3weXQVJAOL3DGRx3Rrxh6Zi+CkFb5QYHhvkn8F2sgsilrXJ2+4MEV1iiWhOXVFt98/GVwBnRrNGrrul+GAqq4BQcPm/cRN+kcVsyKNVru821lhNuZposjHi9QGlfvK2PHb2I4U/sir9JwG+MdZkHOBPz6kBhc7+fcebM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761678798; c=relaxed/simple;
	bh=D3vQgKvmvyriHv9uII6CzLEu9smg6LDh8pXp0hCrHGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kDPVE0WjSdBbTRknUsxcKg58xb90BZLQs4Jm9sGzIz5zehI1eokhfc2UxphP78wUEZT2XvqD5cETLzMoyEKgtr9KKO0xywqBCsGEJ//AIY5zHbqUzabeZz1Zgyas38cE6MDS+3V8nRiN0X7Sf9mNIHKKEzNCL+CW7wf2OQ4vCss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lsN3AIK9; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761678798; x=1793214798;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=D3vQgKvmvyriHv9uII6CzLEu9smg6LDh8pXp0hCrHGE=;
  b=lsN3AIK9Km4u6sQgE5k0lpqVFzQP7juzrH4gN01b9+lbZeJfKhHXcFT+
   XlQWkaQh2HM5rFjXpPQGY1ZE3L3k/KxduLeNSVRhn+OH0c4Bh30e1/byR
   IT3DuGm7ygyLRvnDUEaEJmiT4K2AjKP4twcqve1lIAjx9tfwIoWZ61SXp
   7VFm35OglUc/Lej+eDhVT43Yyi4dHyosGWK99mGRdJrC0LXq5VrAn/Sw7
   lUIvORXPzJOscoYPlSf+HsP47qwJ1dIpGKQAVaZ9pBIC6rTZluPW8rcS2
   Oeg0r/9t/SXf37boBsiGHMKHpn53WukLxF8hQtaDIYBWzhryCxGyixe8K
   w==;
X-CSE-ConnectionGUID: KyVy9A/kTViCn5qAKOSTnw==
X-CSE-MsgGUID: pQQvuRPoSLaYBZ3TSD4Gyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74080663"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="74080663"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 12:13:17 -0700
X-CSE-ConnectionGUID: jw5UCi8+TlKJVflvhUrZnw==
X-CSE-MsgGUID: IBgvx1gtR2u2qF0esS0cYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="186191209"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.190])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 12:13:15 -0700
Date: Tue, 28 Oct 2025 20:13:07 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Bingbu Cao <bingbu.cao@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 17/25] media: i2c: ov01a10: Remove struct ov01a10_reg_list
Message-ID: <oy2jde3tam3kgcfwtcca4ay2ho7rzdbs5ne63zn2dkpz5p3f35@2jm46wtj65yx>
References: <20251014174033.20534-1-hansg@kernel.org>
 <20251014174033.20534-18-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014174033.20534-18-hansg@kernel.org>

Hi Hans,

Thank you for the patches!

On Tue, Oct 14, 2025 at 07:40:25PM +0200, Hans de Goede wrote:
> After the conversion to the CCI register access helpers, struct
> ov01a10_reg_list is only used inside struct ov01a10_link_freq_config.
> 
> Simplify things by embedding the ov01a10_reg_list members directly into
> struct ov01a10_link_freq_config.
>

Tested-by: Mehdi Djait <mehdi.djait@linux.intel.com> # Dell XPS 9315
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com> 

> Signed-off-by: Hans de Goede <hansg@kernel.org>

