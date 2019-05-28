Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD3F22C180
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2019 10:39:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726574AbfE1Ij3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 May 2019 04:39:29 -0400
Received: from retiisi.org.uk ([95.216.213.190]:41418 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726538AbfE1Ij3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 May 2019 04:39:29 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 325B3634C7B;
        Tue, 28 May 2019 11:39:26 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.89)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1hVXdm-0000JF-3g; Tue, 28 May 2019 11:39:26 +0300
Date:   Tue, 28 May 2019 11:39:26 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH] mc-device.c: don't memset __user pointer contents
Message-ID: <20190528083925.532jvcx4tuuzer6o@valkosipuli.retiisi.org.uk>
References: <98876672-00cb-4648-4ba7-e960a2f6c2bb@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <98876672-00cb-4648-4ba7-e960a2f6c2bb@xs4all.nl>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Mon, May 27, 2019 at 11:31:13AM +0200, Hans Verkuil wrote:
> You can't memset the contents of a __user pointer. Instead, call copy_to_user to
> copy links.reserved (which is zeroed) to the user memory.
> 
> This fixes this sparse warning:
> 
> SPARSE:drivers/media/mc/mc-device.c drivers/media/mc/mc-device.c:521:16:  warning: incorrect type in argument 1 (different address spaces)
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Fixes: f49308878d720 ("media: media_device_enum_links32: clean a reserved field")
> ---
> Note: this patch sits on top of https://patchwork.linuxtv.org/patch/56330/,
> which moves the media sources to drivers/media/mc.
> ---
> diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
> index 6893843edada..8e2a66493e62 100644
> --- a/drivers/media/mc/mc-device.c
> +++ b/drivers/media/mc/mc-device.c
> @@ -518,8 +518,9 @@ static long media_device_enum_links32(struct media_device *mdev,
>  	if (ret)
>  		return ret;
> 
> -	memset(ulinks->reserved, 0, sizeof(ulinks->reserved));
> -
> +	if (copy_to_user(ulinks->reserved, links.reserved,
> +			 sizeof(ulinks->reserved)))
> +		return -EFAULT;
>  	return 0;

Good catch!

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

>  }
> 

-- 
Kind regards,

Sakari Ailus
