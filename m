Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B93D6C9BA9
	for <lists+linux-media@lfdr.de>; Mon, 27 Mar 2023 09:10:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232248AbjC0HKB convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 27 Mar 2023 03:10:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229935AbjC0HKA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Mar 2023 03:10:00 -0400
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63F354223;
        Mon, 27 Mar 2023 00:09:59 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id k17so9178437ybm.11;
        Mon, 27 Mar 2023 00:09:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679900998;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zm/i78Y1B477CpiZq/AT0pA1dKvGwwrNWCLMjpg/Ojw=;
        b=AaVKgHLJFDLf+HF2QMSEkSMqXVy9gp7mmChpyeMHGLJCsFqNckpj4DybJzsTu3tcwl
         h+aF5OphW0p06kmT4RNNRqYenLkNtdzn2p6m2Dw/COeLGEQbj0SF8KHMmMCTYhP3fH/z
         RH6fB78byrc7VoJXdOHgwzcCIORYGS2UZkCL2avhQ4XU/oq7JUgtqc6qjHM4smQB9dbK
         t0RnwYKHE/KDN+JE/N0op4GXvvhDJrZOtYmWIhP01lu0G9SNPHxq6B3q7cDdUxnti9Nk
         LOqVGGa6XR/WtZGNXGw/E7sLkVMnj5rKkkOjWdzeEgPqfBe/wW9fkkiQvzzJeSkvBpBT
         kIxA==
X-Gm-Message-State: AAQBX9fWp1aD7ft9FmHzNb5o3JgCsDIsUn28/0lRTJ8ZbwxTjRSELL06
        m2/tt+Y97VQdSpJ4qu3BKBOCJWvBi8Y6yg==
X-Google-Smtp-Source: AKy350a/viNA/nMYs57wv4qXp7Zzyn7YwWov50xNnR2tGh69/u+/bAzp8zjSuMcy2Zi6Wa5GhIDS8g==
X-Received: by 2002:a25:3715:0:b0:b66:dff3:5906 with SMTP id e21-20020a253715000000b00b66dff35906mr17284623yba.8.1679900998477;
        Mon, 27 Mar 2023 00:09:58 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id n10-20020a05690211ca00b00b7767ca7478sm2125620ybu.21.2023.03.27.00.09.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 00:09:58 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id z83so9225054ybb.2;
        Mon, 27 Mar 2023 00:09:58 -0700 (PDT)
X-Received: by 2002:a25:6b0e:0:b0:a27:3ecc:ffe7 with SMTP id
 g14-20020a256b0e000000b00a273eccffe7mr7573842ybc.3.1679900998181; Mon, 27 Mar
 2023 00:09:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de> <20230326143224.572654-52-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230326143224.572654-52-u.kleine-koenig@pengutronix.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 27 Mar 2023 09:09:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXNgC4=skBWgE_=C55CNhdTBSnggsWokUUgpWFMX2UdQQ@mail.gmail.com>
Message-ID: <CAMuHMdXNgC4=skBWgE_=C55CNhdTBSnggsWokUUgpWFMX2UdQQ@mail.gmail.com>
Subject: Re: [PATCH 049/117] media: rcar-core: Convert to platform remove
 callback returning void
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
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
