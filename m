Return-Path: <linux-media+bounces-36631-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DED16AF6881
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 05:10:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 372E13B80B7
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 03:09:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C53BA227EA4;
	Thu,  3 Jul 2025 03:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YlsK1hfI"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F1E221DAE;
	Thu,  3 Jul 2025 03:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751512193; cv=none; b=Y+qSZ8igD1ePOGNpn64vONw8lu2f+oFQTyOd6dDZkk3Nad/V48VycsKzWUnropXOcRWEKlcPjd8l6drq6AWOZdCYgmP/anLs79Ms/jO0/uQ/PGRNwJrRSOwI6sjGbQpzDSlcnI21ySitzZEqWmqvBeFtqfijle5yvd1Rn0Q1ivM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751512193; c=relaxed/simple;
	bh=qm2WXy2hNVsbg5j8TFhnxKErU4QV+ayR9DuA7+uohEM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D16OhZGFkWJiMhcTHhZGy/ZwRyu0GrMHz0/vsa2PT+cuEB9u+reOCvi2esrI5sZdwb7H+IN8Qa15crZ/7CUWG5663GDItowqxOZruT6VRM8i3OMcZYOR6n1BNnr+o0gPJ+cceAp8CrsAO1vZWntbFRfJMXQPArJ3AEfRURfp4q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YlsK1hfI; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751512192; x=1783048192;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=qm2WXy2hNVsbg5j8TFhnxKErU4QV+ayR9DuA7+uohEM=;
  b=YlsK1hfI8zeXMW44+u4IPf7ZZiR4d2v33yttsjxHhtq50yy8k1+f4dMS
   tFOj2W5yMDPm5fEEFXt7fCCVLBDutpQcId3FTX+aBUyLVJZgR7qZ9bNae
   csZF3gAh6BVKUF7pAAxKbxkXxVsUW9QYBCOU0qywyKEzV5WNMcjbNdwhi
   EOC0+65l7hvLBaWJyh4dtjHoZjJSEfhGW2ZjTy41ugjE5Q3TM3qnFAvox
   q+qlKxEywjFXiMXHcaADEoXwm0SVZ8VCK3GeLjnyShs4H5ZaetuQBtEMn
   myPgpdgE29GHE+znHq+AcG1B7eP2B+U/elEglhI1clqAwdFRbXLdoDqsx
   w==;
X-CSE-ConnectionGUID: l1u/O2zgRbOyvOXmgIA4Ow==
X-CSE-MsgGUID: oABfhrbFRGqLyz0uU7WJvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="64070530"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="64070530"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 20:09:51 -0700
X-CSE-ConnectionGUID: GHXfC61hTGKo4Bt9tVFXvw==
X-CSE-MsgGUID: Bt78+uxSS2mxxHakKW1JSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="191414429"
Received: from unknown (HELO [10.238.224.237]) ([10.238.224.237])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 20:09:48 -0700
Message-ID: <7297f080-313b-46f2-93b7-ea7791b09c66@intel.com>
Date: Thu, 3 Jul 2025 11:09:45 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] platform/x86: int3472: add hpd pin support
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 LKML <linux-kernel@vger.kernel.org>, linux-media@vger.kernel.org,
 hverkuil@xs4all.nl, Hans de Goede <hdegoede@redhat.com>,
 u.kleine-koenig@baylibre.com, ricardo.ribalda@gmail.com,
 bingbu.cao@linux.intel.com, stable@vger.kernel.org,
 dongcheng.yan@linux.intel.com, hao.yao@intel.com
References: <20250425104331.3165876-1-dongcheng.yan@intel.com>
 <5a04f105-3075-3226-6ad6-f2c3f31b29da@linux.intel.com>
 <116ea6fa-e9b8-4c28-bc31-f4d1589eb34b@intel.com>
 <aGUPsDglThYGc/3g@svinhufvud> <aGUcqmCwmIM3sRiB@smile.fi.intel.com>
Content-Language: en-US
From: "Yan, Dongcheng" <dongcheng.yan@intel.com>
In-Reply-To: <aGUcqmCwmIM3sRiB@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andy,

On 7/2/2025 7:48 PM, Andy Shevchenko wrote:
> On Wed, Jul 02, 2025 at 01:53:36PM +0300, Sakari Ailus wrote:
>> On Wed, Jul 02, 2025 at 06:23:19PM +0800, Yan, Dongcheng wrote:
>>> On 7/2/2025 6:19 PM, Ilpo Järvinen wrote:
>>>> On Fri, 25 Apr 2025, Dongcheng Yan wrote:
> 
> ...
> 
>>>> I was informed about existance of this patch through an off-band channel 
>>>> (as I was not among receipients). In future, please include all relevant 
>>>> maintainers and MLs as receipients as indicated by 
>>>> scripts/get_maintainers.pl.
>>
>> Hans used to handle these previously and I think that's why you weren't
>> cc'd.
> 
> There are two maintainers of this subsystem and both should be included, no?

I'm sorry that I didn't even know the rules of to/cc before this. I just
choose some of maintainers randomly indicated by get_maintainers.pl as
"to" and choose some as "cc". I will read the document carefully to
avoid such problems from happening again.

> At least I have my own script [1] to send patches and it gives a good heuristics
> of who to include and not. I believe it might give better result then I don't
> know how derived Cc list in this series.
> 
> [1]: https://github.com/andy-shev/home-bin-tools/blob/master/ge2maintainer.sh
> 
good script to me, give a try next time.

Thanks,
Dongcheng

