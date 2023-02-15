Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 367F66977D4
	for <lists+linux-media@lfdr.de>; Wed, 15 Feb 2023 09:14:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233848AbjBOIOa convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 15 Feb 2023 03:14:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230196AbjBOIO2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Feb 2023 03:14:28 -0500
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FBC19756;
        Wed, 15 Feb 2023 00:14:28 -0800 (PST)
Received: by mail-qt1-f181.google.com with SMTP id h24so20938650qta.12;
        Wed, 15 Feb 2023 00:14:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ika15XmSIQclkQiC0ooUDBg2L/lbbGPcfHimbLBmjo=;
        b=ZUUe3vw/JbbfZnZbJtFDYb905UZkZZDJJV0WhEA1tgfCgh2074TQ6T24cWsXKSnnFn
         1S5S+JsnMJ3+zs5QTlzsqw1UCqW11HGid/DdKfQvmKst4dNjwzXTR9i60AoPv1MS6v8/
         rcluft5brEI6b0ak1LmGaST5i6tIqTcygIjeZrAGxUqB7pXKoz9WSGS0I2GGdhqgPJaG
         RC1Sn7sy7SgaZoNRzjgMkr5/UULNd5gEfstRGK12h7fW85JbCLBmRoo83pZj8J4UThMM
         JNQAlnaRxZIW1NYBczcz71FoTHUfHrH6vovuNkruZQyiI8FqOZ2xfCnamGF/O3AY4FVh
         70gw==
X-Gm-Message-State: AO0yUKVsYFy2TS36PKv2eskY85qyQWRxK1P4pYlh+/3CLmevI0hTOfX2
        4EWTJOxxMkrZYDEOzxLd/hwOlcsxQaK5IuCS
X-Google-Smtp-Source: AK7set+VLxKPDpwJO7insiA3t3DfzK5PH389jB4ccqrYVFFillshu9aSI0tIW6vQftsDxwdBPAz9iw==
X-Received: by 2002:a05:622a:174d:b0:3ba:1398:c68d with SMTP id l13-20020a05622a174d00b003ba1398c68dmr1971136qtk.16.1676448867137;
        Wed, 15 Feb 2023 00:14:27 -0800 (PST)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id a7-20020ac86107000000b003ba11bfe4fcsm12788787qtm.28.2023.02.15.00.14.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Feb 2023 00:14:26 -0800 (PST)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-52ec329dc01so230157867b3.10;
        Wed, 15 Feb 2023 00:14:26 -0800 (PST)
X-Received: by 2002:a5b:d0:0:b0:921:783:f2f5 with SMTP id d16-20020a5b00d0000000b009210783f2f5mr122196ybp.574.1676448866459;
 Wed, 15 Feb 2023 00:14:26 -0800 (PST)
MIME-Version: 1.0
References: <20230211144147.3812388-1-niklas.soderlund+renesas@ragnatech.se> <20230211144147.3812388-2-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20230211144147.3812388-2-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 15 Feb 2023 09:14:14 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUsp_jVNxx-L=LdjmDNEeWKvK4top3fttn6m4bZVQYJHw@mail.gmail.com>
Message-ID: <CAMuHMdUsp_jVNxx-L=LdjmDNEeWKvK4top3fttn6m4bZVQYJHw@mail.gmail.com>
Subject: Re: [PATCH 1/3] media: dt-bindings: media: renesas,isp: Add binding
 for V4H
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Feb 11, 2023 at 3:43 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Document support for the ISP module in the Renesas V4H (r8a779g0) SoC.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
