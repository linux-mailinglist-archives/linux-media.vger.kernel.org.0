Return-Path: <linux-media+bounces-844-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DF77F4B3D
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 16:42:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C6B7AB20F73
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 15:42:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74F9755773;
	Wed, 22 Nov 2023 15:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WsSYv/Wt"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA9C44493;
	Wed, 22 Nov 2023 07:42:27 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5B9FE276;
	Wed, 22 Nov 2023 16:41:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1700667714;
	bh=bn0nJ8Ndl9lU9tfsNi9BaoIDkaD6hNR0oaXanoGoHA8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WsSYv/Wt9RtbEjCqnVDlohKNe7Oy5LK1lfPrHMFxE/+WMWbfeIlcOSYqt7lnZ/oXV
	 E6fWt1qJ5io4vjj3tztrcNK9CkNjfZR1dxWs9ToXW2+RqV0L7pd1X19fHiCPwrUz0s
	 lDwOFvs9iOoHS4QLrZOX7Fb3+STspsr4diN26pFM=
Date: Wed, 22 Nov 2023 17:42:31 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jacob Chen <jacob2.chen@rock-chips.com>,
	Yichong Zhong <zyc@rock-chips.com>,
	Shunqian Zheng <zhengsq@rock-chips.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Eddie Cai <eddie.cai.linux@gmail.com>,
	Allon Huang <allon.huang@rock-chips.com>,
	Jeffy Chen <jeffy.chen@rock-chips.com>, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: rkisp1: Fix media device memory leak
Message-ID: <20231122154231.GH3909@pendragon.ideasonboard.com>
References: <20231122-rkisp-fixes-v1-0-1958af371e39@ideasonboard.com>
 <20231122-rkisp-fixes-v1-1-1958af371e39@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231122-rkisp-fixes-v1-1-1958af371e39@ideasonboard.com>

Hi Tomi,

Thank you for the patch.

On Wed, Nov 22, 2023 at 04:42:22PM +0200, Tomi Valkeinen wrote:
> Add missing calls to media_device_cleanup() to fix memory leak.
> 
> Fixes: d65dd85281fb ("media: staging: rkisp1: add Rockchip ISP1 base driver")
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> index c41abd2833f1..e10cc2881757 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> @@ -617,6 +617,7 @@ static int rkisp1_probe(struct platform_device *pdev)
>  	media_device_unregister(&rkisp1->media_dev);
>  err_unreg_v4l2_dev:
>  	v4l2_device_unregister(&rkisp1->v4l2_dev);
> +	media_device_cleanup(&rkisp1->media_dev);

As media_device_cleanup() cleans up for media_device_init(), shouldn't
it go to the err_pm_runtime_disable label ? The label may need to be
renamed to err_media_cleanup then.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  err_pm_runtime_disable:
>  	pm_runtime_disable(&pdev->dev);
>  	return ret;
> @@ -637,6 +638,8 @@ static void rkisp1_remove(struct platform_device *pdev)
>  	media_device_unregister(&rkisp1->media_dev);
>  	v4l2_device_unregister(&rkisp1->v4l2_dev);
>  
> +	media_device_cleanup(&rkisp1->media_dev);
> +
>  	pm_runtime_disable(&pdev->dev);
>  }
>  

-- 
Regards,

Laurent Pinchart

