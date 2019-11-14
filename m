Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0ED89FC2E7
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2019 10:46:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726750AbfKNJqF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Nov 2019 04:46:05 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:47204 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726632AbfKNJqF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Nov 2019 04:46:05 -0500
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 7504B28DADD;
        Thu, 14 Nov 2019 09:46:03 +0000 (GMT)
Date:   Thu, 14 Nov 2019 10:46:00 +0100
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-media@vger.kernel.org, kernel@collabora.com,
        Tomasz Figa <tfiga@chromium.org>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Chris Healy <cphealy@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] media: hantro: Support color conversion via
 post-processing
Message-ID: <20191114104600.5c6c3e26@collabora.com>
In-Reply-To: <20191113175603.24742-3-ezequiel@collabora.com>
References: <20191113175603.24742-1-ezequiel@collabora.com>
        <20191113175603.24742-3-ezequiel@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

On Wed, 13 Nov 2019 14:56:02 -0300
Ezequiel Garcia <ezequiel@collabora.com> wrote:

> +
> +int hantro_postproc_alloc(struct hantro_ctx *ctx)
> +{
> +	struct hantro_dev *vpu = ctx->dev;
> +	unsigned int i, buf_size;
> +
> +	buf_size = ctx->dst_fmt.plane_fmt[0].sizeimage;
> +
> +	for (i = 0; i < VB2_MAX_FRAME; ++i) {

Don't we know at that point how big the queue is (vq->num_buffers)?
Sounds a bit expensive to always allocate VB2_MAX_FRAME aux buffers.

> +		struct hantro_aux_buf *priv = &ctx->postproc.dec_q[i];
> +
> +		/*
> +		 * The buffers on this queue are meant as intermediate
> +		 * buffers for the decoder, so no mapping is needed.
> +		 */
> +		priv->attrs = DMA_ATTR_NO_KERNEL_MAPPING;
> +		priv->cpu = dma_alloc_attrs(vpu->dev, buf_size, &priv->dma,
> +					    GFP_KERNEL, priv->attrs);
> +		if (!priv->cpu)
> +			return -ENOMEM;
> +		priv->size = buf_size;
> +	}
> +	return 0;
> +}

Other than that, the post-proc extension looks pretty good. Thought it
would be much more invasive than that.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
