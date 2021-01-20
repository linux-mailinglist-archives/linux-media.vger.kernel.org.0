Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29FBC2FD05A
	for <lists+linux-media@lfdr.de>; Wed, 20 Jan 2021 13:58:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388919AbhATMiO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jan 2021 07:38:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730576AbhATLKB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jan 2021 06:10:01 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBD9DC061757;
        Wed, 20 Jan 2021 03:09:20 -0800 (PST)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E37F4813;
        Wed, 20 Jan 2021 12:09:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1611140958;
        bh=sFi/hEScTaxdTq017okbl3zNwuFGLI/1aZfFPxurQIw=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=jvG//FB2cf01XM13rcS2cwW6ytU7X5awoYe5f/MGGs8G1EadY7k2GTeyU0pSKKsdv
         YJOTYfhxo30TwrA7SlfZgDVk/CXvyKxSxtZzhyzKTbjQOw00otHZPyjB68ptX0fowQ
         XRbGbWOjcahNyMpf3HJwnX+1X7eTltEJ5nPh7ykQ=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH] media: i2c/Kconfig: Select FWNODE for OV772x sensor
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
References: <20210120090148.30598-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <a1c42817-e2e4-b96a-c494-742808443f6b@ideasonboard.com>
 <20210120103648.GI11878@paasikivi.fi.intel.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <8bdf95af-5df7-df7b-4ded-4d291522f77c@ideasonboard.com>
Date:   Wed, 20 Jan 2021 11:09:15 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210120103648.GI11878@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 20/01/2021 10:36, Sakari Ailus wrote:
> On Wed, Jan 20, 2021 at 10:17:14AM +0000, Kieran Bingham wrote:
>> Hi Lad,
>>
>> On 20/01/2021 09:01, Lad Prabhakar wrote:
>>> Fix OV772x build breakage by selecting V4L2_FWNODE config:
>>>
>>> ia64-linux-ld: drivers/media/i2c/ov772x.o: in function `ov772x_probe':
>>> ov772x.c:(.text+0x1ee2): undefined reference to `v4l2_fwnode_endpoint_alloc_parse'
>>> ia64-linux-ld: ov772x.c:(.text+0x1f12): undefined reference to `v4l2_fwnode_endpoint_free'
>>> ia64-linux-ld: ov772x.c:(.text+0x2212): undefined reference to `v4l2_fwnode_endpoint_alloc_parse'
>>>
>>> Fixes: 8a10b4e3601e ("media: i2c: ov772x: Parse endpoint properties")
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>>
>> I see this driver uses subdev API too.
>>
>> Should the driver also select VIDEO_V4L2_SUBDEV_API?
> 
> Yes, it should. Another patch? This one fixes a compilation problem.

Yes, it's probably another patch, because indeed this is a specific fix.

I wonder if that means the builders haven't been able to construct a
combination without VIDEO_V4L2_SUBDEV_API...

--
Kieran


>> Or is that covered sufficiently already on any platforms that would use
>> the driver?
>>
>> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>>
>>> ---
>>>  drivers/media/i2c/Kconfig | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
>>> index eddb10220953..bb1b5a340431 100644
>>> --- a/drivers/media/i2c/Kconfig
>>> +++ b/drivers/media/i2c/Kconfig
>>> @@ -1013,6 +1013,7 @@ config VIDEO_OV772X
>>>  	tristate "OmniVision OV772x sensor support"
>>>  	depends on I2C && VIDEO_V4L2
>>>  	select REGMAP_SCCB
>>> +	select V4L2_FWNODE
>>>  	help
>>>  	  This is a Video4Linux2 sensor driver for the OmniVision
>>>  	  OV772x camera.
>>>
>>
> 

