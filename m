Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B7E11F599C
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2020 19:01:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729272AbgFJRBu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Jun 2020 13:01:50 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:38470 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726992AbgFJRBt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Jun 2020 13:01:49 -0400
Received: from [IPv6:2003:cb:871f:5b00:9cc4:c525:7ca2:283] (p200300cb871f5b009cc4c5257ca20283.dip0.t-ipconnect.de [IPv6:2003:cb:871f:5b00:9cc4:c525:7ca2:283])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 8444F2A453E;
        Wed, 10 Jun 2020 18:01:47 +0100 (BST)
Subject: Re: [PATCH v2 2/4] media: staging: rkisp1: rsz: use hdiv, vdiv of
 yuv422 instead of macros
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, kernel@collabora.com,
        Dafna Hirschfeld <dafna3@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20200515142952.20163-1-dafna.hirschfeld@collabora.com>
 <20200515142952.20163-3-dafna.hirschfeld@collabora.com>
 <CAAFQd5CKhgMJJUTCn3cmPmgVORbH7-cxq2p0wmaN14MJJSC5iA@mail.gmail.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <6b3a1844-a1e5-dc38-28ef-1645a78babed@collabora.com>
Date:   Wed, 10 Jun 2020 19:01:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAAFQd5CKhgMJJUTCn3cmPmgVORbH7-cxq2p0wmaN14MJJSC5iA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 27.05.20 00:44, Tomasz Figa wrote:
> Hi Dafna,
> 
> On Fri, May 15, 2020 at 4:30 PM Dafna Hirschfeld
> <dafna.hirschfeld@collabora.com> wrote:
>>
>> The resize block of rkisp1 always get the input as yuv422.
>> Instead of defining the default hdiv, vdiv as macros, the
>> code is more clear if it takes the (hv)div from the YUV422P
>> info. This makes it clear where those values come from.
>> The patch also adds documentation to explain that.
>>
>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>> ---
>>   drivers/staging/media/rkisp1/rkisp1-resizer.c | 25 +++++++++----------
>>   1 file changed, 12 insertions(+), 13 deletions(-)
>>
> 
> Thank you for the effort on improving this driver! Please see my comments below.
> 
>> diff --git a/drivers/staging/media/rkisp1/rkisp1-resizer.c b/drivers/staging/media/rkisp1/rkisp1-resizer.c
>> index d049374413dc..04a29af8cc92 100644
>> --- a/drivers/staging/media/rkisp1/rkisp1-resizer.c
>> +++ b/drivers/staging/media/rkisp1/rkisp1-resizer.c
>> @@ -16,9 +16,6 @@
>>   #define RKISP1_DEF_FMT MEDIA_BUS_FMT_YUYV8_2X8
>>   #define RKISP1_DEF_PIXEL_ENC V4L2_PIXEL_ENC_YUV
>>
>> -#define RKISP1_MBUS_FMT_HDIV 2
>> -#define RKISP1_MBUS_FMT_VDIV 1
>> -
>>   enum rkisp1_shadow_regs_when {
>>          RKISP1_SHADOW_REGS_SYNC,
>>          RKISP1_SHADOW_REGS_ASYNC,
>> @@ -361,11 +358,12 @@ static void rkisp1_rsz_config_regs(struct rkisp1_resizer *rsz,
>>   static void rkisp1_rsz_config(struct rkisp1_resizer *rsz,
>>                                enum rkisp1_shadow_regs_when when)
>>   {
>> -       u8 hdiv = RKISP1_MBUS_FMT_HDIV, vdiv = RKISP1_MBUS_FMT_VDIV;
>>          struct v4l2_rect sink_y, sink_c, src_y, src_c;
>>          struct v4l2_mbus_framefmt *src_fmt;
>>          struct v4l2_rect *sink_crop;
>>          struct rkisp1_capture *cap = &rsz->rkisp1->capture_devs[rsz->id];
>> +       const struct v4l2_format_info *yuv422_info =
>> +               v4l2_format_info(V4L2_PIX_FMT_YUV422P);
> 
> As I mentioned in another reply, this is a memory format, but we're
> using it to configure a local (i.e. non-DMA) input.
> 
>>
>>          sink_crop = rkisp1_rsz_get_pad_crop(rsz, NULL, RKISP1_RSZ_PAD_SINK,
>>                                              V4L2_SUBDEV_FORMAT_ACTIVE);
>> @@ -386,8 +384,9 @@ static void rkisp1_rsz_config(struct rkisp1_resizer *rsz,
>>          src_y.width = src_fmt->width;
>>          src_y.height = src_fmt->height;
>>
>> -       sink_c.width = sink_y.width / RKISP1_MBUS_FMT_HDIV;
>> -       sink_c.height = sink_y.height / RKISP1_MBUS_FMT_VDIV;
>> +       /* The input format of the resizer is always yuv422 */
>> +       sink_c.width = sink_y.width / yuv422_info->hdiv;
>> +       sink_c.height = sink_y.height / yuv422_info->vdiv;
> 
> I'd honestly go the opposite way and just make it:
> 
> /* The resizer input is always YUV 4:2:2 and so horizontally subsampled by 2. */
> sink_c.width = sink_y.width / 2;
> sink_c.height = sink_y.height;
> 
>>
>>          /*
>>           * The resizer is used not only to change the dimensions of the frame
>> @@ -395,17 +394,17 @@ static void rkisp1_rsz_config(struct rkisp1_resizer *rsz,
>>           * (4:2:2 -> 4:2:0 for example). So the width/height of the CbCr
>>           * streams should be set according to the pixel format in the capture.
>>           * The resizer always gets the input as YUV422. If the capture format
>> -        * is RGB then the memory input should be YUV422 so we don't change the
>> -        * default hdiv, vdiv in that case.
>> +        * is RGB then the memory input (the resizer output) should be YUV422
> 
> It could be just me, but "memory input" sounds like there was an input
> DMA involved, which is not the case. How about "Memory Interface
> input"?
> 
> Also, if already amending this, I would also fix the overuse of
> "should". How about the following?
> 
> "According to the hardware pipeline, the resizer input is always YUV
> 4:2:2. For YUV formats, the Memory Interface requires its input to be
> already properly subsampled. We can achieve subsampling factors other
> than YUV 4:2:2 by scaling the planes appropriately. For RGB formats,
> the Memory Interface requires YUV 4:2:2 input, so no additional
> scaling is needed."
> 
>> +        * so we use the hdiv, vdiv of the YUV422 info in this case.
>>           */
>>          if (v4l2_is_format_yuv(cap->pix.info)) {
>> -               hdiv = cap->pix.info->hdiv;
>> -               vdiv = cap->pix.info->vdiv;
>> +               src_c.width = cap->pix.info->hdiv;
>> +               src_c.height = cap->pix.info->vdiv;
>> +       } else {
> 
> How about making it an explicit else if (v4l2_is_format_rgb(...))?
Actually the right way to deal with YUV downscaling is to support
MEDIA_BUS_FMT_YUYV8_1_5X8 (which is YUV420) on the src format
and not to look on what is configured on the capture.

Thanks,
Dafna
> 
>> +               src_c.width = src_y.width / yuv422_info->hdiv;
>> +               src_c.height = src_y.height / yuv422_info->vdiv;
> 
> And then:
> 
> /* YUV 4:2:2 output to Memory Interface */
> src_c.width = src_y.width / 2;
> src_c.height = src_y.height;
> 
>>          }
>>
>> -       src_c.width = src_y.width / hdiv;
>> -       src_c.height = src_y.height / vdiv;
>> -
>>          if (sink_c.width == src_c.width && sink_c.height == src_c.height) {
>>                  rkisp1_rsz_disable(rsz, when);
>>                  return;
>> --
>> 2.17.1
>>
