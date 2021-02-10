Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A20E316AC1
	for <lists+linux-media@lfdr.de>; Wed, 10 Feb 2021 17:10:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231868AbhBJQJW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Feb 2021 11:09:22 -0500
Received: from lahtoruutu.iki.fi ([185.185.170.37]:54966 "EHLO
        lahtoruutu.iki.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231695AbhBJQJU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Feb 2021 11:09:20 -0500
Received: from hillosipuli.retiisi.eu (dbd4xkyj7wcfw2k22jcct-3.rev.dnainternet.fi [IPv6:2001:14ba:8f1:3400:fb90:892b:22d6:3885])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id E85371B000C8;
        Wed, 10 Feb 2021 18:08:34 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1612973315;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=R949bkNezCGCFvq0xcUf9iqG/zEccVONheGJxkb1dQ4=;
        b=mJTdvf5eGuSsw+3VB6KzZw/sjMJ611TbLAuiLFJDkG97c7dqEevpArqve1VHdCfluIMA5S
        HipoYRGxi+uhDQP4YuvzneuK2mjtVDUnYu/dBnr0D4XuAhwIT4WrTm92TQqIHbJYL4d4g3
        5vunCMQ/ixVzOU9qHqth6e4KOjxfN/mQ/YhmfjdTBAtOP3gRV7GmPZ0Vaw+o69lmdHZBNb
        jVS4/GvnHo3oUo2HA5wOogGmvAOArWTMZ7hKYqWM3JU5PxigiZwpEKIx+SQeM/9QK0fcTj
        7+ml9fAPXTU59NWtowrkVq/sHGzYe7WhUcEZ7+Saav2/24I/6xk5dSurU1T4TQ==
Received: from valkosipuli.localdomain (valkosipuli.localdomain [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id B2E2E634C96;
        Wed, 10 Feb 2021 18:07:54 +0200 (EET)
Received: from localhost ([127.0.0.1] helo=valkosipuli.retiisi.eu)
        by valkosipuli.localdomain with esmtp (Exim 4.92)
        (envelope-from <sakari.ailus@iki.fi>)
        id 1l9s2Z-000667-R5; Wed, 10 Feb 2021 18:08:31 +0200
Date:   Wed, 10 Feb 2021 18:08:31 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-next@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] media: i2c: max9271: Add MODULE_* macros
Message-ID: <20210210160831.GC3@valkosipuli.retiisi.eu>
References: <20210210154908.1227203-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210210154908.1227203-1-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1612973315; a=rsa-sha256;
        cv=none;
        b=eHxEgi58FpPl2V5a0VG+BIBmUkGB7VSPDAJEcwRQDCNzDmAWwQucOJghZPnNy3htXycVFu
        1X1c0akbm1hWtX4II+htB1EwwWAFcTNL0iVEDT4nhbPpl4buc56groh3BiIUY4ECxXdvt2
        3HYjU3q7ONZupTyJDjaFAQTUr7o0tptPeDBhP8cBe+IjL6nU/Tz4majZDRvXPILmaJ6Isc
        OCAPVCsDxir0A/rGldiJYBcNptsI5SJavwy5YdMwqrGZ0+GF9yPaiGqCPiVybJ0PmcbBHW
        HlesxhDurPhZsyzqyo3tqSKm3TBu01RLfm/tWQvCTJi+UbwPmfxqYzkjRsx5VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1612973315;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=R949bkNezCGCFvq0xcUf9iqG/zEccVONheGJxkb1dQ4=;
        b=LBKv7p67mybfy0QJHzfLrjhhUfl2TlAO79PGIpw5qpj2XKcVg59EGSm0midRakg8O0PJE3
        rJneCY+g7I7BBXapvfokI4m/fLhMHJMKz1nY+8HohRIxh3wljkITt+Aa6Kv1mOW9DNTz+d
        2CWstEL1HBzoJt+n2PXdmzH8vnmusclZntQIPyyRs+u8K3jEUaE2jgOueDGBA5ky0ejEUB
        RzY8JLvT0yr0Z4bSO86C12/ug0++apmXmvussjcmdSWFqKnVtxOp9+BplY6nzgNlXw3Sky
        NpYJFNX8odGojxQqiCOgW/HeJcFN9YkCr6oxk5M08bRwlzI5z6ueTZset/GKBQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Feb 10, 2021 at 04:49:08PM +0100, Jacopo Mondi wrote:
> Since commit 7f03d9fefcc5 ("media: i2c: Kconfig: Make MAX9271
> a module") the max9271 library is built as a module but no
> MODULE_*() attributes were specified, causing a build error
> due to missing license information.
> 
> ERROR: modpost: missing MODULE_LICENSE() in drivers/media/i2c/max9271.o
> 
> Fix this by adding MODULE attributes to the driver.
> 
> Fixes: 7f03d9fefcc5 ("media: i2c: Kconfig: Make MAX9271 a module")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/media/i2c/max9271.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/media/i2c/max9271.c b/drivers/media/i2c/max9271.c
> index c247db569bab..c495582dcff6 100644
> --- a/drivers/media/i2c/max9271.c
> +++ b/drivers/media/i2c/max9271.c
> @@ -18,6 +18,7 @@
> 
>  #include <linux/delay.h>
>  #include <linux/i2c.h>
> +#include <linux/module.h>
> 
>  #include "max9271.h"
> 
> @@ -339,3 +340,7 @@ int max9271_set_translation(struct max9271_device *dev, u8 source, u8 dest)
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(max9271_set_translation);
> +
> +MODULE_DESCRIPTION("Maxim MAX9271 GMSL Serializer");
> +MODULE_AUTHOR("Jacopo Mondi");
> +MODULE_LICENSE("GPL v2");

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
