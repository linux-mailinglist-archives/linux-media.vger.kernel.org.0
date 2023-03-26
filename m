Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 625C96C976C
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 20:19:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231359AbjCZSTV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 14:19:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbjCZSTU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 14:19:20 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CC8A5FEE
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 11:19:19 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id w9so27144753edc.3
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 11:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679854758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iRsdmVEmkxcp3g4ZbMN6Afce7+HfUPfqF6kGvf5nBhg=;
        b=Ys/WIc2tT3SpQOxjP2ekhZiOsQc1XgzldyHwX8iBX3A0TrIxjtvW6Ky9thPOlY1b8w
         YAIbiVjo4nbHjicHsETpZB4kTTSN4229zKctq4cuv64rjmIIQRoFjEZ3f0YQgWAyNdNC
         keURJRgEvdYeWWbooqBuVipAjeajDFt1Pvrm1E4GRFNjWXzE0lOcuqye+57Gz6+bIjyU
         oGUHIVSMuMHnv01ikTWLF2gasvQPacKlnmHIumJ/2C11GnwdxUSrmTw0cMjkhDLHuhKF
         qmfJSJbvr6/o1plGsIYuqamXCUj569zCCk9c9nzh1fi/Kb9Jsrb7ZalPMJbM2et5VAQr
         WV5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679854758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iRsdmVEmkxcp3g4ZbMN6Afce7+HfUPfqF6kGvf5nBhg=;
        b=YqEQc3zpMp94eWKIvi20MYSr6UItc2m+ii3ivA678s0DDP98m2TIPeaxR9Bw1PMKPK
         RVEcw+6hO6tvLI2JUPPpoH7DdNN+ybusiLxmN8GxrjujuTFcYj4Tcz21t74eMYW2sG/0
         MHlfUCe6dSefGKtyOkNsTPV7YNeyg+Mu5tvsEERAjlxuhAAOZ+ivlSw32QdGgdD3lO21
         A2iyOP/lsu7THBEmdXbyvACydmUoRVdkdVzU1ulmIUeFy/Eaje8EAlgaBALLoNp9GtI0
         b7IrJPTFq6D0YEJga/fwWjfL0zleAlV7M/xzz3s8MuK2mcU/l8BBEIwHwLzBy141rNA1
         6ynA==
X-Gm-Message-State: AAQBX9cQIea9IdhYVvcsbUbYWqYuya7+4R/jdqYIMjQ4vFdB3mJiNLxm
        RqZlA7F/KUPXLsyA8kyoiVQ=
X-Google-Smtp-Source: AKy350ZAFybFuC6UV5o+Av2B3qaWvPelSXC1+yQkwDZDZrxwesjGUcFtJ/jkq2lGEmn6lg1APX5eIw==
X-Received: by 2002:a17:907:c710:b0:8b1:806b:7dbb with SMTP id ty16-20020a170907c71000b008b1806b7dbbmr10225413ejc.51.1679854757904;
        Sun, 26 Mar 2023 11:19:17 -0700 (PDT)
Received: from kista.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id ja21-20020a170907989500b0093338259b2bsm11671117ejc.207.2023.03.26.11.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Mar 2023 11:19:17 -0700 (PDT)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Samuel Holland <samuel@sholland.org>,
        Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, kernel@pengutronix.de
Subject: Re: [PATCH 110/117] media: sunxi-cir: Convert to platform remove callback
 returning void
Date:   Sun, 26 Mar 2023 20:19:16 +0200
Message-ID: <2550444.Lt9SDvczpP@kista>
In-Reply-To: <20230326143224.572654-113-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
 <20230326143224.572654-113-u.kleine-koenig@pengutronix.de>
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

Dne nedelja, 26. marec 2023 ob 16:32:17 CEST je Uwe Kleine-K=F6nig napisal(=
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


