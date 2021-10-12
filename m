Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FFF242A4DF
	for <lists+linux-media@lfdr.de>; Tue, 12 Oct 2021 14:50:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236541AbhJLMwu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Oct 2021 08:52:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236326AbhJLMws (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Oct 2021 08:52:48 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A87BC061570;
        Tue, 12 Oct 2021 05:50:47 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 878BEE7;
        Tue, 12 Oct 2021 14:50:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1634043045;
        bh=VLomMBmnQc4g3tC66N5dZQVnBN/SyHIeZL2mvS4mRuU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=p7sKXRyxWirW+xJlmGK+r237SFuIMm9HZUIInCKBgEWPPBLzEIjIuIeSkKxk4vc26
         jcVB62VS4ryAoGO69Wt849sxV/iqHxZuYgkC64NqwqYonGXSYaJHqupJKQNQcgRxt6
         EMHkHu/0CQyvwMaLn/rN69qDwRPO0MNbbam0SZ8c=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211010175457.438627-1-mike.rudenko@gmail.com>
References: <20211010175457.438627-1-mike.rudenko@gmail.com>
Subject: Re: [PATCH] media: rockchip: rkisp1: use device name for debugfs subdir name
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Mikhail Rudenko <mike.rudenko@gmail.com>,
        Helen Koike <helen.koike@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To:     Mikhail Rudenko <mike.rudenko@gmail.com>,
        linux-media@vger.kernel.org
Date:   Tue, 12 Oct 2021 13:50:43 +0100
Message-ID: <163404304327.2976390.18225391015638170307@Monstersaurus>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mikhail,

Quoting Mikhail Rudenko (2021-10-10 18:54:57)
> While testing Rockchip RK3399 with both ISPs enabled, a dmesg error
> was observed:
> ```
> [   15.559141] debugfs: Directory 'rkisp1' with parent '/' already presen=
t!
> ```
>=20
> Fix it by using the device name for the debugfs subdirectory name
> instead of the driver name, thus preventing name collision.
>=20
> Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>
> ---
>  drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/driver=
s/media/platform/rockchip/rkisp1/rkisp1-dev.c
> index 7474150b94ed..560f928c3752 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> @@ -426,7 +426,7 @@ static void rkisp1_debug_init(struct rkisp1_device *r=
kisp1)
>  {
>         struct rkisp1_debug *debug =3D &rkisp1->debug;
> =20
> -       debug->debugfs_dir =3D debugfs_create_dir(RKISP1_DRIVER_NAME, NUL=
L);
> +       debug->debugfs_dir =3D debugfs_create_dir(dev_name(rkisp1->dev), =
NULL);

I would wonder if they should be grouped under a subdir called rkisp1
... but that would then still keep the same issue that whichever was
second to probe would find that /rkisp1 was already present. I suspect
debugfs would make it possible to check if the parent was already there
and only create it if it exists, but anyway, it would then be harder to
clean up too.

So separate based on the nodes sounds perfectly reasonable to me.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

>         debugfs_create_ulong("data_loss", 0444, debug->debugfs_dir,
>                              &debug->data_loss);
>         debugfs_create_ulong("outform_size_err", 0444,  debug->debugfs_di=
r,
> --=20
> 2.33.0
>
