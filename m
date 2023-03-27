Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D9D26C9BB7
	for <lists+linux-media@lfdr.de>; Mon, 27 Mar 2023 09:12:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229967AbjC0HME convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 27 Mar 2023 03:12:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232267AbjC0HMC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Mar 2023 03:12:02 -0400
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 378D74C0B;
        Mon, 27 Mar 2023 00:11:54 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5456249756bso152278427b3.5;
        Mon, 27 Mar 2023 00:11:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679901113;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zm/i78Y1B477CpiZq/AT0pA1dKvGwwrNWCLMjpg/Ojw=;
        b=dS0h9pXJOl56fxk6aLR4/xzYpwxxod8/qeytlCmz7+YzFD2mQSpVhQln0WW34gSyFY
         h0aFJWLFuq8E+vzSCUFzBNiLGgK11gAwBUbfA2MnWE03Vs9BRS31bz3eGFn2ZY0NR/Vz
         1UjV6N2tZO7EzURJS2b9vNzl6u0dk0W6h4L/rmoU8KeRx4OnJDcgH4RF8aPZf/jcclWs
         zM+FdSUBHLp3AZH9dkG3M+d+N0UMV7SWawooGs1l1ZApoRggbbcisjdXNG9WKMXeB6PK
         HTMk/20ziByWftMhGwuIohTJ+XQN0ZbDFodFgmAzCMfHpkaWMk6pUuWS8xcU43W4jZJj
         fkpw==
X-Gm-Message-State: AAQBX9deM04pzizt6uMyWB00jQXVl/65AvrcAncdB7S6iNuun0Kj6ZeO
        vJaOu8uaMkfUCFmIxZNh1QnvMvfsJT9LsA==
X-Google-Smtp-Source: AKy350Zwzo2x9k6aJu48c2NGAJCeXCH3RROhEm3vPNxpojdjhftw8g3nyVhAPGg/8pgNS1cODmvTCA==
X-Received: by 2002:a0d:d415:0:b0:545:62d7:6fac with SMTP id w21-20020a0dd415000000b0054562d76facmr10384383ywd.10.1679901113289;
        Mon, 27 Mar 2023 00:11:53 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id i79-20020a816d52000000b00545a08184desm1832039ywc.110.2023.03.27.00.11.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 00:11:53 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-5419d4c340aso151846507b3.11;
        Mon, 27 Mar 2023 00:11:53 -0700 (PDT)
X-Received: by 2002:a81:b617:0:b0:544:4008:baa1 with SMTP id
 u23-20020a81b617000000b005444008baa1mr4727325ywh.4.1679901112806; Mon, 27 Mar
 2023 00:11:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de> <20230326143224.572654-61-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230326143224.572654-61-u.kleine-koenig@pengutronix.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 27 Mar 2023 09:11:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUqBeE4em57XhoDmzwA8hneDdzJvqnMUNS158dwgHZeDw@mail.gmail.com>
Message-ID: <CAMuHMdUqBeE4em57XhoDmzwA8hneDdzJvqnMUNS158dwgHZeDw@mail.gmail.com>
Subject: Re: [PATCH 058/117] media: vsp1_drv: Convert to platform remove
 callback returning void
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        kernel@pengutronix.de
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

On Sun, Mar 26, 2023 at 4:33 PM Uwe Kleine-König
<u.kleine-koenig@pengutronix.de> wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
