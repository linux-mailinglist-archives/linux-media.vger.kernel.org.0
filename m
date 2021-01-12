Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C08D2F3626
	for <lists+linux-media@lfdr.de>; Tue, 12 Jan 2021 17:51:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390602AbhALQud (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jan 2021 11:50:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:41404 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389223AbhALQud (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jan 2021 11:50:33 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6D57123110;
        Tue, 12 Jan 2021 16:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610470192;
        bh=P6f5DWGB2Yj3sDhTI2cw0AhD+OoZDwYKE0LKvbWUW0M=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ePoSw+NxWN4Yr/ug5glV9goKKxniDhm4GVr1IP7ukwDSfKPOp0xUes6qy8dOTzfVa
         0+/9Xr2hwJ4btAZWBnlUdembuOcnRWXNkL/Vns+Sq51jpjU6O/hXJ9wagv8y2WwajB
         Y8NDtBp12joow8xIHXQcldk7cabRouCdaVhvQdMHL9VTg54eg5GCJOA0frZC5Y44Nn
         q2cXDQfCxtZJ+jrZWEdowgToMSQSPg48p78cCtYqZH3dWF2eR0B1YemLzE6JeiEhfS
         7dgDwCqEZu8cJlqpxLt9dDTKIaCMdIJbkmiJKNtY33QY1iX86F9P2ZpBs7Q51PT6b5
         jsDpgJYIraYWA==
Date:   Tue, 12 Jan 2021 17:49:48 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 17/24] ccs: Wait until software reset is done
Message-ID: <20210112174948.1434286d@coco.lan>
In-Reply-To: <20201207211530.21180-18-sakari.ailus@linux.intel.com>
References: <20201207211530.21180-1-sakari.ailus@linux.intel.com>
        <20201207211530.21180-18-sakari.ailus@linux.intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon,  7 Dec 2020 23:15:23 +0200
Sakari Ailus <sakari.ailus@linux.intel.com> escreveu:

> Verify the software reset has been completed until proceeding.
> 
> The spec does not guarantee a delay but presumably 100 ms should be
> enough.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/ccs/ccs-core.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> index fdf2e83eeac3..e1b3c5693e01 100644
> --- a/drivers/media/i2c/ccs/ccs-core.c
> +++ b/drivers/media/i2c/ccs/ccs-core.c
> @@ -1553,11 +1553,26 @@ static int ccs_power_on(struct device *dev)
>  	 */
>  
>  	if (!sensor->reset && !sensor->xshutdown) {
> +		u8 retry = 100;
> +		u32 reset;
> +
>  		rval = ccs_write(sensor, SOFTWARE_RESET, CCS_SOFTWARE_RESET_ON);
>  		if (rval < 0) {
>  			dev_err(dev, "software reset failed\n");
>  			goto out_cci_addr_fail;
>  		}
> +
> +		do {
> +			rval = ccs_read(sensor, SOFTWARE_RESET, &reset);
> +			reset = !rval && reset == CCS_SOFTWARE_RESET_OFF;
> +			if (reset)
> +				break;
> +
> +			usleep_range(1000, 2000);
> +		} while (--retry);

Hmm... the way it is, the loop will wait for some time between
100ms and 200ms. Based on past experiences with non-deterministic
sleep times, this can be hard to debug if some device would require
to wait for a value between 100ms and 200ms.

So, I would, instead, make the retry time more deterministic, by
using time_is_after_jiffies(), e. g.:

	end = jiffies + msecs_to_jiffies(retry);
	do {
		rval = ccs_read(sensor, SOFTWARE_RESET, &reset);
		reset = !rval && reset == CCS_SOFTWARE_RESET_OFF;
		if (reset)
			break;

		usleep_range(1000, 2000);
	} while (time_is_after_jiffies(end));

In any case, I'm taking this patch, but it seems worth to change
to something like the above on a followup patch.

> +
> +		if (!reset)
> +			return -EIO;
>  	}
>  
>  	if (sensor->hwcfg.i2c_addr_alt) {



Thanks,
Mauro
