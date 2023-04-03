Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F8A36D52BC
	for <lists+linux-media@lfdr.de>; Mon,  3 Apr 2023 22:41:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232468AbjDCUlh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Apr 2023 16:41:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233481AbjDCUlf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Apr 2023 16:41:35 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C86244B2
        for <linux-media@vger.kernel.org>; Mon,  3 Apr 2023 13:41:34 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id b20so122363419edd.1
        for <linux-media@vger.kernel.org>; Mon, 03 Apr 2023 13:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1680554493;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZlKcaKh18h+QBmr9urMB1rRvxToOGdnmDwwJL+gmwVk=;
        b=Kbu5MgByDTndcn6H3Aws06CMNmcOMzFALbLovTUHnI0Uev2htF7/kn5JTlkB6lrnau
         8tOqQjvKLhh+Hwa8uihkDI3GowEmwWGHHYTzZcSWIRUXNZGdvLjFyWBUHQqHOlxpp2Tb
         trrmVl6kZdUqhiUs02PWNjITiVchtI2OuDaqbY4A/xRwU4p3Oss4JKlVuIbUCm8yR8A1
         QecmQh3pkUZQpAYdmhG9SsKi8+GabL+P4AGWWysn5iL7zJdWtIUHBcYBJVJewexz8KiA
         gaby47c8HaV6KYJUnC/PjVSAUheAR4Vdr35lLcsRPkSgGze62tHhnYH9i/99BS46YPYH
         tVBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680554493;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZlKcaKh18h+QBmr9urMB1rRvxToOGdnmDwwJL+gmwVk=;
        b=zYddLdDDDIWhvZ+JlGsC5otCmCxuAyfs1nHTCmwMc+Dw1yCMuThLSkjFZ6FNwFEEn7
         L2dcj648Mbj5er5OOX/+ZK9PtLoDNsw1psgiphyDeyAyRb2jkmUI9HY4Bv4tW/ZG1V/n
         qTrZqVmc4MHxEkxWOzWdulYck5dtQxnL+DXnP3AAYsKUVbBNcSs9gbo/sCUEU8HrjhtB
         4vovLTUE4VGYvhaTavXLxZkMTzGt8R5oiEoE/Yi5u88wOX4Xzrt7DSPze/WEThgKSW8i
         ZEl3GoSAOJ5kzcv9WcrlQ/7adAXJszw+RsrNmJX64h2dmWQ/bDWvor2RTJ6gV1/5nYz9
         LCcw==
X-Gm-Message-State: AAQBX9d+uIPl0B9DnpAr2yjQCrPJS+1E7gdZrbtSH7P9TJ14a2HIN3cR
        muPeTjXETUB6FOBLunTFT8uA7yLt95D1q1FDCCU=
X-Google-Smtp-Source: AKy350Z8ucav5p+k2KypfUKA+RgsmB4zKBLSEuRb0SRzMNTxwzpo+JJYtwQqWaWP7Z26TaIRkKjw+6MMEanVvGAlftc=
X-Received: by 2002:a17:907:742:b0:92f:41e4:e48b with SMTP id
 xc2-20020a170907074200b0092f41e4e48bmr2768ejb.6.1680554493114; Mon, 03 Apr
 2023 13:41:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de> <20230326143224.572654-110-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230326143224.572654-110-u.kleine-koenig@pengutronix.de>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Mon, 3 Apr 2023 22:41:21 +0200
Message-ID: <CAFBinCAWqafhJKh=W-WoLodzNeAf7o3GFhcfO4bVFA5UygLGGA@mail.gmail.com>
Subject: Re: [PATCH 107/117] media: meson-ir: Convert to platform remove
 callback returning void
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, kernel@pengutronix.de
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
