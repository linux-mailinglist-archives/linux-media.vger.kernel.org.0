Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84FBC7D90D0
	for <lists+linux-media@lfdr.de>; Fri, 27 Oct 2023 10:12:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234901AbjJ0IMJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Oct 2023 04:12:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235044AbjJ0IMG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Oct 2023 04:12:06 -0400
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5519E1B4;
        Fri, 27 Oct 2023 01:12:02 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C4D4F24000D;
        Fri, 27 Oct 2023 08:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1698394321;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wAf0b6HKy71BlxcQ3sZf+ZyHpheDkqTPfqoKqqqphmo=;
        b=nUXzB9Wdv4xia4jZUGGorPnHiW/rFM0GLikloN+as8D4XFpXwlrxTjx6VvXhZLkIoZYRHo
        4TgQOEfy257Fzx34hVpQXqPBRHTNfm16U14HiCDQELgYXOexFJIZ0C1FEhmagcKAqWdhWR
        J6jmYMVX1ZNvm3bHO/Ve+k0uuUf7o/LQEPe1uMfWhp2ml3RHkT1y9A9L7sS0ajsrdivG6M
        3UQRcmxX4M6Rqd37z0nkzqa1ZaWUh6IawWXukxxif75692OoH0iMmbUfWPmL8MTRSJnryN
        cDdrDGsWFX6QokMbs4qM6Nfyu+5IhHG182ZJk172TSBInNpmcNDiRuscATFKcA==
Date:   Fri, 27 Oct 2023 10:11:59 +0200
From:   Luca Ceresoli <luca.ceresoli@bootlin.com>
To:     Uwe =?UTF-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-staging@lists.linux.dev, kernel@pengutronix.de
Subject: Re: [PATCH] staging: media: tegra-video: Convert to platform remove
 callback returning void
Message-ID: <20231027101159.4a4b829a@booty>
In-Reply-To: <20231026214739.2509271-2-u.kleine-koenig@pengutronix.de>
References: <20231026214739.2509271-2-u.kleine-koenig@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Uwe,

On Thu, 26 Oct 2023 23:47:40 +0200
Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> wrote:

> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
>=20
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
>=20
> Trivially convert the three tegra-video drivers from always returning
> zero in the remove callback to the void returning variant.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
