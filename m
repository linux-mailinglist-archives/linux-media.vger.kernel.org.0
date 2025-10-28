Return-Path: <linux-media+bounces-45803-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F1AC14563
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 12:25:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8750A3B3AAB
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 11:25:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C05B7308F3B;
	Tue, 28 Oct 2025 11:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BwdkSgrS"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489C83074AB;
	Tue, 28 Oct 2025 11:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761650685; cv=none; b=Mv0ouH1OXFdGeajCdH1U3rbMKqNzFiQ9ouVpKMrvsD3qYHTaJyTBW+BbxznUnb0DAJiV2OjeO7GDDn/u+iAY6QiB5OcCWYo/hEYYWYOAPt/QJ03AMQlYJdvCZnTZo9Ll027P1jnpuyAN9JBtBzcMnqAoimi7h8kzHhgmUF5tHZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761650685; c=relaxed/simple;
	bh=a3dYZw3hSHsuKeW9iMVUClSJO5iZtjCsxNOwoawsinw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DwV7AC30hgQTs0whihPC8xTUW1jD+WgCP1uIF4+4F/WLumWqM1fBgb/zbJ2+xvFddM3ewvcMs1fsAlSjjdPpDgeJ30OON3cKckrkjFlIulLREQJ8tDB7wkJgcsYSUod20B5Y2zPGepxHRKsCIzgaJ70Lj5vbCbIF1r+VAOFKRwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BwdkSgrS; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761650683; x=1793186683;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a3dYZw3hSHsuKeW9iMVUClSJO5iZtjCsxNOwoawsinw=;
  b=BwdkSgrSmSUFkXxoIuTmnAuFgmxu67gGgiplOcQsVISlyCFRKt3ws+iG
   sfRktXKY/dLI6yyb1+jptwCPNlTx6MsnQeYgzGvPSQfVEgYzNRrR2ZBrT
   uQalSTb9LM30EE64ORyXFMtHZ4qghU5PNDZmUu6m+lU/l/fB8kx0b3TSA
   Ktu8XRi5JVozDg4uqCMyA+UNM9XFojJdqeySa6E/F1yS/aAt+eZLwb6sh
   bmzk9gP/D5z7yn1aC02IJ1p/s9SfUwnFIO7gVrmWBosNLzvmr0LRrW1sF
   q9gDRiUi/CPOXzMB0JtayVuUJlyZL+IQbTangiq0qwtYEBmUd06XF3YW6
   g==;
X-CSE-ConnectionGUID: gc3SzPJqRX2t3K9XuQ7whw==
X-CSE-MsgGUID: kvSdyuHbTLSV4aftG7X+/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63654602"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="63654602"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 04:24:43 -0700
X-CSE-ConnectionGUID: IfxjK9TbSm2m6+UT483w6g==
X-CSE-MsgGUID: m9gzeIr9SWGY5GheAijFOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="185019793"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.131])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 04:24:41 -0700
Date: Tue, 28 Oct 2025 12:24:32 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Bingbu Cao <bingbu.cao@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 04/25] media: i2c: ov01a10: Add missing
 v4l2_subdev_cleanup() calls
Message-ID: <n6i6bzhype4ncepdlrcdvlrfhe5ssemaokkfievo5voibhnaqd@i5kfv54gsqwu>
References: <20251014174033.20534-1-hansg@kernel.org>
 <20251014174033.20534-5-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014174033.20534-5-hansg@kernel.org>

Hello Hans,

Thank you for the patches.

On Tue, Oct 14, 2025 at 07:40:12PM +0200, Hans de Goede wrote:
> Add missing v4l2_subdev_cleanup() calls to cleanup after
> v4l2_subdev_init_finalize().
>

Tested-by: Mehdi Djait <mehdi.djait@linux.intel.com> # Dell XPS 9315
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>

> Fixes: 0827b58dabff ("media: i2c: add ov01a10 image sensor driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hans de Goede <hansg@kernel.org>

