Return-Path: <linux-media+bounces-25893-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C70E2A2E8DF
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 11:17:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34B611883C88
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 10:17:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2B6F1C9DC6;
	Mon, 10 Feb 2025 10:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l0+gQw4w"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336C91C5F14;
	Mon, 10 Feb 2025 10:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739182638; cv=none; b=pMq1XFX9ntyYFuMwxGu661zXgz5Aj5s+vGwNBJVZqMaOn7tfDihE2YjZiv2wxqGAwnp4tM+BD6U948EvFidTkiQYSRQDEl100BXpNKGgg5XMrcwtG32+4+f/qw6GvrUTYidS1+LwxXEhbw/XoXmY1sA3D/paY75qgoaWB8+Kx/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739182638; c=relaxed/simple;
	bh=yYZIyaS7DPr4T8bwU/okKPeXrYUxyBvElDgekCrprnA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AZIIG7ubufr1O7pgsQTbB3nS/F+x7ue6sNlcDbh/5aXujAeiwyt/gvIc+6C/SogI4r1Fm9pW/kcmRvaLGeWCNil3lMsoyVo4B/ajNalRWeEyM+rFqqiJdJLkKmNDiAzymLzyhXO4OJuRje3/KBNDzl957ozihPH67yXUAqMfKhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l0+gQw4w; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739182636; x=1770718636;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=yYZIyaS7DPr4T8bwU/okKPeXrYUxyBvElDgekCrprnA=;
  b=l0+gQw4wZbmIHrCsVaXEVRsPyrkcumfSGAzJ0tLkDOmg8RwVPkQ2jByH
   1jCKdl0e7y1Vy4HQ2r2L+U19eMmK0HXnL8igh8CG1ZqkUBdh3jpFFnOao
   dGJiSeSBlo/Mb5iGHHREILeJ60MVH8zmhxARAkSlYAIKUDnbcsx9Xn2cn
   iP6ZWHAQpVhcxzqzUZ2RifYAO671oejgn7jzNavca6Flmumi7Xeq1ayRz
   aySeuhEJ/CYo9XhLAUn8OCg12ERbW/sWEshQ6gZlzu3sT1pbN2XZVc+i8
   MdpMRcDvYzgNAHZ5IvQ1YX+HL80V2zN1UWGkuVK9COZQ0fvpbEoLIpAal
   Q==;
X-CSE-ConnectionGUID: ht98XkGBQY6EqYn9YDW8sw==
X-CSE-MsgGUID: Kn0dNVqpQ0iVgNBOPGT9kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="50384654"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="50384654"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 02:17:15 -0800
X-CSE-ConnectionGUID: K9LMqsj4Q7mbmGXT/NRsbw==
X-CSE-MsgGUID: W3GjvN1HRHaRNsSnv5DsXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="112782860"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 02:17:12 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 1CBDD120433;
	Mon, 10 Feb 2025 12:17:10 +0200 (EET)
Date: Mon, 10 Feb 2025 10:17:10 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: git@apitzsch.eu
Cc: Daniel Scally <djrscally@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] media: i2c: dw9719: Add of_match table
Message-ID: <Z6nSJstFmoykYhmn@kekkonen.localdomain>
References: <20250209-dw9761dts-v3-0-14d3f00f0585@apitzsch.eu>
 <20250209-dw9761dts-v3-2-14d3f00f0585@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250209-dw9761dts-v3-2-14d3f00f0585@apitzsch.eu>

Hi André,

On Sun, Feb 09, 2025 at 10:51:58PM +0100, André Apitzsch via B4 Relay wrote:
> +		.of_match_table = of_match_ptr(dw9719_of_table),

Please drop of_match_ptr(), that fixes the problem.

-- 
Sakari Ailus

