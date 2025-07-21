Return-Path: <linux-media+bounces-38173-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3723B0C435
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 14:38:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F350E3B7598
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 12:37:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9421729E118;
	Mon, 21 Jul 2025 12:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Gl4IHKD/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA8A2D0C8C
	for <linux-media@vger.kernel.org>; Mon, 21 Jul 2025 12:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753101492; cv=none; b=ZedyHIeHJ4LQiWKfJfIXbvZO+uVS7gV8c77/lljUrmSGqQN4nqY5iQio0h95KcSK0AfYROk6DVZFZhSyY6vkbUtBinLnzhQ8FPBFSstemOScujrjJ5MOd/YBBiCJJc60cvNJik81tpBytr0h6JM+bqlgwi1kMFkCQYWA9SlSRg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753101492; c=relaxed/simple;
	bh=CET/lI710IKGUGzt9jQKHwcXldDKAFly66+nVY1JkJc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HSxA8nRXdrxiRTjrSql+HAJZO2FsPlV/Z6Qczg3i5VSGOV6O2PYm+SphRMGTQBd6CnN/I1olg657E83Lug3UFrmZ0U/Y++bUfpdaWo/eWK4w+mMfj8uflcMEBwWgOMT7mYK8WUWXHyXSgdl3RUEghsGkwKA6mwCiindE5s2lJa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=Gl4IHKD/; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-70e64b430daso44288317b3.3
        for <linux-media@vger.kernel.org>; Mon, 21 Jul 2025 05:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1753101489; x=1753706289; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2WhQZ1zsodPehC6NtLrdhMxOxdLSzqy9gqStjR4gEzQ=;
        b=Gl4IHKD/mJ3lyE/JfjPzhOlio4iY6ADWsn42GEwaa/kA7QROllEXjmo35LYv5dZUBp
         6ZnYEnMWGjhukM1ccNo2u/FXoHjKYcmrJ9JoCS0FdmVtYxZu50gJmMpnPtauRIcKfzBz
         2PBLwzmy6kYVgpGCQsYyB2bkt991avCyHDEUK9+p7F5opjbj9gb1aDcasTDFRpEIV8BV
         7jKw3JWW6KqIplySuoUiuxsQbbty6u8J12LIFMFyD1msuZOTa95RKbCKFAjgvQ0XbrCG
         QvP3fNmeo0ZFPC/GRl+X3WzK7AdRYQObwa+lW5GhtBSsZQN67vCz/e3OdD/3c9mfsBbU
         lGwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753101489; x=1753706289;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2WhQZ1zsodPehC6NtLrdhMxOxdLSzqy9gqStjR4gEzQ=;
        b=b5hoApvEBurWwiVOrlpmdVrtYFn8XVoOdFPjf+2iCW9DXyNkIxos2jDPAjrnD4vaJc
         LtgG8Rb12C9Dy4QKnDpJCQ77VbKwx8gBUpT0fnhKkYWNA3vC9BrC/Qbh0fiOexU78XVK
         nrIprIDO+L3mWawmjgmknPtUqjaxBWiaalKe8ZTazC9hvuSecbzAQ+HMGO+V5/5/JkYQ
         O17cr4DpCUtrQI6bfPGD2dPS+A6cUmWNy5pIt8StowrdC2n+XUl+mwPjOaiUw5akvHnx
         FFPel8g21Qj/oPuPU2AxBFH157X3UXP3mBvwST+/aspTXLyx5sEmoFTEncXNx4F70A1s
         HZVg==
X-Forwarded-Encrypted: i=1; AJvYcCVywbgYK3j0c7sNT4jKuh4P+Q9H0WQYZSNNYenQiK2TOeJBa9u//WifhMbE5Pz/tweDBrlb2Z9942dgSg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKRem6QAhRouZE+kU6dzf2gxmtJEx13Bkmoa2lW1RZT4CDzUTZ
	UAen5LRbDY7t9gA2RC2Xv2KbZclmhc6BS1ShCBCPERk6lh7Obric1wsh3Mew2rOn3AXZXyEK08F
	JkZv+SNSUtZQ1rWVcvd+pnsh0GfY/VpOD/wJWDuh9KQ==
X-Gm-Gg: ASbGncuLZlo+mxAX+fSLLMpzrxwhd+Xw+MrNPgo4t5P9rS3FaaPRD8APxIWAKY9I29p
	z3I9qNiX+MbeWxG6N0StiJOQ/rSJJsYYkOGD5tvVI4U1yW3k9D64KlDeuECqRFjrP3Yff2xTstr
	ORMLmdHwpckioCm1oP3oK9yvJj/pUj6LMbX9tFkHB1oWTyh6mDsUqE5IzJbnUjlkazxMoxNXev+
	fuiYxy6kOy06hANZvQ0AKeEFW+n5xh+1zzN4/A=
X-Google-Smtp-Source: AGHT+IEhn+eTTh1khIugPJYw5tq+PhDGh2OGGFuGD19SEd9+uPk+wgAotoJpAw0l985Ugii1S2fPKrRwwVbLr84la1k=
X-Received: by 2002:a05:690c:d1b:b0:712:c14a:a37c with SMTP id
 00721157ae682-7183751a25emr229242907b3.27.1753101488687; Mon, 21 Jul 2025
 05:38:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250717124001.108486-1-vladimir.zapolskiy@linaro.org>
 <20250717124001.108486-3-vladimir.zapolskiy@linaro.org> <175276139540.560048.14744394485094549778@ping.linuxembedded.co.uk>
 <CAPY8ntCiKFFdfepqW0ms_0dhCtJJCwJoT=bxmJ5i0K254i6fkA@mail.gmail.com> <7bb16a20-166a-477d-a103-a00fe83ecb66@linaro.org>
In-Reply-To: <7bb16a20-166a-477d-a103-a00fe83ecb66@linaro.org>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 21 Jul 2025 13:37:50 +0100
X-Gm-Features: Ac12FXwFx9Fa3eSF9EHu034xXcK1IGqbUJyd567Vad7sFth8RDhDHhHmnWYR_8w
Message-ID: <CAPY8ntBQNw-GLRsFGAMbJUG284Fp6O2BqUrbbz2O-z=O73dVaQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: i2c: Add OmniVision OV6211 image sensor driver
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, Hans Verkuil <hverkuil@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Vladimir

On Fri, 18 Jul 2025 at 16:27, Vladimir Zapolskiy
<vladimir.zapolskiy@linaro.org> wrote:
>
> Hello Dave.
>
> On 7/17/25 18:07, Dave Stevenson wrote:
> > Hi Vladimir and Kieran
> >
> > On Thu, 17 Jul 2025 at 15:10, Kieran Bingham
> > <kieran.bingham@ideasonboard.com> wrote:
> >>
> >> Quoting Vladimir Zapolskiy (2025-07-17 13:40:01)
> >>> OmniVision OV6211 is a monochrome image sensor, which produces frames in
> >>> 8/10-bit raw output format and supports 400x400, 200x200 and 100x100
> >>> output image resolution modes.
> >>>
> >>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> >>> ---
>
> <snip>
>
> >>> +       { 0x3800, 0x00 },
> >>> +       { 0x3801, 0x04 },
> >>> +       { 0x3802, 0x00 },
> >>> +       { 0x3803, 0x04 },
> >>> +       { 0x3804, 0x01 },
> >>> +       { 0x3805, 0x9b },
> >>> +       { 0x3806, 0x01 },
> >>> +       { 0x3807, 0x9b },
> >>> +       { 0x3808, 0x01 },
> >>> +       { 0x3809, 0x90 },
> >>
> >> 0x190 == 400;
> >>
> >>> +       { 0x380a, 0x01 },
> >>> +       { 0x380b, 0x90 },
> >>
> >> So I bet these are the width and height registers.
> >
> > Almost certainly as that also matches OV7251 and OV9281.
> > 0x3800/1 is X_ADDR_START
> > 0x3802/3 is Y_ADDR_START
> > 0x3804/5 is X_ADDR_END
> > 0x3806/7 is Y_ADDR_END
> > 0x3808/9 is X_OUTPUT_SIZE
> > 0x380a/b is Y_OUTPUT_SIZE.
> > Those almost all fit here, although it does imply that it's reading
> > (0x019b - 0x0004 + 1 = ) 408 x408 from the array, but only outputting
> > 400x400.
> >
> >> Have you got a data sheet for this ? It would be /really/ far more
> >> helpful to break out the specific register updates here for the mode
> >> configuration at least.
> >>
> >>> +       { 0x380c, 0x05 },
> >>> +       { 0x380d, 0xf2 },
> >>> +       { 0x380e, 0x01 },
> >>> +       { 0x380f, 0xb6 },
>
> <snip>
>
> >>> +};
> >>> +
> >>> +static const struct ov6211_mode supported_modes[] = {
> >>> +       {
> >>> +               .width = 400,
> >>> +               .height = 400,
> >>> +               .hts = 1522,
> >>> +               .vts = 438,
> >
> > This implies we do have the blanking values, but don't expose them.
> > The values don't appear to be used for anything though.
> >
>
> 0x380c and 0x380e registers are to set hts/vts, for reference I've
> added a human readable representation over here, however the values
> are formally unused anywhere in the driver, they could be removed,
> or left as is.

Keep them but add the V4L2_VID_[HV]BLANK controls with the corresponding values.

Your commit text says that the sensor also supports 100x100 and
200x200, so keeping it as a per mode value is perfectly valid.

> >>> +               .reg_list = {
> >>> +                       .regs = mode_400x400_regs,
> >>> +                       .num_of_regs = ARRAY_SIZE(mode_400x400_regs),
> >>> +               },
> >>> +       },
> >>> +};
>
> <snip>
>
> >>> +static int ov6211_set_ctrl(struct v4l2_ctrl *ctrl)
> >>> +{
> >>> +       struct ov6211 *ov6211 = container_of(ctrl->handler, struct ov6211,
> >>> +                                            ctrl_handler);
> >>> +       struct i2c_client *client = v4l2_get_subdevdata(&ov6211->sd);
> >>> +       int ret;
> >>> +
> >>> +       /* V4L2 controls values will be applied only when power is already up */
> >>> +       if (!pm_runtime_get_if_in_use(&client->dev))
> >>> +               return 0;
> >>> +
> >>> +       switch (ctrl->id) {
> >>> +       case V4L2_CID_ANALOGUE_GAIN:
> >>> +               ret = ov6211_write_reg(ov6211, OV6211_REG_ANALOGUE_GAIN,
> >>> +                                      OV6211_REG_VALUE_16BIT, ctrl->val);
> >>> +               break;
> >>> +       case V4L2_CID_EXPOSURE:
> >>> +               ret = ov6211_write_reg(ov6211, OV6211_REG_EXPOSURE,
> >>> +                                      OV6211_REG_VALUE_24BIT, ctrl->val << 4);
> >>> +               break;
> >>
> >> What about V4L2_CID_HBLANK and V4L2_CID_VBLANK ?
> >
> > It's also missing V4L2_CID_PIXEL_RATE, so even with the blanking
> > values you can't control frame rate.
> >
>
> The single given sensor configuration setting above sets 120fps.
>
> I may add it with a V4L2_CTRL_FLAG_READ_ONLY control though.

The use of PIXEL_RATE, VBLANK, and HBLANK are the official way for raw
camera sensors to report (or control) the frame rate [1].
PIXEL_RATE defaults to read only anyway [2].
Having them all as read only is valid, but gives userspace the frame
rate information.

[1] https://www.kernel.org/doc/html/latest/userspace-api/media/drivers/camera-sensor.html#raw-camera-sensors
[2] https://elixir.bootlin.com/linux/v6.15.7/source/drivers/media/v4l2-core/v4l2-ctrls-defs.c#L1515

> >>> +       default:
> >>> +               ret = -EINVAL;
> >>> +               break;
> >>> +       }
> >>> +
> >>> +       pm_runtime_put(&client->dev);
> >>> +
> >>> +       return ret;
> >>> +}
> >>> +
> >>> +static const struct v4l2_ctrl_ops ov6211_ctrl_ops = {
> >>> +       .s_ctrl = ov6211_set_ctrl,
> >>> +};
> >>> +
> >>> +static int ov6211_init_controls(struct ov6211 *ov6211)
> >>> +{
> >>> +       struct v4l2_ctrl_handler *ctrl_hdlr;
> >>> +       s64 exposure_max;
> >>> +       int ret;
> >>> +
> >>> +       ctrl_hdlr = &ov6211->ctrl_handler;
> >>> +       ret = v4l2_ctrl_handler_init(ctrl_hdlr, 3);
> >>> +       if (ret)
> >>> +               return ret;
> >>> +
> >>> +       ctrl_hdlr->lock = &ov6211->mutex;
> >>> +
> >>> +       ov6211->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, &ov6211_ctrl_ops,
> >>> +                                       V4L2_CID_LINK_FREQ,
> >>> +                                       ARRAY_SIZE(link_freq_menu_items) - 1,
> >>> +                                       0, link_freq_menu_items);
> >>> +       if (ov6211->link_freq)
> >>> +               ov6211->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> >>> +
> >>> +       v4l2_ctrl_new_std(ctrl_hdlr, &ov6211_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
> >>> +                         OV6211_ANALOGUE_GAIN_MIN, OV6211_ANALOGUE_GAIN_MAX,
> >>> +                         OV6211_ANALOGUE_GAIN_STEP,
> >>> +                         OV6211_ANALOGUE_GAIN_DEFAULT);
> >>> +
> >>> +       exposure_max = (ov6211->cur_mode->vts - OV6211_EXPOSURE_MAX_MARGIN);
> >>> +       ov6211->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &ov6211_ctrl_ops,
> >>> +                                            V4L2_CID_EXPOSURE,
> >>> +                                            OV6211_EXPOSURE_MIN, exposure_max,
> >>> +                                            OV6211_EXPOSURE_STEP,
> >>> +                                            OV6211_EXPOSURE_DEFAULT);
> >>> +
> >>
> >> As well as the blanking - I think this driver is missing reporting the
> >> crop selection implementation to report the sensor crops.
> >
> > A call to v4l2_fwnode_device_parse and v4l2_ctrl_new_fwnode_properties
> > wouldn't go amiss to provide the standard orientation and rotation
> > properties wouldn't go amiss either.
> >
>
> To my knowledge the sensor does not support orientation or rotation
> configuration.

v4l2_ctrl_new_fwnode_properties adds V4L2_CID_CAMERA_ORIENTATION and
V4L2_CID_CAMERA_SENSOR_ROTATION which provide userspace with
information over where and how the sensor is mounted in the device, as
read from device-tree or similar. They mean that a JPEG can have a
suitable EXIF orientation tag to get the viewer to rotate the image
appropriately, or it can identify where physically the sensor is
mounted.

Actual flips would normally be controlled V4L2_CID_[HV]FLIP, and not
supporting those is fine.

> >>> +}
> >>> +
> >>> +static int ov6211_check_hwcfg(struct ov6211 *ov6211)
> >>> +{
> >>> +       struct i2c_client *client = v4l2_get_subdevdata(&ov6211->sd);
> >>> +       struct device *dev = &client->dev;
> >>> +       struct fwnode_handle *fwnode = dev_fwnode(dev), *ep;
> >>> +       struct v4l2_fwnode_endpoint bus_cfg = {
> >>> +               .bus_type = V4L2_MBUS_CSI2_DPHY
> >>> +       };
> >>> +       int ret;
> >>> +
> >>> +       if (!fwnode)
> >>> +               return -ENXIO;
> >>> +
> >>> +       ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
> >>> +       if (!ep)
> >>> +               return -ENXIO;
> >>> +
> >>> +       ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
> >>> +       fwnode_handle_put(ep);
> >>> +       if (ret)
> >>> +               return ret;
> >>> +
> >>> +       if (bus_cfg.bus.mipi_csi2.num_data_lanes &&
> >
> > Is it permitted to omit the data-lanes configuration?
> >
>
> That's a question to linux-media maintainers.
>
> This sensor does not have configurable data-lanes, it's a single lane
> sensor, so adding a constant 'data-lanes' property does not help in any
> way to describe a hardware wiring, the property becomes a redundant one.
>
> There are some MIPI CSI2 sensors, which does not have 'data-lanes'
> property, for instance ovti,ov2680.

ov2680 doesn't validate the number of data lanes though.

> <snip>
>
> >>> +
> >>> +       ov6211->xvclk = devm_clk_get_optional(&client->dev, NULL);
> >>> +       if (IS_ERR(ov6211->xvclk)) {
> >>> +               ret = PTR_ERR(ov6211->xvclk);
> >>> +               dev_err(&client->dev, "failed to get XVCLK clock: %d\n", ret);
> >>> +               return ret;
> >>> +       }
> >>> +
> >>> +       freq = clk_get_rate(ov6211->xvclk);
> >>> +       if (freq && freq != OV6211_MCLK_FREQ_24MHZ)
> >>> +               return dev_err_probe(&client->dev, -EINVAL,
> >>> +                               "XVCLK clock frequency %lu is not supported\n",
> >>> +                               freq);
> >
> > This would be nicer to make use of the cleanups that have just been
> > implemented in
> > https://lore.kernel.org/linux-media/cover.1750942967.git.mehdi.djait@linux.intel.com/
> > and
> > https://lore.kernel.org/linux-media/20250710174808.5361-1-laurent.pinchart@ideasonboard.com/T/
> >
>
> Actually I've already checked it before publishing the code, as a summary:
>
> 1. to my understanding the introduced API is still under review, I didn't
> find it in media/master or linux-next,
>
> 2. the only needed change to get support of the new helper is to replace
> the single line of devm_clk_get_optional() with devm_v4l2_sensor_clk_get(),
> no more than that,
>
> 3. the internal complexity of devm_v4l2_sensor_clk_get() seems excessive
> right over here, what's worse I can not test devm_v4l2_sensor_clk_get()
> in this driver on any ACPI platform...
>
> To sum up and to minimize the overall complexity, I'd rather prefer to
> stick to devm_clk_get_optional() at the moment, the switch to the new
> proposed API can be done, when it's ready.

Responded to by Mehdi.
I would expect devm_v4l2_sensor_clk_get to be merged before this
driver, at which point you're likely going to get asked to make use of
it anyway. Otherwise you're just asking someone else to write the
cleanup patch at a later date.

  Dave

