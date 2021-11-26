Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56EA045F5A7
	for <lists+linux-media@lfdr.de>; Fri, 26 Nov 2021 21:08:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240061AbhKZUL1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Nov 2021 15:11:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234041AbhKZUJY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Nov 2021 15:09:24 -0500
X-Greylist: delayed 369 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 26 Nov 2021 11:51:41 PST
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF891C0613F7;
        Fri, 26 Nov 2021 11:51:41 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 55EBCCE214F;
        Fri, 26 Nov 2021 19:45:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1FA6C9305B;
        Fri, 26 Nov 2021 19:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637955928;
        bh=JlkJzr1SrPdPWVhr7fx+q1Cp9W1kkae6hPLwNgywBoM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Pi7EPswSpwzP3Xsa219981/77HNlCL7C7Wt3T+H08THyGxY2PPoD2Eb7LbTUKabnj
         ogUvlSBn8PuSLWrcxdLtYWhx3liqukdUSKyIJasNY8naTKQm+vsJ1qomz7Mn8dqhY8
         ci2HA2DmesCpzdICMz3XEAiC08fRNpTUratR+o/6L3xBdkO3qTfg0JA86ydHOJsF1E
         Ze2kQTzw8WfmFa14UNaQUX4N5FxdjN6ss9Nm1njBefmvMe/f7xiCBcunliwlA3kdmf
         AkUUgQE0fe3ozRjm5dtQLtRGnX3sef4/+gRO6XzhHjIqxKMMgmpRoX3nRFBooaZhUl
         Qtd0uA6MI+LTw==
Date:   Fri, 26 Nov 2021 12:45:23 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 07/20] media: si21xx: report eventual errors at
 set_frontend
Message-ID: <YaE5Uz0+dEtG7gaN@archlinux-ax161>
References: <cover.1637781097.git.mchehab+huawei@kernel.org>
 <36d55de3be035253bf1b07506db13eab04ad803d.1637781097.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <36d55de3be035253bf1b07506db13eab04ad803d.1637781097.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 24, 2021 at 08:13:10PM +0100, Mauro Carvalho Chehab wrote:
> If an error occurs while setting the registers at set_frontend,
> it is silently ignored. Yet, the variable status is updated.
> 
> Change the logic to return an error if it fails to write values
> to the registers.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

I am not super familiar with the different return codes so I assume it
is appropriate (the sites that I see calling set_frontend() appears to
only check for a negative return code).

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH 00/20] at: https://lore.kernel.org/all/cover.1637781097.git.mchehab+huawei@kernel.org/
> 
>  drivers/media/dvb-frontends/si21xx.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/dvb-frontends/si21xx.c b/drivers/media/dvb-frontends/si21xx.c
> index e31eb2c5cc4c..001b23588389 100644
> --- a/drivers/media/dvb-frontends/si21xx.c
> +++ b/drivers/media/dvb-frontends/si21xx.c
> @@ -711,7 +711,7 @@ static int si21xx_set_frontend(struct dvb_frontend *fe)
>  	int i;
>  	bool inband_interferer_div2[ALLOWABLE_FS_COUNT];
>  	bool inband_interferer_div4[ALLOWABLE_FS_COUNT];
> -	int status;
> +	int status = 0;
>  
>  	/* allowable sample rates for ADC in MHz */
>  	int afs[ALLOWABLE_FS_COUNT] = { 200, 192, 193, 194, 195,
> @@ -747,8 +747,6 @@ static int si21xx_set_frontend(struct dvb_frontend *fe)
>  	rf_freq = 10 * c->frequency ;
>  	data_rate = c->symbol_rate / 100;
>  
> -	status = PASS;
> -
>  	band_low = (rf_freq - lnb_lo) - ((lnb_uncertanity * 200)
>  					+ (data_rate * 135)) / 200;
>  
> @@ -832,6 +830,9 @@ static int si21xx_set_frontend(struct dvb_frontend *fe)
>  	state->fs = sample_rate;/*ADC MHz*/
>  	si21xx_setacquire(fe, c->symbol_rate, c->fec_inner);
>  
> +	if (status)
> +		return -EREMOTEIO;
> +
>  	return 0;
>  }
>  
> -- 
> 2.33.1
> 
> 
