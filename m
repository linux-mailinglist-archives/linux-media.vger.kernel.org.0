Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6FD5320D34
	for <lists+linux-media@lfdr.de>; Sun, 21 Feb 2021 20:38:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230107AbhBUTii (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 Feb 2021 14:38:38 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:52528 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229956AbhBUTii (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Feb 2021 14:38:38 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 98889EF;
        Sun, 21 Feb 2021 20:37:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613936275;
        bh=qP6OKimd/rJdcmuU8EbpP2wAFrBG/ttU8cUIAT7EGmM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gJMkJcSM76wO4XXc/+fFDAwQYID45+pvLdJdMReuUF+iuKgmr7QL1dGQXxQrGQwrq
         mtl281tV/mETnFeaZZfWk1HCDRFKTl0ZuwQtKKQuIgspOFe2SkxADLStATGOyLth58
         RBelmK+13XDKsxYJfutTs3lBTATq+khDHvP/L64Y=
Date:   Sun, 21 Feb 2021 21:37:29 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH] media: staging: ipu3: uapi: Add "WITH
 Linux-syscall-note" license
Message-ID: <YDK2eV/MVDUbSgPs@pendragon.ideasonboard.com>
References: <20210207235610.15687-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210207235610.15687-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

Gentle ping.

On Mon, Feb 08, 2021 at 01:56:10AM +0200, Laurent Pinchart wrote:
> All Linux headers licensed under the GPL-2.0 must include a "WITH
> Linux-syscall-note" extension in their SPDX license identifier, as
> enforced by the scripts/headers_install.sh script. Fix the Intel IPU3
> UAPI header currently stored with the driver in staging.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/staging/media/ipu3/include/intel-ipu3.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/ipu3/include/intel-ipu3.h b/drivers/staging/media/ipu3/include/intel-ipu3.h
> index edd8edda0647..9b644fb23dde 100644
> --- a/drivers/staging/media/ipu3/include/intel-ipu3.h
> +++ b/drivers/staging/media/ipu3/include/intel-ipu3.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
>  /* Copyright (C) 2017 - 2018 Intel Corporation */
>  
>  #ifndef __IPU3_UAPI_H

-- 
Regards,

Laurent Pinchart
