Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DA015BA9A8
	for <lists+linux-media@lfdr.de>; Fri, 16 Sep 2022 11:46:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbiIPJqV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Sep 2022 05:46:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbiIPJqU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Sep 2022 05:46:20 -0400
X-Greylist: delayed 61644 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 16 Sep 2022 02:46:18 PDT
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4A8323BC0
        for <linux-media@vger.kernel.org>; Fri, 16 Sep 2022 02:46:18 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id B89D3100055; Fri, 16 Sep 2022 10:46:16 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
        t=1663321576; bh=GcIECGUV4u/iVImiQYSlXR1l2ChPuaXgwsSt5uquPlk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UJS5OgW7wSlRWPrnF4OLguS+r/RJm4bVLNJSFXWxk2iOLhK2sErsdH2lJrpLLX7s9
         eTCZLuyDO12ENYKON3dr+ta3P9T0hjB4aBveJ5y5S9N/zAJzyMRfhhJB08dliPZhJX
         crWSJCgkqrt8F1yqVJqkZKZjm9LtS8ITzQHvPNwI5eVV8MrfB+rPPRbv/jiIPWDlhc
         pVg3eOTpnx8d6kuh+njuSqn+cfFcdwv2VrodFiAxslbDRR/dS26aBSI83KpnzX51hH
         aikFDHfyg0IYQGX5inde2ntp9CTF8JckPpdpHCoKxcymSH8z2ZEfEIDQtXGFlM/QRu
         o/+IYBYmbsb0g==
Date:   Fri, 16 Sep 2022 10:46:16 +0100
From:   Sean Young <sean@mess.org>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, pavel@ucw.cz,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH -next 10/13] media: rc: gpio-ir-recv: Switch to use
 dev_err_probe() helper
Message-ID: <YyRF6ETUrJRUsVC7@gofer.mess.org>
References: <20220915150324.688062-1-yangyingliang@huawei.com>
 <20220915150324.688062-11-yangyingliang@huawei.com>
 <YyNVG1EZ0anbDf0R@gofer.mess.org>
 <a56a9638-5a1f-4cbe-cf30-baae03b104c3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a56a9638-5a1f-4cbe-cf30-baae03b104c3@huawei.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Fri, Sep 16, 2022 at 09:13:14AM +0800, Yang Yingliang wrote:
> On 2022/9/16 0:38, Sean Young wrote:
> > On Thu, Sep 15, 2022 at 11:03:21PM +0800, Yang Yingliang wrote:
> > > In the probe path, dev_err() can be replace with dev_err_probe()
> > > which will check if error code is -EPROBE_DEFER.
> > > 
> > > Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> > > ---
> > >   drivers/media/rc/gpio-ir-recv.c | 10 +++-------
> > >   1 file changed, 3 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/drivers/media/rc/gpio-ir-recv.c b/drivers/media/rc/gpio-ir-recv.c
> > > index 22e524b69806..8f1fff7af6c9 100644
> > > --- a/drivers/media/rc/gpio-ir-recv.c
> > > +++ b/drivers/media/rc/gpio-ir-recv.c
> > > @@ -74,13 +74,9 @@ static int gpio_ir_recv_probe(struct platform_device *pdev)
> > >   		return -ENOMEM;
> > >   	gpio_dev->gpiod = devm_gpiod_get(dev, NULL, GPIOD_IN);
> > > -	if (IS_ERR(gpio_dev->gpiod)) {
> > > -		rc = PTR_ERR(gpio_dev->gpiod);
> > > -		/* Just try again if this happens */
> > > -		if (rc != -EPROBE_DEFER)
> > > -			dev_err(dev, "error getting gpio (%d)\n", rc);
> > > -		return rc;
> > > -	}
> > > +	if (IS_ERR(gpio_dev->gpiod))
> > > +		return dev_err_probe(dev, PTR_ERR(gpio_dev->gpiod),
> > > +				     "error getting gpio\n");
> > Now the error number is no longer logged. That can't be good?
> Instead of error number, the error name is printed in dev_err_probe(), and 
> it's better for read.

Yes, I should have checked this. This is much nicer, with the error printed with
%pe. Thanks!

For the three drivers in drivers/media/rc/ :

Reviewed-by: Sean Young <sean@mess.org>

Thanks
Sean
