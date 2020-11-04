Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B1D02A63FF
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 13:16:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729678AbgKDMQM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 07:16:12 -0500
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:34843 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729309AbgKDMQL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 4 Nov 2020 07:16:11 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id aHhrkUq1e1R0xaHhukHoA2; Wed, 04 Nov 2020 13:16:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1604492169; bh=gb+1vNw1Ohe1iS6W/tbN98dqhc7fGUXmMrsirp6KY70=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=NPjb0uNGh/zpILQZ+8Eo5KUS6ZAEykd0TYgudkiujLbfqs+QTLlc6mpW0XLSs19ZR
         ZsXiLC3lNM4W+/DoLfecxuoYNUxYIg/DOrbUekVDANkg7MEEjnZWcIchTiSetAvEHc
         eLEMqGgV8VJ/QIybtM/PWYJNRNzCoYXqffPoV+yQP59XeaqUqpqpvwo6ymXYdzN5xi
         JOYb7tZZ6wXXjW3fMwx9Gm/hXpx8iKgr8Vpl9KEQS84NHau9m02P70SIIVaBqUcYpz
         lVFi7Sg8D3xu0POfhg745RUeaXlXrXN6jacfa326gdl4wm/aKIJe45GixQlQCR5KaW
         DYp/M1jAtuE6g==
Subject: Re: [PATCH v3 1/2] media: uapi: add MEDIA_BUS_FMT_METADATA_FIXED
 media bus format.
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        kernel@collabora.com, dafna3@gmail.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org
References: <20201030134609.30020-1-dafna.hirschfeld@collabora.com>
 <20201030140241.GQ26150@paasikivi.fi.intel.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <5c8852f5-a803-1bd0-7798-3cca0d7ee9ea@xs4all.nl>
Date:   Wed, 4 Nov 2020 13:16:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201030140241.GQ26150@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfF374HHkq5vaQ58NGm/NbiU0l8+/OLdXNKxYHyJnV6lkoUGEW+kxrwwBImeMXWHmIsigGKLDrfKrofIQRDMumISimzGoLGljQjCS84L75ZF+4hqDgKcr
 053+8USneIkyNRTaGqFrJk50ra0jeHa2eobCe0Vk/WyPmwxfZAf7u8d9BmO/3utaQkV/eEj5nCdTm3IVtUkNn7Yq01ieE3ZF/mLGWiUHbwcQWc9/pKEGvB0K
 xmNOD5E+sfhlfhvXlEeENq8/90C7zY5cNyi+J3LDT42z0zQYaLsvcE1hNEauecuM5DJTftAvgD+4/WrX9PdfcHLefEFT5jz22ykP4lZR24VspZ8mYUpQ8VAb
 gXzqRsmtjVQUrudtOIZZcjhI2U3/Mu4aSJ0o2XDmTtGmZrQLWdXklyKAS3GlSmdyM0kNxVfdfk1URGSENWdnAkthkQimWa1M32Fi2C+ZmA5BnyE+w7FZ1FcD
 bbRs3FYS3ihMVxqz9xesxMN5kmG7hAI18V8ccyyb+uPjPjbB4BY7StczYL7V10bdRA3hKYRhu/60j4/zJ6Rp59QwuXN52TDNOvTjUg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 30/10/2020 15:02, Sakari Ailus wrote:
> Hi Dafna,
> 
> On Fri, Oct 30, 2020 at 02:46:08PM +0100, Dafna Hirschfeld wrote:
>> MEDIA_BUS_FMT_METADATA_FIXED should be used when
>> the same driver handles both sides of the link and
>> the bus format is a fixed metadata format that is
>> not configurable from userspace.
>> The width and height will be set to 0 for this format.
>>
>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>> Acked-by: Helen Koike <helen.koike@collabora.com>
>> ---
>> changes since v2:
>> added documentation in subdev-formats.rst
>> changes since v1:
>> 1. replace "This format may have 0 height and width."
>> with "Width and height will be set to 0 for this format."
>> and add it also to the commit log
>> 2. s/meida:/media:/ in the patch subject line
>>
>>  .../media/v4l/subdev-formats.rst              | 27 +++++++++++++++++++
>>  include/uapi/linux/media-bus-format.h         |  8 ++++++
>>  2 files changed, 35 insertions(+)
>>
>> diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
>> index c9b7bb3ca089..7f16cbe46e5c 100644
>> --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
>> +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
>> @@ -7899,3 +7899,30 @@ formats.
>>        - 0x5001
>>        - Interleaved raw UYVY and JPEG image format with embedded meta-data
>>  	used by Samsung S3C73MX camera sensors.
>> +
>> +.. _v4l2-mbus-metadata-fmts:
>> +
>> +Metadata Formats
>> +^^^^^^^^^^^^^^^^
>> +
>> +This section lists all metadata formats.
>> +
>> +The following table lists the existing metadata formats.
>> +
>> +.. tabularcolumns:: |p{8.0cm}|p{1.4cm}|p{7.7cm}|
>> +
>> +.. flat-table:: Metadata formats
>> +    :header-rows:  1
>> +    :stub-columns: 0
>> +
>> +    * - Identifier
>> +      - Code
>> +      - Comments
>> +    * .. _MEDIA-BUS-FMT-METADATA-FIXED:
>> +
>> +      - MEDIA_BUS_FMT_METADATA_FIXED
>> +      - 0x7001
>> +      - This format should be used when the same driver handles
>> +	both sides of the link and the bus format is a fixed
>> +	metadata format that is not configurable from userspace.
>> +	Width and height will be set to 0 for this format.
>> diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
>> index 84fa53ffb13f..2ce3d891d344 100644
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
>> + * Width and height will be set to 0 for this format.
>> + */
> 
> Does this mean that metadata with dimensions should not use
> MEDIA_BUS_FMT_METADATA_FIXED? I guess that's not the intention? For some
> formats the dimensions would be relevant but for others not. I'd thus
> replace "will" by "may". Same for the documentation.

struct v4l2_meta_format as used with VIDIOC_G/S/TRY_FMT doesn't have
a width or height either. Supporting width and height for metadata
doesn't really make sense for me for metadata.

Explicitly specifying the width and height here indicates that the
data is basically an array of width x height of some sort which makes
sense for video devices.

Metadata is more complex data that cannot be represented like that.
If metadata is actually an array, then I'm not sure I would call it
metadata, I would probably see it as video with its own pixelformat
that contains non-video data.

Regards,

	Hans

> 
>> +#define MEDIA_BUS_FMT_METADATA_FIXED		0x7001
>> +
>>  #endif /* __LINUX_MEDIA_BUS_FORMAT_H */
> 

