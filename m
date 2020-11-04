Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F00702A6422
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 13:20:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729633AbgKDMUo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 07:20:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729309AbgKDMUn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Nov 2020 07:20:43 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B7D9C0613D3
        for <linux-media@vger.kernel.org>; Wed,  4 Nov 2020 04:20:43 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id s9so21803991wro.8
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2020 04:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lZdzvdy8Sq/De4RJgo6r7FB2yFdSB02eJWDSBMpYBRk=;
        b=fo4Or3XT0QeNT5saduNiJXJS8Liqaadfz/Q0lKIJZYClqpnQ1BwQodPlnr/9LXVNk7
         hwu1lpIUmrXoL+ENXZRgR8Llp6Yqe2vh77sDze0HmHFcYy8iOcMFdAbvqKh+uBjNPRDN
         1yGMf03qRaWwua7rfpGJ5iF/YVP5NRrgoj4Lx7Bp5syag13/e/IceZ8pEhgEvqSXSFTo
         ZO+cIN8up4rtQgOq2lbBqP6DWBxo0PCOpJyij6NQBB1/0iNBauv/iEA6PNy3fY/Jy1nN
         0Xs1AY5b+AvnYp9JRhLpdu8DYZzcICTxm2OqXUTpbNDv7VoBDW/jXJZX7dUc2Bj8j8RV
         XzLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lZdzvdy8Sq/De4RJgo6r7FB2yFdSB02eJWDSBMpYBRk=;
        b=Z1VntOVWYsHWJ4JSOWB8OhOvs2r0MrdgswKtpN4NPMqJz8pESHoaoOxmlfH2FtVjc1
         oEN2rewcpIjR4Z4uhxCybHf4shol+2imMOtXzu+Owd3QPoXrGAN3tAS0eyO1CKT7k4T0
         86t+ha1DZjLFpR9PbB0LacvvmNuOpl1aakTx8sADIBkWdEo1oE52L7w3uJmsCtBvc/CE
         Q0Yt/l16aBU3huZzvksj7boLMIbXfTg+zy2z+Rurd+HFBEWIYKCNmKnqjCrlnrwLPdtB
         h9gw6kQ6uiKm4tu4g7WpCp3YKCfb8vRRYECC6CAgt0nZ1hSmh7IBFa8nIqcpP6vwFdZo
         vAog==
X-Gm-Message-State: AOAM532RnlrrlpOS1N21TFAOSMn7gtUkQoGPDaGKMsM4m8IB1Ze/Xnp8
        +ePzVeTbRf9rMh8/R+Am9FCXvoU+jig2ctWNfjf2Aw==
X-Google-Smtp-Source: ABdhPJyDH5PAEDDM3aIm4nxu1r3ZmmPw4zBE1UDIMrybf1d5DTXL6cy0Grkyk3LaMe9ED57DhlZtq61Ac3RZWMuuBBQ=
X-Received: by 2002:adf:dd90:: with SMTP id x16mr18160884wrl.47.1604492442046;
 Wed, 04 Nov 2020 04:20:42 -0800 (PST)
MIME-Version: 1.0
References: <20201104103622.595908-1-jacopo@jmondi.org> <20201104103622.595908-21-jacopo@jmondi.org>
In-Reply-To: <20201104103622.595908-21-jacopo@jmondi.org>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Wed, 4 Nov 2020 12:20:26 +0000
Message-ID: <CAPY8ntBEzMwXqQhAaa6QbNx0Dg_BvAcSO3J8BXw57-vjgPqxmg@mail.gmail.com>
Subject: Re: [PATCH v2 20/30] media: ov5647: Program mode only if it has changed
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Roman Kovalivskyi <roman.kovalivskyi@globallogic.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Naushir Patuck <naush@raspberrypi.com>, erosca@de.adit-jv.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo

On Wed, 4 Nov 2020 at 10:37, Jacopo Mondi <jacopo@jmondi.org> wrote:
>
> Store in the driver structure a pointer to the currently applied mode
> and program a new one at s_stream(1) time only if it has changed.

This patch is redundant as you've moved the power calls into s_stream,
and you can't change mode whilst streaming.

It made sense when s_power was independent, as s_power(1), set_mode,
set_mode, set_mode, s_power(0) was valid and could result in the same
register set being written multiple times for no gain.

  Dave

> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/i2c/ov5647.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> index 21983af55c23f..6e500fb548c74 100644
> --- a/drivers/media/i2c/ov5647.c
> +++ b/drivers/media/i2c/ov5647.c
> @@ -96,6 +96,7 @@ struct ov5647 {
>         bool                            clock_ncont;
>         struct v4l2_ctrl_handler        ctrls;
>         const struct ov5647_mode        *mode;
> +       const struct ov5647_mode        *current_mode;
>  };
>
>  static inline struct ov5647 *to_sensor(struct v4l2_subdev *sd)
> @@ -755,6 +756,9 @@ static int ov5647_set_mode(struct v4l2_subdev *sd)
>         u8 resetval, rdval;
>         int ret;
>
> +       if (sensor->mode == sensor->current_mode)
> +               return 0;
> +
>         ret = ov5647_read(sd, OV5647_SW_STANDBY, &rdval);
>         if (ret < 0)
>                 return ret;
> @@ -781,6 +785,8 @@ static int ov5647_set_mode(struct v4l2_subdev *sd)
>                         return ret;
>         }
>
> +       sensor->current_mode = sensor->mode;
> +
>         return 0;
>  }
>
> @@ -819,6 +825,7 @@ static int ov5647_stream_on(struct v4l2_subdev *sd)
>
>  static int ov5647_stream_off(struct v4l2_subdev *sd)
>  {
> +       struct ov5647 *sensor = to_sensor(sd);
>         int ret;
>
>         ret = ov5647_write(sd, OV5647_REG_MIPI_CTRL00, MIPI_CTRL00_CLOCK_LANE_GATE |
> @@ -830,7 +837,13 @@ static int ov5647_stream_off(struct v4l2_subdev *sd)
>         if (ret < 0)
>                 return ret;
>
> -       return ov5647_write(sd, OV5640_REG_PAD_OUT, 0x01);
> +       ret = ov5647_write(sd, OV5640_REG_PAD_OUT, 0x01);
> +       if (ret < 0)
> +               return ret;
> +
> +       sensor->current_mode = NULL;
> +
> +       return 0;
>  }
>
>  static int set_sw_standby(struct v4l2_subdev *sd, bool standby)
> --
> 2.29.1
>
