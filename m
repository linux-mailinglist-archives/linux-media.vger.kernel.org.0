Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D02F6D52B4
	for <lists+linux-media@lfdr.de>; Mon,  3 Apr 2023 22:40:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233477AbjDCUkk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Apr 2023 16:40:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233478AbjDCUkh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Apr 2023 16:40:37 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7591A3AAC
        for <linux-media@vger.kernel.org>; Mon,  3 Apr 2023 13:40:30 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id eh3so122285526edb.11
        for <linux-media@vger.kernel.org>; Mon, 03 Apr 2023 13:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1680554429;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZlKcaKh18h+QBmr9urMB1rRvxToOGdnmDwwJL+gmwVk=;
        b=IsXIM1GsDA9wnYRjhr485gupyXU0DyOlKFkT+qT8S7KijVz7vbLI9Ow6STXhwDHY5k
         QtTg+uw6CmOdcL2Dj2e8AxdMM/gpdWZbHpnruzTzX+XkwwWHZtxLPM6Y0dL2WbCjOrh8
         80vX+xm4WeRF/t2cBhUUkoEJpQZzwSwagHGCElS0/fBZc76G4XhFq6fm2o/e1RXmD67a
         s3j30YoLCDxM+/jXlWu2AcbJ3H4TnIpnVA4zbMh37/vW9hx81x02qyYiN+tnbpZ82B9j
         Wv1wLcnuv+p/kAiAMc40Xbec46U9RBBs8NuGtFk6Y8OgrJSthP9gIK6YpGWYVeMWjHzB
         W3Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680554429;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZlKcaKh18h+QBmr9urMB1rRvxToOGdnmDwwJL+gmwVk=;
        b=q+mjuBRqw2ZDQzFSajUAwIgoT1Xiss6BF3ULQ4wd8sK51H7KxZ1J8akz9TUv7QO8Rf
         gOLBQJX53FWNTlrC8gEqYQdrfiFsQiD5IiqJa47BTzIEv/LIieimzBoie9HvOnG6cfld
         ClDT7jtnfUudlKMGuCFVdsa20ZstpsYWBIhpphDaAanYGAXbVNkYUQ2uKQB84BYKmjkf
         RORXD6bWRf6PrzksT7o3mWhEZW6sK+vcZCCKr+shJxZGyi7JeVXYTJcKpPyhWF0RXlLq
         Hb0h3lN0hdmJYn9LS/on7hE6sSJGPNyvMmKrHBbvG3WSkUweemEVzqQHC+J2ROKFkAc6
         pKQg==
X-Gm-Message-State: AAQBX9f8qrjFNluiyi1ekkPoeZe12h9fIku7bIewEHtZErzV1UMGP3LJ
        UqWIRtvV74dCUKmKk2dL7lOECYYdZ+Fx3AFI0+I=
X-Google-Smtp-Source: AKy350Z+IfNXRLwqJq0hdKDfoeCZcaaS62XaGg2SrsfxMV/1nFOZuoUyblX7Or0x/driV8kJIMoxyivJFVTzi7CRSUU=
X-Received: by 2002:a17:906:6a03:b0:930:90ce:a1a6 with SMTP id
 qw3-20020a1709066a0300b0093090cea1a6mr18597940ejc.6.1680554428972; Mon, 03
 Apr 2023 13:40:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de> <20230326143224.572654-109-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230326143224.572654-109-u.kleine-koenig@pengutronix.de>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Mon, 3 Apr 2023 22:40:18 +0200
Message-ID: <CAFBinCACdhrRiDUYycVM5m6B0dDUw=fyFdTo_QFQfqcVTpt-Uw@mail.gmail.com>
Subject: Re: [PATCH 106/117] media: meson-ir-tx: Convert to platform remove
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
