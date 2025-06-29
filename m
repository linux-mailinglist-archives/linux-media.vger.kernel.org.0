Return-Path: <linux-media+bounces-36238-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDE2AED524
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 09:06:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6385168F82
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 07:06:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 570F521C9E8;
	Mon, 30 Jun 2025 07:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZoWohJ5S"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFFE8460;
	Mon, 30 Jun 2025 07:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751267196; cv=none; b=B1rRktb3NU7b+3ntqyX9tNpqjTo7V0TVjBycxpN8+44D7Ku6qxGn9pdaU9d7qYIv0Fw+VX4YhgRaer/LlatqRmKcDW3D1FOUuRJMwOhZ+VN7n3fbqmuyqqRV2pPgVEustnPHRTchdVZrh3VE/w+mopNaLlj9hFtyInbb02E8uQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751267196; c=relaxed/simple;
	bh=F9A1L1picuVE7aH3mlA5VT4iAZsIBj7DOqkWh55fbKQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WmQ0J9n6vsLcYuXLS7BHqYhfl4vigyJ2x8bl0sylaPLaHYwjfYz6iaSLLYPstwLTd2pZYQWU5cdaYUl1pQsaaCnQrBdTFiLLU2L+C8W3QiIKX0mez+ZVUeggfd9vH8GygGZByhD8K9XRUAcUO6JX7EFV9pLln5mHbxcj/dEuXyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZoWohJ5S; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751267195; x=1782803195;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=F9A1L1picuVE7aH3mlA5VT4iAZsIBj7DOqkWh55fbKQ=;
  b=ZoWohJ5SDMAUj80LyvH8BCQi0sIp3bseJlSiITocFZ0+4XSYgCIMQQHK
   bozeoeCKp4JQSfCSuPtZqaX+9qCid3TTWqZagTo9cASsNueDb5+wrHZka
   sSJMHhex0At5UyCzEdlkYRCXAQUL82xNWrs063iwl/9hEehA08n9asE71
   rIYXHAVHsY5roSoTDlIokmZhyhPJcIXUg22Hn7dWShWOShVfruTDgYTpA
   S67LHT1mq+RFQjzi1hE0lwi+2RCpefTOiQfcLZfEyhYJYsMU6/oNoS7ID
   8YvaoFENl6soljnJGDbkE2n2pSCwkWG4riah7mpD0CpQdh/2dt8H+X6Fw
   g==;
X-CSE-ConnectionGUID: h3FvI8RBSouitihCyCm9dA==
X-CSE-MsgGUID: aM45HxH+SYy6ExEDNK9kWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="52600152"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="52600152"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 00:06:34 -0700
X-CSE-ConnectionGUID: RCPC3064TkWhloFNKaZnZw==
X-CSE-MsgGUID: kN/TJ5P6TqihIZ2jsPEQlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="177046709"
Received: from agladkov-desk.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.57])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 00:06:32 -0700
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id A1767427EA;
	Mon, 30 Jun 2025 10:06:30 +0300 (EEST)
Message-ID: <5a078dac-7e40-4145-aa06-59c57288b177@linux.intel.com>
Date: Sun, 29 Jun 2025 13:20:34 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: i2c: imx334: add support for additional test
 patterns
Content-Language: en-US
To: Shravan.Chippa@microchip.com, kieran.bingham@ideasonboard.com,
 mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Conor.Dooley@microchip.com, Valentina.FernandezAlanis@microchip.com,
 Praveen.Kumar@microchip.com
References: <20250624065438.2021044-1-shravan.chippa@microchip.com>
 <175075906452.3871677.12511426007175753529@ping.linuxembedded.co.uk>
 <PH0PR11MB561123C9612EF7E82A0530E5817AA@PH0PR11MB5611.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
In-Reply-To: <PH0PR11MB561123C9612EF7E82A0530E5817AA@PH0PR11MB5611.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/26/25 10:09, Shravan.Chippa@microchip.com wrote:
> Hi Kieran,
> 
> 
>> -----Original Message-----
>> From: Kieran Bingham <kieran.bingham@ideasonboard.com>
>> Sent: Tuesday, June 24, 2025 3:28 PM
>> To: mchehab@kernel.org; sakari.ailus@linux.intel.com; shravan Chippa -
>> I35088 <Shravan.Chippa@microchip.com>
>> Cc: linux-media@vger.kernel.org; linux-kernel@vger.kernel.org; Conor Dooley -
>> M52691 <Conor.Dooley@microchip.com>; Valentina Fernandez Alanis -
>> M63239 <Valentina.FernandezAlanis@microchip.com>; Praveen Kumar -
>> I30718 <Praveen.Kumar@microchip.com>; shravan Chippa - I35088
>> <Shravan.Chippa@microchip.com>
>> Subject: Re: [PATCH] media: i2c: imx334: add support for additional test
>> patterns
>>
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the
>> content is safe
>>
>> Hi Shravan
>>
>> Quoting shravan kumar (2025-06-24 07:54:38)
>>> From: Shravan Chippa <shravan.chippa@microchip.com>
>>>
>>> Added support for three additional test patterns in the
>>> IMX334 driver: Black and Grey Bars, Black Color, and White Color.
>>>
>>> Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>
>>> ---
>>>   drivers/media/i2c/imx334.c | 9 +++++++++
>>>   1 file changed, 9 insertions(+)
>>>
>>> diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
>>> index 846b9928d4e8..43dd7edb48c8 100644
>>> --- a/drivers/media/i2c/imx334.c
>>> +++ b/drivers/media/i2c/imx334.c
>>> @@ -118,6 +118,9 @@
>>>   #define IMX334_REG_TP                  CCI_REG8(0x329e)
>>>   #define IMX334_TP_COLOR_HBARS          0xa
>>>   #define IMX334_TP_COLOR_VBARS          0xb
>>> +#define IMX334_TP_BLACK                        0x0
>>> +#define IMX334_TP_WHITE                        0x1
>>> +#define IMX334_TP_BLACK_GREY           0xC
>>
>> This should be lower case to match the other hex constants (0xc)
>>
>> I also wonder if this list should be in register address order ... but then it won't
>> match the menu items ...
> 
> This is just value to write in the register

The menu items that are off the register value are already there so I'd 
just keep them as-is. I'll apply this with the constant fixed.

-- 
Regards,

Sakari Ailus

