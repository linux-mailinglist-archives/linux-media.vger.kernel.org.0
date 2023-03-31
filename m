Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F28E56D23A5
	for <lists+linux-media@lfdr.de>; Fri, 31 Mar 2023 17:09:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232977AbjCaPJU convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Fri, 31 Mar 2023 11:09:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232358AbjCaPJO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 Mar 2023 11:09:14 -0400
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BF2A4209;
        Fri, 31 Mar 2023 08:09:04 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-544f7c176easo420089977b3.9;
        Fri, 31 Mar 2023 08:09:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680275343;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WMxAUybU8NHLeEsxZ/TrAWgALQQNzyIHivQ9AaJJubk=;
        b=fAp34U6/XPnnAXuKNIQyIITz55mEKQq7P3/I8F1brCUiFjiShQwTKRlPuH96PiCdjh
         FfEWnnxMTd5dDZyr+mziWcY8icth+6QjVGaJye0Bju4F4wnB1D2OAvB+ax3xmEXMITGr
         pfjszsEQaOUKd6qN0FwviERR8hI681VWwYlC0ZGZvpmpWWjVTAwhOxwC9EvuZCyQ7zFH
         AEMyX9cGyIwezF1A3vDxfrhY0bNdDo55gorWbXJi44k3Kb7t33O1zEjO2Unwt8rZGV92
         yw6s0vQGWWzvBY9cP0TtvC2sFaCMuqvKKYWyjF3bzW/QaqYsQMPwPm86jhZQDhzAbJvi
         dBFQ==
X-Gm-Message-State: AAQBX9c/7ua6lhj92/eMED5NP9DB3WGXFABEGRFGXITPrdT87af6b1wD
        zSr6taXcURP3FNUZVuTxmn3jGLEDNab6rA==
X-Google-Smtp-Source: AKy350YYVhhnvTqMOGVd7utlC8CemwYFHNUdDhkcRLED6fo1CE63GIkeLUtyhj3A1ZhzstU/TPuGMg==
X-Received: by 2002:a81:1954:0:b0:546:2a87:ce9c with SMTP id 81-20020a811954000000b005462a87ce9cmr7441399ywz.12.1680275342986;
        Fri, 31 Mar 2023 08:09:02 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id l14-20020a81250e000000b00545f7c7cc8csm565332ywl.93.2023.03.31.08.09.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Mar 2023 08:09:02 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-5456249756bso420135767b3.5;
        Fri, 31 Mar 2023 08:09:02 -0700 (PDT)
X-Received: by 2002:a81:b28a:0:b0:544:5fc7:f01f with SMTP id
 q132-20020a81b28a000000b005445fc7f01fmr13224551ywh.4.1680275342387; Fri, 31
 Mar 2023 08:09:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230331141431.3820311-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20230331141431.3820311-1-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 31 Mar 2023 17:08:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWXxUy67noYCq3d2HOKD0rvzmoL=xPGHZ=0GjToJosNNA@mail.gmail.com>
Message-ID: <CAMuHMdWXxUy67noYCq3d2HOKD0rvzmoL=xPGHZ=0GjToJosNNA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: falcon-csi-dsi: Set bus-type for MAX96712
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
        FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

Thanks for your patch!

On Fri, Mar 31, 2023 at 4:15 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Specify the bus-type property for all three connected MAX96712.

Probably this can use a little bit more explanation?
E.g. what does not work?

> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Does this need a Fixes: tag?
Fixes: 283252132cb578cf ("arm64: dts: renesas: falcon-csi-dsi: Add and
connect MAX96712")

Note that a backport to v6.1 and earlier will depend on a backport of
commit f7eeb00845934851 ("media: dt-bindings: media: Add macros for
video interface bus types") in v6.2, too.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
