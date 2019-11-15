Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20741FDBF9
	for <lists+linux-media@lfdr.de>; Fri, 15 Nov 2019 12:09:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727065AbfKOLJW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Nov 2019 06:09:22 -0500
Received: from mail.kapsi.fi ([91.232.154.25]:49267 "EHLO mail.kapsi.fi"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726521AbfKOLJW (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Nov 2019 06:09:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=JyLemP6TVrGSIcG7thim+tXz3SnFSBVlXjUzJRQSidQ=; b=UtNU4486QHN4eJFFs/+SdcbL7Z
        fhAhIqwhVQNuC5ID9YZkw5GSB1T6mJwsGYw0Zf8tH+V/Y3iLlueXI2Syv5iROnK4sjEI2MddhnYxf
        2CVrtJRU5k1h5eMxd+QH5gzjozRbZjAn38XlsOwQKj91vTga9KF/liJRrzsNu0Nac8WGazFav7Tgu
        xV/aG0mr/NzhySd6MIYeU2cmcoRp0uyRoXg5/YIg9dYlru6AgZBkJlIFUFkEANzV4JSars7hUwytI
        KbyMzWH3NLslnWSkN0ZxOsphug/wMu0M3wayRP9zUeKwItO+H9+xJokSkiCG3FR6dMXhfzApzxTvm
        fi51+Bfw==;
Received: from dvbz8cyyyyyyyyyyyyh0y-3.rev.dnainternet.fi ([2001:14ba:8869:c100::1bc] helo=localhost.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <crope@iki.fi>)
        id 1iVZTc-0000vo-7u; Fri, 15 Nov 2019 13:09:20 +0200
Subject: Re: [PATCH v3 02/14] si2157: Check error status bit on cmd execute
To:     Brad Love <brad@nextdimension.cc>, linux-media@vger.kernel.org
References: <20191114200408.28883-1-brad@nextdimension.cc>
 <20191114200408.28883-3-brad@nextdimension.cc>
From:   Antti Palosaari <crope@iki.fi>
Message-ID: <a4a871fa-5f2b-bfe6-0106-4a5c462d07ad@iki.fi>
Date:   Fri, 15 Nov 2019 13:09:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191114200408.28883-3-brad@nextdimension.cc>
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

Hello,

On 11/14/19 10:03 PM, Brad Love wrote:
> Check error status bit on command execute, if error bit is
> set return -EAGAIN. Ignore -EAGAIN in probe during device check.

You should open when and why this error condition happens and try to fix 
things on first hand that error situation never appears. As you added 
that kind of special error handling to does it mean it happens during 
probe? If yes, then something must be wrong before probe is called. Also 
succeeding probe on "error again" does not sound very correct.

Antti

> 
> Signed-off-by: Brad Love <brad@nextdimension.cc>
> ---
> Since v2:
> - Fix -EAGAIN returned by si2141 in si2157_init
> 
>   drivers/media/tuners/si2157.c | 16 +++++++++++-----
>   1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/tuners/si2157.c b/drivers/media/tuners/si2157.c
> index 12f88304ac0f..69c625eaee25 100644
> --- a/drivers/media/tuners/si2157.c
> +++ b/drivers/media/tuners/si2157.c
> @@ -47,14 +47,20 @@ static int si2157_cmd_execute(struct i2c_client *client, struct si2157_cmd *cmd)
>   				break;
>   		}
>   
> -		dev_dbg(&client->dev, "cmd execution took %d ms\n",
> -				jiffies_to_msecs(jiffies) -
> -				(jiffies_to_msecs(timeout) - TIMEOUT));
> +		dev_dbg(&client->dev, "cmd execution took %d ms, status=%x\n",
> +			jiffies_to_msecs(jiffies) -
> +			(jiffies_to_msecs(timeout) - TIMEOUT),
> +			cmd->args[0]);
>   
>   		if (!((cmd->args[0] >> 7) & 0x01)) {
>   			ret = -ETIMEDOUT;
>   			goto err_mutex_unlock;
>   		}
> +		/* check error status bit */
> +		if (cmd->args[0] & 0x40) {
> +			ret = -EAGAIN;
> +			goto err_mutex_unlock;
> +		}
>   	}
>   
>   	mutex_unlock(&dev->i2c_mutex);
> @@ -106,7 +112,7 @@ static int si2157_init(struct dvb_frontend *fe)
>   	}
>   	cmd.rlen = 1;
>   	ret = si2157_cmd_execute(client, &cmd);
> -	if (ret)
> +	if (ret && (dev->chiptype != SI2157_CHIPTYPE_SI2141 || ret != -EAGAIN))
>   		goto err;
>   
>   	/* Si2141 needs a second command before it answers the revision query */
> @@ -478,7 +484,7 @@ static int si2157_probe(struct i2c_client *client,
>   	cmd.wlen = 0;
>   	cmd.rlen = 1;
>   	ret = si2157_cmd_execute(client, &cmd);
> -	if (ret)
> +	if (ret && ret != -EAGAIN)
>   		goto err_kfree;
>   
>   	memcpy(&fe->ops.tuner_ops, &si2157_ops, sizeof(struct dvb_tuner_ops));
> 

-- 
http://palosaari.fi/
