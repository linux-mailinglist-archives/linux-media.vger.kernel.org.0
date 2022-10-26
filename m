Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D24EC60E00F
	for <lists+linux-media@lfdr.de>; Wed, 26 Oct 2022 13:54:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233126AbiJZLyp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Oct 2022 07:54:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233085AbiJZLyo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Oct 2022 07:54:44 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A647746871
        for <linux-media@vger.kernel.org>; Wed, 26 Oct 2022 04:54:43 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 21so7040506edv.3
        for <linux-media@vger.kernel.org>; Wed, 26 Oct 2022 04:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3SXk0G6Nv3s5aWZhsivA2V4/5/wKca4suiKHxmU/dRc=;
        b=Ui8TyGELDUESATOYtAyErWpNceO5N1NDIUH1IV8AHsugHuatHIHeAP8Hh5aIrDnYFc
         WpEmCjB42yIKju+0gkE5P2LZrS2qYvtxoS8mL93zPPSR/yz2H0gwLcfk6C5yB5T0N0iW
         lEQZAqWovmcb6o3EihI5s2BLhf/FS0+vWNltJrNnh2Q4oCUMimXOu6V1FzHRTrDjGf++
         g9dwqeCpL6CNswtNierHdA3c3nkVx2aCaB3joUBIS7UtMP4WrHueIH4dsCLGq/NhQYZP
         bdGo0nzxYg/JfHtr0ivXdzYPCqTbE6crQ7nG+9mHFyA8ovb4hMwV3zoVsYBNBDAzTHjK
         MjFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3SXk0G6Nv3s5aWZhsivA2V4/5/wKca4suiKHxmU/dRc=;
        b=06AAGw0NSPFqBWVcMf6EJ+TWuQKdo3mtk12qdJvU5zcEi5n8KSiMyz0NGE0EFopjpY
         zoEALBYCH+5YKhnlvO2NmS2F5OeUWzMn+Bic4mG3tG8xaeoARRCv5VBsdQbBePnOP7QM
         ukqOsuzHzK3GP8NaUYk5WcqACOlOezcHOynzNlaV8XTK98hxvc4+usrUFVCQVB9i0RcX
         Cj0Nyp7I/2qlPkDA/GepPlr+CTVDTACbpc1AlrYmiP7J5gfrLIwJU+53+Ia0mYRfQglc
         Cl1UYT7VPqsI6N/8eZvZhEa/M+1nW9kVO0xM3DJpXRAvCDfmOwanXYEkKAki3g5bA4Q6
         hGiw==
X-Gm-Message-State: ACrzQf3ij5fUckfrQsTHiQR7Qqs9ktzTbc2b5To1mf3dVgjRlq8KXggx
        MIurRsWCPZC2P0mipGSb0N9Wd5adrOhJgwyNsng=
X-Google-Smtp-Source: AMsMyM5f2JMQaYQ4h8NcUIf1Wt83DsaFGFzLbFalgIjpI6RR4S9bRAGNSB7xGuf2g3uTyX+4BD6OIZW7AovWC2YP5ho=
X-Received: by 2002:a05:6402:26cf:b0:45d:48d7:928e with SMTP id
 x15-20020a05640226cf00b0045d48d7928emr39112804edd.275.1666785282043; Wed, 26
 Oct 2022 04:54:42 -0700 (PDT)
MIME-Version: 1.0
References: <20221026065123.595777-1-sakari.ailus@linux.intel.com>
In-Reply-To: <20221026065123.595777-1-sakari.ailus@linux.intel.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Wed, 26 Oct 2022 12:54:15 +0100
Message-ID: <CA+V-a8v=1dhj6oY1e7AouwOyDsMNoLQD2Of9wrsFBNRQU6uc3A@mail.gmail.com>
Subject: Re: [PATCH 1/1] v4l: subdev: Warn if disabling streaming failed,
 return success
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Wed, Oct 26, 2022 at 7:50 AM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Complain in the newly added s_stream video op wrapper if disabling
> streaming failed. Also return zero in this case as there's nothing the
> caller can do to return the error.
>
> This way drivers also won't need to bother with printing error messages.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 15 +++++++++++++++
>  include/media/v4l2-subdev.h           |  6 ++++--
>  2 files changed, 19 insertions(+), 2 deletions(-)
>

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar


> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 5c27bac772ea4..8a4ca2bd1584d 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -318,6 +318,20 @@ static int call_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad,
>                sd->ops->pad->get_mbus_config(sd, pad, config);
>  }
>
> +static int call_s_stream(struct v4l2_subdev *sd, int enable)
> +{
> +       int ret;
> +
> +       ret = sd->ops->video->s_stream(sd, enable);
> +
> +       if (!enable && ret < 0) {
> +               dev_warn(sd->dev, "disabling streaming failed (%d)\n", ret);
> +               return 0;
> +       }
> +
> +       return ret;
> +}
> +
>  #ifdef CONFIG_MEDIA_CONTROLLER
>  /*
>   * Create state-management wrapper for pad ops dealing with subdev state. The
> @@ -377,6 +391,7 @@ static const struct v4l2_subdev_pad_ops v4l2_subdev_call_pad_wrappers = {
>  static const struct v4l2_subdev_video_ops v4l2_subdev_call_video_wrappers = {
>         .g_frame_interval       = call_g_frame_interval,
>         .s_frame_interval       = call_s_frame_interval,
> +       .s_stream               = call_s_stream,
>  };
>
>  const struct v4l2_subdev_ops v4l2_subdev_call_wrappers = {
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 54566d139da79..b15fa9930f30c 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -440,8 +440,10 @@ enum v4l2_subdev_pre_streamon_flags {
>   * @g_input_status: get input status. Same as the status field in the
>   *     &struct v4l2_input
>   *
> - * @s_stream: used to notify the driver that a video stream will start or has
> - *     stopped.
> + * @s_stream: start (enabled == 1) or stop (enabled == 0) streaming on the
> + *     sub-device. Failure on stop will remove any resources acquired in
> + *     streaming start, while the error code is still returned by the driver.
> + *     Also see call_s_stream wrapper in v4l2-subdev.c.
>   *
>   * @g_pixelaspect: callback to return the pixelaspect ratio.
>   *
> --
> 2.30.2
>
