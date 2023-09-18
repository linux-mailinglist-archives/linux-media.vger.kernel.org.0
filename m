Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34C137A43B0
	for <lists+linux-media@lfdr.de>; Mon, 18 Sep 2023 09:57:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238268AbjIRH5O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Sep 2023 03:57:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240285AbjIRH4u (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Sep 2023 03:56:50 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0CC51BD2
        for <linux-media@vger.kernel.org>; Mon, 18 Sep 2023 00:54:13 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 531A5C433CB
        for <linux-media@vger.kernel.org>; Mon, 18 Sep 2023 07:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695023653;
        bh=wQa/R+9zQ3o+2uilA9BJlyivxEo6luE50Cc9eCs/ukM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=gg7Qb0DrZVLbESUB0Oc1dqkroAddUDJ/1t000hB5/1WFJkYVhsbbzlITPCHQjUzyR
         DMYrSUEApY4Ue6CxtrIenNyx7SnlR8+AjftnCelk0MJhHFagONRyPrrZQTMtpL5FGM
         6lrEfv4ybSMXjZTf9Vz/DoXz+cQVrdVEKuX0xASGiymsfoS8jTK6SoXXVsV+kkPled
         b2u3Kl+vhhYqVxQ8VkcDdBtIDrM9ChXPdM4IQ3vJD9yZ2C4wcLaEh3epwJSzWBi/QX
         OOunbrescvfmDmvj23gelpggR5cKuq8tZPZTDK3M+4OIlLNPcGi6/u37wqcMMqLWmj
         RaseEFys+v0ow==
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-4963adb481dso1572937e0c.1
        for <linux-media@vger.kernel.org>; Mon, 18 Sep 2023 00:54:13 -0700 (PDT)
X-Gm-Message-State: AOJu0YwTo+5NYeL1DOMkdA39keDK8bxkh1krYu0xf9mJXLIVyc1nGipn
        Bi6ZrrHxqYsNB5kfP5P5h5aCu0RE82Jk9DWUbsE=
X-Google-Smtp-Source: AGHT+IHNZUf4rQGKojGNOn6yA+JbLzk5jvQpxQwE9ros4+YhK8yfZW57+hu0ujXSMXGz34Rgpx5qDFBzF4UdLsCb4gc=
X-Received: by 2002:a1f:4bc6:0:b0:495:bc5d:4e66 with SMTP id
 y189-20020a1f4bc6000000b00495bc5d4e66mr6132654vka.7.1695023652390; Mon, 18
 Sep 2023 00:54:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230914181704.4811-1-laurent.pinchart@ideasonboard.com> <20230914181704.4811-42-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20230914181704.4811-42-laurent.pinchart@ideasonboard.com>
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
Date:   Mon, 18 Sep 2023 09:53:55 +0200
X-Gmail-Original-Message-ID: <CAPybu_2qpWQuTmJ7d2foSxC8Pw63JC3prpsR14zebj4mZXwBSw@mail.gmail.com>
Message-ID: <CAPybu_2qpWQuTmJ7d2foSxC8Pw63JC3prpsR14zebj4mZXwBSw@mail.gmail.com>
Subject: Re: [PATCH 41/57] media: i2c: imx214: Drop system suspend and resume handlers
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Thu, Sep 14, 2023 at 8:17=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Stopping streaming on a camera pipeline at system suspend time, and
> restarting it at system resume time, requires coordinated action between
> the bridge driver and the camera sensor driver. This is handled by the
> bridge driver calling the sensor's .s_stream() handler at system suspend
> and resume time. There is thus no need for the sensor to independently
> implement system sleep PM operations. Drop them.
>
> The streaming field of the driver's private structure is now unused,
> drop it as well.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/i2c/imx214.c | 37 -------------------------------------
>  1 file changed, 37 deletions(-)
>
> diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> index e2805173f4b1..4f77ea02cc27 100644
> --- a/drivers/media/i2c/imx214.c
> +++ b/drivers/media/i2c/imx214.c
> @@ -58,8 +58,6 @@ struct imx214 {
>          * and start streaming.
>          */
>         struct mutex mutex;
> -
> -       bool streaming;
>  };
>
>  struct reg_8 {
> @@ -790,7 +788,6 @@ static int imx214_s_stream(struct v4l2_subdev *subdev=
, int enable)
>                 pm_runtime_put(imx214->dev);
>         }
>
> -       imx214->streaming =3D enable;
>         return 0;
>
>  err_rpm_put:
> @@ -906,39 +903,6 @@ static int imx214_parse_fwnode(struct device *dev)
>         return ret;
>  }
>
> -static int __maybe_unused imx214_suspend(struct device *dev)
> -{
> -       struct i2c_client *client =3D to_i2c_client(dev);
> -       struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> -       struct imx214 *imx214 =3D to_imx214(sd);
> -
> -       if (imx214->streaming)
> -               imx214_stop_streaming(imx214);
> -
> -       return 0;
> -}
> -
> -static int __maybe_unused imx214_resume(struct device *dev)
> -{
> -       struct i2c_client *client =3D to_i2c_client(dev);
> -       struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> -       struct imx214 *imx214 =3D to_imx214(sd);
> -       int ret;
> -
> -       if (imx214->streaming) {
> -               ret =3D imx214_start_streaming(imx214);
> -               if (ret)
> -                       goto error;
> -       }
> -
> -       return 0;
> -
> -error:
> -       imx214_stop_streaming(imx214);
> -       imx214->streaming =3D 0;
> -       return ret;
> -}
> -
>  static int imx214_probe(struct i2c_client *client)
>  {
>         struct device *dev =3D &client->dev;
> @@ -1099,7 +1063,6 @@ static const struct of_device_id imx214_of_match[] =
=3D {
>  MODULE_DEVICE_TABLE(of, imx214_of_match);
>
>  static const struct dev_pm_ops imx214_pm_ops =3D {
> -       SET_SYSTEM_SLEEP_PM_OPS(imx214_suspend, imx214_resume)
>         SET_RUNTIME_PM_OPS(imx214_power_off, imx214_power_on, NULL)
>  };
>
> --
> Regards,
>
> Laurent Pinchart
>
