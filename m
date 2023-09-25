Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2E187AD64B
	for <lists+linux-media@lfdr.de>; Mon, 25 Sep 2023 12:44:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232596AbjIYKoz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Sep 2023 06:44:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232521AbjIYKoy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Sep 2023 06:44:54 -0400
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com [IPv6:2607:f8b0:4864:20::e36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22D32BE
        for <linux-media@vger.kernel.org>; Mon, 25 Sep 2023 03:44:47 -0700 (PDT)
Received: by mail-vs1-xe36.google.com with SMTP id ada2fe7eead31-4525dd7f9d0so2101868137.3
        for <linux-media@vger.kernel.org>; Mon, 25 Sep 2023 03:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1695638686; x=1696243486; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JoD1XxU3zqYaHnyU06CnCCHfnlmfiD7n0GpirrJ3p3U=;
        b=Ep1c6HBlyaI4l9qPofTlTW15kuRXRotn4C+sh51fmvdacCIobis8odhqUjlDCyrFLB
         +cqKtbl8DhikdxhpC+uqath8T/aa3pzPEG049n6qsDImdPO+s3+LJ3h0qlo6KWJOghlR
         zEwJu2/3RFX/LDw7qCwadXdL2ygaOq8Hc1jIVdVGMS2+ujnt0U4gQQswuD8QPf++l+rq
         dLpseK/Jwc8m4O19aXH3pzWq7n3iTXozrgD5X6T1NnVXHsbXGusCY899nFFSTv4VHWON
         KN+G2sT8iBt+Hf8F1nBOjTIMfD9C2uIG6OZO+z+yPlTE3sKJjbxUvGSYNMQnhhK3Zl1/
         WTGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695638686; x=1696243486;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JoD1XxU3zqYaHnyU06CnCCHfnlmfiD7n0GpirrJ3p3U=;
        b=bKKT88tZwsdE7eDPZELl2LrD1y3Df7MxGBODv93Yvhc7+75o1UH5+r6SmAnU4rkoHu
         DSM7/vavSA5xGWBSJ2tWYfzd1HFU4kGUQutrVCiIkKRK2JybkXjYv1QrrHLM3EuEgSsR
         hop17/Sh8aoaPuvZpCLK9QSAYleM4UEq8DQ7JgJdZxRl92Rv/OCJVfCnSXvV4n2LnA8H
         m0VOsshj5F145lOo9R97yFpt3v1E/5LCD4ImFEomtit51LFV3t2PUSpKPGFyHCNhHqkR
         SEqQee3d4BKmLZYo4jmzUNoRTkHuMQOzdrzdPASJsHd4tuuLr5lxRgZcLXRhb0iJeepo
         dh4w==
X-Gm-Message-State: AOJu0YxtAk7FSYvIMVweq0niGcbgC3Sj6+PkP1WLjZu/z4H3mJKOoWlG
        So1FNjABr3dVjjLNZq7YczaPJnWGs/7xqD3XXHQwgw==
X-Google-Smtp-Source: AGHT+IGwkOjmGtbbJtqjSuALGCjH20wr4fuu2h7ElJazsySCSICPGtriPbKf/qxt4WcIxj1ScZdQ4KGa8QvY3dJU+Bw=
X-Received: by 2002:a67:f993:0:b0:452:cfeb:1612 with SMTP id
 b19-20020a67f993000000b00452cfeb1612mr1743556vsq.28.1695638686192; Mon, 25
 Sep 2023 03:44:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230924153309.12423-1-laurent.pinchart@ideasonboard.com> <20230924153309.12423-16-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20230924153309.12423-16-laurent.pinchart@ideasonboard.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Mon, 25 Sep 2023 11:44:31 +0100
Message-ID: <CAPY8ntC1zHYqDKP1KuE1WxwPs4rbYJG=RT4nm1=f=XhOLJqZtA@mail.gmail.com>
Subject: Re: [PATCH v4 15/20] media: i2c: imx219: Remove unneeded goto
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, 24 Sept 2023 at 16:33, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Simplify the imx219_set_stream() by removing an unneeded goto statement,
> and its corresponding error label. The natural flow of the function is
> correct.
>
> While at it, drop a useless comment.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/media/i2c/imx219.c | 12 ++----------
>  1 file changed, 2 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index dfc5ce574227..a12ebf288dd2 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -760,19 +760,11 @@ static int imx219_set_stream(struct v4l2_subdev *sd, int enable)
>
>         state = v4l2_subdev_lock_and_get_active_state(sd);
>
> -       if (enable) {
> -               /*
> -                * Apply default & customized values
> -                * and then start streaming.
> -                */
> +       if (enable)
>                 ret = imx219_start_streaming(imx219, state);
> -               if (ret)
> -                       goto unlock;
> -       } else {
> +       else
>                 imx219_stop_streaming(imx219);
> -       }
>
> -unlock:
>         v4l2_subdev_unlock_state(state);
>         return ret;
>  }
> --
> Regards,
>
> Laurent Pinchart
>
