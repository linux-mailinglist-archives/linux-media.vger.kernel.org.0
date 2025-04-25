Return-Path: <linux-media+bounces-31054-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EC9A9C65B
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 12:56:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0A819C4301
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 10:54:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 531EF23ED74;
	Fri, 25 Apr 2025 10:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hpwn17Ns"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C644438B;
	Fri, 25 Apr 2025 10:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745578455; cv=none; b=pUNqCR2dn53t712PBlyghhuSZ2exSCZFHDUH9dYpKoQLUgu8wOue2VM/ne6d6Kr+EnCK1xoeHa/uObDLtwQhrbchic9XYJawrsO0tpkSJiJs+pkJZAYrMZiettt03pBD67ORZs2WKgR9TqxCdCcaW8d3qWRrBjJPftSujAfTZSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745578455; c=relaxed/simple;
	bh=Q1UpatpvFGBLzYGAyyXZ93HJKBvu4YFVvySAmdpewO4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UnA/HAfcxOUOCJ8F02OLKaAluqXVuUA3jDzfA8coZ/zR507/auAg/JOpEuXTuSh7K4fekWW8Z/YjWJfuX56mT77ErQJem1omTTcrthxkKLiG32qrYoqwFh6MrAwwQr8EKeFGfBcqqarr6DKas+zAHXk6/3+PWSUwRMCFI1ZTa08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hpwn17Ns; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745578454; x=1777114454;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Q1UpatpvFGBLzYGAyyXZ93HJKBvu4YFVvySAmdpewO4=;
  b=Hpwn17Ns8VnsVqiI69GEdfw24UeQ0bO3VBhpFqOW3nNApRc/j5uEbasp
   yXpvS1lJkGmDuG4VOgng3sUyqPaJ2LZRMfn8X3T/5xPxKpdMrthMHLFE4
   kW78Z1rmUZNCnhoejH0c8yMPKTpnImXrwPQBHiQQGYZ/hrRgOJtq7jHS8
   CD2c0ZbtXWxWrcq6N+7NztQ+H4uz8VcyAyN2VLst01Q5dQKc8jKddaZTO
   xU/JJ7TGY3CZudWB1L4E7YB+4iNxu+teYDPbz2kyWqRCwh5Ofntyst85c
   GB1qt5uzKRFvakKv5U/rXSf5FbQrNtrhqlGc+gWwSRMtGhUGXHJTiKlDb
   w==;
X-CSE-ConnectionGUID: KUfNXON1TiqvDzZ9XW5GPw==
X-CSE-MsgGUID: wEAUD2K4T9ChAF9EUVU/0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="58609255"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="58609255"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 03:54:13 -0700
X-CSE-ConnectionGUID: G7QNP++rQ4GJv/RsJIXUWg==
X-CSE-MsgGUID: tRlSAd2RSoK//IUddIVdDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="133403841"
Received: from reyongqi-mobl.ccr.corp.intel.com (HELO [10.238.225.6]) ([10.238.225.6])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 03:54:09 -0700
Message-ID: <3da17cf1-f489-42af-aef5-a7a9f800fe17@linux.intel.com>
Date: Fri, 25 Apr 2025 18:54:06 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] platform/x86: int3472: add hpd pin support
To: Dongcheng Yan <dongcheng.yan@intel.com>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
 hverkuil@xs4all.nl, andriy.shevchenko@linux.intel.com, hdegoede@redhat.com,
 u.kleine-koenig@baylibre.com, ricardo.ribalda@gmail.com,
 bingbu.cao@linux.intel.com
Cc: stable@vger.kernel.org, hao.yao@intel.com
References: <20250425104331.3165876-1-dongcheng.yan@intel.com>
Content-Language: en-US
From: "Yan, Dongcheng" <dongcheng.yan@linux.intel.com>
In-Reply-To: <20250425104331.3165876-1-dongcheng.yan@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi reviewers,

I'm sorry for that I forget to rm cc:stable@vger.kernel.org in maillist

Best Regards,
Dongcheng

On 4/25/2025 6:43 PM, Dongcheng Yan wrote:
> Typically HDMI to MIPI CSI-2 bridges have a pin to signal image data is
> being received. On the host side this is wired to a GPIO for polling or
> interrupts. This includes the Lontium HDMI to MIPI CSI-2 bridges
> lt6911uxe and lt6911uxc.
> 
> The GPIO "hpd" is used already by other HDMI to CSI-2 bridges, use it
> here as well.
> 
> Signed-off-by: Dongcheng Yan <dongcheng.yan@intel.com>
> ---
>  drivers/platform/x86/intel/int3472/common.h   | 1 +
>  drivers/platform/x86/intel/int3472/discrete.c | 6 ++++++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/int3472/common.h b/drivers/platform/x86/intel/int3472/common.h
> index 51b818e62a25..4593d567caf4 100644
> --- a/drivers/platform/x86/intel/int3472/common.h
> +++ b/drivers/platform/x86/intel/int3472/common.h
> @@ -23,6 +23,7 @@
>  #define INT3472_GPIO_TYPE_CLK_ENABLE				0x0c
>  #define INT3472_GPIO_TYPE_PRIVACY_LED				0x0d
>  #define INT3472_GPIO_TYPE_HANDSHAKE				0x12
> +#define INT3472_GPIO_TYPE_HOTPLUG_DETECT			0x13
>  
>  #define INT3472_PDEV_MAX_NAME_LEN				23
>  #define INT3472_MAX_SENSOR_GPIOS				3
> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
> index 394975f55d64..efa3bc7af193 100644
> --- a/drivers/platform/x86/intel/int3472/discrete.c
> +++ b/drivers/platform/x86/intel/int3472/discrete.c
> @@ -191,6 +191,10 @@ static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3
>  		*con_id = "privacy-led";
>  		*gpio_flags = GPIO_ACTIVE_HIGH;
>  		break;
> +	case INT3472_GPIO_TYPE_HOTPLUG_DETECT:
> +		*con_id = "hpd";
> +		*gpio_flags = GPIO_ACTIVE_HIGH;
> +		break;
>  	case INT3472_GPIO_TYPE_POWER_ENABLE:
>  		*con_id = "avdd";
>  		*gpio_flags = GPIO_ACTIVE_HIGH;
> @@ -221,6 +225,7 @@ static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3
>   * 0x0b Power enable
>   * 0x0c Clock enable
>   * 0x0d Privacy LED
> + * 0x13 Hotplug detect
>   *
>   * There are some known platform specific quirks where that does not quite
>   * hold up; for example where a pin with type 0x01 (Power down) is mapped to
> @@ -290,6 +295,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>  	switch (type) {
>  	case INT3472_GPIO_TYPE_RESET:
>  	case INT3472_GPIO_TYPE_POWERDOWN:
> +	case INT3472_GPIO_TYPE_HOTPLUG_DETECT:
>  		ret = skl_int3472_map_gpio_to_sensor(int3472, agpio, con_id, gpio_flags);
>  		if (ret)
>  			err_msg = "Failed to map GPIO pin to sensor\n";
> 
> base-commit: 4d1e8c8f11c611db5828e4bae7292bc295eea8ef


