Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C41E038C8D7
	for <lists+linux-media@lfdr.de>; Fri, 21 May 2021 16:00:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235243AbhEUOCH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 May 2021 10:02:07 -0400
Received: from lahtoruutu.iki.fi ([185.185.170.37]:58114 "EHLO
        lahtoruutu.iki.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232991AbhEUOCG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 May 2021 10:02:06 -0400
X-Greylist: delayed 12878 seconds by postgrey-1.27 at vger.kernel.org; Fri, 21 May 2021 10:02:06 EDT
Received: from hillosipuli.retiisi.eu (dsl-hkibng32-54fb5d-176.dhcp.inet.fi [84.251.93.176])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 69F811B00257;
        Fri, 21 May 2021 17:00:38 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1621605638;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=QllnwyRWwAtHG+XzayPFz+Gs6nk8qokLOo3cIvup11k=;
        b=i2ZqtvIvO98HtOLujfuo1g49TjlnoM8iyh4tRlpU0ViNA8S3AG6+d4XkBs65Ha4fveVQs3
        MjScUJKqAgZ03CGP7G5TTENf560ACRJz21MNM4g37FWP6kEjEBQhWRqxOXcNZmNg/NtqZd
        IJvEd3o4wpnazVBH79JL7WFNhiu+3pkbBH8K8XyyHVWlwSGlPlnU/OCX8qE5yACTqV4cbr
        0bmdFutbOZKhspCCpcd89AWXndh8W2bhKjtvXp1x7KlyOtplbdazICCkDCsRVgoBjNzJhu
        g0IChP7eBovdBwkp+q90MWtzWQIYsMMQTTcVI5u/9F8MQMpBetE360vq6RTpUg==
Received: from valkosipuli.localdomain (valkosipuli.localdomain [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id DC2A4634C87;
        Fri, 21 May 2021 17:00:36 +0300 (EEST)
Received: from localhost ([127.0.0.1] helo=valkosipuli.retiisi.eu)
        by valkosipuli.localdomain with esmtp (Exim 4.92)
        (envelope-from <sakari.ailus@iki.fi>)
        id 1lk5he-0000Eg-6I; Fri, 21 May 2021 17:00:38 +0300
Date:   Fri, 21 May 2021 17:00:38 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Pratyush Yadav <p.yadav@ti.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: ov5648: Plug runtime pm counter leak
Message-ID: <20210521140037.GA3@valkosipuli.retiisi.eu>
References: <20210511124437.9930-1-p.yadav@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210511124437.9930-1-p.yadav@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1621605638;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=QllnwyRWwAtHG+XzayPFz+Gs6nk8qokLOo3cIvup11k=;
        b=U/loQnYlCFKyWdsqhiRD5yXaaXHoUQ62JX90hsJaHFN014/emS7TcfKS+m3EO5hKjBrEH0
        B9zLIVelviXDnluyv08S6EM7SzoZY0DCOmU3e5vDm7hkw4BB5Vk9dsRIpLSqOtk5pokNVW
        sRdwfjA6dJzHfnqlewJKCe0atk9RWwrvDsxfwHDcypHfpLfIXBwuXtkDoxyQFAZU+0eoTL
        j0J3arMe9MYtlc5qINOC+XMCyU/0ib4Zs8Fyqey45I+4iifhOe6MA1F/Wk4ZwRgwwjj7sA
        soJejH+0lIj1vFZj/sEUawQsgZQKBTz2I7vHbNoy1XMhs5fgFrI4scBDEzWEJA==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1621605638; a=rsa-sha256;
        cv=none;
        b=ByL7bGem7Hx+4kksU1hbTa/1MW96kD5EMiT4lGPxGY/6yeGSLjiO8QyX/o/fObGaQrzEnE
        iUV/ivZ21vEclxCKm8qTYrX/epXpr2DST1l/hIEgWpXBurqpfsdnNj5bXWLFHT1bVMo5K1
        SAeqTpl65VX9sxz5wi2W006DHOLGMqSv+Lk2SMncwyeOotjdx5rUWJAQ35uP5cz4zoSu3f
        wqouwSqFPEXtA2Ojsqc+oMDl6w+MJcP+g7x6IJ83EnJoBjAYW/KEX3IaA87zu3bnkMp0+N
        fkMzH1vxzJyopX5C+9URM9tzjwmo8O6kgywEBafdRPVnXPrOoWjjegQpoeJXew==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Pratyush,

Thanks for the patch.

On Tue, May 11, 2021 at 06:14:37PM +0530, Pratyush Yadav wrote:
> When the stream is being enabled, the runtime pm usage counter is
> incremented. Then if ov5648_sw_standby() fails, the function returns
> error without decrementing the counter, leaking it.
> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> ---
> 
> Hi,
> 
> I spotted this when converting OV5640 driver to use runtime PM using
> this driver as reference. I only have a very surface level understanding
> of runtime PM system as of now so please review with that in mind.
> 
> This patch is only compile-tested since I don't have the hardware with
> me.
> 
>  drivers/media/i2c/ov5648.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov5648.c b/drivers/media/i2c/ov5648.c
> index 3ecb4a3e8773..6aa2c950f505 100644
> --- a/drivers/media/i2c/ov5648.c
> +++ b/drivers/media/i2c/ov5648.c
> @@ -2143,8 +2143,12 @@ static int ov5648_s_stream(struct v4l2_subdev *subdev, int enable)
>  	ret = ov5648_sw_standby(sensor, !enable);
>  	mutex_unlock(&sensor->mutex);
> 
> -	if (ret)
> +	if (ret) {
> +		if (enable)
> +			pm_runtime_put(sensor->dev);

The function powers the sensor off at the end if streaming was to be
disabled. You could do:

	if (ret || !enable)
		pm_runtime_put(sensor->dev);

> +
>  		return ret;
> +	}
> 
>  	state->streaming = !!enable;

state->streaming is assigned when not holding the lock. Could you address
that at the same time?

-- 
Kind regards,

Sakari Ailus
