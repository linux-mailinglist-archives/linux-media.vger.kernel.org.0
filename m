Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8591458E6E
	for <lists+linux-media@lfdr.de>; Mon, 22 Nov 2021 13:32:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239555AbhKVMgD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Nov 2021 07:36:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239482AbhKVMf7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Nov 2021 07:35:59 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB053C061714;
        Mon, 22 Nov 2021 04:32:52 -0800 (PST)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2F2DD1B40;
        Mon, 22 Nov 2021 13:32:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1637584371;
        bh=QKRF7G2PcQLgRH2yZC8hCKafyAlgqBTJ7BddEaQGc1E=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=qS6myqc7tBnmxkRabheB/pbBFG1CvdypxyZU083SYDCMcGnx/xbU2MTszHfaK2ib/
         BFgsuQqmYx2bcd45adPsHML++9+DFzK0RLpQ2e9+bK7rlIa4AHJfabha+s3LvAu43S
         14dNLSOSv6lkuIXLuqtnqfm+tuVs9UuMkwDyywTs=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211120122321.20253-1-kmcopper@danwin1210.me>
References: <20211120122321.20253-1-kmcopper@danwin1210.me>
Subject: Re: [PATCH] media: rockchip/rga: do proper error checking in probe
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Kyle Copperfield <kmcopper@danwin1210.me>,
        Dragan Simic <dragan.simic@gmail.com>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Kyle Copperfield <kmcopper@danwin1210.me>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Date:   Mon, 22 Nov 2021 12:32:48 +0000
Message-ID: <163758436861.2984710.7560336354232633119@Monstersaurus>
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Kyle Copperfield (2021-11-20 12:23:02)
> The latest fix for probe error handling contained a typo that causes
> probing to fail with the following message:
>=20
>   rockchip-rga: probe of ff680000.rga failed with error -12
>=20
> This patch fixes the typo.
>=20
> Fixes: e58430e1d4fd (media: rockchip/rga: fix error handling in probe)
> Reviewed-by: Dragan Simic <dragan.simic@gmail.com>
> Signed-off-by: Kyle Copperfield <kmcopper@danwin1210.me>
> ---
>  drivers/media/platform/rockchip/rga/rga.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index 6759091b15e0..d99ea8973b67 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -895,7 +895,7 @@ static int rga_probe(struct platform_device *pdev)
>         }
>         rga->dst_mmu_pages =3D
>                 (unsigned int *)__get_free_pages(GFP_KERNEL | __GFP_ZERO,=
 3);
> -       if (rga->dst_mmu_pages) {
> +       if (!rga->dst_mmu_pages) {

Ouch, that indeed looks like it was unhelpful..

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

>                 ret =3D -ENOMEM;
>                 goto free_src_pages;
>         }
> --=20
> 2.34.0
>
