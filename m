Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10F066C9767
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 20:17:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbjCZSRy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 14:17:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbjCZSRx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 14:17:53 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40CA51FC2
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 11:17:52 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id er18so15844450edb.9
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 11:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679854671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FnTsQUm6HhjATm02ksR3wp/Ety48QzTJBZ9lksbtOVs=;
        b=Hw4H00UoiUrwTuhkIy4J+TCrs2QhEwUE7rii1JKt13al9XnNSOvNrX3bQayx1liDbE
         eheNALQBp83JQS/e9mxrLYAwh+Tv4/rLHPWdJ47tZfc4rMdlHyqpmyCx8lu0zYcmYqk4
         Qbg581Ljc8pPoe79vk2wHR8x8TJJoOWkG6A3+kzDbl4WG5Yx6pjUnAPOOySNm1sBZfQe
         drOG5wWrgVaFt+J/0btk/BKu+AGxJIlmMzztYSgU6zbn34YRnN7/UbZVZ1FWpoxWEe6C
         fqvLeQBnnhsbA1Itl5m2n7DVfL2e/OHinXzN073EO4YJLITmDgfB2rH7vv4b1EFwP62j
         EIEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679854671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FnTsQUm6HhjATm02ksR3wp/Ety48QzTJBZ9lksbtOVs=;
        b=hNKrloYdH5+aOq8VpoCUo5N57if1xCpY/eGyYii1C7jCWaSogXzg+SzsXt1tVG/IHf
         ekB5ZVANOmdiqt4ispN07OjtCYQMzIR7ybl90i88vy1/zYzqAvztljeGkw303JeeQsxf
         9EhValY5Wzmc6GrWNnjLHt69/pb4G9XU9o/PfyUPguXdiSHBrCSgCOQJ7gKBzf1aOHt5
         3raFTHLUxszjFZMEC5PjcwdcQ+Km8UWFqVGT109VoKd/DNLAXcI7Aw0GMBOSvTm0zESN
         zYWJimKqyVAZC2H09gZjqhq1YdZuYeLA8JQzjCmwkZHRnsNdW6GnA7kwyrVRSHW1GcKK
         Oidg==
X-Gm-Message-State: AAQBX9eLY6l3Apj+6eYH/4kToI7BPHt9Gqobd4OPxADiTiX1rL06f6K6
        Z1EX+m0Qef72grfe+qRm3Q/af4kH3hI=
X-Google-Smtp-Source: AKy350bzwX2Okw452MLlLN3trK1J0tQJbXMqGx9csXq3pD9R5t41CwxzDxLp3qD2Y0tuUnKfA9LL3A==
X-Received: by 2002:a17:906:5a94:b0:933:15c0:6e05 with SMTP id l20-20020a1709065a9400b0093315c06e05mr9470325ejq.7.1679854670654;
        Sun, 26 Mar 2023 11:17:50 -0700 (PDT)
Received: from kista.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id q27-20020a50aa9b000000b004af73333d6esm13720731edc.53.2023.03.26.11.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Mar 2023 11:17:49 -0700 (PDT)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Samuel Holland <samuel@sholland.org>,
        Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, kernel@pengutronix.de
Subject: Re: [PATCH 082/117] media: sun8i-di: Convert to platform remove callback
 returning void
Date:   Sun, 26 Mar 2023 20:17:48 +0200
Message-ID: <3486523.iIbC2pHGDl@kista>
In-Reply-To: <20230326143224.572654-85-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
 <20230326143224.572654-85-u.kleine-koenig@pengutronix.de>
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

Dne nedelja, 26. marec 2023 ob 16:31:49 CEST je Uwe Kleine-K=F6nig napisal(=
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


