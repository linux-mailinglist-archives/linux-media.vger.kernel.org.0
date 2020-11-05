Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F07C2A7828
	for <lists+linux-media@lfdr.de>; Thu,  5 Nov 2020 08:43:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727018AbgKEHno (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Nov 2020 02:43:44 -0500
Received: from mail.kernel.org ([198.145.29.99]:49292 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725320AbgKEHnn (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Nov 2020 02:43:43 -0500
Received: from coco.lan (ip5f5ad5d8.dynamic.kabel-deutschland.de [95.90.213.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B040320936;
        Thu,  5 Nov 2020 07:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604562222;
        bh=TpQRQSKfnEsyI7zbs1YM0hwAPhxQt3TDcY1O28o52Hw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=klKcQHiPtLF0ik80B+w91Sq2HckwmFmQ+rp1F/N3Pxkh0Rq/h6T/hHnKRXekrW9VI
         /ra2krRS9nbMXRMYj25zHa0mva52ZKI3jNKB38GQqXcVR0WU6/fnuK3CaWU0r4mjqe
         JaiS4SoDdu4AKp0GA2vD3HQmkv+oKF+6QtwW3/LM=
Date:   Thu, 5 Nov 2020 08:43:38 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH v2 003/106] smiapp: Calculate CCS limit offsets and
 limit buffer size
Message-ID: <20201105084338.23327eea@coco.lan>
In-Reply-To: <20201007084557.25843-3-sakari.ailus@linux.intel.com>
References: <20201007084505.25761-1-sakari.ailus@linux.intel.com>
        <20201007084557.25843-1-sakari.ailus@linux.intel.com>
        <20201007084557.25843-3-sakari.ailus@linux.intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed,  7 Oct 2020 11:44:23 +0300
Sakari Ailus <sakari.ailus@linux.intel.com> escreveu:

> Calculate the limit offsets and the size of the limit buffer. CCS limits
> are read into this buffer, and the offsets are helpful in accessing the
> information in it.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/smiapp/smiapp-core.c | 40 +++++++++++++++++++++++++-
>  1 file changed, 39 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/smiapp/smiapp-core.c b/drivers/media/i2c/smiapp/smiapp-core.c
> index 105ef29152e8..47e983e9cd87 100644
> --- a/drivers/media/i2c/smiapp/smiapp-core.c
> +++ b/drivers/media/i2c/smiapp/smiapp-core.c
> @@ -27,6 +27,7 @@
>  #include <media/v4l2-fwnode.h>
>  #include <media/v4l2-device.h>
>  
> +#include "ccs-limits.h"
>  #include "smiapp.h"
>  
>  #define SMIAPP_ALIGN_DIM(dim, flags)	\
> @@ -34,6 +35,11 @@
>  	 ? ALIGN((dim), 2)		\
>  	 : (dim) & ~1)
>  
> +struct ccs_limit_offset {
> +	u16	lim;
> +	u16	info;
> +} ccs_limit_offsets[CCS_L_LAST + 1];
> +

Hmm... that sounds weird. 

As you're declaring the struct inside smiapp-core.c, this
should be static...

>  /*
>   * smiapp_module_idents - supported camera modules
>   */
> @@ -3166,7 +3172,39 @@ static struct i2c_driver smiapp_i2c_driver = {
>  	.id_table = smiapp_id_table,
>  };
>  
> -module_i2c_driver(smiapp_i2c_driver);
> +static int smiapp_module_init(void)
> +{
> +	unsigned int i, l;
> +
> +	for (i = 0, l = 0; ccs_limits[i].size && l < CCS_L_LAST; i++) {
> +		if (!(ccs_limits[i].flags & CCS_L_FL_SAME_REG)) {
> +			ccs_limit_offsets[l + 1].lim =
> +				ALIGN(ccs_limit_offsets[l].lim +
> +				      ccs_limits[i].size,
> +				      ccs_reg_width(ccs_limits[i + 1].reg));
> +			ccs_limit_offsets[l].info = i;
> +			l++;
> +		} else {
> +			ccs_limit_offsets[l].lim += ccs_limits[i].size;
> +		}
> +	}
> +
> +	if (WARN_ON(ccs_limits[i].size))
> +		return -EINVAL;

... yet, this is the only place where this is used.

It sounds to me that you should move the var to be inside this function,

e. g. changing the above to:

struct ccs_limit_offset {
	u16	lim;
	u16	info;
};

static int smiapp_module_init(void)
{
	struct ccs_limit_offset ccs_limit_offsets[CCS_L_LAST + 1];
	unsigned int i, l;


> +
> +	if (WARN_ON(l != CCS_L_LAST))
> +		return -EINVAL;
> +
> +	return i2c_register_driver(THIS_MODULE, &smiapp_i2c_driver);
> +}
> +
> +static void smiapp_module_cleanup(void)
> +{
> +	i2c_del_driver(&smiapp_i2c_driver);
> +}
> +
> +module_init(smiapp_module_init);
> +module_exit(smiapp_module_cleanup);
>  
>  MODULE_AUTHOR("Sakari Ailus <sakari.ailus@iki.fi>");
>  MODULE_DESCRIPTION("Generic SMIA/SMIA++ camera module driver");



Thanks,
Mauro
