Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E2FA57B6BC
	for <lists+linux-media@lfdr.de>; Wed, 20 Jul 2022 14:48:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240966AbiGTMsV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jul 2022 08:48:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239258AbiGTMsU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jul 2022 08:48:20 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DD012AE14
        for <linux-media@vger.kernel.org>; Wed, 20 Jul 2022 05:48:18 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 20C436DB;
        Wed, 20 Jul 2022 14:48:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1658321295;
        bh=3BQewCSCcJ6YC3KW50l1ItyaKjSNqmtT2xPibi47J3M=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=hxjEKHddaJqXbzesaXAv4iaXrjjnPWJBnludJmGc9aWhlZHqp4vgV4J40NwN6yd+c
         RLiO4/qM0scBqlPMXNhQHPCKXlk/ejfzZVzg4rYSl1tI2X7wJhh0wbOs312Swqw77F
         VE383sJNF5IoU3k8PEldplVn+pcRlQlls7rfll/c=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220719222432.4356-1-laurent.pinchart@ideasonboard.com>
References: <20220719222432.4356-1-laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] media: rkisp1: Add and use rkisp1_has_feature() macro
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        linux-rockchip@lists.infradead.org
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Date:   Wed, 20 Jul 2022 13:48:12 +0100
Message-ID: <165832129287.2021905.5325737808156196561@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Laurent Pinchart (2022-07-19 23:24:32)
> Simplify feature tests with a macro that shortens lines.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Given how we use it on VSP1 too, I certainly prefer this style of
helper!

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>


> ---
> Sending to the correct mailing list this time, sorry for the noise.
> ---
>  .../media/platform/rockchip/rkisp1/rkisp1-common.h |  3 +++
>  .../media/platform/rockchip/rkisp1/rkisp1-dev.c    | 14 +++++++-------
>  2 files changed, 10 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/dri=
vers/media/platform/rockchip/rkisp1/rkisp1-common.h
> index 8056997d5c29..0aae802464ac 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> @@ -111,6 +111,9 @@ enum rkisp1_feature {
>         RKISP1_FEATURE_MIPI_CSI2 =3D BIT(0),
>  };
> =20
> +#define rkisp1_has_feature(rkisp1, feature) \
> +       ((rkisp1)->info->features & RKISP1_FEATURE_##feature)
> +
>  /*
>   * struct rkisp1_info - Model-specific ISP Information
>   *
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/driver=
s/media/platform/rockchip/rkisp1/rkisp1-dev.c
> index f2475c6235ea..e348d8c86861 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> @@ -206,7 +206,7 @@ static int rkisp1_subdev_notifier_register(struct rki=
sp1_device *rkisp1)
>                 switch (reg) {
>                 case 0:
>                         /* MIPI CSI-2 port */
> -                       if (!(rkisp1->info->features & RKISP1_FEATURE_MIP=
I_CSI2)) {
> +                       if (!rkisp1_has_feature(rkisp1, MIPI_CSI2)) {
>                                 dev_err(rkisp1->dev,
>                                         "internal CSI must be available f=
or port 0\n");
>                                 ret =3D -EINVAL;
> @@ -338,7 +338,7 @@ static int rkisp1_create_links(struct rkisp1_device *=
rkisp1)
>         unsigned int i;
>         int ret;
> =20
> -       if (rkisp1->info->features & RKISP1_FEATURE_MIPI_CSI2) {
> +       if (rkisp1_has_feature(rkisp1, MIPI_CSI2)) {
>                 /* Link the CSI receiver to the ISP. */
>                 ret =3D media_create_pad_link(&rkisp1->csi.sd.entity,
>                                             RKISP1_CSI_PAD_SRC,
> @@ -390,7 +390,7 @@ static int rkisp1_create_links(struct rkisp1_device *=
rkisp1)
> =20
>  static void rkisp1_entities_unregister(struct rkisp1_device *rkisp1)
>  {
> -       if (rkisp1->info->features & RKISP1_FEATURE_MIPI_CSI2)
> +       if (rkisp1_has_feature(rkisp1, MIPI_CSI2))
>                 rkisp1_csi_unregister(rkisp1);
>         rkisp1_params_unregister(rkisp1);
>         rkisp1_stats_unregister(rkisp1);
> @@ -423,7 +423,7 @@ static int rkisp1_entities_register(struct rkisp1_dev=
ice *rkisp1)
>         if (ret)
>                 goto error;
> =20
> -       if (rkisp1->info->features & RKISP1_FEATURE_MIPI_CSI2) {
> +       if (rkisp1_has_feature(rkisp1, MIPI_CSI2)) {
>                 ret =3D rkisp1_csi_register(rkisp1);
>                 if (ret)
>                         goto error;
> @@ -590,7 +590,7 @@ static int rkisp1_probe(struct platform_device *pdev)
>                 goto err_unreg_v4l2_dev;
>         }
> =20
> -       if (rkisp1->info->features & RKISP1_FEATURE_MIPI_CSI2) {
> +       if (rkisp1_has_feature(rkisp1, MIPI_CSI2)) {
>                 ret =3D rkisp1_csi_init(rkisp1);
>                 if (ret)
>                         goto err_unreg_media_dev;
> @@ -611,7 +611,7 @@ static int rkisp1_probe(struct platform_device *pdev)
>  err_unreg_entities:
>         rkisp1_entities_unregister(rkisp1);
>  err_cleanup_csi:
> -       if (rkisp1->info->features & RKISP1_FEATURE_MIPI_CSI2)
> +       if (rkisp1_has_feature(rkisp1, MIPI_CSI2))
>                 rkisp1_csi_cleanup(rkisp1);
>  err_unreg_media_dev:
>         media_device_unregister(&rkisp1->media_dev);
> @@ -630,7 +630,7 @@ static int rkisp1_remove(struct platform_device *pdev)
>         v4l2_async_nf_cleanup(&rkisp1->notifier);
> =20
>         rkisp1_entities_unregister(rkisp1);
> -       if (rkisp1->info->features & RKISP1_FEATURE_MIPI_CSI2)
> +       if (rkisp1_has_feature(rkisp1, MIPI_CSI2))
>                 rkisp1_csi_cleanup(rkisp1);
>         rkisp1_debug_cleanup(rkisp1);
> =20
> --=20
> Regards,
>=20
> Laurent Pinchart
>
