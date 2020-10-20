Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92DC32935AA
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 09:22:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404960AbgJTHWq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Oct 2020 03:22:46 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:48307 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731209AbgJTHWq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Oct 2020 03:22:46 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id Ulygkj2DwghRkUlyjktHK0; Tue, 20 Oct 2020 09:22:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1603178564; bh=qZj+i6sOrwIRjc+3Z657jhOxwdEGuC6VCBy9toFJy2k=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=WXeDvMyfAXUjuOVOZ6dtLGSv7JeQaSyjegIAo6DMfPbhbMNV9YxZGP7lP4PmPWO+M
         tAbM23TgBhmesPs6dzd5oLolcDUY63W56htLOp/wDfqnHfz8xJV2GzIp5kMsqRJ0MS
         SIRh/sLInIRlWknMx5Gmalx2wXF9lZKaU9DZqVFyBd6R5/FbLpLGdyN+eQLmPlB3al
         S1rddYDiwNM3rEEzeDRs5bAZFiKDGXpomXeypRRbsFqjECfgNu5hI7xhc4FcQTeToH
         YwDqYyDS+CyNGuo8QXuyMKRmhZx0YftWPq5OBh0iL74zdhyRhWQr41VzSmjGYRcv0z
         fGF3mV6V8PRng==
Subject: Re: [PATCH 1/2] meida: uapi: add MEDIA_BUS_FMT_METADATA_FIXED media
 bus format.
To:     Helen Koike <helen.koike@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, ezequiel@collabora.com,
        kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
References: <20200922165813.19378-1-dafna.hirschfeld@collabora.com>
 <20200922165813.19378-2-dafna.hirschfeld@collabora.com>
 <efddfad8-1908-745e-5b7f-7acb42b531ca@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <e5f8dc43-fd48-03f1-a0a2-8bca370306b5@xs4all.nl>
Date:   Tue, 20 Oct 2020 09:22:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <efddfad8-1908-745e-5b7f-7acb42b531ca@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfH/KWMj1NZZILM5Lor+JDghCFlRIqZFXKrBuBp/jEglgVBlnxFy3UZHXzVPfznwtGtNLFo4g6zME3CmDBs5a8kbrU8nDJPv5tE/f7B1FvqnH8MS3RnXR
 6YM7344JOHr1ajjoS1k6K88tTVL6UMFcNs0kFRAvO+ATfdBOqmJ+NPFOiNz88u7XBT1IV6AjZuCEY6LzCw6/dB6ZKwDj7TjLstOB5/6Yj8CxMoged5sW+ZRs
 c6zCWLPJb0DP/6TCMyFMDOCCc/D6HZaSi4lYyXMDSB1EJQ9J3f6kENeRUSleFkZVeVWlVVI2DHl+99rc9gYtWjk9gFIA6BuRD+asXhW25eC8l68bo1WLp011
 0Q2XDY3yD3bRt57AvqkW4g+72hMpc087OT1HEvZJ26Jjt/FlhgOr7xchgX9EcggNvQf2si6Vm5XaKwxc4KY+JiM55KmlTmiaRzKcfcqF3fTP0ARLbP76ccsy
 CKGZl6amAwAwtFrNFCd86ycc3umcMZD9N+X4z9ZZs0oWwkC2w9djYKt/AmzhgP3AuLq0g9fdTTf/nlVm/neD2L4anXr2s1BLHdKe5w==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 14/10/2020 22:40, Helen Koike wrote:
> 
> 
> On 9/22/20 1:58 PM, Dafna Hirschfeld wrote:
>> MEDIA_BUS_FMT_METADATA_FIXED should be used when
>> the same driver handles both sides of the link and
>> the bus format is a fixed metadata format that is
>> not configurable from userspace.
>>
>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> 
> Acked-by: Helen Koike <helen.koike@collabora.com>
> 
> Thanks
> Helen
> 
>> ---
>>  include/uapi/linux/media-bus-format.h | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
>> index 84fa53ffb13f..847b45fb546b 100644
>> --- a/include/uapi/linux/media-bus-format.h
>> +++ b/include/uapi/linux/media-bus-format.h
>> @@ -156,4 +156,12 @@
>>  /* HSV - next is	0x6002 */
>>  #define MEDIA_BUS_FMT_AHSV8888_1X32		0x6001
>>  
>> +/*
>> + * This format should be used when the same driver handles
>> + * both sides of the link and the bus format is a fixed
>> + * metadata format that is not configurable from userspace.
>> + * This format may have 0 height and width.

I would make this stronger:

"Width and height will be set to 0 for this format."

Regards,

	Hans

>> + */
>> +#define MEDIA_BUS_FMT_METADATA_FIXED		0x7001
>> +
>>  #endif /* __LINUX_MEDIA_BUS_FORMAT_H */
>>

