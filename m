Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E55CC1E0B08
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2020 11:51:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389392AbgEYJvK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 May 2020 05:51:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389333AbgEYJvK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 May 2020 05:51:10 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AD2AC061A0E
        for <linux-media@vger.kernel.org>; Mon, 25 May 2020 02:51:10 -0700 (PDT)
Received: from [IPv6:2003:cb:871f:5b00:450d:7f43:38d6:51e8] (p200300cb871f5b00450d7f4338d651e8.dip0.t-ipconnect.de [IPv6:2003:cb:871f:5b00:450d:7f43:38d6:51e8])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 55F802A0AA7;
        Mon, 25 May 2020 10:51:08 +0100 (BST)
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
 <f8fa01a3-c0f1-9fc5-1fb8-b4fe91e8fc74@collabora.com>
 <5a4e994d9b5b702205301a9b72bef2d013d4e106.camel@collabora.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <b709625a-ecff-a173-4144-0de341ad1852@collabora.com>
Date:   Mon, 25 May 2020 11:51:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <5a4e994d9b5b702205301a9b72bef2d013d4e106.camel@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 22.05.20 17:04, Ezequiel Garcia wrote:
> On Fri, 2020-05-22 at 16:15 +0200, Dafna Hirschfeld wrote:
>>
>> On 22.05.20 15:31, Ezequiel Garcia wrote:
>>> Hi Dafna, Helen,
>>>
>>> On Fri, 2020-05-22 at 14:11 +0200, Dafna Hirschfeld wrote:
>>>> On 21.05.20 00:08, Helen Koike wrote:
>>>>> On 5/20/20 6:54 PM, Helen Koike wrote:
>>>>>> Hi Dafna,
>>>>>>
>>>>>> On 5/15/20 11:29 AM, Dafna Hirschfeld wrote:
>>>>>>> The resize block of rkisp1 always get the input as yuv422.
>>>>>>> Instead of defining the default hdiv, vdiv as macros, the
>>>>>>> code is more clear if it takes the (hv)div from the YUV422P
>>>>>>> info. This makes it clear where those values come from.
>>>>>>> The patch also adds documentation to explain that.
>>>>>>>
>>>>>>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>>>>>>
>>>>>> Acked-by: Helen Koike <helen.koike@collabora.com>
>>>>>>
>>>>>> Thanks!
>>>>>> Helen
>>>>>>
>>>>>>> ---
>>>>>>>     drivers/staging/media/rkisp1/rkisp1-resizer.c | 25 +++++++++----------
>>>>>>>     1 file changed, 12 insertions(+), 13 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/staging/media/rkisp1/rkisp1-resizer.c b/drivers/staging/media/rkisp1/rkisp1-resizer.c
>>>>>>> index d049374413dc..04a29af8cc92 100644
>>>>>>> --- a/drivers/staging/media/rkisp1/rkisp1-resizer.c
>>>>>>> +++ b/drivers/staging/media/rkisp1/rkisp1-resizer.c
>>>>>>> @@ -16,9 +16,6 @@
>>>>>>>     #define RKISP1_DEF_FMT MEDIA_BUS_FMT_YUYV8_2X8
>>>>>>>     #define RKISP1_DEF_PIXEL_ENC V4L2_PIXEL_ENC_YUV
>>>>>>>     
>>>>>>> -#define RKISP1_MBUS_FMT_HDIV 2
>>>>>>> -#define RKISP1_MBUS_FMT_VDIV 1
>>>>>>> -
>>>>>>>     enum rkisp1_shadow_regs_when {
>>>>>>>     	RKISP1_SHADOW_REGS_SYNC,
>>>>>>>     	RKISP1_SHADOW_REGS_ASYNC,
>>>>>>> @@ -361,11 +358,12 @@ static void rkisp1_rsz_config_regs(struct rkisp1_resizer *rsz,
>>>>>>>     static void rkisp1_rsz_config(struct rkisp1_resizer *rsz,
>>>>>>>     			      enum rkisp1_shadow_regs_when when)
>>>>>>>     {
>>>>>>> -	u8 hdiv = RKISP1_MBUS_FMT_HDIV, vdiv = RKISP1_MBUS_FMT_VDIV;
>>>>>>>     	struct v4l2_rect sink_y, sink_c, src_y, src_c;
>>>>>>>     	struct v4l2_mbus_framefmt *src_fmt;
>>>>>>>     	struct v4l2_rect *sink_crop;
>>>>>>>     	struct rkisp1_capture *cap = &rsz->rkisp1->capture_devs[rsz->id];
>>>>>>> +	const struct v4l2_format_info *yuv422_info =
>>>>>>> +		v4l2_format_info(V4L2_PIX_FMT_YUV422P);
>>>>>>>     
>>>
>>> Instead of hardcoding this fourcc, is there any way we can
>>> retrieve it from a configured format?
>>>
>> What do you mean?
>> If the configured format is bayer then the resizer is disabled.
>> Otherwise the resizer always get the input as yuv422, this is why it is hard coded.
>>
> 
> I don't like to rely on these assumptions/knowledge.> It's much cleaner to retrieve the format, and avoiding
> hardcoding things as much as you can.
> 
> Hope I'm making sense :-)
hmm, not yet, If the input is a constant why not hardcode it?
Not sure what kind of code would you expect to replace it?
You mean a function that get the sink mbus as an input and returns "v4l2_format_info(V4L2_PIX_FMT_YUV422P)" if
the mbus is MEDIA_BUS_FMT_YUYV8_2X8?


Thanks,
Dafna

> 
> Ezequiel
> 
