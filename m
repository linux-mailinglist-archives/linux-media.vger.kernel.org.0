Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5E104C6CA4
	for <lists+linux-media@lfdr.de>; Mon, 28 Feb 2022 13:35:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235376AbiB1MgS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Feb 2022 07:36:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229997AbiB1MgR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Feb 2022 07:36:17 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 533F47561A;
        Mon, 28 Feb 2022 04:35:38 -0800 (PST)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C6139478;
        Mon, 28 Feb 2022 13:35:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646051736;
        bh=Nw3j4Y+pQIy9OhK4e2iG14PiUvmFZ8PdDJY4tLySleI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=BX/mcIJMmnZF6vZwQwr0l5dq3LfSoZG1iRY69wtOxbn4NuvOGc1+9Ucvks0jDnPRQ
         bL6H/nys0MZfN7wnVJsNrnuqeLd4f5LFmg4uOE7ExCj5+/efyUspWArh2+rKLykKO0
         hgKPT7Z3owuT+WLsLYORrPTsQl7xDvBLY+M01joM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220228120058.9755-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20220228120058.9755-1-laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH] media: v4l: vsp1: Fix offset calculation for plane cropping
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Michael Rodin <mrodin@de.adit-jv.com>,
        LUU HOAI <hoai.luu.ub@renesas.com>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org
Date:   Mon, 28 Feb 2022 12:35:34 +0000
Message-ID: <164605173440.2091767.1596016124776932401@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PDS_OTHER_BAD_TLD,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Laurent Pinchart (2022-02-28 12:00:58)
> From: Michael Rodin <mrodin@de.adit-jv.com>
>=20
> The vertical subsampling factor is currently not considered in the
> offset calculation for plane cropping done in rpf_configure_partition.
> This causes a distortion (shift of the color plane) when formats with
> the vsub factor larger than 1 are used (e.g. NV12, see
> vsp1_video_formats in vsp1_pipe.c). This commit considers vsub factor
> for all planes except plane 0 (luminance).
>=20
> Fixes: e5ad37b64de9 ("[media] v4l: vsp1: Add cropping support")
> Signed-off-by: Michael Rodin <mrodin@de.adit-jv.com>
> Signed-off-by: LUU HOAI <hoai.luu.ub@renesas.com>
>=20
> Drop generalization of the offset calculation to reduce the binary size.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>

Looks fine to me, and I now see that the extra tests identify the
failure experienced and resolve it so...

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/media/platform/vsp1/vsp1_rpf.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/media/platform/vsp1/vsp1_rpf.c b/drivers/media/platf=
orm/vsp1/vsp1_rpf.c
> index 85587c1b6a37..75083cb234fe 100644
> --- a/drivers/media/platform/vsp1/vsp1_rpf.c
> +++ b/drivers/media/platform/vsp1/vsp1_rpf.c
> @@ -291,11 +291,11 @@ static void rpf_configure_partition(struct vsp1_ent=
ity *entity,
>                      + crop.left * fmtinfo->bpp[0] / 8;
> =20
>         if (format->num_planes > 1) {
> +               unsigned int bpl =3D format->plane_fmt[1].bytesperline;
>                 unsigned int offset;
> =20
> -               offset =3D crop.top * format->plane_fmt[1].bytesperline
> -                      + crop.left / fmtinfo->hsub
> -                      * fmtinfo->bpp[1] / 8;
> +               offset =3D crop.top / fmtinfo->vsub * bpl
> +                      + crop.left / fmtinfo->hsub * fmtinfo->bpp[1] / 8;
>                 mem.addr[1] +=3D offset;
>                 mem.addr[2] +=3D offset;
>         }
> --=20
> Regards,
>=20
> Laurent Pinchart
>
