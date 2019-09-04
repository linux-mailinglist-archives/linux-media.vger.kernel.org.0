Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B580A842A
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2019 15:49:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730082AbfIDNHq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Sep 2019 09:07:46 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:50082 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729296AbfIDNHq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Sep 2019 09:07:46 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 9EE3728D622
Message-ID: <b7a43c96fa861de1dbbe969e3aaa4220e7e96793.camel@collabora.com>
Subject: Re: [PATCH 01/12] media: hantro: Fix H264 max frmsize supported on
 RK3288
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Jonas Karlman <jonas@kwiboo.se>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-rockchip@lists.infradead.org" 
        <linux-rockchip@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Date:   Wed, 04 Sep 2019 10:07:36 -0300
In-Reply-To: <HE1PR06MB4011EAB6F0965D47A20AF805ACBF0@HE1PR06MB4011.eurprd06.prod.outlook.com>
References: <HE1PR06MB40117D0EE96E6FA638A04B78ACBF0@HE1PR06MB4011.eurprd06.prod.outlook.com>
         <HE1PR06MB4011EAB6F0965D47A20AF805ACBF0@HE1PR06MB4011.eurprd06.prod.outlook.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Jonas,

Thank you for the patch.

On Sun, 2019-09-01 at 12:45 +0000, Jonas Karlman wrote:
> TRM specify supported image size 48x48 to 4096x2304 at step size 16 pixels,
> change frmsize max_width/max_height to match TRM.
> 

The RK3288 TRM v1.1 (2015-8-20) I have here mentions a maximum
of 3840x2160.

I must admit I haven't tested with actual content this size
to verify it, have you checked it?

Thanks,
Ezequiel
 
> Fixes: 760327930e10 ("media: hantro: Enable H264 decoding on rk3288")
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
>  drivers/staging/media/hantro/rk3288_vpu_hw.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/hantro/rk3288_vpu_hw.c b/drivers/staging/media/hantro/rk3288_vpu_hw.c
> index 6bfcc47d1e58..ebb017b8a334 100644
> --- a/drivers/staging/media/hantro/rk3288_vpu_hw.c
> +++ b/drivers/staging/media/hantro/rk3288_vpu_hw.c
> @@ -67,10 +67,10 @@ static const struct hantro_fmt rk3288_vpu_dec_fmts[] = {
>  		.max_depth = 2,
>  		.frmsize = {
>  			.min_width = 48,
> -			.max_width = 3840,
> +			.max_width = 4096,
>  			.step_width = H264_MB_DIM,
>  			.min_height = 48,
> -			.max_height = 2160,
> +			.max_height = 2304,
>  			.step_height = H264_MB_DIM,
>  		},
>  	},


