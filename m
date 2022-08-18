Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 255AA597B96
	for <lists+linux-media@lfdr.de>; Thu, 18 Aug 2022 04:41:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242520AbiHRCjp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Aug 2022 22:39:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239758AbiHRCjo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Aug 2022 22:39:44 -0400
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CADC59BB4B
        for <linux-media@vger.kernel.org>; Wed, 17 Aug 2022 19:39:43 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 20E3A5C01AA;
        Wed, 17 Aug 2022 22:39:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Wed, 17 Aug 2022 22:39:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm1; t=1660790383; x=1660876783; bh=0UMjzrOPfC
        CIi/3a2S1KGkKaCVMB7rOXiZlyRaT5lsY=; b=jQZwfOkr7f/OtaUy0235764faZ
        A5/OS3j4fDAOjKP22lnrnYI4xACRXyUX1lgNoZyZZbd7IaNRrHp89h6KYz2GyYHZ
        ECOdzWCT1zO97i4IaidckPooQ04EfjdGVbVj81YhvH6FoeCLZY4YmILJ6b5FFBtE
        Y4xtIXCemj42k+xNIv7KFw/avrGt6cXIvrQYfGXbE3w8Xj080pCrMWxvX7nU+zsn
        zLwqoIMeYohB/+qDKx6UrVcFjas65+tYZb1M/Mivj3ziBOESaZKKBBaA3FxkX+fH
        tFuJ7tvuzg6K67UcHPTMLr1HanDMf6ICt7jSdrG5EEDPE3GiGyqC7ASZuvig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; t=1660790383; x=1660876783; bh=0UMjzrOPfCCIi/3a2S1KGkKaCVMB
        7rOXiZlyRaT5lsY=; b=3Xk1xYvU4jrtTanJu8N1sJ9Sbvu9kphcXR/c7wvb/O9H
        x6qv2AO/SkWY4jz6ue2wT0cgeaCaXacZ5w2jF6ZwDBGmGDqV62MSDhu2qVcLktOV
        3m0I9HLt50HfBXD4P4ZTVZp5noY1Ac6SzyhNBoAxdcL20PTJ1juZsvxhtvlpjZS1
        fdRVu098zEh7VJqOQwlnvA3tBsHhX9mPV0k8HuvsqFoy2rEx0VMUcZsd6jxRb8PO
        5odYf2KomA8mru5kzS3v9W4esMuvuHNL0HTRjqhidYsW1jKNAeLAkI8CPXEiUgZP
        y3ocuGgFvCUX0cgK3uZXM60iK1gunTQYxRlShH17jQ==
X-ME-Sender: <xms:bqb9Ynx61An0JRkk-iLwrLwHDSrWFGWoHdogF_TA830SIdpfS98HZw>
    <xme:bqb9YvSqyc_GKn4d_XKtWunUB7EgEc0AbZflbwp1W6ynGd5TZ81Pj7lRVi1IsLq_d
    SSYlvqKqHGc-JlTSeM>
X-ME-Received: <xmr:bqb9YhVaxdAta43720rnfl4LhCo4-9gtmFo0EyAlHzXFQpsyiArmMw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehjedgieefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomhepffgrfhhn
    rgcujfhirhhstghhfhgvlhguuceouggrfhhnrgesfhgrshhtmhgrihhlrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpedvhedtledukeegveelfeeuvddujeeiteehkedvhfetkeffudej
    hfeftdduhedvkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpegurghfnhgrsehfrghsthhmrghilhdrtghomh
X-ME-Proxy: <xmx:bqb9YhilNbni4v0ZWE6ePlHmvMNDlCE2g-8rv4acCuadeG4wchs3DA>
    <xmx:bqb9YpCfjkxMLUKwqY7HD_nPVcMLI5tWja1eIQWEvDlECW17A1bshw>
    <xmx:bqb9YqLsuzWhUiJQbgQaP2juhw-Fpag8gN6Rph1KSPOl8ZaK8YaeIQ>
    <xmx:b6b9Yk-9kXNGTH7VNwCGddveWyWBvwIoCJBC_p1yRMb1VO9U28mXQw>
Feedback-ID: i0e894699:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Aug 2022 22:39:40 -0400 (EDT)
Date:   Thu, 18 Aug 2022 05:39:38 +0300
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
        linux-rockchip@lists.infradead.org,
        Paul Elder <paul.elder@ideasonboard.com>,
        Florian Sylvestre <fsylvestre@baylibre.com>
Subject: Re: [PATCH 3/5] media: rkisp1: Simplify LSC x/y size and grad
 register macros
Message-ID: <20220818023938.aslenrngaat5y5o6@guri>
References: <20220817021850.20460-1-laurent.pinchart@ideasonboard.com>
 <20220817021850.20460-4-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20220817021850.20460-4-laurent.pinchart@ideasonboard.com>
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
>The LSC module x/y size and grad configuration is stored in a set of 4
>indexed registers each. The rkisp1-regs.h header defines all those
>registers, but only the first one in each set is used, with manual
>calculation of addresses of subsequent registers. Simplifies this by
>merging all 4 register macros into one that takes the index as a
>parameter. No functional change intended.
>
>Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>

>---
> .../platform/rockchip/rkisp1/rkisp1-params.c  |  8 ++++----
> .../platform/rockchip/rkisp1/rkisp1-regs.h    | 20 ++++---------------
> 2 files changed, 8 insertions(+), 20 deletions(-)
>
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
>index dbe826fd02d2..aa6efa4c6e9e 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
>@@ -331,22 +331,22 @@ static void rkisp1_lsc_config(struct rkisp1_params *params,
> 		/* program x size tables */
> 		data = RKISP1_CIF_ISP_LSC_SECT_SIZE(arg->x_size_tbl[i * 2],
> 						    arg->x_size_tbl[i * 2 + 1]);
>-		rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_XSIZE_01 + i * 4, data);
>+		rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_XSIZE(i), data);
>
> 		/* program x grad tables */
> 		data = RKISP1_CIF_ISP_LSC_SECT_SIZE(arg->x_grad_tbl[i * 2],
> 						    arg->x_grad_tbl[i * 2 + 1]);
>-		rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_XGRAD_01 + i * 4, data);
>+		rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_XGRAD(i), data);
>
> 		/* program y size tables */
> 		data = RKISP1_CIF_ISP_LSC_SECT_SIZE(arg->y_size_tbl[i * 2],
> 						    arg->y_size_tbl[i * 2 + 1]);
>-		rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_YSIZE_01 + i * 4, data);
>+		rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_YSIZE(i), data);
>
> 		/* program y grad tables */
> 		data = RKISP1_CIF_ISP_LSC_SECT_SIZE(arg->y_grad_tbl[i * 2],
> 						    arg->y_grad_tbl[i * 2 + 1]);
>-		rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_YGRAD_01 + i * 4, data);
>+		rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_YGRAD(i), data);
> 	}
>
> 	/* restore the lsc ctrl status */
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
>index 044af3d6e4f3..2ad24deedec8 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
>@@ -1162,22 +1162,10 @@
> #define RKISP1_CIF_ISP_LSC_GR_TABLE_DATA	(RKISP1_CIF_ISP_LSC_BASE + 0x00000018)
> #define RKISP1_CIF_ISP_LSC_B_TABLE_DATA		(RKISP1_CIF_ISP_LSC_BASE + 0x0000001C)
> #define RKISP1_CIF_ISP_LSC_GB_TABLE_DATA	(RKISP1_CIF_ISP_LSC_BASE + 0x00000020)
>-#define RKISP1_CIF_ISP_LSC_XGRAD_01		(RKISP1_CIF_ISP_LSC_BASE + 0x00000024)
>-#define RKISP1_CIF_ISP_LSC_XGRAD_23		(RKISP1_CIF_ISP_LSC_BASE + 0x00000028)
>-#define RKISP1_CIF_ISP_LSC_XGRAD_45		(RKISP1_CIF_ISP_LSC_BASE + 0x0000002C)
>-#define RKISP1_CIF_ISP_LSC_XGRAD_67		(RKISP1_CIF_ISP_LSC_BASE + 0x00000030)
>-#define RKISP1_CIF_ISP_LSC_YGRAD_01		(RKISP1_CIF_ISP_LSC_BASE + 0x00000034)
>-#define RKISP1_CIF_ISP_LSC_YGRAD_23		(RKISP1_CIF_ISP_LSC_BASE + 0x00000038)
>-#define RKISP1_CIF_ISP_LSC_YGRAD_45		(RKISP1_CIF_ISP_LSC_BASE + 0x0000003C)
>-#define RKISP1_CIF_ISP_LSC_YGRAD_67		(RKISP1_CIF_ISP_LSC_BASE + 0x00000040)
>-#define RKISP1_CIF_ISP_LSC_XSIZE_01		(RKISP1_CIF_ISP_LSC_BASE + 0x00000044)
>-#define RKISP1_CIF_ISP_LSC_XSIZE_23		(RKISP1_CIF_ISP_LSC_BASE + 0x00000048)
>-#define RKISP1_CIF_ISP_LSC_XSIZE_45		(RKISP1_CIF_ISP_LSC_BASE + 0x0000004C)
>-#define RKISP1_CIF_ISP_LSC_XSIZE_67		(RKISP1_CIF_ISP_LSC_BASE + 0x00000050)
>-#define RKISP1_CIF_ISP_LSC_YSIZE_01		(RKISP1_CIF_ISP_LSC_BASE + 0x00000054)
>-#define RKISP1_CIF_ISP_LSC_YSIZE_23		(RKISP1_CIF_ISP_LSC_BASE + 0x00000058)
>-#define RKISP1_CIF_ISP_LSC_YSIZE_45		(RKISP1_CIF_ISP_LSC_BASE + 0x0000005C)
>-#define RKISP1_CIF_ISP_LSC_YSIZE_67		(RKISP1_CIF_ISP_LSC_BASE + 0x00000060)
>+#define RKISP1_CIF_ISP_LSC_XGRAD(n)		(RKISP1_CIF_ISP_LSC_BASE + 0x00000024 + (n) * 4)
>+#define RKISP1_CIF_ISP_LSC_YGRAD(n)		(RKISP1_CIF_ISP_LSC_BASE + 0x00000034 + (n) * 4)
>+#define RKISP1_CIF_ISP_LSC_XSIZE(n)		(RKISP1_CIF_ISP_LSC_BASE + 0x00000044 + (n) * 4)
>+#define RKISP1_CIF_ISP_LSC_YSIZE(n)		(RKISP1_CIF_ISP_LSC_BASE + 0x00000054 + (n) * 4)
> #define RKISP1_CIF_ISP_LSC_TABLE_SEL		(RKISP1_CIF_ISP_LSC_BASE + 0x00000064)
> #define RKISP1_CIF_ISP_LSC_STATUS		(RKISP1_CIF_ISP_LSC_BASE + 0x00000068)
>
>-- 
>Regards,
>
>Laurent Pinchart
>
