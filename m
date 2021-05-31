Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 947FC3958D7
	for <lists+linux-media@lfdr.de>; Mon, 31 May 2021 12:17:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231329AbhEaKT2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 May 2021 06:19:28 -0400
Received: from gofer.mess.org ([88.97.38.141]:58109 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231320AbhEaKTG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 May 2021 06:19:06 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 78152C65C0; Mon, 31 May 2021 11:17:25 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1622456245; bh=bf7SEBXgrhjrigUxjJ91LJdvxUVGe/MCLngjuc5WRjQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JBqh+wd0FoIg3SiUDHDd0iS2SLG0rZ9NG8unWUXOyBGBef13lK68A+BydCbf3AqDs
         Gdx0kyVVmniB1L5NflJimiE0DYQ7LD6D5SexZyQnXljuLjmAe/rstd7spN7SRstbGA
         UJyNSnqAJvUByN9MH6SY5Yp1R5bV2FdVdV5OhlTqAj/QGSoeX7/7KIQR7bus+S4yFt
         PEfKvo6Vi8gQtnyLEBbZjqdVCbMplyrmtSb9AydSG99XkclUOePJlJV62EY1t5MPvd
         I7Z0SLHO1E3Oo0p3ON/9uqJBknO1CLX3/Z9Dp5gcSJ0om2pexLxXAf8eLHqe9koCv3
         n3Y2+J2/FB/TA==
Date:   Mon, 31 May 2021 11:17:25 +0100
From:   Sean Young <sean@mess.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Yasunari.Takiguchi@sony.com, mchehab@kernel.org,
        narmstrong@baylibre.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 1/2] media: cxd2880-spi: Fix an error handling path
Message-ID: <20210531101725.GB30390@gofer.mess.org>
References: <28a115d7207b258715a029f822ab88f7a4ee05e6.1621599392.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28a115d7207b258715a029f822ab88f7a4ee05e6.1621599392.git.christophe.jaillet@wanadoo.fr>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, May 21, 2021 at 02:18:14PM +0200, Christophe JAILLET wrote:
> If an error occurs after a successful 'regulator_enable()' call,
> 'regulator_disable()' must be called.
> 
> Fix the error handling path of the probe accordingly.
> 
> Fixes: cb496cd472af ("media: cxd2880-spi: Add optional vcc regulator")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/media/spi/cxd2880-spi.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/spi/cxd2880-spi.c b/drivers/media/spi/cxd2880-spi.c
> index 931ec0727cd3..df1335e7061c 100644
> --- a/drivers/media/spi/cxd2880-spi.c
> +++ b/drivers/media/spi/cxd2880-spi.c
> @@ -524,13 +524,13 @@ cxd2880_spi_probe(struct spi_device *spi)
>  	if (IS_ERR(dvb_spi->vcc_supply)) {
>  		if (PTR_ERR(dvb_spi->vcc_supply) == -EPROBE_DEFER) {
>  			ret = -EPROBE_DEFER;
> -			goto fail_adapter;
> +			goto fail_regulator;
>  		}
>  		dvb_spi->vcc_supply = NULL;

vcc_supply is set to null in this path.

>  	} else {
>  		ret = regulator_enable(dvb_spi->vcc_supply);
>  		if (ret)
> -			goto fail_adapter;
> +			goto fail_regulator;
>  	}
>  
>  	dvb_spi->spi = spi;
> @@ -618,6 +618,9 @@ cxd2880_spi_probe(struct spi_device *spi)
>  fail_attach:
>  	dvb_unregister_adapter(&dvb_spi->adapter);
>  fail_adapter:
> +	if (!IS_ERR(dvb_spi->vcc_supply))
> +		regulator_disable(dvb_spi->vcc_supply);

IS_ERR(NULL) -> false
regulator_disable will dereference a null pointer.


Sean

> +fail_regulator:
>  	kfree(dvb_spi);
>  	return ret;
>  }
> -- 
> 2.30.2
