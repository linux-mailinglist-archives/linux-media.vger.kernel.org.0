Return-Path: <linux-media+bounces-30558-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B46A93AD6
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 18:27:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D4151886B0F
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 16:27:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 193ED21A928;
	Fri, 18 Apr 2025 16:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b="AolW9ZYs"
X-Original-To: linux-media@vger.kernel.org
Received: from ixit.cz (ip-89-177-23-149.bb.vodafone.cz [89.177.23.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBF721517C;
	Fri, 18 Apr 2025 16:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.177.23.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744993451; cv=none; b=MzuEi2GaYhR6vDY9j1GJzL8XjbWj/Nh35NTTE4EmDPeUJObp6awTEfGIDfjHuIAAQZ9FbzTn3dO7YZAroDYGGUygWPkHSxl0xfJO42IL5ILMIFvHRiT3dR6CKluiRxUNJChSO1HwjgBUq9jBKmJFdnfJ+0TBL6L9D+v4Eq+I690=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744993451; c=relaxed/simple;
	bh=D+p4wr9ZGZF1nabMD0H7Kxj219O2eT69eVVmsj2xsvs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bjsvg5r5JdRGgZ+B+sMI85HbEALQpTKwRhf8luDYe9JjdzYgmuojVlbGpXQ8BBTUvCsfS6Uw/arrk/aV+KF+n5sQjAMmgb/ZzqQD3mNM2FdHFKJ4GioBJYq3YDVcFD9m80eZQ2AmD1Gj+EBiFDKRHMuu2yQCoFbDKItmWIAw5Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz; spf=pass smtp.mailfrom=ixit.cz; dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b=AolW9ZYs; arc=none smtp.client-ip=89.177.23.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Received: from [10.0.0.185] (unknown [10.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id 18098166C61;
	Fri, 18 Apr 2025 18:24:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1744993444;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Ge1lbHH+3YTLXPd6ZuMcpLqjgL8cA3thPs+6e8xss/k=;
	b=AolW9ZYsARmzEs8qRsXYkyF5fizeNwOeRVfZwiLygEnhCXhTFSazRl0igaj/jr6TmoCBNF
	pin4dWpsfYZ2gBWjGItFSTcBZj4oDi/rxuRX73kI3r7GGUgPDESb3AEfyWlIUcrMRFMt60
	MBzKGykjsurQVSTKxg1VLjpPdo8Uju0=
Message-ID: <1d88dd72-8c5d-459a-b681-6a44d32e93df@ixit.cz>
Date: Fri, 18 Apr 2025 18:24:03 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] media: i2c: ov02e10: add OV02E10 image sensor
 driver
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Hans de Goede <hansg@kernel.org>
Cc: Jingjing Xiong <jingjing.xiong@intel.com>, Hao Yao <hao.yao@intel.com>,
 Jim Lai <jim.lai@intel.com>, You-Sheng Yang <vicamo.yang@canonical.com>,
 Alan Stern <stern@rowland.harvard.edu>, Hans de Goede <hdegoede@redhat.com>,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250407-b4-media-comitters-next-25-03-13-ov02e10-v4-0-211e3e6fae90@linaro.org>
 <20250407-b4-media-comitters-next-25-03-13-ov02e10-v4-2-211e3e6fae90@linaro.org>
Content-Language: en-US
From: David Heidelberg <david@ixit.cz>
Autocrypt: addr=david@ixit.cz; keydata=
 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
In-Reply-To: <20250407-b4-media-comitters-next-25-03-13-ov02e10-v4-2-211e3e6fae90@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Tested-by: David Heidelberg <david@ixit.cz>  # Dell Latitude 9440 2024

Thank you!
David

On 07/04/2025 11:13, Bryan O'Donoghue wrote:
> From: Jingjing Xiong <jingjing.xiong@intel.com>
> 
> Add in the ov02e10 driver from the Intel IPU6 repository.
> 
> Changelog to IPU6 incoming driver:
> 
> - handhake GPIO
>    The IPU6 handshake GPIO signals to the FPGA on IPU6/IPU7 laptops and as
>    such is not a sensor signal.
> 
>    Hans has a proposal for handling those GPIOs below. Dropf from the
>    incoming sensor driver.
> 
>    Link: https://lore.kernel.org/linux-media/4b87a956-a767-48dc-b98b-f80d9a44adc8@redhat.com
> 
> - Regulators
>    Change to regulator_bulk API to capture the full range of rails to the
>    o02e10 sensor.
> 
>    This will work for ACPI systems which only have the avdd rail available
>    as missing rails won't fail the regulator_bulk_* function calls.
> 
>    Convert the existing avdd single rail to regulator_bulk API.
> 
> - Clocks
> 
>    Move the MCLK validation logic to check_hwcfg() and move check_hwcfg()
>    to after devm_kzalloc() so that we can pass a struct ov02e pointer to
>    check_hwcfg() to begin to enumerate that structure.
> 
>    Reworks MCLK clock get logic to facilitate OF
> 
> - Power on/off
> 
>    Implement specification on and off delays on power-up
> 
>    The ov02e10 specification says for power-on:
> 
>    t3 = the time between dvdd stable and XSHUTDOWN deassert
>    t5 = the time between XSHUTDOWN deassert and SCCB ready
> 
>    The power-off path in the spec shows no required delays between XSHUTDOWN
>    and power-rail shut off but, if the reset GPIO is not defined no action is
>    taken to change its logical state.
> 
> - Remove dev_dbg() and extra dev_err()
> 
>    Several instances of dev_dbg() and dev_err() were removed.
>    dev_xxx() calls common in development can be stripped away for upstream.
> 
>    We have multiple on-list tests for this code on X86 and Arm so most of
>    the verbose dev_xxx() calls are redundant now.
> 
> - Add OF probe support
> 
>    Simple addition of ovti,0v02e10 compat string and associated resource
>    structure entry.
> 
> - Extend MODULE_AUTHOR list
>    Adds Hans, Alan and myself
> 
> - Conversion to v4l2 subdevice-state
> 
> - Added HFLIP and VFLIP support
> 
> Signed-off-by: Jingjing Xiong <jingjing.xiong@intel.com>
> Co-developed-by: Hao Yao <hao.yao@intel.com>
> Signed-off-by: Hao Yao <hao.yao@intel.com>
> Co-developed-by: Jim Lai <jim.lai@intel.com>
> Signed-off-by: Jim Lai <jim.lai@intel.com>
> Co-developed-by: You-Sheng Yang <vicamo.yang@canonical.com>
> Signed-off-by: You-Sheng Yang <vicamo.yang@canonical.com>
> Co-developed-by: Alan Stern <stern@rowland.harvard.edu>
> Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> Co-developed-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   MAINTAINERS                 |   9 +
>   drivers/media/i2c/Kconfig   |  10 +
>   drivers/media/i2c/Makefile  |   1 +
>   drivers/media/i2c/ov02e10.c | 969 ++++++++++++++++++++++++++++++++++++++++++++
>   4 files changed, 989 insertions(+)
> 

