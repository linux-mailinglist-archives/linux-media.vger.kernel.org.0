Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9782475B3C8
	for <lists+linux-media@lfdr.de>; Thu, 20 Jul 2023 18:05:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232697AbjGTQFF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jul 2023 12:05:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230336AbjGTQFA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jul 2023 12:05:00 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52C831998
        for <linux-media@vger.kernel.org>; Thu, 20 Jul 2023 09:04:54 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-262d096149cso124852a91.1
        for <linux-media@vger.kernel.org>; Thu, 20 Jul 2023 09:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689869094; x=1690473894;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dp5o9nt8Hvpi+5tSNPwMybnsFj0k0LnIrtFD/XRgDaQ=;
        b=UlhljImlYQJCM0xEuF6ua825vJ4Mx9kTKkp2A5QZ1gIeHJYIx7zw2uxyWRQxgSza/G
         OO28v6ZxUSAJqj7wN4Og0OVHBSpFREk+Xiy6RYsgw4zRpeIXrldaT5SG/xcJ3ygW6OAn
         ZAGZ9NAB0zVb2P2jq2Kv6vbpu9H0Q3pzDq0pFupoZuCImB3EBfNGOQ10HQp7t6KXXsWq
         ocan9HFdX/YWGlSXHGrfEbb+HpBkZ7S0wZal5vqISVjGYwIUV6komz6Km1Lg/ql7r5sf
         X1eWSbxMJseVt66XciazLvxsowe0pZ0wK+XhN3IUHOEe0k/jt7q32ktWDU3EY/ErG7fz
         XPQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689869094; x=1690473894;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dp5o9nt8Hvpi+5tSNPwMybnsFj0k0LnIrtFD/XRgDaQ=;
        b=E8bGB9ISyHdRjtZd+hk6kr5mdjko9BEEFD9N+zDQZTduHNw3vS9TFSPScQNr4BPQjV
         0pSNkqJ/R0ow5K0yzqNaDMoU54Vd4DBxd9Zkw5QgdT7Gr4CbBETNQuvjsEMFo7ePvQlt
         Vf3Q5NmCCn7m/uaIPmNyyGW+81OnCh8J1g50U5SWp5soWLV1gMndEeM+p0F9a8LR7eJl
         yACExZoC5uvglvx5virBBFosxCICK0StuzdmePfL7xoDSCXrs5Va3tpc8cNjdajXPq+q
         UKz32k7aMAr2oj8dwEAR0AXQ0oqWkTzLx4od4PJZdptbJPMYbU3+NiLTucFGXpv6PGgw
         C9LA==
X-Gm-Message-State: ABy/qLacjebBIYJRuVrt4hu6EAcCdwOn4TH4CECh8RaxwEvzcRETN9ga
        l2Q78BWzpobB49MSPvfQefaO/n3o6rzdgcdp4s8=
X-Google-Smtp-Source: APBJJlEV2zHagRJZABdjMoLondcup/iMj0ww0LaLiPMTxVon6ZOVZBRQbjWblipK6CL0UsvlVU9k+28tPnhDNdvQUxk=
X-Received: by 2002:a17:90a:690d:b0:263:ed7:3574 with SMTP id
 r13-20020a17090a690d00b002630ed73574mr2275351pjj.1.1689869093615; Thu, 20 Jul
 2023 09:04:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ+vNU0BOVLTL17ofgHwtexbpuMYwH_aGUC==EXABUtHHiv_ag@mail.gmail.com>
 <2290635.ElGaqSPkdT@steina-w> <CAJ+vNU0_LwY+4_9LT7-Cin4Otv3ne20N72TdsfzV4odEMQrLOg@mail.gmail.com>
 <844922189.0ifERbkFSE@steina-w> <CAJ+vNU21HytYLDojnPqLu8a9BRGRbMNgmGzdqbm67_5TYZT2tg@mail.gmail.com>
 <CAOMZO5AT=U2EDqEm2QEK-DSqCMd+=xMa_AAaYaog4-j77h46gA@mail.gmail.com>
In-Reply-To: <CAOMZO5AT=U2EDqEm2QEK-DSqCMd+=xMa_AAaYaog4-j77h46gA@mail.gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Thu, 20 Jul 2023 13:04:41 -0300
Message-ID: <CAOMZO5C1H65pWWJsXoqhumkPWjxjehb4VF8zZMyD7rUyvbC4Zw@mail.gmail.com>
Subject: Re: media: imx: imx7-media-csi: Get rid of superfluous call to
 imx7_csi_mbus_fm t_to_pix_fmt
To:     Tim Harvey <tharvey@gateworks.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media <linux-media@vger.kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Schrempf Frieder <frieder.schrempf@kontron.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tim,

On Thu, Jul 20, 2023 at 12:52=E2=80=AFPM Fabio Estevam <festevam@gmail.com>=
 wrote:

> I tested capture on imx8mm-evk and imx8mn-evk boards on linux-next 202307=
20.
>
> Both of them are working here, so I was not able to reproduce the
> probe failure you reported.

Does the change below help?

--- a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-imx219.dtso
+++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-imx219.dtso
@@ -62,25 +62,12 @@ &mipi_csi {
        status =3D "okay";

        ports {
-               #address-cells =3D <1>;
-               #size-cells =3D <0>;
-
-               port@0 {
-                       reg =3D <0>;
-
+               port {
                        imx8mm_mipi_csi_in: endpoint {
                                remote-endpoint =3D <&imx219_to_mipi_csi2>;
                                data-lanes =3D <1 2>;
                        };
                };
-
-               port@1 {
-                       reg =3D <1>;
-
-                       imx8mm_mipi_csi_out: endpoint {
-                               remote-endpoint =3D <&csi_in>;
-                       };
-               };
        };
 };
