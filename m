Return-Path: <linux-media+bounces-30972-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D88A9BD28
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 05:10:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A0A81BA27A2
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 03:10:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD1D017A310;
	Fri, 25 Apr 2025 03:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hxkDE2ZS"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C522701AE
	for <linux-media@vger.kernel.org>; Fri, 25 Apr 2025 03:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745550619; cv=none; b=FYBx0fctk0JmnjC714g/ruCLv4n5dj7x0Q9fJDPDESyS2JDdZ1tzgvLZvAxwtoX9Le8JbGh4+B5lWYJmuoYftf4GWshRUupz0yHSS05ECuO6cjCOoagPD9coLuu/8IaEWOQ6PYebhB/MbS0hSTy4jIehj4WPIxKPQnDcV7o8f64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745550619; c=relaxed/simple;
	bh=Qg6wRbwtFvS9IgM3zYxIqwTMtSdNRpNuio3uP16d5GA=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=SIKrzBGzkV6m7rGscv4Fxj7xnKCrYV0HAuKuCjEZKZokSYenJLBtkjXio2EkB6A51ddSeMn5vyWwkjPSA5eQUNbFU+OeO9wMnm8pTbPe7haqx1B3/do0D5IGkwX1+jTRQlGvsfmqRmqhQmi3JjrDKj5rdKj+4Litpb0CCEnr/CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hxkDE2ZS; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745550618; x=1777086618;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=Qg6wRbwtFvS9IgM3zYxIqwTMtSdNRpNuio3uP16d5GA=;
  b=hxkDE2ZSj2Q3l//dPZjgZJj0EeUFVy1tgMOyaQ8lne4/MZSTtnPD791i
   Vm3OVX3VeqGcPZ4HlmpTXNGO1G8EoPSqsfHoDpDMbJLNvaB2xC/9wARsw
   oElb0qOjEc5YSMOfsZ8HmRYdJj4EuI7F/emgup6P/u6+UxVLFlH93LcmE
   N/UsEiqDGOFBi3VWlEKckH03tbvl8iO6wYqchabgmdTVF2ce4hzeGBSo7
   Ipl9Q0K+j2u3ONoZthiCycrdJoYUhte1EpphsEz3oD2d5LJGxU5UgTqbe
   aDZGW2UtpDT2X6QAVSDd4yJ3qKkvhd3sM9w68kpsG7AnMbw7HcCNrgKII
   g==;
X-CSE-ConnectionGUID: rYrsWaGUR6mSzh7KkGD1Og==
X-CSE-MsgGUID: l/jMeLj1SzSbOROvXBgfug==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="47341323"
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; 
   d="scan'208";a="47341323"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 20:10:17 -0700
X-CSE-ConnectionGUID: tO+3jHyURh696RbSRTuH+g==
X-CSE-MsgGUID: 82IiDghSQmWCEalhCp0W2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; 
   d="scan'208";a="133102092"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.136]) ([10.238.232.136])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 20:10:15 -0700
Subject: Re: [PATCH] media: ipu6: Remove workaround for Meteor Lake ES2
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hao Yao <hao.yao@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
 Tianshu Qiu <tian.shu.qiu@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
References: <20250311084203.516205-1-hao.yao@intel.com>
 <f8fd0fd4-ca0c-12b5-acc6-ba846b2c9987@linux.intel.com>
 <aAomsUA01Sm5vo1x@kekkonen.localdomain>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <fb923201-e49c-e61a-bbdf-e67744f2ea6c@linux.intel.com>
Date: Fri, 25 Apr 2025 11:05:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <aAomsUA01Sm5vo1x@kekkonen.localdomain>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Sakari,

On 4/24/25 7:55 PM, Sakari Ailus wrote:
> Hi Bingbu,
> 
> On Thu, Apr 24, 2025 at 12:18:06PM +0800, Bingbu Cao wrote:
>> Hao,
>>
>> On 3/11/25 4:41 PM, Hao Yao wrote:
>>> There was a hardware bug which need IPU6 driver to disable the ATS.
>>> This workaround is not needed anymore as the bug was fixed in
>>> hardware level.
>>>
>>
>> It is better to send v2 with fixes tag here:
>>
>> Fixes: 25fedc021985 ("media: intel/ipu6: add Intel IPU6 PCI device driver")
> 
> Is this worth backporting? Nothing is broken because of this, is it?

It is necessary. IPU6 on Raptor Lake share same device ID with
Meteor Lake, this workaround will break camera on Raptor Lake.

And Meteor Lake ES2 is not used in product.

> 
>>
>>> Signed-off-by: Hao Yao <hao.yao@intel.com>
>>> ---
>>>  drivers/media/pci/intel/ipu6/ipu6.c | 5 -----
>>>  1 file changed, 5 deletions(-)
>>>
>>> diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
>>> index 277af7cda8ee..b00d0705fefa 100644
>>> --- a/drivers/media/pci/intel/ipu6/ipu6.c
>>> +++ b/drivers/media/pci/intel/ipu6/ipu6.c
>>> @@ -464,11 +464,6 @@ static int ipu6_pci_config_setup(struct pci_dev *dev, u8 hw_ver)
>>>  {
>>>  	int ret;
>>>  
>>> -	/* disable IPU6 PCI ATS on mtl ES2 */
>>> -	if (is_ipu6ep_mtl(hw_ver) && boot_cpu_data.x86_stepping == 0x2 &&
>>> -	    pci_ats_supported(dev))
>>> -		pci_disable_ats(dev);
>>> -
>>>  	/* No PCI msi capability for IPU6EP */
>>>  	if (is_ipu6ep(hw_ver) || is_ipu6ep_mtl(hw_ver)) {
>>>  		/* likely do nothing as msi not enabled by default */
>>>
>>
> 

-- 
Best regards,
Bingbu Cao

