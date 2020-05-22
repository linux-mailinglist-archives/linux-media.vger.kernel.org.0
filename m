Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59A771DE892
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2020 16:15:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729931AbgEVOPZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 May 2020 10:15:25 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49058 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729399AbgEVOPZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 May 2020 10:15:25 -0400
Received: from [IPv6:2003:cb:871f:5b00:cd18:bb27:1f42:fad5] (p200300cb871f5b00cd18bb271f42fad5.dip0.t-ipconnect.de [IPv6:2003:cb:871f:5b00:cd18:bb27:1f42:fad5])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 54AF62A10B0;
        Fri, 22 May 2020 15:15:23 +0100 (BST)
Subject: Re: [PATCH v2 2/4] media: staging: rkisp1: rsz: use hdiv, vdiv of
 yuv422 instead of macros
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Helen Koike <helen.koike@collabora.com>,
        linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, laurent.pinchart@ideasonboard.com,
        Tomasz Figa <tfiga@chromium.org>
References: <20200515142952.20163-1-dafna.hirschfeld@collabora.com>
 <20200515142952.20163-3-dafna.hirschfeld@collabora.com>
 <2606d729-7418-109b-f514-3b9eb834187c@collabora.com>
 <4bd94509-79af-16db-3721-2553508a6c42@collabora.com>
 <d0c93454-8a51-a28c-639d-948041fc602a@collabora.com>
 <9a0a91d50bdaa19378ef21de5c81abeef476429a.camel@collabora.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <f8fa01a3-c0f1-9fc5-1fb8-b4fe91e8fc74@collabora.com>
Date:   Fri, 22 May 2020 16:15:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <9a0a91d50bdaa19378ef21de5c81abeef476429a.camel@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 22.05.20 15:31, Ezequiel Garcia wrote:
> Hi Dafna, Helen,
> 
> On Fri, 2020-05-22 at 14:11 +0200, Dafna Hirschfeld wrote:
>>
>> On 21.05.20 00:08, Helen Koike wrote:
>>>
>>> On 5/20/20 6:54 PM, Helen Koike wrote:
>>>> Hi Dafna,
>>>>
>>>> On 5/15/20 11:29 AM, Dafna Hirschfeld wrote:
>>>>> The resize block of rkisp1 always get the input as yuv422.
>>>>> Instead of defining the default hdiv, vdiv as macros, the
>>>>> code is more clear if it takes the (hv)div from the YUV422P
>>>>> info. This makes it clear where those values come from.
>>>>> The patch also adds documentation to explain that.
>>>>>
>>>>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>>>>
>>>> Acked-by: Helen Koike <helen.koike@collabora.com>
>>>>
>>>> Thanks!
>>>> Helen
>>>>
>>>>> ---
>>>>>    drivers/staging/media/rkisp1/rkisp1-resizer.c | 25 +++++++++----------
>>>>>    1 file changed, 12 insertions(+), 13 deletions(-)
>>>>>
>>>>> diff --git a/drivers/staging/media/rkisp1/rkisp1-resizer.c b/drivers/staging/media/rkisp1/rkisp1-resizer.c
>>>>> index d049374413dc..04a29af8cc92 100644
>>>>> --- a/drivers/staging/media/rkisp1/rkisp1-resizer.c
>>>>> +++ b/drivers/staging/media/rkisp1/rkisp1-resizer.c
>>>>> @@ -16,9 +16,6 @@
>>>>>    #define RKISP1_DEF_FMT MEDIA_BUS_FMT_YUYV8_2X8
>>>>>    #define RKISP1_DEF_PIXEL_ENC V4L2_PIXEL_ENC_YUV
>>>>>    
>>>>> -#define RKISP1_MBUS_FMT_HDIV 2
>>>>> -#define RKISP1_MBUS_FMT_VDIV 1
>>>>> -
>>>>>    enum rkisp1_shadow_regs_when {
>>>>>    	RKISP1_SHADOW_REGS_SYNC,
>>>>>    	RKISP1_SHADOW_REGS_ASYNC,
>>>>> @@ -361,11 +358,12 @@ static void rkisp1_rsz_config_regs(struct rkisp1_resizer *rsz,
>>>>>    static void rkisp1_rsz_config(struct rkisp1_resizer *rsz,
>>>>>    			      enum rkisp1_shadow_regs_when when)
>>>>>    {
>>>>> -	u8 hdiv = RKISP1_MBUS_FMT_HDIV, vdiv = RKISP1_MBUS_FMT_VDIV;
>>>>>    	struct v4l2_rect sink_y, sink_c, src_y, src_c;
>>>>>    	struct v4l2_mbus_framefmt *src_fmt;
>>>>>    	struct v4l2_rect *sink_crop;
>>>>>    	struct rkisp1_capture *cap = &rsz->rkisp1->capture_devs[rsz->id];
>>>>> +	const struct v4l2_format_info *yuv422_info =
>>>>> +		v4l2_format_info(V4L2_PIX_FMT_YUV422P);
>>>>>    
> 
> Instead of hardcoding this fourcc, is there any way we can
> retrieve it from a configured format?
> 
What do you mean?
If the configured format is bayer then the resizer is disabled.
Otherwise the resizer always get the input as yuv422, this is why it is hard coded.

Thanks,
Dafna

> Thanks,
> Ezequiel
> 
