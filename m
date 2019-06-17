Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41FCC4843D
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2019 15:40:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726028AbfFQNk3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jun 2019 09:40:29 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:54282 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725884AbfFQNk3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jun 2019 09:40:29 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 54836282442;
        Mon, 17 Jun 2019 14:40:27 +0100 (BST)
Date:   Mon, 17 Jun 2019 15:40:24 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>,
        kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        ZhiChao Yu <zhichao.yu@rock-chips.com>
Subject: Re: [PATCH 2/2] media: hantro: Add support for VP8 decoding on
 rk3288
Message-ID: <20190617154024.1fdb5d3c@collabora.com>
In-Reply-To: <20190613151040.8971-3-ezequiel@collabora.com>
References: <20190613151040.8971-1-ezequiel@collabora.com>
        <20190613151040.8971-3-ezequiel@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 13 Jun 2019 12:10:40 -0300
Ezequiel Garcia <ezequiel@collabora.com> wrote:


> +static void cfg_parts(struct hantro_ctx *ctx,
> +		      const struct v4l2_ctrl_vp8_frame_header *hdr)
> +{
> +	struct hantro_dev *vpu = ctx->dev;
> +	struct vb2_v4l2_buffer *vb2_src;
> +	u32 first_part_offset = VP8_FRAME_IS_KEY_FRAME(hdr) ? 10 : 3;
> +	u32 dct_part_total_len = 0;
> +	u32 dct_size_part_size = 0;
> +	u32 dct_part_offset = 0;
> +	u32 mb_offset_bytes = 0;
> +	u32 mb_offset_bits = 0;
> +	u32 mb_start_bits = 0;
> +	struct vp8_dec_reg reg;
> +	dma_addr_t src_dma;
> +	u32 mb_size = 0;
> +	u32 count = 0;
> +	u32 i;
> +
> +	vb2_src = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> +	src_dma = vb2_dma_contig_plane_dma_addr(&vb2_src->vb2_buf, 0);
> +
> +	/*
> +	 * Calculate control partition mb data info
> +	 * @macroblock_bit_offset:	bits offset of mb data from first
> +	 *				part start pos
> +	 * @mb_offset_bits:		bits offset of mb data from src_dma
> +	 *				base addr
> +	 * @mb_offset_byte:		bytes offset of mb data from src_dma
> +	 *				base addr
> +	 * @mb_start_bits:		bits offset of mb data from mb data
> +	 *				64bits alignment addr
> +	 */
> +	mb_offset_bits = first_part_offset * 8
> +		+ hdr->macroblock_bit_offset + 8;
> +	mb_offset_bytes = mb_offset_bits / 8;
> +	mb_start_bits = mb_offset_bits
> +		- (mb_offset_bytes & (~DEC_8190_ALIGN_MASK)) * 8;
> +	mb_size = hdr->first_part_size
> +		- (mb_offset_bytes - first_part_offset)
> +		+ (mb_offset_bytes & DEC_8190_ALIGN_MASK);

Nit: can we have operators placed at the end of a line instead of
the beginning of the following line?
