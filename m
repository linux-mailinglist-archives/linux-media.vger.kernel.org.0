Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 645A0351744
	for <lists+linux-media@lfdr.de>; Thu,  1 Apr 2021 19:41:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234334AbhDARln (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Apr 2021 13:41:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234578AbhDARiK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Apr 2021 13:38:10 -0400
Received: from mail.tuxforce.de (mail.tuxforce.de [IPv6:2a00:5080:1:16d::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8120DC001F78
        for <linux-media@vger.kernel.org>; Thu,  1 Apr 2021 07:52:27 -0700 (PDT)
Received: from [IPv6:2001:4dd5:b099:0:19b2:6b8c:f4bb:b22d] (2001-4dd5-b099-0-19b2-6b8c-f4bb-b22d.ipv6dyn.netcologne.de [IPv6:2001:4dd5:b099:0:19b2:6b8c:f4bb:b22d])
        by mail.tuxforce.de (Postfix) with ESMTPSA id 43D8352007A;
        Thu,  1 Apr 2021 16:42:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.tuxforce.de 43D8352007A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tuxforce.de;
        s=202009; t=1617288147;
        bh=2WRnwMjo59ewkSxtYMeKftTekMyYE+LpBO8wWmYbEqc=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=sZoulIKHGHDdbJL3ZMnvO5WdmBK3RtsjsROYOrK+NahJTsOBKq5ywgk0tlCrMwpkG
         nKqBPaCSsTkoRYLieyusYEUKrLEg1oyBbp67pt33yhSchZaJLBgj1rno4SsooadMFz
         w1lsAfurY07oYwNNetaTPcPubLaYrHL74/thhxD7vibnNwdfHGdej9mz6EYn1PW3um
         yEGYZ2edlNz0PI4itP1wDPjAWQJxEtY2mwl2/XjZtGaXZv8V3qurdXmHJvKLdbqutP
         yBVt6YgQeJKQwyNLOPlVSXXiXr7kvqV5xZE5xw/nvS2NiKX80MIy0dHzzsyJaOcDTT
         hOmSLHdwUWQAw==
Subject: Re: [PATCH 1/2] media: si2168: request caching of firmware to make it
 available on resume
To:     linux-media@vger.kernel.org
Cc:     Antti Palosaari <crope@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Lukas Middendorf <kernel@tuxforce.de>
References: <20200813214538.8474-1-kernel@tuxforce.de>
From:   Lukas Middendorf <kernel@tuxforce.de>
Message-ID: <cec1f815-1505-869c-88ae-362c2a4bf0b4@tuxforce.de>
Date:   Thu, 1 Apr 2021 16:42:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20200813214538.8474-1-kernel@tuxforce.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

I see this (or a similar fix) has not yet been included in 5.12-rc5.
Any further problems or comments regarding this patch? It still applies 
cleanly to current git master and the problem is still relevant.

Best regards
Lukas

On 13/08/2020 23:45, Lukas Middendorf wrote:
> even though request_firmware() is supposed to be safe to call during
> resume, it might fail (or even hang the system) when the firmware
> has not been loaded previously. Use firmware_request_cache() to
> have it cached so it is available reliably on resume.
> 
> Signed-off-by: Lukas Middendorf <kernel@tuxforce.de>
> ---
>   drivers/media/dvb-frontends/si2168.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/media/dvb-frontends/si2168.c b/drivers/media/dvb-frontends/si2168.c
> index 14b93a7d3358..ea4b2d91697e 100644
> --- a/drivers/media/dvb-frontends/si2168.c
> +++ b/drivers/media/dvb-frontends/si2168.c
> @@ -757,6 +757,17 @@ static int si2168_probe(struct i2c_client *client,
>   		 dev->version >> 24 & 0xff, dev->version >> 16 & 0xff,
>   		 dev->version >> 8 & 0xff, dev->version >> 0 & 0xff);
>   
> +	/* request caching of the firmware so it is available on resume after suspend.
> +	 * The actual caching of the firmware file only occurs during suspend
> +	 * The return value does not show whether the firmware file exists
> +	 */
> +	ret = firmware_request_cache(&client->dev, dev->firmware_name);
> +	if (ret) {
> +		dev_err(&client->dev,
> +				"firmware caching for '%s' failed\n",
> +				dev->firmware_name);
> +	}
> +
>   	return 0;
>   err_kfree:
>   	kfree(dev);
> 
