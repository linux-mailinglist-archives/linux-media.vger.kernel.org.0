Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94D534E383B
	for <lists+linux-media@lfdr.de>; Tue, 22 Mar 2022 06:13:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236648AbiCVFJV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Mar 2022 01:09:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236636AbiCVFJU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Mar 2022 01:09:20 -0400
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74DC225F
        for <linux-media@vger.kernel.org>; Mon, 21 Mar 2022 22:07:53 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id B012A5C0167;
        Tue, 22 Mar 2022 01:07:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 22 Mar 2022 01:07:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; bh=eOYpkJ9VPKXYC6YQljiYRDJFLtxoAWIIC5lZE6
        3UJjk=; b=XMwgy9YioQrK1JqiJIDR3XFXNmQQbdh7ktlL7LcUEmTqfBPqvmlevh
        bnWX2sdz2mVQe1tTVna1+OwGbNbmMgKy1OKKZYcuJwFOjhHXBzt2+AQjjPhSU9/R
        alPsu3prVZVzj726yjmAqupbYcGT/jLD82xE6oSArOiUOvN5kDLq5gNOlu4bFB3P
        rnm8iIiM/0LYEfRh21Ph1hotQq9ou/hEj7x0PcI13uKWfXqxnujyhk5Q1kwi0Y6y
        5MEoeo7ynIi/glxlYAY/zQn/42Kdex+cswLTlW+CGdZz3gT+hb9aQrdO6RmGXM61
        UxSK7pBO3uCXqnYUpzYJJAih0DATyfpw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=eOYpkJ9VPKXYC6YQl
        jiYRDJFLtxoAWIIC5lZE63UJjk=; b=h6UZAQxzLPN87n6dmmYW63cThmgzxVZK3
        vonR5xw/9WEgv/Us2zfFRMXApOqLohVGqzO4IYtLoafZS9j/Otm9riLYlsz6SL9k
        sDGiPtoLymnCFIO5r0s7xWnMwYOhGyF3b68RV1FmwXUKAv95/Cf8l3CwjlyUSBGi
        heZLu/T5B10APXZgMlxcsBgsP42lgY8lSNSNLX5qa93kF7ScFILrPbqHXXBo/AU8
        14Yzi+9k2gdDsv3pgUcIlB7SH4NHcGvBhtty6vHt7aaELcJzJvtrdlNxlcxzoTcv
        P7R7NBWygYQJs8HJSkSJp53ceSooi1M35fwH1nKH7cf4DEEGivc8Q==
X-ME-Sender: <xms:qFk5YnDPRZC7kcioqRalDnQUz4WYvK_4esf7XhBBbn2SMgqUe5WYZA>
    <xme:qFk5YtgOTslxWqqyz4k-baxnmpZq9P_VxRzGKi83xz-OL0ePUebupU0sovwBKilGW
    M7dgK8EpPQexY2b3DA>
X-ME-Received: <xmr:qFk5Yim6Es4sW0udY6gv2kD2LwcyKoAAVMOOMK7QEu0xHkByWoRbDu9f8_V50L1pxly9MhugfxvA14pMpaAC8f2H>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeggedgjeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttdejnecuhfhrohhmpeffrghfnhgr
    ucfjihhrshgthhhfvghlugcuoegurghfnhgrsehfrghsthhmrghilhdrtghomheqnecugg
    ftrfgrthhtvghrnhepffelvddujefgieetvdelveetudeukeektdejvdegvdfgudelteff
    ueejvdevkeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepuggrfhhnrgesfhgrshhtmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:qFk5YpyF6QHbDjw-Em3LoDH2blaD8z_RteUxXRgKijZsGwhxWpPQ3g>
    <xmx:qFk5YsTPi05DKwvDWYn30juAJvlvgjYUi6sCKD78IfuizbfzghEh-A>
    <xmx:qFk5YsYqyA_UI6-hKJMXmX4URcnfZpbAyY-kdowArcOEMe6s89oEIA>
    <xmx:qFk5YiNh0TFLrGcyXvTS7ezTUB5Ls0o-2UTa_dejquisP1HA-2AMOA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Mar 2022 01:07:50 -0400 (EDT)
Date:   Tue, 22 Mar 2022 07:07:48 +0200
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 08/17] media: rkisp1: regs: Don't use BIT() macro for
 multi-bit register fields
Message-ID: <20220322050747.wxpe4lrly3yquw3j@guri>
References: <20220319163100.3083-1-laurent.pinchart@ideasonboard.com>
 <20220319163100.3083-9-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220319163100.3083-9-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UPPERCASE_50_75 autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 19.03.2022 18:30, Laurent Pinchart wrote:
> The BIT() macro is meant to represent a single bit. It is incorrectly
> used for register field values that store the value 1 in a multi-bit
> field. Use the usual (1 << n) construct for those.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../platform/rockchip/rkisp1/rkisp1-regs.h    | 52 +++++++++----------
>  1 file changed, 26 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> index d326214c7e07..9e786de23480 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> @@ -11,7 +11,7 @@
>  /* ISP_CTRL */
>  #define RKISP1_CIF_ISP_CTRL_ISP_ENABLE			BIT(0)
>  #define RKISP1_CIF_ISP_CTRL_ISP_MODE_RAW_PICT		(0 << 1)
> -#define RKISP1_CIF_ISP_CTRL_ISP_MODE_ITU656		BIT(1)
> +#define RKISP1_CIF_ISP_CTRL_ISP_MODE_ITU656		(1 << 1)
>  #define RKISP1_CIF_ISP_CTRL_ISP_MODE_ITU601		(2 << 1)
>  #define RKISP1_CIF_ISP_CTRL_ISP_MODE_BAYER_ITU601	(3 << 1)
>  #define RKISP1_CIF_ISP_CTRL_ISP_MODE_DATA_MODE		(4 << 1)
> @@ -33,37 +33,37 @@
>  #define RKISP1_CIF_ISP_ACQ_PROP_HSYNC_LOW		BIT(1)
>  #define RKISP1_CIF_ISP_ACQ_PROP_VSYNC_LOW		BIT(2)
>  #define RKISP1_CIF_ISP_ACQ_PROP_BAYER_PAT_RGGB		(0 << 3)
> -#define RKISP1_CIF_ISP_ACQ_PROP_BAYER_PAT_GRBG		BIT(3)
> +#define RKISP1_CIF_ISP_ACQ_PROP_BAYER_PAT_GRBG		(1 << 3)
>  #define RKISP1_CIF_ISP_ACQ_PROP_BAYER_PAT_GBRG		(2 << 3)
>  #define RKISP1_CIF_ISP_ACQ_PROP_BAYER_PAT_BGGR		(3 << 3)
>  #define RKISP1_CIF_ISP_ACQ_PROP_BAYER_PAT(pat)		((pat) << 3)
>  #define RKISP1_CIF_ISP_ACQ_PROP_YCBYCR			(0 << 7)
> -#define RKISP1_CIF_ISP_ACQ_PROP_YCRYCB			BIT(7)
> +#define RKISP1_CIF_ISP_ACQ_PROP_YCRYCB			(1 << 7)
>  #define RKISP1_CIF_ISP_ACQ_PROP_CBYCRY			(2 << 7)
>  #define RKISP1_CIF_ISP_ACQ_PROP_CRYCBY			(3 << 7)
>  #define RKISP1_CIF_ISP_ACQ_PROP_FIELD_SEL_ALL		(0 << 9)
> -#define RKISP1_CIF_ISP_ACQ_PROP_FIELD_SEL_EVEN		BIT(9)
> +#define RKISP1_CIF_ISP_ACQ_PROP_FIELD_SEL_EVEN		(1 << 9)
>  #define RKISP1_CIF_ISP_ACQ_PROP_FIELD_SEL_ODD		(2 << 9)
>  #define RKISP1_CIF_ISP_ACQ_PROP_IN_SEL_12B		(0 << 12)
> -#define RKISP1_CIF_ISP_ACQ_PROP_IN_SEL_10B_ZERO		BIT(12)
> +#define RKISP1_CIF_ISP_ACQ_PROP_IN_SEL_10B_ZERO		(1 << 12)
>  #define RKISP1_CIF_ISP_ACQ_PROP_IN_SEL_10B_MSB		(2 << 12)
>  #define RKISP1_CIF_ISP_ACQ_PROP_IN_SEL_8B_ZERO		(3 << 12)
>  #define RKISP1_CIF_ISP_ACQ_PROP_IN_SEL_8B_MSB		(4 << 12)
>  
>  /* VI_DPCL */
>  #define RKISP1_CIF_VI_DPCL_DMA_JPEG			(0 << 0)
> -#define RKISP1_CIF_VI_DPCL_MP_MUX_MRSZ_MI		BIT(0)
> +#define RKISP1_CIF_VI_DPCL_MP_MUX_MRSZ_MI		(1 << 0)
>  #define RKISP1_CIF_VI_DPCL_MP_MUX_MRSZ_JPEG		(2 << 0)
> -#define RKISP1_CIF_VI_DPCL_CHAN_MODE_MP			BIT(2)
> +#define RKISP1_CIF_VI_DPCL_CHAN_MODE_MP			(1 << 2)
>  #define RKISP1_CIF_VI_DPCL_CHAN_MODE_SP			(2 << 2)
>  #define RKISP1_CIF_VI_DPCL_CHAN_MODE_MPSP		(3 << 2)
>  #define RKISP1_CIF_VI_DPCL_DMA_SW_SPMUX			(0 << 4)
> -#define RKISP1_CIF_VI_DPCL_DMA_SW_SI			BIT(4)
> +#define RKISP1_CIF_VI_DPCL_DMA_SW_SI			(1 << 4)
>  #define RKISP1_CIF_VI_DPCL_DMA_SW_IE			(2 << 4)
>  #define RKISP1_CIF_VI_DPCL_DMA_SW_JPEG			(3 << 4)
>  #define RKISP1_CIF_VI_DPCL_DMA_SW_ISP			(4 << 4)
>  #define RKISP1_CIF_VI_DPCL_IF_SEL_PARALLEL		(0 << 8)
> -#define RKISP1_CIF_VI_DPCL_IF_SEL_SMIA			BIT(8)
> +#define RKISP1_CIF_VI_DPCL_IF_SEL_SMIA			(1 << 8)
>  #define RKISP1_CIF_VI_DPCL_IF_SEL_MIPI			(2 << 8)
>  #define RKISP1_CIF_VI_DPCL_DMA_IE_MUX_DMA		BIT(10)
>  #define RKISP1_CIF_VI_DPCL_DMA_SP_MUX_DMA		BIT(11)
> @@ -112,26 +112,26 @@
>  #define RKISP1_CIF_MI_SP_AUTOUPDATE_ENABLE		BIT(14)
>  #define RKISP1_CIF_MI_LAST_PIXEL_SIG_ENABLE		BIT(15)
>  #define RKISP1_CIF_MI_CTRL_BURST_LEN_LUM_16		(0 << 16)
> -#define RKISP1_CIF_MI_CTRL_BURST_LEN_LUM_32		BIT(16)
> +#define RKISP1_CIF_MI_CTRL_BURST_LEN_LUM_32		(1 << 16)
>  #define RKISP1_CIF_MI_CTRL_BURST_LEN_LUM_64		(2 << 16)
>  #define RKISP1_CIF_MI_CTRL_BURST_LEN_CHROM_16		(0 << 18)
> -#define RKISP1_CIF_MI_CTRL_BURST_LEN_CHROM_32		BIT(18)
> +#define RKISP1_CIF_MI_CTRL_BURST_LEN_CHROM_32		(1 << 18)
>  #define RKISP1_CIF_MI_CTRL_BURST_LEN_CHROM_64		(2 << 18)
>  #define RKISP1_CIF_MI_CTRL_INIT_BASE_EN			BIT(20)
>  #define RKISP1_CIF_MI_CTRL_INIT_OFFSET_EN		BIT(21)
>  #define RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8		(0 << 22)
> -#define RKISP1_MI_CTRL_MP_WRITE_YUV_SPLA		BIT(22)
> +#define RKISP1_MI_CTRL_MP_WRITE_YUV_SPLA		(1 << 22)
>  #define RKISP1_MI_CTRL_MP_WRITE_YUVINT			(2 << 22)
>  #define RKISP1_MI_CTRL_MP_WRITE_RAW12			(2 << 22)
>  #define RKISP1_MI_CTRL_SP_WRITE_PLA			(0 << 24)
> -#define RKISP1_MI_CTRL_SP_WRITE_SPLA			BIT(24)
> +#define RKISP1_MI_CTRL_SP_WRITE_SPLA			(1 << 24)
>  #define RKISP1_MI_CTRL_SP_WRITE_INT			(2 << 24)
>  #define RKISP1_MI_CTRL_SP_INPUT_YUV400			(0 << 26)
> -#define RKISP1_MI_CTRL_SP_INPUT_YUV420			BIT(26)
> +#define RKISP1_MI_CTRL_SP_INPUT_YUV420			(1 << 26)
>  #define RKISP1_MI_CTRL_SP_INPUT_YUV422			(2 << 26)
>  #define RKISP1_MI_CTRL_SP_INPUT_YUV444			(3 << 26)
>  #define RKISP1_MI_CTRL_SP_OUTPUT_YUV400			(0 << 28)
> -#define RKISP1_MI_CTRL_SP_OUTPUT_YUV420			BIT(28)
> +#define RKISP1_MI_CTRL_SP_OUTPUT_YUV420			(1 << 28)
>  #define RKISP1_MI_CTRL_SP_OUTPUT_YUV422			(2 << 28)
>  #define RKISP1_MI_CTRL_SP_OUTPUT_YUV444			(3 << 28)
>  #define RKISP1_MI_CTRL_SP_OUTPUT_RGB565			(4 << 28)
> @@ -186,22 +186,22 @@
>  
>  /* MI_DMA_CTRL */
>  #define RKISP1_CIF_MI_DMA_CTRL_BURST_LEN_LUM_16		(0 << 0)
> -#define RKISP1_CIF_MI_DMA_CTRL_BURST_LEN_LUM_32		BIT(0)
> +#define RKISP1_CIF_MI_DMA_CTRL_BURST_LEN_LUM_32		(1 << 0)
>  #define RKISP1_CIF_MI_DMA_CTRL_BURST_LEN_LUM_64		(2 << 0)
>  #define RKISP1_CIF_MI_DMA_CTRL_BURST_LEN_CHROM_16	(0 << 2)
> -#define RKISP1_CIF_MI_DMA_CTRL_BURST_LEN_CHROM_32	BIT(2)
> +#define RKISP1_CIF_MI_DMA_CTRL_BURST_LEN_CHROM_32	(1 << 2)
>  #define RKISP1_CIF_MI_DMA_CTRL_BURST_LEN_CHROM_64	(2 << 2)
>  #define RKISP1_CIF_MI_DMA_CTRL_READ_FMT_PLANAR		(0 << 4)
> -#define RKISP1_CIF_MI_DMA_CTRL_READ_FMT_SPLANAR		BIT(4)
> +#define RKISP1_CIF_MI_DMA_CTRL_READ_FMT_SPLANAR		(1 << 4)
>  #define RKISP1_CIF_MI_DMA_CTRL_FMT_YUV400		(0 << 6)
> -#define RKISP1_CIF_MI_DMA_CTRL_FMT_YUV420		BIT(6)
> +#define RKISP1_CIF_MI_DMA_CTRL_FMT_YUV420		(1 << 6)
>  #define RKISP1_CIF_MI_DMA_CTRL_READ_FMT_PACKED		(2 << 4)

This should go above to the palce of the (<< 4) values
though not related to that patch, I think it can go in.

Thanks,
Dafna

>  #define RKISP1_CIF_MI_DMA_CTRL_FMT_YUV422		(2 << 6)
>  #define RKISP1_CIF_MI_DMA_CTRL_FMT_YUV444		(3 << 6)
>  #define RKISP1_CIF_MI_DMA_CTRL_BYTE_SWAP		BIT(8)
>  #define RKISP1_CIF_MI_DMA_CTRL_CONTINUOUS_ENA		BIT(9)
>  #define RKISP1_CIF_MI_DMA_CTRL_RGB_BAYER_NO		(0 << 12)
> -#define RKISP1_CIF_MI_DMA_CTRL_RGB_BAYER_8BIT		BIT(12)
> +#define RKISP1_CIF_MI_DMA_CTRL_RGB_BAYER_8BIT		(1 << 12)
>  #define RKISP1_CIF_MI_DMA_CTRL_RGB_BAYER_16BIT		(2 << 12)
>  /* MI_DMA_START */
>  #define RKISP1_CIF_MI_DMA_START_ENABLE			BIT(0)
> @@ -282,10 +282,10 @@
>  #define RKISP1_CIF_C_PROC_TONE_RESERVED			0xF000
>  /* DUAL_CROP_CTRL */
>  #define RKISP1_CIF_DUAL_CROP_MP_MODE_BYPASS		(0 << 0)
> -#define RKISP1_CIF_DUAL_CROP_MP_MODE_YUV		BIT(0)
> +#define RKISP1_CIF_DUAL_CROP_MP_MODE_YUV		(1 << 0)
>  #define RKISP1_CIF_DUAL_CROP_MP_MODE_RAW		(2 << 0)
>  #define RKISP1_CIF_DUAL_CROP_SP_MODE_BYPASS		(0 << 2)
> -#define RKISP1_CIF_DUAL_CROP_SP_MODE_YUV		BIT(2)
> +#define RKISP1_CIF_DUAL_CROP_SP_MODE_YUV		(1 << 2)
>  #define RKISP1_CIF_DUAL_CROP_SP_MODE_RAW		(2 << 2)
>  #define RKISP1_CIF_DUAL_CROP_CFG_UPD_PERMANENT		BIT(4)
>  #define RKISP1_CIF_DUAL_CROP_CFG_UPD			BIT(5)
> @@ -294,7 +294,7 @@
>  /* IMG_EFF_CTRL */
>  #define RKISP1_CIF_IMG_EFF_CTRL_ENABLE			BIT(0)
>  #define RKISP1_CIF_IMG_EFF_CTRL_MODE_BLACKWHITE		(0 << 1)
> -#define RKISP1_CIF_IMG_EFF_CTRL_MODE_NEGATIVE		BIT(1)
> +#define RKISP1_CIF_IMG_EFF_CTRL_MODE_NEGATIVE		(1 << 1)
>  #define RKISP1_CIF_IMG_EFF_CTRL_MODE_SEPIA		(2 << 1)
>  #define RKISP1_CIF_IMG_EFF_CTRL_MODE_COLOR_SEL		(3 << 1)
>  #define RKISP1_CIF_IMG_EFF_CTRL_MODE_EMBOSS		(4 << 1)
> @@ -314,7 +314,7 @@
>  
>  /* IMG_EFF_COLOR_SEL */
>  #define RKISP1_CIF_IMG_EFF_COLOR_RGB			0
> -#define RKISP1_CIF_IMG_EFF_COLOR_B			BIT(0)
> +#define RKISP1_CIF_IMG_EFF_COLOR_B			(1 << 0)
>  #define RKISP1_CIF_IMG_EFF_COLOR_G			(2 << 0)
>  #define RKISP1_CIF_IMG_EFF_COLOR_GB			(3 << 0)
>  #define RKISP1_CIF_IMG_EFF_COLOR_R			(4 << 0)
> @@ -376,7 +376,7 @@
>  
>  /* ISP HISTOGRAM CALCULATION : ISP_HIST_PROP */
>  #define RKISP1_CIF_ISP_HIST_PROP_MODE_DIS_V10		(0 << 0)
> -#define RKISP1_CIF_ISP_HIST_PROP_MODE_RGB_V10		BIT(0)
> +#define RKISP1_CIF_ISP_HIST_PROP_MODE_RGB_V10		(1 << 0)
>  #define RKISP1_CIF_ISP_HIST_PROP_MODE_RED_V10		(2 << 0)
>  #define RKISP1_CIF_ISP_HIST_PROP_MODE_GREEN_V10		(3 << 0)
>  #define RKISP1_CIF_ISP_HIST_PROP_MODE_BLUE_V10		(4 << 0)
> @@ -639,7 +639,7 @@
>  #define RKISP1_CIF_ISP_BLS_ENA				BIT(0)
>  #define RKISP1_CIF_ISP_BLS_MODE_MEASURED		BIT(1)
>  #define RKISP1_CIF_ISP_BLS_MODE_FIXED			0
> -#define RKISP1_CIF_ISP_BLS_WINDOW_1			BIT(2)
> +#define RKISP1_CIF_ISP_BLS_WINDOW_1			(1 << 2)
>  #define RKISP1_CIF_ISP_BLS_WINDOW_2			(2 << 2)
>  
>  /* GAMMA-IN */
> -- 
> Regards,
> 
> Laurent Pinchart
> 
