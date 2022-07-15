Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B87855766EF
	for <lists+linux-media@lfdr.de>; Fri, 15 Jul 2022 20:49:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230287AbiGOStj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jul 2022 14:49:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230190AbiGOSti (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jul 2022 14:49:38 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CC0378216
        for <linux-media@vger.kernel.org>; Fri, 15 Jul 2022 11:49:36 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7D853993;
        Fri, 15 Jul 2022 20:49:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657910974;
        bh=asFJLkZOresR+r7o2QyVjWtesDloCvkq4Vriu4AAaaU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ZWFuW1c9gxG4t0zSkw6LJbYMbxc/lM4GBQ2druF6cv6Nu4zWU4PwomPVnCARowHR9
         7BPQh/ePekPPxtlvUBXS2MH2FhvBzX9FrESy7RvLkNNklHhZzBdCbxJ6FbK5XvnhTG
         ipSszIN1psP8Q139+PIuhp/nrBCez4IQvowp56d8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <4fd23b1c-8a0a-1691-a4f9-526ec99bd193@xs4all.nl>
References: <4fd23b1c-8a0a-1691-a4f9-526ec99bd193@xs4all.nl>
Subject: Re: [PATCH] vimc: wrong pointer is used with PTR_ERR
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Shuah Khan <skhan@linuxfoundation.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Date:   Fri, 15 Jul 2022 19:49:31 +0100
Message-ID: <165791097188.2021905.16989777507421877147@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Hans Verkuil (2022-07-15 16:06:05)
> Fix smatch warning:
>=20
> drivers/media/test-drivers/vimc/vimc-core.c:214 vimc_create_links() warn:=
 passing a valid pointer to 'PTR_ERR'
>=20
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

I guess this could have a fixes tag for "media: vimc: add ancillary
lens", but I can't actually see that commit in
git://linuxtv.org/media_tree.git yet.

Anyway,

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
> diff --git a/drivers/media/test-drivers/vimc/vimc-core.c b/drivers/media/=
test-drivers/vimc/vimc-core.c
> index c73f91947f44..2ae7a0f11ebf 100644
> --- a/drivers/media/test-drivers/vimc/vimc-core.c
> +++ b/drivers/media/test-drivers/vimc/vimc-core.c
> @@ -211,7 +211,7 @@ static int vimc_create_links(struct vimc_device *vimc)
>                         media_create_ancillary_link(ved_primary->ent, ved=
_ancillary->ent);
> =20
>                 if (IS_ERR(ret_link)) {
> -                       ret =3D PTR_ERR(link);
> +                       ret =3D PTR_ERR(ret_link);
>                         goto err_rm_links;
>                 }
>         }
