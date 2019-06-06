Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B3BE37B4F
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2019 19:43:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728842AbfFFRnW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jun 2019 13:43:22 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59840 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728777AbfFFRnW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Jun 2019 13:43:22 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 39AF32682D0;
        Thu,  6 Jun 2019 18:43:20 +0100 (BST)
Date:   Thu, 6 Jun 2019 19:43:16 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>,
        kernel@collabora.com, Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Pawel Osciak <pawel@osciak.com>
Subject: Re: [PATCH 0/5] media: Access videobuf2 buffers via an accessor
Message-ID: <20190606194316.080288c2@collabora.com>
In-Reply-To: <20190606154426.6899-1-ezequiel@collabora.com>
References: <20190606154426.6899-1-ezequiel@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu,  6 Jun 2019 12:44:21 -0300
Ezequiel Garcia <ezequiel@collabora.com> wrote:

> Hi,
> 
> This patchset introduces a new vb2_get_buffer accessor and then
> uses it on all the drivers that are accessing videobuf2
> private buffer array directly.

Just curious, how did you find all occurrences of direct q->bufs[]
accesses? If you used a cocci script it might be worth submitting it so
we don't end up with new offenders of the "don't access q->bufs[]
directly" rule.

> 
> I'm skipping Intel IPU3 driver here, since the code goes beyond
> just accessing the buffer. It also modifies the buffer queue
> directly. I believe this driver would need some more cleanup
> and love from its maintainers.
> 
> Note that OMAP2/OMAP3 display driver is videobuf1 and so not
> affected by this change.
> 
> Lastly, note that I'm doing the minimum changes to drivers I can't test,
> only using the new accessor and avoiding any further changes.

Can you also add a patch to remove the private buf pointers array in the
cedrus driver?

> `
> Thanks,
> Ezequiel
> 
> Ezequiel Garcia (5):
>   media: vb2: Introduce a vb2_get_buffer accessor
>   media: mtk-jpeg: Use vb2_get_buffer
>   media: mtk-vcodec: Use vb2_get_buffer
>   media: sti: Use vb2_get_buffer
>   media: rockchip: Use vb2_get_buffer
> 
>  .../media/platform/mtk-jpeg/mtk_jpeg_core.c    |  2 +-
>  .../media/platform/mtk-vcodec/mtk_vcodec_enc.c | 12 +++++++++---
>  drivers/media/platform/sti/hva/hva-v4l2.c      |  4 +++-
>  .../media/rockchip/vpu/rockchip_vpu_drv.c      |  9 ++++++---
>  include/media/videobuf2-core.h                 | 18 ++++++++++++++++++
>  5 files changed, 37 insertions(+), 8 deletions(-)
> 

