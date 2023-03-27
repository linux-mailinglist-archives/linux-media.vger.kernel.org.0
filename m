Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7F3D6C9BBB
	for <lists+linux-media@lfdr.de>; Mon, 27 Mar 2023 09:13:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232225AbjC0HNO convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 27 Mar 2023 03:13:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229771AbjC0HNN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Mar 2023 03:13:13 -0400
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7DA1213B;
        Mon, 27 Mar 2023 00:13:12 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-545ce8e77fcso75253557b3.1;
        Mon, 27 Mar 2023 00:13:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679901191;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zm/i78Y1B477CpiZq/AT0pA1dKvGwwrNWCLMjpg/Ojw=;
        b=ugq7wbZPK9pxoz/dFnbW5xx3cTurvL0ZQvKW+BloKSvEmj6y4KD9vyTaS3eXdGGr9B
         Yf4iq7pzPiNdEeHF1UaR3k26pzZ6vxGirLYKkijycVZ8jMYtfUBOoWUUSVTYNGPFhtd8
         f8Jnd0tqbTm4oxUX/h4te/W97QslogeqKqVZn2QueUxeR2v3HSdt0w8FlhX9JwE7sjIB
         fVpBdRCRnwnSXBWr6dxN71OVZzK/7CttnGMmbx2GoTe11lVKrHEKvSQ8iwa15eqSxfOd
         YUkZgHe5oyTBNM16jGltYLUQ+VwNTAnks8/1UvOhMDf13vt7eqoLqQUg3oTNv6kr/XnM
         PV5Q==
X-Gm-Message-State: AAQBX9fQ7uaQheVz1mpRMFeEw7KRUCELBLfpa4odXrj7ZnxCiOUm4mKy
        kI0xRG7jGTe6bEBEiFKR3AgyHEE9GOlusw==
X-Google-Smtp-Source: AKy350a8T4JQNlM6jf2B3ec4DGk1e7/BJFB7kj8xEuvtvunslMDWPTLFD5Yz9pj9Giw1Obq0AdFuaQ==
X-Received: by 2002:a0d:eb82:0:b0:540:fc3e:7f04 with SMTP id u124-20020a0deb82000000b00540fc3e7f04mr10173849ywe.51.1679901191766;
        Mon, 27 Mar 2023 00:13:11 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id 191-20020a8117c8000000b00545a0818475sm1821114ywx.5.2023.03.27.00.13.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 00:13:11 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id p204so9173328ybc.12;
        Mon, 27 Mar 2023 00:13:11 -0700 (PDT)
X-Received: by 2002:a25:688a:0:b0:b46:c5aa:86ef with SMTP id
 d132-20020a25688a000000b00b46c5aa86efmr4967626ybc.12.1679901191165; Mon, 27
 Mar 2023 00:13:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de> <20230326143224.572654-55-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230326143224.572654-55-u.kleine-koenig@pengutronix.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 27 Mar 2023 09:12:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUmb_7TXtLQT4X_xSuTjBycZrwcvj=NaU9twYSZT=At5Q@mail.gmail.com>
Message-ID: <CAMuHMdUmb_7TXtLQT4X_xSuTjBycZrwcvj=NaU9twYSZT=At5Q@mail.gmail.com>
Subject: Re: [PATCH 052/117] media: rcar_fdp1: Convert to platform remove
 callback returning void
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
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
