Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A41A34D99E9
	for <lists+linux-media@lfdr.de>; Tue, 15 Mar 2022 12:04:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347790AbiCOLF6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Mar 2022 07:05:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347785AbiCOLF6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Mar 2022 07:05:58 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 760534AE37
        for <linux-media@vger.kernel.org>; Tue, 15 Mar 2022 04:04:46 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F3EAA1AD5;
        Tue, 15 Mar 2022 12:04:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647342285;
        bh=kc6hRY3OWp3cl6mQUShSQ6V7/PFqbXRN3Y92KZ35kCI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=mNMneXd89oq9SBW00W0jStYMDdu4dA8x5dmlhE5so/3w6YRs9N/V1aAuPimakaNJ1
         soNmEmjcWb+UPNCBec8OybBtzzeoJlwPvG/FFPEJ8lrEUEITpF20LWyNzh2Y0rhIRx
         GjrMOOHa4FLS1jd3nsa7vcnqVW+0UBSe2SggzWgk=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220315102245.15031-1-laurent.pinchart@ideasonboard.com>
References: <20220315102245.15031-1-laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] media: v4l2: mem2mem: Fix typos in v4l2_m2m_dev documentation
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Date:   Tue, 15 Mar 2022 11:04:43 +0000
Message-ID: <164734228302.856468.1265300057896019550@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Quoting Laurent Pinchart (2022-03-15 10:22:45)
> The v4l2_m2m_dev structure documentation incorrectly references the
> v4l2_m2m_unregister_media_controller() function when it actually means
> v4l2_m2m_register_media_controller(). Fix it.
>=20

Eeep, that's a bit of an ooops.

Patch looks good.

I guess Doc-only means no fixes tag required?

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/v4l2-core/v4l2-mem2mem.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-=
core/v4l2-mem2mem.c
> index e2654b422334..ed1280adf7ff 100644
> --- a/drivers/media/v4l2-core/v4l2-mem2mem.c
> +++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
> @@ -68,16 +68,16 @@ static const char * const m2m_entity_name[] =3D {
>   * struct v4l2_m2m_dev - per-device context
>   * @source:            &struct media_entity pointer with the source enti=
ty
>   *                     Used only when the M2M device is registered via
> - *                     v4l2_m2m_unregister_media_controller().
> + *                     v4l2_m2m_register_media_controller().
>   * @source_pad:                &struct media_pad with the source pad.
>   *                     Used only when the M2M device is registered via
> - *                     v4l2_m2m_unregister_media_controller().
> + *                     v4l2_m2m_register_media_controller().
>   * @sink:              &struct media_entity pointer with the sink entity
>   *                     Used only when the M2M device is registered via
> - *                     v4l2_m2m_unregister_media_controller().
> + *                     v4l2_m2m_register_media_controller().
>   * @sink_pad:          &struct media_pad with the sink pad.
>   *                     Used only when the M2M device is registered via
> - *                     v4l2_m2m_unregister_media_controller().
> + *                     v4l2_m2m_register_media_controller().
>   * @proc:              &struct media_entity pointer with the M2M device =
itself.
>   * @proc_pads:         &struct media_pad with the @proc pads.
>   *                     Used only when the M2M device is registered via
> --=20
> Regards,
>=20
> Laurent Pinchart
>
