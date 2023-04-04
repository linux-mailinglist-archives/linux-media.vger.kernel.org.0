Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0ADC66D698D
	for <lists+linux-media@lfdr.de>; Tue,  4 Apr 2023 18:54:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235615AbjDDQyc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Apr 2023 12:54:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234912AbjDDQyX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Apr 2023 12:54:23 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF29049ED
        for <linux-media@vger.kernel.org>; Tue,  4 Apr 2023 09:54:01 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id fi11so9769362edb.10
        for <linux-media@vger.kernel.org>; Tue, 04 Apr 2023 09:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680627240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sGzZwlArkCanfjz3209OKEfk0hXSgBO1tQBC1EAfOQs=;
        b=RtSnDTr1VANEwCyMGM+vEm53Kdt9EoAiFNvRS2f4emGqMqIA7o3Ois6LHXR1pKkb9G
         a7CSUA7lswHy8kM/nTNSDAMRVV6bjG7f8+6RKyYWETlq+PiUU/Gb2Js9uNu0c/gSg+Xj
         dM1SCz1cPMmNOdc+N3jVPfcwjkx7O+vDTt+8WIJKdZzOd3DjwpE7kRVeTSdPF/c3Y0ga
         KO82tzmJaW4G7KOADVI37ICZ6gxdYOZp1Elir/OFa0uXinSne8pQEmu4IzwZy/1wPZcm
         VlJe/8i6chRPUUJnNgs66kPhEAT0kXC0hulAm9ZAqj9+66UZJNLV9M/ySsdgxbvxOGUH
         0vJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680627240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sGzZwlArkCanfjz3209OKEfk0hXSgBO1tQBC1EAfOQs=;
        b=UcVgxZFLAiIP1qFUrRKdvQuTI/ERssMkubLuJLY90tbYLuJQrPR/mrMLf5HQei0eVI
         1qKjCT15XauUoUyhce11p+HIykiwcefordI2fVrBjVJYdn4jxNa8sNjojT8C3gX9aIeI
         ossM9UlHmtB1ic3gSppYbv1AyHYnuOxiBFC9AWv37DHgwVJof16qGEG4VO/wKjxLiGQ0
         f4XAe35n5Ki/UAbTCqSSsb/gkElbdceFd14WkBKEN3Y2GS7HbwhmOjgTYUPYowroaouu
         5U7pCBq/c6ARAsLvpA/LeGpRuR85WY2O19vETn4fPoCdFLfEhNsJvMXuL/eK1FRE41c3
         ionw==
X-Gm-Message-State: AAQBX9cUUweHJZcVxPyC1lDkUb+FndKQ9437iCi0M4U2hvmh6kYhLxqh
        WeLHY3s4f+efyX5COXPKhCYJuTmruf8=
X-Google-Smtp-Source: AKy350ZKXk3hfK516A/weJLnTJBSMLsovyookq63ehsy6W9OCLNvhirELuhDUofyxwVNkDU2Gor1fQ==
X-Received: by 2002:a17:906:c784:b0:92d:591f:6586 with SMTP id cw4-20020a170906c78400b0092d591f6586mr220041ejb.34.1680627239992;
        Tue, 04 Apr 2023 09:53:59 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id k26-20020a1709062a5a00b009331450d04esm6284487eje.178.2023.04.04.09.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 09:53:59 -0700 (PDT)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Samuel Holland <samuel@sholland.org>,
        Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        kernel@pengutronix.de
Subject: Re: [PATCH 15/24] staging: media: sunxi: cedrus: Convert to platform remove
 callback returning void
Date:   Tue, 04 Apr 2023 18:53:58 +0200
Message-ID: <2673737.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20230403154014.2564054-16-u.kleine-koenig@pengutronix.de>
References: <20230403154014.2564054-1-u.kleine-koenig@pengutronix.de>
 <20230403154014.2564054-16-u.kleine-koenig@pengutronix.de>
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

Dne ponedeljek, 03. april 2023 ob 17:40:05 CEST je Uwe Kleine-K=F6nig=20
napisal(a):
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


