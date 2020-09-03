Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2B5925C0CD
	for <lists+linux-media@lfdr.de>; Thu,  3 Sep 2020 14:13:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728663AbgICMNS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Sep 2020 08:13:18 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:45300 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728796AbgICMMR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Sep 2020 08:12:17 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 083CAB0v011875;
        Thu, 3 Sep 2020 12:11:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=QKEHKvfNrVYWGJWh0y6aRDbNrtxVaKEZU0F14eu8Z0k=;
 b=kOcgfqaSl0hDx5LBnVbz53kyHYtyUvtciIoZcagADbyFyowLTm8ZXJgX1kVUYiDykirV
 0lEBg/ProzlzFUpyZQlV40uMpOoJyVSvtOsaDQzR7LyfSXDVz6TYj33kQ9CnaE718J2r
 K6aM7EzO9vLcgz97RC8+Tz6To3OmvBv0bS4hLkoq9+Ai+EYo/FBkpQR3zhNP6D8nU+cS
 Rpw65R+VtOT2pIFA0SroSSNz09GHNTMDMoemyhWpHb0I9MYDg1QmnH28HmHd0Oi+V+2z
 qykUNN+o2URswcxRep5C7rubSfO+IHBBTIKVxdoFqVlGH131UQJ50cGQEjlmBCgzFIJx ew== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 337eymg8sr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 03 Sep 2020 12:11:44 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 083CAjU8102349;
        Thu, 3 Sep 2020 12:11:43 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3020.oracle.com with ESMTP id 3380x9sr94-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 03 Sep 2020 12:11:43 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 083CBgpd030107;
        Thu, 3 Sep 2020 12:11:42 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 03 Sep 2020 05:11:42 -0700
Date:   Thu, 3 Sep 2020 15:11:34 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Alex Dewar <alex.dewar90@gmail.com>
Cc:     devel@driverdev.osuosl.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alan Cox <alan@linux.intel.com>
Subject: Re: [PATCH] staging: media: atomisp: Fix error path in lm3554_probe()
Message-ID: <20200903121134.GB8299@kadam>
References: <20200902184207.479525-1-alex.dewar90@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200902184207.479525-1-alex.dewar90@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9732 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 phishscore=0
 mlxlogscore=999 adultscore=0 suspectscore=2 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009030115
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9732 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2 adultscore=0
 priorityscore=1501 phishscore=0 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 clxscore=1011 spamscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009030114
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 02, 2020 at 07:41:50PM +0100, Alex Dewar wrote:
> The error path for lm3554_probe() contains a number of bugs, including:
>  * resource leaks
>  * jumping to error labels out of sequence
>  * not setting the return value appropriately
> 
> Fix it up and give the labels more memorable names.
> 
> This issue has existed since the code was originally contributed in
> commit a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2"),
> although the code was subsequently removed altogether and then
> reinstated with commit ad85094b293e ("Revert "media: staging: atomisp: Remove driver"").
> 

Almost perfect!  Just a couple other leaks we should fix as well.

> +	ret = media_entity_pads_init(&flash->sd.entity, 0, NULL);
> +	if (ret) {
> +		dev_err(&client->dev, "error initializing media entity");
> +		goto err_free_ctrl_handler;
>  	}
>  
>  	flash->sd.entity.function = MEDIA_ENT_F_FLASH;
> @@ -881,20 +882,22 @@ static int lm3554_probe(struct i2c_client *client)
>  
>  	timer_setup(&flash->flash_off_delay, lm3554_flash_off_delay, 0);

We need to delete this timer.

>  
> -	err = lm3554_gpio_init(client);
> -	if (err) {
> +	ret = lm3554_gpio_init(client);
> +	if (ret) {
>  		dev_err(&client->dev, "gpio request/direction_output fail");
> -		goto fail2;
> +		goto err_cleanup_entity;
>  	}
>  	return atomisp_register_i2c_module(&flash->sd, NULL, LED_FLASH);

If atomisp_register_i2c_module() fails then we need to call
lm3554_gpio_uninit(client) and do other cleanup.

> -fail2:
> +
> +err_cleanup_entity:
>  	media_entity_cleanup(&flash->sd.entity);
> +err_free_ctrl_handler:
>  	v4l2_ctrl_handler_free(&flash->ctrl_handler);

regards,
dan carpenter

