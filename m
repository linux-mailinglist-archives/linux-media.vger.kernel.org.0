Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F25650B9AA
	for <lists+linux-media@lfdr.de>; Fri, 22 Apr 2022 16:10:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1448481AbiDVONN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Apr 2022 10:13:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1448458AbiDVONI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Apr 2022 10:13:08 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 639D157147
        for <linux-media@vger.kernel.org>; Fri, 22 Apr 2022 07:10:14 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id q19so7425574pgm.6
        for <linux-media@vger.kernel.org>; Fri, 22 Apr 2022 07:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=F0TT7ezGoZZo+t6OFKwY266SJSBxrtPPCzaHHDo/0pU=;
        b=ynwSIHlaxlmkoXMaKxwExq0Cq1aelWRfdNTUJpU9xhzv1S2IUUme/05UUhmDksoEjP
         p0fq60YpS/4Ggo90oSHho/XCw5EB5QYY3yzXoA26RCRU49oGTGXjlFAUoAL2BxBcFXiS
         noOcAqACVANt9OEHV++bYfc34Gwl51/rMrTPMlWzPHYu5sVXMJZf660yKNHVP9zxtCDy
         8Oo4Jss1ScMHEKALFKXbYvaNiUh+aLgW7M/ntZaOVHmDbw4Q1WQTNuH0wc92aFARoS9O
         Z0F1/L53YhWzKUak35i9wKPHy2vPR/Ky660JFYgJH15yKfhmmGErkVpG2N1ihjP52hZr
         UObg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F0TT7ezGoZZo+t6OFKwY266SJSBxrtPPCzaHHDo/0pU=;
        b=pn4eDqzmmUmuEi3/Edg7c6rA2USWyml1pUoXKH0GiofajoLyr5UPQ3RyjB2ppMP1nB
         0vvt5jjT0jRBmpho9rHa11EgQW+H82tmd9yZ8+QPkUodq3YbYjABzg0OYzKC6TaJ/A6G
         X+pWRGT4j1e04kYb1BnyctoR0gfR+Ufb1RfeIwxqvAoNf3RG2r4ehmPvfjqfTtpyBNlN
         SdrAA5vqFHLhzjNFlLDbvFP26kb1lY/DyLB0r5o7Eyr8CHqNbn5BUF5fA8nIFRSvP/JY
         esf964pUQkyYd018a/LUcfiowtCKWgQreUSRU6emwCPHwiMgm9LlJM8ms7ONBWh8/9jZ
         XAlQ==
X-Gm-Message-State: AOAM532pb00/r//akWQjEtNDGLS4cOqv7HXMVcIk3dTm7ulHs0A9Sve3
        dQduHtWxY0vBIU+Pim/wwuMj9M4hQREsEi4KAZAZbQ==
X-Google-Smtp-Source: ABdhPJz5MaHUW1s7cRbnJmQ5pqHSw7AhjyzG/hrXU5U34mVFNZ2y0ueOXaNvHuiw9PLAM8c5oyOfAWIZ5PlcKH8OpOw=
X-Received: by 2002:a05:6a00:1747:b0:505:d75c:e0b2 with SMTP id
 j7-20020a056a00174700b00505d75ce0b2mr5304769pfc.0.1650636613896; Fri, 22 Apr
 2022 07:10:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220422084720.959271-1-xji@analogixsemi.com>
In-Reply-To: <20220422084720.959271-1-xji@analogixsemi.com>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Fri, 22 Apr 2022 16:10:03 +0200
Message-ID: <CAG3jFyuK95G4LDyHL2ChMB6MoJJPTrD04-AwjAeMdEM8C6+rrg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] media/v4l2-core: Add enum V4L2_FWNODE_BUS_TYPE_DPI
To:     Xin Ji <xji@analogixsemi.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        bliang@analogixsemi.com, qwen@analogixsemi.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 22 Apr 2022 at 10:48, Xin Ji <xji@analogixsemi.com> wrote:
>
> As V4L2_FWNODE_BUS_TYPE_PARALLEL is not used for DPI interface, this
> patch add V4L2_FWNODE_BUS_TYPE_DPI for video DPI interface.
>
> Signed-off-by: Xin Ji <xji@analogixsemi.com>
> ---
>  drivers/media/v4l2-core/v4l2-fwnode.c | 4 ++++
>  include/media/v4l2-fwnode.h           | 2 ++
>  include/media/v4l2-mediabus.h         | 2 ++
>  3 files changed, 8 insertions(+)
>
> diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
> index afceb35e500c..3d85a8600f57 100644
> --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> @@ -61,6 +61,10 @@ static const struct v4l2_fwnode_bus_conv {
>                 V4L2_FWNODE_BUS_TYPE_BT656,
>                 V4L2_MBUS_BT656,
>                 "Bt.656",
> +       }, {
> +               V4L2_FWNODE_BUS_TYPE_DPI,
> +               V4L2_MBUS_DPI,
> +               "DPI",
>         }
>  };
>
> diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
> index feb132df45a3..15e4ab672223 100644
> --- a/include/media/v4l2-fwnode.h
> +++ b/include/media/v4l2-fwnode.h
> @@ -173,6 +173,7 @@ struct v4l2_fwnode_connector {
>   * @V4L2_FWNODE_BUS_TYPE_CSI2_DPHY: MIPI CSI-2 bus, D-PHY physical layer
>   * @V4L2_FWNODE_BUS_TYPE_PARALLEL: Camera Parallel Interface bus
>   * @V4L2_FWNODE_BUS_TYPE_BT656: BT.656 video format bus-type
> + * @V4L2_FWNODE_BUS_TYPE_DPI: Video Parallel Interface bus
>   * @NR_OF_V4L2_FWNODE_BUS_TYPE: Number of bus-types
>   */
>  enum v4l2_fwnode_bus_type {
> @@ -183,6 +184,7 @@ enum v4l2_fwnode_bus_type {
>         V4L2_FWNODE_BUS_TYPE_CSI2_DPHY,
>         V4L2_FWNODE_BUS_TYPE_PARALLEL,
>         V4L2_FWNODE_BUS_TYPE_BT656,
> +       V4L2_FWNODE_BUS_TYPE_DPI,
>         NR_OF_V4L2_FWNODE_BUS_TYPE
>  };
>
> diff --git a/include/media/v4l2-mediabus.h b/include/media/v4l2-mediabus.h
> index e0db3bcff9ed..f67a74daf799 100644
> --- a/include/media/v4l2-mediabus.h
> +++ b/include/media/v4l2-mediabus.h
> @@ -129,6 +129,7 @@ struct v4l2_mbus_config_mipi_csi1 {
>   * @V4L2_MBUS_CCP2:    CCP2 (Compact Camera Port 2)
>   * @V4L2_MBUS_CSI2_DPHY: MIPI CSI-2 serial interface, with D-PHY
>   * @V4L2_MBUS_CSI2_CPHY: MIPI CSI-2 serial interface, with C-PHY
> + * @V4L2_MBUS_DPI:      MIPI VIDEO DPI interface
>   * @V4L2_MBUS_INVALID: invalid bus type (keep as last)
>   */
>  enum v4l2_mbus_type {
> @@ -139,6 +140,7 @@ enum v4l2_mbus_type {
>         V4L2_MBUS_CCP2,
>         V4L2_MBUS_CSI2_DPHY,
>         V4L2_MBUS_CSI2_CPHY,
> +       V4L2_MBUS_DPI,
>         V4L2_MBUS_INVALID,
>  };
>

I'm not seeing any issues with this patch (or the rest of the series),
so I'll add my r-b. But I would like to see another review by someone
more familiar with the media subsystem.

Reviewed-by: Robert Foss <robert.foss@linaro.org>
