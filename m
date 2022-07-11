Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DF5956D371
	for <lists+linux-media@lfdr.de>; Mon, 11 Jul 2022 05:43:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbiGKDnJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 10 Jul 2022 23:43:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbiGKDnJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 10 Jul 2022 23:43:09 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2816318365
        for <linux-media@vger.kernel.org>; Sun, 10 Jul 2022 20:43:08 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 980273200313;
        Sun, 10 Jul 2022 23:43:04 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Sun, 10 Jul 2022 23:43:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1657510984; x=1657597384; bh=tCorEBdhYJ
        2rlTD+A8EDe8I1sZnR95Gk8btk64JDLzA=; b=U4JCt+FVqewPBDlhmF9vESYo6A
        uiRw+mkd7UFE9KC+L4hpBnC/cFE9JleYBpUDheCtbWnC0kPACWJrQl+ZSq30uM6o
        Y+lrZySAnL2+Ri1GmBER4kpB3qIvKpwk48GT2a3m2St9QTH564Oi2vZB4DQ3xZaL
        uzj6uZE6NReqRL6A0JMelyZJwRiNemXajWASLYnl8CmnRmz9m6CVYuh6RyybngmU
        tdT//UyzsnzdTjydlqdaHjxGwjJXHRsOWdhe9ninOWFFNK7GRMIn0a7MZVsGSPv+
        JLoySyTdPWkM7QsyYEx6RaN3AZH7OcvbcIPfVfxJDbLf9KuAdZo0lagMuNSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; t=1657510984; x=1657597384; bh=tCorEBdhYJ2rlTD+A8EDe8I1sZnR
        95Gk8btk64JDLzA=; b=a/eNN/OpJge+9s/VsRLVzh/pt8nLYq12rDVR/qu+CteC
        HcwOiGRF7okociyZAHd5QvDP+1DWhcnQWm0DtaKLrPaGvfQd16PJX5J4jmv2tkpO
        9QYhtiZYUZqrQdeKJTG0i9KOEiYGwW1E3Z5cMA5kN2k6wShqdCuu5orc8/q6VwUd
        49eapcdaTQedcmDlSjZsG8D1xvrv9iQOa35a2k/Rr6K7h1B3WwO/CMpGfo39zAOR
        BdfWx+vbhHTSoo1erChS3ZveNX7qsylddrM1258QD6bm36iALUpcD22+9slnXhNx
        1l2VCmPEw5aRW0dIwa5+nr4Cv82CggM/AisCK6jz9w==
X-ME-Sender: <xms:R5zLYo2h94MAjtz8h_2Jekbq2kaqMWZnVz_rDJj3D7dV2zUiUXsI0w>
    <xme:R5zLYjGThieG8xxLfLcIEdRMeTXUmRqszqvYd-BN7QLFd4dcctziwsQLDQe-4cs7n
    GL3pB-LZgOEiaGVBJc>
X-ME-Received: <xmr:R5zLYg4KF-MLrG18AFPKkntItxmtIjnvW-CIgUUpxVXm2m-79R5IqA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejvddgjeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomhepffgrfhhn
    rgcujfhirhhstghhfhgvlhguuceouggrfhhnrgesfhgrshhtmhgrihhlrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeehiedvjeehvdffleekffdvjedvieehhedttefhvddtueefueek
    lefhteduudfgjeenucffohhmrghinhepihhnfhhrrgguvggrugdrohhrghenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegurghfnhgrsehfrghs
    thhmrghilhdrtghomh
X-ME-Proxy: <xmx:R5zLYh1IoxE2jjBj-1K4BqMje-L59a6GtCn3FqPthgGcMO2B-jTXXA>
    <xmx:R5zLYrGGTxJzW5JCNwYzbg9UG0feOq8KehGRo79_gUWJTki_vvi9yw>
    <xmx:R5zLYq_78Wj8bL9UVUS2VOHlzH-z5PQYh0IPH4BOY04-gWqxjT8hFQ>
    <xmx:SJzLYvi7pkrru4nr7EopjZiyJicbgZ9e7q97aTjSc_tobGJKV5NGuw>
Feedback-ID: i0e894699:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 10 Jul 2022 23:43:01 -0400 (EDT)
Date:   Mon, 11 Jul 2022 06:42:58 +0300
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: Re: [PATCH v2 54/55] media: rkisp1: Add register definitions for the
 test pattern generator
Message-ID: <20220711034258.6d3hvhf4mwru6vq3@guri>
References: <20220630230713.10580-1-laurent.pinchart@ideasonboard.com>
 <20220630230713.10580-55-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20220630230713.10580-55-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 01.07.2022 02:07, Laurent Pinchart wrote:
>From: Paul Elder <paul.elder@ideasonboard.com>
>
>Add register definitions and value macros for the test pattern generator
>block in the ISP.
>
>Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>

Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>

>---
> .../platform/rockchip/rkisp1/rkisp1-regs.h    | 32 +++++++++++++++++++
> 1 file changed, 32 insertions(+)
>
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
>index dd63ae13e603..34f4fe09c88d 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
>@@ -717,6 +717,27 @@
> #define RKISP1_CIF_ISP_DPF_SPATIAL_COEFF_MAX		0x1F
> #define RKISP1_CIF_ISP_DPF_NLL_COEFF_N_MAX		0x3FF
>
>+/* TPG */
>+#define RKISP1_CIF_ISP_TPG_CTRL_ENA			BIT(0)
>+#define RKISP1_CIF_ISP_TPG_CTRL_IMG_3X3_COLOR_BLOCK	(0 << 1)
>+#define RKISP1_CIF_ISP_TPG_CTRL_IMG_COLOR_BAR		(1 << 1)
>+#define RKISP1_CIF_ISP_TPG_CTRL_IMG_GRAY_BAR		(2 << 1)
>+#define RKISP1_CIF_ISP_TPG_CTRL_IMG_HIGHLIGHT_GRID	(3 << 1)
>+#define RKISP1_CIF_ISP_TPG_CTRL_IMG_RAND		(4 << 1)
>+#define RKISP1_CIF_ISP_TPG_CTRL_CFA_RGGB		(0 << 4)
>+#define RKISP1_CIF_ISP_TPG_CTRL_CFA_GRBG		(1 << 4)
>+#define RKISP1_CIF_ISP_TPG_CTRL_CFA_GBRB		(2 << 4)
>+#define RKISP1_CIF_ISP_TPG_CTRL_CFA_BGGR		(3 << 4)
>+#define RKISP1_CIF_ISP_TPG_CTRL_DEPTH_8			(0 << 6)
>+#define RKISP1_CIF_ISP_TPG_CTRL_DEPTH_10		(1 << 6)
>+#define RKISP1_CIF_ISP_TPG_CTRL_DEPTH_12		(2 << 6)
>+#define RKISP1_CIF_ISP_TPG_CTRL_DEF_SYNC		BIT(8)
>+#define RKISP1_CIF_ISP_TPG_CTRL_MAX_SYNC		BIT(9)
>+#define RKISP1_CIF_ISP_TPG_CTRL_SOL_1080P		(0 << 10)
>+#define RKISP1_CIF_ISP_TPG_CTRL_SOL_720P		(1 << 10)
>+#define RKISP1_CIF_ISP_TPG_CTRL_SOL_4K			(2 << 10)
>+#define RKISP1_CIF_ISP_TPG_CTRL_SOL_USER_DEFINED	(3 << 10)
>+
> /* =================================================================== */
> /*                            CIF Registers                            */
> /* =================================================================== */
>@@ -912,6 +933,17 @@
> #define RKISP1_CIF_ISP_SH_DELAY			(RKISP1_CIF_ISP_SH_BASE + 0x00000008)
> #define RKISP1_CIF_ISP_SH_TIME			(RKISP1_CIF_ISP_SH_BASE + 0x0000000C)
>
>+#define RKISP1_CIF_ISP_TPG_BASE			0x00000700
>+#define RKISP1_CIF_ISP_TPG_CTRL			(RKISP1_CIF_ISP_TPG_BASE + 0x00000000)
>+#define RKISP1_CIF_ISP_TPG_TOTAL_IN		(RKISP1_CIF_ISP_TPG_BASE + 0x00000004)
>+#define RKISP1_CIF_ISP_TPG_ACT_IN		(RKISP1_CIF_ISP_TPG_BASE + 0x00000008)
>+#define RKISP1_CIF_ISP_TPG_FP_IN		(RKISP1_CIF_ISP_TPG_BASE + 0x0000000C)
>+#define RKISP1_CIF_ISP_TPG_BP_IN		(RKISP1_CIF_ISP_TPG_BASE + 0x00000010)
>+#define RKISP1_CIF_ISP_TPG_W_IN			(RKISP1_CIF_ISP_TPG_BASE + 0x00000014)
>+#define RKISP1_CIF_ISP_TPG_GAP_IN		(RKISP1_CIF_ISP_TPG_BASE + 0x00000018)
>+#define RKISP1_CIF_ISP_TPG_GAP_STD_IN		(RKISP1_CIF_ISP_TPG_BASE + 0x0000001C)
>+#define RKISP1_CIF_ISP_TPG_RANDOM_SEED_IN	(RKISP1_CIF_ISP_TPG_BASE + 0x00000020)
>+
> #define RKISP1_CIF_C_PROC_BASE			0x00000800
> #define RKISP1_CIF_C_PROC_CTRL			(RKISP1_CIF_C_PROC_BASE + 0x00000000)
> #define RKISP1_CIF_C_PROC_CONTRAST		(RKISP1_CIF_C_PROC_BASE + 0x00000004)
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
