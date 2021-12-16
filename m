Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A734477130
	for <lists+linux-media@lfdr.de>; Thu, 16 Dec 2021 12:57:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234166AbhLPL51 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Dec 2021 06:57:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234158AbhLPL50 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Dec 2021 06:57:26 -0500
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68598C06173F;
        Thu, 16 Dec 2021 03:57:26 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 8373F812A2;
        Thu, 16 Dec 2021 12:57:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1639655843;
        bh=9kn/rMOWbkIMrbqU+OwyrOafr5ZqzX/7z9uHmflLjV8=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=acg+xnew1O1QGGxGP8UWtsr9gwxYS+OSmDZcbFNeOmJQekHLdHJSNjHYLRS03nIR9
         CMYVvF5FGN0fYEXM1Aq4gjN8qWToaqmnLKci7CfyF+F0nqEZKVfxpDOgx194PCsStw
         LB0Gk5Bf5SojFFnhGL+ukqcB/GsanFP5LViSIEavA0u4VB41zmrBegmtw1tbW6dGPr
         DhDSOFLtXdOQGomHdJLqVq9GnfkJ/lo8GayJeYLSH/gl92YZ0uPIPCu79VbQRXT3MP
         JBoUMAGkr9eGLBj5jAseRTII5Rpwj4mjaEzXgKzddcs6ayTcgDc4Bma4bo/H/4cHce
         7M22+hpW7stfg==
Message-ID: <44ca558e-8481-89e6-a190-42cef8dddefb@denx.de>
Date:   Thu, 16 Dec 2021 12:57:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v9 3/3] media: i2c: isl7998x: Add driver for Intersil
 ISL7998x
Content-Language: en-US
To:     Michael Tretter <m.tretter@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        p.zabel@pengutronix.de, Ian Arkver <ian.arkver.dev@gmail.com>,
        kernel@pengutronix.de, Hans Verkuil <hverkuil@xs4all.nl>
References: <20211129112708.3219754-1-m.tretter@pengutronix.de>
 <20211129112708.3219754-4-m.tretter@pengutronix.de>
 <20211214111458.280e4e82@coco.lan> <20211216114105.GD29518@pengutronix.de>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <20211216114105.GD29518@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/16/21 12:41, Michael Tretter wrote:
> On Tue, 14 Dec 2021 11:14:58 +0100, Mauro Carvalho Chehab wrote:
>> Em Mon, 29 Nov 2021 12:27:08 +0100
>> Michael Tretter <m.tretter@pengutronix.de> escreveu:
>>
>>> From: Marek Vasut <marex@denx.de>
>>>
>>> Add driver for the Intersil ISL7998x Analog to MIPI CSI-2/BT656 decoder.
>>> This chip supports 1/2/4 analog video inputs and converts them into
>>> 1/2/4 VCs in MIPI CSI2 stream.
>>>
>>> This driver currently supports ISL79987 and both 720x480 and 720x576
>>> resolutions, however as per specification, all inputs must use the
>>> same resolution and standard. The only supported pixel format is now
>>> YUYV/YUV422. The chip should support RGB565 on the CSI2 as well, but
>>> this is currently unsupported.
>>
>> There are *lots* of checkpatch warnings (on strict mode) due to the
>> usage of CamelCase macros. Please fix. Just doing that should be enough
>> to solve them:
>>
>>    sed s,ISL7998x_REG_Px_ACA_FLEX_WIN_Y_BL_H,ISL7998X_REG_PX_ACA_FLEX_WIN_Y_BL_H,g -i drivers/media/i2c/isl7998x.c
>>    sed s,ISL7998x,ISL7998X,g -i drivers/media/i2c/isl7998x.c
>>    sed s,ISL7998X_REG_Pn,ISL7998X_REG_PN, -i drivers/media/i2c/isl7998x.c
>>    sed s,ISL7998X_REG_Pn,ISL7998X_REG_PN,g -i drivers/media/i2c/isl7998x.c
>>    sed s,ISL7998X_REG_PX,ISL7998X_REG_PX,g -i drivers/media/i2c/isl7998x.c
>>    sed s,ISL7998X_REG_Px,ISL7998X_REG_PX,g -i drivers/media/i2c/isl7998x.c
> 
> These are easy to fix.

Isn't that counter-productive to rename Pn (which represents P0, P1, 
P2...) to PN which is hard to tell what it represents ?

I would say checkpatch strict mode is wrong here and the Pn is more 
readable.

Note that there is sed 's@\<ISL7998[^ ]\+\>@\U&@' regex too which turns 
all those macros into uppercase if that's what you're after, but I don't 
like that approach.

[...]
