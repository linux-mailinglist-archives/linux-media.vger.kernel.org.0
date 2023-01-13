Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFBF7669152
	for <lists+linux-media@lfdr.de>; Fri, 13 Jan 2023 09:40:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233650AbjAMIkH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Jan 2023 03:40:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231701AbjAMIkE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Jan 2023 03:40:04 -0500
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8047A6DB84
        for <linux-media@vger.kernel.org>; Fri, 13 Jan 2023 00:40:03 -0800 (PST)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-4d19b2686a9so147667307b3.6
        for <linux-media@vger.kernel.org>; Fri, 13 Jan 2023 00:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tsNRTrcZoV3jRk0+El+5w2YWVStZY/pdqxXoOykPAOA=;
        b=e6NQFpPewIPoEZBRRii/guTxu751o310ItOp/f7MTUi+ppxTw6KzyVMa2Ug6Amfi6G
         qGXChZvd8xVrxAl/soYMI7J3zn8mpXRoFPhvkFWDdiqyvT20b7oiVwG8axupvYDgTQe4
         1DD5e1wg9x9AVuoU5rcqnaiFH3vLgRx/U3JjHNgON3fDxZuknWblXge0jX5b9kJL4q0Q
         BTpp4nmaIxfyKQGx9JBg76voILQ4boK2xTeZsJAN0nELk1fyCQ8q+u17K8LDld8RfhGV
         ewbbp2h5kTD7uB/Uq5IiAStj8br4F9n2v2qxa+zxt3FQgXd+oMElzY5KsYNL0Wf1Tz/j
         nGsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tsNRTrcZoV3jRk0+El+5w2YWVStZY/pdqxXoOykPAOA=;
        b=SJg7QXeqhS3MnWiVkFPaI0VuOVpwVYqnXUfYSLvRly8Ndrf15jihm1ClsBm0zlFMR/
         PvsYF/alQh7z001tjCYUl9D9+JY3CdebhnPUltdZDeLUgHFUingVpficls9JiUbvIrmw
         Qyx1eE8AEQEQg+SzP6ZRCSwGFMtjhlyNZBeKiL1B8e1A0hwhLaN0FGoLfY6rRDLTNC7V
         p8greFB5jADA+ACgm27Fr8pCr6Z+Zvo/KslXfbkNkmKPbwDS+Iwuyu/B2qrbn7VSWr0W
         ac3kIO6vjDPniFt0UlMRmP7WeN4UPvtxPwK08iAOSdqqCyhMa3m1Og49pGkKGyrBjZje
         a7Aw==
X-Gm-Message-State: AFqh2kqu/ItmYLxnShl05nmbL6Pe1PM/eSjJeBT2U3CuRyt88tOSnsK0
        dJB3wHw7BsNx8BWfQ4ABUgbWHKdIHP3Qes/CM8I=
X-Google-Smtp-Source: AMrXdXu0bK7VZ+7oMs9dohkQ9cTcf/vr7dzS7nV7IGghNws9fxw+OdxQB7hLYCmy//VyPpQ2qr+yYmn/fm8LUSrW1fU=
X-Received: by 2002:a81:a191:0:b0:3b7:1b8a:6024 with SMTP id
 y139-20020a81a191000000b003b71b8a6024mr3694250ywg.421.1673599202613; Fri, 13
 Jan 2023 00:40:02 -0800 (PST)
MIME-Version: 1.0
References: <20221213153553.648871-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20221213153553.648871-1-u.kleine-koenig@pengutronix.de>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Fri, 13 Jan 2023 08:39:36 +0000
Message-ID: <CA+V-a8u1zJK2CknCXg2FiUuqxRB3h5x7y6V_-3PB0AZHG5AhVQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] media: Drop empty platform remove functions
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sean Young <sean@mess.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        linux-media@vger.kernel.org, kernel@pengutronix.de,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Uwe,

On Tue, Dec 13, 2022 at 3:36 PM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> Hello,
>
> this series removes all platform remove functions that only return zero
> below drivers/media. There is no reason to have these, as the only
> caller is platform core code doing:
>
>         if (drv->remove) {
>                 int ret =3D drv->remove(dev);
>
>                 if (ret)
>                         dev_warn(...)
>         }
>
> (in platform_remove()) and so having no remove function is both
> equivalent and simpler.
>
> Uwe Kleine-K=C3=B6nig (4):
>   media: ti/davinci: vpbe_osd: Drop empty platform remove function
>   media: ti/davinci: vpbe_venc: Drop empty platform remove function
Ive reviewed the above two patches. I believe Hans will pick this up
soon for v6.3.

Cheers,
Prabhakar


>   media: rc/ir-rx51: Drop empty platform remove function
>   media: chips-media/imx-vdoa: Drop empty platform remove function
>
>  drivers/media/platform/chips-media/imx-vdoa.c | 6 ------
>  drivers/media/platform/ti/davinci/vpbe_osd.c  | 6 ------
>  drivers/media/platform/ti/davinci/vpbe_venc.c | 6 ------
>  drivers/media/rc/ir-rx51.c                    | 6 ------
>  4 files changed, 24 deletions(-)
>
>
> base-commit: 830b3c68c1fb1e9176028d02ef86f3cf76aa2476
> --
> 2.38.1
>
