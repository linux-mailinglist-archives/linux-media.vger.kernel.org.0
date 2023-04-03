Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E96C6D52AC
	for <lists+linux-media@lfdr.de>; Mon,  3 Apr 2023 22:40:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233252AbjDCUkE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Apr 2023 16:40:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233431AbjDCUkD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Apr 2023 16:40:03 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C66DBE7D
        for <linux-media@vger.kernel.org>; Mon,  3 Apr 2023 13:39:50 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id cn12so122378485edb.4
        for <linux-media@vger.kernel.org>; Mon, 03 Apr 2023 13:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1680554389;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZlKcaKh18h+QBmr9urMB1rRvxToOGdnmDwwJL+gmwVk=;
        b=APtFxy4GTyHDQSIKi5euiBvb5x0VfNGvdHHhUdMx+apyPDeZdKal7pBTKib+2K2Tbm
         QOfG1Rfb8q6T++lm3k+Fark9O3KIsnwlY2wO83HH46yKQdqYx3Y8sYMMWK93RyNmiK9Q
         wHNXbR+HE+Gg5fwdaFLxYmF656lf9RSauJLtvDQD33i2shInpTijiSiQMWydvGRRjI5L
         KfjNcAzbX5KuuHhyDDciRSP2jEHe/T066DQ5d+h+7cm2wZhhVNEknTeIbgh6v6E53XaU
         ViEg/hlzvSQpP2AYKzl5i5+YZrK6dWgGl4Z2VdPPqoGmPFLc5j3y6iYPnIGxlyptjRI5
         gPaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680554389;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZlKcaKh18h+QBmr9urMB1rRvxToOGdnmDwwJL+gmwVk=;
        b=ugcB9mWANMr8Rayv5ckWumhOogcIeVEsiI/2u2qqiJGlcyA8x5OwrnHaA0j3XXB31c
         XFu/Zevalh/18KyVu2lxEyN5djXDNQGqMdwbB5L+Uohfb6oovW45O+Y6cjz8JkTgO4oi
         dequcPPNEvVTiDS2wXfLdGpZeR9eou7Wz4olGu4de6ReR7r+B7dsrXv3zYDBDMR8gqi+
         MD4bjJeAA51jl4fVxQ7xMZ/lDy/ORRHJGioZt6u6iAunMx5uYrknm5eJsXr3IjZV6gtb
         wWKmVQcFCl66JC87U2z0dZaxpIAoxlfK9dET8pJu2z2zEzMFwxI8nS/DrBpCyjnXWv1W
         sJ+Q==
X-Gm-Message-State: AAQBX9eMb7wrtt0PEbwVDTNIBcRYHJ0wOTPNd8VFBUTff850VbIT1wVj
        3gNF9lwvs1/YBB3A1C7bOb2AMlxlB/kgNKBT6nU=
X-Google-Smtp-Source: AKy350arklalHmhLPunHYsPFrEV9ZdjEA+cbNyUT6obGNnZ+tQa5Mc/stomB2qevvziuiR6999336ZdBgJ2Y3SwVjyQ=
X-Received: by 2002:a17:906:948:b0:878:4a24:1a5c with SMTP id
 j8-20020a170906094800b008784a241a5cmr207ejd.6.1680554389226; Mon, 03 Apr 2023
 13:39:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de> <20230326143224.572654-8-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230326143224.572654-8-u.kleine-koenig@pengutronix.de>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Mon, 3 Apr 2023 22:39:38 +0200
Message-ID: <CAFBinCBNtkvd6xv0uU=Wy_OXVkyHd5XEwnbJwFf0N+RneuKBJw@mail.gmail.com>
Subject: Re: [PATCH 005/117] media: ao-cec: Convert to platform remove
 callback returning void
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Neil Armstrong <neil.armstrong@linaro.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
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
