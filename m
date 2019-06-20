Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BBC84CDCE
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2019 14:35:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726958AbfFTMfn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jun 2019 08:35:43 -0400
Received: from retiisi.org.uk ([95.216.213.190]:38246 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726238AbfFTMfn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jun 2019 08:35:43 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 34C06634C7B;
        Thu, 20 Jun 2019 15:35:09 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.89)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1hdwHV-0002Bx-7V; Thu, 20 Jun 2019 15:35:09 +0300
Date:   Thu, 20 Jun 2019 15:35:09 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Robert Jarzmik <robert.jarzmik@free.fr>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: mt9m111: fix fw-node refactoring
Message-ID: <20190620123509.7pssbcqjqcnh3kmc@valkosipuli.retiisi.org.uk>
References: <20190603200155.24358-1-robert.jarzmik@free.fr>
 <20190620101717.7h2hczachuk2rjr6@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190620101717.7h2hczachuk2rjr6@valkosipuli.retiisi.org.uk>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jun 20, 2019 at 01:17:17PM +0300, Sakari Ailus wrote:
> diff --git a/drivers/media/i2c/mt9m111.c b/drivers/media/i2c/mt9m111.c
> index bd3a51c3b081..9761a6105407 100644
> --- a/drivers/media/i2c/mt9m111.c
> +++ b/drivers/media/i2c/mt9m111.c
> @@ -1263,9 +1263,11 @@ static int mt9m111_probe(struct i2c_client *client,
>  	if (!mt9m111)
>  		return -ENOMEM;
>  
> -	ret = mt9m111_probe_fw(client, mt9m111);
> -	if (ret)
> -		return ret;
> +	if (dev_fwnode(client->dev)) {

&client->dev

> +		ret = mt9m111_probe_fw(client, mt9m111);
> +		if (ret)
> +			return ret;
> +	}
>  
>  	mt9m111->clk = v4l2_clk_get(&client->dev, "mclk");
>  	if (IS_ERR(mt9m111->clk))

-- 
Sakari Ailus
