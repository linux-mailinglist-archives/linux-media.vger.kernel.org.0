Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A57744E2A3B
	for <lists+linux-media@lfdr.de>; Mon, 21 Mar 2022 15:14:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349184AbiCUOO6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Mar 2022 10:14:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350120AbiCUOJX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Mar 2022 10:09:23 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2FE933378
        for <linux-media@vger.kernel.org>; Mon, 21 Mar 2022 07:04:05 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B9450291;
        Mon, 21 Mar 2022 15:03:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647871422;
        bh=uBkEG1fWqITGVX2c8xTqBD7rBPB1mzcSSjakWCeb4OU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=AXZ45cRWRZIZa6JF+V7UGP3vNsJuyipmeWaU6oKgG0jUQ7rziO5ZmP4DsCup7hRAw
         d2GR/bvGWAxp+3WQd9PukQ4LrVbWu0CvCj0QItxAaYOVxk8O4NcEm/GPmM1Awr+KrY
         /JkfVZtxLV2iyQ38lGMzEK2EY/LuRW0dBAA70A3w=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220318203735.5923-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20220318203735.5923-1-laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH] media: nxp: Restrict VIDEO_IMX_MIPI_CSIS to ARCH_MXC or COMPILE_TEST
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org
Date:   Mon, 21 Mar 2022 14:03:40 +0000
Message-ID: <164787142019.2130830.13984147252804710886@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Laurent Pinchart (2022-03-18 20:37:35)
> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>=20
> The imx-mipi-csis driver is specific to NXP platforms. Restrict it to
> those by default, and enable compilation with COMPILE_TEST to keep a
> wide test coverage.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/media/platform/nxp/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/media/platform/nxp/Kconfig b/drivers/media/platform/=
nxp/Kconfig
> index 7473096f5885..28f2bafc14d2 100644
> --- a/drivers/media/platform/nxp/Kconfig
> +++ b/drivers/media/platform/nxp/Kconfig
> @@ -6,6 +6,7 @@ comment "NXP media platform drivers"
> =20
>  config VIDEO_IMX_MIPI_CSIS
>         tristate "NXP MIPI CSI-2 CSIS receiver found on i.MX7 and i.MX8 m=
odels"
> +       depends on ARCH_MXC || COMPILE_TEST
>         select MEDIA_CONTROLLER
>         select V4L2_FWNODE
>         select VIDEO_V4L2_SUBDEV_API
>=20
> base-commit: 71e6d0608e4d1b79069990c7dacb3600ced28a3b
> --=20
> Regards,
>=20
> Laurent Pinchart
>
