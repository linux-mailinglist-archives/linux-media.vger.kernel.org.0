Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F334D48A91F
	for <lists+linux-media@lfdr.de>; Tue, 11 Jan 2022 09:13:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348774AbiAKINg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jan 2022 03:13:36 -0500
Received: from verein.lst.de ([213.95.11.211]:41436 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235106AbiAKINf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jan 2022 03:13:35 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id CE2D568BFE; Tue, 11 Jan 2022 09:13:31 +0100 (CET)
Date:   Tue, 11 Jan 2022 09:13:31 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     ezequiel@vanguardiasur.com.ar, linux-media@vger.kernel.org,
        laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl,
        ribalda@chromium.org, tfiga@chromium.org, senozhatsky@google.com,
        hch@lst.de, kernel@collabora.com
Subject: Re: [PATCH 3/3] media: stk1160: use dma_alloc_noncontiguous API
Message-ID: <20220111081331.GB21713@lst.de>
References: <20220111065505.6323-1-dafna.hirschfeld@collabora.com> <20220111065505.6323-4-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220111065505.6323-4-dafna.hirschfeld@collabora.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jan 11, 2022 at 08:55:05AM +0200, Dafna Hirschfeld wrote:
> Replace the urb buffers allocation to
> use the noncontiguous API. This improve performance
> on Arm.
> The noncontiguous API require handling
> synchronization.
> This commit is similar to the one sent to
> uvc: [1]

Strange formatting.  I'd flow this as:

Replace the urb buffers allocation to use the noncontiguous API.  This
improve performance on ARM plattform (XXX: insert why here)
The noncontiguous API requires the driver to handle synchronization.
This commit is similar to this one for the uvc driver:

    https://lkml.org/lkml/2021/3/12/1506

> @@ -310,6 +311,9 @@ static void stk1160_isoc_irq(struct urb *urb)
>  		return;
>  	}
>  
> +	dma_sync_sgtable_for_cpu(stk1160_get_dmadev(dev), stk_urb->sgt, DMA_FROM_DEVICE);
> +	invalidate_kernel_vmap_range(stk_urb->transfer_buffer, urb->transfer_buffer_length);

Besisdes the unreadably long lines, I'd invalidate the vmap range before
the direct mapping range.
