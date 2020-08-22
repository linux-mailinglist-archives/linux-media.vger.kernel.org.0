Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7D6824E82D
	for <lists+linux-media@lfdr.de>; Sat, 22 Aug 2020 17:04:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727899AbgHVPD6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 22 Aug 2020 11:03:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726534AbgHVPD5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 22 Aug 2020 11:03:57 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB9E7C061573
        for <linux-media@vger.kernel.org>; Sat, 22 Aug 2020 08:03:56 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id i26so3998510edv.4
        for <linux-media@vger.kernel.org>; Sat, 22 Aug 2020 08:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XTRTiSFVNXm4dnUh6VoU2a98CXsEbJxVxae3neDmJ+0=;
        b=YSxUjfso1kaXWzjY2Am6lVk6FOszPglQCUe6cPHBL3rM1yJK0bIoIkDp3JQl1gSnIR
         IAf+xOhFYtNMNFJMCt1r50K4Y59u5x+774Us2uHNMB5zgXPExN/f+yc0a3CqtJpM1rTy
         0wwJSB8V24vEAq0iCSACU6s8UNovCUGnmMz4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XTRTiSFVNXm4dnUh6VoU2a98CXsEbJxVxae3neDmJ+0=;
        b=V0seQbaJRPsJ0OxXhz5JsaMjtaoKHcygqQDMYMvGjGJXP68RmjLcj0nuKAZQi5HPm4
         6YT3hQ+/Y4zKW4oQqRk9K0Dbu3xrqhQmfHj6P8k7VQyicrR0D2WIS6syLsOhbQjX8EoN
         q14e8gEZaquXpIu2f8ayEJtwMdHnYIRO6Oh1C5ZRw5XmbiNF7ohQPoEnuqiAmxJW8yil
         oS5nPAzPz881Fqv7/89MYS0QeHzhYFfYcauMatbjeTe4FWutEfL2bqWi+tcCJlgaHloM
         algrDckiErKaKnAZe2iAWjXtm9M1MsngKwNNeOc94ikTvzeDKRG09xRfi2yzJ6fbTLwu
         gaWg==
X-Gm-Message-State: AOAM530mgryEWkJ9IvEjOvdxmf7G7qhbZQsaVAqo0UPo8zJZNdNh/YUt
        XjFouyYX+UPBJNQ/xGX5BYulJFnFlFGM5Q==
X-Google-Smtp-Source: ABdhPJzwqyxaVItqQxmcPccVlOY4MZfOC8f6L0SH4UOE5H8RhL4ROGQN3YJnz2cEFwJRVY0oL9pU/w==
X-Received: by 2002:a50:d942:: with SMTP id u2mr7934723edj.0.1598108635247;
        Sat, 22 Aug 2020 08:03:55 -0700 (PDT)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com. [209.85.221.49])
        by smtp.gmail.com with ESMTPSA id ah1sm3445155ejc.43.2020.08.22.08.03.54
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Aug 2020 08:03:54 -0700 (PDT)
Received: by mail-wr1-f49.google.com with SMTP id 88so4535682wrh.3
        for <linux-media@vger.kernel.org>; Sat, 22 Aug 2020 08:03:54 -0700 (PDT)
X-Received: by 2002:adf:ec4f:: with SMTP id w15mr7043138wrn.385.1598108633824;
 Sat, 22 Aug 2020 08:03:53 -0700 (PDT)
MIME-Version: 1.0
References: <1597996790-21121-1-git-send-email-bingbu.cao@intel.com>
In-Reply-To: <1597996790-21121-1-git-send-email-bingbu.cao@intel.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Sat, 22 Aug 2020 17:03:41 +0200
X-Gmail-Original-Message-ID: <CAAFQd5DQR-HmFkgPk5mhTcoODEoAamhP0EO_YQR04SGQnuZp_w@mail.gmail.com>
Message-ID: <CAAFQd5DQR-HmFkgPk5mhTcoODEoAamhP0EO_YQR04SGQnuZp_w@mail.gmail.com>
Subject: Re: [PATCH v2] media: ov5675: correct the maximum exposure value
To:     Bingbu Cao <bingbu.cao@intel.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        shawnx.tu@intel.com, Sergey Senozhatsky <senozhatsky@chromium.org>,
        Bingbu Cao <bingbu.cao@linux.intel.com>, hongju.wang@intel.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bingbu,

On Fri, Aug 21, 2020 at 10:00 AM Bingbu Cao <bingbu.cao@intel.com> wrote:
>
> The unit of exposure value is different from other OmniVision sensors,
> driver will divide by 2 before set register, the exposure range exposed
> by v4l2 ctrl to user should be same as others, so the calculation for
> the maximum exposure value in current driver need be fixed.
>
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> ---
>  drivers/media/i2c/ov5675.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
>

Thanks for the patch! Please see my comments inline.

> diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
> index 8537cc4ca108..9540ce8918f0 100644
> --- a/drivers/media/i2c/ov5675.c
> +++ b/drivers/media/i2c/ov5675.c
> @@ -666,8 +666,8 @@ static int ov5675_set_ctrl(struct v4l2_ctrl *ctrl)
>         /* Propagate change of current control to all related controls */
>         if (ctrl->id == V4L2_CID_VBLANK) {
>                 /* Update max exposure while meeting expected vblanking */
> -               exposure_max = (ov5675->cur_mode->height + ctrl->val -
> -                              OV5675_EXPOSURE_MAX_MARGIN) / 2;
> +               exposure_max = ov5675->cur_mode->height + ctrl->val -
> +                       OV5675_EXPOSURE_MAX_MARGIN;
>                 __v4l2_ctrl_modify_range(ov5675->exposure,
>                                          ov5675->exposure->minimum,
>                                          exposure_max, ov5675->exposure->step,
> @@ -689,7 +689,13 @@ static int ov5675_set_ctrl(struct v4l2_ctrl *ctrl)
>                 break;
>
>         case V4L2_CID_EXPOSURE:
> -               /* 3 least significant bits of expsoure are fractional part */
> +               /* 4 least significant bits of expsoure are fractional part

exposure

> +                * val = val << 4
> +                * for ov5675, the unit of exposure is differnt from other

different

> +                * OmniVision sensors, its exposure value is twice of the
> +                * register value, the exposure should be divided by 2 before
> +                * set register, e.g. val << 3.
> +                */
>                 ret = ov5675_write_reg(ov5675, OV5675_REG_EXPOSURE,
>                                        OV5675_REG_VALUE_24BIT, ctrl->val << 3);

How about turning this code into (ctrl->val << 4) / 2 ? It will be
compiled into exactly the same code, but will be obvious that we are
handling two different factors in the computation.

Another question: Since the V4L2_CID_EXPOSURE control is not specified
to be in a particular unit and hardware supports fractional exposures,
why not expose the exposure exactly as it is in the register?

Best regards,
Tomasz

>                 break;
> @@ -770,8 +776,7 @@ static int ov5675_init_controls(struct ov5675 *ov5675)
>         v4l2_ctrl_new_std(ctrl_hdlr, &ov5675_ctrl_ops, V4L2_CID_DIGITAL_GAIN,
>                           OV5675_DGTL_GAIN_MIN, OV5675_DGTL_GAIN_MAX,
>                           OV5675_DGTL_GAIN_STEP, OV5675_DGTL_GAIN_DEFAULT);
> -       exposure_max = (ov5675->cur_mode->vts_def -
> -                       OV5675_EXPOSURE_MAX_MARGIN) / 2;
> +       exposure_max = (ov5675->cur_mode->vts_def - OV5675_EXPOSURE_MAX_MARGIN);
>         ov5675->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &ov5675_ctrl_ops,
>                                              V4L2_CID_EXPOSURE,
>                                              OV5675_EXPOSURE_MIN, exposure_max,
> --
> 2.7.4
>
