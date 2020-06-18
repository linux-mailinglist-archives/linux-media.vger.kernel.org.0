Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B7B31FF1D2
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2020 14:31:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727913AbgFRMaQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Jun 2020 08:30:16 -0400
Received: from gloria.sntech.de ([185.11.138.130]:53560 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727093AbgFRMaO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Jun 2020 08:30:14 -0400
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1jltg5-00080e-08; Thu, 18 Jun 2020 14:29:57 +0200
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     wu000273@umn.edu
Cc:     kjlu@umn.edu, Jacob Chen <jacob-chen@iotwrt.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hansverk@cisco.com>, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: rockchip/rga: Fix a reference count leak.
Date:   Thu, 18 Jun 2020 14:29:56 +0200
Message-ID: <2014126.fRahu6ktRn@diego>
In-Reply-To: <20200613231350.15504-1-wu000273@umn.edu>
References: <20200613231350.15504-1-wu000273@umn.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Sonntag, 14. Juni 2020, 01:13:49 CEST schrieb wu000273@umn.edu:
> From: Qiushi Wu <wu000273@umn.edu>
> 
> pm_runtime_get_sync() increments the runtime PM usage counter even
> when it returns an error code. Thus call pm_runtime_put_noidle()
> if pm_runtime_get_sync() fails.
> 
> Fixes: f7e7b48e6d79 ("[media] rockchip/rga: v4l2 m2m support")
> Signed-off-by: Qiushi Wu <wu000273@umn.edu>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
>  drivers/media/platform/rockchip/rga/rga-buf.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c b/drivers/media/platform/rockchip/rga/rga-buf.c
> index 36b821ccc1db..bf9a75b75083 100644
> --- a/drivers/media/platform/rockchip/rga/rga-buf.c
> +++ b/drivers/media/platform/rockchip/rga/rga-buf.c
> @@ -81,6 +81,7 @@ static int rga_buf_start_streaming(struct vb2_queue *q, unsigned int count)
>  
>  	ret = pm_runtime_get_sync(rga->dev);
>  	if (ret < 0) {
> +		pm_runtime_put_noidle(rga->dev);
>  		rga_buf_return_buffers(q, VB2_BUF_STATE_QUEUED);
>  		return ret;
>  	}
> 




