Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DE00A15BE
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2019 12:20:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727051AbfH2KUX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Aug 2019 06:20:23 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:51865 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726417AbfH2KUX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Aug 2019 06:20:23 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 3HXOiQogxDqPe3HXRiNSx9; Thu, 29 Aug 2019 12:20:21 +0200
Subject: Re: [PATCH v2 09/10] media: i2c: ov5670: Report native size and crop
 bounds
To:     Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com
Cc:     "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>
References: <20190827092339.8858-1-jacopo@jmondi.org>
 <20190827092339.8858-12-jacopo@jmondi.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <db08aa45-922e-e477-9836-cbbc3f17ad8e@xs4all.nl>
Date:   Thu, 29 Aug 2019 12:20:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190827092339.8858-12-jacopo@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfEvWK7lfnBLfRfUrcz3wV+2rw26Vml2LCjOQ4qK/SLiL1h4FONBD71iTvZDAFEGZt5TELtskDT3/om81m1vuCdjNnteG1Ej0zCnah3TaXUsQ710CI97G
 Gv1xX2fYWrA0YQbDjAG+b0NLJnrbqsE4n5N8sDR7JBDCsy9tkj7acjBswFA9OmL+2mKoCfDA1V9yalrRhrX2Td9nA2rXuW53CFTNUOReNWEVHaVW6M4m0Bs1
 4G+wBpfTgnueN1xnIiB1DOCkIo/DWNZ1ANUZlGKDUuQCItAk+eIpUSm7jZMCx4QCnkwK+C8woM5nRLJLrG5snBAu2ThTSsV1Q8OKaklZ4TiBbqsYOok6//Rw
 amyzqJik
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/27/19 11:23 AM, Jacopo Mondi wrote:
> Report the native pixel array size and the crop bounds for the ov5670
> sensor driver.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/i2c/ov5670.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
> index 2bc57e85f721..3e22fe9ccad1 100644
> --- a/drivers/media/i2c/ov5670.c
> +++ b/drivers/media/i2c/ov5670.c
> @@ -2258,6 +2258,25 @@ static int ov5670_set_pad_format(struct v4l2_subdev *sd,
>  	return 0;
>  }
>  
> +static int ov5670_get_selection(struct v4l2_subdev *sd,
> +				struct v4l2_subdev_pad_config *cfg,
> +				struct v4l2_subdev_selection *sel)
> +{
> +	switch (sel->target) {
> +	case V4L2_SEL_TGT_CROP_BOUNDS:
> +	case V4L2_SEL_TGT_NATIVE_SIZE:
> +		sel->r.left = 0;
> +		sel->r.top = 0;
> +		sel->r.width = 2592;
> +		sel->r.height = 1944;

Why do you need this?

Since the format can change for this and the next driver I think CROP_BOUNDS
at least should match the current format.

I don't think this patch and the next have anything to do with the location/rotate
support. I would split it off from this series.

Regards,

	Hans

> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
>  static int ov5670_get_skip_frames(struct v4l2_subdev *sd, u32 *frames)
>  {
>  	*frames = OV5670_NUM_OF_SKIP_FRAMES;
> @@ -2425,6 +2444,7 @@ static const struct v4l2_subdev_pad_ops ov5670_pad_ops = {
>  	.enum_mbus_code = ov5670_enum_mbus_code,
>  	.get_fmt = ov5670_get_pad_format,
>  	.set_fmt = ov5670_set_pad_format,
> +	.get_selection = ov5670_get_selection,
>  	.enum_frame_size = ov5670_enum_frame_size,
>  };
>  
> 

