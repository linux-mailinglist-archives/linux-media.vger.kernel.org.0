Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 414B22C3DCE
	for <lists+linux-media@lfdr.de>; Wed, 25 Nov 2020 11:39:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728965AbgKYKgp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Nov 2020 05:36:45 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:59065 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728722AbgKYKgp (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Nov 2020 05:36:45 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cgy4B38MMz9sRK;
        Wed, 25 Nov 2020 21:36:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
        s=201909; t=1606300603;
        bh=+Ql0ikB0o4IWTRBf/l8Y9JD7N/oyypkLmxgmAWBEpug=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=Yw1VxOVdyjZr/QOpb8Kx8xkIghhqTsEoIZoBdx2IwYisDBngTAvTTjW9x9I434RAc
         VgOUzO703zaklqprRhDAp41bfdXMIFTffYtH2BLOKVOvmzbmYMmTB2iexrOLiab0AT
         TSoVGTrNN++AUaJtzn9aLA7oPjPMcstjsE2kLaAVipj4sosDdACDXuHUO65RZok9ib
         jnCiLhOcHQDe92TGYbtFv6X1c3riVo6OZVxWqMYftdc+gNORwspgRZr3ZJE82iFWt3
         GuTYq8lTwn3FtWM34uFfRkTL/hxuVFryVJEZ3MhdXWzH33bZBIN7ABcFtxxuWkxZl3
         b3saKghFpcqXg==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Fabio Estevam <festevam@gmail.com>, mchehab@kernel.org
Cc:     hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
        geert@linux-m68k.org, Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] media: fsl-viu: Use the ioread/write32be() accessors
In-Reply-To: <20201120132907.25323-1-festevam@gmail.com>
References: <20201120132907.25323-1-festevam@gmail.com>
Date:   Wed, 25 Nov 2020 21:36:41 +1100
Message-ID: <87im9tzps6.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fabio Estevam <festevam@gmail.com> writes:
> diff --git a/drivers/media/platform/fsl-viu.c b/drivers/media/platform/fsl-viu.c
> index ff625301e777..3ce0decb1826 100644
> --- a/drivers/media/platform/fsl-viu.c
> +++ b/drivers/media/platform/fsl-viu.c
> @@ -434,9 +428,9 @@ inline int buffer_activate(struct viu_dev *dev, struct viu_buf *buf)
>  	if (!V4L2_FIELD_HAS_BOTH(buf->vb.field))
>  		reg_val.dma_inc = 0;
>  
> -	out_be32(&vr->dma_inc, reg_val.dma_inc);
> -	out_be32(&vr->picture_count, reg_val.picture_count);
> -	out_be32(&vr->field_base_addr, reg_val.field_base_addr);
> +	iowrite32be(reg_val.dma_inc, &vr->dma_inc);
> +	iowrite32be(reg_val.picture_count, &vr->picture_count);
> +	iowrite32be(reg_val.field_base_addr, &vr->picture_count);

That last conversion is wrong.

cheers
