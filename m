Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABB92669622
	for <lists+linux-media@lfdr.de>; Fri, 13 Jan 2023 12:54:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241323AbjAMLvp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Jan 2023 06:51:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241261AbjAMLvP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Jan 2023 06:51:15 -0500
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E0D443DA2
        for <linux-media@vger.kernel.org>; Fri, 13 Jan 2023 03:45:17 -0800 (PST)
Received: by mail-yb1-xb35.google.com with SMTP id o75so22060692yba.2
        for <linux-media@vger.kernel.org>; Fri, 13 Jan 2023 03:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SdT2WiraGM04CeVSLab8Z3xdbtMxbe6zsh/Ix32nFgE=;
        b=CTFdFpq+JCYdk1mCN5VNC78+TlXtXHauo99/ziOdFtrh83QkjJnvPL9YIwOW89wiiw
         3Zc6ItJyCKJxeKoXCeogGDvy4p7bCPxMyjuxaqyJLkL5CO5lD9KNJDne3XxYHPo3la9C
         VVQnaEuiW8kB8EdK7/vcmrHR0HQsLpHUxDVI+Us5kuzco+4fXfepKaIMpLKD3HK3lS7e
         9amOkK781Ei1X/8AGiuesG7IEMU4gI2I8wMOzXePkSWqfmUvvNnXFn+F/KjQYU+PHlBx
         QcnpZxLsKOkHx0ZiU5A6G2CDk4nSKEzhnB9N4F2le0DN9ZXpcESv4s1heNXxssVkfJt5
         P97w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SdT2WiraGM04CeVSLab8Z3xdbtMxbe6zsh/Ix32nFgE=;
        b=Zgi2MVDpFPox/uppezNeo3nqBD2bKvcEYdTJbkAk/2dn409ZXk7reNShRrjmmCB8Pb
         k/Y5qVu5FWr8vYgetQKHfNBEToojL1QJxVVMJr4VSei97M2ifQfIGE2WylBxYXs4hjk9
         wTvp/u//s8IHR7IcX8AvBV4F7Q2vBubsrPKT/ki3uCNG+7q+skyiCDgPzJ5Au3aDJCq3
         q8AGeFY6xLO4vw64pVpThB53xzdW027m1jorj+Yl2SzWzmAwVuk8ZLYxnPRAnejVL0v2
         17upGXQttPE2tascR9bJkyxPl1p8YLOPTwRuFriZqZpVLHpbroS/lpDdTiF/jbDNS816
         VCSQ==
X-Gm-Message-State: AFqh2kr6nV9HwzRgQpN6pS1QsFuSJzYGohzdgk5YaVK/N32E/EHcZ6HP
        1tnfTO7suWxS/IBJZSfGJjO7LbLn3oO2kFI7tMc=
X-Google-Smtp-Source: AMrXdXu2Z3anFsQR2G1OUckq1X8Qx6jogsVRF5IfxMsbbCC2nbiVcb/4keH+8LNpnf3rkqPWhA4yo5p8X224qYUHGaU=
X-Received: by 2002:a25:3309:0:b0:7ae:a4b0:bfd with SMTP id
 z9-20020a253309000000b007aea4b00bfdmr4315810ybz.398.1673610316312; Fri, 13
 Jan 2023 03:45:16 -0800 (PST)
MIME-Version: 1.0
References: <20221213153553.648871-1-u.kleine-koenig@pengutronix.de> <CA+V-a8u1zJK2CknCXg2FiUuqxRB3h5x7y6V_-3PB0AZHG5AhVQ@mail.gmail.com>
In-Reply-To: <CA+V-a8u1zJK2CknCXg2FiUuqxRB3h5x7y6V_-3PB0AZHG5AhVQ@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Fri, 13 Jan 2023 11:44:50 +0000
Message-ID: <CA+V-a8s0dQoUNEdyq610Os=65wQcSEnOsxAMxAx917zMZXaPKQ@mail.gmail.com>
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

On Fri, Jan 13, 2023 at 8:39 AM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
>
> Hi Uwe,
>
> On Tue, Dec 13, 2022 at 3:36 PM Uwe Kleine-K=C3=B6nig
> <u.kleine-koenig@pengutronix.de> wrote:
> >
> > Hello,
> >
> > this series removes all platform remove functions that only return zero
> > below drivers/media. There is no reason to have these, as the only
> > caller is platform core code doing:
> >
> >         if (drv->remove) {
> >                 int ret =3D drv->remove(dev);
> >
> >                 if (ret)
> >                         dev_warn(...)
> >         }
> >
> > (in platform_remove()) and so having no remove function is both
> > equivalent and simpler.
> >
> > Uwe Kleine-K=C3=B6nig (4):
> >   media: ti/davinci: vpbe_osd: Drop empty platform remove function
> >   media: ti/davinci: vpbe_venc: Drop empty platform remove function
> Ive reviewed the above two patches. I believe Hans will pick this up
> soon for v6.3.
>
I totally forgot davinci drivers are being dropped now [0].

[0] https://lore.kernel.org/lkml/20221019152947.3857217-15-arnd@kernel.org/

Cheers,
Prabhakar
