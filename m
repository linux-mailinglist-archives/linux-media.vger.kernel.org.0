Return-Path: <linux-media+bounces-22673-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 756339E5046
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 09:52:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4744B168F39
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 08:52:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D6ED1D5AB6;
	Thu,  5 Dec 2024 08:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UjvOISwX"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8264B1D5173;
	Thu,  5 Dec 2024 08:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733388758; cv=none; b=F4YejGNlabMxLwY9IjcYI8JIwGY42RdyjKKhYOgulByoETY/J9dgl13bRwGRHCI1RnLjD9HYNutGmGEGlkcU0rvj3ywXVH30BKO8cmfvBgUgf4j6Ir2UmUs/aNEKSK65glhifD9NFUmsIuzvQU9DOEWbAOgc08RLQ62Kcqd2NM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733388758; c=relaxed/simple;
	bh=4516tsAgZLblVcYeZN3JhDQdZrqZPs9W45VB2YjKrd0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OUPyiqRxxFQ9ghzUIn/Q95KMdovJQYjXkSyjR4VZDXDZP/NNQ8fIpxRem9zKUo8nlBlc1XynUQYxy8o/MGOH+cIVYLS4e1GIWe0tP+9EgEEfjvOBY1axIjEYA0JWyShLry3+T2a/X0Zg2xdrk15uMU3317TJ+hNf7rifHnkOG8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UjvOISwX; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733388757; x=1764924757;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4516tsAgZLblVcYeZN3JhDQdZrqZPs9W45VB2YjKrd0=;
  b=UjvOISwXFOgYpobVpOLvgAbyYbP8kIRp9y2mBmdYN07p+nc8y/L14G/w
   whgKjFSRPutXpcqMEZ0IweaqVVuzpdGzmI0tCSy+zmwEiqfqDLVy7iPxm
   G7I9/NfO9L2/a7LJiGZ30cdWCoPIqK6k7dvQUndCFh/qBAm0AoHjdcBbM
   Qntli9PGe5Z/lEPovvwtVIf/ZJmT1zsxiWZBKIZocWxd4ucOooKNeSkis
   bMe4YuqGnXWlAwAmb3xWLBpJvNO2ahpzg//wtFisoPoLKw14pUFKa6UaA
   16ME25i/UFZdFfIcJuHI+QuKLbmiclUqV+5UYOKpePqHJVcW/HFJ3ZRu1
   A==;
X-CSE-ConnectionGUID: XBStR6agTi2eWCrdi3bLuA==
X-CSE-MsgGUID: JGE0mtmhTO6W4QmnpSSFZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33819879"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="33819879"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 00:52:34 -0800
X-CSE-ConnectionGUID: hNKUBPRtQfGAt1HhllNqRQ==
X-CSE-MsgGUID: jOkGxaTtSzC2cYfhxOeC4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="94469210"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 00:52:29 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 0B13C11F775;
	Thu,  5 Dec 2024 10:52:27 +0200 (EET)
Date: Thu, 5 Dec 2024 08:52:27 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jiasheng Jiang <jiashengjiangcool@gmail.com>
Cc: hverkuil@xs4all.nl, mchehab@kernel.org, andrzejtp2010@gmail.com,
	allen.lkml@gmail.com, neil.armstrong@linaro.org,
	quic_jjohnson@quicinc.com, lkundrak@v3.sk,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: marvell: Add check for clk_enable()
Message-ID: <Z1Fpy5Vr6xVaBpoV@kekkonen.localdomain>
References: <20241203212902.38116-1-jiashengjiangcool@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203212902.38116-1-jiashengjiangcool@gmail.com>

On Tue, Dec 03, 2024 at 09:29:02PM +0000, Jiasheng Jiang wrote:
> Add check for the return value of clk_enable() to gurantee the success.
> 
> Fixes: 81a409bfd551 ("media: marvell-ccic: provide a clock for the sensor")
> Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>

Thanks!

Applied, with spelling of "guarantee" addressed.

-- 
Sakari Ailus

