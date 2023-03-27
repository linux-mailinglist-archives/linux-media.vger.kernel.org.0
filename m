Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60A536C9B9F
	for <lists+linux-media@lfdr.de>; Mon, 27 Mar 2023 09:05:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232115AbjC0HFN convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 27 Mar 2023 03:05:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232248AbjC0HFL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Mar 2023 03:05:11 -0400
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E14904203;
        Mon, 27 Mar 2023 00:05:09 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id z83so9209116ybb.2;
        Mon, 27 Mar 2023 00:05:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679900708;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zm/i78Y1B477CpiZq/AT0pA1dKvGwwrNWCLMjpg/Ojw=;
        b=3Oft3QafDyL9KVm93tOItlllTPbRvGd8fEwKZYY2Mpswnv7oxo1Fb3iFrCX5ZMHOqg
         RMOqmvWGgFpKvl74BC15jFK6nCufsiH7bgEVyz7meCPWiXk1mTwG4iw1BUmJFJki6K4y
         8RoOfw2YNg5HEQsmlw0HjAYzWJi2kQ77n24jtVMCjyzJESvo1PtYNzVlA4oOLukylWSM
         rSw29askT7be/7yilHKqhx9CAvRoSEZK1StCv+GVE9cMyuQbnm2CNPRRKPCUmQz6dCAo
         Vuyd32tMu/c57ps29LhKcTHC6mYJSLB0qXwNjvdUArHmF2YnUGSVKu+6ip3xfIF08RPZ
         wwBQ==
X-Gm-Message-State: AAQBX9c4LxwzWGBo4YYsNvOgOz5KjJX5LhKL6MxB3CaAz0G+XPl6ql5p
        tWMZRQ29GjzadujWZuRVoKmG/hi6rnQjKw==
X-Google-Smtp-Source: AKy350ZWeL3awijZPzA/YhG8l3SQPSg6C4miofmueAFl3L2I9H3XRM+9XQr8tDRBxxMjEBGKS2STDw==
X-Received: by 2002:a25:5ce:0:b0:b61:9c06:c4c1 with SMTP id 197-20020a2505ce000000b00b619c06c4c1mr10935441ybf.18.1679900708514;
        Mon, 27 Mar 2023 00:05:08 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id p129-20020a255b87000000b00b7767ca748fsm2149587ybb.44.2023.03.27.00.05.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 00:05:08 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id r187so9192273ybr.6;
        Mon, 27 Mar 2023 00:05:08 -0700 (PDT)
X-Received: by 2002:a25:6b0e:0:b0:a27:3ecc:ffe7 with SMTP id
 g14-20020a256b0e000000b00a273eccffe7mr7567585ybc.3.1679900708038; Mon, 27 Mar
 2023 00:05:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de> <20230326143224.572654-50-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230326143224.572654-50-u.kleine-koenig@pengutronix.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 27 Mar 2023 09:04:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVgJ-9aU6wcPKnup2iOJ+YZ3VUAd3N3GZjSEddyhMx-PQ@mail.gmail.com>
Message-ID: <CAMuHMdVgJ-9aU6wcPKnup2iOJ+YZ3VUAd3N3GZjSEddyhMx-PQ@mail.gmail.com>
Subject: Re: [PATCH 047/117] media: rcar-fcp: Convert to platform remove
 callback returning void
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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
