Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5728D3519A4
	for <lists+linux-media@lfdr.de>; Thu,  1 Apr 2021 20:03:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234818AbhDARzv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Apr 2021 13:55:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236458AbhDARpB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Apr 2021 13:45:01 -0400
X-Greylist: delayed 260 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 01 Apr 2021 07:46:59 PDT
Received: from mail.tuxforce.de (mail.tuxforce.de [IPv6:2a00:5080:1:16d::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6980C0045F0
        for <linux-media@vger.kernel.org>; Thu,  1 Apr 2021 07:46:59 -0700 (PDT)
Received: from [IPv6:2001:4dd5:b099:0:19b2:6b8c:f4bb:b22d] (2001-4dd5-b099-0-19b2-6b8c-f4bb-b22d.ipv6dyn.netcologne.de [IPv6:2001:4dd5:b099:0:19b2:6b8c:f4bb:b22d])
        by mail.tuxforce.de (Postfix) with ESMTPSA id 00D0E52009B;
        Thu,  1 Apr 2021 16:46:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.tuxforce.de 00D0E52009B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tuxforce.de;
        s=202009; t=1617288418;
        bh=Jxez6pLabtpAgZZ/AWAS8AbpZ6WNQycgum780OEmucc=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=vNDAfmMI1SOV8wZxB47N7VuIVlb80ouJ+EM7Z0h0OYG4Pk+I7+++AIDpCRu0TUBax
         KXN82J09aISuH2+6ZUxnb44+P4jqTzV1CJhLGOApQ7lL0qI1Cj/P8elJYsa5+dgGN3
         9J/YWAG/Ms0SdOkwQqdkwGHFE0hQcEVKFVG3mgtt+yDAk+gDb6gX+MY1srRnE1LuS4
         xbeaPu2qmKHAG16cILJ/sRmBK2f58YJo3AmsNsULOKOpBHjWfGpqatqG2PiQx5H0ek
         EpU00mqP5a8qIoarHv7ErVmLLhhHQhTkWofkQ8vpB7BhrhdW4Vrl8Qs3jz0BnPfbTG
         H6KKFd59k5xGg==
Subject: Re: [PATCH 2/2] media: si2168: also cache Si2168 B40 fallback
 firmware
To:     linux-media@vger.kernel.org
Cc:     Antti Palosaari <crope@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Lukas Middendorf <kernel@tuxforce.de>
References: <20200813214538.8474-1-kernel@tuxforce.de>
 <20200813214538.8474-2-kernel@tuxforce.de>
From:   Lukas Middendorf <kernel@tuxforce.de>
Message-ID: <8cf06089-ddb9-fe12-3362-be5accee7a54@tuxforce.de>
Date:   Thu, 1 Apr 2021 16:46:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20200813214538.8474-2-kernel@tuxforce.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

this second patch also is not yet in 5.12-rc5 and is still relevant for me.
A second option would be to stop using the fallback firmware completely. 
I think systems using a current kernel can be expected to also have the 
firmware files with their current names.

Best regards

Lukas

On 13/08/2020 23:45, Lukas Middendorf wrote:
> we can not know beforehand whether we have to access that firmware
> file during resume. We just request the caching so we don't run
> into any problems later
> 
> Signed-off-by: Lukas Middendorf <kernel@tuxforce.de>
> ---
>   drivers/media/dvb-frontends/si2168.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/media/dvb-frontends/si2168.c b/drivers/media/dvb-frontends/si2168.c
> index ea4b2d91697e..f2dd1deb75ff 100644
> --- a/drivers/media/dvb-frontends/si2168.c
> +++ b/drivers/media/dvb-frontends/si2168.c
> @@ -768,6 +768,19 @@ static int si2168_probe(struct i2c_client *client,
>   				dev->firmware_name);
>   	}
>   
> +	/* also request caching of fw for Si2168 B40 under its old file name.
> +	 * Since we can't know now whether we might have to access that file,
> +	 * we just make sure we have that covered
> +	 */
> +	if (dev->chip_id == SI2168_CHIP_ID_B40) {
> +		ret = firmware_request_cache(&client->dev, SI2168_B40_FIRMWARE_FALLBACK);
> +		if (ret) {
> +			dev_err(&client->dev,
> +					"firmware caching for '%s' failed\n",
> +					SI2168_B40_FIRMWARE_FALLBACK);
> +		}
> +	}
> +
>   	return 0;
>   err_kfree:
>   	kfree(dev);
> 
