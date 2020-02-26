Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B491170CCC
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2020 00:52:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727986AbgBZXwW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Feb 2020 18:52:22 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:39241 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726413AbgBZXwW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Feb 2020 18:52:22 -0500
Received: by mail-pf1-f194.google.com with SMTP id l7so179777pff.6;
        Wed, 26 Feb 2020 15:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=XlzTesc/osvmK67dq3mpi/UOZrAvhagv1EzzaH9Ps1E=;
        b=mFoUw0MqmxHI0oPPMELQOYtzcg9+E08usopU8RyqjLJWRg0LfOnJOWt+AjXWMkSQ/+
         ik+r+itUBGD5T380/0MmUPBH+89PWyBdB8+F/1DaSYlSp7CIk8Fn/3teXYUW1zo9xLUH
         v4z8aa9IgEG3jL96PPv5LScPNWljvvNvKlMzL7Be/vTorndLrIXxvpq+plAwXKHkbUom
         m2el//LdaDsyddJT8U73S8hkrTiL/xXFJolh/qFYcxRZrEI1OuYanj9TXwArqs45lePW
         vxV7QH+fF42WDZRjYeU3k4tsni1QLk30hSxJFZFEmXkFxeEViN2UHWaJeeMyd3OJu1qD
         D9Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=XlzTesc/osvmK67dq3mpi/UOZrAvhagv1EzzaH9Ps1E=;
        b=JfPf9H4h6cP2WDqj6pH+kGANjoMKJ3ylUhYnMC7QSKzqweDbmcltNzSa4mw8Cd777a
         RENfHDUCKCrHPWooXvE4CxrlXRYENmAozbCIWDJafTQ8VzXMzKqdjQsBVwsf2gVldl7P
         6X6+xr0oMkpH85MrIfjcvPiXGPTlU9FvQZsY2LMDZfH7oPidtnMGK0Cyjoaur9fM1LMc
         91QQwn+EwbVlQcYqHkWUjNuxMLtZ+aS4MBbN6OCn7JFvIrJGHKd2FpacKy00OHPfqDnQ
         UPvNEyhXOK3iPSvIvz8qXcMfxHM3NLyyreDccgQQmaFnwptm49jBMxtwYrsM6vtTY7T2
         CJIg==
X-Gm-Message-State: APjAAAWRaLRMlxNdB/JXlbeWo7VEIOrOeQqZ9hD40TjXZkUCSN7N/mXa
        rE7X+xaMlsQMgoKN/onYR3cAZZHkCZo=
X-Google-Smtp-Source: APXvYqxvMlCakj/OIN3Ab7wp9/W+3XGgGXTH9cJ24Kd1VC3/qZU0qrVdvmi+QWNetqsm4pIH3dMQwg==
X-Received: by 2002:a62:fb07:: with SMTP id x7mr1198766pfm.125.1582761139317;
        Wed, 26 Feb 2020 15:52:19 -0800 (PST)
Received: from [172.30.88.123] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id 64sm4159507pfd.48.2020.02.26.15.52.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2020 15:52:18 -0800 (PST)
Subject: Re: [RESEND PATCH v3 02/17] media: v4l2-fwnode: Pass notifier to
 v4l2_async_register_fwnode_subdev()
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
References: <20200215194136.10131-1-slongerbeam@gmail.com>
 <20200215194136.10131-3-slongerbeam@gmail.com>
 <20200225150721.GO5379@paasikivi.fi.intel.com>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <33258045-b708-1390-06e0-fde224296dfb@gmail.com>
Date:   Wed, 26 Feb 2020 15:50:04 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200225150721.GO5379@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thanks for the feedback.


On 2/25/20 7:07 AM, Sakari Ailus wrote:
> Hi Steve,
>
> On Sat, Feb 15, 2020 at 11:41:21AM -0800, Steve Longerbeam wrote:
>> Instead of allocating a notifier in v4l2_async_register_fwnode_subdev(),
>> have the caller provide one. This allows the caller to implement
>> notifier ops (bind, unbind).
>>
>> The caller is now responsible for first initializing its notifier with a
>> call to v4l2_async_notifier_init().
>>
>> Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
> Instead of improving v4l2_async_register_fwnode_subdev(), could you convert
> the users (IMX driver in this case) to call the preferred APIs instead?

I presume you mean using v4l2_async_notifier_add_fwnode_remote_subdev(). 
Ok, I'll convert to use that API.

Steve

>   As
> the lines below show, v4l2_async_register_fwnode_subdev() has only two
> users left --- the other one of which is the IMX driver. After converting
> these two, we could just remove this API.
>
> See e.g. drivers/media/pci/intel/ipu3/ipu3-cio2.c and
> drivers/media/platform/omap3isp/isp.c for examples.
>
>> ---
>> Changes in v3:
>> - added the missing calls to unregister/cleanup the new subdev notifiers.
>>    Reported by Rui Silva.
>> ---
>>   drivers/media/platform/video-mux.c         |  8 +++++++-
>>   drivers/media/v4l2-core/v4l2-fwnode.c      | 11 +----------
>>   drivers/staging/media/imx/imx6-mipi-csi2.c |  7 ++++++-
>>   drivers/staging/media/imx/imx7-media-csi.c |  7 ++++++-
>>   drivers/staging/media/imx/imx7-mipi-csis.c |  9 ++++++++-
>>   include/media/v4l2-fwnode.h                | 12 ++++++++----
>>   6 files changed, 36 insertions(+), 18 deletions(-)

