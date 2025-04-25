Return-Path: <linux-media+bounces-31044-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D8EACA9C3FA
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 11:41:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E1D79C2029
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 09:40:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAB6F23958F;
	Fri, 25 Apr 2025 09:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QyrdYj51"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3FF2367BB
	for <linux-media@vger.kernel.org>; Fri, 25 Apr 2025 09:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745573925; cv=none; b=q7NPgjCzeYlcAgAceZ88QqZldxpKKi7xuA62wtPAagM9K3XeLN5SEq5LlT1LAas80tSoOidN62MsdWW0nNbmDrKN9eYWoHSY8zMhr+iOp4czCX7lptKGPza1bYXbZJtOpCAi7kHd6jxDQBbBQ1iRs921O73pi8CImpEX0xSArBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745573925; c=relaxed/simple;
	bh=1be4tZF1amScyhLZgg3u6Ezo7Aq1qe3uv6pvtN83tfU=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=ca271WKr6cYxImQ/gPjG00pBs3OR2dEiqSetXnUT/J9SCkGEHIixEUupTcJuSOPNpNZxV6VSV2qoTOnZc8TqJ29dK16AsSmP8Ec0jPfdtlk38KcVyuxkGoiMivNPCQ/voZ5TN9YlFgOqzcnvdAuu4ApXLpHuX0xNHo8dF/Fdz9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QyrdYj51; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745573923; x=1777109923;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=1be4tZF1amScyhLZgg3u6Ezo7Aq1qe3uv6pvtN83tfU=;
  b=QyrdYj51xRd5AAAT79snV6g6/piSw0QFSwaDUIXizgVsc0lDn0Cb0UoP
   al9HXNz/a8fgll60DwA7xRK6PbqDeCzTD3kaib4pTwFp02R/o0H51mjhw
   A0K8T/RVaCwcGU2joKsedt80qzKJDk2M6vCf7UnsCdf76Dj6V7ND+pGRl
   i6AInWuaelmQPrEQmdTeQ8kX577TiG38C7Q6SoJm0WMwZRTowXEwKWrUj
   eIl/zs5teFbzk5owdigzXLSFv6zNwJff7UwzOwVUkSXeFc4SE6NxRzrgB
   zCGLmSjde3VfLuKD9aR8LBAw9p7RKuRl243Cw557qNimSCTlNNthnVpMR
   g==;
X-CSE-ConnectionGUID: s3J8NM7QTkm7UGrRbPJwGg==
X-CSE-MsgGUID: p6CovouVRmuZfXhhDQJy/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="49888433"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="49888433"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 02:38:42 -0700
X-CSE-ConnectionGUID: p3ZNzS2NSWyX5Gq9fXvkRA==
X-CSE-MsgGUID: NZ7GZGONQ+ab/YLJKYVfvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="133169802"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.136]) ([10.238.232.136])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 02:38:41 -0700
Subject: Re: [PATCH] media: i2c: lt6911uxe: add two selects to Kconfig
To: "Yan, Dongcheng" <dongcheng.yan@linux.intel.com>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, "Yan, Dongcheng" <dongcheng.yan@intel.com>
References: <fb3799f7-8c32-4c17-8849-039a20ddf000@xs4all.nl>
 <4db38319-91d4-4f65-9db5-b8b78c40bc69@linux.intel.com>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <c0bec120-5293-29ea-6de8-92f731a1a584@linux.intel.com>
Date: Fri, 25 Apr 2025 17:34:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <4db38319-91d4-4f65-9db5-b8b78c40bc69@linux.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit


On 4/25/25 5:34 PM, Yan, Dongcheng wrote:
> Hi bingbu,
> 
> Hans Verkuil has submitted a fix patch.
> And I saw it has merged into linux-next:
> <https://web.git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/media/i2c/Kconfig>

Ack, thanks.

> 
> Thanks,
> Dongcheng
> 
> On 3/19/2025 6:36 PM, Hans Verkuil wrote:
>> In order to get the v4l2_subdev functions you need to select
>> MEDIA_CONTROLLER and VIDEO_V4L2_SUBDEV_API.
>>
>> Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202503151002.HacBN2LO-lkp@intel.com/
>> Fixes: e49563c3be09 ("media: i2c: add lt6911uxe hdmi bridge driver")
>> ---
>>  drivers/media/i2c/Kconfig | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
>> index b06365d02ef1..e45ba127069f 100644
>> --- a/drivers/media/i2c/Kconfig
>> +++ b/drivers/media/i2c/Kconfig
>> @@ -1152,6 +1152,8 @@ config VIDEO_LT6911UXE
>>  	depends on ACPI && VIDEO_DEV && I2C
>>  	select V4L2_FWNODE
>>  	select V4L2_CCI_I2C
>> +	select MEDIA_CONTROLLER
>> +	select VIDEO_V4L2_SUBDEV_API
>>  	help
>>  	  This is a Video4Linux2 sensor-level driver for the Lontium
>>  	  LT6911UXE HDMI to MIPI CSI-2 bridge.
> 

-- 
Best regards,
Bingbu Cao

