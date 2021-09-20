Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F4F6412BB5
	for <lists+linux-media@lfdr.de>; Tue, 21 Sep 2021 04:24:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230285AbhIUC0E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Sep 2021 22:26:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237958AbhIUB4z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Sep 2021 21:56:55 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4BB9C0612AF;
        Mon, 20 Sep 2021 16:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=5ET8sA5Ie7MakFr5xOQmdzEW86mFesYnr96/0L8emfI=; b=HyVgL4PBjqi9zDIYOC5rOu8mWO
        jAZ5WYihHx8ZwzALXXWCAx0HyiH3jyHzJ14t0GACIz3p7qP8b8MexFoic08vep0d83ZLonFDnMLTL
        SdRtJzOxXzG8aBjoUVLS1yWhN1+ApRSHt9wPIIA3je09n477ZXNTblPHCYztaWuq8HqIQ/StfNzKQ
        QNyL4eSSNnezUnd5VKarmL5F/Z+r96OJY2ZQTKnS1CSN2heKDYcrdwBT40GLeWcPNyP741VuOhH8U
        wS+S7WlO6gM1pDdDJ2MqkmtjuKPyU3Fsvro33rXqd/jzIm4PxkyJg/KgY914PwylTZInGk+r0FsLx
        6THpCTWg==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mSTAQ-003MSY-6l; Mon, 20 Sep 2021 23:57:46 +0000
Subject: Re: [PATCH] media: rc and cec: keep all menu entries together
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-kernel@vger.kernel.org
Cc:     Sean Young <sean@mess.org>, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20210822000450.27329-1-rdunlap@infradead.org>
 <a2367e5c-015a-3731-fcf2-0c448af83fed@xs4all.nl>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <f392c329-88c6-a846-22ec-b5534e3d3bac@infradead.org>
Date:   Mon, 20 Sep 2021 16:57:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <a2367e5c-015a-3731-fcf2-0c448af83fed@xs4all.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/20/21 4:19 AM, Hans Verkuil wrote:
> Hi Randy,
> 
> On 22/08/2021 02:04, Randy Dunlap wrote:
>> Keep all of the Remote Controller and CEC menu entries grouped
>> together. This is most relevant to 'make xconfig', where the
>> entries for "HDMI CEC RC integration" and "Enable CEC error injection
>> support" are not displayed (presented) anywhere near the other
>> Remote Controller support options.
>> By grouping all of these menu entries inside a menu/endmenu block,
>> they are forced to be kept together.
>>
>> Fixes: 46d2a3b964dd ("media: place CEC menu before MEDIA_SUPPORT")
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> Cc: Sean Young <sean@mess.org>
>> Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> Cc: linux-media@vger.kernel.org
>> Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
>> ---
>>   drivers/media/Kconfig |    2 ++
>>   1 file changed, 2 insertions(+)
>>
>> --- linux-next-20210820.orig/drivers/media/Kconfig
>> +++ linux-next-20210820/drivers/media/Kconfig
>> @@ -6,8 +6,10 @@
>>   #
>>   # NOTE: CEC and Remote Controller support should not depend on MEDIA_SUPPORT
>>   #
>> +menu "Remote Controller and CEC support"
>>   source "drivers/media/rc/Kconfig"
>>   source "drivers/media/cec/Kconfig"
>> +endmenu
> 
> Remote control and CEC really have very little to do with one another, except
> for "HDMI CEC RC integration", which is a feature of CEC.
> 
> It would make more sense IMHO to make a "CEC support" menu and move the
> CEC drivers and "HDMI CEC RC integration" and "Enable CEC error injection
> support" to that new menu. It's a bit odd that those two CEC options are
> directly under the Device Drivers menu.
> 
> Would that work for you?
> 

Hi Hans,
I don't know, but I'll try it out.

Thanks.

> 
>>   
>>   menuconfig MEDIA_SUPPORT
>>   	tristate "Multimedia support"
>>
> 


-- 
~Randy
