Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D3FD6FCB3C
	for <lists+linux-media@lfdr.de>; Tue,  9 May 2023 18:21:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229550AbjEIQU7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 May 2023 12:20:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbjEIQU6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 May 2023 12:20:58 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B16B01BDF
        for <linux-media@vger.kernel.org>; Tue,  9 May 2023 09:20:56 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-96622bca286so691286066b.1
        for <linux-media@vger.kernel.org>; Tue, 09 May 2023 09:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=yngvason.is; s=google; t=1683649255; x=1686241255;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ysxcmg33z3TkJckY07k1ph9gX5Ru2lXBSM10WSn2Y84=;
        b=MjeR4objWi9sLS3I39DMB9r46lT5HhDY7guiAfUZVxOniuuwBwfN+45MNRcCpt041B
         U5HNAkGqAa271lIcJTogCEAs1uEAn3vhLcCy2R9eHqdpB6RdBYZ8EoCA/HhIGcS8xuCe
         wS14dZ61cXE733flLNeGhMMWqw1sgIPmPLABc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683649255; x=1686241255;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ysxcmg33z3TkJckY07k1ph9gX5Ru2lXBSM10WSn2Y84=;
        b=MQgoyVA2KSgYXo5MWFmZDbTMqSqtCqKKWuB7uPjSK1+su327KpGHguYYj3M2sWaP/W
         U9BJL2kmt8dwLirl52pinR6OrmFZIyr1H9tl7C2NAm8iCWUnmW5T3NynMwekeWHKc2/X
         OK+xDkopDADsI7/GAY8OGrEat6vKqg2sSgy+2DX3t+kTm2PX5MeWpcPLmFjlcvpmSqt3
         LH5tVhQNGkYPircUxdY+F/7FketCwi74pvROqTLf4wrEdZvuIf4mS0dIaqPxogA935Nv
         AP2qGWht7FySv6Gd+nZuBx2SCRBiSS+CN3H08JvqSZIWQ5p1v9mjL4xDamJwfZScbJ8T
         wSMQ==
X-Gm-Message-State: AC+VfDyhXlIgdPirInR4w8UcIJONgfvt0zMwwrO/fRcEWIbj1DFzPGGF
        b8n//g1/GJ2cKNXbYd6hod4iUICrRDIAjfDU1RWgng==
X-Google-Smtp-Source: ACHHUZ52QCNDL1Ci8BCyrOTEQb8eZsqVdnhZAyNLAaXBqcBc60ReLpuautNWnH/j+udl16dNhDFHii+8x0rZVK1O1qI=
X-Received: by 2002:a17:906:eec5:b0:965:bdd1:1d22 with SMTP id
 wu5-20020a170906eec500b00965bdd11d22mr12055164ejb.68.1683649255241; Tue, 09
 May 2023 09:20:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230509150249.824440-1-andri@yngvason.is> <20230509150249.824440-2-andri@yngvason.is>
In-Reply-To: <20230509150249.824440-2-andri@yngvason.is>
From:   Andri Yngvason <andri@yngvason.is>
Date:   Tue, 9 May 2023 16:20:19 +0000
Message-ID: <CAFNQBQyta=tmDDFFtvpBxRV+to73mqs2zKZ9VOojTNnOE60zgg@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: verisilicon: rockchip_vpu2_hw_jpeg_enc: Add
 data_offset to source addresses
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Cc:     Michael Tretter <m.tretter@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

=C3=BEri., 9. ma=C3=AD 2023 kl. 15:03 skrifa=C3=B0i Andri Yngvason <andri@y=
ngvason.is>:
>
> This accommodates planes that are backed by a single dmabuf.
>
> Signed-off-by: Andri Yngvason <andri@yngvason.is>
> ---
>  drivers/media/platform/verisilicon/rockchip_vpu2_hw_jpeg_enc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/verisilicon/rockchip_vpu2_hw_jpeg_enc=
.c b/drivers/media/platform/verisilicon/rockchip_vpu2_hw_jpeg_enc.c
> index 52c76fb91c56..716c248dc2bf 100644
> --- a/drivers/media/platform/verisilicon/rockchip_vpu2_hw_jpeg_enc.c
> +++ b/drivers/media/platform/verisilicon/rockchip_vpu2_hw_jpeg_enc.c
> @@ -99,7 +99,8 @@ static void rockchip_vpu2_jpeg_enc_set_buffers(struct h=
antro_dev *vpu,
>         vepu_write_relaxed(vpu, size_left, VEPU_REG_STR_BUF_LIMIT);
>
>         for (i =3D 0; i < num_planes; i++) {
> -               src =3D vb2_dma_contig_plane_dma_addr(src_buf, i);
> +               src =3D vb2_dma_contig_plane_dma_addr(src_buf, i) +
> +                       src_buf->planes[i].data_offset;
>                 vepu_write_relaxed(vpu, src, __vepu_reg_addr_for_plane(i)=
);
>         }
>  }
> --
> 2.40.1
>

I see now that there is already a patch submitted for this:
https://marc.info/?l=3Dlinux-arm-kernel&m=3D167992346404789&w=3D2

Let's continue with that instead. I can confirm though, that setting
the offset works fine for me.

Regards,
Andri
