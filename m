Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 103421A1EBB
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2020 12:24:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726642AbgDHKYz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Apr 2020 06:24:55 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:50104 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725932AbgDHKYy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Apr 2020 06:24:54 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 0795C290619
Subject: Re: [PATCH v2 5/5] media: staging: rkisp1: cap: remove unsupported
 formats
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, linux-rockchip@lists.infradead.org
References: <20200402190419.15155-1-dafna.hirschfeld@collabora.com>
 <20200402190419.15155-6-dafna.hirschfeld@collabora.com>
 <20200405224357.GR5846@pendragon.ideasonboard.com>
 <a6ec9713-77e8-05e1-2a55-f58bca1dc853@collabora.com>
Message-ID: <c3ec53ec-6709-b1d7-4d46-c36089595857@collabora.com>
Date:   Wed, 8 Apr 2020 12:24:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <a6ec9713-77e8-05e1-2a55-f58bca1dc853@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 4/6/20 2:42 PM, Dafna Hirschfeld wrote:
> 
> 
> On 4/6/20 12:43 AM, Laurent Pinchart wrote:
>> Hi Dafna,
>>
>> Thank you for the patch.
>>
>> On Thu, Apr 02, 2020 at 09:04:19PM +0200, Dafna Hirschfeld wrote:
>>> For Ycbcr packed formats only YUYV can be supported by
>>> the driver. This patch removes the other formats.
>>
>> The RKISP1_CIF_MI_BYTE_SWAP bit could possibly help achieving other YUV
>> orders, but as far as I can tell, it would affect both the main path and
>> the self path, so it wouldn't be very convenient. At a quick glance I
>> haven't found a way to support those formats, but just to make sure,
>> have you double-checked that the nv21_self and nv21_main bits of
>> MI_XTD_FORMAT_CTRL don't also affect packed mode ? If they don't,
> Hi, thanks a lot for the reviews, I'll check that.
Hi, unfortunately MI_XTD_FORMAT_CTRL doesn't affect the the packed formats.

Dafna
> 
> Dafna
>>
>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>
>>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>>> Acked-by: Helen Koike <helen.koike@collabora.com>
>>> ---
>>>   drivers/staging/media/rkisp1/rkisp1-capture.c | 21 -------------------
>>>   1 file changed, 21 deletions(-)
>>>
>>> diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
>>> index 2d274e8f565b..076335193f40 100644
>>> --- a/drivers/staging/media/rkisp1/rkisp1-capture.c
>>> +++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
>>> @@ -98,15 +98,6 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_mp_fmts[] = {
>>>           .fmt_type = RKISP1_FMT_YUV,
>>>           .uv_swap = 0,
>>>           .write_format = RKISP1_MI_CTRL_MP_WRITE_YUVINT,
>>> -    }, {
>>> -        .fourcc = V4L2_PIX_FMT_YVYU,
>>> -        .fmt_type = RKISP1_FMT_YUV,
>>> -        .uv_swap = 1,
>>> -        .write_format = RKISP1_MI_CTRL_MP_WRITE_YUVINT,
>>> -    }, {
>>> -        .fourcc = V4L2_PIX_FMT_VYUY,
>>> -        .fmt_type = RKISP1_FMT_YUV,
>>> -        .write_format = RKISP1_MI_CTRL_MP_WRITE_YUVINT,
>>>       }, {
>>>           .fourcc = V4L2_PIX_FMT_YUV422P,
>>>           .fmt_type = RKISP1_FMT_YUV,
>>> @@ -234,18 +225,6 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_sp_fmts[] = {
>>>           .uv_swap = 0,
>>>           .write_format = RKISP1_MI_CTRL_SP_WRITE_INT,
>>>           .output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV422,
>>> -    }, {
>>> -        .fourcc = V4L2_PIX_FMT_YVYU,
>>> -        .fmt_type = RKISP1_FMT_YUV,
>>> -        .uv_swap = 1,
>>> -        .write_format = RKISP1_MI_CTRL_SP_WRITE_INT,
>>> -        .output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV422,
>>> -    }, {
>>> -        .fourcc = V4L2_PIX_FMT_VYUY,
>>> -        .fmt_type = RKISP1_FMT_YUV,
>>> -        .uv_swap = 1,
>>> -        .write_format = RKISP1_MI_CTRL_SP_WRITE_INT,
>>> -        .output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV422,
>>>       }, {
>>>           .fourcc = V4L2_PIX_FMT_YUV422P,
>>>           .fmt_type = RKISP1_FMT_YUV,
>>
