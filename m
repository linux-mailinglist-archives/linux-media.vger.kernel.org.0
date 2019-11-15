Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 779C0FE658
	for <lists+linux-media@lfdr.de>; Fri, 15 Nov 2019 21:23:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726505AbfKOUXx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Nov 2019 15:23:53 -0500
Received: from mail.kapsi.fi ([91.232.154.25]:43555 "EHLO mail.kapsi.fi"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726323AbfKOUXx (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Nov 2019 15:23:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=bp/3xje+OLWFEe9jea/X+4EgJp+0+H3Aj8KKOLGvgcM=; b=QN/vr3oAXR9o7jvK3XuofNSOOd
        rsgfWdC/AAu7WxUo2YDdsjXRItxyefntcOmfIW3mPZ7vNIh3M9mshtrvUeDx4DfWUQ9iv3s5dHeHv
        T8ksChtsqipgVmPxCeRImntpv34qxovHUOc+/uSM2rrqM2ofc6h3J7nBwPBuHb6sdwmTRppwLDc1+
        cwn27HrkwOfUrsqe7kEcZ8dUtIbt/53HXuHKW4Iz8Vo6EFk+uBwSojSqRoWXLTdTbISAPGEhYDOEW
        VmVcHWkpbSUClV6jyLcGdirKS0zkSTNGei6NYthilv/reaT9kzKaIAVjxwXjardVVQivkwpqwN0qI
        AWKxR+dA==;
Received: from dvbz8cyyyyyyyyyyyyh0y-3.rev.dnainternet.fi ([2001:14ba:8869:c100::1bc] helo=localhost.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <crope@iki.fi>)
        id 1iVi8E-0006Em-4b; Fri, 15 Nov 2019 22:23:50 +0200
Subject: Re: [PATCH v3 12/14] si2157: add on-demand rf strength func
To:     Brad Love <brad@nextdimension.cc>, linux-media@vger.kernel.org
References: <20191114200408.28883-1-brad@nextdimension.cc>
 <20191114200408.28883-13-brad@nextdimension.cc>
From:   Antti Palosaari <crope@iki.fi>
Message-ID: <1ab004a6-ded4-3bdd-791f-5aadd863720f@iki.fi>
Date:   Fri, 15 Nov 2019 22:23:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191114200408.28883-13-brad@nextdimension.cc>
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

On 11/14/19 10:04 PM, Brad Love wrote:
> Add get_rf_strength callback to get RSSI from the tuner. DVBv5
> stat cache is updated. get_rf_strength is called by tuner_core
> for analog tuners and is also used by some bridge drivers to
> obtain RSSI directly from the tuner.

Driver is updating its signal strength already. Is there any reason you 
don't use existing value but add this new I/O to read it?

Antti

> 
> Signed-off-by: Brad Love <brad@nextdimension.cc>
> ---
> Changes since v1:
> - simplify normalization of signal strength calculation
> - use clamp and add description of operation
> - remove __func__ from dev_dbg macro
> 
>   drivers/media/tuners/si2157.c | 40 ++++++++++++++++++++++++++++++++++-
>   1 file changed, 39 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/tuners/si2157.c b/drivers/media/tuners/si2157.c
> index 16d7169f46fb..aaf223b9b781 100644
> --- a/drivers/media/tuners/si2157.c
> +++ b/drivers/media/tuners/si2157.c
> @@ -725,6 +725,42 @@ static int si2157_get_if_frequency(struct dvb_frontend *fe, u32 *frequency)
>   	return 0;
>   }
>   
> +static int si2157_get_rf_strength(struct dvb_frontend *fe, u16 *rssi)
> +{
> +	struct i2c_client *client = fe->tuner_priv;
> +	struct dtv_frontend_properties *c = &fe->dtv_property_cache;
> +	struct si2157_cmd cmd;
> +	int ret;
> +	int strength;
> +
> +	dev_dbg(&client->dev, "\n");
> +
> +	memcpy(cmd.args, "\x42\x00", 2);
> +	cmd.wlen = 2;
> +	cmd.rlen = 12;
> +	ret = si2157_cmd_execute(client, &cmd);
> +	if (ret)
> +		goto err;
> +
> +	c->strength.stat[0].scale = FE_SCALE_DECIBEL;
> +	c->strength.stat[0].svalue = (s8)cmd.args[3] * 1000;
> +
> +	/* normalize values based on Silicon Labs reference
> +	 * add 100, then anything > 80 is 100% signal
> +	 */
> +	strength = (s8)cmd.args[3] + 100;
> +	strength = clamp_val(strength, 0, 80);
> +	*rssi = (u16)(strength * 0xffff / 80);
> +
> +	dev_dbg(&client->dev, "strength=%d rssi=%u\n",
> +		(s8)cmd.args[3], *rssi);
> +
> +	return 0;
> +err:
> +	dev_dbg(&client->dev, "failed=%d\n", ret);
> +	return ret;
> +}
> +
>   static const struct dvb_tuner_ops si2157_ops = {
>   	.info = {
>   		.name             = "Silicon Labs Si2141/Si2146/2147/2148/2157/2158",
> @@ -738,7 +774,9 @@ static const struct dvb_tuner_ops si2157_ops = {
>   	.set_analog_params = si2157_set_analog_params,
>   	.get_frequency     = si2157_get_frequency,
>   	.get_bandwidth     = si2157_get_bandwidth,
> -	.get_if_frequency = si2157_get_if_frequency,
> +	.get_if_frequency  = si2157_get_if_frequency,
> +
> +	.get_rf_strength   = si2157_get_rf_strength,
>   };
>   
>   static void si2157_stat_work(struct work_struct *work)
> 

-- 
http://palosaari.fi/
