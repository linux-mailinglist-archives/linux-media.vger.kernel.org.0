Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A06FC6C9768
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 20:18:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229793AbjCZSSL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 14:18:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230201AbjCZSSJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 14:18:09 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76FB51FE5
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 11:18:08 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id w9so27136274edc.3
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 11:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679854687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F0z4RFfHMU2/2ypHnwqYv9UkrMQizv56zWHHQEZYoBs=;
        b=PBRl+QMRtnW+66ZegD3hEojjApkC581cvyTRGma0sYDQfntinWgs1WFyi3BoMyZznl
         AC1PqgI4mDH+MCe9RPzRUYKCJ6EyPiexunfThXwEa8Q37xTQhJIR1ydxBXtoEdRYx+3y
         rsg8fkZ31shhrtsniXcAzwv72wcqU2m3MfWTK+KumrEwNeyNIegPQ47dar1vtnRjitHP
         Dw0tbsgMflubVd1Fu03PP3bwte918kDg2UIrsmXNVGYd2PVjMlWaGZKcSejUT/M5ynfn
         GRfz9yw2e+ra97uVR5XofdOO5njFSSkdLsU1vu9RiYF/yJZDTt38XUeuBZUsEyFortyT
         AEqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679854687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F0z4RFfHMU2/2ypHnwqYv9UkrMQizv56zWHHQEZYoBs=;
        b=caAzKmtyolKcHVk7G/nB0c8c70aiKr6P+geOHdhUJEPZBrOO+7x5ZGz1E9EVcVFvgQ
         hEgtUB/IE0UdjcYCZbF3Nyeftbvddv5qyto+u7lHpnLq0qO3WfRis+4iC0cf9g5rCGyh
         TmlJ0BPa1yu4JXjZ/z+Ejjq0DgtPN3k1stqBYUZbDBOSErD3KbB/v/eQPz/egEDi7jR3
         PvbFX3aNnoMKdvr3EKaEweiCh6BDaw5xLW5GMsAHM8eB38oGe1lcsE5SVluim9N5/bld
         BWAUoMonRWROjB0andZEcjKIMAyadUJ0ihdU6Gy36Re8amE+VsnPbj9NeIqhws2BVQAp
         X6JQ==
X-Gm-Message-State: AAQBX9c1fC6Su8ZpFPscaTewdcuutQXHNCQ3Gsn2j6IAykTqA6HaMiCt
        aunzOhrrCEoJoFG0+02wJZw=
X-Google-Smtp-Source: AKy350bM+W0iHPGBqU64BeruoxvXdP0Tu5+EEI5wHVp4ul8K5rTA+zXmxhljNjruKkvq0osXCSY+dw==
X-Received: by 2002:a17:907:3e09:b0:93e:82d1:9ae0 with SMTP id hp9-20020a1709073e0900b0093e82d19ae0mr9841254ejc.49.1679854686887;
        Sun, 26 Mar 2023 11:18:06 -0700 (PDT)
Received: from kista.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id z1-20020a1709064e0100b00931baabe36csm13128167eju.63.2023.03.26.11.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Mar 2023 11:18:06 -0700 (PDT)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Samuel Holland <samuel@sholland.org>,
        Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, kernel@pengutronix.de
Subject: Re: [PATCH 083/117] media: sun8i_rotate: Convert to platform remove callback
 returning void
Date:   Sun, 26 Mar 2023 20:18:05 +0200
Message-ID: <3153045.5fSG56mABF@kista>
In-Reply-To: <20230326143224.572654-86-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
 <20230326143224.572654-86-u.kleine-koenig@pengutronix.de>
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

Dne nedelja, 26. marec 2023 ob 16:31:50 CEST je Uwe Kleine-K=F6nig napisal(=
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


