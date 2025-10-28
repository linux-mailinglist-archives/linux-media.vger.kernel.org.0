Return-Path: <linux-media+bounces-45808-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E90EC146D7
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 12:44:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5DF014EE445
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 11:41:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 660513090CD;
	Tue, 28 Oct 2025 11:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iCdz1zIl"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14EB2307ADA;
	Tue, 28 Oct 2025 11:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761651663; cv=none; b=A3bqdzh9MOnVYeAPRykpvo5MGqgSZiY4R9ABQtj5Q3o1J3PT/BwBgeL4cc5UefWrN9Z95n+8idDAb/SdocOfzvOFC7ZBdgeGdGpondx0LRrytGvHRuvsV5+/NvYoepCOghDAV/5uWe39QBoyz5L2koF38bFIZPOxeXQbc1NKLJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761651663; c=relaxed/simple;
	bh=fp0g7/OIQ/ayel21xsyqOdJsLbze16XSiyzQ8Utgyss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nEZFg6faPM4gr2wJ4DnzJJ3LKOWsi0qXdg75BLOsNCKlFQhvXouyZcElj63OFx2Fr0GeEjO8FqQ/Fs2rKBt8sljZ3ayw5kySrlj93nD+oOpokYdzdTsQ7Ea01K0cJwvk7J69d1PW/mLrJC1xNP4hiqk5LifWx5MJ638oXGo9rdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iCdz1zIl; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761651663; x=1793187663;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fp0g7/OIQ/ayel21xsyqOdJsLbze16XSiyzQ8Utgyss=;
  b=iCdz1zIltNVKMX6Pi3ErtkkFery1Mm1JgSFY3SI7tkxeDrz+c/oGEVR6
   hnp0BIDIAeaz1Z2sD/x5TjTKxa5a4kTyrSrUuXoZ0o2BRAs/6G5xJxaRe
   j9TXHvuKkZ6xhzxDFapDFMZoLzbmVqS9k+E2gxRTd2L5MtPQWmsq0SVS9
   7zdu7N+r0/kB3P6Y7xal0ke795f8qE4iNVpkaXKpJQDDtC/fXjqfWPyvZ
   Ddd0uasSoa+3u8/e7R6KXhcl1jQjo2PKYJbQrXcsJWimlXx3asSOCjGtA
   fzPO1J6/JMOrBL2qUe+POYj+Yj73CSCAtPLGKqqPF9Ufpcj1SNwIo1vft
   g==;
X-CSE-ConnectionGUID: EvtqHTzgRom7SN5EBdCS2A==
X-CSE-MsgGUID: neZjdoXfSHS6qD8ksOi2Dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63450696"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="63450696"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 04:41:02 -0700
X-CSE-ConnectionGUID: o2HgJLwNQQOiZ0cbrRSVWw==
X-CSE-MsgGUID: T8Sjij5mS0qzFsg2J86n7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="186075513"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.131])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 04:41:00 -0700
Date: Tue, 28 Oct 2025 12:40:53 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Bingbu Cao <bingbu.cao@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 05/25] media: i2c: ov01a10: Fix passing stream instead of
 pad to v4l2_subdev_state_get_format()
Message-ID: <bziyhu7c2ilsave6csvumt26ckp57zqzwejfn6ngw445fsy2f7@7xmwxomom5kv>
References: <20251014174033.20534-1-hansg@kernel.org>
 <20251014174033.20534-6-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014174033.20534-6-hansg@kernel.org>

Hi Hans,

Thank you for the patches!

On Tue, Oct 14, 2025 at 07:40:13PM +0200, Hans de Goede wrote:
> The 2 argument version of v4l2_subdev_state_get_format() takes the pad
> as second argument, not the stream.
>

Tested-by: Mehdi Djait <mehdi.djait@linux.intel.com> # Dell XPS 9315
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>

> Fixes: bc0e8d91feec ("media: v4l: subdev: Switch to stream-aware state functions")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hans de Goede <hansg@kernel.org>

