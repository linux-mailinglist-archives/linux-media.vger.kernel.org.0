Return-Path: <linux-media+bounces-23871-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B87589F91F6
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 13:12:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 23F3716A711
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 12:12:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDCF61C5CB1;
	Fri, 20 Dec 2024 12:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FK5MyNF7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA821C3F39
	for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 12:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734696768; cv=none; b=QKlEVQe0IJV5LZADYfXnJA+IHfBoyxTkrQ+UrjSS1c5cSTdldiDjGSK3o8KCxUFJ6qYsIjn0FR+lNjTliQFakEmUxnLanQbAyYFl0iyk9DbEBWGcTrffJySAjAhaVxNGAFiH6uodcVE9yCq7kzkt17tWxuxSBxlnB7R4fZzookY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734696768; c=relaxed/simple;
	bh=2h1oS0yT23GIvxmbGIO7SG+Wuc6yZWp0kTWHeqQVr78=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jJcCCGaIJZ2rC+ID3pmpAvz5N0g3nbo5xz3uEqTzXj8GPi2DNDgPb0JyJyOczhVg1x6ASoC6gxFFd64Mt/qwKPdXA6CnYZC4EBMtZuzIXBIL78xwX6AHAReqGxWu3SMUAeVuxlzWRxPqD6Jx/6vmrcCdSi3m+pYtxnRla756R60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FK5MyNF7; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-725ea1e19f0so1610275b3a.3
        for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 04:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734696765; x=1735301565; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fnZG/0RG5UJUEmKVNTvj9hkYCbi8QJ0Bgk6bDpAG7eA=;
        b=FK5MyNF7fjNhTE6vFPy9lrutHWQ8bMG26kG+BYzoj7C1nAwchtfl06KSlZtXSjJ7OG
         Dt81x92bURfg1qPEHBmMVpAKDjEiTO8jdSFpMftpXB7FRBK3bCyiCTkp168Fv/z7uISU
         nnWHz+kpaSHn0tgCcO/UOEAWPU0tZaGoUAiJ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734696765; x=1735301565;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fnZG/0RG5UJUEmKVNTvj9hkYCbi8QJ0Bgk6bDpAG7eA=;
        b=SQKrRhFU4f65DZjjGgiAQ4N4hmreeOqk7S7UaTqmBroM0VRw+Dg7AgvqWTQgUh2CVF
         0NJ5jaMCi713RR1va6BKqUHHShro1ArHzHpti9FPcPvEBKnGv1rBPnGLvjwHoUvrmnI7
         DbUEZWNMZn/JShcjsiXWzVGuZcpi5BspeHTAi1tjDs7fFMn+jkWFIGOgUAhvJen/ssiJ
         KmbRC3cAJ3fQ5FggNxSl88KDipk3ilszgRm9oSG27CULuL1ljPDmwRRQnRzXEHSLz088
         CwAbzXtQSlDCIzao6mLXyoiM3DxND3NcMm6tspu62HiSG7ZWvrghtwlxMT8TBxMauR3V
         IibA==
X-Forwarded-Encrypted: i=1; AJvYcCW2cxyaBDPlHkeo8f4l+mTWBH14DXUmdoBSBwxjNNyWevFQx5nm7s52Lo5VGcS4lLv2BB4mTZjZBO1xkw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgPz4fhV8VT3BSzhukU7tcJ/PaJErT2SJ/BtMO18PPN0bfpMlw
	/2XR+8uuT27gVHCbN03yqiHT4iKuqI+6uQwrS1e5ZBocn3JK0o0y+X8jSFZ2KBKYAGynJmieTZY
	=
X-Gm-Gg: ASbGncsQ24keS9ixJR9D9DJbVLKoePcKmzWWirG7id5z5OUzLDPbcwuTvzpodig8Bm1
	7CFvD9VsHBSUN4T12IeVGYzfAB4rgU7tJ9QOiaAXtgX34vtn9mBO6sBsj57IErF3jFw5QfNlCrl
	7bEY+m7W8W0G0LFYD8UafBKE4yjGubnJcSWTFLcjM3f5HcOJ5pKuLpx+fY5PvZx21T8ZCOjHIyE
	Kc7mbomduTRc17uzskk1veLSYI/6dj/vGWVsKRHYTNtMmW8FWUJ3oFOLFENhIAUORjLDHsaSonU
	+HjM8mqyYIYVMze3+D0teUk=
X-Google-Smtp-Source: AGHT+IEcjun36kYaUdB1KIYw+Wv580irFnA+bdksYp5w0NwxIvEDnYowrK6Y8ZptQbSbkyyECsmOqQ==
X-Received: by 2002:a05:6a00:a84:b0:725:f1ca:fd8a with SMTP id d2e1a72fcca58-72abde989b4mr3862170b3a.19.1734696765390;
        Fri, 20 Dec 2024 04:12:45 -0800 (PST)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com. [209.85.215.171])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad81644csm2958235b3a.33.2024.12.20.04.12.44
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 04:12:44 -0800 (PST)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7fcfb7db9bfso1327961a12.1
        for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 04:12:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW5XyAAUNk0J1NMwo/DDIKGEXz62LAPDH3pyutkLfcK5rTpPGc3u/8vYSA9J+yuOFeeHD1LtmXMpHCMSA==@vger.kernel.org
X-Received: by 2002:a17:90a:e706:b0:2ee:fcb5:4f54 with SMTP id
 98e67ed59e1d1-2f452eb127bmr4103129a91.27.1734696763597; Fri, 20 Dec 2024
 04:12:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241220114317.21219-1-hdegoede@redhat.com> <20241220114317.21219-2-hdegoede@redhat.com>
In-Reply-To: <20241220114317.21219-2-hdegoede@redhat.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 20 Dec 2024 13:12:30 +0100
X-Gmail-Original-Message-ID: <CANiDSCvgF+4X8vpNx54V+iC7Qxdwybhp+sitUT9hTV9oHS6f=g@mail.gmail.com>
X-Gm-Features: AbW1kvbXVLRGdPjL6K3AqAmuZFEjT2MiANABiGS746VCVH9SqZk52BG1hbLAHsk
Message-ID: <CANiDSCvgF+4X8vpNx54V+iC7Qxdwybhp+sitUT9hTV9oHS6f=g@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] media: ov2740: Add camera orientation and sensor
 rotation controls
To: Hans de Goede <hdegoede@redhat.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
	Bingbu Cao <bingbu.cao@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 20 Dec 2024 at 12:43, Hans de Goede <hdegoede@redhat.com> wrote:
>
> Add camera orientation and sensor rotation controls using
> the v4l2_fwnode_device_parse() and v4l2_ctrl_new_fwnode_properties()
> helpers.
>
> Tested-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v2:
> - Call v4l2_ctrl_handler_free() on v4l2_fwnode_device_parse() errors
> ---
>  drivers/media/i2c/ov2740.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
> index a79e478342dd..bd7475c337e2 100644
> --- a/drivers/media/i2c/ov2740.c
> +++ b/drivers/media/i2c/ov2740.c
> @@ -755,15 +755,17 @@ static const struct v4l2_ctrl_ops ov2740_ctrl_ops = {
>
>  static int ov2740_init_controls(struct ov2740 *ov2740)
>  {
> +       struct i2c_client *client = v4l2_get_subdevdata(&ov2740->sd);
>         struct v4l2_ctrl_handler *ctrl_hdlr;
>         const struct ov2740_mode *cur_mode;
>         s64 exposure_max, h_blank, pixel_rate;
>         u32 vblank_min, vblank_max, vblank_default;
> +       struct v4l2_fwnode_device_properties props;
>         int size;
>         int ret;
>
>         ctrl_hdlr = &ov2740->ctrl_handler;
> -       ret = v4l2_ctrl_handler_init(ctrl_hdlr, 8);
> +       ret = v4l2_ctrl_handler_init(ctrl_hdlr, 10);
>         if (ret)
>                 return ret;
>
> @@ -813,6 +815,15 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
>                                      V4L2_CID_TEST_PATTERN,
>                                      ARRAY_SIZE(ov2740_test_pattern_menu) - 1,
>                                      0, 0, ov2740_test_pattern_menu);
> +
> +       ret = v4l2_fwnode_device_parse(&client->dev, &props);
> +       if (ret) {
> +               v4l2_ctrl_handler_free(ctrl_hdlr);
> +               return ret;
> +       }
> +
> +       v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &ov2740_ctrl_ops, &props);
> +
>         if (ctrl_hdlr->error) {
>                 v4l2_ctrl_handler_free(ctrl_hdlr);
>                 return ctrl_hdlr->error;
> --
> 2.47.1
>


-- 
Ricardo Ribalda

