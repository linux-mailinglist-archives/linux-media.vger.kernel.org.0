Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E23B0597BB4
	for <lists+linux-media@lfdr.de>; Thu, 18 Aug 2022 04:55:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242816AbiHRCui (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Aug 2022 22:50:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242559AbiHRCuh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Aug 2022 22:50:37 -0400
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9352CA3D54
        for <linux-media@vger.kernel.org>; Wed, 17 Aug 2022 19:50:35 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id F29675C010C;
        Wed, 17 Aug 2022 22:50:34 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Wed, 17 Aug 2022 22:50:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm1; t=1660791034; x=1660877434; bh=/6flpciKcY
        SqqeQDhNMEtTLnYUX4ftbazQHJXEDblLI=; b=L8JK8cg6BXI5u04t6ZEVPWfkMs
        TZr/Nl+XE43eTaaudBQmPEDnbt2VvJY9qxaCysJQmqJ7kys2UP/K1hWeOHA6BnSm
        fIYWpyuMfElVL8+lCfNTSaBPJX3XEq432A28nOC+PQKzVKOMtVEymb/HPPVRp6k1
        XYM+nJuKiGTJkTI4Sa3zfFTvHg7aMRq+wT4Bs0mjEItKaDm/woumyDIAyrkXZ2SV
        sidzY+04wl/mzX6u/lEgvO96nan09sj6AOe4LStDj0dtOVmzzlj9Gm4xkjt/VTuL
        labyPm2i6nD99a0bzQtB3m53cn3F8nUwEUlDUOHIgznV6ot6Ji4RcMz3aHvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; t=1660791034; x=1660877434; bh=/6flpciKcYSqqeQDhNMEtTLnYUX4
        ftbazQHJXEDblLI=; b=D7yEo39f1WV8wYCDyuELGrgF4w7WdMeS3KfeABNGSJ+V
        kmngybrgLDTs30zK/84GnDyntYku4JEHEmHEyIFkf3BD7ocqmtJJ1hSbQyjxAVNY
        R1vEKvl/JhVMVb7HFUzr21N9JgEmN4VWSCa/iJE5Ld0+bc6O+B9IXE6VriPzsJUN
        lb/16OwGe1sMbnQviGubW7S6qg2IWnRX9x4S2cmFqEmMYJh7t/OSPS0mK3NvCXkr
        dWnAjWlEdmyOg9aLYKOHiNzMeHdG67TFCucgVAhpqMxjaGm+Vr+vW77h1jfbx4jn
        W2djjfn5qiIZEAHyMpujiP+eeAPV7wdTjpaAIUHgOA==
X-ME-Sender: <xms:-qj9YswbglXeEGw6Xs9W3KjidRakpdI8BurWlRZaJuRGCLFXin3t-g>
    <xme:-qj9YgQ6ZR1-nRGBwq_i5YcjM2XqfT3BfZZb9IftBRNjV_lVpPZudlJa2tJoxa89w
    Sy0KIOrViHVwb-nRA0>
X-ME-Received: <xmr:-qj9YuWjSWF6TLy9P1iw7VyjmIGuW2otEqaH8b_PmgoTiAE-nipyqw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehjedgieehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomhepffgrfhhn
    rgcujfhirhhstghhfhgvlhguuceouggrfhhnrgesfhgrshhtmhgrihhlrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpedvhedtledukeegveelfeeuvddujeeiteehkedvhfetkeffudej
    hfeftdduhedvkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpegurghfnhgrsehfrghsthhmrghilhdrtghomh
X-ME-Proxy: <xmx:-qj9YqjymYedpB-cOjdhHY_EE4cbI5mCi0lRNca8ZPcVF7VRA_Jf1g>
    <xmx:-qj9YuAFs6sfDOAJHgts1tHJtqx_dgKyogBuvepIFPckRIEOgTnbzw>
    <xmx:-qj9YrJc5x2Qzf8CuiSdyA4f0PX56zvmE8eNcaSG-fvFz5tJGL4C8Q>
    <xmx:-qj9Yh_eXD6xqkx3LKac65tia9fVIiKSi_o_DwiGcXqcHiKEO75BxQ>
Feedback-ID: i0e894699:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Aug 2022 22:50:32 -0400 (EDT)
Date:   Thu, 18 Aug 2022 05:50:29 +0300
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
        linux-rockchip@lists.infradead.org,
        Paul Elder <paul.elder@ideasonboard.com>,
        Florian Sylvestre <fsylvestre@baylibre.com>
Subject: Re: [PATCH 4/5] media: rkisp1: Use RKISP1_CIF_ISP_LSC_GRAD_SIZE()
 for gradient registers
Message-ID: <20220818025029.y4jbmpzgnebla4t2@guri>
References: <20220817021850.20460-1-laurent.pinchart@ideasonboard.com>
 <20220817021850.20460-5-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20220817021850.20460-5-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 17.08.2022 05:18, Laurent Pinchart wrote:
>The rkisp1_lsc_config() function incorrectly uses the
>RKISP1_CIF_ISP_LSC_SECT_SIZE() macro for the gradient registers. Replace
>it with the correct RKISP1_CIF_ISP_LSC_GRAD_SIZE() macro. This doesn't
>cause any functional change as the two macros are defined identically
>(the size and gradient registers store fields in the same number of bits
>at the same positions).
>
>Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>---
> drivers/media/platform/rockchip/rkisp1/rkisp1-params.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
>index aa6efa4c6e9e..421ade177b2d 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
>@@ -334,7 +334,7 @@ static void rkisp1_lsc_config(struct rkisp1_params *params,
> 		rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_XSIZE(i), data);
>
> 		/* program x grad tables */
>-		data = RKISP1_CIF_ISP_LSC_SECT_SIZE(arg->x_grad_tbl[i * 2],
>+		data = RKISP1_CIF_ISP_LSC_GRAD_SIZE(arg->x_grad_tbl[i * 2],
> 						    arg->x_grad_tbl[i * 2 + 1]);

maybe the GRAD macro should change to:

RKISP1_CIF_ISP_LSC_SECT_GRAD

?

thanks,
Dafna

> 		rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_XGRAD(i), data);
>
>@@ -344,7 +344,7 @@ static void rkisp1_lsc_config(struct rkisp1_params *params,
> 		rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_YSIZE(i), data);
>
> 		/* program y grad tables */
>-		data = RKISP1_CIF_ISP_LSC_SECT_SIZE(arg->y_grad_tbl[i * 2],
>+		data = RKISP1_CIF_ISP_LSC_GRAD_SIZE(arg->y_grad_tbl[i * 2],
> 						    arg->y_grad_tbl[i * 2 + 1]);
> 		rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_YGRAD(i), data);
> 	}
>-- 
>Regards,
>
>Laurent Pinchart
>
