Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDC1E42EF3C
	for <lists+linux-media@lfdr.de>; Fri, 15 Oct 2021 13:01:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238217AbhJOLDi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Oct 2021 07:03:38 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:52106 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238196AbhJOLDh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Oct 2021 07:03:37 -0400
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4514B2E3;
        Fri, 15 Oct 2021 13:01:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1634295689;
        bh=6i9L33rCLOxyXyIbswmYDzQNFJaXeBH+sGFsWnXWrsw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=iXD2cF3ZyPjZWtHIIE3zGAmXDl/byb/tUdR8rOhDu0NE6Mx4B1h6A41TXrwzCO+jN
         Li/h+asHS5Nr1rhi2AONzPbjna+CMRkrWmCTTHnzg9JO+akdd0NoefktNTBEPGdEDr
         s2ervREjzHLxk36fzFxxr616eUa5TTpiSN/aoYJw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211014151235.62671-1-colin.king@canonical.com>
References: <20211014151235.62671-1-colin.king@canonical.com>
Subject: Re: [PATCH] media: drivers: cx24113: remove redundant variable r
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Colin King <colin.king@canonical.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Date:   Fri, 15 Oct 2021 12:01:26 +0100
Message-ID: <163429568660.4164224.1248800864545725818@Monstersaurus>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Colin King (2021-10-14 16:12:35)
> From: Colin Ian King <colin.king@canonical.com>
>=20
> Variable r is being assigned values but it is never being
> used. The variable is redundant and can be removed.
>=20

Indeed, it gets re-assigned at line 385 as the first cx24113_readreg.


Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/media/dvb-frontends/cx24113.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/dvb-frontends/cx24113.c b/drivers/media/dvb-fr=
ontends/cx24113.c
> index 60a9f70275f7..dd55d314bf9a 100644
> --- a/drivers/media/dvb-frontends/cx24113.c
> +++ b/drivers/media/dvb-frontends/cx24113.c
> @@ -378,7 +378,7 @@ static void cx24113_set_nfr(struct cx24113_state *sta=
te, u16 n, s32 f, u8 r)
> =20
>  static int cx24113_set_frequency(struct cx24113_state *state, u32 freque=
ncy)
>  {
> -       u8 r =3D 1; /* or 2 */
> +       u8 r;
>         u16 n =3D 6;
>         s32 f =3D 0;
> =20
> --=20
> 2.32.0
>
