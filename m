Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12CFC56C10
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2019 16:33:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727437AbfFZOdE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jun 2019 10:33:04 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:41916 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725958AbfFZOdE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jun 2019 10:33:04 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5QEX3pF097054;
        Wed, 26 Jun 2019 09:33:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1561559583;
        bh=xh6SvfiQLLidYLmaCOT6fWWKWUw82OMTp7l+jXmWfsw=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=smYrbpxwFDdrpV30vzj4Np+AwxNbnaq3HL5JCOiVUyuEj8ELz5bBg5sdrUpXBao+D
         OqpxBQlvZgvCM1F04saVhu75pCIXtcxxdtz2hSLXQxErlCoEuWPFPSXEUv4M06Qqfe
         E5dFUHlKJ/oMUPOLK4js+lUW50m4kYm+3TluLp94=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5QEX362050812
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 26 Jun 2019 09:33:03 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 26
 Jun 2019 09:33:03 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 26 Jun 2019 09:33:03 -0500
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with SMTP id x5QEX38P130893;
        Wed, 26 Jun 2019 09:33:03 -0500
Date:   Wed, 26 Jun 2019 09:34:23 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC:     <linux-media@vger.kernel.org>
Subject: Re: [PATCH 15/16] ti-vpe: set device_caps in struct video_device
Message-ID: <20190626143423.d46uvkjtc4vuxjgf@ti.com>
References: <20190626074421.38739-1-hverkuil-cisco@xs4all.nl>
 <20190626074421.38739-16-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190626074421.38739-16-hverkuil-cisco@xs4all.nl>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Acked-by: Benoit Parrot <bparrot@ti.com>

Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote on Wed [2019-Jun-26 09:44:20 +0200]:
> Instead of filling in the struct v4l2_capability device_caps
> field, fill in the struct video_device device_caps field.
> 
> That way the V4L2 core knows what the capabilities of the
> video device are.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: Benoit Parrot <bparrot@ti.com>
> ---
>  drivers/media/platform/ti-vpe/cal.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> index 8d075683e448..3fa306a45787 100644
> --- a/drivers/media/platform/ti-vpe/cal.c
> +++ b/drivers/media/platform/ti-vpe/cal.c
> @@ -916,9 +916,6 @@ static int cal_querycap(struct file *file, void *priv,
>  
>  	snprintf(cap->bus_info, sizeof(cap->bus_info),
>  		 "platform:%s", ctx->v4l2_dev.name);
> -	cap->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING |
> -			    V4L2_CAP_READWRITE;
> -	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
>  	return 0;
>  }
>  
> @@ -1422,6 +1419,8 @@ static const struct video_device cal_videodev = {
>  	.ioctl_ops	= &cal_ioctl_ops,
>  	.minor		= -1,
>  	.release	= video_device_release_empty,
> +	.device_caps	= V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING |
> +			  V4L2_CAP_READWRITE,
>  };
>  
>  /* -----------------------------------------------------------------
> -- 
> 2.20.1
> 
