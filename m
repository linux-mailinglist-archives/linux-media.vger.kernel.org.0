Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 413276C9BAE
	for <lists+linux-media@lfdr.de>; Mon, 27 Mar 2023 09:10:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232208AbjC0HKu convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 27 Mar 2023 03:10:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231986AbjC0HKp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Mar 2023 03:10:45 -0400
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABA1D49CB;
        Mon, 27 Mar 2023 00:10:39 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id r187so9211023ybr.6;
        Mon, 27 Mar 2023 00:10:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679901038;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zm/i78Y1B477CpiZq/AT0pA1dKvGwwrNWCLMjpg/Ojw=;
        b=K1I/ihwK5RaJx2tS5wwuVxpoMaFD+NOfsc5n78ZiCHnmuvX+HySeV/QsZLz//NFNT4
         dA08r//mMEgL8EA3hWStcOsifg/YvGABWWVELiofKZPskqkLfooVPx0hWNNDN/6HNSUt
         4OydlbppEkVv1iTuikgH+CwZ49TbRMz2oirUOldnyH4iYDYMINwVcq/8IDoWVyeXiI8v
         u8mJIqOnY9NPWm353sggGn3NnUNsO26PmirkKxDvDBAGRwQLZ0chmQP/l2zwDT58Q43b
         X2J8NdEkrnUKSKNwjnuG8ddTbNBohQXcVYnuUWNG6xw/YI12Jtp+B77W59RAZRg208/j
         7btA==
X-Gm-Message-State: AAQBX9eP9JYPSQc6K1wVao8rE+wN0ecpczPZZr++RySUqhzHI8B3f0LI
        Kv/QGNf/4phL8Iu7yQeai6PvGupplMjbJg==
X-Google-Smtp-Source: AKy350blic/SEABVkPpjwYNbPA+NiXE4dDOPTFDod3N9AwPhm4b5W9XOTOYfLRLoTkNHp3zfleikbQ==
X-Received: by 2002:a25:2584:0:b0:997:e3f5:d0cd with SMTP id l126-20020a252584000000b00997e3f5d0cdmr10570912ybl.45.1679901038714;
        Mon, 27 Mar 2023 00:10:38 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id v74-20020a25c54d000000b00b7767ca747fsm2123216ybe.28.2023.03.27.00.10.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 00:10:38 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id k17so9180502ybm.11;
        Mon, 27 Mar 2023 00:10:38 -0700 (PDT)
X-Received: by 2002:a05:6902:722:b0:a09:314f:a3ef with SMTP id
 l2-20020a056902072200b00a09314fa3efmr6473040ybt.12.1679901037915; Mon, 27 Mar
 2023 00:10:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de> <20230326143224.572654-51-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230326143224.572654-51-u.kleine-koenig@pengutronix.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 27 Mar 2023 09:10:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVFs7hz3UgJgqZr26RkK7atyfLmP9iCSyxA=o-zoRdd9A@mail.gmail.com>
Message-ID: <CAMuHMdVFs7hz3UgJgqZr26RkK7atyfLmP9iCSyxA=o-zoRdd9A@mail.gmail.com>
Subject: Re: [PATCH 048/117] media: rcar-isp: Convert to platform remove
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
