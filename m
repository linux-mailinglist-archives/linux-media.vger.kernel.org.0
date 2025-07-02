Return-Path: <linux-media+bounces-36500-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9CCAF0B47
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 08:08:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F4931889EA6
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 06:09:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6850202F8B;
	Wed,  2 Jul 2025 06:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h83+iSvb"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED551EFF8B;
	Wed,  2 Jul 2025 06:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751436517; cv=none; b=Yg0pzDQ7Y+Y589miGAVYSCGBcG8Slwje060yotoiAOCM66nYWdsD6xmjMQIC9ShggYkyRCxv3I/J3EtF6tYSVc218GbxrMcUr60HPX9ZCBHy5HDeIdpwgA8g22jokmFZY6g67iy/pT9PyhKbm+cvOkhDODSG1Mllu+61FoqQazU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751436517; c=relaxed/simple;
	bh=fJFPLb/Mcb7axLmOIPwvHFHe8eb8kFemsg62UjCILlY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BN758DjK1QHFPhiin6zu+omtKromc3SttZVzJ9d6/x4nvYDTr7ayZfkTkNxNk6pAoOnqE2s424deYwHnwDCEosjtk1/Nvp9v1GuPUwdaF4VArOuTDpkQIXraSz0XSGcIQFXWkfPDKvH/M4iEldiVT761C6PHMxKoFP375Lef7qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h83+iSvb; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751436515; x=1782972515;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=fJFPLb/Mcb7axLmOIPwvHFHe8eb8kFemsg62UjCILlY=;
  b=h83+iSvbhafhhtOsveDHlwEJX8kr2K2oaFAk0YifAiQiSLwj7rxUvzXp
   qev3F+ipgMLSmBWSMDTvMf4HGPAPmH+QoWmLU0SxE7vu3U+thSlGu3TSv
   6oMIswNnR0AAtOhomddPW82Zl6Th4chy117oLzLYNASawOQaMJpjjHoD9
   0tD8h+8mPXHpGyotiU+cdN4P3H0tK8dnw/nrlnAya2P73rQ2K2i1oYyDg
   mkNtl0OMYK/zhMmVN9vs4hFbVlayxztNW5KSAlBdXpaT0APqwn2r5h3bY
   KklDDvz3j/Xx2m4gUwsfEVMi+QpMZcOiUzAGaKtDLMyRjjAKIKvDF42Ma
   A==;
X-CSE-ConnectionGUID: DM6N4Z0hRNSQD94IcBqylw==
X-CSE-MsgGUID: i07XHHXITR2mJB2H35/MxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="65068462"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="65068462"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 23:08:34 -0700
X-CSE-ConnectionGUID: 5zg2TzEqQmOnJMMAvV5MTw==
X-CSE-MsgGUID: L/1KRB1pTfy6BlLJPDnFQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="153758680"
Received: from unknown (HELO [10.238.224.237]) ([10.238.224.237])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 23:08:29 -0700
Message-ID: <0d45fca3-5b6f-42e5-acec-bca2dda25f15@linux.intel.com>
Date: Wed, 2 Jul 2025 14:08:26 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 RESEND] media: i2c: Add OV05C10 camera sensor driver
To: "Nirujogi, Pratap" <pnirujog@amd.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hao Yao <hao.yao@intel.com>, Pratap Nirujogi <pratap.nirujogi@amd.com>,
 mchehab@kernel.org, hverkuil@xs4all.nl, bryan.odonoghue@linaro.org,
 krzk@kernel.org, dave.stevenson@raspberrypi.com, hdegoede@redhat.com,
 jai.luthra@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, grosikop@amd.com, king.li@amd.com,
 dantony@amd.com, vengutta@amd.com, dongcheng.yan@intel.com,
 jason.z.chen@intel.com, jimmy.su@intel.com
References: <20250609194321.1611419-1-pratap.nirujogi@amd.com>
 <6a49eb11-d434-4315-8ee9-0f8aa7347de2@intel.com>
 <aEygCdk-zEqRwfoF@kekkonen.localdomain>
 <20250614225257.GO10542@pendragon.ideasonboard.com>
 <f6d1d8f7-d953-4f86-a196-f713726bd5f8@amd.com>
 <ec790d0e-4bdb-49b9-80ad-f44e1b700a5e@linux.intel.com>
 <702594a4-ebc3-471e-8551-d94f0dee2982@amd.com>
Content-Language: en-US
From: "Yan, Dongcheng" <dongcheng.yan@linux.intel.com>
In-Reply-To: <702594a4-ebc3-471e-8551-d94f0dee2982@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Pratap,

On 7/1/2025 6:31 AM, Nirujogi, Pratap wrote:
> Hi Sakari, Hi Laurent,
> 
> On 6/29/2025 3:40 AM, Sakari Ailus wrote:
>> Caution: This message originated from an External Source. Use proper
>> caution when opening attachments, clicking links, or responding.
>>
>>
>> Hi Pratap,
>>
>> On 6/17/25 01:33, Nirujogi, Pratap wrote:
>> ...
>>>>>>> +static const struct cci_reg_sequence ov05c10_2888x1808_regs[] = {
>>>>>>> + { CCI_REG8(0xfd),  0x00 },
>>>>>>> + { CCI_REG8(0x20),  0x00 },
>>>>>>> + { CCI_REG8(0xfd),  0x00 },
>>>>>>> + { CCI_REG8(0x20),  0x0b },
>>>>>>> + { CCI_REG8(0xc1),  0x09 },
>>>>>>> + { CCI_REG8(0x21),  0x06 },
>>>>>>> + { CCI_REG8(0x14),  0x78 },
>>>>>>> + { CCI_REG8(0xe7),  0x03 },
>>>>>>> + { CCI_REG8(0xe7),  0x00 },
>>>>>>> + { CCI_REG8(0x21),  0x00 },
>>>>>>> + { CCI_REG8(0xfd),  0x01 },
>>>>>>> + { CCI_REG8(0x03),  0x00 },
>>>>>>> + { CCI_REG8(0x04),  0x06 },
>>>>>>> + { CCI_REG8(0x05),  0x07 },
>>>>>>> + { CCI_REG8(0x06),  0x44 },
>>>>>>> + { CCI_REG8(0x07),  0x08 },
>>>>>>> + { CCI_REG8(0x1b),  0x01 },
>>>>>>> + { CCI_REG8(0x24),  0xff },
>>>>>>> + { CCI_REG8(0x32),  0x03 },
>>>>>>> + { CCI_REG8(0x42),  0x5d },
>>>>>>> + { CCI_REG8(0x43),  0x08 },
>>>>>>> + { CCI_REG8(0x44),  0x81 },
>>>>>>> + { CCI_REG8(0x46),  0x5f },
>>>>>>> + { CCI_REG8(0x48),  0x18 },
>>>>>>> + { CCI_REG8(0x49),  0x04 },
>>>>>>> + { CCI_REG8(0x5c),  0x18 },
>>>>>>> + { CCI_REG8(0x5e),  0x13 },
>>>>>>> + { CCI_REG8(0x70),  0x15 },
>>>>>>> + { CCI_REG8(0x77),  0x35 },
>>>>>>> + { CCI_REG8(0x79),  0x00 },
>>>>>>> + { CCI_REG8(0x7b),  0x08 },
>>>>>>> + { CCI_REG8(0x7d),  0x08 },
>>>>>>> + { CCI_REG8(0x7e),  0x08 },
>>>>>>> + { CCI_REG8(0x7f),  0x08 },
>>>>>>> + { CCI_REG8(0x90),  0x37 },
>>>>>>> + { CCI_REG8(0x91),  0x05 },
>>>>>>> + { CCI_REG8(0x92),  0x18 },
>>>>>>> + { CCI_REG8(0x93),  0x27 },
>>>>>>> + { CCI_REG8(0x94),  0x05 },
>>>>>>> + { CCI_REG8(0x95),  0x38 },
>>>>>>> + { CCI_REG8(0x9b),  0x00 },
>>>>>>> + { CCI_REG8(0x9c),  0x06 },
>>>>>>> + { CCI_REG8(0x9d),  0x28 },
>>>>>>> + { CCI_REG8(0x9e),  0x06 },
>>>>>>> + { CCI_REG8(0xb2),  0x0f },
>>>>>>> + { CCI_REG8(0xb3),  0x29 },
>>>>>>> + { CCI_REG8(0xbf),  0x3c },
>>>>>>> + { CCI_REG8(0xc2),  0x04 },
>>>>>>> + { CCI_REG8(0xc4),  0x00 },
>>>>>>> + { CCI_REG8(0xca),  0x20 },
>>>>>>> + { CCI_REG8(0xcb),  0x20 },
>>>>>>> + { CCI_REG8(0xcc),  0x28 },
>>>>>>> + { CCI_REG8(0xcd),  0x28 },
>>>>>>> + { CCI_REG8(0xce),  0x20 },
>>>>>>> + { CCI_REG8(0xcf),  0x20 },
>>>>>>> + { CCI_REG8(0xd0),  0x2a },
>>>>>>> + { CCI_REG8(0xd1),  0x2a },
>>>>>>> + { CCI_REG8(0xfd),  0x0f },
>>>>>>> + { CCI_REG8(0x00),  0x00 },
>>>>>>> + { CCI_REG8(0x01),  0xa0 },
>>>>>>> + { CCI_REG8(0x02),  0x48 },
>>>>>>> + { CCI_REG8(0x07),  0x8f },
>>>>>>> + { CCI_REG8(0x08),  0x70 },
>>>>>>> + { CCI_REG8(0x09),  0x01 },
>>>>>>> + { CCI_REG8(0x0b),  0x40 },
>>>>>>> + { CCI_REG8(0x0d),  0x07 },
>>>>>>> + { CCI_REG8(0x11),  0x33 },
>>>>>>> + { CCI_REG8(0x12),  0x77 },
>>>>>>> + { CCI_REG8(0x13),  0x66 },
>>>>>>> + { CCI_REG8(0x14),  0x65 },
>>>>>>> + { CCI_REG8(0x15),  0x37 },
>>>>>>> + { CCI_REG8(0x16),  0xbf },
>>>>>>> + { CCI_REG8(0x17),  0xff },
>>>>>>> + { CCI_REG8(0x18),  0xff },
>>>>>>> + { CCI_REG8(0x19),  0x12 },
>>>>>>> + { CCI_REG8(0x1a),  0x10 },
>>>>>>> + { CCI_REG8(0x1c),  0x77 },
>>>>>>> + { CCI_REG8(0x1d),  0x77 },
>>>>>>> + { CCI_REG8(0x20),  0x0f },
>>>>>>> + { CCI_REG8(0x21),  0x0f },
>>>>>>> + { CCI_REG8(0x22),  0x0f },
>>>>>>> + { CCI_REG8(0x23),  0x0f },
>>>>>>> + { CCI_REG8(0x2b),  0x20 },
>>>>>>> + { CCI_REG8(0x2c),  0x20 },
>>>>>>> + { CCI_REG8(0x2d),  0x04 },
>>>>>>> + { CCI_REG8(0xfd),  0x03 },
>>>>>>> + { CCI_REG8(0x9d),  0x0f },
>>>>>>> + { CCI_REG8(0x9f),  0x40 },
>>>>>>> + { CCI_REG8(0xfd),  0x00 },
>>>>>>> + { CCI_REG8(0x20),  0x1b },
>>>>>>> + { CCI_REG8(0xfd),  0x04 },
>>>>>>> + { CCI_REG8(0x19),  0x60 },
>>>>>>> + { CCI_REG8(0xfd),  0x02 },
>>>>>>> + { CCI_REG8(0x75),  0x05 },
>>>>>>> + { CCI_REG8(0x7f),  0x06 },
>>>>>>> + { CCI_REG8(0x9a),  0x03 },
>>>>>>> + { CCI_REG8(0xa2),  0x07 },
>>>>>>> + { CCI_REG8(0xa3),  0x10 },
>>>>>>> + { CCI_REG8(0xa5),  0x02 },
>>>>>>> + { CCI_REG8(0xa6),  0x0b },
>>>>>>> + { CCI_REG8(0xa7),  0x48 },
>>>>>>> + { CCI_REG8(0xfd),  0x07 },
>>>>>>> + { CCI_REG8(0x42),  0x00 },
>>>>>>> + { CCI_REG8(0x43),  0x80 },
>>>>>>> + { CCI_REG8(0x44),  0x00 },
>>>>>>> + { CCI_REG8(0x45),  0x80 },
>>>>>>> + { CCI_REG8(0x46),  0x00 },
>>>>>>> + { CCI_REG8(0x47),  0x80 },
>>>>>>> + { CCI_REG8(0x48),  0x00 },
>>>>>>> + { CCI_REG8(0x49),  0x80 },
>>>>>>> + { CCI_REG8(0x00),  0xf7 },
>>>>>>> + { CCI_REG8(0xfd),  0x00 },
>>>>>>> + { CCI_REG8(0xe7),  0x03 },
>>>>>>> + { CCI_REG8(0xe7),  0x00 },
>>>>>>> + { CCI_REG8(0xfd),  0x00 },
>>>>>>> + { CCI_REG8(0x93),  0x18 },
>>>>>>> + { CCI_REG8(0x94),  0xff },
>>>>>>> + { CCI_REG8(0x95),  0xbd },
>>>>>>> + { CCI_REG8(0x96),  0x1a },
>>>>>>> + { CCI_REG8(0x98),  0x04 },
>>>>>>> + { CCI_REG8(0x99),  0x08 },
>>>>>>> + { CCI_REG8(0x9b),  0x10 },
>>>>>>> + { CCI_REG8(0x9c),  0x3f },
>>>>>>> + { CCI_REG8(0xa1),  0x05 },
>>>>>>> + { CCI_REG8(0xa4),  0x2f },
>>>>>>> + { CCI_REG8(0xc0),  0x0c },
>>>>>>> + { CCI_REG8(0xc1),  0x08 },
>>>>>>> + { CCI_REG8(0xc2),  0x00 },
>>>>>>> + { CCI_REG8(0xb6),  0x20 },
>>>>>>> + { CCI_REG8(0xbb),  0x80 },
>>>>>>> + { CCI_REG8(0xfd),  0x00 },
>>>>>>> + { CCI_REG8(0xa0),  0x01 },
>>>>>>> + { CCI_REG8(0xfd),  0x01 },
>>>>
>>>> Please replace these with names macros where possible. I'm sure quite a
>>>> few of the registers configured here are documented in the datasheet.
>>>> The registers that configure the mode (analog crop, digital crop,
>>>> binning, skipping, ...) should be computed dynamically from the subdev
>>>> pad format and selection rectangles, not hardcoded.
>>>>
>>> I agree, but we get the sensor settings based on our requirements from
>>> the vendor, i will check if we can get some more info regarding the
>>> crop, binning, skipping etc...
>>
>> Some of this infomation should be available in the datasheet. Use at
>> least the register names that can be found, for those that can't there's
>> not much that could be done.
>>
> Sorry to say that I don't have the details in this case. We have
> previously reached out to the sensor vendor, but they are not willing to
> disclose any of these details. We hope for your understanding of the
> constraints we're facing and truly value your support.
> 

If you have a spec of OV05C10 (I assume you do, as the developer of this
driver), it is not a issue.
Take P0:0x14 as an example, it's named as DPLL_NC_SEL in spec and set to
0x78 in your reglist ov05c10_2888x1808_regs. If define all named
registers rather than the confusing magic hardcode, the driver code will
be more readable and easy to review.
I think this is what Sakari thought.

Thanks,
Dongcheng

> Thanks,
> Pratap
> 
>> -- 
>> Regards,
>>
>> Sakari Ailus
> 
> 


