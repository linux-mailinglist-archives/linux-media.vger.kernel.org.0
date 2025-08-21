Return-Path: <linux-media+bounces-40536-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 460C5B2F1EF
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 10:34:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B55C1CE0E0E
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 08:28:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFC472FAC12;
	Thu, 21 Aug 2025 08:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OWIRvOsA"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DE42F8BF6;
	Thu, 21 Aug 2025 08:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755764570; cv=none; b=mt8wi2ESsNYQcdm7BgOyOUaJeBIGGalgDyL2idKDxYyF6WnI51Ha/xh1/xfun6plBn62wMT9qJgtkfulf9De+UMUx780s4yKeIcgcbdlINN1taq2ASAoAz8ntt5xxhP2MiRGgvzVgq+uKhD5S7CkOsxz/NaKkmBCtRcDZda/Nps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755764570; c=relaxed/simple;
	bh=jl66qkhytpx2tvvjkuzSn+lnNRwcU8wt+ThHAwnzhXM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CScUytgQ9x0znr3/nu2f3IgNH5z5UlCJZRw1Z2Ij+BfzAZSrGalBhUDLpgPBN76pq0zjytCnD4zymi0A/9sjfegKlKT2jbIa+sPPGsF7GioipMUO2WsGYLbsE+Tpz7UQOSJkG6bB7Dsj7Nzbj45HA3OC1t99qia5BetHslsJN1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OWIRvOsA; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755764569; x=1787300569;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=jl66qkhytpx2tvvjkuzSn+lnNRwcU8wt+ThHAwnzhXM=;
  b=OWIRvOsAKyi9fG0N/hqLNVNN4gsD8g/dVaAH2W5R9+khSgqKauQYuMjW
   hpcGLr+ttQQjjAlrsV5N4a1SlQsOgHNJ1OPAzgzFjUr8in1pWEmve3j2H
   y4lj7w7G7tCD0q0Lx1Z4bM5KQi41uhKNwd8bf4ax+BGgECOsv+R/EIPbj
   ISX/ayoDxarBAORMVHb874CXGpKKFwP7jCXwojKJxGI4DSqvDjy/tDpPB
   pDgX2wOODM30AwTCwiYE2ho5vOvN132506RmhHuojRNWAsNHl/YcxlQbO
   ZMqvHQReObI6l8/mTepVRfNJwHdiIJCqpg/y5q5RqNJGuqMKtW3Uv1wTe
   w==;
X-CSE-ConnectionGUID: Lrq671CsQOKyEG2ISVtcQQ==
X-CSE-MsgGUID: GTzoV07wTTaRGXtMM8Quew==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="69147491"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="69147491"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 01:22:48 -0700
X-CSE-ConnectionGUID: wQJ732ugTvyBT/8jJ9Bm7A==
X-CSE-MsgGUID: UAwnlR43TjyfObU0u1hEhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="167578528"
Received: from mnyman-desk.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orviesa010.jf.intel.com with ESMTP; 21 Aug 2025 01:22:45 -0700
Message-ID: <c71346f9-741f-4b73-a6e4-59b465ee39af@linux.intel.com>
Date: Thu, 21 Aug 2025 11:22:43 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/9] usb: xhci: Use usb_endpoint_max_periodic_payload()
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-usb@vger.kernel.org
Cc: linux-media@vger.kernel.org, gregkh@linuxfoundation.org,
 laurent.pinchart@ideasonboard.com, hdegoede@redhat.com,
 Thinh.Nguyen@synopsys.com, Amardeep Rai <amardeep.rai@intel.com>,
 Kannappan R <r.kannappan@intel.com>, Alan Stern <stern@rowland.harvard.edu>,
 =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>
References: <20250820143824.551777-1-sakari.ailus@linux.intel.com>
 <20250820143824.551777-6-sakari.ailus@linux.intel.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20250820143824.551777-6-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20.8.2025 17.38, Sakari Ailus wrote:
> Use the newly added usb_endpoint_max_periodic_payload() to obtain the
> maximum number of bytes to transfer during a service interval for
> isochronous and interrupt endpoints. This will replace the xhci-specific
> xhci_get_max_esit_payload() which is removed as redundant.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Mathias Nyman <mathias.nyman@linux.intel.com>


