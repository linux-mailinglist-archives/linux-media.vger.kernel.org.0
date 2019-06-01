Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5224831AC0
	for <lists+linux-media@lfdr.de>; Sat,  1 Jun 2019 11:16:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726881AbfFAJQy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Jun 2019 05:16:54 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:46322 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726134AbfFAJQx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 Jun 2019 05:16:53 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 641D227FDAE;
        Sat,  1 Jun 2019 10:16:52 +0100 (BST)
Date:   Sat, 1 Jun 2019 11:16:49 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH v3 06/10] media: hantro: add support for separate
 control block
Message-ID: <20190601111649.51118ad5@collabora.com>
In-Reply-To: <20190531085523.10892-7-p.zabel@pengutronix.de>
References: <20190531085523.10892-1-p.zabel@pengutronix.de>
        <20190531085523.10892-7-p.zabel@pengutronix.de>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 31 May 2019 10:55:19 +0200
Philipp Zabel <p.zabel@pengutronix.de> wrote:

> On i.MX8MQ/MM a separate control block contains registers for per-core
> resets, clock gating, and fuse register control.
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/staging/media/hantro/hantro.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
> index feaa439a17b3..295a00d59a5f 100644
> --- a/drivers/staging/media/hantro/hantro.h
> +++ b/drivers/staging/media/hantro/hantro.h
> @@ -167,6 +167,7 @@ hantro_vdev_to_func(struct video_device *vdev)
>   * @bases:		Mapped addresses of VPU registers.
>   * @enc_base:		Mapped address of VPU encoder register for convenience.
>   * @dec_base:		Mapped address of VPU decoder register for convenience.
> + * @ctrl_base:		Mapped address of VPU control block.
>   * @vpu_mutex:		Mutex to synchronize V4L2 calls.
>   * @irqlock:		Spinlock to synchronize access to data structures
>   *			shared with interrupt handlers.
> @@ -185,6 +186,7 @@ struct hantro_dev {
>  	void __iomem **bases;
>  	void __iomem *enc_base;
>  	void __iomem *dec_base;
> +	void __iomem *ctrl_base;
>  
>  	struct mutex vpu_mutex;	/* video_device lock */
>  	spinlock_t irqlock;

