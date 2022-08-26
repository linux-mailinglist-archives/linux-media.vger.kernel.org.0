Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCF015A2F93
	for <lists+linux-media@lfdr.de>; Fri, 26 Aug 2022 21:04:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231868AbiHZTE1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Aug 2022 15:04:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231639AbiHZTEZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Aug 2022 15:04:25 -0400
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B13E093508
        for <linux-media@vger.kernel.org>; Fri, 26 Aug 2022 12:04:24 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 4DF335C04B1;
        Fri, 26 Aug 2022 15:04:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 26 Aug 2022 15:04:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm1; t=1661540661; x=1661627061; bh=PaN/w54EYM
        Mlgr0LwMkimzWuVJ46ffIeLPYiw3GEeLk=; b=KMgIfcqv2IyF08Jk5AyiBRq0y5
        eitlwTV02C1u4QBffse8+S5fJftxy4yypR0q7Kg3a9/GYUvxiQ40/hIJ6SqgOg14
        soxPFnIeFN9vtwy44eVXegJntzDN2Vx4nhGMry5wiIY811rM6/KqkHeDmrN2A8nj
        Dd8dYtLgQWeGI/Qicrg2L9T0dI7u0vj4cDbV5/VsA95aLRsdVDlluVy4Wllb7+JE
        nDCXx4iY6Lv6QyCKwnRpJHXwax/5IPWBx9LMPJGkhWS7Eu1fv6kLPW64MPeg2X7u
        48Ud1ZUkMI1W2Vf41JHXsu4RWBWrEzG0qrKeKquOPW0UuKtI3jhJsdCBTYhg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; t=1661540661; x=1661627061; bh=PaN/w54EYMMlgr0LwMkimzWuVJ46
        ffIeLPYiw3GEeLk=; b=aMztqPe9j5sxWUtgj2ECtymXzcZJNYoziD6XyGqm/+x5
        7j+JMxHvylYyf7xXETIWiUMB+hj+mwG3ug4PoXwsYyhOZY7ahamqGo24zRXxBrBO
        ilEW68E4HslQHuBegjZ+ONLYPctjCsMcB81xyshDgOJs0KtJ1JOe3Wvzv7JvYBjM
        C9fi5Pp+gNSyFnZpffll05dmpPkaEXhTpF2p0oL7X9NsewOJ3Oli5y1U74bht3Qv
        OyVy81A/Bqthk8aKVgsJ9jRxDYc90BZc9VhZ3xxfbLYx8RWqIaq6bMylzztXpzww
        Rm/fD24D/RgwvkK5n5d2DL1IkyrC+2MM3qMCfA+P0Q==
X-ME-Sender: <xms:NBkJYwp0Bu8oo4aeAhU7bKtZV3AcSF9GRyZuThhCocfhnGHmPtBhnw>
    <xme:NBkJY2qALn_YcwdoZ33U2OJmffkp2hL8Ve75rvXiKHmaYqv8PB6X3wwg1LFzKF-SM
    Y_KUC4iuogec7IqENQ>
X-ME-Received: <xmr:NBkJY1NBRDNviLCkp-XzdZNjOF6tybzhertL0aAP-ol9Suv__iglcg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdejhedgudefudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttdejnecuhfhrohhmpeffrghf
    nhgrucfjihhrshgthhhfvghlugcuoegurghfnhgrsehfrghsthhmrghilhdrtghomheqne
    cuggftrfgrthhtvghrnhepvdehtdeludekgeevleefuedvudejieetheekvdfhteekffdu
    jefhfedtudehvdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepuggrfhhnrgesfhgrshhtmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:NRkJY37OJ56k4yw8JZ-HJjhAi5VXRTJ3teOprm5Oo4FghfumbQ5aOQ>
    <xmx:NRkJY_7j4_YYyUSbUi9E209QJgbcxqvpJbUAVM_UyFMg4eXOlgSB7Q>
    <xmx:NRkJY3jj7NBMcSDcaIImpJNkVb4IN_fbGbtD_k5O7ymsB_Joj9s33w>
    <xmx:NRkJYxlA0V3a16-r9pdTtcTQVLxZa1hf96wI0_PCxwtrnp4j6bL_4A>
Feedback-ID: i0e894699:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 26 Aug 2022 15:04:19 -0400 (EDT)
Date:   Fri, 26 Aug 2022 22:04:14 +0300
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Paul Elder <paul.elder@ideasonboard.com>,
        Florian Sylvestre <fsylvestre@baylibre.com>
Subject: Re: [PATCH 3/3] media: rockchip: rkisp1: Define macros for DPCC
 configurations in UAPI
Message-ID: <20220826190414.4rd7uxphbwoqazdc@guri>
References: <20220616160456.21549-1-laurent.pinchart@ideasonboard.com>
 <20220616160456.21549-4-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20220616160456.21549-4-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 16.06.2022 19:04, Laurent Pinchart wrote:
>Extend the UAPI rkisp1-config.h header with macros for all DPCC
>configuration fields. While at it, clarify of fix issues in the DPCC
>documentation.
>
>Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>

>---
> .../platform/rockchip/rkisp1/rkisp1-regs.h    |  1 -
> include/uapi/linux/rkisp1-config.h            | 77 +++++++++++++++----
> 2 files changed, 61 insertions(+), 17 deletions(-)
>
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
>index dc01f968c19d..a931f7216e9b 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
>@@ -620,7 +620,6 @@
> /* DPCC */
> #define RKISP1_CIF_ISP_DPCC_MODE_DPCC_ENABLE		BIT(0)
> #define RKISP1_CIF_ISP_DPCC_MODE_GRAYSCALE_MODE		BIT(1)
>-#define RKISP1_CIF_ISP_DPCC_MODE_STAGE1_ENABLE		BIT(2)
> #define RKISP1_CIF_ISP_DPCC_OUTPUT_MODE_MASK		GENMASK(3, 0)
> #define RKISP1_CIF_ISP_DPCC_SET_USE_MASK		GENMASK(3, 0)
> #define RKISP1_CIF_ISP_DPCC_METHODS_SET_MASK		0x00001f1f
>diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
>index 583ca0d9a79d..730673ecc63d 100644
>--- a/include/uapi/linux/rkisp1-config.h
>+++ b/include/uapi/linux/rkisp1-config.h
>@@ -117,7 +117,46 @@
> /*
>  * Defect Pixel Cluster Correction
>  */
>-#define RKISP1_CIF_ISP_DPCC_METHODS_MAX       3
>+#define RKISP1_CIF_ISP_DPCC_METHODS_MAX				3
>+
>+#define RKISP1_CIF_ISP_DPCC_MODE_STAGE1_ENABLE			(1U << 2)
>+
>+#define RKISP1_CIF_ISP_DPCC_OUTPUT_MODE_STAGE1_INCL_G_CENTER	(1U << 0)
>+#define RKISP1_CIF_ISP_DPCC_OUTPUT_MODE_STAGE1_INCL_RB_CENTER	(1U << 1)
>+#define RKISP1_CIF_ISP_DPCC_OUTPUT_MODE_STAGE1_G_3X3		(1U << 2)
>+#define RKISP1_CIF_ISP_DPCC_OUTPUT_MODE_STAGE1_RB_3X3		(1U << 3)
>+
>+/* 0-2 for sets 1-3 */
>+#define RKISP1_CIF_ISP_DPCC_SET_USE_STAGE1_USE_SET(n)		((n) << 0)
>+#define RKISP1_CIF_ISP_DPCC_SET_USE_STAGE1_USE_FIX_SET		(1U << 3)
>+
>+#define RKISP1_CIF_ISP_DPCC_METHODS_SET_PG_GREEN_ENABLE		(1U << 0)
>+#define RKISP1_CIF_ISP_DPCC_METHODS_SET_LC_GREEN_ENABLE		(1U << 1)
>+#define RKISP1_CIF_ISP_DPCC_METHODS_SET_RO_GREEN_ENABLE		(1U << 2)
>+#define RKISP1_CIF_ISP_DPCC_METHODS_SET_RND_GREEN_ENABLE	(1U << 3)
>+#define RKISP1_CIF_ISP_DPCC_METHODS_SET_RG_GREEN_ENABLE		(1U << 4)
>+#define RKISP1_CIF_ISP_DPCC_METHODS_SET_PG_RED_BLUE_ENABLE	(1U << 8)
>+#define RKISP1_CIF_ISP_DPCC_METHODS_SET_LC_RED_BLUE_ENABLE	(1U << 9)
>+#define RKISP1_CIF_ISP_DPCC_METHODS_SET_RO_RED_BLUE_ENABLE	(1U << 10)
>+#define RKISP1_CIF_ISP_DPCC_METHODS_SET_RND_RED_BLUE_ENABLE	(1U << 11)
>+#define RKISP1_CIF_ISP_DPCC_METHODS_SET_RG_RED_BLUE_ENABLE	(1U << 12)
>+
>+#define RKISP1_CIF_ISP_DPCC_LINE_THRESH_G(v)			((v) << 0)
>+#define RKISP1_CIF_ISP_DPCC_LINE_THRESH_RB(v)			((v) << 8)
>+#define RKISP1_CIF_ISP_DPCC_LINE_MAD_FAC_G(v)			((v) << 0)
>+#define RKISP1_CIF_ISP_DPCC_LINE_MAD_FAC_RB(v)			((v) << 8)
>+#define RKISP1_CIF_ISP_DPCC_PG_FAC_G(v)				((v) << 0)
>+#define RKISP1_CIF_ISP_DPCC_PG_FAC_RB(v)			((v) << 8)
>+#define RKISP1_CIF_ISP_DPCC_RND_THRESH_G(v)			((v) << 0)
>+#define RKISP1_CIF_ISP_DPCC_RND_THRESH_RB(v)			((v) << 8)
>+#define RKISP1_CIF_ISP_DPCC_RG_FAC_G(v)				((v) << 0)
>+#define RKISP1_CIF_ISP_DPCC_RG_FAC_RB(v)			((v) << 8)
>+
>+#define RKISP1_CIF_ISP_DPCC_RO_LIMITS_n_G(n, v)			((v) << ((n) * 4))
>+#define RKISP1_CIF_ISP_DPCC_RO_LIMITS_n_RB(n, v)		((v) << ((n) * 4 + 2))
>+
>+#define RKISP1_CIF_ISP_DPCC_RND_OFFS_n_G(n, v)			((v) << ((n) * 4))
>+#define RKISP1_CIF_ISP_DPCC_RND_OFFS_n_RB(n, v)			((v) << ((n) * 4 + 2))
>
> /*
>  * Denoising pre filter
>@@ -249,16 +288,20 @@ struct rkisp1_cif_isp_bls_config {
> };
>
> /**
>- * struct rkisp1_cif_isp_dpcc_methods_config - Methods Configuration used by DPCC
>+ * struct rkisp1_cif_isp_dpcc_methods_config - DPCC methods set configuration
>  *
>- * Methods Configuration used by Defect Pixel Cluster Correction
>+ * This structure stores the configuration of one set of methods for the DPCC
>+ * algorithm. Multiple methods can be selected in each set (independently for
>+ * the Green and Red/Blue components) through the @method field, the result is
>+ * the logical AND of all enabled methods. The remaining fields set thresholds
>+ * and factors for each method.
>  *
>- * @method: Method enable bits
>- * @line_thresh: Line threshold
>- * @line_mad_fac: Line MAD factor
>- * @pg_fac: Peak gradient factor
>- * @rnd_thresh: Rank Neighbor Difference threshold
>- * @rg_fac: Rank gradient factor
>+ * @method: Method enable bits (RKISP1_CIF_ISP_DPCC_METHODS_SET_*)
>+ * @line_thresh: Line threshold (RKISP1_CIF_ISP_DPCC_LINE_THRESH_*)
>+ * @line_mad_fac: Line Mean Absolute Difference factor (RKISP1_CIF_ISP_DPCC_LINE_MAD_FAC_*)
>+ * @pg_fac: Peak gradient factor (RKISP1_CIF_ISP_DPCC_PG_FAC_*)
>+ * @rnd_thresh: Rank Neighbor Difference threshold (RKISP1_CIF_ISP_DPCC_RND_THRESH_*)
>+ * @rg_fac: Rank gradient factor (RKISP1_CIF_ISP_DPCC_RG_FAC_*)
>  */
> struct rkisp1_cif_isp_dpcc_methods_config {
> 	__u32 method;
>@@ -272,14 +315,16 @@ struct rkisp1_cif_isp_dpcc_methods_config {
> /**
>  * struct rkisp1_cif_isp_dpcc_config - Configuration used by DPCC
>  *
>- * Configuration used by Defect Pixel Cluster Correction
>+ * Configuration used by Defect Pixel Cluster Correction. Three sets of methods
>+ * can be configured and selected through the @set_use field. The result is the
>+ * logical OR of all enabled sets.
>  *
>- * @mode: dpcc output mode
>- * @output_mode: whether use hard coded methods
>- * @set_use: stage1 methods set
>- * @methods: methods config
>- * @ro_limits: rank order limits
>- * @rnd_offs: differential rank offsets for rank neighbor difference
>+ * @mode: DPCC mode (RKISP1_CIF_ISP_DPCC_MODE_*)
>+ * @output_mode: Interpolation output mode (RKISP1_CIF_ISP_DPCC_OUTPUT_MODE_*)
>+ * @set_use: Methods sets selection (RKISP1_CIF_ISP_DPCC_SET_USE_*)
>+ * @methods: Methods sets configuration
>+ * @ro_limits: Rank order limits (RKISP1_CIF_ISP_DPCC_RO_LIMITS_*)
>+ * @rnd_offs: Differential rank offsets for rank neighbor difference (RKISP1_CIF_ISP_DPCC_RND_OFFS_*)
>  */
> struct rkisp1_cif_isp_dpcc_config {
> 	__u32 mode;
>-- 
>Regards,
>
>Laurent Pinchart
>
