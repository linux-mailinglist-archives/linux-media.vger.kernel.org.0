Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9AE35A17D5
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2019 13:12:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727216AbfH2LMA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Aug 2019 07:12:00 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:60289 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725990AbfH2LMA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Aug 2019 07:12:00 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 3ILCiR944DqPe3ILFiNgEV; Thu, 29 Aug 2019 13:11:58 +0200
Subject: Re: [PATCH 8/8] media: cedrus: Add support for V4L2_DEC_CMD_FLUSH
To:     Jernej Skrabec <jernej.skrabec@siol.net>, mchehab@kernel.org,
        paul.kocialkowski@bootlin.com, mripard@kernel.org
Cc:     pawel@osciak.com, m.szyprowski@samsung.com,
        kyungmin.park@samsung.com, tfiga@chromium.org, wens@csie.org,
        acourbot@chromium.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org,
        ezequiel@collabora.com, jonas@kwiboo.se
References: <20190822194500.2071-1-jernej.skrabec@siol.net>
 <20190822194500.2071-9-jernej.skrabec@siol.net>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <492894c9-4724-7bf4-6382-1efa6c8b04e3@xs4all.nl>
Date:   Thu, 29 Aug 2019 13:11:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190822194500.2071-9-jernej.skrabec@siol.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfEwov33oZolPtzZ7XyvSZAIuIvkpc9TulJ+yXPZVzKtoFR2DC2TCYKvHdXqvSPOpqTHHx5FcSQ1ekXSuG4Oo9uM+zntMIRRFnU0wuATMFl1cTORWjCJr
 rKjZagUkg1p7uB6FI1X1eEm2S2kD+75q/XC4/f12WVLFAZatK4Pn8hm/4Z68H5EDl61LUi/dU2jX3ho/NI64Y23GLzpL+CFGyDgnhPSCBTzAOc7uX//3668T
 9reEi88PUiFSHsHHvYqyFXliFtDA36pkhbMuGZ2n3qFK+RKQvD76UjG39oN5N4LJzv7NYEHESvFxaSOFy46TcMTXL0JGAUhxHdyBj7+IS+IOvkyP7w6f/Vn0
 PqZUHTzoRxVrvv8fgPye6yqCTBaN2zyIzBERHkf8SU6/p/7Sv9RpTCjW42wnGKswtWWv/eG1T7G+OHDgqFcx/XlSE21f6hjfFWdhuvuxo+XiPhq0AvpPRmEY
 sB0IzEFkwH/aUVGe2J8xzC7XNkRgdEYSA+jmJHn4HcysDP9bSuJ1GHM1tSHlkSLTWPqge5brj81I5I6NekFP92nmBp0gl6BzhlA8KuUzysLeuinyDLJmgzzd
 GQsSaxcwsEElAmtcF3EVOS/2GOeuGdqc2qcj6UwQV+5XkCQwp1rAb0QHJe5j1qYd7PyIT7SMNoVXGUTNEpw1bj5cOwbW9f8/rhSB0/7rSiUggSNlnjtNdaAB
 um0xuGCTK0T1VMtidPGpRFgs9Y500env
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/22/19 9:45 PM, Jernej Skrabec wrote:
> This command is useful for explicitly flushing last decoded frame.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> ---
>  .../staging/media/sunxi/cedrus/cedrus_video.c | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> index 5153b2bba21e..9eae69d5741c 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> @@ -331,6 +331,37 @@ static int cedrus_s_fmt_vid_out(struct file *file, void *priv,
>  	return 0;
>  }
>  
> +static int cedrus_try_decoder_cmd(struct file *file, void *fh,
> +				  struct v4l2_decoder_cmd *dc)
> +{
> +	if (dc->cmd != V4L2_DEC_CMD_FLUSH)
> +		return -EINVAL;

You need to add this line here as well:

	dc->flags = 0;

As per the decoder_cmd spec.

> +
> +	return 0;
> +}
> +
> +static int cedrus_decoder_cmd(struct file *file, void *fh,
> +			      struct v4l2_decoder_cmd *dc)
> +{
> +	struct cedrus_ctx *ctx = cedrus_file2ctx(file);

You don't need this...

> +	struct vb2_v4l2_buffer *out_vb, *cap_vb;
> +	int ret;
> +
> +	ret = cedrus_try_decoder_cmd(file, fh, dc);
> +	if (ret < 0)
> +		return ret;
> +
> +	out_vb = v4l2_m2m_last_src_buf(ctx->fh.m2m_ctx);

... since you can use fh->m2m_ctx directly.

> +	cap_vb = v4l2_m2m_last_dst_buf(ctx->fh.m2m_ctx);
> +
> +	if (out_vb)
> +		out_vb->flags &= ~V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF;
> +	else if (cap_vb && cap_vb->is_held)
> +		v4l2_m2m_buf_done(cap_vb, VB2_BUF_STATE_DONE);
> +
> +	return 0;
> +}
> +

Both these functions should be moved to v4l2-mem2mem.c and renamed to
v4l2_m2m_ioctl_stateless_(try_)decoder_cmd.

As far as I can see they are completely generic and valid for any
stateless decoder. Which is very nice :-)

>  const struct v4l2_ioctl_ops cedrus_ioctl_ops = {
>  	.vidioc_querycap		= cedrus_querycap,
>  
> @@ -355,6 +386,9 @@ const struct v4l2_ioctl_ops cedrus_ioctl_ops = {
>  	.vidioc_streamon		= v4l2_m2m_ioctl_streamon,
>  	.vidioc_streamoff		= v4l2_m2m_ioctl_streamoff,
>  
> +	.vidioc_try_decoder_cmd		= cedrus_try_decoder_cmd,
> +	.vidioc_decoder_cmd		= cedrus_decoder_cmd,
> +
>  	.vidioc_subscribe_event		= v4l2_ctrl_subscribe_event,
>  	.vidioc_unsubscribe_event	= v4l2_event_unsubscribe,
>  };
> 

Regards,

	Hans
