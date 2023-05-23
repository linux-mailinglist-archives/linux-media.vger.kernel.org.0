Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB25670DBDC
	for <lists+linux-media@lfdr.de>; Tue, 23 May 2023 13:58:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233200AbjEWL6S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 May 2023 07:58:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236618AbjEWL6Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 May 2023 07:58:16 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF677188
        for <linux-media@vger.kernel.org>; Tue, 23 May 2023 04:58:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 79DDC60F7C
        for <linux-media@vger.kernel.org>; Tue, 23 May 2023 11:58:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFCD3C433EF;
        Tue, 23 May 2023 11:58:00 +0000 (UTC)
Message-ID: <7a447631-e6f7-fae2-6884-c404db7e2b0b@xs4all.nl>
Date:   Tue, 23 May 2023 13:57:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] media: verisilicon: rockchip_vpu2_hw_jpeg_enc:
 Consolidate setting of source buffer addresses
Content-Language: en-US
To:     Andri Yngvason <andri@yngvason.is>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20230509150249.824440-1-andri@yngvason.is>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20230509150249.824440-1-andri@yngvason.is>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.8 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andri,

On 09/05/2023 17:02, Andri Yngvason wrote:

Please provide a commit message!

Thank you,

	Hans

> Signed-off-by: Andri Yngvason <andri@yngvason.is>
> ---
>  .../verisilicon/rockchip_vpu2_hw_jpeg_enc.c   | 36 ++++++++++---------
>  1 file changed, 19 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/media/platform/verisilicon/rockchip_vpu2_hw_jpeg_enc.c b/drivers/media/platform/verisilicon/rockchip_vpu2_hw_jpeg_enc.c
> index 8395c4d48dd0..52c76fb91c56 100644
> --- a/drivers/media/platform/verisilicon/rockchip_vpu2_hw_jpeg_enc.c
> +++ b/drivers/media/platform/verisilicon/rockchip_vpu2_hw_jpeg_enc.c
> @@ -32,6 +32,16 @@
>  
>  #define VEPU_JPEG_QUANT_TABLE_COUNT 16
>  
> +static inline u32 __vepu_reg_addr_for_plane(int plane)
> +{
> +	switch (plane) {
> +	case 0: return VEPU_REG_ADDR_IN_PLANE_0;
> +	case 1: return VEPU_REG_ADDR_IN_PLANE_1;
> +	case 2: return VEPU_REG_ADDR_IN_PLANE_2;
> +	}
> +	return 0;
> +}
> +
>  static void rockchip_vpu2_set_src_img_ctrl(struct hantro_dev *vpu,
>  					   struct hantro_ctx *ctx)
>  {
> @@ -70,35 +80,27 @@ static void rockchip_vpu2_jpeg_enc_set_buffers(struct hantro_dev *vpu,
>  					       struct vb2_buffer *dst_buf)
>  {
>  	struct v4l2_pix_format_mplane *pix_fmt = &ctx->src_fmt;
> -	dma_addr_t src[3];
> +	unsigned int num_planes = pix_fmt->num_planes;
> +	unsigned int i;
> +	dma_addr_t src;
>  	u32 size_left;
>  
>  	size_left = vb2_plane_size(dst_buf, 0) - ctx->vpu_dst_fmt->header_size;
>  	if (WARN_ON(vb2_plane_size(dst_buf, 0) < ctx->vpu_dst_fmt->header_size))
>  		size_left = 0;
>  
> -	WARN_ON(pix_fmt->num_planes > 3);
> +	WARN_ON(num_planes > 3);
> +	if (num_planes > 3)
> +		num_planes = 3;
>  
>  	vepu_write_relaxed(vpu, vb2_dma_contig_plane_dma_addr(dst_buf, 0) +
>  				ctx->vpu_dst_fmt->header_size,
>  			   VEPU_REG_ADDR_OUTPUT_STREAM);
>  	vepu_write_relaxed(vpu, size_left, VEPU_REG_STR_BUF_LIMIT);
>  
> -	if (pix_fmt->num_planes == 1) {
> -		src[0] = vb2_dma_contig_plane_dma_addr(src_buf, 0);
> -		vepu_write_relaxed(vpu, src[0], VEPU_REG_ADDR_IN_PLANE_0);
> -	} else if (pix_fmt->num_planes == 2) {
> -		src[0] = vb2_dma_contig_plane_dma_addr(src_buf, 0);
> -		src[1] = vb2_dma_contig_plane_dma_addr(src_buf, 1);
> -		vepu_write_relaxed(vpu, src[0], VEPU_REG_ADDR_IN_PLANE_0);
> -		vepu_write_relaxed(vpu, src[1], VEPU_REG_ADDR_IN_PLANE_1);
> -	} else {
> -		src[0] = vb2_dma_contig_plane_dma_addr(src_buf, 0);
> -		src[1] = vb2_dma_contig_plane_dma_addr(src_buf, 1);
> -		src[2] = vb2_dma_contig_plane_dma_addr(src_buf, 2);
> -		vepu_write_relaxed(vpu, src[0], VEPU_REG_ADDR_IN_PLANE_0);
> -		vepu_write_relaxed(vpu, src[1], VEPU_REG_ADDR_IN_PLANE_1);
> -		vepu_write_relaxed(vpu, src[2], VEPU_REG_ADDR_IN_PLANE_2);
> +	for (i = 0; i < num_planes; i++) {
> +		src = vb2_dma_contig_plane_dma_addr(src_buf, i);
> +		vepu_write_relaxed(vpu, src, __vepu_reg_addr_for_plane(i));
>  	}
>  }
>  

