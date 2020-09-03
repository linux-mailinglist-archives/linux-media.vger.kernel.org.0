Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1C4D25C826
	for <lists+linux-media@lfdr.de>; Thu,  3 Sep 2020 19:39:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727065AbgICRjK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Sep 2020 13:39:10 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:33726 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726025AbgICRjJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Sep 2020 13:39:09 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 083HcwAO111441;
        Thu, 3 Sep 2020 17:38:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=bo1e34Z7Nb7zD1md32835Hg6Pxb+3lvBG7pK4do84lo=;
 b=qtfigfxtiOf6EcrHjwxeQ1YAxY5/zzMFlX8omYUu5se7i0df6wEMYAm3giDfuLMkd9hc
 owY6DVs/AdcFRHKX8TtXiIFb4YrSpaDFxwWMCMIudk9qpnUWgqreqwY02Ujw+cdEaeqE
 llrC1YgVV82MA1qZ0ucdvxzrOiCqfczHBKxx/jJe1baxwLMsAmFx2pRETwEGnUWGckF1
 PsEchOlDFUcwr41fxmf6KXxuuf4kpWEw7g0y3dglGS66LJDFlDxULWj1g4/DPc5LEfxS
 pbKZWFoK0XZpGFe554pRDFPMmJRIoFmKS0elqMb5B6ufGSlOBMmA4yytB76MZOKxpeQ/ Wg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2130.oracle.com with ESMTP id 337eera8ua-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 03 Sep 2020 17:38:58 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 083HVojn014675;
        Thu, 3 Sep 2020 17:38:53 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3030.oracle.com with ESMTP id 3380y2b7us-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 03 Sep 2020 17:38:53 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 083HcqMR007784;
        Thu, 3 Sep 2020 17:38:52 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 03 Sep 2020 10:38:51 -0700
Date:   Thu, 3 Sep 2020 20:38:44 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Alex Dewar <alex.dewar90@gmail.com>
Cc:     devel@driverdev.osuosl.org, Alan Cox <alan@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] staging: media: atomisp: Fix error path in lm3554_probe()
Message-ID: <20200903173843.GF8299@kadam>
References: <20200902184207.479525-1-alex.dewar90@gmail.com>
 <20200903121134.GB8299@kadam>
 <20200903154841.w5rppm325jobimud@medion>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200903154841.w5rppm325jobimud@medion>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9733 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 phishscore=0
 malwarescore=0 bulkscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009030163
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9733 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0 mlxscore=0
 phishscore=0 impostorscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009030164
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 03, 2020 at 04:48:41PM +0100, Alex Dewar wrote:
> Good point about the timer!
> 
> > >  
> > > -	err = lm3554_gpio_init(client);
> > > -	if (err) {
> > > +	ret = lm3554_gpio_init(client);
> > > +	if (ret) {
> > >  		dev_err(&client->dev, "gpio request/direction_output fail");
> > > -		goto fail2;
> > > +		goto err_cleanup_entity;
> > >  	}
> > >  	return atomisp_register_i2c_module(&flash->sd, NULL, LED_FLASH);
> > 
> > If atomisp_register_i2c_module() fails then we need to call
> > lm3554_gpio_uninit(client) and do other cleanup.
> 
> I'm probably showing my ignorance here, but I can't see what cleanup we
> need. Inside lm3554_gpio_init we have:
> 
> 	ret = gpiod_direction_output(pdata->gpio_reset, 0);
> 	if (ret < 0)
> 		return ret;
> 	dev_info(&client->dev, "flash led reset successfully\n");
> 
> 	if (!pdata->gpio_strobe)
> 		return -EINVAL;
> 
> 	ret = gpiod_direction_output(pdata->gpio_strobe, 0);
> 	if (ret < 0)
> 		return ret;
> 
> I'm not sure how you "undo" a call to gpiod_direction_output, but I'm
> thinking you won't need to do anything because it should be ok to leave
> a gpio to output 0... right?

You're right.  I wonder if there is really any need for the
lm3554_gpio_uninit() function at all?  It's basically the same as
lm3554_gpio_init() except for the order of function calls.  Probably
we could just rename lm3554_gpio_init() to something like
lm3554_gpio_set_default() and use it in both the probe() and remove
functions()...

But I don't know the code and can't test it so let's leave that for
another day.

We still do need to clean up if atomisp_register_i2c_module() fails
though, and the timer as well so could you resend a v2?

regards,
dan carpenter

