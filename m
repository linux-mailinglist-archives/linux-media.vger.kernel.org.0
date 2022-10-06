Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1419C5F6AFF
	for <lists+linux-media@lfdr.de>; Thu,  6 Oct 2022 17:48:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231295AbiJFPs4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Oct 2022 11:48:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231210AbiJFPsy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Oct 2022 11:48:54 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8729942E5B
        for <linux-media@vger.kernel.org>; Thu,  6 Oct 2022 08:48:53 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id kg6so5462318ejc.9
        for <linux-media@vger.kernel.org>; Thu, 06 Oct 2022 08:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Jt9m/wqrRUrFocWAzd+EYnayY6l8IYc4bi3b/R/Hg0M=;
        b=UCXCoaWj4aG5G7uAWHY0trGfuCTVf84T8ifO+Kanoq3qpJ0zCt2HeKo9/wZfdp8sMh
         0xEOxK5rsuAwgd3FNUoxQw8NK4hAF0qORm+YU4RqSkW0hnI+EDToOUEE539QUprCXX5q
         cZaOyXReHboEMdo2NKhVOmJy543zdOx5eXyIA6GAQpm99PiBh7mGp2poyZgXGjWMLepS
         W4buP+I9SjhuXSviOD7TQg2Ck/w7PUR6sCHKURVlj+WKpgvjgd4HmY+HifmN1mn8VOT+
         5kIo/RSD+FC1J1vEjKq/zJWuMDq18Q98515YLz7QG53MhtzZ3hEtKK0eC6fksiMlbh2w
         Gc+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jt9m/wqrRUrFocWAzd+EYnayY6l8IYc4bi3b/R/Hg0M=;
        b=Wa1dxLTzPN43qkMVgbXL4nlxzQxQHhF4tKuQWSiKi2EDLXWV5LpzaQT0LupSwpWIQZ
         4yCD/eJvpUz/vVxCkFQ9aH8tdEzSG1Pt/12bEdEGJT1uYmo+WJcDwTJEeU75vV2BfNNE
         kgTPGGWxq6lPRxCqlLWqGVpk3ZquVLUOGcipMt7QqYDKBWsZFTbMcGCRIJ/mAYG3+NTE
         9gQEa2Dkt9lQxPGdQWaD2O8v0W2nJEZyeEk8P1EpUJpSj9bcek90yTC3GLBxkYEpK3dL
         x1og2vX+Kd5yAN7V0M+EQjTyoKoYMLDM8zsiFwFdw60V4Zs5WHn64iSGYyYaLvbF0nKb
         gEuw==
X-Gm-Message-State: ACrzQf2xnsxiLgD3cjVvupt8gRRGEE5C/7nL2WSru55ungQ610ui5Vnj
        6J0NljIQStQDXwuYElEnThrCnAiZAeInydEGZk4ftg==
X-Google-Smtp-Source: AMsMyM52Ot8WHX5J27ttfnseVZiou8fC6Oyp/hs2Jhun1eRyykqiUU+AlRVwX0xQGLZKw973oBy517kGqo89kS0YcQ0=
X-Received: by 2002:a17:907:3e0b:b0:78d:4b7c:89bd with SMTP id
 hp11-20020a1709073e0b00b0078d4b7c89bdmr387928ejc.742.1665071331867; Thu, 06
 Oct 2022 08:48:51 -0700 (PDT)
MIME-Version: 1.0
References: <20221005190613.394277-1-jacopo@jmondi.org> <20221005190613.394277-11-jacopo@jmondi.org>
In-Reply-To: <20221005190613.394277-11-jacopo@jmondi.org>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Thu, 6 Oct 2022 16:48:35 +0100
Message-ID: <CAPY8ntCXYmZE396A6dqDEj3EVA+sXXY7fjeYwyXz_0CTtiPuHg@mail.gmail.com>
Subject: Re: [PATCH 10/10] media: ar0521: Tab-align definitions
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     =?UTF-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 5 Oct 2022 at 20:07, Jacopo Mondi <jacopo@jmondi.org> wrote:
>
> Align some register and constant definitions using tab in place of
> mixed tab+spaces.
>
> Cosmetic change only.
>
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/media/i2c/ar0521.c | 30 +++++++++++++++---------------
>  1 file changed, 15 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
> index 670fa33acc6f..4373693fa3e9 100644
> --- a/drivers/media/i2c/ar0521.c
> +++ b/drivers/media/i2c/ar0521.c
> @@ -16,17 +16,17 @@
>  #include <media/v4l2-subdev.h>
>
>  /* External clock (extclk) frequencies */
> -#define AR0521_EXTCLK_MIN        (10 * 1000 * 1000)
> -#define AR0521_EXTCLK_MAX        (48 * 1000 * 1000)
> +#define AR0521_EXTCLK_MIN              (10 * 1000 * 1000)
> +#define AR0521_EXTCLK_MAX              (48 * 1000 * 1000)
>
>  /* PLL and PLL2 */
> -#define AR0521_PLL_MIN          (320 * 1000 * 1000)
> -#define AR0521_PLL_MAX         (1280 * 1000 * 1000)
> +#define AR0521_PLL_MIN                 (320 * 1000 * 1000)
> +#define AR0521_PLL_MAX                 (1280 * 1000 * 1000)
>
>  /* Effective pixel sample rate on the pixel array. */
> -#define AR0521_PIXEL_CLOCK_RATE         (207 * 1000 * 1000)
> -#define AR0521_PIXEL_CLOCK_MIN  (168 * 1000 * 1000)
> -#define AR0521_PIXEL_CLOCK_MAX  (414 * 1000 * 1000)
> +#define AR0521_PIXEL_CLOCK_RATE                (207 * 1000 * 1000)
> +#define AR0521_PIXEL_CLOCK_MIN         (168 * 1000 * 1000)
> +#define AR0521_PIXEL_CLOCK_MAX         (414 * 1000 * 1000)
>
>  #define AR0521_NATIVE_WIDTH            2604u
>  #define AR0521_NATIVE_HEIGHT           1964u
> @@ -35,15 +35,15 @@
>  #define AR0521_MAX_X_ADDR_END          2603u
>  #define AR0521_MAX_Y_ADDR_END          1963u
>
> -#define AR0521_WIDTH_MIN              8u
> -#define AR0521_WIDTH_MAX           2592u
> -#define AR0521_HEIGHT_MIN             8u
> -#define AR0521_HEIGHT_MAX          1944u
> +#define AR0521_WIDTH_MIN               8u
> +#define AR0521_WIDTH_MAX               2592u
> +#define AR0521_HEIGHT_MIN              8u
> +#define AR0521_HEIGHT_MAX              1944u
>
> -#define AR0521_WIDTH_BLANKING_MIN     572u
> -#define AR0521_HEIGHT_BLANKING_MIN     38u /* must be even */
> -#define AR0521_TOTAL_HEIGHT_MAX      2464u /* max value of y_addr_end reg */
> -#define AR0521_TOTAL_WIDTH_MAX       3280u /* max value of x_addr_end reg */
> +#define AR0521_WIDTH_BLANKING_MIN      572u
> +#define AR0521_HEIGHT_BLANKING_MIN     38u /* must be even */
> +#define AR0521_TOTAL_HEIGHT_MAX                2464u /* max value of y_addr_end reg */
> +#define AR0521_TOTAL_WIDTH_MAX         3280u /* max value of x_addr_end reg */
>
>  #define AR0521_ANA_GAIN_MIN            0x00
>  #define AR0521_ANA_GAIN_MAX            0x3f
> --
> 2.37.3
>
