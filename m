Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8016E135D3D
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2020 16:54:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732665AbgAIPyk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Jan 2020 10:54:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:33410 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729591AbgAIPyk (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 9 Jan 2020 10:54:40 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EA078206ED;
        Thu,  9 Jan 2020 15:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578585279;
        bh=CO2oAXeI60Yqe46XfH5899cbMwfHKmsfrdFWFp4IkwY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ChgxqELAE5vIbirpB/5834tX0zLmq/6Qkuwk3PhP6YsOSsJDsGlEhIyTXox1JsuJN
         B1OIZI0Cw440zjgdeGT0HZFi52lZIWWtxsYhHreFRGpfMlj3sPcQYGOOAw2rt9a52Q
         sqj3ztbeMWxnUDTLUqyEnMlliuBSWr8muk4dTo5Y=
Date:   Thu, 9 Jan 2020 16:54:37 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Cc:     mchehab@kernel.org, sean@mess.org, tglx@linutronix.de,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH 1/1] media: dvb_dummy_tuner: implement driver skeleton
Message-ID: <20200109155437.GA568342@kroah.com>
References: <20200109152408.919325-1-dwlsalmeida@gmail.com>
 <20200109152408.919325-2-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200109152408.919325-2-dwlsalmeida@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jan 09, 2020 at 12:24:08PM -0300, Daniel W. S. Almeida wrote:
> +static int dvb_dummy_tuner_i2c_probe(struct i2c_client *client,
> +				     const struct i2c_device_id *id)
> +{
> +	int ret = 0;
> +	struct dvb_dummy_tuner_config *config = client->dev.platform_data;
> +	struct dvb_frontend *fe = config->fe;
> +	struct dvb_dummy_tuner_dev *tuner_dev = NULL;
> +
> +	tuner_dev = kzalloc(sizeof(*tuner_dev), GFP_KERNEL);
> +	if (!tuner_dev) {
> +		ret = -ENOMEM;
> +		goto err;
> +	}
> +
> +	i2c_set_clientdata(client, tuner_dev);
> +	tuner_dev->fe = config->fe;
> +
> +	memcpy(&fe->ops.tuner_ops,
> +	       &dvb_dummy_tuner_ops,
> +	       sizeof(struct dvb_tuner_ops));
> +
> +	fe->tuner_priv = client;
> +
> +	pr_debug("%s: Successfully probed %s\n", __func__, client->name);

As you are a driver, you should never need to call any pr_* calls,
instead use dev_*().  For this, you can use dev_dbg(), but really, why
is that even needed except for your debugging bringup.  And for that,
you can use ftrace, right?  So no need for any printing of anything
here.

> +	return ret;
> +
> +err:
> +	pr_err("%s: failed\n", __func__);

Again, dev_err() would be proper, but there's no need for any error
message here.


Don't you need to register the tuner ops with something in this
function?

> +	return ret;
> +}
> +
> +static int dvb_dummy_tuner_i2c_remove(struct i2c_client *client)
> +{
> +	struct dvb_dummy_tuner_dev *tuner_dev = i2c_get_clientdata(client);
> +	struct dvb_frontend *fe = tuner_dev->fe;
> +
> +	memset(&fe->ops.tuner_ops, 0, sizeof(struct dvb_tuner_ops));
> +	fe->tuner_priv = NULL;
> +	kfree(tuner_dev);
> +

Don't you need to unregister the tuner ops in here?

thanks,

greg k-h
