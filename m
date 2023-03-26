Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B35D6C976B
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 20:19:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231287AbjCZSTH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 14:19:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbjCZSTG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 14:19:06 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DBA05FC8
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 11:19:05 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id b20so27159397edd.1
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 11:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679854744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NYDVTthcR6u9E+XHEe13iqcOf0r5Jx1Dzo1NUFq9hPc=;
        b=XcozPoJra2LYibW9h6/atXgn9pefgpJIQSPBygEPLaP+8JUHtOS0iLfSH7ya8xurIk
         qD0UMLTik77Bsiea6PzOeMEuQhBqxV5JyZgiRxCVLl5fa/tJmrOvyEaGbk61e/HBoESD
         B5nC7b0YcsjJ2LPFL7Q0vGbxBhyyphVD8Suu+wukWjexq1oIm6XZ8tSgaxlLRQvj+wQk
         QI+afcWU3rjs6/XMuFPobZtd9dNttJ18fl+Z3/WoDiNrGjuK+UGy76qLBEmsqTBigtNJ
         S30S0Em8vcsRDTjT4Dtt8YJp6nBpcZcfrssbF0X2VSRvab95iCHg1efQxI2hJQt5x23o
         vODA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679854744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NYDVTthcR6u9E+XHEe13iqcOf0r5Jx1Dzo1NUFq9hPc=;
        b=5Vf3lGjm2cJaP8PW2nauFlqxhEVSPkkP1xQl6yE8AMmYvoU09CkxIu/IcCnx4UX9HD
         lAOP3r/P3k2yATkLTFVhY4Z/1WAQSN/a64NnGW25DWlbLZdcix/fjrtG3WRuxwIJYpFz
         idq6ocRtAnzLHC3BvhSrnzVvLGwgJWbiWGSvd9CnBakcOkI7Gybv2qn6g8ZIfD88Pmp7
         w+Atfg+jEHiXHWVcFbEDEehte5nTdCT3pg75qL5xCIxWC8NPx5yWpM0BelrHXYHVbUeM
         qpmmB2koKt6NX+bNGnXGMexET318Ln4DTInuL5Fp9wtiYOW9ZmJJOtOCFXeq+7tA9+RZ
         lwjQ==
X-Gm-Message-State: AAQBX9fAV/t/AEsLnrWs+eftUolgokEktIyvFT4Mk1wfrgTys05/BOP0
        8IH3HXng+mr/f7h39hiB1Xc=
X-Google-Smtp-Source: AKy350YETZ4/536hGpirOgHRYIttr1kCkxkvIFfLXdI/sCdAj1cP+ScdLDU+YzfmPXsFogGZuC7sJQ==
X-Received: by 2002:a17:906:8288:b0:933:44ef:851e with SMTP id h8-20020a170906828800b0093344ef851emr10449837ejx.55.1679854743840;
        Sun, 26 Mar 2023 11:19:03 -0700 (PDT)
Received: from kista.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id i13-20020a170906114d00b008e0bb004976sm13196105eja.134.2023.03.26.11.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Mar 2023 11:19:03 -0700 (PDT)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     Maxime Ripard <mripard@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Samuel Holland <samuel@sholland.org>,
        Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, kernel@pengutronix.de
Subject: Re: [PATCH 078/117] media: sun4i_csi: Convert to platform remove callback
 returning void
Date:   Sun, 26 Mar 2023 20:19:02 +0200
Message-ID: <1849373.CQOukoFCf9@kista>
In-Reply-To: <20230326143224.572654-81-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
 <20230326143224.572654-81-u.kleine-koenig@pengutronix.de>
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

Dne nedelja, 26. marec 2023 ob 16:31:45 CEST je Uwe Kleine-K=F6nig napisal(=
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


