Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3B805A2F9E
	for <lists+linux-media@lfdr.de>; Fri, 26 Aug 2022 21:07:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243811AbiHZTHG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Aug 2022 15:07:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235293AbiHZTHF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Aug 2022 15:07:05 -0400
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4339F65261
        for <linux-media@vger.kernel.org>; Fri, 26 Aug 2022 12:07:04 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id A69EC5C0423;
        Fri, 26 Aug 2022 15:07:03 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Fri, 26 Aug 2022 15:07:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm1; t=1661540823; x=1661627223; bh=Exk195AyM7
        P1/5PWxUSceTzP0jfwUbbF1dWiDPom9Fo=; b=i7G7RlYa7fHAZzuN7we0Q5YU8y
        VckSh4eWKKviwHxjd1xcKijiSiXnbi3MrNyWHf4k0AaS9djWdbU3q3E4dMXnRxse
        xyl5QFceQnuXQ7UAoZDgXibiouJj6IfMdO0Q5W4K0D4p+Qc1Fa1HvqRqjCGGVb/B
        nU7pDQyThdFZE7vnqkug8ZLvg0gF45efTYIiOal78azLPctk26WN7DaEzOCT/fP1
        GkPqZR/4HXAW4J1ji5FmgEFj0NrFhMyA6xmkQZ7FLN8s1WKzOdvlr1/McGxIniTH
        88QmhNK3vHD4tlDAx9eSMny5bLOUcNeaQXwFuiEkASib7kICDJl2e34/E+dw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; t=1661540823; x=1661627223; bh=Exk195AyM7P1/5PWxUSceTzP0jfw
        UbbF1dWiDPom9Fo=; b=SaRjvS1KQaQIbCjJsRxuBH6Zn2quzo0qwFDFcMemj+kt
        EvojNGdaEicoY59yJTp8h4AZi0FMGrlGZHhy9fH200hUe4J4bof9r18firpEOcC5
        0OFodDxHjl+41yAkbZfKWE8aOe2gG9gqspKWNhvB9EF/PX7SykBmxiAZHTGFsLSZ
        N9lVhW46tPE1GSEQtc2qqaZWIvjHwNhi6mk2fB5kuP6dR3Y0vyyBZDcNRCx9MNgL
        BdgDxhPNAcM+8aDVGxpELuI9D6e110+SZ5RtSuVMeXUXrQYdjYxLCTcHFrocexUJ
        lHaSwjQrD1+8zjeKx90MgtOyJzr5jxMNjJa3L8hglA==
X-ME-Sender: <xms:1xkJY4SlrIl0JxVMdqYXO7DlCkosHUtZh7zctNeFD0qBj4U383fFLw>
    <xme:1xkJY1wt3RC-ZqxFk6motktVTbih6KpKn9z3vkvEZIL4O8C8r6qeF-EacPGG4jyUn
    CKNomac34omzCRBIkM>
X-ME-Received: <xmr:1xkJY11QHXUIVei7g3O693jCBAYexuvH2fJkPTBRiMpwqgK_X7UfPA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdejhedgudefvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttdejnecuhfhrohhmpeffrghf
    nhgrucfjihhrshgthhhfvghlugcuoegurghfnhgrsehfrghsthhmrghilhdrtghomheqne
    cuggftrfgrthhtvghrnhepheeivdejhedvffelkeffvdejvdeiheehtdethfdvtdeufeeu
    keelhfetuddugfejnecuffhomhgrihhnpehinhhfrhgruggvrggurdhorhhgnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepuggrfhhnrgesfhgr
    shhtmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:1xkJY8AxTjQQ2gaHntk3QKgFl9xYsL6LcqAwN8iOWsbQjJFPBpC_pA>
    <xmx:1xkJYxhzQR_3hLvuWrwxwNEgOykS19p8ZlI-1gfRcsXO8wJ6W7OS_g>
    <xmx:1xkJY4otTIcYU8TebwlBHRyl8TtfAbn2z_2AQopgZMFh9LSFsbBbyQ>
    <xmx:1xkJYxdhQgDnEoTwr0yyN983At0pCTtaZj-QZICZORvYQZpCvqAwLg>
Feedback-ID: i0e894699:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 26 Aug 2022 15:07:01 -0400 (EDT)
Date:   Fri, 26 Aug 2022 22:06:58 +0300
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Florian Sylvestre <fsylvestre@baylibre.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: Re: [PATCH v1.1 4/5] media: rkisp1: Use correct macro for gradient
 registers
Message-ID: <20220826190658.il7m6pws3dgzfweb@guri>
References: <20220817021850.20460-5-laurent.pinchart@ideasonboard.com>
 <20220823172136.9342-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20220823172136.9342-1-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 23.08.2022 20:21, Laurent Pinchart wrote:
>The rkisp1_lsc_config() function incorrectly uses the
>RKISP1_CIF_ISP_LSC_SECT_SIZE() macro for the gradient registers. Replace
>it with the correct macro, and rename it from
>RKISP1_CIF_ISP_LSC_GRAD_SIZE() to RKISP1_CIF_ISP_LSC_SECT_GRAD() as the
>corresponding registers store the gradients for each sector, not a size.
>This doesn't cause any functional change as the two macros are defined
>identically (the size and gradient registers store fields in the same
>number of bits at the same positions).
>
>Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>

>---
>Changes since v1:
>
>- Rename RKISP1_CIF_ISP_LSC_GRAD_SIZE to RKISP1_CIF_ISP_LSC_SECT_GRAD
>---
> drivers/media/platform/rockchip/rkisp1/rkisp1-params.c | 4 ++--
> drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h   | 2 +-
> 2 files changed, 3 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
>index aa6efa4c6e9e..123c26fc1679 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
>@@ -334,7 +334,7 @@ static void rkisp1_lsc_config(struct rkisp1_params *params,
> 		rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_XSIZE(i), data);
>
> 		/* program x grad tables */
>-		data = RKISP1_CIF_ISP_LSC_SECT_SIZE(arg->x_grad_tbl[i * 2],
>+		data = RKISP1_CIF_ISP_LSC_SECT_GRAD(arg->x_grad_tbl[i * 2],
> 						    arg->x_grad_tbl[i * 2 + 1]);
> 		rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_XGRAD(i), data);
>
>@@ -344,7 +344,7 @@ static void rkisp1_lsc_config(struct rkisp1_params *params,
> 		rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_YSIZE(i), data);
>
> 		/* program y grad tables */
>-		data = RKISP1_CIF_ISP_LSC_SECT_SIZE(arg->y_grad_tbl[i * 2],
>+		data = RKISP1_CIF_ISP_LSC_SECT_GRAD(arg->y_grad_tbl[i * 2],
> 						    arg->y_grad_tbl[i * 2 + 1]);
> 		rkisp1_write(rkisp1, RKISP1_CIF_ISP_LSC_YGRAD(i), data);
> 	}
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
>index 2ad24deedec8..39b2ac58196e 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
>@@ -619,7 +619,7 @@
> 	(((v0) & 0x1FFF) | (((v1) & 0x1FFF) << 13))
> #define RKISP1_CIF_ISP_LSC_SECT_SIZE(v0, v1)      \
> 	(((v0) & 0xFFF) | (((v1) & 0xFFF) << 16))
>-#define RKISP1_CIF_ISP_LSC_GRAD_SIZE(v0, v1)      \
>+#define RKISP1_CIF_ISP_LSC_SECT_GRAD(v0, v1)      \
> 	(((v0) & 0xFFF) | (((v1) & 0xFFF) << 16))
>
> /* LSC: ISP_LSC_TABLE_SEL */
>-- 
>Regards,
>
>Laurent Pinchart
>
>
>_______________________________________________
>Linux-rockchip mailing list
>Linux-rockchip@lists.infradead.org
>http://lists.infradead.org/mailman/listinfo/linux-rockchip
