Return-Path: <linux-media+bounces-21236-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C735B9C369E
	for <lists+linux-media@lfdr.de>; Mon, 11 Nov 2024 03:42:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5FD6928133D
	for <lists+linux-media@lfdr.de>; Mon, 11 Nov 2024 02:42:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4875561FE9;
	Mon, 11 Nov 2024 02:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aP9AEvKW"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C04C8468;
	Mon, 11 Nov 2024 02:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731292914; cv=none; b=Sw4E14RVvbgnv5ojNZO9RvjwwT7ROWC5bTyL0FNMdN1fVtcB5mmQBQADUk8ZrWMc9wrmAaisqTzgBsnj90xXwHYOK4Q+37cBponaTPocFC+aI/vTIv3ibdv5eKPLYLhOyRaxRH3pd8rbRO/9o3eWXdpx317uJfqCQZxyy8VyIRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731292914; c=relaxed/simple;
	bh=HHFYb2FER9JAG78Shd2pKFUicpX2h1V8kbASvNwacL0=;
	h=Subject:From:To:Cc:References:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=VehANLa/+h4o6uN+ykr0IYBtyDDhfUOSQxEEmsWW6jVxdpVKdHzP2ekOh/rlmWAUGPXjgvhCipubmIKb1DM4A6+YOg1iFzyu4Gg6gZ+tm3RNg11DUYs902+u3eewZ+IrH0WJa8I4JNedFVAQ5XoDbkTOXq0gAYPrTEpmrBJtgqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aP9AEvKW; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731292913; x=1762828913;
  h=subject:from:to:cc:references:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=HHFYb2FER9JAG78Shd2pKFUicpX2h1V8kbASvNwacL0=;
  b=aP9AEvKWJkMziwRxyw/Z1TaZE1aj4r64RYKLCAZRtb0TGmOxDWHZf8Uy
   MjZgQz/axHDFwAwyvIOburUNLw5ZazaowEWO7LwmPr0AwFJkhh09nZQ3f
   VxTZ5jZT0YyHpbhlZOXY7UNAUd6vCF9ZYwSAc+dOK/wLWsPsotXqOG0Mp
   BCjqG3BPL0aVuE8qgndRfZOZ0x10QTbEvb/AKyz//jk3vEVtUBd0d4tUU
   TPUkchmAqP070ylo+PTQ8fj4QEqxIYs9ZbatRBoSJDsohTcFLrdR0DJiU
   +83ogDOKzybJ1Ki+kcbn7MmOvGlCbNYfJyp260B7zD5nh4diSoydofIga
   w==;
X-CSE-ConnectionGUID: qPEn4zayQBymq+UBduWRwg==
X-CSE-MsgGUID: A2KSE78sQ7CZ3ZojUOAw8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31253422"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31253422"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2024 18:41:53 -0800
X-CSE-ConnectionGUID: OH+aYG99REKy4HRyfp4FTw==
X-CSE-MsgGUID: Kcl13c+0RL23zY/JvxvdlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="86643883"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.136]) ([10.238.232.136])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2024 18:41:51 -0800
Subject: Re: [PATCH -next] media: ipu6: Remove duplicated include in
 ipu6-dma.h
From: Bingbu Cao <bingbu.cao@linux.intel.com>
To: Yang Li <yang.lee@linux.alibaba.com>, sakari.ailus@linux.intel.com,
 bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Abaci Robot <abaci@linux.alibaba.com>
References: <20241111015659.86760-1-yang.lee@linux.alibaba.com>
 <67c23810-259b-fc0a-2792-eecdbbcc292e@linux.intel.com>
Message-ID: <0d546a5b-b56b-359c-5dae-4cb1cfd0f535@linux.intel.com>
Date: Mon, 11 Nov 2024 10:38:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <67c23810-259b-fc0a-2792-eecdbbcc292e@linux.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit


On 11/11/24 10:12 AM, Bingbu Cao wrote:
> Li,
> 
> Thanks for the patch.
> 
> On 11/11/24 9:56 AM, Yang Li wrote:
>> The header files linux/iova.h is included twice in ipu6-dma.h,
>> so one inclusion of each can be removed.
>>
>> ./drivers/media/pci/intel/ipu6/ipu6-dma.h: linux/iova.h is included more
>> than once.
>>
>> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
>> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=11791
> 
> It'd better to add:
> Fixes: 799d91fd3fe0 ("media: ipu6: not override the dma_ops of device in driver")

Oops, I just noticed the commit above is on the road...
You can correct the hash after it is applied.

> 
>> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
>> ---
>>  drivers/media/pci/intel/ipu6/ipu6-dma.h | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/media/pci/intel/ipu6/ipu6-dma.h b/drivers/media/pci/intel/ipu6/ipu6-dma.h
>> index b51244add9e6..a902eec5c07a 100644
>> --- a/drivers/media/pci/intel/ipu6/ipu6-dma.h
>> +++ b/drivers/media/pci/intel/ipu6/ipu6-dma.h
>> @@ -7,7 +7,6 @@
>>  #include <linux/dma-map-ops.h>
>>  #include <linux/dma-mapping.h>
>>  #include <linux/iova.h>
>> -#include <linux/iova.h>
>>  #include <linux/scatterlist.h>
>>  #include <linux/types.h>
>>  
>>
> 
> Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>
> 
> 

-- 
Best regards,
Bingbu Cao

