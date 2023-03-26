Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E5536C976D
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 20:19:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230158AbjCZSTk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 14:19:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbjCZSTj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 14:19:39 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 417966580
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 11:19:38 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id h8so27064167ede.8
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 11:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679854777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WSqxuyfEke81j3er0Go/DK/4bC3kWSK22YBA8/AvV4U=;
        b=Y5gYxjKDM6nDVlxy9wV8DDJ0v3+laD4XdKX7h308JBH93asCCHbFaOJiDig1tS1Vtx
         Tp/Svx5uA29CcVPWGl9MQBzDoUsnJJwbYlUWXgMBmY3AHpxmsFzslWdqEtw9h+sWce9f
         TScRafAYujNinL4ymkOyIDDvM+kHi2mHNbpi7I8AvJ0wMsOaLgQ6INo0nnRvpL5e7E4F
         +0seYkgiwEGpCL3J6n73NwxaG2apUJSlU75EN+FyXylquHplj/y+3BPtSIzKF3TB0DYv
         7XObNhRMJ+NK3ZjVcxREVzUOOwc8frMwwrs+hlbfKb6DIeiuFL4mDBmFV++rawK3e+Lp
         mERQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679854777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WSqxuyfEke81j3er0Go/DK/4bC3kWSK22YBA8/AvV4U=;
        b=WI1uO0WEgbF7UJD+66evipoqYZAPtpZNUbL48/YswYW+juZtuEPilVOsun2M1HekSG
         AjqtjwjsUrJlfso+L8MOhSmO2sHHpnXh4zjWuQVaDcp0nrJ28v8J2Y2lEahIsR0tekyy
         QzVWrFCAwtgK8Yj7TfylJAreTX0mts5vJ4ouBHgO4B3rwTFbyBup23SV/iner/O7inck
         7YsS41i+s4RI6um+aex13YhgYf+YV7XWvhWwCPn+wGte/i/nkZTXL1Cs236xT67IgKe2
         b7Hs3qZRjtMtMqz2zpTX6BxuquRnuOgP3mGau2Z31yZYrTAsQgUi4K/A7ZC+bs7mdRvW
         wotA==
X-Gm-Message-State: AAQBX9dLtHawRT9VQaLtL76ugkHYFTnxom/TpurbkTjqZR3gMOkSK/w0
        MP4IzPZ6V5fLSl+QvACBpdE=
X-Google-Smtp-Source: AKy350b5DXHhyU94C4UF+pOzVUUSUq6TDLMXboWN7jxjGnv4nSKPxGzBca6EDPRG7oQLbPTEtr/lww==
X-Received: by 2002:a17:906:524a:b0:931:7709:4c80 with SMTP id y10-20020a170906524a00b0093177094c80mr9117307ejm.71.1679854776718;
        Sun, 26 Mar 2023 11:19:36 -0700 (PDT)
Received: from kista.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id o2-20020a170906774200b009273859a9bdsm13100901ejn.122.2023.03.26.11.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Mar 2023 11:19:36 -0700 (PDT)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     Yong Deng <yong.deng@magewell.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Samuel Holland <samuel@sholland.org>,
        Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, kernel@pengutronix.de
Subject: Re: [PATCH 079/117] media: sun6i_csi: Convert to platform remove callback
 returning void
Date:   Sun, 26 Mar 2023 20:19:35 +0200
Message-ID: <2144019.Mh6RI2rZIc@kista>
In-Reply-To: <20230326143224.572654-82-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
 <20230326143224.572654-82-u.kleine-koenig@pengutronix.de>
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

Dne nedelja, 26. marec 2023 ob 16:31:46 CEST je Uwe Kleine-K=F6nig napisal(=
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


