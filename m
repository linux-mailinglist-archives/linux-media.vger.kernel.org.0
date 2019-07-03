Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0B565E407
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2019 14:32:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726598AbfGCMcs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jul 2019 08:32:48 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:38700 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726486AbfGCMcs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Jul 2019 08:32:48 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 2B7A828A928;
        Wed,  3 Jul 2019 13:32:46 +0100 (BST)
Date:   Wed, 3 Jul 2019 14:32:43 +0200
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
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        fbuergisser@chromium.org, linux-kernel@vger.kernel.org,
        ZhiChao Yu <zhichao.yu@rock-chips.com>
Subject: Re: [PATCH v2 2/2] media: hantro: Add support for VP8 decoding on
 rk3288
Message-ID: <20190703143243.60174ead@collabora.com>
In-Reply-To: <20190702170016.5210-3-ezequiel@collabora.com>
References: <20190702170016.5210-1-ezequiel@collabora.com>
        <20190702170016.5210-3-ezequiel@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue,  2 Jul 2019 14:00:16 -0300
Ezequiel Garcia <ezequiel@collabora.com> wrote:

> diff --git a/drivers/staging/media/hantro/rk3288_vpu_hw.c b/drivers/staging/media/hantro/rk3288_vpu_hw.c
> index bcacc4f51093..470e803e25a6 100644
> --- a/drivers/staging/media/hantro/rk3288_vpu_hw.c
> +++ b/drivers/staging/media/hantro/rk3288_vpu_hw.c
> @@ -74,6 +74,19 @@ static const struct hantro_fmt rk3288_vpu_dec_fmts[] = {
>  			.step_height = MPEG2_MB_DIM,
>  		},
>  	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_VP8_FRAME,
> +		.codec_mode = HANTRO_MODE_VP8_DEC,
> +		.max_depth = 2,
> +		.frmsize = {
> +			.min_width = 48,
> +			.max_width = 3840,
> +			.step_width = 16,
> +			.min_height = 48,
> +			.max_height = 2160,
> +			.step_height = 16,

Can you define VP8_MB_DIM and use if for step_{width,height} (as done
for MPEG2 and H264)?

Looks good otherwise:

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> +		},
> +	},
>  };
