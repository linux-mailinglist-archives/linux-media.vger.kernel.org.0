Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0001AFDC47
	for <lists+linux-media@lfdr.de>; Fri, 15 Nov 2019 12:31:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727151AbfKOLbj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Nov 2019 06:31:39 -0500
Received: from mail.kapsi.fi ([91.232.154.25]:42307 "EHLO mail.kapsi.fi"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726521AbfKOLbi (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Nov 2019 06:31:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=alhfdJNBRcDplT0zCn+L9jTV9yMFWKmBkVayriwICxE=; b=DdbW/u4+F0t0NlT4kbAApI81og
        wTvbh3LmX7JKp7MFBVyR+jrOZVC2MKSwzSgJDlcInP2R1rQNmZXSBIHBJzLj7yIdkJI+ffZGjuwXu
        pTdIVZ9xuLUDFvp5yfLNtgUiu9L6oFpaUT1cFkFgzUKnXxwfhN0AQ4bZmNMHvsxVTxTV71fTaGOmT
        K8VJODUNrV0SCtEuyZ5OUUMGtnyCd31TrgDTEK5trlQlVDCAgQdrY1FtaZwOG916XGzrpUSBRUse7
        BfwoLO4i2enbLsFkWetDXd3F7Y6iBx9TpUyMsMbEjEj5YZLNYjvIXME+0qN1WF5L7p09vFZaebPxp
        m/ntAD0w==;
Received: from dvbz8cyyyyyyyyyyyyh0y-3.rev.dnainternet.fi ([2001:14ba:8869:c100::1bc] helo=localhost.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <crope@iki.fi>)
        id 1iVZp9-0001Up-Gs; Fri, 15 Nov 2019 13:31:35 +0200
Subject: Re: [PATCH v3 05/14] si2157: Briefly wait for tuning operation to
 complete
To:     Brad Love <brad@nextdimension.cc>, linux-media@vger.kernel.org
References: <20191114200408.28883-1-brad@nextdimension.cc>
 <20191114200408.28883-6-brad@nextdimension.cc>
From:   Antti Palosaari <crope@iki.fi>
Message-ID: <7cfd7b07-c3d6-a40f-d2c1-b3ee1bea10ec@iki.fi>
Date:   Fri, 15 Nov 2019 13:31:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191114200408.28883-6-brad@nextdimension.cc>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:14ba:8869:c100::1bc
X-SA-Exim-Mail-From: crope@iki.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/14/19 10:03 PM, Brad Love wrote:
> To detect errors in the tuning operation, this waits up 40ms for operation
> completion status. This allows for error detection and prevents issuing
> additional commands to the tuner before it is finished.
> 
> Tuning typically completes in 20-30ms.

So that adds some magic waiting at the end of both digital and analog 
tuning.

For digital side it surely is not needed, it has been ages without. 
Tuning on digital side works almost always on 3 phases, 1) program 
tuner, 2) program demod, 3) start waiting demod lock. Tuner is generally 
ready much faster than demod, it is usually just programming PLL and PLL 
locks very fast if it is inside supported frequency ranges and outside 
ranges it does not lock at all. Some tuners supports PLL lock reading, 
but generally there is no idea to read it on normal operation. So 
all-in-all, tuner is almost certainly first device which is ready on 
that chain and if something fails dvb-frontend does retuning.

For analog stuff you added I am not very familiar. Maybe you should 
check analog demod status somehow, is there such callback to read status 
as digital side is..?

Antti

> 
> Signed-off-by: Brad Love <brad@nextdimension.cc>
> ---
> Since v2:
> - Split into two patches, tune completion and signal lock
> 
>   drivers/media/tuners/si2157.c | 52 +++++++++++++++++++++++++++++++++++
>   1 file changed, 52 insertions(+)
> 
> diff --git a/drivers/media/tuners/si2157.c b/drivers/media/tuners/si2157.c
> index 78a855df30da..cac4870017f5 100644
> --- a/drivers/media/tuners/si2157.c
> +++ b/drivers/media/tuners/si2157.c
> @@ -301,6 +301,54 @@ static int si2157_sleep(struct dvb_frontend *fe)
>   	return ret;
>   }
>   
> +static int si2157_tune_wait(struct i2c_client *client)
> +{
> +#define TUN_TIMEOUT 40
> +	struct si2157_dev *dev = i2c_get_clientdata(client);
> +	int ret;
> +	unsigned long timeout;
> +	unsigned long start_time;
> +	u8 wait_status;
> +
> +	mutex_lock(&dev->i2c_mutex);
> +
> +	/* wait tuner command complete */
> +	start_time = jiffies;
> +	timeout = start_time + msecs_to_jiffies(TUN_TIMEOUT);
> +	while (!time_after(jiffies, timeout)) {
> +		ret = i2c_master_recv(client, &wait_status,
> +				      sizeof(wait_status));
> +		if (ret < 0) {
> +			goto err_mutex_unlock;
> +		} else if (ret != sizeof(wait_status)) {
> +			ret = -EREMOTEIO;
> +			goto err_mutex_unlock;
> +		}
> +
> +		/* tuner done? */
> +		if ((wait_status & 0x81) == 0x81)
> +			break;
> +		usleep_range(5000, 10000);
> +	}
> +
> +	dev_dbg(&client->dev, "tuning took %d ms, status=0x%x\n",
> +		jiffies_to_msecs(jiffies) - jiffies_to_msecs(start_time),
> +		wait_status);
> +
> +	if ((wait_status & 0xc0) != 0x80) {
> +		ret = -ETIMEDOUT;
> +		goto err_mutex_unlock;
> +	}
> +
> +	mutex_unlock(&dev->i2c_mutex);
> +	return 0;
> +
> +err_mutex_unlock:
> +	mutex_unlock(&dev->i2c_mutex);
> +	dev_err(&client->dev, "failed=%d\n", ret);
> +	return ret;
> +}
> +
>   static int si2157_set_params(struct dvb_frontend *fe)
>   {
>   	struct i2c_client *client = fe->tuner_priv;
> @@ -400,6 +448,8 @@ static int si2157_set_params(struct dvb_frontend *fe)
>   	dev->bandwidth = bandwidth;
>   	dev->frequency = c->frequency;
>   
> +	si2157_tune_wait(client); /* wait to complete, ignore any errors */
> +
>   	return 0;
>   err:
>   	dev->bandwidth = 0;
> @@ -594,6 +644,8 @@ static int si2157_set_analog_params(struct dvb_frontend *fe,
>   
>   	dev->bandwidth = bandwidth;
>   
> +	si2157_tune_wait(client); /* wait to complete, ignore any errors */
> +
>   	return 0;
>   err:
>   	dev->bandwidth = 0;
> 

-- 
http://palosaari.fi/
