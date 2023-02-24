Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BA256A187F
	for <lists+linux-media@lfdr.de>; Fri, 24 Feb 2023 10:08:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229686AbjBXJIc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Feb 2023 04:08:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229778AbjBXJIb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Feb 2023 04:08:31 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FE0B4499
        for <linux-media@vger.kernel.org>; Fri, 24 Feb 2023 01:08:27 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A7D092E4;
        Fri, 24 Feb 2023 10:08:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1677229705;
        bh=zaqzYZ4EcQWVMQgC8Xbu/g8YCzqBjBAyoXbR5OVBfOE=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=kCpVHBCdNtflDY51dk4ThJuNwGeSGAptGrOevOgNhvoEDD5ziAU6Csjl8ewoDDS9a
         alenFb9NmhC1+skJ7AU6F3bEu/qcte84sltjr913z8V7xmqAPO/t9Bo2FoO+9RHLl0
         icjHqKc2+YHLEyYSwlDdHFtxSdxbdVu0FtlDH+aU=
Message-ID: <a3d7070e-bce7-7329-134d-1b80d265f9bf@ideasonboard.com>
Date:   Fri, 24 Feb 2023 11:08:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v1 1/3] media: ti: cal: Add support for 1X16 mbus formats
Content-Language: en-US
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jai Luthra <j-luthra@ti.com>,
        Vaishnav Achath <vaishnav.a@ti.com>
References: <20230222125630.421020-1-tomi.valkeinen@ideasonboard.com>
 <20230222125630.421020-2-tomi.valkeinen@ideasonboard.com>
 <20230223171021.ukttr2xwcuxlzdzu@uno.localdomain>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230223171021.ukttr2xwcuxlzdzu@uno.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 23/02/2023 19:10, Jacopo Mondi wrote:
> Hi Tomi
> 
> On Wed, Feb 22, 2023 at 02:56:28PM +0200, Tomi Valkeinen wrote:
>> For legacy reasons the CAL driver uses 2X8 mbus formats for the CSI-2
>> link (e.g. MEDIA_BUS_FMT_YUYV8_2X8). 1X16 formats are more correct and
>> used by many drivers, so add 1X16 support to CAL.
>>
>> We keep the 2X8 formats for backward compatibility.
> 
> Eh, this is the usual question about what we should consider a
> to be a userspace breakage or not.
> 
> I presume the reason to maintain 2X8 formats is (assuming the CAL
> interface is CSI-2 only, right ?) because sensor drivers that only
> support 2X8 formats will then fail to link_validate() if you remove
> all 2X8 formats here. I'm of the opinion that we should bite the
> bullet and move to 1X16. If any driver that used to work with CAL now
> breaks, the sensor driver will have to be fixed.
> 
> In my humble experience, that's what we did with the ov5640 sensor. We
> removed the 2X8 formats in CSI-2 mode and some platform driver broke
> and then had been fixed (it happened in the same release cycle), win win.
> 
> I know it's controversial, let's see what others think.

After thinking about this, I feel we can just drop the 2X8 support from 
CAL. So I'll refresh this patch and just change the 2X8 formats to 1X16.

>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   drivers/media/platform/ti/cal/cal-video.c | 16 ++++++++++++++-
>>   drivers/media/platform/ti/cal/cal.c       | 25 +++++++++++++++++++++++
>>   drivers/media/platform/ti/cal/cal.h       |  1 +
>>   3 files changed, 41 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/ti/cal/cal-video.c b/drivers/media/platform/ti/cal/cal-video.c
>> index 4eade409d5d3..87db8761d94d 100644
>> --- a/drivers/media/platform/ti/cal/cal-video.c
>> +++ b/drivers/media/platform/ti/cal/cal-video.c
>> @@ -446,6 +446,15 @@ static int cal_mc_enum_fmt_vid_cap(struct file *file, void  *priv,
>>   		if (f->mbus_code && cal_formats[i].code != f->mbus_code)
>>   			continue;
>>
>> +		/*
>> +		 * Skip legacy formats so that we don't return duplicate fourccs,
>> +		 * except in the case that the user explicitly asked for an
>> +		 * mbus_code which matches this legacy format.
>> +		 */
>> +		if (cal_formats[i].legacy &&
>> +		    (!f->mbus_code || cal_formats[i].code != f->mbus_code))
> 
> This only works as there are no duplicate codes in cal_formats[] (iow
> a pixel format is assigned to a single media bus code). If that's how
> the CAL interface works (no colorspace conversion, no components
> re-ordering) I guess it's fine

No duplicate codes.

>> +			continue;
>> +
>>   		if (idx == f->index) {
>>   			f->pixelformat = cal_formats[i].fourcc;
>>   			f->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
>> @@ -683,6 +692,7 @@ static void cal_release_buffers(struct cal_ctx *ctx,
>>
>>   static int cal_video_check_format(struct cal_ctx *ctx)
>>   {
>> +	const struct cal_format_info *rx_fmtinfo;
>>   	const struct v4l2_mbus_framefmt *format;
>>   	struct media_pad *remote_pad;
>>
>> @@ -692,7 +702,11 @@ static int cal_video_check_format(struct cal_ctx *ctx)
>>
>>   	format = &ctx->phy->formats[remote_pad->index];
>>
>> -	if (ctx->fmtinfo->code != format->code ||
>> +	rx_fmtinfo = cal_format_by_code(format->code);
>> +	if (!rx_fmtinfo)
>> +		return -EINVAL;
>> +
>> +	if (ctx->fmtinfo->fourcc != rx_fmtinfo->fourcc ||
> 
> Is this meant to make 2X8 and 1X16 formats compatible during link
> validation ?

There's no link-validation as such here, but CAL driver checks 
internally (the code here) that the video node's and the camerarx 
subdevices formats match.

Here we check that if the video node uses specifies, say, YUYV, then 
both 2X8 and 1X16 codes from the camerarx are accepted.

>>   	    ctx->v_fmt.fmt.pix.height != format->height ||
>>   	    ctx->v_fmt.fmt.pix.width != format->width ||
>>   	    ctx->v_fmt.fmt.pix.field != format->field)
>> diff --git a/drivers/media/platform/ti/cal/cal.c b/drivers/media/platform/ti/cal/cal.c
>> index 1236215ec70e..053bf1030af0 100644
>> --- a/drivers/media/platform/ti/cal/cal.c
>> +++ b/drivers/media/platform/ti/cal/cal.c
>> @@ -59,22 +59,47 @@ MODULE_PARM_DESC(mc_api, "activates the MC API");
>>    */
>>
>>   const struct cal_format_info cal_formats[] = {
>> +	/*
>> +	 * 2X8 entries are legacy codes. All new drivers should use 1X16 modes.
>> +	 * The 2X8 modes must be before 1X16 in this list so that the driver
>> +	 * behavior for non-MC mode doesn't change.
>> +	 */
>>   	{
>>   		.fourcc		= V4L2_PIX_FMT_YUYV,
>>   		.code		= MEDIA_BUS_FMT_YUYV8_2X8,
>>   		.bpp		= 16,
>> +		.legacy		= true,
> 
> I then wonder if it isn't better to associate multiple mbus codes to
> a fourcc instead of duplicating the entries with the same fourcc

Maybe, but this way the legacy ones are kept separate, and we don't 
"mess up" the other modes with arrays of mbus codes, when no arrays are 
needed.

> 
>>   	}, {
>>   		.fourcc		= V4L2_PIX_FMT_UYVY,
>>   		.code		= MEDIA_BUS_FMT_UYVY8_2X8,
>>   		.bpp		= 16,
>> +		.legacy		= true,
>>   	}, {
>>   		.fourcc		= V4L2_PIX_FMT_YVYU,
>>   		.code		= MEDIA_BUS_FMT_YVYU8_2X8,
>>   		.bpp		= 16,
>> +		.legacy		= true,
>>   	}, {
>>   		.fourcc		= V4L2_PIX_FMT_VYUY,
>>   		.code		= MEDIA_BUS_FMT_VYUY8_2X8,
>>   		.bpp		= 16,
>> +		.legacy		= true,
>> +	}, {
>> +		.fourcc		= V4L2_PIX_FMT_YUYV,
>> +		.code		= MEDIA_BUS_FMT_YUYV8_1X16,
>> +		.bpp		= 16,
>> +	}, {
>> +		.fourcc		= V4L2_PIX_FMT_UYVY,
>> +		.code		= MEDIA_BUS_FMT_UYVY8_1X16,
>> +		.bpp		= 16,
>> +	}, {
>> +		.fourcc		= V4L2_PIX_FMT_YVYU,
>> +		.code		= MEDIA_BUS_FMT_YVYU8_1X16,
>> +		.bpp		= 16,
>> +	}, {
>> +		.fourcc		= V4L2_PIX_FMT_VYUY,
>> +		.code		= MEDIA_BUS_FMT_VYUY8_1X16,
>> +		.bpp		= 16,
>>   	}, {
>>   		.fourcc		= V4L2_PIX_FMT_RGB565, /* gggbbbbb rrrrrggg */
>>   		.code		= MEDIA_BUS_FMT_RGB565_2X8_LE,
> 
> Also RGB formats with 2X8 and 2X12 should probably be changed to 1X16
> and 1X24 versions..

Good point, I'll change those too.

  Tomi

