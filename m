Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15258347443
	for <lists+linux-media@lfdr.de>; Wed, 24 Mar 2021 10:14:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230334AbhCXJNg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Mar 2021 05:13:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:53466 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234605AbhCXJNM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Mar 2021 05:13:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 702BF6157F;
        Wed, 24 Mar 2021 09:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1616577192;
        bh=RUzX/nbmq3RGqHMtGfALSfCQu+1aN6qyVwAbUtdZfeQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RDbCVYJGerr6v35Ir/fH9j2vZdextEWxuCLxhUVSm4B9jy+mzdQ9mZo4EAqGZe05X
         IfYt++jxQw1nXgDX3YFfJ3qhzNwbPaUFDJXxD16hXdu/qXsLM1YZ9+ASceCZWaAg+L
         aqnHHMz/gEcuTIUYi/HbUTf3uF6E2KgecxRSRMAc=
Date:   Wed, 24 Mar 2021 10:13:09 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Zhichao Cai <tomstomsczc@163.com>
Cc:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, Zhichao Cai <caizhichao@yulong.com>
Subject: Re: [PATCH] drivers:staging: NULL check before some freeing
 functions is not needed.
Message-ID: <YFsCpTIneSZyj3t/@kroah.com>
References: <20210324084126.895-1-tomstomsczc@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210324084126.895-1-tomstomsczc@163.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Mar 24, 2021 at 04:41:26PM +0800, Zhichao Cai wrote:
> From: Zhichao Cai <caizhichao@yulong.com>
> 
> Fixes coccicheck warning:
> drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.c:390:2-8: WARNING: NULL check before some freeing functions is not needed.
> drivers/staging/media/atomisp/pci/sh_css_params.c:1579:2-8: WARNING: NULL check before some freeing functions is not needed.
> drivers/staging/media/atomisp/pci/sh_css_params.c:3010:2-8: WARNING: NULL check before some freeing functions is not needed.
> drivers/staging/media/atomisp/pci/atomisp_cmd.c:4269:2-8: WARNING: NULL check before some freeing functions is not needed.
> drivers/staging/media/atomisp/pci/atomisp_cmd.c:4630:2-7: WARNING: NULL check before some freeing functions is not needed.
> drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c:159:4-10: WARNING: NULL check before some freeing functions is not needed.

Please break this up per-driver.

And provide a real changelog text.

thanks,

greg k-h
