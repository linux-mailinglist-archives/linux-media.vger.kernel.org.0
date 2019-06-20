Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 489AA4C5ED
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2019 05:47:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726647AbfFTDrl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Jun 2019 23:47:41 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:45866 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726389AbfFTDrl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Jun 2019 23:47:41 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 442C0260E5C
Message-ID: <94add735d542fcf9236869801303a446d4b19996.camel@collabora.com>
Subject: Re: [PATCH 2/2] media: hantro: Add support for VP8 decoding on
 rk3288
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>,
        kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        ZhiChao Yu <zhichao.yu@rock-chips.com>
Date:   Thu, 20 Jun 2019 00:47:29 -0300
In-Reply-To: <20190617154024.1fdb5d3c@collabora.com>
References: <20190613151040.8971-1-ezequiel@collabora.com>
         <20190613151040.8971-3-ezequiel@collabora.com>
         <20190617154024.1fdb5d3c@collabora.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 2019-06-17 at 15:40 +0200, Boris Brezillon wrote:
> On Thu, 13 Jun 2019 12:10:40 -0300
> Ezequiel Garcia <ezequiel@collabora.com> wrote:
> 
> 
> > +static void cfg_parts(struct hantro_ctx *ctx,
> > +		      const struct v4l2_ctrl_vp8_frame_header *hdr)
> > +{
> > +	struct hantro_dev *vpu = ctx->dev;
> > +	struct vb2_v4l2_buffer *vb2_src;
> > +	u32 first_part_offset = VP8_FRAME_IS_KEY_FRAME(hdr) ? 10 : 3;
> > +	u32 dct_part_total_len = 0;
> > +	u32 dct_size_part_size = 0;
> > +	u32 dct_part_offset = 0;
> > +	u32 mb_offset_bytes = 0;
> > +	u32 mb_offset_bits = 0;
> > +	u32 mb_start_bits = 0;
> > +	struct vp8_dec_reg reg;
> > +	dma_addr_t src_dma;
> > +	u32 mb_size = 0;
> > +	u32 count = 0;
> > +	u32 i;
> > +
> > +	vb2_src = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> > +	src_dma = vb2_dma_contig_plane_dma_addr(&vb2_src->vb2_buf, 0);
> > +
> > +	/*
> > +	 * Calculate control partition mb data info
> > +	 * @macroblock_bit_offset:	bits offset of mb data from first
> > +	 *				part start pos
> > +	 * @mb_offset_bits:		bits offset of mb data from src_dma
> > +	 *				base addr
> > +	 * @mb_offset_byte:		bytes offset of mb data from src_dma
> > +	 *				base addr
> > +	 * @mb_start_bits:		bits offset of mb data from mb data
> > +	 *				64bits alignment addr
> > +	 */
> > +	mb_offset_bits = first_part_offset * 8
> > +		+ hdr->macroblock_bit_offset + 8;
> > +	mb_offset_bytes = mb_offset_bits / 8;
> > +	mb_start_bits = mb_offset_bits
> > +		- (mb_offset_bytes & (~DEC_8190_ALIGN_MASK)) * 8;
> > +	mb_size = hdr->first_part_size
> > +		- (mb_offset_bytes - first_part_offset)
> > +		+ (mb_offset_bytes & DEC_8190_ALIGN_MASK);
> 
> Nit: can we have operators placed at the end of a line instead of
> the beginning of the following line?

Sure.

Thanks for the review,
Eze

