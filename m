Return-Path: <linux-media+bounces-31823-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C8823AABCFD
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 10:23:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50F073A31AE
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 08:19:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5700F2472B5;
	Tue,  6 May 2025 08:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dDQAnlro"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3168A24728B
	for <linux-media@vger.kernel.org>; Tue,  6 May 2025 08:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746519568; cv=none; b=eamHhoElxzCwMO/nLJmNpq86iRcTOVoEAnONQEyxUyzkVOoJrFHggYjfP6qD+gC5qp8uovAiEHvRoy1DuvassM5RgZB6exqusriQNeCVaeLE/uiaCsdgDJ72e5wWjdovzQdRcjZs2YWigZ83EWYD7bRwn4m+CQs41EjgAeCq8pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746519568; c=relaxed/simple;
	bh=2dG+J+vyPC3uVTAix7TrOCELs1zzs0iYYX3Rvevkoq4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a/IYGWvl1lss9y+gEF4rFUeZAJXtYA7wsAlBPLu2uPxgacRaIh3VW7pzYnJWNOy2wXQRliW9zdPYxWjBUYq7FqFTeHmnbdHZoIXgiNR28CeZalXnlINaNqzogyNVWkrkwSjy55ongtCtbUevXbFgMTkrS/wqMrPIcQn9JpN1yaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dDQAnlro; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746519567; x=1778055567;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=2dG+J+vyPC3uVTAix7TrOCELs1zzs0iYYX3Rvevkoq4=;
  b=dDQAnlroXRVwHFE0+ce/PkFfxmMdTwRhCasyYh/OQkZ9SAs5B/OAGO9m
   SVeVqcakMYKsfUZ9PmEbVf7QczYmXkucrZZZMYnLSwQL1xdSA+dPbmlwe
   L2WfRBCaWUkGzlLyyIdCAOA13wmqaISEA1w0ma0Nrk1y2tv6+QxMQC8q/
   5s0LuoIwnJeZPaeC45sOWI1Bzta9rAGVwT4qNWnhiGunb5CWetr0URtQf
   dVN3QEvTW1VarXLUPzFsh524erli3GQlwRlYJ6omyktuhi7Sr8p1FgdSe
   aXC+fdmNsKu0wm3kMee2A1JMFfQeAv0z8pvtTQXHxiplS0R+e6LXDPrUA
   w==;
X-CSE-ConnectionGUID: DtjKJnaaRbi82LfP1aFu/Q==
X-CSE-MsgGUID: J/VxAo1rRYODjYzw07oC6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="51821844"
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; 
   d="scan'208";a="51821844"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 01:19:26 -0700
X-CSE-ConnectionGUID: 0+CNv2xwSouhLViQPIBt2w==
X-CSE-MsgGUID: xyXlBXeWTYqZdOoTVJDjhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; 
   d="scan'208";a="136032285"
Received: from unknown (HELO [10.238.224.221]) ([10.238.224.221])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 01:19:25 -0700
Message-ID: <454d6f6f-96cd-4d6a-aca7-bf069dad1717@intel.com>
Date: Tue, 6 May 2025 16:19:22 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] media: lt6911uxe: Depend on I2C
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, "arnd@arndb.de" <arnd@arndb.de>,
 "Cao, Bingbu" <bingbu.cao@intel.com>
References: <20250505110054.8538-1-sakari.ailus@linux.intel.com>
 <BL3PR11MB6410C2CF8DAD915E2F60EBC2F2892@BL3PR11MB6410.namprd11.prod.outlook.com>
 <aBmrmFA2uS7OTxVk@kekkonen.localdomain>
Content-Language: en-US
From: "Yan, Dongcheng" <dongcheng.yan@intel.com>
In-Reply-To: <aBmrmFA2uS7OTxVk@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Sakari,

On 5/6/2025 2:26 PM, Sakari Ailus wrote:
> Hi Dongcheng,
> 
> On Tue, May 06, 2025 at 04:14:58AM +0000, Yan, Dongcheng wrote:
>> Hi Sakari,
>>
>> <herkuil@xs4all.nl> and <arnd@arndb.de> had submitted fix patches. And I
>> saw it has merged into linux-next:
>> <https://web.git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/media/i2c/Kconfig><https://web.git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/media/i2c/Kconfig>
> 
> You probably meant <20250314154738.3983798-1-arnd@kernel.org> on LMML? Yes,
> indeed. I'll drop the two patches related to this from my tree.
> 

Yes, arnd and hans had fixed dependency, and I saw your pull patch updated.

Sorry for replying to the error thread and try to recall this message.

Thanks,
Dongcheng

