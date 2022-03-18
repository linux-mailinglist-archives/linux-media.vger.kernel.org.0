Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A7B34DD79B
	for <lists+linux-media@lfdr.de>; Fri, 18 Mar 2022 11:04:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234752AbiCRKF6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Mar 2022 06:05:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234079AbiCRKF5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Mar 2022 06:05:57 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D64A1B3715;
        Fri, 18 Mar 2022 03:04:38 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 355858DB;
        Fri, 18 Mar 2022 11:04:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647597876;
        bh=SfJOSMfeU7Ylo5yW8cLXskbBPjjpa8nLMaku80Ct314=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=fHRns+hiZr71qdF3YrgL3rVlNYGWM7BmBHQeMRLrnh/coQkHxfvQC5Gz4j3Ynubsi
         DbTFy/9DSaFH/B8o0Qxm/kXbXfGASA3adzaqSpmWyupw0NC9lUQU+oTcmtmoQk1Bvi
         3ohLF4+IpHHOANNDgJddoKnG7CA/9Nor0yU7i698=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220317204903.28163-1-laurent.pinchart@ideasonboard.com>
References: <20220317204903.28163-1-laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] media: platform: renesas-ceu: Fix unused variable warning
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Date:   Fri, 18 Mar 2022 10:04:33 +0000
Message-ID: <164759787353.1484799.5883759969984812837@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Laurent Pinchart (2022-03-17 20:49:03)
> The ceu_data_rz variable is unused when CONFIG_OF isn't set. This
> generates a compiler warning. Fix it.
>=20

Reported-by: kernel test robot <lkp@intel.com> ?

but either way:=20

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/platform/renesas/renesas-ceu.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/media/platform/renesas/renesas-ceu.c b/drivers/media=
/platform/renesas/renesas-ceu.c
> index 2e8dbacc414e..f70f91b006b7 100644
> --- a/drivers/media/platform/renesas/renesas-ceu.c
> +++ b/drivers/media/platform/renesas/renesas-ceu.c
> @@ -1606,15 +1606,15 @@ struct ceu_data {
>         u32 irq_mask;
>  };
> =20
> -static const struct ceu_data ceu_data_rz =3D {
> -       .irq_mask =3D CEU_CETCR_ALL_IRQS_RZ,
> -};
> -
>  static const struct ceu_data ceu_data_sh4 =3D {
>         .irq_mask =3D CEU_CETCR_ALL_IRQS_SH4,
>  };
> =20
>  #if IS_ENABLED(CONFIG_OF)
> +static const struct ceu_data ceu_data_rz =3D {
> +       .irq_mask =3D CEU_CETCR_ALL_IRQS_RZ,
> +};
> +
>  static const struct of_device_id ceu_of_match[] =3D {
>         { .compatible =3D "renesas,r7s72100-ceu", .data =3D &ceu_data_rz =
},
>         { .compatible =3D "renesas,r8a7740-ceu", .data =3D &ceu_data_rz },
>=20
> base-commit: 10ed1ec9c9cab63310038579c2e1303324bfa44a
> --=20
> Regards,
>=20
> Laurent Pinchart
>
