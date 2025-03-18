Return-Path: <linux-media+bounces-28422-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8CCA67593
	for <lists+linux-media@lfdr.de>; Tue, 18 Mar 2025 14:51:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5D1C3BB6E6
	for <lists+linux-media@lfdr.de>; Tue, 18 Mar 2025 13:51:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8325B20D50A;
	Tue, 18 Mar 2025 13:51:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E2E19E7FA;
	Tue, 18 Mar 2025 13:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742305889; cv=none; b=TC1AVZjqFjI1hRd19CzX+cTyfIovalBVDgKUFbqkvLOZ3WTbs+lGBtzXQor14B8IB9DQjJ3eEm28Lf/83I/4kW5qkvm7Wowfy9TBHiP1+SI1ne2pFHRGjeJ8rvEUdPsj7R1b6kSzqxOJ66ysXYFcK3s0mnN15J6dOhf0lla+QP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742305889; c=relaxed/simple;
	bh=5uyufKA0Lw5iJw0PGCK7xtNCK3JfWODSy+ObVHkflrY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sq0sJqYjOXh7CjyNVSn1Ax4bXiifkT/aafIxwXOQ3vG87u0bjYeW833cZXfq/V8Q0rd36l2/Ubkg/2nGpZXeY3P9WPrVpYeOqxryZqPDJOz2JuLrHA8/IdvP4IOGBkdJUwsHKyVdhrwCUt6qx3MbAHbHhJRq2afu01xBSVkVD48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C91DEC4CEDD;
	Tue, 18 Mar 2025 13:51:26 +0000 (UTC)
Message-ID: <0eb40ff7-7123-477f-a477-6d537195346b@xs4all.nl>
Date: Tue, 18 Mar 2025 14:51:24 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: i2c: lt6911uxe: Fix Kconfig dependencies:
To: Arnd Bergmann <arnd@arndb.de>, "Yan, Dongcheng"
 <dongcheng.yan@intel.com>, Arnd Bergmann <arnd@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 "laurent.pinchart" <laurent.pinchart@ideasonboard.com>,
 Umang Jain <umang.jain@ideasonboard.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250314154738.3983798-1-arnd@kernel.org>
 <ecb959fe-69e3-4265-9e4b-326bff421153@intel.com>
 <3bb730a9-5d8a-41c6-8a27-e099561b5890@app.fastmail.com>
Content-Language: en-US
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <3bb730a9-5d8a-41c6-8a27-e099561b5890@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi all,

On 3/17/25 11:32, Arnd Bergmann wrote:
> On Mon, Mar 17, 2025, at 11:17, Yan, Dongcheng wrote:
>> On 3/14/2025 11:46 PM, Arnd Bergmann wrote:
>>> From: Arnd Bergmann <arnd@arndb.de>
> 
>>> @@ -1149,8 +1149,9 @@ config VIDEO_ISL7998X
>>>  
>>>  config VIDEO_LT6911UXE
>>>  	tristate "Lontium LT6911UXE decoder"
>>> -	depends on ACPI && VIDEO_DEV
>>> +	depends on ACPI && VIDEO_DEV && I2C
>>>  	select V4L2_FWNODE
>>> +	select V4L2_CCI_I2C
>>>  	help
>>>  	  This is a Video4Linux2 sensor-level driver for the Lontium
>>>  	  LT6911UXE HDMI to MIPI CSI-2 bridge.
>>
>> Thanks for your fix.
>>
>> Lkp is a bit weird to me, because it tested a warning in patch v6 likes
>> below:
>>
>>     kismet: WARNING: unmet direct dependencies detected for V4L2_CCI_I2C
>> when selected by VIDEO_LT6911UXE
> 
> What was the full warning? The only dependency I see in V4L2_CCI_I2C
> is CONFIG_I2C itself, and that is what I add above.
> 
>> So I remove this select flag and passed lkp build test in patch v7.
>> But now it encounters build error again, I'm curious why...
> 
> I don't currently get any more build errors with my patch
> added in, and I think this should be sufficient. Can you forward
> me the errors and config you get with my patch?

FYI: I plan to take Arnd's patch tomorrow to be in time for the merge window.

If more issues are found, then they can be on top later.

Regards,

	Hans

> 
>      Arnd
> 


