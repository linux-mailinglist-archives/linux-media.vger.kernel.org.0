Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4A6B78479D
	for <lists+linux-media@lfdr.de>; Tue, 22 Aug 2023 18:31:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237802AbjHVQbK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Aug 2023 12:31:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233468AbjHVQbJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Aug 2023 12:31:09 -0400
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com [IPv6:2607:f8b0:4864:20::92c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B4AA184
        for <linux-media@vger.kernel.org>; Tue, 22 Aug 2023 09:31:08 -0700 (PDT)
Received: by mail-ua1-x92c.google.com with SMTP id a1e0cc1a2514c-78f1210e27fso1403806241.1
        for <linux-media@vger.kernel.org>; Tue, 22 Aug 2023 09:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1692721867; x=1693326667;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iiEqaJutjUCLn6mTKLviugS3ZmukB2Y1PG4K728YcG0=;
        b=txZEeTJg158EjwRvfkEZRvuPwHrtQLGmQ5Qi4t3nYft+OwriwzUAZOpDVAbKB4gROc
         D69eaVgBrfgG6+yeWIKGkGwjkquSI63yw7QyNr5kJOaSZAAOAi2AfTk9jJ0lW1e46HWR
         7s2xJLlTxWVyvY38/jJvsUzK8u3jNzIWjUPH0sXdkla0R+Zh121hYlnI4xmJPko6TBwb
         f3XBFftD5l6ufq2oUX4LJpbu7/oBEd1ZQB5toBN+lFsH6Qqt8mdLgJyNMWAKIPaDoXwZ
         H/plWtFJTwKOQ/IJALocJRON4aMuPUJtlCqs1GZGWL5UqIg/hcFXbdaDzHaKtGpPzIpL
         iBkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692721867; x=1693326667;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iiEqaJutjUCLn6mTKLviugS3ZmukB2Y1PG4K728YcG0=;
        b=HKoLSHf+9F9875ffXh7HH726CrNf7djKq8LfH3MVBxfbZJpOjEu6JX1qYb+tH+Z9gT
         ijvebKnZ3KHWJOt6CCvIc/cE2See+AfK5b+/24BdGH/isZDH1Qr6COe9VzFPdlngIjoo
         h//GpxHvhbHjikVTuyJR01Z3Niunw4+WDhHV2tw/aRAR6t9XTrB7FX8Rc1A4wgHOzGy2
         GEJtCt2idWAm9i1hGw7Wf2Yuu9eEweN7vyQsLa/eFsUUJd3jNvHvSNM+O4+DrwpDNFUD
         Z6VJxv4hMkuWtMChJDy72sTlAZRVyp7pfT3TnT+gwqCv6xuNLCxp+IOUJxl2Hzk3v4sV
         ajAQ==
X-Gm-Message-State: AOJu0YyLcRJE+HlSqM6wy9sFB86GShrGn/ORvoo1dZEJAwu8HRl2tAir
        Vs4QzoNZt4HVq6dx37fu3oPbqSdM/eko/KL+FLqu9g==
X-Google-Smtp-Source: AGHT+IEcqFlvzw212KMZSY2E7z5Jogzq1aY7oQwNnqAkx/JyEjOox1Z67aqH8T8wTkvyZB40jZqiT0GnLIrDOrb+sjY=
X-Received: by 2002:a67:f044:0:b0:44d:54a9:bbec with SMTP id
 q4-20020a67f044000000b0044d54a9bbecmr4374553vsm.12.1692721867213; Tue, 22 Aug
 2023 09:31:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230821223001.28480-1-laurent.pinchart@ideasonboard.com> <20230821223001.28480-8-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20230821223001.28480-8-laurent.pinchart@ideasonboard.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 22 Aug 2023 17:30:50 +0100
Message-ID: <CAPY8ntCqcjp5oB74yOMoXv0rhM4RxdE37xNtd5gW28xYLjhfsQ@mail.gmail.com>
Subject: Re: [PATCH v2 07/18] media: i2c: imx219: Initialize ycbcr_enc
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 21 Aug 2023 at 23:30, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> While the ycbcr_enc field doesn't apply to raw formats, leaving it
> uninitialized makes the driver behave in a less deterministic way. Fix
> it by picking the default value for the colorspace.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
> Changes since v1:
>
> - Use V4L2_YCBCR_ENC_601
> ---
>  drivers/media/i2c/imx219.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 3a0b082d9ee0..16776a3ae84d 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -499,6 +499,7 @@ static void imx219_update_pad_format(struct imx219 *imx219,
>         fmt->height = mode->height;
>         fmt->field = V4L2_FIELD_NONE;
>         fmt->colorspace = V4L2_COLORSPACE_RAW;
> +       fmt->ycbcr_enc = V4L2_YCBCR_ENC_601;
>         fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
>         fmt->xfer_func = V4L2_XFER_FUNC_NONE;
>  }
> --
> Regards,
>
> Laurent Pinchart
>
