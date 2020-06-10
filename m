Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89E6C1F5933
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2020 18:36:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726257AbgFJQgv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Jun 2020 12:36:51 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:38190 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726119AbgFJQgv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Jun 2020 12:36:51 -0400
Received: from [IPv6:2003:cb:871f:5b00:9cc4:c525:7ca2:283] (p200300cb871f5b009cc4c5257ca20283.dip0.t-ipconnect.de [IPv6:2003:cb:871f:5b00:9cc4:c525:7ca2:283])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 946742A3A95;
        Wed, 10 Jun 2020 17:36:48 +0100 (BST)
Subject: Re: [PATCH v2 2/4] media: staging: rkisp1: rsz: use hdiv, vdiv of
 yuv422 instead of macros
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Helen Koike <helen.koike@collabora.com>,
        linux-media@vger.kernel.org, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, Tomasz Figa <tfiga@chromium.org>
References: <20200515142952.20163-1-dafna.hirschfeld@collabora.com>
 <20200515142952.20163-3-dafna.hirschfeld@collabora.com>
 <2606d729-7418-109b-f514-3b9eb834187c@collabora.com>
 <4bd94509-79af-16db-3721-2553508a6c42@collabora.com>
 <d0c93454-8a51-a28c-639d-948041fc602a@collabora.com>
 <20200522135750.GA5824@pendragon.ideasonboard.com>
 <48b7ac22-a8c3-a5e9-56b9-e81e6e072251@collabora.com>
 <20200522145920.GC5824@pendragon.ideasonboard.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <92359859-67ed-7981-8ac9-95817cb8ce9c@collabora.com>
Date:   Wed, 10 Jun 2020 18:36:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200522145920.GC5824@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 22.05.20 16:59, Laurent Pinchart wrote:
> Hi Dafna,
> 
> On Fri, May 22, 2020 at 04:54:24PM +0200, Dafna Hirschfeld wrote:
>> On 22.05.20 15:57, Laurent Pinchart wrote:
>>> On Fri, May 22, 2020 at 02:11:22PM +0200, Dafna Hirschfeld wrote:
>>>> On 21.05.20 00:08, Helen Koike wrote:
>>>>> On 5/20/20 6:54 PM, Helen Koike wrote:
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
>>>>>>>     	sink_crop = rkisp1_rsz_get_pad_crop(rsz, NULL, RKISP1_RSZ_PAD_SINK,
>>>>>>>     					    V4L2_SUBDEV_FORMAT_ACTIVE);
>>>>>>> @@ -386,8 +384,9 @@ static void rkisp1_rsz_config(struct rkisp1_resizer *rsz,
>>>>>>>     	src_y.width = src_fmt->width;
>>>>>>>     	src_y.height = src_fmt->height;
>>>>>>>     
>>>>>>> -	sink_c.width = sink_y.width / RKISP1_MBUS_FMT_HDIV;
>>>>>>> -	sink_c.height = sink_y.height / RKISP1_MBUS_FMT_VDIV;
>>>>>>> +	/* The input format of the resizer is always yuv422 */
>>>>>>> +	sink_c.width = sink_y.width / yuv422_info->hdiv;
>>>>>>> +	sink_c.height = sink_y.height / yuv422_info->vdiv;
>>>>>>>     
>>>>>>>     	/*
>>>>>>>     	 * The resizer is used not only to change the dimensions of the frame
>>>>>>> @@ -395,17 +394,17 @@ static void rkisp1_rsz_config(struct rkisp1_resizer *rsz,
>>>>>>>     	 * (4:2:2 -> 4:2:0 for example). So the width/height of the CbCr
>>>>>>>     	 * streams should be set according to the pixel format in the capture.
>>>>>>>     	 * The resizer always gets the input as YUV422. If the capture format
>>>>>>> -	 * is RGB then the memory input should be YUV422 so we don't change the
>>>>>>> -	 * default hdiv, vdiv in that case.
>>>>>>> +	 * is RGB then the memory input (the resizer output) should be YUV422
>>>>>>> +	 * so we use the hdiv, vdiv of the YUV422 info in this case.
>>>>>>>     	 */
>>>>>>>     	if (v4l2_is_format_yuv(cap->pix.info)) {
>>>>>>> -		hdiv = cap->pix.info->hdiv;
>>>>>>> -		vdiv = cap->pix.info->vdiv;
>>>>>>> +		src_c.width = cap->pix.info->hdiv;
>>>>>>> +		src_c.height = cap->pix.info->vdiv;
>>>>>
>>>>> Sorry, I just noticed you are assigning hdiv and vdiv directly to width and height, which looks wrong.
>>>>>
>>>>> It should be:
>>>>>
>>>>> src_c.width = src_y.width / cap->pix.info->hdiv;
>>>>> src_c.height = src_y.height / cap->pix.info->vdiv;
>>>>
>>>> autch, thanks for finding it,  I probably concentrated only on testing the new RGB formats
>>>
>>> Please make sure to test all supported formats :-)
>>
>> Yes, I don't how I missed that :/
>>
>>> I really, really recommend writing a small set of test scripts that will
>>> automate the tests for you. It can be as simple as wrapping media-ctl +
>>> yavta (or v4l2-ctl), or the libcamera cam utility if it offers all the
>>> features you need, and run them for all supported formats.
>>
>> We already have python scripts that wrap media-ctl/v4l2-ctl
>> https://gitlab.collabora.com/dafna/v4l-utils/-/blob/rkisp1-simult-stream/contrib/test/test-rkisp1.py
>>
>> For example, you can run
>> python3 test-rkisp1.py -t CUSTOM_RKISP1_TEST_stream -o /root -m YUYV8_2X8 -p sp -P YU12 -S  -v -c --isp-dim 1300x1500 --resizer-dim 1200x700
>>
>> Then:
>> '-m YUYV8_2X8' is the media bus for the output of the isp
>> '-p sp' is for streaming from selfpath video node
>> '-P YU12' is for format yuv420p
>> '--sip-dim 1300x1500' is the values to set the sensor and the crop of the sink pad of the isp entity
>> '--resizer-dim 1200x700' is the output dimensions of the resizer
> 
> I recommend wrapping that into a script that will test all supported
> formats, and give a pass/fail result. For instance, we have developed
> unit test scripts for the Renesas VSP (a memory-to-memory video
> processing engine supported by a V4L2 driver), available at
> http://git.ideasonboard.com/renesas/vsp-tests.git, that test lots of
> different pipelines, including checks on the output image.
> 
> Checking the output image is more difficult in your case, as the input
> to the rkisp1 is a camera sensor and not memory, but maybe there's a
> test pattern mode that could be leveraged ?
> 
> In any case, validation of the image content is likely a long term
> project, short term I recommend test cases that will try all the
> supported formats in various resolutions, to ensure there's no crash,
> and you can limit the verification to the captured buffer size for
> instance.

Thanks for the suggestion, I wrote this simple script for now that just
iterates all video formats supported by selfpath and mainpath and streams
them and then test that the resulted file matches the expected size.
I will extend the tests in the future.

https://gitlab.collabora.com/dafna/v4l-utils/-/blob/rkisp1-unit-tests/contrib/test/rkisp1-unit-tests.sh

Thanks,
Dafna

> 
>>>>>>> +	} else {
>>>>>>> +		src_c.width = src_y.width / yuv422_info->hdiv;
>>>>>>> +		src_c.height = src_y.height / yuv422_info->vdiv;
>>>>>>>     	}
>>>>>>>     
>>>>>>> -	src_c.width = src_y.width / hdiv;
>>>>>>> -	src_c.height = src_y.height / vdiv;
>>>>>>> -
>>>>>>>     	if (sink_c.width == src_c.width && sink_c.height == src_c.height) {
>>>>>>>     		rkisp1_rsz_disable(rsz, when);
>>>>>>>     		return;
>>>>>>>
> 
