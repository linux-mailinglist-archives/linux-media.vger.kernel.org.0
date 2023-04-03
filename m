Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC55A6D52B3
	for <lists+linux-media@lfdr.de>; Mon,  3 Apr 2023 22:40:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233462AbjDCUkZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Apr 2023 16:40:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233479AbjDCUkV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Apr 2023 16:40:21 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 652AE35B3
        for <linux-media@vger.kernel.org>; Mon,  3 Apr 2023 13:40:19 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id h8so122374410ede.8
        for <linux-media@vger.kernel.org>; Mon, 03 Apr 2023 13:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1680554418;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZlKcaKh18h+QBmr9urMB1rRvxToOGdnmDwwJL+gmwVk=;
        b=BMZvPQArT6h6XAkPe0OPKQrQ55fdDpO/cH35li3iHsHBaTSnwYmx1aFRxaHK3KDHUL
         o7yD07+StCRHQn0A0Cww0DhLYho5DhzMB4kSkCE9qjS1ODIQsGB5t/AA8GEs6Qw/QqRk
         ZOulcEdAtTTB2qoZFw9PoJOviXQJ9f+5V7k5DoHoPXyS5rux2EAHa+Zng7t3NTWPqSDX
         Z3euIwde/GKvVd4HnCnmF8z99zQA3s7ZIxKdM7C3bNAohCh3G7SeNCS+HWkkKOICClgs
         02jvCKhaFLXIwWDzhoRKn/+FFYmZ1GEz2YOAa+d9U9Xxh7r2Yji2n2VeWi8GKUxUcd45
         w60w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680554418;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZlKcaKh18h+QBmr9urMB1rRvxToOGdnmDwwJL+gmwVk=;
        b=pADR25ulSBB2c52hh6aWtVai5YUIc8BbgAdjNneNvKt1XDRcNyoudT/RXCEwD2q/O4
         br4wdXQ7elKZMOHy1ooB/W04Jt7ZWWTDVDedV1mZNlOxWMbcUU2smHkuvYs8bFp/ZbXS
         oG+F2I5QaXVHwLhPl8N2NEMJYDeX29tctkgFtz3ys9KheJYLlwVFdhAvr+3r1dTZLQgo
         fDQDAVD7iYNpvzkdM67vQwzmEP/ToaxQ3gNfy1+ltCTzFwVRDphwtr/xlOEmQfwu3JPt
         Bsc4+O8kK0vs80gwWgFRl98t9PYeLuSJRtE2xkiG96dWCzEo6EwIH4nB3QB8J+I/i/d2
         9M+A==
X-Gm-Message-State: AAQBX9cOdyvHqJvqiS1FKX6UBufXSLgsxsM8yvnuo2fKyPJSvjlAOiGr
        C9ql1P5PfbU2VaMWLQUfGh0aGupBgNzMlcedPGU=
X-Google-Smtp-Source: AKy350byv7mgJhm8ZtaUlXtjWxuFXmilHBYn3b+1HsF9CF5BT0PhB4h6mOSxbN3cLf7k3KyBR1bX2lw22Yrpb/PcA+s=
X-Received: by 2002:a17:906:4ac5:b0:92f:cbfe:1635 with SMTP id
 u5-20020a1709064ac500b0092fcbfe1635mr19738927ejt.6.1680554417483; Mon, 03 Apr
 2023 13:40:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de> <20230326143224.572654-17-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230326143224.572654-17-u.kleine-koenig@pengutronix.de>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Mon, 3 Apr 2023 22:40:06 +0200
Message-ID: <CAFBinCDwrqd5zGWZVfrn3bebpMSrDwaY7dpR_Y+i-oEXiv088A@mail.gmail.com>
Subject: Re: [PATCH 014/117] media: ge2d: Convert to platform remove callback
 returning void
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Neil Armstrong <neil.armstrong@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Mar 26, 2023 at 4:32=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
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
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
