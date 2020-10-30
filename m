Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21B482A0432
	for <lists+linux-media@lfdr.de>; Fri, 30 Oct 2020 12:34:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726055AbgJ3LeX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Oct 2020 07:34:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725355AbgJ3LeX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Oct 2020 07:34:23 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A4E5C0613D2
        for <linux-media@vger.kernel.org>; Fri, 30 Oct 2020 04:34:23 -0700 (PDT)
Received: from [IPv6:2003:c7:cf1c:4d00:58b3:6683:91ae:b6a8] (p200300c7cf1c4d0058b3668391aeb6a8.dip0.t-ipconnect.de [IPv6:2003:c7:cf1c:4d00:58b3:6683:91ae:b6a8])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 640F21F45EBC;
        Fri, 30 Oct 2020 11:34:21 +0000 (GMT)
Subject: Re: [PATCH v2 1/2] media: uapi: add MEDIA_BUS_FMT_METADATA_FIXED
 media bus format.
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, helen.koike@collabora.com,
        ezequiel@collabora.com, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
References: <20201020154522.654-1-dafna.hirschfeld@collabora.com>
 <04d5a149-8745-ae20-a622-bcfcafb69cbb@xs4all.nl>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <36159037-bf65-f7be-8deb-735afd726eee@collabora.com>
Date:   Fri, 30 Oct 2020 12:34:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <04d5a149-8745-ae20-a622-bcfcafb69cbb@xs4all.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



Am 30.10.20 um 09:58 schrieb Hans Verkuil:
> On 20/10/2020 17:45, Dafna Hirschfeld wrote:
>> MEDIA_BUS_FMT_METADATA_FIXED should be used when
>> the same driver handles both sides of the link and
>> the bus format is a fixed metadata format that is
>> not configurable from userspace.
>> The width and height will be set to 0 for this format.
>>
>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>> Acked-by: Helen Koike <helen.koike@collabora.com>
>> ---
>> changes since v1:
>> 1. replace "This format may have 0 height and width."
>> with "Width and height will be set to 0 for this format."
>> and add it also to the commit log
>> 2. s/meida:/media:/ in the patch subject line
>>
>>   include/uapi/linux/media-bus-format.h | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
>> index 84fa53ffb13f..2ce3d891d344 100644
>> --- a/include/uapi/linux/media-bus-format.h
>> +++ b/include/uapi/linux/media-bus-format.h
>> @@ -156,4 +156,12 @@
>>   /* HSV - next is	0x6002 */
>>   #define MEDIA_BUS_FMT_AHSV8888_1X32		0x6001
>>   
>> +/*
>> + * This format should be used when the same driver handles
>> + * both sides of the link and the bus format is a fixed
>> + * metadata format that is not configurable from userspace.
>> + * Width and height will be set to 0 for this format.
>> + */
>> +#define MEDIA_BUS_FMT_METADATA_FIXED		0x7001
>> +
>>   #endif /* __LINUX_MEDIA_BUS_FORMAT_H */
>>
> 
> Documentation/userspace-api/media/v4l/subdev-formats.rst also needs to
> be updated.

hi,
I wonder what should be the documentation, since this mbus code
is for very specific use case. You think that the 0x7* mbus codes
should be 'metadata mbus codes'?

Thanks,
Dafna


> 
> Regards,
> 
> 	Hans
> 
