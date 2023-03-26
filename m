Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A78AD6C976A
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 20:18:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230201AbjCZSSk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 14:18:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbjCZSSi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 14:18:38 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 122DE30DE
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 11:18:37 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id t10so26969628edd.12
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 11:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679854715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3d3GBP63oeY5CzEIXPrG304fdCBV11eQVRKEbz9r7vk=;
        b=bH4rB3XManAOHePfddG6K/ColVPCvDRV9OhQCxuup92eGMOO6i1BJJ6QLHC7drxOwE
         s2loik1eGaYx/0tgjP1ySqpVScaZRG9XNmBq4UDZOdOgrpH63dvxZuI75bAzpusqwr5/
         dLIB/ggNiC/TLhebyjisnb5CXDu8OmtC6zs/4/yBGafXvB4z736/P70i2sQFFnrPPmhJ
         XU5ZFmLgOzov6VBaKpn749F8gdvPIR4IhlAzIG38qvc9rZbAaF31JasV7lER3eV4aPQr
         jE9q2xKMAboZRFhhz0ZHyZbZer42rGhGass/UDtDHEZwWrQH4DGsJoaO39gO/cQHQ/wD
         i9bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679854715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3d3GBP63oeY5CzEIXPrG304fdCBV11eQVRKEbz9r7vk=;
        b=Wg8z0/tUDsvfT2G09cdk3mhJb3wnfoXcWzjD5/vPwilCsVHuKGVpT1yokMTrhq7Pnz
         ZuE/SlZ3KRU7u6cBs3apkAPZ9/ijK6imgQWHtlQ81+y9nsX6+C4OcRlO/rDZgXkMqpWu
         Gaix3wplAkfkkXQkeYn8we7HXY+H8mHeh/cKnUR/4ofj/SEhnCmQjcE5i+M2IQn775TB
         amnWQiNKQyfFIqr3akwiHmdcM+2NTLehubcPn9QR4/CjOct77qhBcaTpnrHKDfbZ3dcK
         hn0AldK6bWEUC+KXH4upXaIYvek1Ta66gcXALu6ZbxGxqYznsNZjEoFcULUVl+2x1ocJ
         GbHQ==
X-Gm-Message-State: AAQBX9cKe/p89Oh5fRIx4zHr/iklvEhKUUyHrsuERKCApqiLdmJOf2WK
        nUA4FYwW72ynAv1c+/h6m24=
X-Google-Smtp-Source: AKy350a1ZJMqrhifvE9tEgG/vklWWad5WqbXPGZyYdXvzLFocNJZQQrG23Va7ImyqyLK0OjpCg2gqQ==
X-Received: by 2002:a17:907:174f:b0:7e0:eed0:8beb with SMTP id lf15-20020a170907174f00b007e0eed08bebmr9772534ejc.41.1679854715421;
        Sun, 26 Mar 2023 11:18:35 -0700 (PDT)
Received: from kista.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id kn6-20020a1709079b0600b0093f2e69c715sm2517920ejc.110.2023.03.26.11.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Mar 2023 11:18:34 -0700 (PDT)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Samuel Holland <samuel@sholland.org>,
        Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, kernel@pengutronix.de
Subject: Re: [PATCH 080/117] media: sun6i_mipi_csi2: Convert to platform remove
 callback returning void
Date:   Sun, 26 Mar 2023 20:18:33 +0200
Message-ID: <1943376.usQuhbGJ8B@kista>
In-Reply-To: <20230326143224.572654-83-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
 <20230326143224.572654-83-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dne nedelja, 26. marec 2023 ob 16:31:47 CEST je Uwe Kleine-K=F6nig napisal(=
a):
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>=20
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


