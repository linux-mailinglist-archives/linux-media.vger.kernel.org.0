Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D29B8524EF2
	for <lists+linux-media@lfdr.de>; Thu, 12 May 2022 15:57:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354770AbiELN5I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 May 2022 09:57:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354793AbiELN5G (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 May 2022 09:57:06 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 367911C7649
        for <linux-media@vger.kernel.org>; Thu, 12 May 2022 06:57:04 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id l18so10397461ejc.7
        for <linux-media@vger.kernel.org>; Thu, 12 May 2022 06:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pWsDFWWil9EKmDKq6jLBpzdftwVkCdugui3i9OujR1g=;
        b=QW/HlnV9FIR9gd2dU8DoCau7fu3ylHOWDIt9qrOmAZT9bpfwLDPHbIg/Q1yvnlKepW
         Y3xKZ+/Z+GhbcyAdYl3U96bgSUYQMoosiHZYFKIoF23kST3tvMMZYs9/W9Cx3rOSEpgI
         P5IKB4K4RNAQYtw8hC0b+NulJ93baqBuuVtgVCtacgeBnhkiZHdftQgS2LsESeywlz7f
         qttZTT8GDrWcQl9TZiZjWNFEg+MvQjYl5UpsLv+P3e0oIKocWL24aAcUVSIJ/Y6Rk/mK
         4ERu8L2mba1Qz1kCL5sbinRDb/VIzKedxcVt8dWtF5cYNBbnmPegiLwUfqB3mXoIKtyW
         YYRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pWsDFWWil9EKmDKq6jLBpzdftwVkCdugui3i9OujR1g=;
        b=sVagjnYHCANbH/YfAjuXnPn+IkDMyiHmfdFQv7Ng9KvyMV1hydIN7rHVxkGC3C/l0v
         e2XhhJhrBsvKxYg4iDYIc6BR88oGUNDjeicDWCLtZ2KD2AGHEjezaJ+h9Rx2RuH1bS70
         1DFbO84N/bmaBLiOu0sUw1DZ7T8Tj/i1vSRDi2OAC6Uij+cVpy0FPH6SDbJM35gV3a8w
         R4a4+NNNlloPjCnP0dB/aXRDhhjFFAdXPU1OIwLR6rMr/OcUKeMfriKEzYXFucy1s///
         4IriF8fFrxe277EZAUX3JWyGhGgiSf6aBrhYdNW0SGCscnt/P0MIzbhz4mjG7jPNqJ0p
         236A==
X-Gm-Message-State: AOAM5333bOCfz0Wm82be6F5g1dPCspigyRpGRElGC4ADLmXvyPwMIgwV
        21Hsjv9n13g7Driyto/3t4w000wDw0JougAisspB3sdkQB74Lw==
X-Google-Smtp-Source: ABdhPJzgVDU4+biC24iWwf0z7RSAhfVAUdaqBSeV9anOf7rEyNn+4Oh5JQvXIZb5aYGwggcur9nXhlrFQrduF9VnAog=
X-Received: by 2002:a17:907:162a:b0:6f4:c53b:fca7 with SMTP id
 hb42-20020a170907162a00b006f4c53bfca7mr30770688ejc.723.1652363822740; Thu, 12
 May 2022 06:57:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220512120209.11614-1-info@benjaminmarty.ch>
In-Reply-To: <20220512120209.11614-1-info@benjaminmarty.ch>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Thu, 12 May 2022 14:56:45 +0100
Message-ID: <CAPY8ntD4miACVe9naYUyVAztZcDBK47chpJLy4=qqjmego1jvA@mail.gmail.com>
Subject: Re: [PATCH v2] media: i2c: adv7180: fix reserved bit in Video
 Selection 2
To:     Benjamin Marty <info@benjaminmarty.ch>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        "cc: Kieran Bingham" <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benjamin.

On Thu, 12 May 2022 at 13:11, Benjamin Marty <info@benjaminmarty.ch> wrote:
>
> This bit is marked as reserved in the ADV Hardware Reference Manual.
>
> Resetting this bit seems to cause increased video noise. Setting this
> bit according to the Hardware Reference Manual reduces the video noise
> immediately.
>
> Signed-off-by: Benjamin Marty <info@benjaminmarty.ch>
> ---
> version 2:
> - Fixed Kieran's remarks
>
>  drivers/media/i2c/adv7180.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
> index 4f5db195e66d..992111fe249e 100644
> --- a/drivers/media/i2c/adv7180.c
> +++ b/drivers/media/i2c/adv7180.c
> @@ -43,6 +43,7 @@
>  #define ADV7180_INPUT_CONTROL_INSEL_MASK               0x0f
>
>  #define ADV7182_REG_INPUT_VIDSEL                       0x0002
> +#define ADV7182_REG_INPUT_RESERVED                     BIT(2)

Responding to Kieran's comment on V1:
> If the bit is documented with a better name, then use that of course,
> otherwise perhaps even a comment in the code saying that failing to set
> the bit increases visible noise would be suitable. (or that setting the
> bit reduces noise, I guess it depends on if you think this bit is
> performing noise reduction, or if not setting it is introducing noise)

I went digging through the datasheet for this info as I care about
ADV728[0|1|2]M.

https://www.analog.com/media/en/technical-documentation/data-sheets/ADV7182.pdf
page 68 defines bits 0-3 as reserved, and "set to default" which is
0100b.
https://www.analog.com/media/en/technical-documentation/user-guides/ADV7280_7281_7282_7283_UG-637.pdf
page 70 says the same for ADV7280/ADV7281/ADV7282/ADV7283.

So no name or detail in the docs over what the bits do.

The patch does mean the driver more closely follows the datasheet, so
it looks good to me.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

I'll try to find a couple of minutes to get my hardware out and
confirm I see the change in video noise.

  Dave

>  #define ADV7180_REG_OUTPUT_CONTROL                     0x0003
>  #define ADV7180_REG_EXTENDED_OUTPUT_CONTROL            0x0004
> @@ -1014,7 +1015,9 @@ static int adv7182_init(struct adv7180_state *state)
>
>  static int adv7182_set_std(struct adv7180_state *state, unsigned int std)
>  {
> -       return adv7180_write(state, ADV7182_REG_INPUT_VIDSEL, std << 4);
> +       /* Failing to set the reserved bit can result in increased video noise */
> +       return adv7180_write(state, ADV7182_REG_INPUT_VIDSEL,
> +                            (std << 4) | ADV7182_REG_INPUT_RESERVED);
>  }
>
>  enum adv7182_input_type {
> --
> 2.36.1
>
