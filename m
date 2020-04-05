Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B65FB19ECE0
	for <lists+linux-media@lfdr.de>; Sun,  5 Apr 2020 19:25:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726830AbgDERZB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 5 Apr 2020 13:25:01 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58416 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726696AbgDERZB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 5 Apr 2020 13:25:01 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 95067312;
        Sun,  5 Apr 2020 19:24:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586107499;
        bh=h84jDVnVV1dg4bRlg+WNWCpdTn70oRmHS5SA/xfaQbE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ghro+4nPDYZ3i2F+0z245Np10WrV9/0TVra4Q0VUHMS838KQ1CKozKiaYFDomgY0/
         a9u1w+P5m3gObNu+iI6wuFTZGEUTt2GNnO6tEN0FwOP5Ts1d9wxuYSd8TQTlU03QB3
         1vG78pv4Rtl0tYjKyRTL7xJwJRUsCgNqBr45tsZ8=
Date:   Sun, 5 Apr 2020 20:24:50 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-media@vger.kernel.org, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org
Subject: Re: [PATCH 1/3] media: staging: rkisp1: rsz: get the capture format
 info from the capture struct
Message-ID: <20200405172450.GH5846@pendragon.ideasonboard.com>
References: <20200328105606.13660-1-dafna.hirschfeld@collabora.com>
 <20200328105606.13660-2-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200328105606.13660-2-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

Thank you for the patch.

On Sat, Mar 28, 2020 at 11:56:04AM +0100, Dafna Hirschfeld wrote:
> Currently the format info of the capture is retrieved by calling
> the function  v4l2_format_info. This is not needed since it is
> already save in the capture object.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/staging/media/rkisp1/rkisp1-resizer.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-resizer.c b/drivers/staging/media/rkisp1/rkisp1-resizer.c
> index 87799fbf0363..8704267a066f 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-resizer.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-resizer.c
> @@ -387,8 +387,7 @@ static void rkisp1_rsz_config(struct rkisp1_resizer *rsz,
>  	if (rsz->fmt_type == RKISP1_FMT_YUV) {
>  		struct rkisp1_capture *cap =
>  			&rsz->rkisp1->capture_devs[rsz->id];
> -		const struct v4l2_format_info *pixfmt_info =
> -			v4l2_format_info(cap->pix.fmt.pixelformat);
> +		const struct v4l2_format_info *pixfmt_info = cap->pix.info;
>  
>  		hdiv = pixfmt_info->hdiv;
>  		vdiv = pixfmt_info->vdiv;

-- 
Regards,

Laurent Pinchart
