Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 057DD198CD4
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2020 09:20:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbgCaHUy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Mar 2020 03:20:54 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:41158 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726299AbgCaHUy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Mar 2020 03:20:54 -0400
Received: from [IPv6:2a02:810a:1140:6758:982b:112f:3e03:c20d] (unknown [IPv6:2a02:810a:1140:6758:982b:112f:3e03:c20d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 63537296944;
        Tue, 31 Mar 2020 08:20:52 +0100 (BST)
Subject: Re: [PATCH] media: v4l2-common: change the pixel_enc of
 V4L2_PIX_FMT_GREY to YUV
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, helen.koike@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, laurent.pinchart@ideasonboard.com
References: <20200323173618.14058-1-dafna.hirschfeld@collabora.com>
 <9304066ca10c9ccdf8a5fd88866425a5f45a330a.camel@collabora.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <ef6fd691-c8ca-9408-76b4-e47aca0fc9b4@collabora.com>
Date:   Tue, 31 Mar 2020 09:20:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <9304066ca10c9ccdf8a5fd88866425a5f45a330a.camel@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 30.03.20 20:22, Ezequiel Garcia wrote:
> Hi Dafna,
> 
> Nice catch, thanks a lot.
Hi, It was actually Helen's idea,

> 
> On Mon, 2020-03-23 at 18:36 +0100, Dafna Hirschfeld wrote:
>> V4L2_PIX_FMT_GREY format is Ycbcr format without
> 
> A nitpick s/Ycbcr/YCbCr. Maybe Hans can amend
> this when applying.
> 
> It's no big deal anyway.
> 
> Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
> 
>> the color data, therefore its pixel_enc should
>> set to V4L2_PIXEL_ENC_YUV.
>>
>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Suggested-by: Helen Koike <helen.koike@collabora.com>

>> ---
>>   drivers/media/v4l2-core/v4l2-common.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
>> index d0e5ebc736f9..054f2e607dff 100644
>> --- a/drivers/media/v4l2-core/v4l2-common.c
>> +++ b/drivers/media/v4l2-core/v4l2-common.c
>> @@ -250,7 +250,6 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
>>   		{ .format = V4L2_PIX_FMT_RGBA32,  .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .hdiv =
>> 1, .vdiv = 1 },
>>   		{ .format = V4L2_PIX_FMT_ABGR32,  .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .hdiv =
>> 1, .vdiv = 1 },
>>   		{ .format = V4L2_PIX_FMT_BGRA32,  .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .hdiv =
>> 1, .vdiv = 1 },
>> -		{ .format = V4L2_PIX_FMT_GREY,    .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .hdiv =
>> 1, .vdiv = 1 },
>>   		{ .format = V4L2_PIX_FMT_RGB565,  .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv =
>> 1, .vdiv = 1 },
>>   		{ .format = V4L2_PIX_FMT_RGB555,  .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv =
>> 1, .vdiv = 1 },
>>   
>> @@ -274,6 +273,7 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
>>   		{ .format = V4L2_PIX_FMT_YUV420,  .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv =
>> 2, .vdiv = 2 },
>>   		{ .format = V4L2_PIX_FMT_YVU420,  .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv =
>> 2, .vdiv = 2 },
>>   		{ .format = V4L2_PIX_FMT_YUV422P, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv =
>> 2, .vdiv = 1 },
>> +		{ .format = V4L2_PIX_FMT_GREY,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .hdiv =
>> 1, .vdiv = 1 },
>>   
>>   		/* YUV planar formats, non contiguous variant */
>>   		{ .format = V4L2_PIX_FMT_YUV420M, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 3, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv =
>> 2, .vdiv = 2 },
>> -- 
>> 2.17.1
>>
>>
> 
> 
