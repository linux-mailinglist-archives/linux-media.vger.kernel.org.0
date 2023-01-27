Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2892667DCB5
	for <lists+linux-media@lfdr.de>; Fri, 27 Jan 2023 04:34:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230484AbjA0DeZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 22:34:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229701AbjA0DeY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 22:34:24 -0500
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C515B5E519
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 19:34:20 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id 78so2433453pgb.8
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 19:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ScHdCcQ34S3CY0xZWKptZRsbBURiNvsLeIbl7ILeAoA=;
        b=AzqGmfcmjW9aEh66WgT4xxIEmDXGfHQES2co78pa4ZXEz7hWhuOZ8p8I8d270fcNMO
         vMvYbxjDVbuALsuAQojSWRoBkKcgKtAKM2tCeAvKQiIMlkFNPHmggwn0+rxwuJEGKKSw
         JtBbiurk4EkU2ASS0TwFqIXNekN6LP6UNpZSE0dE+3P7kPrju6h2K7GXr1xy2UlHbjRI
         OBSK26atJFGwDP6n+Wo09NgRaRb6Gowh9wHbPuLMMOlcODBC5+pXq1M/yDiA/5E7TWez
         EL3asL/oDKQW+SQkV6tEoWltzo8ucaaamfF6jFOcr8BN6K+HVLENiACj3RioLBemfJdr
         6gfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ScHdCcQ34S3CY0xZWKptZRsbBURiNvsLeIbl7ILeAoA=;
        b=SN+fAbRJ1LljMaxBA11KeUnl0meaH0LjSahostwDrlOyRpRjX39AbYgdnQUFBfSyd6
         ozGEqtkz6v6xGJt5IKsxoCgHy5N4L/ePNt0J9nJl6SiVy+DU/Bi7HkPZBRuwKlLxAaLo
         2zxM0cRLgOhZrvz44pP95cyiNlxNrx+50PQakBHndI6eWPNo9Qfl7zkxfw8OmjNjfJEv
         mGFcv/RYX7NVeHqdHMjIc247lJL3KztT2cEQ9O6mIZU39b1jT+D9/KHM0+jThaQkc8O6
         Z4tDf3s4Hfv7qoC8dKiGtnK7MCAVZu5889NRJIsJ++DsztfPrOvDhHP+JSP3X39RQ+7e
         7J1w==
X-Gm-Message-State: AO0yUKXJ8cvMXr11SUCvi6PgSlFGVrUr5UA0ylgizCdCwhdd6UEYQyWU
        xp98IVTsW1svLmUv16MNfBPhn07LwG9FFA6mjbTeRUgX5oc=
X-Google-Smtp-Source: AK7set8ngAybzyjQthUESKjuGECmHCTe5kfCqKYQqkAXiLWPdOYI8QNC83L0P9OlCs9ta/mwHF5pfyyVz68AMnORPwo=
X-Received: by 2002:a62:8e0a:0:b0:592:a8af:4ffc with SMTP id
 k10-20020a628e0a000000b00592a8af4ffcmr30436pfe.52.1674790460047; Thu, 26 Jan
 2023 19:34:20 -0800 (PST)
MIME-Version: 1.0
References: <20230126213437.20796-1-laurent.pinchart@ideasonboard.com> <20230126213437.20796-2-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20230126213437.20796-2-laurent.pinchart@ideasonboard.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Thu, 26 Jan 2023 21:34:08 -0600
Message-ID: <CAHCN7x+au0=HVeDDaTf+Lsgk7W49W-pkh1fZSphDnL3H2cYkVA@mail.gmail.com>
Subject: Re: [PATCH v1 1/5] media: imx-mipi-csis: Rename error labels with
 'err_' prefix
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        kernel@pengutronix.de, linux-imx@nxp.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jan 26, 2023 at 3:34 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> It is customary to prefix error labels with 'err_' to make their purpose
> clearer. Do so in the probe function.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---

I tested this series on the imx8mm, but I get an error stating the
capture format is invalid.

My media info looks like:

Media device information
------------------------
driver          imx7-csi
model           imx-media
serial
bus info        platform:32e20000.csi
hw revision     0x0
driver version  6.2.0

Device topology
- entity 1: csi (2 pads, 2 links)
            type V4L2 subdev subtype Unknown flags 0
            device node name /dev/v4l-subdev0
pad0: Sink
[fmt:UYVY8_1X16/640x480 field:none colorspace:srgb xfer:srgb ycbcr:601
quantization:lim-range]
<- "csis-32e30000.mipi-csi":1 [ENABLED,IMMUTABLE]
pad1: Source
[fmt:UYVY8_1X16/640x480 field:none colorspace:srgb xfer:srgb ycbcr:601
quantization:lim-range]
-> "csi capture":0 [ENABLED,IMMUTABLE]

- entity 4: csi capture (1 pad, 1 link)
            type Node subtype V4L flags 0
            device node name /dev/video0
pad0: Sink
<- "csi":1 [ENABLED,IMMUTABLE]

- entity 10: csis-32e30000.mipi-csi (2 pads, 2 links)
             type V4L2 subdev subtype Unknown flags 0
             device node name /dev/v4l-subdev1
pad0: Sink
[fmt:UYVY8_1X16/640x480 field:none]
<- "ov5640 1-003c":0 [ENABLED]
pad1: Source
[fmt:UYVY8_1X16/640x480 field:none]
-> "csi":0 [ENABLED,IMMUTABLE]

- entity 15: ov5640 1-003c (1 pad, 1 link)
             type V4L2 subdev subtype Sensor flags 0
             device node name /dev/v4l-subdev2
pad0: Source
[fmt:UYVY8_1X16/640x480@1/30 field:none colorspace:srgb xfer:srgb
ycbcr:601 quantization:full-range
crop.bounds:(0,0)/2624x1964
crop:(16,14)/2592x1944]
-> "csis-32e30000.mipi-csi":0 [ENABLED]

From what I can see, each node is configured for UYVY8_1X16/640x480

Yet, the following occurs:

gst-launch-1.0 v4l2src ! video/x-raw,format=UYVY,width=640,height=480 ! fakesink
Setting pipeline to PAUSED ...
Pipeline is live and does not[  335.986728] imx7-csi 32e20000.csi:
capture format not valid
 need PREROLL ...
Pipeline is PREROLLED ...
Setting pipeline to PLAYING ...
New clock: GstSystemClock
ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0: Failed
to allocate required memory.
Additional debug info:
../git/sys/v4l2/gstv4l2src.c(659): gst_v4l2src_decide_allocation ():
/GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
Buffer pool activation failed
Execution ended after 0:00:00.009848500
Setting pipeline to NULL ...
ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
Internal data stream error.
Additional debug info:
../git/libs/gst/base/gstbasesrc.c(3127): gst_base_src_loop ():
/GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
streaming stopped, reason not-negotiated (-4)
Freeing pipeline ...
root@beacon-imx8mm-kit:~#


I'm going to unroll this series to see if the mini can capture, and
I'll report back my findings.

adam


>  drivers/media/platform/nxp/imx-mipi-csis.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index 905072871ed2..d949b2de8e74 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -1496,20 +1496,20 @@ static int mipi_csis_probe(struct platform_device *pdev)
>                                dev_name(dev), csis);
>         if (ret) {
>                 dev_err(dev, "Interrupt request failed\n");
> -               goto disable_clock;
> +               goto err_disable_clock;
>         }
>
>         /* Initialize and register the subdev. */
>         ret = mipi_csis_subdev_init(csis);
>         if (ret < 0)
> -               goto disable_clock;
> +               goto err_disable_clock;
>
>         platform_set_drvdata(pdev, &csis->sd);
>
>         ret = mipi_csis_async_register(csis);
>         if (ret < 0) {
>                 dev_err(dev, "async register failed: %d\n", ret);
> -               goto cleanup;
> +               goto err_cleanup;
>         }
>
>         /* Initialize debugfs. */
> @@ -1520,7 +1520,7 @@ static int mipi_csis_probe(struct platform_device *pdev)
>         if (!pm_runtime_enabled(dev)) {
>                 ret = mipi_csis_runtime_resume(dev);
>                 if (ret < 0)
> -                       goto unregister_all;
> +                       goto err_unregister_all;
>         }
>
>         dev_info(dev, "lanes: %d, freq: %u\n",
> @@ -1528,14 +1528,14 @@ static int mipi_csis_probe(struct platform_device *pdev)
>
>         return 0;
>
> -unregister_all:
> +err_unregister_all:
>         mipi_csis_debugfs_exit(csis);
> -cleanup:
> +err_cleanup:
>         media_entity_cleanup(&csis->sd.entity);
>         v4l2_async_nf_unregister(&csis->notifier);
>         v4l2_async_nf_cleanup(&csis->notifier);
>         v4l2_async_unregister_subdev(&csis->sd);
> -disable_clock:
> +err_disable_clock:
>         mipi_csis_clk_disable(csis);
>         fwnode_handle_put(csis->sd.fwnode);
>         mutex_destroy(&csis->lock);
> --
> Regards,
>
> Laurent Pinchart
>
