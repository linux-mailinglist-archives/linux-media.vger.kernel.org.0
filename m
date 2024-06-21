Return-Path: <linux-media+bounces-13936-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E716D912748
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 16:08:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1AEB41C22308
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 14:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A00019BDC;
	Fri, 21 Jun 2024 14:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="OeKeDMG/"
X-Original-To: linux-media@vger.kernel.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2DC11182;
	Fri, 21 Jun 2024 14:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718978917; cv=none; b=AMn0xDLmf/MPnx+HacFnjS2c28mUqKBQemryuHfxqGSzZezoHadYIWOS8SOCFGnlKjI4rTvaKNOIHph4tEFR/SkaB/3H9ts0iXLYkBfA9W3Zn2/pbte3QG2/oIZyZGtRPxHHXwxMBh6yZNbkK0BsBGgtkbslAy24NfF9PJ7Zz4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718978917; c=relaxed/simple;
	bh=IoUiP/xn44M4Y0B+QGR4l0KeHWaCD8pkp2vO2pHnri4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=s7jMUnnz5RqIzbmE5z9rfsQA05wQ0gmyc6eeQ1JgF6NdfiIjLDx9tXwURyNHCdjfZHPXCdo/B0N+nRXgZRPyMOvQgIZ+UTeeJb0bPIz5DqtdfLwnPFbAwx+OyBOFmIkcGHNkIFaSVKj1jU6S+JGl8QvaKu7S1I2WPfA9ilsMc7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=OeKeDMG/; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45LE8NGX062013;
	Fri, 21 Jun 2024 09:08:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718978903;
	bh=ZLEC4Mmpek7iyAZO5B9CzgsF9BpMj0Yvny+5kmVsxLY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=OeKeDMG/gJvCde1O+lfMHNa1C51B6lCPCuos1d92vKH+M+5hfI4R6Fh2vGAiR5YTx
	 SWaGzXkIJ3UYAM7gfvWAlpTshrDs5Ej17Q9WQAk+fip/HUQMdsQo/xAzpYLUP1qlOe
	 vqL6vakHnyN7SebRyFA7LJSihfLU90d6SlCRGXqo=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45LE8Nm1028306
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 21 Jun 2024 09:08:23 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 21
 Jun 2024 09:08:23 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 21 Jun 2024 09:08:23 -0500
Received: from [172.24.227.193] (devarsht.dhcp.ti.com [172.24.227.193] (may be forged))
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45LE8Gx7113670;
	Fri, 21 Jun 2024 09:08:17 -0500
Message-ID: <8c10a338-c2c2-64b8-40db-1cbc20822c39@ti.com>
Date: Fri, 21 Jun 2024 19:38:16 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v14 2/6] media: imagination: Add E5010 JPEG Encoder driver
Content-Language: en-US
To: Sebastian Fricke <sebastian.fricke@collabora.com>
CC: <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-rockchip@lists.infradead.org>,
        <benjamin.gaignard@collabora.com>, <laurent.pinchart@ideasonboard.com>,
        <praneeth@ti.com>, <nm@ti.com>, <vigneshr@ti.com>, <a-bhatia1@ti.com>,
        <j-luthra@ti.com>, <b-brnich@ti.com>, <detheridge@ti.com>,
        <p-mantena@ti.com>, <vijayp@ti.com>, <andrzej.p@collabora.com>,
        <nicolas@ndufresne.ca>, <afd@ti.com>
References: <20240618193651.2771478-1-devarsht@ti.com>
 <20240618193651.2771478-3-devarsht@ti.com>
 <20240621123715.enqtdqxskdkod5ze@basti-XPS-13-9310>
 <8dda9d0c-3154-a7fd-1233-ca5be59639de@ti.com>
 <20240621132658.m2utqnvwaicgiwqr@basti-XPS-13-9310>
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <20240621132658.m2utqnvwaicgiwqr@basti-XPS-13-9310>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Hi Sebastian,

On 21/06/24 18:56, Sebastian Fricke wrote:
> Hey Devarsh,
> 
> On 21.06.2024 18:14, Devarsh Thakkar wrote:
>> Hi Sebastian
>>
>> On 21/06/24 18:07, Sebastian Fricke wrote:
>>> Hey Devarsh,
>>>
>>> This doesn't compile without errors for me, curious, it probably did
>>> compile without problems for you right?
>>>
>>> drivers/media/platform/imagination/e5010-jpeg-enc.c:1622:19: error:
>>> initialization of ‘int (*)(struct platform_device *)’ from incompatible
>>> pointer type ‘void (*)(struct platform_device *)’
>>> [-Werror=incompatible-pointer-types]
>>>  1622 |         .remove = e5010_remove,
>>>       |                   ^~~~~~~~~~~~
>>> drivers/media/platform/imagination/e5010-jpeg-enc.c:1622:19: note: (near
>>> initialization for ‘e5010_driver.remove’)
>>> cc1: some warnings being treated as errors
>>>
>>
>> Yes I think it did compile fine for me.
>> Did you try this on tip of linux-next ?
> 
> Nope the media subsystem is not based on linux-next, but instead on:
> https://git.linuxtv.org/media_stage.git/log/
> Please make sure that your patches compile on top of that.
> 

Sure, will take care of this in future.

>>
>> As mentioned in changelog, there was update in platform driver for return type
>> of remove function which got changed to void return type. Please check if you
>> have this patch [1] in your tree which got recently merged.
> 
> No that patch is not part of the tree yet.
> 
> Please note also the following section in that patch:
> 

I think the said patch removes below comment.

>      /*
>      * Traditionally the remove callback returned an int which however is
>      * ignored by the driver core. This led to wrong expectations by driver
>      * authors who thought returning an error code was a valid error
>      * handling strategy. To convert to a callback returning void, new
>      * drivers should implement .remove_new() until the conversion it done
>      * that eventually makes .remove() return void.
> 
> So your driver is expected to implement remove_new().
> 

If I look at the tip of linux-next (which is rc4+) [1], the above comment is
now removed and it says that new drivers are supposed to implement .remove()
only. But yeah, as media_tree doesn't have this patch it may require to have
int remove() and void remove_new() as you mention, but eventually when
media_stage tree gets synced with above patch pulled in, we may require to
update again to what is present in this patch.

> I will take care of this for the PR, but please note for the future:
> It has to work with media_stage, unless you have a very good reason for
> something different.
> 

Sure, thanks for taking care of this. Feel free to let me know if any issues
faced.

Regards
Devarsh

[1]:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/include/linux/platform_device.h?h=next-20240620#n240

