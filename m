Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A239599354
	for <lists+linux-media@lfdr.de>; Fri, 19 Aug 2022 05:11:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344185AbiHSDFr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Aug 2022 23:05:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243435AbiHSDFp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Aug 2022 23:05:45 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40CDDDABA2
        for <linux-media@vger.kernel.org>; Thu, 18 Aug 2022 20:05:44 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id x19so433401pfq.1
        for <linux-media@vger.kernel.org>; Thu, 18 Aug 2022 20:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc;
        bh=LPfXpj+FEBJ+yW3DuIoKZiPeyoOvD7ATifrj7SiRAq0=;
        b=NQ9XJzT8HZHhYioRTSbr+3mL6nvQ+54VTOyANi39zNn3wCIulTD1fRKANJHXB7Z1hD
         rUX1snl+hy8RO5wPpYOKae+kjbBMAiX92Ih3gPfpn7J5UUoNrbdZzkRUigB/94rMfQwF
         f2kDvWyafGDTnDPJmdCG7iVid4LqUlIPffYc6Dph1QgI+BxC//EAKCVUzMsC7R4mfZqP
         TS8+vpTrfoUNQKUG+uGCloaDGNx0czLce2afGRfY1/7f/ggFrxjAKu4VVWydTXsdvZvi
         Dr4a3E4jhr0iCqC8rZSd7RUgsLMmyXNPzAtvN/b4Frkgw2yc70LAPln2al2XdZp2X9dy
         LhYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc;
        bh=LPfXpj+FEBJ+yW3DuIoKZiPeyoOvD7ATifrj7SiRAq0=;
        b=wvh/U4nAWn1NkzfE1eXsA/7LIkJDVcMkdOTFYUJ3G0h5LoCO9Kd95p2IU32A1ZKKWd
         lliVmhItnEr3T0Bu5QLKmojD/sv5w4fXojqTKIDJORKu4idmCZpozocU/IXRhhG+LoFS
         uhYaXjed8fdJVH57IFrTMzRAxhRX+LRIQL1D/s1v1u1rNdZeSsbAo1yjVWV27PdbkKPS
         okbkt6d0qOrl+eSkWb2enED0a1zF1Bjdv0JZpfTK5sPYkZMB7ElllZoCtEZFpBRqYuS5
         B4dtaAp9IjfcB4A9Yk4FML5DNqbNBqidVS4p26kceJ0SFrMDA6US2ErFXLJCWNow2iXv
         p3BA==
X-Gm-Message-State: ACgBeo2MObgHzZTWL4Inj0X04FGgqwz9NG5dXxuRxstmsLWeiIClKAd/
        2IWR+FJOVpxRGJPxgZRtc3raKA==
X-Google-Smtp-Source: AA6agR7DH7phg2+wV73JgLrmj4KOjSYQezBdQe0JdBFkDsvsvCC92aX0SqZ6j9rrdRw5x/6oLqfmUw==
X-Received: by 2002:a65:6e82:0:b0:41a:9b73:f0e6 with SMTP id bm2-20020a656e82000000b0041a9b73f0e6mr4790954pgb.371.1660878343757;
        Thu, 18 Aug 2022 20:05:43 -0700 (PDT)
Received: from smtpclient.apple (napt.igel.co.jp. [219.106.231.132])
        by smtp.gmail.com with ESMTPSA id q16-20020aa78430000000b0052e78582aa2sm2338453pfn.181.2022.08.18.20.05.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Aug 2022 20:05:43 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH v2 2/3] drm: rcar-du: Add DRM_MODE_BLEND_PREMULTI support
From:   Takanari Hayama <taki@igel.co.jp>
In-Reply-To: <Yv7wjIx+NLe5iqQn@pendragon.ideasonboard.com>
Date:   Fri, 19 Aug 2022 12:05:40 +0900
Cc:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie,
        daniel@ffwll.ch, mchehab@kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <034737B5-024D-4E65-B4E4-F63C873A2B4A@igel.co.jp>
References: <20220810083711.219642-1-taki@igel.co.jp>
 <20220810083711.219642-3-taki@igel.co.jp>
 <Yv7wjIx+NLe5iqQn@pendragon.ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

> 2022/08/19 11:08=E3=80=81Laurent Pinchart =
<laurent.pinchart@ideasonboard.com>=E3=81=AE=E3=83=A1=E3=83=BC=E3=83=AB:
>=20
> Hello Hayama-san,
>=20
> Thank you for the patch.
>=20
> On Wed, Aug 10, 2022 at 05:37:10PM +0900, Takanari Hayama wrote:
>> R-Car DU driver implicitly supports DRM_MODE_BLEND_COVERAGE only.
>> This adds a support for DRM_MODE_BLEND_PREMULTI. As a consequence,
>> DRM_MODE_BLEND_PREMULTI becomes the default. If =
DRM_MODE_BLEND_COVERAGE
>> is desired, it should be set explicitly.
>>=20
>> This behavior comes from how DRM blend mode is supported.
>> drm_plane_create_blend_mode_property() creates the blend mode =
property
>> with the default value of DRM_MODE_BLEND_PREMULTI. This default value
>> cannot be modified from the atomic driver.
>>=20
>> Signed-off-by: Takanari Hayama <taki@igel.co.jp>
>> ---
>> drivers/gpu/drm/rcar-du/rcar_du_vsp.c | 6 ++++++
>> 1 file changed, 6 insertions(+)
>>=20
>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c =
b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
>> index 8eb9b2b097ae..b9580fcfec7a 100644
>> --- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
>> @@ -167,6 +167,8 @@ static void rcar_du_vsp_plane_setup(struct =
rcar_du_vsp_plane *plane)
>> 		cfg.mem[i] =3D sg_dma_address(state->sg_tables[i].sgl)
>> 			   + fb->offsets[i];
>>=20
>> +	cfg.premult =3D (state->state.pixel_blend_mode =3D=3D =
DRM_MODE_BLEND_PREMULTI);
>=20
> I'll drop the parentheses here too, and if you don't mind, I'll move
> this down after setting cfg.pixelformat, as premult qualifies the =
format
> so it's more logical in that reading order (no change on the behaviour
> of course).

Thank you. I also agree with the proposed change in order.

> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>=20
>> +
>> 	format =3D rcar_du_format_info(state->format->fourcc);
>> 	cfg.pixelformat =3D format->v4l2;
>>=20
>> @@ -444,6 +446,10 @@ int rcar_du_vsp_init(struct rcar_du_vsp *vsp, =
struct device_node *np,
>> 						       num_planes - 1);
>> 		}
>>=20
>> +		drm_plane_create_blend_mode_property(&plane->plane,
>> +					BIT(DRM_MODE_BLEND_PREMULTI) |
>> +					BIT(DRM_MODE_BLEND_COVERAGE));
>> +
>> 		vsp->num_planes++;
>> 	}
>>=20
>=20
> --=20
> Regards,
>=20
> Laurent Pinchart

Cheers,
Takanari Hayama, Ph.D. <taki@igel.co.jp>
IGEL Co., Ltd.
https://www.igel.co.jp/

