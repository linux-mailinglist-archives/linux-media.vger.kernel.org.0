Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62C1E6C9BBD
	for <lists+linux-media@lfdr.de>; Mon, 27 Mar 2023 09:13:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232220AbjC0HNj convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 27 Mar 2023 03:13:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232190AbjC0HNh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Mar 2023 03:13:37 -0400
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13D8A273A;
        Mon, 27 Mar 2023 00:13:36 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-5416698e889so152617997b3.2;
        Mon, 27 Mar 2023 00:13:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679901215;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zm/i78Y1B477CpiZq/AT0pA1dKvGwwrNWCLMjpg/Ojw=;
        b=iWZTIoEvre87/GWKXRaarPrIJL/+2YmOnSKlVKRq6jQPepXPT/UZ0UMrQ2XOJMhsnK
         vGJC9ou78nYRnm+N/GS9CPc9n0ddpkVu3LObFt9j9rPWVltYSbK3C2VjbNZESWJ6qrAU
         QP4sREnpuApjIAs1aF4FKcMK20ar5xsjqkjdPzLMrYQL63JXNES8Ukf4RqmVx68efDM+
         m/hPzb/rp3ht+w+u4PY8IQTENUQjyKd9HmQ9uAV/wsIWTKptQIG2V6w/OLCGyuEw5nAW
         7zUl0Zy0Jgynct8qKUpSh3Mr5GDSJJuKRA/lH3a1Nl9vG02FQy1DMvbYUp6hw6v3Zv/Z
         0HsA==
X-Gm-Message-State: AAQBX9cxYfaMZyCqus4MWlgkPasGe3OSF4pkrQKuC0dgD+/yx7QacVpU
        Ll92MjN5oQ0kAbca2SsF6FQXT8bksS2MRw==
X-Google-Smtp-Source: AKy350bE/UYffTJgrSXza3qicejf80GvTYSOj6tfag3PKKPH9sbHiZ7LGQf5ZN2EArdzfqBMEMSJnA==
X-Received: by 2002:a0d:ce04:0:b0:543:5ed:7980 with SMTP id q4-20020a0dce04000000b0054305ed7980mr11547397ywd.33.1679901215148;
        Mon, 27 Mar 2023 00:13:35 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id 124-20020a811382000000b00545a081848csm1815166ywt.28.2023.03.27.00.13.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 00:13:34 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id y5so9238253ybu.3;
        Mon, 27 Mar 2023 00:13:34 -0700 (PDT)
X-Received: by 2002:a25:6b0e:0:b0:a27:3ecc:ffe7 with SMTP id
 g14-20020a256b0e000000b00a273eccffe7mr7578703ybc.3.1679901214404; Mon, 27 Mar
 2023 00:13:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de> <20230326143224.572654-57-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230326143224.572654-57-u.kleine-koenig@pengutronix.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 27 Mar 2023 09:13:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUoSqWkGg8JUAQK8wYiOzK_3wSLUsf=bT-K1dJH0=X+Rg@mail.gmail.com>
Message-ID: <CAMuHMdUoSqWkGg8JUAQK8wYiOzK_3wSLUsf=bT-K1dJH0=X+Rg@mail.gmail.com>
Subject: Re: [PATCH 054/117] media: renesas-ceu: Convert to platform remove
 callback returning void
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
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
