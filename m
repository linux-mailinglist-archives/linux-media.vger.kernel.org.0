Return-Path: <linux-media+bounces-40905-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F307CB33826
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 09:49:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F2224189F7AE
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 07:49:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1181629A303;
	Mon, 25 Aug 2025 07:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GDVh7d5t"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A328929992A;
	Mon, 25 Aug 2025 07:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756108127; cv=none; b=cRkcs0yRVdZPviarddn/DOnus5nIcxp7FJctFx4rgDUr5W3yL+d8Si57fHXeckEUdUITvAq/jGXXIEGYoJNsjcReapCyTTC2OE1+Tw+7D8dL4usU6umlhe02vkAijnf4cuz92OvmiwrZEhVZVEdVp+lGVLFXx+wEZHUfT+k/4rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756108127; c=relaxed/simple;
	bh=KlC/BDRBi35GbQ6cB+15+6RE9SAY7uzY8/tWziQogwY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=o21KQXu6oe9J8qQ5U5HEAf4z78Xe3SvS8NrXlnyJIlAasuTI8IxLMluWK3U8/XES0e0tA/kP8i0VwtBTfCqG5B3NKqsRgpoU2fj77+wf8GzixLjJ9TXLdAw15XcUpCc6IDTRj2yZ/Rk/i6SB8AMoM1cmqwcd3ycHzMExTWh2dhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GDVh7d5t; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756108125; x=1787644125;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=KlC/BDRBi35GbQ6cB+15+6RE9SAY7uzY8/tWziQogwY=;
  b=GDVh7d5tes+Tzupgm8RJrRHmMaYn5xxLwtUszlimv9jpO6HQf/HhJ1Wu
   88psvgNTUvy4oGMyKjIBj3nqFg4tPtfKs9f8z55yGxTA7WRLtQrdL3P7+
   foyM4zqsAs7+Pz68dT+4NLCM+0qyBeJ0X6Bwg7EOS7EH5oDCM0RV+WSoJ
   qfbg5aiiztApp1PahjLwGhwR8wI5HtMAbsvSqXhtlkHG0DkEA/bArJ6kT
   oMxDqLBugRxuWUWnCeVz5ySPqjZH4xN78hXQ4PSMVoC7CRPYfATo3e22l
   0drhdCWwj57N8EtDmR5JtKcnFeRXtmsp0Scfa4EqVf2fIxdTHyhkxlNFg
   A==;
X-CSE-ConnectionGUID: G7uPZNdYSmiqAjVfoKWWLg==
X-CSE-MsgGUID: MkjfTMjcRQmMJ8HkVKLioQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="61956479"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="61956479"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 00:48:45 -0700
X-CSE-ConnectionGUID: bZ0n3zwOSr63XlWozeL9DQ==
X-CSE-MsgGUID: pTbjjAmAQ8uurbToHyrlxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="168729170"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.15])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 00:48:42 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Linux Doc Mailing
 List <linux-doc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-kernel@vger.kernel.org, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>, Sean Young <sean@mess.org>,
 linux-media@vger.kernel.org
Subject: Re: [PATCH 00/24] better handle media headers
In-Reply-To: <cover.1755784929.git.mchehab+huawei@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1755784929.git.mchehab+huawei@kernel.org>
Date: Mon, 25 Aug 2025 10:48:39 +0300
Message-ID: <0ad4fefca2855603c66d513474a687058e780931@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, 21 Aug 2025, Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> Its goal is to drop one of the most ancient and ugliest hack from
> the documentation build system.

Yay! \o/

Cheers,
Jani.


-- 
Jani Nikula, Intel

