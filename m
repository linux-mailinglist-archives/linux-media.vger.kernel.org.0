Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 614D76C9BB9
	for <lists+linux-media@lfdr.de>; Mon, 27 Mar 2023 09:12:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232183AbjC0HMo convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 27 Mar 2023 03:12:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229771AbjC0HMn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Mar 2023 03:12:43 -0400
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7969422C;
        Mon, 27 Mar 2023 00:12:42 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id p15so9192640ybl.9;
        Mon, 27 Mar 2023 00:12:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679901162;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zm/i78Y1B477CpiZq/AT0pA1dKvGwwrNWCLMjpg/Ojw=;
        b=G+mOforLRx8bJi1ZXctnvg5Oo5bXpIlvCv/OZOwXg7xDE5TIlO7J4wzD7hHpHY1n5o
         NSjqWt5neIAo2NaGK+S8NPhpxXRxTB/xIZ6yqv+OpZVny2/2rG6k1TzhHRwEjIR829GD
         DI+GVtkEEiqA9T4KIxrVCBC6yEeiznpV75qh8B1G3pCc3QP3S6h2/7Mqu/x81nz8mjvF
         WQ+APiqo7P/NLmiuKYvTtyal/p+5WGjsefT/CSfVc7Q4UsWLZbOuwcwS9nOHooKpuENf
         S2UEctrWZG0uJUsVrpD4QPtdpyyHt5BPH1rvm99VXd8+pD6oiBP9A8MonJxTvy5mi3pj
         PZ/g==
X-Gm-Message-State: AAQBX9cDofHtRi1ZfuoeL3/XrS5WWKenlJYrwyfyTf0CzlFOQlXgRjii
        Gn12rkFoTMPkoTgyzySyOWuwFoyHRW3Q7g==
X-Google-Smtp-Source: AKy350afUB4IeFM+Jk/DJymBfafcLacCaSm/LwL0TBBmWIuDs0UOVZOfXjghtaYdVnRSySC+9hE2hw==
X-Received: by 2002:a25:41c4:0:b0:b75:8b6e:88b5 with SMTP id o187-20020a2541c4000000b00b758b6e88b5mr10569285yba.51.1679901161807;
        Mon, 27 Mar 2023 00:12:41 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id i11-20020a25220b000000b00b7767ca7488sm2150168ybi.37.2023.03.27.00.12.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 00:12:41 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id p203so9187556ybb.13;
        Mon, 27 Mar 2023 00:12:41 -0700 (PDT)
X-Received: by 2002:a05:6902:1083:b0:b67:d295:d614 with SMTP id
 v3-20020a056902108300b00b67d295d614mr5026520ybu.12.1679901161233; Mon, 27 Mar
 2023 00:12:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de> <20230326143224.572654-54-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230326143224.572654-54-u.kleine-koenig@pengutronix.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 27 Mar 2023 09:12:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUd7=31dUwD5yJQ-LZO5Wfu6HToC0wTM4ZqDvF6K7fwgA@mail.gmail.com>
Message-ID: <CAMuHMdUd7=31dUwD5yJQ-LZO5Wfu6HToC0wTM4ZqDvF6K7fwgA@mail.gmail.com>
Subject: Re: [PATCH 051/117] media: rcar_drif: Convert to platform remove
 callback returning void
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
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
