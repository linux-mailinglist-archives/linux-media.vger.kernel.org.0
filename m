Return-Path: <linux-media+bounces-28266-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1099CA61D5E
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 21:57:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B41A3BCCAE
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 20:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 490FF1C84B4;
	Fri, 14 Mar 2025 20:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ghYmiEkJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A8C18E756;
	Fri, 14 Mar 2025 20:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741985859; cv=none; b=Q+UMduLZADXY9LawcWUW23Y78EOShVbobwddsVX6RplHPd00ouwL3UuOirSKcIh5ZAkI/dL7qCtYllqePwXqJqqc3Kv58kf2yu7eQeKfSeEieZVGL8OnjuUbbG13BH0l4G8FoUj/KHXVWQRGEoKTgQJ0LsGmejSKVSJgsKPZHl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741985859; c=relaxed/simple;
	bh=j781fFqLGV5IZKM4oQ3qsgK08fIYHDIRWP9xGNBmhM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PNZroZ+N+qY9WmE6fAF0MCQ3U5h+Z6mUceyeY9JU9qZLniZFj+rQQGbDWrS7iyByv2aOGIm5B7McCqlzHeQJNOs1N+gCgxy5oVWaO8wmoBoV88wD1YCOjtyMxhP8N80rzpmHw0KlQC4nbMgtBlrNwFyP4PRQkx9/EoS+QCr1c3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ghYmiEkJ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741985858; x=1773521858;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=j781fFqLGV5IZKM4oQ3qsgK08fIYHDIRWP9xGNBmhM8=;
  b=ghYmiEkJ09LT7WR8MV97Mulp2m90bls+pQI4N/EmF73E542hBr6WhYM5
   1EOtvyOQmp5SxlWGEU3qAvV+vaCSRjB4i2Dwatm86BtRCbdpFDdKsAjgU
   CZRezHDkDmMyhrYHmRN/0P/m/9mWWfW8+Hrl/1uww1p0T+SQWvs5h6JhL
   Hd+toJ8j9zNzEoqBpqM9c89MgmxubnVDdgfjk7y2SXw1GLnnfn+pYs8ZJ
   4u32kaPzXHR3in7ub13XLnqEyAG5Ss805oowtUfmIW0yUREKZZD/QD3rr
   5c5XnuH5ZkRZQ+DWIFLAf8l5tqn57/hGxgxMrYVPodxNmhzylbBXFaoEV
   Q==;
X-CSE-ConnectionGUID: lL6B3YuuQRydsNTHtZbVKQ==
X-CSE-MsgGUID: mIFk/nWcQAi8OvlFZt1G2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="60695394"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="60695394"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 13:57:38 -0700
X-CSE-ConnectionGUID: DkqhZqCcQmCDZ7JeDDLWpg==
X-CSE-MsgGUID: zPD6lZDpQAGsMRHh02vZUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="121422228"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 13:57:31 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 8B13511F944;
	Fri, 14 Mar 2025 22:57:28 +0200 (EET)
Date: Fri, 14 Mar 2025 20:57:28 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: david@ixit.cz
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Pavel Machek <pavel@ucw.cz>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: dt-bindings: Convert Analog Devices ad5820 to
 DT schema
Message-ID: <Z9SYOCVxt70u_bad@kekkonen.localdomain>
References: <20250314-b4-ad5820-dt-yaml-v2-1-287958c3c07c@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250314-b4-ad5820-dt-yaml-v2-1-287958c3c07c@ixit.cz>

Hi David,

Thanks for converting this to YAML.

On Fri, Mar 14, 2025 at 08:58:27PM +0100, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Convert the Analog Devices ad5820 to DT schema format.
> 
> Add the previously undocumented io-channel-cells property,
> which can be omitted. If present, it must be set to 0,
> as the device provides only one channel.

What's the purpose of this property? The driver doesn't use it nor I think
it provides any information on the hardware either. The above description
also appears to be saying it's redundant.

-- 
Kind regards,

Sakari Ailus

