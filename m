Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CE072FE66A
	for <lists+linux-media@lfdr.de>; Thu, 21 Jan 2021 10:34:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728768AbhAUJcW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jan 2021 04:32:22 -0500
Received: from vegas.theobroma-systems.com ([144.76.126.164]:56497 "EHLO
        mail.theobroma-systems.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728755AbhAUJcM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jan 2021 04:32:12 -0500
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74]:40726 helo=diego.localnet)
        by mail.theobroma-systems.com with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.80)
        (envelope-from <heiko.stuebner@theobroma-systems.com>)
        id 1l2WJK-0007TV-8r; Thu, 21 Jan 2021 10:31:26 +0100
From:   Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
To:     linux-media@vger.kernel.org,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     laurent.pinchart@ideasonboard.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
Subject: Re: [PATCH v7 2/5] media: rkisp1: stats: remove a wrong cast to u8
Date:   Thu, 21 Jan 2021 10:31:25 +0100
Message-ID: <1736090.BzM5BlMlMQ@diego>
Organization: Theobroma Systems
In-Reply-To: <20210120164446.1220-3-dafna.hirschfeld@collabora.com>
References: <20210120164446.1220-1-dafna.hirschfeld@collabora.com> <20210120164446.1220-3-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Mittwoch, 20. Januar 2021, 17:44:43 CET schrieb Dafna Hirschfeld:
> hist_bins is an array of type __u32. Each entry represent
> a 20 bit fixed point value as documented inline.
> The cast to u8 when setting the values is wrong. Remove it.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
>  drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
> index 3ddab8fa8f2d..4cdb180fa64d 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
> @@ -235,8 +235,7 @@ static void rkisp1_stats_get_hst_meas(struct rkisp1_stats *stats,
>  	pbuf->meas_type |= RKISP1_CIF_ISP_STAT_HIST;
>  	for (i = 0; i < RKISP1_CIF_ISP_HIST_BIN_N_MAX; i++)
>  		pbuf->params.hist.hist_bins[i] =
> -			(u8)rkisp1_read(rkisp1,
> -					RKISP1_CIF_ISP_HIST_BIN_0 + i * 4);
> +			rkisp1_read(rkisp1, RKISP1_CIF_ISP_HIST_BIN_0 + i * 4);
>  }
>  
>  static void rkisp1_stats_get_bls_meas(struct rkisp1_stats *stats,
> 




