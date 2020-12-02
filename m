Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D56F02CC026
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 15:58:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727836AbgLBO4x (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 09:56:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726075AbgLBO4x (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Dec 2020 09:56:53 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0694C0613CF
        for <linux-media@vger.kernel.org>; Wed,  2 Dec 2020 06:56:06 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id u12so4337284wrt.0
        for <linux-media@vger.kernel.org>; Wed, 02 Dec 2020 06:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:autocrypt:organization:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=enLg6XT6SSUiMy5+7z/P5Zh7y8/n14pr303Fn6gLTrA=;
        b=AN43oKPxSdNYP15vLeTV5ORbUJXlr7xiQ2DW1rYcHT+rW7WsRwiZ8hYIjYhI9aR+6k
         ZuyV1K7vUPpMgRb8NpvqMGWGQ9Il33w/eca3zUnb+baZ30hR4jZ0g47BesPL5Lh31JoN
         pyPksiW4FhNS0O5tKsr5xmfUu6XRYJmNppwv/9StYTLe2CMfNjZjaezK8neeKTQpW3q5
         JHUN0YEqva9VdOd+XsDO7Gl/J6RR7u3/kA0OEmqFc0zPGMgt2N9qarGUCLMZaK5sg8PV
         yTCoQFS+j2VQigfdOIFA5joBd++sjYCdwbwv0lRvLPNUV/ooBGRvMBa5EGRXRrSI1krq
         t6Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=enLg6XT6SSUiMy5+7z/P5Zh7y8/n14pr303Fn6gLTrA=;
        b=eMVRkD+tAgEs7aDlV9fKRcvnHUkXwU2EmxVQvtheEeARMNoM0d4jX/qbSQabUBAoJs
         NFG3Tgq2VTF63zbC6SV7Ay+sswMoLj6+4516yx8q6lQtcTCMm1VsAWkkB2JTIXvdlsMQ
         +Fn+kntnog9VB9CjXgo4RvxqUx5UbXBsoxY9ZPa3/PJ1K58LgzSCdz0PHcRPCMT16k2O
         EJVbEW79Ke3ogLL3Aad2uFxp/JNb+sfPZmSA+4myHf2a0zLJ6twXgqSfOJE73cG+HteK
         zv9FT/X20rrMEQqeA+2DMyvHksuxC6nt9srVoI4s5o3cc1lTCNV5oVNhxrIB7yiXf5sz
         RmUg==
X-Gm-Message-State: AOAM531Gp9Ewkf6gPmTpOAglyanydlUNjARwtxxgZeKFYTVeDf8rpBU+
        kN25bTMYqVwavBr4vBm7DI6ahW1Y+WKQx3DY
X-Google-Smtp-Source: ABdhPJybAZYx3Wm9Y6RQIbuE/F2PyF3ROfI6x1I+EwTo0je7P9vMvwq+l23B88CGZc5yK3IEMV4qjQ==
X-Received: by 2002:adf:b64b:: with SMTP id i11mr3913394wre.78.1606920965180;
        Wed, 02 Dec 2020 06:56:05 -0800 (PST)
Received: from ?IPv6:2a01:e35:2ec0:82b0:15b4:c668:8f06:1b99? ([2a01:e35:2ec0:82b0:15b4:c668:8f06:1b99])
        by smtp.gmail.com with ESMTPSA id w15sm2366951wrp.52.2020.12.02.06.56.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Dec 2020 06:56:04 -0800 (PST)
Subject: Re: [PATCH v3 2/4] media: meson: Add M2M driver for the Amlogic GE2D
 Accelerator Unit
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20201117084440.578540-1-narmstrong@baylibre.com>
 <20201117084440.578540-3-narmstrong@baylibre.com>
 <3ce8d325-9d6d-9327-b019-65aad3fb1e64@xs4all.nl>
From:   Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <81cd2c1b-cfc9-0167-0e72-9f47b0887369@baylibre.com>
Date:   Wed, 2 Dec 2020 15:56:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <3ce8d325-9d6d-9327-b019-65aad3fb1e64@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On 02/12/2020 13:40, Hans Verkuil wrote:
> On 17/11/2020 09:44, Neil Armstrong wrote:
>> The GE2D is a 2D accelerator with various features like configurable blitter
>> with alpha blending, frame rotation, scaling, format conversion and colorspace
>> conversion.
>>
>> The driver implements a Memory2Memory VB2 V4L2 streaming device permitting:
>> - 0, 90, 180, 270deg rotation
>> - horizontal/vertical flipping
>> - source cropping
>> - destination compositing
>> - 32bit/24bit/16bit format conversion
>>
>> This adds the support for the GE2D version found in the AXG SoCs Family.
>>
>> The missing features are:
>> - Source scaling
>> - Colorspace conversion
>> - Advanced alpha blending & blitting options
>>
>> Is passes v4l2-compliance SHA: ea16a7ef13a902793a5c2626b0cefc4d956147f3, 64 bits, 64-bit time_t
>>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>>  drivers/media/platform/Kconfig                |   13 +
>>  drivers/media/platform/Makefile               |    2 +
>>  drivers/media/platform/meson/ge2d/Makefile    |    3 +
>>  drivers/media/platform/meson/ge2d/ge2d-regs.h |  360 ++++++
>>  drivers/media/platform/meson/ge2d/ge2d.c      | 1091 +++++++++++++++++
>>  5 files changed, 1469 insertions(+)
>>  create mode 100644 drivers/media/platform/meson/ge2d/Makefile
>>  create mode 100644 drivers/media/platform/meson/ge2d/ge2d-regs.h
>>  create mode 100644 drivers/media/platform/meson/ge2d/ge2d.c
>>

[...]

>> +
>> +#define DEFAULT_WIDTH	100
>> +#define DEFAULT_HEIGHT	100
> 
> That's a weird default value. I would expect to see some multiple of 8 here.

Sure, whatever the HW is quite flexible, I took 100x100 from the other 2D accelerator drivers actually.

[...]

>> +
>> +static void ge2d_stop_streaming(struct vb2_queue *vq)
>> +{
>> +	struct ge2d_ctx *ctx = vb2_get_drv_priv(vq);
>> +	struct vb2_v4l2_buffer *vbuf;
>> +
>> +	if (V4L2_TYPE_IS_OUTPUT(vq->type))
>> +		ctx->streamon_out = false;
>> +	else
>> +		ctx->streamon_cap = false;
> 
> Do you need streamon_out/cap? Can't you use vb2_start_streaming_called() instead?

Indeed, I'll switch to vb2_start_streaming_called & co.

[...]

>> +
>> +static int vidioc_try_fmt_out(struct file *file, void *priv, struct v4l2_format *f)
>> +{
>> +	const struct ge2d_fmt *fmt = find_fmt(f);
>> +
>> +	f->fmt.pix.field = V4L2_FIELD_NONE;
>> +	f->fmt.pix.pixelformat = fmt->fourcc;
>> +
>> +	if (f->fmt.pix.width > MAX_WIDTH)
>> +		f->fmt.pix.width = MAX_WIDTH;
>> +	if (f->fmt.pix.height > MAX_HEIGHT)
>> +		f->fmt.pix.height = MAX_HEIGHT;
>> +
>> +	if (f->fmt.pix.width < 0)
>> +		f->fmt.pix.width = 0;
>> +	if (f->fmt.pix.height < 0)
>> +		f->fmt.pix.height = 0;
> 
> width and height are unsigned, so this check is not needed.

Ok

[...]

>> +
>> +static int ge2d_s_ctrl(struct v4l2_ctrl *ctrl)
>> +{
>> +	struct ge2d_ctx *ctx = container_of(ctrl->handler, struct ge2d_ctx,
>> +					   ctrl_handler);
>> +	struct v4l2_pix_format fmt;
>> +	struct vb2_queue *vq;
>> +	unsigned long flags;
>> +
>> +	spin_lock_irqsave(&ctx->ge2d->ctrl_lock, flags);
>> +	switch (ctrl->id) {
>> +	case V4L2_CID_HFLIP:
>> +		ctx->hflip = ctrl->val;
>> +		break;
>> +	case V4L2_CID_VFLIP:
>> +		ctx->vflip = ctrl->val;
>> +		break;
>> +	case V4L2_CID_ROTATE:
>> +		vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
>> +		if (vb2_is_busy(vq))
>> +			return -EBUSY;
> 
> This doesn't call spin_unlock_irqrestore()!
> 
> Do you need the spinlock at all? This function is already called with a mutex
> for ctrl->handler held. It's unusual to see a spinlock here.

Is device_run also called with ctrl->handler held ?

The spinlock is used to protect against concurrent re-config & run.

[...]

>> +
>> +	platform_set_drvdata(pdev, ge2d);
>> +	ge2d->m2m_dev = v4l2_m2m_init(&ge2d_m2m_ops);
>> +	if (IS_ERR(ge2d->m2m_dev)) {
>> +		v4l2_err(&ge2d->v4l2_dev, "Failed to init mem2mem device\n");
>> +		ret = PTR_ERR(ge2d->m2m_dev);
>> +		goto unreg_video_dev;
> 
> This should be goto rel_vdev.
> 
>> +	}
>> +
>> +	ret = video_register_device(vfd, VFL_TYPE_VIDEO, -1);
>> +	if (ret) {
>> +		v4l2_err(&ge2d->v4l2_dev, "Failed to register video device\n");
>> +		goto rel_vdev;
>> +	}
>> +
>> +	v4l2_info(&ge2d->v4l2_dev, "Registered %s as /dev/%s\n",
>> +		  vfd->name, video_device_node_name(vfd));
>> +
>> +	return 0;
>> +
>> +rel_vdev:
>> +	video_device_release(vfd);
>> +unreg_video_dev:
>> +	video_unregister_device(ge2d->vfd);
> 
> This makes no sense. If video_register_device() fails, then you
> call video_device_release(vfd), not video_unregister_device().
> 
> Just drop these two lines.

ok

> 
>> +unreg_v4l2_dev:
>> +	v4l2_device_unregister(&ge2d->v4l2_dev);
>> +disable_clks:
>> +	clk_disable_unprepare(ge2d->clk);
>> +
>> +	return ret;
>> +}
>> +
>> +static int ge2d_remove(struct platform_device *pdev)
>> +{
>> +	struct meson_ge2d *ge2d = platform_get_drvdata(pdev);
>> +
>> +	v4l2_m2m_release(ge2d->m2m_dev);
>> +	video_unregister_device(ge2d->vfd);
>> +	v4l2_device_unregister(&ge2d->v4l2_dev);
>> +
>> +	clk_disable_unprepare(ge2d->clk);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct of_device_id meson_ge2d_match[] = {
>> +	{
>> +		.compatible = "amlogic,axg-ge2d",
>> +	},
>> +	{},
>> +};
>> +
>> +MODULE_DEVICE_TABLE(of, meson_ge2d_match);
>> +
>> +static struct platform_driver ge2d_drv = {
>> +	.probe = ge2d_probe,
>> +	.remove = ge2d_remove,
>> +	.driver = {
>> +		.name = "meson-ge2d",
>> +		.of_match_table = meson_ge2d_match,
>> +	},
>> +};
>> +
>> +module_platform_driver(ge2d_drv);
>> +
>> +MODULE_AUTHOR("Neil Armstrong <narmstrong@baylibre.com>");
>> +MODULE_DESCRIPTION("Amlogic 2D Graphic Acceleration Unit");
>> +MODULE_LICENSE("GPL");
>>
> 
> Regards,
> 
> 	Hans
> 

Thanks,
Neil
