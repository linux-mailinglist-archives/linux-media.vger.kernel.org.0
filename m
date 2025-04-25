Return-Path: <linux-media+bounces-31043-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E231A9C3E5
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 11:39:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A2B861BC0C19
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 09:39:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AC7D23ED74;
	Fri, 25 Apr 2025 09:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jCKpVsbd"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2AC4221540
	for <linux-media@vger.kernel.org>; Fri, 25 Apr 2025 09:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745573695; cv=none; b=O6y5lTzcDjuZRyMvAEUbpfZqR+ERY/YD6ICmK5c+1bhN6rHv2n1rFg/7PZRDrL9dwOoNWBI1Xfglehp1uEvIKQ4X6kxvKqMJT22byR0JnAQVMe5RZXGkPwdnkkM1gzHn7uLNqHmXp1YMWSD3uPrXXDflo5xHEvZJaLW0GRNOWqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745573695; c=relaxed/simple;
	bh=HCpath3fZlY6nNosE0iMWryJ7GlrCzGx+VAZUqcLjDE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X5P11xn+9kBBnYk6rd1VIJrCCuLCh1iTkp/T6mzvB5ewUJhSLWEMZWVA49EHLTRPLwjvrGnLukRmRnaNpTe0YkoyeDUopcgakjhcC2NdW4x4X5Bq+V9ZigXH1ftDTNBsy9SeN91MbNHCFg8hnYmGSMBGyxpKQKjs4R1mdVryIaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jCKpVsbd; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745573694; x=1777109694;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=HCpath3fZlY6nNosE0iMWryJ7GlrCzGx+VAZUqcLjDE=;
  b=jCKpVsbdR7QFvkanMaE4XfLnGnqSKV4tg2SdVGYrufns2XVwCTbhD6E5
   Idxl+X8sasvS2FGmsUj1aBntjOKvVf4wClWcMj73CpLwkbo6WDTPyTZJi
   OyOR662Nd2i79argztsAS4pcHsZE3H59Cj9BUBR7RCMdGyMkpVLLQ+XYR
   U6HJ/kHXs0vXXaPZcA8B2MDS3JFWIvNqihUSs2nhOQtLzPyyt+WAV8smw
   pQcA9f41YDKcVhRJdyoE2IWWVYyJN6WeBWN3rhHfkGdB2yM+TNjQUKB7w
   7VseTSWtGZvuXLVrzULsrkmfy2zs8ekZfiKTPLeY38tgak8BdMtPA7ze1
   Q==;
X-CSE-ConnectionGUID: SD152XT8QXKsX7NuHw8vMg==
X-CSE-MsgGUID: hKu8riV5R3+dBYEIK2poWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="47115405"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="47115405"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 02:34:54 -0700
X-CSE-ConnectionGUID: 191l/cU7QQOWijCxgmsIDQ==
X-CSE-MsgGUID: SQpR2JUZS/6xhbwSzdLwJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="133389556"
Received: from reyongqi-mobl.ccr.corp.intel.com (HELO [10.238.225.6]) ([10.238.225.6])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 02:34:52 -0700
Message-ID: <4db38319-91d4-4f65-9db5-b8b78c40bc69@linux.intel.com>
Date: Fri, 25 Apr 2025 17:34:48 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: i2c: lt6911uxe: add two selects to Kconfig
To: Hans Verkuil <hverkuil@xs4all.nl>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Bingbu Cao <bingbu.cao@linux.intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>, "Yan, Dongcheng" <dongcheng.yan@intel.com>
References: <fb3799f7-8c32-4c17-8849-039a20ddf000@xs4all.nl>
Content-Language: en-US
From: "Yan, Dongcheng" <dongcheng.yan@linux.intel.com>
In-Reply-To: <fb3799f7-8c32-4c17-8849-039a20ddf000@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi bingbu,

Hans Verkuil has submitted a fix patch.
And I saw it has merged into linux-next:
<https://web.git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/media/i2c/Kconfig>

Thanks,
Dongcheng

On 3/19/2025 6:36 PM, Hans Verkuil wrote:
> In order to get the v4l2_subdev functions you need to select
> MEDIA_CONTROLLER and VIDEO_V4L2_SUBDEV_API.
> 
> Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202503151002.HacBN2LO-lkp@intel.com/
> Fixes: e49563c3be09 ("media: i2c: add lt6911uxe hdmi bridge driver")
> ---
>  drivers/media/i2c/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index b06365d02ef1..e45ba127069f 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -1152,6 +1152,8 @@ config VIDEO_LT6911UXE
>  	depends on ACPI && VIDEO_DEV && I2C
>  	select V4L2_FWNODE
>  	select V4L2_CCI_I2C
> +	select MEDIA_CONTROLLER
> +	select VIDEO_V4L2_SUBDEV_API
>  	help
>  	  This is a Video4Linux2 sensor-level driver for the Lontium
>  	  LT6911UXE HDMI to MIPI CSI-2 bridge.


