Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20F1E57A12E
	for <lists+linux-media@lfdr.de>; Tue, 19 Jul 2022 16:20:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239188AbiGSOUZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Jul 2022 10:20:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235604AbiGSOTg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Jul 2022 10:19:36 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B7E32631;
        Tue, 19 Jul 2022 06:59:01 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E00676EE;
        Tue, 19 Jul 2022 15:58:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1658239139;
        bh=irTaZmM+ObM/f2jHCsgtAKiX+yda+twRdLB2IFOgxSI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=m0W1Eq7cMs4nXdLxm3MHugqOAdtAjR6abOfl51aE1R6wXYqKoXK2TrKJqHf3qM1JE
         o0AdEEz+Cx4AiJDg/O1ZIht+1ctqmvSc9nSEcXEfM2vvbZeU9NM6UqQikIDnQMrUSL
         ZQKC0bmMQKbFUTydZBcFT8qXtvRsnX07zt/CuKEU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <Yta15OckATLKf6DF@kili>
References: <Yta15OckATLKf6DF@kili>
Subject: Re: [PATCH] media: vimc: fix an error code in vimc_create_links()
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Yunke Cao <yunkec@google.com>
Date:   Tue, 19 Jul 2022 14:58:56 +0100
Message-ID: <165823913604.2021905.13300600564840687711@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dan,

Quoting Dan Carpenter (2022-07-19 14:47:16)
> Use the correct "ret_link" variable instead of "link".
>=20
> Fixes: d534b9520a12 ("media: vimc: add ancillary lens")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks for the patch, but it's been preceeded twice now.

[0] https://lore.kernel.org/linux-media/4fd23b1c-8a0a-1691-a4f9-526ec99bd19=
3@xs4all.nl/
[1] https://lore.kernel.org/linux-media/20220719071721.703986-1-yangyinglia=
ng@huawei.com/

--
Kieran


> ---
>  drivers/media/test-drivers/vimc/vimc-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
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
> --=20
> 2.35.1
>
