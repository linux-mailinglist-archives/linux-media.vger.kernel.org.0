Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 990702CC086
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 16:16:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730211AbgLBPPS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 10:15:18 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:40667 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728295AbgLBPPR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Dec 2020 10:15:17 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id kTpvkF2vwN7XgkTpyktj1V; Wed, 02 Dec 2020 16:14:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1606922075; bh=ueykLDCb0hQH4lDcG1w/8WkuuuVBuvMx5BwvzcpsdSo=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=l0OGNwufxgHhKEZKfYeQ8h7HR+4+Dq/7AE1MtQel6eoevcZ4oS8HPU10WiW7gHH7y
         InGKl9D1mm+xKl5AyxrjIm+sG4c9UrlkqcNg+GSdKKJ4TDbflNA7pVR5PjVq9mLLD5
         QRr6hEIvU/rg3GR710opAtfMW7G1MJL7usZl9W+GQJpvaM1kTrw2L7TH/tkxZ3bjiu
         82TzvpLKszv9SkRFFhw69YXpDAcRl3mRNJ7xgoCFWK7XSpKSl+rDX+3Ktx8NnRU0Qm
         q3Vg6HBHFi7/3wxcR1VyhWB3uizBt7Dafd4jZ73awZGcXPwIhsEatL2nS5imj8/Wyf
         US9vt0UzwOfVQ==
Subject: Re: [PATCH v3 2/4] media: meson: Add M2M driver for the Amlogic GE2D
 Accelerator Unit
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20201117084440.578540-1-narmstrong@baylibre.com>
 <20201117084440.578540-3-narmstrong@baylibre.com>
 <3ce8d325-9d6d-9327-b019-65aad3fb1e64@xs4all.nl>
 <81cd2c1b-cfc9-0167-0e72-9f47b0887369@baylibre.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <540b95ef-5815-d400-9214-87667c3b3777@xs4all.nl>
Date:   Wed, 2 Dec 2020 16:14:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <81cd2c1b-cfc9-0167-0e72-9f47b0887369@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfM1UTrabwKVYI0PKqptLiQZMzq8cjf0fI/VmLxBbpPj4BVN1/RMgAETOTQOcA1DxrZQ87i6MNqpG2mfWGR6hDLCjDUEE4a3g9/+4hE4oS/V4gyjI5PCm
 Ro2DSD5C6xy4QDoO9h7FvaUgexpHxIVXZEYpLZVH+mZT0YxRiqldQVX6b3VoSQQjJadjpw1gU0vX/RbtQKMLlBuqI+nZ/lLW4T8BpjwAUXh7aJrX0P+IzmYe
 vCFGTbp5s4ayiEyrZisz5Wub6dExFNp4ZCc6Ewprf2vzfcQHCx4YWMFdEGK+vJM3+4EvYlu/XOxJy6m3OsHNmLs3OciKha0fVJ5OKMTKveG8sYjcuxLzL2q8
 dBEuv8hGGw1wrdsOLWO8lUiNonONdA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 02/12/2020 15:56, Neil Armstrong wrote:
> Hi Hans,
> 
> On 02/12/2020 13:40, Hans Verkuil wrote:
>> On 17/11/2020 09:44, Neil Armstrong wrote:
>>> The GE2D is a 2D accelerator with various features like configurable blitter
>>> with alpha blending, frame rotation, scaling, format conversion and colorspace
>>> conversion.
>>>
>>> The driver implements a Memory2Memory VB2 V4L2 streaming device permitting:
>>> - 0, 90, 180, 270deg rotation
>>> - horizontal/vertical flipping
>>> - source cropping
>>> - destination compositing
>>> - 32bit/24bit/16bit format conversion
>>>
>>> This adds the support for the GE2D version found in the AXG SoCs Family.
>>>
>>> The missing features are:
>>> - Source scaling
>>> - Colorspace conversion
>>> - Advanced alpha blending & blitting options
>>>
>>> Is passes v4l2-compliance SHA: ea16a7ef13a902793a5c2626b0cefc4d956147f3, 64 bits, 64-bit time_t
>>>
>>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>>> ---
>>>  drivers/media/platform/Kconfig                |   13 +
>>>  drivers/media/platform/Makefile               |    2 +
>>>  drivers/media/platform/meson/ge2d/Makefile    |    3 +
>>>  drivers/media/platform/meson/ge2d/ge2d-regs.h |  360 ++++++
>>>  drivers/media/platform/meson/ge2d/ge2d.c      | 1091 +++++++++++++++++
>>>  5 files changed, 1469 insertions(+)
>>>  create mode 100644 drivers/media/platform/meson/ge2d/Makefile
>>>  create mode 100644 drivers/media/platform/meson/ge2d/ge2d-regs.h
>>>  create mode 100644 drivers/media/platform/meson/ge2d/ge2d.c
>>>
> 
> [...]
> 
>>> +
>>> +#define DEFAULT_WIDTH	100
>>> +#define DEFAULT_HEIGHT	100
>>
>> That's a weird default value. I would expect to see some multiple of 8 here.
> 
> Sure, whatever the HW is quite flexible, I took 100x100 from the other 2D accelerator drivers actually.
> 
> [...]
> 
>>> +
>>> +static void ge2d_stop_streaming(struct vb2_queue *vq)
>>> +{
>>> +	struct ge2d_ctx *ctx = vb2_get_drv_priv(vq);
>>> +	struct vb2_v4l2_buffer *vbuf;
>>> +
>>> +	if (V4L2_TYPE_IS_OUTPUT(vq->type))
>>> +		ctx->streamon_out = false;
>>> +	else
>>> +		ctx->streamon_cap = false;
>>
>> Do you need streamon_out/cap? Can't you use vb2_start_streaming_called() instead?
> 
> Indeed, I'll switch to vb2_start_streaming_called & co.
> 
> [...]
> 
>>> +
>>> +static int vidioc_try_fmt_out(struct file *file, void *priv, struct v4l2_format *f)
>>> +{
>>> +	const struct ge2d_fmt *fmt = find_fmt(f);
>>> +
>>> +	f->fmt.pix.field = V4L2_FIELD_NONE;
>>> +	f->fmt.pix.pixelformat = fmt->fourcc;
>>> +
>>> +	if (f->fmt.pix.width > MAX_WIDTH)
>>> +		f->fmt.pix.width = MAX_WIDTH;
>>> +	if (f->fmt.pix.height > MAX_HEIGHT)
>>> +		f->fmt.pix.height = MAX_HEIGHT;
>>> +
>>> +	if (f->fmt.pix.width < 0)
>>> +		f->fmt.pix.width = 0;
>>> +	if (f->fmt.pix.height < 0)
>>> +		f->fmt.pix.height = 0;
>>
>> width and height are unsigned, so this check is not needed.
> 
> Ok
> 
> [...]
> 
>>> +
>>> +static int ge2d_s_ctrl(struct v4l2_ctrl *ctrl)
>>> +{
>>> +	struct ge2d_ctx *ctx = container_of(ctrl->handler, struct ge2d_ctx,
>>> +					   ctrl_handler);
>>> +	struct v4l2_pix_format fmt;
>>> +	struct vb2_queue *vq;
>>> +	unsigned long flags;
>>> +
>>> +	spin_lock_irqsave(&ctx->ge2d->ctrl_lock, flags);
>>> +	switch (ctrl->id) {
>>> +	case V4L2_CID_HFLIP:
>>> +		ctx->hflip = ctrl->val;
>>> +		break;
>>> +	case V4L2_CID_VFLIP:
>>> +		ctx->vflip = ctrl->val;
>>> +		break;
>>> +	case V4L2_CID_ROTATE:
>>> +		vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
>>> +		if (vb2_is_busy(vq))
>>> +			return -EBUSY;
>>
>> This doesn't call spin_unlock_irqrestore()!
>>
>> Do you need the spinlock at all? This function is already called with a mutex
>> for ctrl->handler held. It's unusual to see a spinlock here.
> 
> Is device_run also called with ctrl->handler held ?
> 
> The spinlock is used to protect against concurrent re-config & run.

Ah, I see. I think it would help to add some more comments.

BTW, do you need to save the irq state? This function definitely can't
be called from interrupt context, and I suspect that's also true of the
other place where this spinlock is used.

> 
> [...]
> 
>>> +
>>> +	platform_set_drvdata(pdev, ge2d);
>>> +	ge2d->m2m_dev = v4l2_m2m_init(&ge2d_m2m_ops);
>>> +	if (IS_ERR(ge2d->m2m_dev)) {
>>> +		v4l2_err(&ge2d->v4l2_dev, "Failed to init mem2mem device\n");
>>> +		ret = PTR_ERR(ge2d->m2m_dev);
>>> +		goto unreg_video_dev;
>>
>> This should be goto rel_vdev.
>>
>>> +	}
>>> +
>>> +	ret = video_register_device(vfd, VFL_TYPE_VIDEO, -1);
>>> +	if (ret) {
>>> +		v4l2_err(&ge2d->v4l2_dev, "Failed to register video device\n");
>>> +		goto rel_vdev;
>>> +	}
>>> +
>>> +	v4l2_info(&ge2d->v4l2_dev, "Registered %s as /dev/%s\n",
>>> +		  vfd->name, video_device_node_name(vfd));
>>> +
>>> +	return 0;
>>> +
>>> +rel_vdev:
>>> +	video_device_release(vfd);
>>> +unreg_video_dev:
>>> +	video_unregister_device(ge2d->vfd);
>>
>> This makes no sense. If video_register_device() fails, then you
>> call video_device_release(vfd), not video_unregister_device().
>>
>> Just drop these two lines.
> 
> ok
> 
>>
>>> +unreg_v4l2_dev:
>>> +	v4l2_device_unregister(&ge2d->v4l2_dev);
>>> +disable_clks:
>>> +	clk_disable_unprepare(ge2d->clk);
>>> +
>>> +	return ret;
>>> +}
>>> +
>>> +static int ge2d_remove(struct platform_device *pdev)
>>> +{
>>> +	struct meson_ge2d *ge2d = platform_get_drvdata(pdev);
>>> +
>>> +	v4l2_m2m_release(ge2d->m2m_dev);
>>> +	video_unregister_device(ge2d->vfd);
>>> +	v4l2_device_unregister(&ge2d->v4l2_dev);
>>> +
>>> +	clk_disable_unprepare(ge2d->clk);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static const struct of_device_id meson_ge2d_match[] = {
>>> +	{
>>> +		.compatible = "amlogic,axg-ge2d",
>>> +	},
>>> +	{},
>>> +};
>>> +
>>> +MODULE_DEVICE_TABLE(of, meson_ge2d_match);
>>> +
>>> +static struct platform_driver ge2d_drv = {
>>> +	.probe = ge2d_probe,
>>> +	.remove = ge2d_remove,
>>> +	.driver = {
>>> +		.name = "meson-ge2d",
>>> +		.of_match_table = meson_ge2d_match,
>>> +	},
>>> +};
>>> +
>>> +module_platform_driver(ge2d_drv);
>>> +
>>> +MODULE_AUTHOR("Neil Armstrong <narmstrong@baylibre.com>");
>>> +MODULE_DESCRIPTION("Amlogic 2D Graphic Acceleration Unit");
>>> +MODULE_LICENSE("GPL");
>>>
>>
>> Regards,
>>
>> 	Hans
>>
> 
> Thanks,
> Neil
> 

Regards,

	Hans
