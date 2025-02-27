Return-Path: <linux-media+bounces-27142-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D567A47966
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2025 10:36:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61AA13AC44D
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2025 09:36:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1008D227E83;
	Thu, 27 Feb 2025 09:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kkbjcOV4"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C77270024;
	Thu, 27 Feb 2025 09:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740648966; cv=none; b=sC7rKb9k/rEtlVuhxuazQglF8H8yUmO9QTtSmirvzbnwj81zSVlsPS+4yMm8YxabIxEhWF4hp485VZxuFI+uDB7fPo4XTKYkVAfUL7ZSV5+yEfObVJ2BBKKNDoW9k5RlZmp7Eq8Rfr2X+slSUdMHU8RlIWFQDN09e68zGfXameQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740648966; c=relaxed/simple;
	bh=aVNCubdTSJyhWtZt7ylv+jY8nuP1pT1pfnLSlg7fK+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aZHXZyUHKUEj3lvu9SRBpEiUmKrhWme1tqLeOexr4PVdzf7qZRo+iVEHDq8gQMPI9sHTbdBFwSqv/1iO3YZLX/wlRR4ArgELHwwJaf3IA8ID4aanZg22GlNNa0fV/bQsPZOzmpeC1trDqUZt9oZ8dRQSbkS3/5EYXD/235PMU6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kkbjcOV4; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740648963; x=1772184963;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aVNCubdTSJyhWtZt7ylv+jY8nuP1pT1pfnLSlg7fK+g=;
  b=kkbjcOV4w0krx0lJPmPTYKJnIAjyQc76NpDuCxUxVbTZ26NY82f2iWrX
   Zf+GU/Bim11/UVa4zstJkSOdHbA/CBRd+eHpJ0yg1A9YVQOH8RsDDUXzA
   Phua0EGSMj30VFYFf3MTtMEquEjIOFA5Wvr5zECgpO8yVbLXbLdjWguHx
   KliXY91LmsHifdwP4XawKzFtJ73aYYEdrySvEpXBhFcD4eUgKy+v4Wtp0
   rnMWcqaJHsUuP5dq3B7W/BQEdhdvaBUSQPG7o9IPJqHeVbiWlO1xAHQLQ
   Ou/vlmWkmlGj9zNREl2oGo4Z+lW5y9aH+chkoL84P4MRXaUWcLa7dTuX/
   Q==;
X-CSE-ConnectionGUID: DOYMZmMJRcSU7VYz4gU2TQ==
X-CSE-MsgGUID: jJwREzXXQvKyiLc7sadSCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="41412142"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="41412142"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 01:36:02 -0800
X-CSE-ConnectionGUID: 0fiFKu1jSVuQsSH614PbvQ==
X-CSE-MsgGUID: 90YFT91LS5W1LhGWD/kl2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="117612755"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.138])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 01:35:59 -0800
Date: Thu, 27 Feb 2025 10:35:52 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com
Cc: tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com, 
	hverkuil@xs4all.nl, kieran.bingham@ideasonboard.com, naush@raspberrypi.com, 
	mchehab@kernel.org, hdegoede@redhat.com, dave.stevenson@raspberrypi.com, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1] media: v4l2-common: Add a helper for obtaining
 the clock producer
Message-ID: <x5rjvllauyjeah7j7nsaszdmx7wty2kggpxbhaysowuehrketd@niakizftfboz>
References: <20250227092643.113939-1-mehdi.djait@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227092643.113939-1-mehdi.djait@linux.intel.com>

Hi everyone,

On Thu, Feb 27, 2025 at 10:26:43AM +0100, Mehdi Djait wrote:
> Introduce a helper for v4l2 sensor drivers on both DT- and ACPI-based
> platforms to retrieve a reference to the clock producer from firmware.
> 
> This helper behaves the same as clk_get_optional() except where there is
> no clock producer like typically in ACPI-based platforms.
> For ACPI-based platforms the function will read the "clock-frequency"
> property (_DSD ACPI property) and register a fixed frequency clock with
> the frequency indicated in the property.

link for relevant discussion I forgot to include:
https://lore.kernel.org/linux-media/20250220154909.152538-1-mehdi.djait@linux.intel.com/

