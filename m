Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B6F75B4F25
	for <lists+linux-media@lfdr.de>; Sun, 11 Sep 2022 15:38:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230272AbiIKNi0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 11 Sep 2022 09:38:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230184AbiIKNiZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 11 Sep 2022 09:38:25 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 583822ED74
        for <linux-media@vger.kernel.org>; Sun, 11 Sep 2022 06:38:24 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A42D6415;
        Sun, 11 Sep 2022 15:38:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1662903501;
        bh=iyPzB2jiury+7hRCgo1XGgROGSnx3ibmr2+PZKxN5h4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Tb6swskK66XNx0ga8ctpD+g+UwxAm3u6CDDHKLY2t1K517f9MlKTF/wsdsQpYUZ6U
         nEVNWTDDX5Mb5tGvpYBDPsQW64LAE9y4PjCSE4dM72pHZ40O4HjRFimqc14+q9fxtR
         8oCX+9sWTZkly+sLMyAV+2reQFwTMttcPpd4LY54=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220911091519.3212868-3-cuigaosheng1@huawei.com>
References: <20220911091519.3212868-1-cuigaosheng1@huawei.com> <20220911091519.3212868-3-cuigaosheng1@huawei.com>
Subject: Re: [PATCH 2/8] media: platform: remove unused vsp1_subdev_internal_ops declaration
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org
To:     bunk@kernel.org, clabbe@baylibre.com, crope@iki.fi,
        cuigaosheng1@huawei.com, elezegarcia@gmail.com,
        hans.verkuil@cisco.com, hverkuil-cisco@xs4all.nl,
        laurent.pinchart+renesas@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, linux@rainbow-software.org,
        logans@cottsay.net, m.chehab@samsung.com, mchehab@kernel.org
Date:   Sun, 11 Sep 2022 14:38:19 +0100
Message-ID: <166290349932.1189409.12318656202607870912@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Gaosheng Cui (2022-09-11 10:15:13)
> vsp1_subdev_internal_ops has been removed since
> commit 0efdf0f5eaaf ("[media] v4l: vsp1: Implement and use the
> subdev pad::init_cfg configuration"), so remove it.
>=20
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>

It does look lonely indeed.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/media/platform/renesas/vsp1/vsp1_entity.h | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_entity.h b/drivers/=
media/platform/renesas/vsp1/vsp1_entity.h
> index f22724439cdc..17f98a6a972e 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_entity.h
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_entity.h
> @@ -130,8 +130,6 @@ int vsp1_entity_init(struct vsp1_device *vsp1, struct=
 vsp1_entity *entity,
>                      const struct v4l2_subdev_ops *ops, u32 function);
>  void vsp1_entity_destroy(struct vsp1_entity *entity);
> =20
> -extern const struct v4l2_subdev_internal_ops vsp1_subdev_internal_ops;
> -
>  int vsp1_entity_link_setup(struct media_entity *entity,
>                            const struct media_pad *local,
>                            const struct media_pad *remote, u32 flags);
> --=20
> 2.25.1
>
