Return-Path: <linux-media+bounces-37050-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81292AFBDE3
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 23:55:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DABD24A5845
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 21:55:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C60E12874F6;
	Mon,  7 Jul 2025 21:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CWFUuKGU"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1B21C6FE1
	for <linux-media@vger.kernel.org>; Mon,  7 Jul 2025 21:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751925315; cv=none; b=jYLdAaTbZut9673wCYo5kY0Llujkfik1DqoXQYqq+WrsJIU06fDliMxH2PTdQlsJZdo/MA2xtHaIARJBN5TOphf2nkn5HbWS4mltsHonovkjRVUMrzIw9CrZhkBGtOCWfzdSO3a0kH9N4x9OpIlhkCXjL/tP6TTEGOH/Wagop/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751925315; c=relaxed/simple;
	bh=TFeyn3bHqUp6kZUxoMxw100SNHeqCmBLhfLMg9OiW4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U2rUhLIWeB45O7GPkkQEd/eUXPfHDMy/7VQw/NVGTsNw7x1WJi+B1YOrO/p/3LlSeRtfQhbmYMrtPOYbqJp8+S6lIZEHG0l9kMX0qfUA3+dnJBu3ttzEaug/mu/3Y3C78wjmpIWQs81RzoI++PMNUyDEbWBPrtHlKbqAROXqz70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CWFUuKGU; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751925314; x=1783461314;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TFeyn3bHqUp6kZUxoMxw100SNHeqCmBLhfLMg9OiW4A=;
  b=CWFUuKGUyD1GZMkPBEmvnRgTtUP8n6In4zNg17f/QkumBlzqVPCp/mqb
   BaPY8BOl77AJ7tA41zwS/bAVRHWWKLfEDKOqgBUeyu4EM+ghUQe2Fm3+F
   +wbDX5qW4Tgl7qmO4C8K/VXpaCrs4JtjamIPpnAl6iUz9s1nbY4Qauu6g
   48XP5ULzG1yfv+1kxdIe2h9AIV4eTpKoN5PpE7pt/5wEKBiHNc/6opz8T
   oJ3omPBN43hqxfmc4NmvQdEEGyCgPS7a5HAL4PImtTO0t+B0T23ChAqu6
   ZkEDqJocifqbTS5pUUMkhummpn3+CxFUek4H9QqJcrOvbX0Tc+9tgN3+S
   w==;
X-CSE-ConnectionGUID: A8C21LAcSW6dJ/84zK0h6w==
X-CSE-MsgGUID: Uo63fa9GQWGkivHYrfjJdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="57957487"
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; 
   d="scan'208";a="57957487"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 14:55:13 -0700
X-CSE-ConnectionGUID: WVhotFgcRuOQctEuRepuPw==
X-CSE-MsgGUID: yvpvjDozTJiN4PW0gC03/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; 
   d="scan'208";a="160971485"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.166])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 14:55:06 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1903111F8F6;
	Tue,  8 Jul 2025 00:55:03 +0300 (EEST)
Date: Mon, 7 Jul 2025 21:55:03 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>
Cc: alain.volmat@foss.st.com, andrzej.hajda@intel.com, arnd@arndb.de,
	benjamin.mugnier@foss.st.com, dan.scally@ideasonboard.com,
	dave.stevenson@raspberrypi.com, hansg@kernel.org,
	hdegoede@redhat.com, hverkuil@xs4all.nl,
	jacopo.mondi@ideasonboard.com, khalasa@piap.pl,
	kieran.bingham@ideasonboard.com, laurent.pinchart@ideasonboard.com,
	linux-media@vger.kernel.org, m.felsch@pengutronix.de,
	mani@kernel.org, matthias.fend@emfend.at, mchehab@kernel.org,
	michael.riesch@collabora.com, naush@raspberrypi.com,
	nicholas@rothemail.net, nicolas.dufresne@collabora.com,
	paul.elder@ideasonboard.com, pavel@kernel.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com, rashanmu@gmail.com,
	ribalda@chromium.org, slongerbeam@gmail.com,
	stanislaw.gruszka@linux.intel.com, tomi.valkeinen@ideasonboard.com
Subject: Re: [PATCH v3] media: v4l2-common: Add a helper for obtaining the
 clock producer
Message-ID: <aGxCN6_yNjX5LcUy@kekkonen.localdomain>
References: <kobm27v4vkwj7akssxll57yybkfbwfk3vakhweub5e6tl6otkc@qtl2dgd2xei2>
 <20250707143253.167910-1-mehdi.djait@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250707143253.167910-1-mehdi.djait@linux.intel.com>

Hi Mehdi,

On Mon, Jul 07, 2025 at 04:32:53PM +0200, Mehdi Djait wrote:
> Introduce a helper for v4l2 sensor drivers on both DT- and ACPI-based
> platforms to retrieve a reference to the clock producer from firmware.
> 
> This helper behaves the same as devm_clk_get() except where there is
> no clock producer like in ACPI-based platforms.
> 
> For ACPI-based platforms the function will read the "clock-frequency"
> ACPI _DSD property and register a fixed frequency clock with the frequency
> indicated in the property.
> 
> This function also handles the special ACPI-based system case where:
> . The clock-frequency _DSD property is present.
> . A reference to the clock producer is present, where the clock is provided
>   by a camera sensor PMIC driver (e.g. int3472/tps68470.c)
> In this case try to set the clock-frequency value to the provided clock.

How about adding

	select COMMON_CLK if ACPI && !HAVE_LEGACY_CLK

to menuconfig VIDEO_CAMERA_SENSOR, in order to ensure COMMON_CLK is enabled
on ACPI platforms where it becomes a necessity for sensors?

This should probably be a new patch?

-- 
Regards,

Sakari Ailus

