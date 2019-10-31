Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31EE1EABD4
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2019 09:52:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727070AbfJaIwo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 31 Oct 2019 04:52:44 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:44940 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727008AbfJaIwo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 31 Oct 2019 04:52:44 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E06E028FA70;
        Thu, 31 Oct 2019 08:52:41 +0000 (GMT)
Date:   Thu, 31 Oct 2019 09:52:38 +0100
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Jonas Karlman <jonas@kwiboo.se>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 01/10] media: hantro: Fix H264 max frmsize supported
 on RK3288
Message-ID: <20191031095238.683b69d9@collabora.com>
In-Reply-To: <HE1PR06MB4011858F97A96AD25E75E2E1AC610@HE1PR06MB4011.eurprd06.prod.outlook.com>
References: <HE1PR06MB401108289F09802C261374F8AC610@HE1PR06MB4011.eurprd06.prod.outlook.com>
        <HE1PR06MB4011858F97A96AD25E75E2E1AC610@HE1PR06MB4011.eurprd06.prod.outlook.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 29 Oct 2019 01:24:47 +0000
Jonas Karlman <jonas@kwiboo.se> wrote:

> TRM specify supported image size 48x48 to 4096x2304 at step size 16 pixels,
> change frmsize max_width/max_height to match TRM at [1].
> 
> This patch makes it possible to decode the 4096x2304 sample at [2].
> 
> [1] http://www.t-firefly.com/download/firefly-rk3288/docs/TRM/rk3288-chapter-25-video-encoder-decoder-unit-(vcodec).pdf
> [2] https://4ksamples.com/puppies-bath-in-4k/
> 
> Fixes: 760327930e10 ("media: hantro: Enable H264 decoding on rk3288")
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Tested-by: Boris Brezillon <boris.brezillon@collabora.com>

Let's also add

Cc: <stable@vger.kernel.org>

just in case this patch doesn't make it to 5.4.


> ---
> Changes in v2:
>   - updated commit message with reference to TRM and sample video
> ---
>  drivers/staging/media/hantro/rk3288_vpu_hw.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/hantro/rk3288_vpu_hw.c b/drivers/staging/media/hantro/rk3288_vpu_hw.c
> index c0bdd6c02520..f8db6fcaad73 100644
> --- a/drivers/staging/media/hantro/rk3288_vpu_hw.c
> +++ b/drivers/staging/media/hantro/rk3288_vpu_hw.c
> @@ -67,10 +67,10 @@ static const struct hantro_fmt rk3288_vpu_dec_fmts[] = {
>  		.max_depth = 2,
>  		.frmsize = {
>  			.min_width = 48,
> -			.max_width = 3840,
> +			.max_width = 4096,
>  			.step_width = MB_DIM,
>  			.min_height = 48,
> -			.max_height = 2160,
> +			.max_height = 2304,
>  			.step_height = MB_DIM,

Hans, Mauro, we were intending to have this fix merged in 5.4 or at
the very least be backported to the 5.4 stable branch at some point,
the problem is, this patch is based on media/master which contains the
s/MB_DIM_H264/MB_DIM/ change. I can send a new version based on
media/fixes, but that means Linus will have a conflict when merging the
media 5.5 PR in his tree. Are you fine dealing with this conflict
(letting Linus know about the expected resolution or backmerging the -rc
containing the fix in media/master so that he doesn't even have to deal
with it), or should we just let this patch go in media/master and
backport it later?

>  		},
>  	},

