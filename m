Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04360697807
	for <lists+linux-media@lfdr.de>; Wed, 15 Feb 2023 09:20:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233105AbjBOIT5 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 15 Feb 2023 03:19:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233875AbjBOITz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Feb 2023 03:19:55 -0500
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96F8A36465;
        Wed, 15 Feb 2023 00:19:31 -0800 (PST)
Received: by mail-qt1-f171.google.com with SMTP id b21so1503896qtr.13;
        Wed, 15 Feb 2023 00:19:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WeElug1VuqdGIoDpcyvlcxBHL2uahehKVaMCIiqLvYw=;
        b=N2VzjDDZAm6I3z5YpXKS5ETuZxqP+Y+4KZXgfxotXYGn/qOIYWQBZGUDJRBUs33rFC
         Zmn4WC3mCYC6I+0y9NNSaW291wi/t1ellgkSunec4b8t5bCIqM9cfM+y1u9ryc/CT8cf
         9SB7vJRJwXgDiAmSLeMaaOnZVYs1Ff9OH1DyNg0tu9gWHYk3fpxjG59mUTpo8CCZq6mp
         tHHKwvs1LnoT8FOBC1ZtoAzh1b5Bl8fHDRmZfybfnrNxp/jz8UjzjzdnbbZCybwfgoks
         ZalcwJzDTB0XcDwahtd1I2Sf2GAH/N2m5LDuAw8D60Ssv4U8TXMfrRHAxQjob8wi+TZu
         zlyQ==
X-Gm-Message-State: AO0yUKUaWHg7DWf4fPKXhU31jQa3J/OXtmXvJRW4jUgSA0Ms1796reoL
        h2O/vDTQmwbFANvT+yGzIwa9VKnVt6V533mI
X-Google-Smtp-Source: AK7set8XJHbm9KqJbxh1QmcVI1C4s0KZOC1rw02p/APnUH/klE8wZhmI5N3xVn5101zaW+3CXAjxSw==
X-Received: by 2002:ac8:5a86:0:b0:3b7:faaf:f6da with SMTP id c6-20020ac85a86000000b003b7faaff6damr1950232qtc.50.1676449170515;
        Wed, 15 Feb 2023 00:19:30 -0800 (PST)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id c29-20020ac8009d000000b003afbf704c7csm12583274qtg.24.2023.02.15.00.19.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Feb 2023 00:19:30 -0800 (PST)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-530b85f118cso24347667b3.9;
        Wed, 15 Feb 2023 00:19:30 -0800 (PST)
X-Received: by 2002:a5b:491:0:b0:86e:1225:b335 with SMTP id
 n17-20020a5b0491000000b0086e1225b335mr189096ybp.455.1676449169852; Wed, 15
 Feb 2023 00:19:29 -0800 (PST)
MIME-Version: 1.0
References: <20230211144147.3812388-1-niklas.soderlund+renesas@ragnatech.se> <20230211144147.3812388-4-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20230211144147.3812388-4-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 15 Feb 2023 09:19:18 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWe5SzrdpB9-oTVCVaiu1yD=3L4i_eZPZngJMEEoZ+EXA@mail.gmail.com>
Message-ID: <CAMuHMdWe5SzrdpB9-oTVCVaiu1yD=3L4i_eZPZngJMEEoZ+EXA@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: dt-bindings: media: renesas,vin: Add binding
 for V4H
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Sat, Feb 11, 2023 at 3:43 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Document support for the VIN module in the Renesas V4H (r8a779g0) SoC.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/media/renesas,vin.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,vin.yaml
> @@ -53,6 +53,7 @@ properties:
>                - renesas,vin-r8a77990 # R-Car E3
>                - renesas,vin-r8a77995 # R-Car D3
>                - renesas,vin-r8a779a0 # R-Car V3U
> +              - renesas,vin-r8a779g0 # R-Car V4U

V4H

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
