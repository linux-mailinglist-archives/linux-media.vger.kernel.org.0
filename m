Return-Path: <linux-media+bounces-30979-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41682A9BEB3
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 08:34:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 885DE4A1762
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 06:34:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 358BF22D4C9;
	Fri, 25 Apr 2025 06:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PNoGGhpx"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB1E197A76
	for <linux-media@vger.kernel.org>; Fri, 25 Apr 2025 06:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745562843; cv=none; b=j4x1nrzjUY7hF6+6WSaHQjbnzDm6EMQTiWXN0f2psJp1lBptzGJOYHutBqM83JKDwd9/B7isQN5SvPImdJi3zqWnZz+MdfU4zZEt85jvzosHzymECi7ON51GayzTrHuqKIYVlOTK2GsFwge+m+0Fi/MkBDR0/PiHPOZG2N4RNIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745562843; c=relaxed/simple;
	bh=+rPS0BEaC2G/5283raC8IBV3xdgj6UOBV7VnJGWkXE8=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=oPxe52dD7LTp8mfnhSVfagnvoULLQtURs9jnBAjQiK5IVwnVq7adRyFT/6e1yhky6+XrQRtWINrgGxwvaH69oDjWtYTBR2SzzJqKgEyiJilb51s50E53VXRBGVQAGjuZ4GruZxsRk5T5jVTivEy8gbSuALvlKRYwrPVtXSVrfjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PNoGGhpx; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745562842; x=1777098842;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=+rPS0BEaC2G/5283raC8IBV3xdgj6UOBV7VnJGWkXE8=;
  b=PNoGGhpx0RXEt7y+i02tHZhI3NXLF8mx4pbAyH8id8t29xV4r7eTECcO
   xS4F134PPR+86+ynTbxWfL39MNRp/sZVAP7rW8RrR3i1JouiWcoRXA47p
   l8aPq9mSGBwa8GHxl0E2J+ViiHXEpElEJaCJP72bZT35uBYGwCxgmNCMi
   0mJHd0VYsM9XOY8aVf0mq7CoDLaviG64FqI83hcGO30EiEECpqnl/0V/U
   a9XHYMtB0muW2GqOcbwGGAir5+BIscTrIxETAmmAP31IaEkj+WtLVpW/5
   HrXi5lhlg2P+8g7Ab0pko9zoLkHQUvNsjI/YurWlaMELTNIWA6umYHy1/
   A==;
X-CSE-ConnectionGUID: n8rnigCMQ0uhy+bWdi5NVw==
X-CSE-MsgGUID: 6NWDfKrjTJC91SaWP+vxlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="57862324"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="57862324"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 23:34:01 -0700
X-CSE-ConnectionGUID: r7AgiomcRoaFOU+g1ZnDaw==
X-CSE-MsgGUID: Z1RlVvoFQs2x913o9ocgAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="132711707"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.136]) ([10.238.232.136])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 23:33:59 -0700
Subject: Re: [PATCH] media: ipu6: Remove workaround for Meteor Lake ES2
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Hao Yao <hao.yao@intel.com>
Cc: Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
References: <20250311084203.516205-1-hao.yao@intel.com>
 <f8fd0fd4-ca0c-12b5-acc6-ba846b2c9987@linux.intel.com>
 <aAomsUA01Sm5vo1x@kekkonen.localdomain>
 <fb923201-e49c-e61a-bbdf-e67744f2ea6c@linux.intel.com>
 <aAsgQjNEacme1NZU@kekkonen.localdomain>
 <badce13d-bded-4e50-89f5-74538b2c44f7@intel.com>
 <aAsr_vXdOpKEs3B-@kekkonen.localdomain>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <c40f471f-89ec-f5cc-040c-4d76a333f85b@linux.intel.com>
Date: Fri, 25 Apr 2025 14:29:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <aAsr_vXdOpKEs3B-@kekkonen.localdomain>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit


On 4/25/25 2:30 PM, Sakari Ailus wrote:
> On Fri, Apr 25, 2025 at 02:28:12PM +0800, Hao Yao wrote:
>> Hi Sakari, Bingbu,
>>
>> On 2025/4/25 13:40, Sakari Ailus wrote:
>>> Hi Bingbu,
>>>
>>> On Fri, Apr 25, 2025 at 11:05:54AM +0800, Bingbu Cao wrote:
>>>> Sakari,
>>>>
>>>> On 4/24/25 7:55 PM, Sakari Ailus wrote:
>>>>> Hi Bingbu,
>>>>>
>>>>> On Thu, Apr 24, 2025 at 12:18:06PM +0800, Bingbu Cao wrote:
>>>>>> Hao,
>>>>>>
>>>>>> On 3/11/25 4:41 PM, Hao Yao wrote:
>>>>>>> There was a hardware bug which need IPU6 driver to disable the ATS.
>>>>>>> This workaround is not needed anymore as the bug was fixed in
>>>>>>> hardware level.
>>>>>>>
>>>>>>
>>>>>> It is better to send v2 with fixes tag here:
>>>>>>
>>>>>> Fixes: 25fedc021985 ("media: intel/ipu6: add Intel IPU6 PCI device driver")
>>>>>
>>>>> Is this worth backporting? Nothing is broken because of this, is it?
>>>>
>>>> It is necessary. IPU6 on Raptor Lake share same device ID with
>>>> Meteor Lake, this workaround will break camera on Raptor Lake.
>>>>
>>>> And Meteor Lake ES2 is not used in product.
>>>
>>> Ok, this should be visible in the commit message.
>>>
>>> How about adding:
>>>
>>> Additionally, Raptor Lake has the same IPU6 PCI ID and x86 stepping and but
>>> does have the bug. Removing the Meteor Lake workaround is also required for
>>> the driver to function on Raptor Lake.
>>>
>> In fact it should be Arrow Lake. I will add below to next version:
>> ---
>>  Additionally, Arrow Lake has the same IPU6 PCI ID and x86 stepping
>>
>>  but does not have the bug. Removing the Meteor Lake workaround is
>>
>>  also required for the driver to function on Arrow Lake.
>>
>>
>>  Fixes: 25fedc021985 ("media: intel/ipu6: add Intel IPU6 PCI device
>>
>>  driver")
>> ---
> 
> I can just take it from here, no need to resed.

Thanks!

-- 
Best regards,
Bingbu Cao

