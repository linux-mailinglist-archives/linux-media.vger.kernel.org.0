Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C7C119849D
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2020 21:37:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728065AbgC3Th6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Mar 2020 15:37:58 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:35832 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727749AbgC3Th6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Mar 2020 15:37:58 -0400
Received: from [IPv6:2804:431:e7cc:11ff:4f80:3de:e2b2:5c1d] (unknown [IPv6:2804:431:e7cc:11ff:4f80:3de:e2b2:5c1d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 2E94C293630;
        Mon, 30 Mar 2020 20:37:53 +0100 (BST)
Subject: Re: [PATCH v2 2/3] media: vimc: Add missing {RGB,BGR,GBR}888 media
 bus codes
To:     Shuah Khan <skhan@linuxfoundation.org>,
        =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= 
        <nfraprado@protonmail.com>, linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        linux-kernel@vger.kernel.org, lkcamp@lists.libreplanetbr.org
References: <20200326214730.2449707-1-nfraprado@protonmail.com>
 <20200326214730.2449707-3-nfraprado@protonmail.com>
 <47dec848-dd66-9b5a-d7e6-38f6ea050b2e@linuxfoundation.org>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <f10836eb-90f9-53ed-1d78-311b3dfd9d5a@collabora.com>
Date:   Mon, 30 Mar 2020 16:37:49 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <47dec848-dd66-9b5a-d7e6-38f6ea050b2e@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 3/26/20 6:56 PM, Shuah Khan wrote:
> On 3/26/20 3:47 PM, Nícolas F. R. A. Prado wrote:
>> Add missing RGB888_*, BGR888_* and GBR888_* media bus codes in the
>> vimc_pix_map_list. Since there is no GBR24 pixelformat, use the RGB24
>> pixelformat for MEDIA_BUS_FMT_GBR888_1X24.
>>
>> Co-developed-by: Vitor Massaru Iha <vitor@massaru.org>
>> Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
>> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@protonmail.com>
>> ---
>>
>> Changes in v2:
>> - Fix array formatting
>> - Change commit message to reflect v2 changes
>> - Change code array size
>> - Add other BGR888 and RGB888 formats to BGR24 and RGB24 pixelformats
>>
>>   drivers/media/platform/vimc/vimc-common.c | 16 ++++++++++++++--
>>   drivers/media/platform/vimc/vimc-common.h |  2 +-
>>   2 files changed, 15 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/platform/vimc/vimc-common.c b/drivers/media/platform/vimc/vimc-common.c
>> index 119846f3eaa5..11489334cff7 100644
>> --- a/drivers/media/platform/vimc/vimc-common.c
>> +++ b/drivers/media/platform/vimc/vimc-common.c
>> @@ -19,13 +19,25 @@ static const struct vimc_pix_map vimc_pix_map_list[] = {
>>         /* RGB formats */
>>       {
>> -        .code = { MEDIA_BUS_FMT_BGR888_1X24 },
>> +        .code = {
>> +            MEDIA_BUS_FMT_BGR888_1X24,
>> +            MEDIA_BUS_FMT_BGR888_3X8
>> +        },
>>           .pixelformat = V4L2_PIX_FMT_BGR24,
>>           .bpp = 3,
>>           .bayer = false,
>>       },
>>       {
>> -        .code = { MEDIA_BUS_FMT_RGB888_1X24 },
>> +        .code = {
>> +            MEDIA_BUS_FMT_RGB888_1X24,
>> +            MEDIA_BUS_FMT_RGB888_2X12_BE,
>> +            MEDIA_BUS_FMT_RGB888_2X12_LE,
>> +            MEDIA_BUS_FMT_RGB888_3X8,
>> +            MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
>> +            MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA,
>> +            MEDIA_BUS_FMT_RGB888_1X32_PADHI,
>> +            MEDIA_BUS_FMT_GBR888_1X24
>> +        },
>>           .pixelformat = V4L2_PIX_FMT_RGB24,
>>           .bpp = 3,
>>           .bayer = false,
>> diff --git a/drivers/media/platform/vimc/vimc-common.h b/drivers/media/platform/vimc/vimc-common.h
>> index 585441694c86..d5e0e8d32542 100644
>> --- a/drivers/media/platform/vimc/vimc-common.h
>> +++ b/drivers/media/platform/vimc/vimc-common.h
>> @@ -69,7 +69,7 @@ do {                                    \
>>    * V4L2_PIX_FMT_* fourcc pixelformat and its bytes per pixel (bpp)
>>    */
>>   struct vimc_pix_map {
>> -    unsigned int code[1];
> 
>> +    unsigned int code[8];
> Please add a define for this instead of hard coded value.

With this change suggested by Shuah:

Acked-by: Helen Koike <helen.koike@collabora.com>

Regards,
Helen

> 
> 
>>       unsigned int bpp;
>>       u32 pixelformat;
>>       bool bayer;
>>
> 
