Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A58B595D43
	for <lists+linux-media@lfdr.de>; Tue, 16 Aug 2022 15:27:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235591AbiHPN05 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Aug 2022 09:26:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235573AbiHPN04 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Aug 2022 09:26:56 -0400
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D37CB89926
        for <linux-media@vger.kernel.org>; Tue, 16 Aug 2022 06:26:51 -0700 (PDT)
Received: by mail-qt1-x832.google.com with SMTP id h4so8055770qtj.11
        for <linux-media@vger.kernel.org>; Tue, 16 Aug 2022 06:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc;
        bh=L+rVrGvq+d8rErw7IkPomjBaE4msXtxgOoTyBfI/Uvs=;
        b=HrNF8IiPjBj7qYzxOpTsCaHxNUAUwo6vJj9MOpf+S0DT4HgxduKZMn+qkXFVhLJjmz
         grqIjW1rj3GZelMxZeqpMOAZrBPnLhIq4ZaxnENQhCgQ2A0ZyU90t7+vVLTq2IqzvhWx
         5n0poATzZ/1qP0EcMHj+GOI+dgjA/fwCCt74//jwV2tm9geQE1hzPrn8vXuviviSXfu8
         zST3SGg8vcQW0V+lHDcngqdQ8ck2sY/lGk6dV/GDolajFnW37p21+tcnGgvr0l1WOob5
         WhTQQWw5XE1ILyZ7JfkatrXLx7GwJ/gtWPdv2I76DhQ/VgyrlrBP3lCdilXMX6KlvEnT
         h6lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc;
        bh=L+rVrGvq+d8rErw7IkPomjBaE4msXtxgOoTyBfI/Uvs=;
        b=Be0qpYL+lIyaqiOe4WoRhtfsvsVO7iMSwGnv/1TWPOoxzZWQ5oH3VOH7uvn3KSdpgF
         UZcdpEnTSIE5I/uHA5VBw/dmTFBi/tpl4IU0jOrc6oeCPLXQQs5c10rPy5+UyQFBZ3sw
         wFQC08hOeVQCumCf2LiU1wPcqE1WxypuftPRQZQz9oYqk4aGeR6zfy0U+DzjyHFBsXsQ
         YC79pyamAWZA5a6L7Ax7Oco8u0d6UPEAi63hr2ATXwCxgQs7PfBcJEftgEeH6tcAsPBK
         JOpruLlCfS7en1Ao3KDzQucg1Mr4c61FcAtQYTRv6X3ch9Y2CdTbXwjGVDXU9NCzIWeR
         zsMw==
X-Gm-Message-State: ACgBeo0e9yiJnoDQjfchOxix/jrcfu0vrJCypkbM2ua4bRhVmJVqQoF9
        fiM7Bxl4UGoHK2uLDJ2WHd/xGA==
X-Google-Smtp-Source: AA6agR6ceBOAU6rJgv4m+qE8mymvAedYpLR1dFWqr09KuKi6ZoBj2JqUlen89rxp7DfpAl3RWyjbyg==
X-Received: by 2002:ac8:5a09:0:b0:344:69c7:d405 with SMTP id n9-20020ac85a09000000b0034469c7d405mr5570746qta.158.1660656410998;
        Tue, 16 Aug 2022 06:26:50 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net. [192.222.136.102])
        by smtp.gmail.com with ESMTPSA id w22-20020ac857d6000000b0033c36ef019esm10620910qta.63.2022.08.16.06.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 06:26:50 -0700 (PDT)
Message-ID: <27ba23fa3d060149128c4ba5a880bef43a9df193.camel@ndufresne.ca>
Subject: Re: [PATCH] fixup! media: dw100: Add i.MX8MP dw100 dewarper driver
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com
Cc:     linux-media@vger.kernel.org
Date:   Tue, 16 Aug 2022 09:26:49 -0400
In-Reply-To: <20220804122302.2218906-1-xavier.roumegue@oss.nxp.com>
References: <20220804122302.2218906-1-xavier.roumegue@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-1.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le jeudi 04 ao=C3=BBt 2022 =C3=A0 14:23 +0200, Xavier Roumegue a =C3=A9crit=
=C2=A0:

Perhaps you meant to use a Fixes tag rather then git --fixup feature here ?

> Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
> ---
>  drivers/media/platform/nxp/dw100/dw100.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/drivers/media/platform/nxp/dw100/dw100.c b/drivers/media/pla=
tform/nxp/dw100/dw100.c
> index 651622f8ac8c..94518f0e486b 100644
> --- a/drivers/media/platform/nxp/dw100/dw100.c
> +++ b/drivers/media/platform/nxp/dw100/dw100.c
> @@ -379,14 +379,12 @@ static void dw100_ctrl_dewarping_map_init(const str=
uct v4l2_ctrl *ctrl,
>  	struct dw100_ctx *ctx =3D
>  		container_of(ctrl->handler, struct dw100_ctx, hdl);
> =20
> -	u32 sw, sh, dw, dh, mw, mh, idx;
> +	u32 sw, sh, mw, mh, idx;
>  	u16 qx, qy, qdx, qdy, qsh, qsw;
>  	u32 *map =3D ctrl->p_cur.p_u32;
> =20
>  	sw =3D ctx->q_data[DW100_QUEUE_SRC].pix_fmt.width;
> -	dw =3D ctx->q_data[DW100_QUEUE_DST].pix_fmt.width;
>  	sh =3D ctx->q_data[DW100_QUEUE_SRC].pix_fmt.height;
> -	dh =3D ctx->q_data[DW100_QUEUE_DST].pix_fmt.height;
> =20
>  	mw =3D ctrl->dims[0];
>  	mh =3D ctrl->dims[1];

