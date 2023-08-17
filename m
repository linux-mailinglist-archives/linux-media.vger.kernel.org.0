Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE6AC77F4A5
	for <lists+linux-media@lfdr.de>; Thu, 17 Aug 2023 13:01:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350100AbjHQLBA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Aug 2023 07:01:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350099AbjHQLA2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Aug 2023 07:00:28 -0400
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com [IPv6:2607:f8b0:4864:20::932])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B05DF2D71
        for <linux-media@vger.kernel.org>; Thu, 17 Aug 2023 04:00:26 -0700 (PDT)
Received: by mail-ua1-x932.google.com with SMTP id a1e0cc1a2514c-78a5384a5daso1772078241.0
        for <linux-media@vger.kernel.org>; Thu, 17 Aug 2023 04:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1692270026; x=1692874826;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kwxRHm5oBmJyMH69Edk0zV28C6k57YujgbMy28eNP2U=;
        b=O12EsVnQBT0CihOHfmWtnzIZjqvTuLaANHmfEyKc0Ca63PZWlA6TmjaTb1X71Qxe64
         ss+kO3nLGiLltQgZXQnK2r1ZZ6UZplsVtqAmkqz9CpSoBlvysi04/AadxMvVpdTfTpk1
         cuKsp5YpKQmDNv6N79OSPpvQ03LcujUJbliHsyqaSOPloowWlISyV0+hejMho7nNZCui
         5SMLR9eYx4zkqwW71zZIR3agLDQJl+LM4EBR/+nRZkh+Do6w2K502YYHd1fU4DLWT7vD
         sTlIUUk+RO5F2SLv2yh/meo+gllVggAxDyOQK7ZCV9r9TXXYEHyptJ7Ur6vpZwwvETPp
         twTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692270026; x=1692874826;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kwxRHm5oBmJyMH69Edk0zV28C6k57YujgbMy28eNP2U=;
        b=JEqaaRya9DcGEQ81yVaskj0Dm1PoGZT1Dm4OGInskPfepqmk9NfFlHvkmmyNN/uTap
         4hNmW0ZEJiLMslciGoJkROC78IZqYvSwlHTUQ9+fsxHsnGXSsaqU65fZswmFhYqYAt/L
         VuhBjXgqMQqarW1Fh7dNPF9hNfJHH28grRAchoMQQ69bqhzxoYy3Mpg9zkZWIy0o1zd/
         lU/GNqFQwZNxRcA+kgM5+CyIFgRYDcIyKL5NeKBiqhageOMa7CY990UAAubL0HPTKLyK
         VJfp7mmGloPwwqrxEqB7kfdU+Of+zXESkrSc1Zjib06c9zLDFm4izyB/k4cwiF+g3hiF
         7iTw==
X-Gm-Message-State: AOJu0Ywr9rc/1Gf5NtmUHxVDB4KzGb8CZEvzjJWKg4/PT1VLIxUC29g0
        +c+wpFyNoi5fs3ejcMeMTKvyiYEk00MapFlyrXEo7w==
X-Google-Smtp-Source: AGHT+IFm7IaVvhvsDqFCsxbP07cxREjvYuSkUnXfhBKp62LxRe/H6vRn9FUdgwxw8ttMTf4bG/yzkqTzKpGxTgkj87A=
X-Received: by 2002:a1f:5f43:0:b0:488:1eb4:1cdb with SMTP id
 t64-20020a1f5f43000000b004881eb41cdbmr3189167vkb.15.1692270025763; Thu, 17
 Aug 2023 04:00:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230815182431.18409-1-laurent.pinchart@ideasonboard.com> <20230815182431.18409-8-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20230815182431.18409-8-laurent.pinchart@ideasonboard.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Thu, 17 Aug 2023 12:00:10 +0100
Message-ID: <CAPY8ntBe59BfjcoedoVCC0X8-75wo8+RXnpZZS_Z0-6w70_aBQ@mail.gmail.com>
Subject: Re: [PATCH v1 07/12] media: i2c: imx219: Initialize ycbcr_enc
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

Hi  Laurent

Thanks for the patch

On Tue, 15 Aug 2023 at 19:24, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> While the ycbcr_enc field doesn't apply to raw formats, leaving it
> uninitialized makes the driver behave in a less deterministic way. Fix
> it by picking the default value for the colorspace.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/i2c/imx219.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 8c61b748d9a5..976014ed7711 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -499,6 +499,7 @@ static void imx219_update_pad_format(struct imx219 *imx219,
>         fmt->height = mode->height;
>         fmt->field = V4L2_FIELD_NONE;
>         fmt->colorspace = V4L2_COLORSPACE_RAW;
> +       fmt->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(fmt->colorspace);
>         fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
>         fmt->xfer_func = V4L2_XFER_FUNC_NONE;

In [1] for imx290 you requested that I change from using the
V4L2_MAP_xxx_DEFAULT macros to hardcode them, and now you're mixing
and matching the two in the same driver.
Could we have some consistency please? Personally I don't mind which
is used, but mixing and matching within a driver feels wrong.
(If there is a genuine desire for V4L2_MAP_xxx_DEFAULT or hardcoding
in sensor drivers, it'd be nice if it was documented to avoid
additional review cycles).

Also just noting that you seem not to be using get_maintainers for
your patches as I appear not to have been included.

  Dave

[1] https://patchwork.linuxtv.org/project/linux-media/patch/20230131192016.3476937-3-dave.stevenson@raspberrypi.com/#144299

>  }
> --
> Regards,
>
> Laurent Pinchart
>
