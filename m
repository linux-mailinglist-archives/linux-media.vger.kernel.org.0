Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0147FDC1A
	for <lists+linux-media@lfdr.de>; Fri, 15 Nov 2019 12:16:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727137AbfKOLQp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Nov 2019 06:16:45 -0500
Received: from mail.kapsi.fi ([91.232.154.25]:54103 "EHLO mail.kapsi.fi"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726983AbfKOLQp (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Nov 2019 06:16:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=J7v5Xve6jtv1KnOdHliW08OnIfBVoMwnn39EqbViBpk=; b=np/bAJnPKcsFBbeFY3gMl21oZc
        nSFOn3np/weCClnblg6B4ZfOJukHns2e8uJobTcsFAMapkpB9vdjYJG+ksB/tf4yesIFiscs39XQX
        SFqsibTQtxGCSetPytvnxx1xdtCqYW6rwxerAXw61eTRROd54PvRuPgKJnVko0GwBc8eyxRFm/fkz
        aVaOzzmbDtJldyQYXKO18gMh9xuUp22WYRCApjH8aDJADsx7qQQEeXSRqxE4L7nyxfLXeieQ10DZY
        MLcw7P+0aVPafvdlDZR4D5vpfvBwO7/0IuWLzOCUcEEgsHzfYBtEU7ys87rEY/FzpIaeQ174+aHQd
        KM3Yt/HQ==;
Received: from dvbz8cyyyyyyyyyyyyh0y-3.rev.dnainternet.fi ([2001:14ba:8869:c100::1bc] helo=localhost.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <crope@iki.fi>)
        id 1iVZak-0003xj-K7; Fri, 15 Nov 2019 13:16:42 +0200
Subject: Re: [PATCH v3 03/14] si2157: Better check for running tuner in init
To:     Brad Love <brad@nextdimension.cc>, linux-media@vger.kernel.org
References: <20191114200408.28883-1-brad@nextdimension.cc>
 <20191114200408.28883-4-brad@nextdimension.cc>
From:   Antti Palosaari <crope@iki.fi>
Message-ID: <a7a6c4db-bd33-ebc7-1425-b4dba83fcf9d@iki.fi>
Date:   Fri, 15 Nov 2019 13:16:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191114200408.28883-4-brad@nextdimension.cc>
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
> Getting the Xtal trim property to check if running is less error prone.
> Reset if_frequency if state is unknown.
> 
> Replaces the previous "garbage check".
> 
> Signed-off-by: Brad Love <brad@nextdimension.cc>
> ---
> No changes
> 
>   drivers/media/tuners/si2157.c | 15 +++++++--------
>   1 file changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/tuners/si2157.c b/drivers/media/tuners/si2157.c
> index 69c625eaee25..e1e23e78fd19 100644
> --- a/drivers/media/tuners/si2157.c
> +++ b/drivers/media/tuners/si2157.c
> @@ -81,24 +81,23 @@ static int si2157_init(struct dvb_frontend *fe)
>   	struct si2157_cmd cmd;
>   	const struct firmware *fw;
>   	const char *fw_name;
> -	unsigned int uitmp, chip_id;
> +	unsigned int chip_id, xtal_trim;
>   
>   	dev_dbg(&client->dev, "\n");
>   
> -	/* Returned IF frequency is garbage when firmware is not running */
> -	memcpy(cmd.args, "\x15\x00\x06\x07", 4);
> +	/* Try to get Xtal trim property, to verify tuner still running */
> +	memcpy(cmd.args, "\x15\x00\x04\x02", 4);
>   	cmd.wlen = 4;
>   	cmd.rlen = 4;
>   	ret = si2157_cmd_execute(client, &cmd);
> -	if (ret)
> -		goto err;
>   
> -	uitmp = cmd.args[2] << 0 | cmd.args[3] << 8;
> -	dev_dbg(&client->dev, "if_frequency kHz=%u\n", uitmp);
> +	xtal_trim = cmd.args[2] | (cmd.args[3] << 8);
>   
> -	if (uitmp == dev->if_frequency / 1000)
> +	if (ret == 0 && xtal_trim < 16)
>   		goto warm;

Defining new variable does not make code clearer, uitmp used earlier was 
just fine as value was used just next line or so. You just need to 
change two or three line or so here.

Checking xtal trim sounds still a bit elegant than old method.

>   
> +	dev->if_frequency = 0; /* we no longer know current tuner state */
> +

hmmm, what is idea of that?

>   	/* power up */
>   	if (dev->chiptype == SI2157_CHIPTYPE_SI2146) {
>   		memcpy(cmd.args, "\xc0\x05\x01\x00\x00\x0b\x00\x00\x01", 9);
> 

-- 
http://palosaari.fi/
