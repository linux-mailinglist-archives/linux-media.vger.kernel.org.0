Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5350A7ADD75
	for <lists+linux-media@lfdr.de>; Mon, 25 Sep 2023 18:52:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232611AbjIYQwL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Sep 2023 12:52:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229905AbjIYQwI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Sep 2023 12:52:08 -0400
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 818BA9F
        for <linux-media@vger.kernel.org>; Mon, 25 Sep 2023 09:52:01 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BFD661BF205;
        Mon, 25 Sep 2023 16:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1695660719;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XczhPYZNeqwcHiTjly+eLnqgfHC3f7wBBLkqeWpDk1s=;
        b=Ly78P39IYBWVvn20ydGHD28/AHB0BcoSrqL0Q6a2TV4HLHtXeNYRSg6URvunID1fJVUTG1
        /Rp93kAfR0jP0ZNW/NXuzBaHsDzasyXUVmnZQyj/TfzJzcsLu3g/EGkBDoZ9wkMkw+GYPy
        FIrayXj+QhqU3iRlNarT0quomhvbyfSWYPv4dEIBdGWAOpW7LBA8tjKcRMbPAInvVzI+DB
        6ttLhGQxgGrOBC6VcPBEX/Zp02jjd3O/Uq/i9+ZdSDEk8akrw7NluHpahUSsNtCHcCeclb
        nz185y1fDH05ULLMT4k1xSudPx6c8RLlMe0TA31xpZmrBt69aJNUF3m1RrDNdQ==
Date:   Mon, 25 Sep 2023 18:51:57 +0200
From:   Luca Ceresoli <luca.ceresoli@bootlin.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Niklas =?UTF-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCHv2 13/23] media: use sizeof() instead of
 V4L2_SUBDEV_NAME_SIZE
Message-ID: <20230925185157.15c181e6@booty>
In-Reply-To: <20230923152107.283289-14-hverkuil-cisco@xs4all.nl>
References: <20230923152107.283289-1-hverkuil-cisco@xs4all.nl>
        <20230923152107.283289-14-hverkuil-cisco@xs4all.nl>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Sat, 23 Sep 2023 17:20:57 +0200
Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:

> Don't rely on a define, let the compiler use the actual
> field size.
>=20
> Remove all uses of the V4L2_SUBDEV_NAME_SIZE define and also
> drop the define itself.
>=20
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>
> Cc: Sowjanya Komatineni <skomatineni@nvidia.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/i2c/msp3400-driver.c                  | 2 +-
>  drivers/media/platform/cadence/cdns-csi2rx.c        | 4 ++--
>  drivers/media/platform/cadence/cdns-csi2tx.c        | 4 ++--
>  drivers/media/platform/renesas/rcar-isp.c           | 2 +-
>  drivers/media/platform/renesas/rcar-vin/rcar-csi2.c | 2 +-
>  drivers/media/platform/ti/omap3isp/ispstat.c        | 2 +-
>  drivers/staging/media/tegra-video/csi.c             | 4 ++--
>  drivers/staging/media/tegra-video/vip.c             | 2 +-

For tegra-video:
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

I wanted to test it to be extra safe but discovered a regression that
broke probing of the VI driver, so I am now investigating that.

Luca

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
