Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C53CD635A17
	for <lists+linux-media@lfdr.de>; Wed, 23 Nov 2022 11:35:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236515AbiKWKci (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Nov 2022 05:32:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237438AbiKWKcH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Nov 2022 05:32:07 -0500
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A42EE76148
        for <linux-media@vger.kernel.org>; Wed, 23 Nov 2022 02:17:18 -0800 (PST)
Received: by mail-io1-xd30.google.com with SMTP id h206so12809954iof.10
        for <linux-media@vger.kernel.org>; Wed, 23 Nov 2022 02:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pE4jefoK88caWgJE3FlqfQDohkwiNL5AcLn3R4S0Fjw=;
        b=hFIhr/llcbKXJu/dQq+/Vyh779/CttNN13gBRpscJgOoniJKItq+Kx2v4m2FrMI+Ps
         GjpBCHuWZfV+zRtFxPEf42DbkNIwoOEA9IDYOvDXSSZEWcPcwsc/AX7L4Vid/iSQDKTA
         PcJbXfZ0qL/3ts4zJxjfzGM+WZutMuao2uVL/BfnjIIzzcGWX2VOCA7XTGwHGtBeiQCh
         6DIBxixehebSkvF4wTgv6BJ7zpEV2c5b3CsXtPH1mI21o3lRWu3PJXduuk5V1GPqQ2FP
         x+JVWCz8t1ULcNWgmBm2Hi0sWNMdrC30h+RFT2QJIQZNYovbA7jz8YwtCSIKBaSmSI5i
         FO7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pE4jefoK88caWgJE3FlqfQDohkwiNL5AcLn3R4S0Fjw=;
        b=5Wk4T5N3e8CZZFItTWNdwGCyr2CYA2TEsydPOS82g3GXJeJh/YYDpo1HdvUAbU+YCa
         YLOcWO9jrTdK9pPIYyS+BaydRdfbR9H7Md+OmxeregOmytO7Im/kphllmuRa2vPF3YfT
         cPLWjop+53FXTWNiFUf4qvMBiZ9QjvmczhqXnWJZkY8RyIIrmcDyMn0Whdem4bhr7IdU
         4b/gX+q8pxc9cKNUko7vBY7e6JU7roBeQk7WU3GNv+qrc7WiYvKs+v2dB2FDYgcpJ+hn
         zTaiC5jRV8QYxScdZHlN4vVc74EFjnzNexZ+/45AmHS46sf1y5w4pR4CkBpwFMDPT3Lk
         ByBg==
X-Gm-Message-State: ANoB5plNNzBBDr0eOol9ZvAxgV2vOmugAAGFWwMvSol7o7NEhL6+3tra
        v2kjxPXCcN1hX2fccZKmZ8CmaBGpRWNbmJzkzDni/wG7JFifPw==
X-Google-Smtp-Source: AA0mqf65F8h5MOEj3qarYZ1GS1qBwYRyo5w7wBA334hv6l41JLTez+SapVfEo4LxAZCCPUwKvUdP06dGhNvJG/dgWs4=
X-Received: by 2002:a02:a695:0:b0:376:2353:5805 with SMTP id
 j21-20020a02a695000000b0037623535805mr12809865jam.4.1669198635065; Wed, 23
 Nov 2022 02:17:15 -0800 (PST)
MIME-Version: 1.0
References: <20221122223250.21233-1-laurent.pinchart@ideasonboard.com> <20221122223250.21233-15-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20221122223250.21233-15-laurent.pinchart@ideasonboard.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Wed, 23 Nov 2022 10:16:58 +0000
Message-ID: <CAPY8ntD+82HitFj7G9QTbwx4dNFf59adqhn6q2-mKAdTwc-iQA@mail.gmail.com>
Subject: Re: [PATCH v1 14/15] media: i2c: imx290: Configure data lanes at
 start time
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Tue, 22 Nov 2022 at 22:34, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> There's no need to configure the data lanes in the runtime PM resume
> handler. Do so in imx290_start_streaming() instead.

Interesting as I had Sakari advocating putting clock mode selection
register control in "power on" for my recent ov9282 series. Is there
any consistency?

  Dave

https://patchwork.linuxtv.org/project/linux-media/patch/20221005152809.3785786-9-dave.stevenson@raspberrypi.com/#141118

> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/i2c/imx290.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index dbed703fa199..4dfa090f918d 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -753,6 +753,9 @@ static int imx290_start_streaming(struct imx290 *imx290,
>                 return ret;
>         }
>
> +       /* Set data lane count */
> +       imx290_set_data_lanes(imx290);
> +
>         /* Apply the register values related to current frame format */
>         format = v4l2_subdev_get_pad_format(&imx290->sd, state, 0);
>         ret = imx290_setup_format(imx290, format);
> @@ -1052,9 +1055,6 @@ static int imx290_power_on(struct device *dev)
>         gpiod_set_value_cansleep(imx290->rst_gpio, 0);
>         usleep_range(30000, 31000);
>
> -       /* Set data lane count */
> -       imx290_set_data_lanes(imx290);
> -
>         return 0;
>  }
>
> --
> Regards,
>
> Laurent Pinchart
>
