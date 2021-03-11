Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF2F03373F7
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 14:31:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233680AbhCKNa0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 08:30:26 -0500
Received: from mslow2.mail.gandi.net ([217.70.178.242]:37811 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233725AbhCKNaU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 08:30:20 -0500
Received: from relay6-d.mail.gandi.net (unknown [217.70.183.198])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id C5A143E554D;
        Thu, 11 Mar 2021 13:10:28 +0000 (UTC)
X-Originating-IP: 90.55.106.192
Received: from bootlin.com (atoulouse-258-1-35-192.w90-55.abo.wanadoo.fr [90.55.106.192])
        (Authenticated sender: maxime.chevallier@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id AD6DEC0004;
        Thu, 11 Mar 2021 13:10:03 +0000 (UTC)
Date:   Thu, 11 Mar 2021 14:09:59 +0100
From:   Maxime Chevallier <maxime.chevallier@bootlin.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v4 3/3] media: i2c: Introduce a driver for the Techwell
 TW9900 decoder
Message-ID: <20210311140959.5a7b27e7@bootlin.com>
In-Reply-To: <abe4486e-9d32-226e-36ab-162f7d882bdd@xs4all.nl>
References: <20210219081514.1592033-1-maxime.chevallier@bootlin.com>
        <20210219081514.1592033-4-maxime.chevallier@bootlin.com>
        <abe4486e-9d32-226e-36ab-162f7d882bdd@xs4all.nl>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans, and thanks for the review.

On Thu, 4 Mar 2021 16:37:53 +0100
Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:

>Hi Maxime,
>
>Some more code review comments:
>

>> +static int tw9900_set_fmt(struct v4l2_subdev *sd,
>> +			  struct v4l2_subdev_pad_config *cfg,
>> +			  struct v4l2_subdev_format *fmt)
>> +{
>> +	struct tw9900 *tw9900 = to_tw9900(sd);
>> +	struct v4l2_mbus_framefmt *mbus_fmt = &fmt->format;
>> +
>> +	tw9900_fill_fmt(tw9900->cur_mode, mbus_fmt);
>> +
>> +	mbus_fmt->width = tw9900->cur_mode->width;
>> +	mbus_fmt->height = tw9900->cur_mode->height;  
>
>These two lines are already done in tw9900_fill_fmt.

Yes right, I'll remove that

[...]

>> +
>> +	return 0;
>> +}
>> +
>> +static int tw9900_get_fmt(struct v4l2_subdev *sd,
>> +			  struct v4l2_subdev_pad_config *cfg,
>> +			  struct v4l2_subdev_format *fmt)
>> +{
>> +	struct tw9900 *tw9900 = to_tw9900(sd);
>> +	struct v4l2_mbus_framefmt *mbus_fmt = &fmt->format;
>> +
>> +	tw9900_fill_fmt(tw9900->cur_mode, mbus_fmt);
>> +
>> +	return 0;
>> +}  
>
>In fact, tw9900_set_fmt is identical to tw9900_get_fmt. I would just drop
>tw9900_set_fmt and point both .get_fmt and .set_fmt to the same function.

OK, that will be cleaner indeed

[...]

>> +
>> +static int tw9900_enum_mbus_code(struct v4l2_subdev *sd,
>> +				 struct v4l2_subdev_pad_config *cfg,
>> +				 struct v4l2_subdev_mbus_code_enum *code)
>> +{
>> +	if (code->index >= 1)
>> +		return -EINVAL;
>> +
>> +	code->code = MEDIA_BUS_FMT_UYVY8_2X8;
>> +
>> +	return 0;
>> +}
>> +
>> +static int tw9900_enum_frame_sizes(struct v4l2_subdev *sd,
>> +				   struct v4l2_subdev_pad_config *cfg,
>> +				   struct v4l2_subdev_frame_size_enum *fse)
>> +{
>> +	u32 index = fse->index;
>> +
>> +	if (index >= 1)
>> +		return -EINVAL;
>> +
>> +	fse->code = MEDIA_BUS_FMT_UYVY8_2X8;
>> +
>> +	fse->min_width  = supported_modes[index].width;
>> +	fse->max_width  = supported_modes[index].width;
>> +	fse->max_height = supported_modes[index].height;
>> +	fse->min_height = supported_modes[index].height;
>> +
>> +	return 0;
>> +}  
>
>This function is not typically used by video receivers since the framesize is
>fixed depending on the standard. So there is nothing to enumerate.
>
>It is wrong in any case since it reports just supported_modes[0] (i.e. PAL)
>even if the current mode is NTSC. But it can just be dropped for video receivers.

Ok thanks, I'll drop that then.

[...]

>> +		/* Wait for VSync lock */
>> +		for (i = 0; i < VSYNC_WAIT_MAX_POLLS; i++) {
>> +			u8 status = tw9900_read_reg(tw9900->client,
>> +						    TW9900_REG_CHIP_STATUS);
>> +			if (!(status & TW9900_REG_CHIP_STATUS_VDLOSS) &&
>> +			    (status & TW9900_REG_CHIP_STATUS_VLOCK))
>> +				break;
>> +
>> +			msleep(VSYNC_POLL_INTERVAL_MS);
>> +		}  
>
>Why do you have to wait for a vsync lock?
>
>Most drivers just start regardless of lock. If there is no lock, then there
>is either no data being streamed (so the DMA of the video bridge will be idle
>as well) or it is just transmitting noise (typical for SDTV receivers). At least
>until a valid signal appears eventually.

In this case, it will transmit noise.

As stated a bit below, this was implemented because this decoder
actually supports automatic standard detection, but the reported
standard can only be read once the vsync lock is acquired.

So this is a remainder of what I implemented to try to get the standard
detection work, but I can drop that for now.

[...]

>> +static int tw9900_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
>> +{
>> +	struct tw9900 *tw9900 = to_tw9900(sd);
>> +	struct v4l2_mbus_framefmt *try_fmt;
>> +
>> +	try_fmt = v4l2_subdev_get_try_format(sd, fh->pad, 0);
>> +
>> +	/* Initialize try_fmt */
>> +	tw9900_fill_fmt(tw9900->cur_mode, try_fmt);
>> +
>> +	return 0;
>> +}  
>
>Since the format is fixed based on the current standard, there is no point
>in initializing try_fmt as it won't be used. So just drop tw9900_open altogether.

Ok I'll drop that :)

[...]

>> +static const struct v4l2_subdev_video_ops tw9900_video_ops = {
>> +	.s_std		= tw9900_s_std,
>> +	.g_std		= tw9900_g_std,  
>
>Can the tw9900 detect the standard? (I.e. PAL, SECAM, NTSC)
>
>If so, you should implement querystd. I see that none of the other tw*.c drivers
>support this, so I suspect there is no hardware support for this.

So, there's hardware support for this, and I've been trying to get this
to work for a while. I've come to a point where the standard detection
"almost" works, but detects the wrong standard about once every 10
occurences. I don't know if this is due to the hardware I'm testing
this on, my setup, or the decoder itself.

This is in a setup where the standard can change on the fly (I have 2
cameras, one that streams PAL, one that streams NTSC, that are connected
to the TW9900 through a switch, and I have to make so that we can
detect a standard change (due to switching a camera) on the fly while
the stream is started.

The standard detection is also a process that is quite long and that
has to be manually started, and then checked regularly to see if the
decoder successfully identified a standard.

I do have a followup question, which is when querystd() would be called
in a "normal" scenarion (I feel that my usecase seems a bit off-track
compared to classic usecases). Is it when the stream is started, or
stopped ?

>You also must implement g_tvnorms to report the TV standards that the hardware
>can understand.

Ok I didn't know about that, I'll implement that then.

[...]

>> +
>> +	tw9900->subdev.internal_ops = &tw9900_internal_ops;
>> +	tw9900->subdev.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;  
>
>This is a duplicate of a similar '|=' above.

My bad, I'll remove that line.


>
>Regards,
>
>	Hans

Thanks,

Maxime
