Return-Path: <linux-media+bounces-36243-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB806AED537
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 09:08:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 632CA1897C9B
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 07:08:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 128A722B594;
	Mon, 30 Jun 2025 07:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZkBLXqnL"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07120226CFF;
	Mon, 30 Jun 2025 07:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751267202; cv=none; b=oa25dyX7UUPguylDQI8hAR4NT19MFh1EhaQA6U7XH9hFN+sVex3LhKa1CZN5lKz/ULHrdNz3N8cxr+UzHfKEshFE1Uysx1BwBhe7mL/jzpWDYwwoAQ3P35GJkZOyX06tEUmzU38Yc6SGRpINnzoKgWeDZgyxljpXtuqjsCabN9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751267202; c=relaxed/simple;
	bh=2lce8mSrNrekb88IdCzkJIG6HQNp6B1zAzKDYe1G7M4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qfGNsBV9QNZojk4DLq/pvNQH5oQQPG4ojBpaGW1E0CZyGXb5T+2fzbZ8wSZX7fQShUu32Wvr4ALa/omdiZMwHQ0kc7FnnC8n7vsLPGB2MLVCPYFQmRiXn+SdQ1bC9y66hCfyoq0mVJm++qjLb6+mHSm37a5UQXVWpuvMxBEq0P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZkBLXqnL; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751267201; x=1782803201;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=2lce8mSrNrekb88IdCzkJIG6HQNp6B1zAzKDYe1G7M4=;
  b=ZkBLXqnLOZf2y6TwTSe+B06GNUsBcyx40XG/XX6VJ5+CDuIWmYyggPa7
   qoTdWuQ/vIxWTd0ydClYUL0ba7J1aKrCp6TXoIAeFz9olTNZTAnQ/yVYa
   7RzjEPA35gD3ALp/rJ24BKzORfpXyptUzxEFamlR0oCbXeZIwTzd2ozmk
   93rhX4HINEi3ACVzkhyCla2rp7FcAUDl66/wreQ160z90ZnkG9HtPG2iI
   b5dUJAAOH5yJRF1b3ZpmdC2z7b4BME0QX6C3TjQIFhBnsmENj+D3jOKSX
   Puu77JzxNYheuGLEnLe4GIfAdL97uCEegWmFIpCy58RpgL14+0fGe+Y6e
   A==;
X-CSE-ConnectionGUID: wj6rNWf1RjW06dnd/jh3eQ==
X-CSE-MsgGUID: fsvTdaaUSr6cMSHc1cKAgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="53589130"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="53589130"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 00:06:30 -0700
X-CSE-ConnectionGUID: W0s88ZrpQ7WGmEpYI5kNxw==
X-CSE-MsgGUID: HBjUdj/kQkKof9wkzEBQCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="152865860"
Received: from agladkov-desk.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.57])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 00:06:24 -0700
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id 27F41427EA;
	Mon, 30 Jun 2025 10:06:21 +0300 (EEST)
Message-ID: <ec790d0e-4bdb-49b9-80ad-f44e1b700a5e@linux.intel.com>
Date: Sun, 29 Jun 2025 10:40:52 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 RESEND] media: i2c: Add OV05C10 camera sensor driver
Content-Language: en-US
To: "Nirujogi, Pratap" <pnirujog@amd.com>,
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
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
In-Reply-To: <f6d1d8f7-d953-4f86-a196-f713726bd5f8@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Pratap,

On 6/17/25 01:33, Nirujogi, Pratap wrote:
...
>>>>> +static const struct cci_reg_sequence ov05c10_2888x1808_regs[] = {
>>>>> + { CCI_REG8(0xfd),  0x00 },
>>>>> + { CCI_REG8(0x20),  0x00 },
>>>>> + { CCI_REG8(0xfd),  0x00 },
>>>>> + { CCI_REG8(0x20),  0x0b },
>>>>> + { CCI_REG8(0xc1),  0x09 },
>>>>> + { CCI_REG8(0x21),  0x06 },
>>>>> + { CCI_REG8(0x14),  0x78 },
>>>>> + { CCI_REG8(0xe7),  0x03 },
>>>>> + { CCI_REG8(0xe7),  0x00 },
>>>>> + { CCI_REG8(0x21),  0x00 },
>>>>> + { CCI_REG8(0xfd),  0x01 },
>>>>> + { CCI_REG8(0x03),  0x00 },
>>>>> + { CCI_REG8(0x04),  0x06 },
>>>>> + { CCI_REG8(0x05),  0x07 },
>>>>> + { CCI_REG8(0x06),  0x44 },
>>>>> + { CCI_REG8(0x07),  0x08 },
>>>>> + { CCI_REG8(0x1b),  0x01 },
>>>>> + { CCI_REG8(0x24),  0xff },
>>>>> + { CCI_REG8(0x32),  0x03 },
>>>>> + { CCI_REG8(0x42),  0x5d },
>>>>> + { CCI_REG8(0x43),  0x08 },
>>>>> + { CCI_REG8(0x44),  0x81 },
>>>>> + { CCI_REG8(0x46),  0x5f },
>>>>> + { CCI_REG8(0x48),  0x18 },
>>>>> + { CCI_REG8(0x49),  0x04 },
>>>>> + { CCI_REG8(0x5c),  0x18 },
>>>>> + { CCI_REG8(0x5e),  0x13 },
>>>>> + { CCI_REG8(0x70),  0x15 },
>>>>> + { CCI_REG8(0x77),  0x35 },
>>>>> + { CCI_REG8(0x79),  0x00 },
>>>>> + { CCI_REG8(0x7b),  0x08 },
>>>>> + { CCI_REG8(0x7d),  0x08 },
>>>>> + { CCI_REG8(0x7e),  0x08 },
>>>>> + { CCI_REG8(0x7f),  0x08 },
>>>>> + { CCI_REG8(0x90),  0x37 },
>>>>> + { CCI_REG8(0x91),  0x05 },
>>>>> + { CCI_REG8(0x92),  0x18 },
>>>>> + { CCI_REG8(0x93),  0x27 },
>>>>> + { CCI_REG8(0x94),  0x05 },
>>>>> + { CCI_REG8(0x95),  0x38 },
>>>>> + { CCI_REG8(0x9b),  0x00 },
>>>>> + { CCI_REG8(0x9c),  0x06 },
>>>>> + { CCI_REG8(0x9d),  0x28 },
>>>>> + { CCI_REG8(0x9e),  0x06 },
>>>>> + { CCI_REG8(0xb2),  0x0f },
>>>>> + { CCI_REG8(0xb3),  0x29 },
>>>>> + { CCI_REG8(0xbf),  0x3c },
>>>>> + { CCI_REG8(0xc2),  0x04 },
>>>>> + { CCI_REG8(0xc4),  0x00 },
>>>>> + { CCI_REG8(0xca),  0x20 },
>>>>> + { CCI_REG8(0xcb),  0x20 },
>>>>> + { CCI_REG8(0xcc),  0x28 },
>>>>> + { CCI_REG8(0xcd),  0x28 },
>>>>> + { CCI_REG8(0xce),  0x20 },
>>>>> + { CCI_REG8(0xcf),  0x20 },
>>>>> + { CCI_REG8(0xd0),  0x2a },
>>>>> + { CCI_REG8(0xd1),  0x2a },
>>>>> + { CCI_REG8(0xfd),  0x0f },
>>>>> + { CCI_REG8(0x00),  0x00 },
>>>>> + { CCI_REG8(0x01),  0xa0 },
>>>>> + { CCI_REG8(0x02),  0x48 },
>>>>> + { CCI_REG8(0x07),  0x8f },
>>>>> + { CCI_REG8(0x08),  0x70 },
>>>>> + { CCI_REG8(0x09),  0x01 },
>>>>> + { CCI_REG8(0x0b),  0x40 },
>>>>> + { CCI_REG8(0x0d),  0x07 },
>>>>> + { CCI_REG8(0x11),  0x33 },
>>>>> + { CCI_REG8(0x12),  0x77 },
>>>>> + { CCI_REG8(0x13),  0x66 },
>>>>> + { CCI_REG8(0x14),  0x65 },
>>>>> + { CCI_REG8(0x15),  0x37 },
>>>>> + { CCI_REG8(0x16),  0xbf },
>>>>> + { CCI_REG8(0x17),  0xff },
>>>>> + { CCI_REG8(0x18),  0xff },
>>>>> + { CCI_REG8(0x19),  0x12 },
>>>>> + { CCI_REG8(0x1a),  0x10 },
>>>>> + { CCI_REG8(0x1c),  0x77 },
>>>>> + { CCI_REG8(0x1d),  0x77 },
>>>>> + { CCI_REG8(0x20),  0x0f },
>>>>> + { CCI_REG8(0x21),  0x0f },
>>>>> + { CCI_REG8(0x22),  0x0f },
>>>>> + { CCI_REG8(0x23),  0x0f },
>>>>> + { CCI_REG8(0x2b),  0x20 },
>>>>> + { CCI_REG8(0x2c),  0x20 },
>>>>> + { CCI_REG8(0x2d),  0x04 },
>>>>> + { CCI_REG8(0xfd),  0x03 },
>>>>> + { CCI_REG8(0x9d),  0x0f },
>>>>> + { CCI_REG8(0x9f),  0x40 },
>>>>> + { CCI_REG8(0xfd),  0x00 },
>>>>> + { CCI_REG8(0x20),  0x1b },
>>>>> + { CCI_REG8(0xfd),  0x04 },
>>>>> + { CCI_REG8(0x19),  0x60 },
>>>>> + { CCI_REG8(0xfd),  0x02 },
>>>>> + { CCI_REG8(0x75),  0x05 },
>>>>> + { CCI_REG8(0x7f),  0x06 },
>>>>> + { CCI_REG8(0x9a),  0x03 },
>>>>> + { CCI_REG8(0xa2),  0x07 },
>>>>> + { CCI_REG8(0xa3),  0x10 },
>>>>> + { CCI_REG8(0xa5),  0x02 },
>>>>> + { CCI_REG8(0xa6),  0x0b },
>>>>> + { CCI_REG8(0xa7),  0x48 },
>>>>> + { CCI_REG8(0xfd),  0x07 },
>>>>> + { CCI_REG8(0x42),  0x00 },
>>>>> + { CCI_REG8(0x43),  0x80 },
>>>>> + { CCI_REG8(0x44),  0x00 },
>>>>> + { CCI_REG8(0x45),  0x80 },
>>>>> + { CCI_REG8(0x46),  0x00 },
>>>>> + { CCI_REG8(0x47),  0x80 },
>>>>> + { CCI_REG8(0x48),  0x00 },
>>>>> + { CCI_REG8(0x49),  0x80 },
>>>>> + { CCI_REG8(0x00),  0xf7 },
>>>>> + { CCI_REG8(0xfd),  0x00 },
>>>>> + { CCI_REG8(0xe7),  0x03 },
>>>>> + { CCI_REG8(0xe7),  0x00 },
>>>>> + { CCI_REG8(0xfd),  0x00 },
>>>>> + { CCI_REG8(0x93),  0x18 },
>>>>> + { CCI_REG8(0x94),  0xff },
>>>>> + { CCI_REG8(0x95),  0xbd },
>>>>> + { CCI_REG8(0x96),  0x1a },
>>>>> + { CCI_REG8(0x98),  0x04 },
>>>>> + { CCI_REG8(0x99),  0x08 },
>>>>> + { CCI_REG8(0x9b),  0x10 },
>>>>> + { CCI_REG8(0x9c),  0x3f },
>>>>> + { CCI_REG8(0xa1),  0x05 },
>>>>> + { CCI_REG8(0xa4),  0x2f },
>>>>> + { CCI_REG8(0xc0),  0x0c },
>>>>> + { CCI_REG8(0xc1),  0x08 },
>>>>> + { CCI_REG8(0xc2),  0x00 },
>>>>> + { CCI_REG8(0xb6),  0x20 },
>>>>> + { CCI_REG8(0xbb),  0x80 },
>>>>> + { CCI_REG8(0xfd),  0x00 },
>>>>> + { CCI_REG8(0xa0),  0x01 },
>>>>> + { CCI_REG8(0xfd),  0x01 },
>>
>> Please replace these with names macros where possible. I'm sure quite a
>> few of the registers configured here are documented in the datasheet.
>> The registers that configure the mode (analog crop, digital crop,
>> binning, skipping, ...) should be computed dynamically from the subdev
>> pad format and selection rectangles, not hardcoded.
>>
> I agree, but we get the sensor settings based on our requirements from 
> the vendor, i will check if we can get some more info regarding the 
> crop, binning, skipping etc...

Some of this infomation should be available in the datasheet. Use at 
least the register names that can be found, for those that can't there's 
not much that could be done.

-- 
Regards,

Sakari Ailus

