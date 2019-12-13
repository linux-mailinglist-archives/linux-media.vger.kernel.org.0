Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06A2E11DBF9
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2019 03:05:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731837AbfLMCFT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Dec 2019 21:05:19 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:53513 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727084AbfLMCFT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Dec 2019 21:05:19 -0500
Received: by mail-wm1-f66.google.com with SMTP id w8so1319920wmd.3;
        Thu, 12 Dec 2019 18:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=4KHnlSOE+u7gVwbfHgyHTQo5E29XNhzxa8pc2Uz0sSQ=;
        b=aGpdExK4CWD+ZFqM0use0gYjMn76UZwWr+c2NHqwZbnkLlkHzOQ3DPK9Ov5qdUnj5+
         5XkaPpAJlELoFlHtLTFUOabW96QgYE6lBDAHYMtTSAXtk7IKYeOoKC0HnKVJ5ten1SYD
         0R4TFyCfaQLLTzI6bqvJVAxR9kfSDCuuKbUQClOS1ew3nvhup6IVnGT6a2hJqU0I4HnE
         qErauDVPA6nmfvr/MqinVjOVJhcP7unZeZV3U6ipkgJPU2VKc2IE9axD03IsNtqOlALB
         K8AD9AEzf0rZbT/VRhP73Cl8YzHwCnZvnVJThMXcZgAlw9VrEjQ+S8RisIFpMNiGKQyd
         8ZXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=4KHnlSOE+u7gVwbfHgyHTQo5E29XNhzxa8pc2Uz0sSQ=;
        b=WPTDVJMU+XHbmTJjcMkQoSkNUg/RRb+lM6eT1lrWW0pRTDwSRMka/82/nFacPzlfGm
         u5P3Di51UjLjFTQjC1i+1Pr38W7UotPjVXepAPu/D28Kws1H8YfcVGIq6E9VHpFnhggf
         9eZLApGVI/2adMXIfhaTYGDphN4m2Gu6DqcjGJ70SCdFChoBSaka6cgPBESNQUuNE1HJ
         O6ZJUge2am+Ul9WjQuGD9N8A/T2j9tOYZD9P4Mr7DsbZytau7tqtVMuLpbbqKYatY5G+
         Lf/WgfABRrXy65iHosSw/z06StHgBOpJzItv5IRunOctI7Nkvi6gflLbYb1bOGkHkavD
         hosw==
X-Gm-Message-State: APjAAAUhiQaH7OYkg0fXB2ef03ZOy/e8jq0T1DbAbqiIP/xw2thf4u+Z
        Yg7GdGhGgh49tk4EFtIWr3tKGPL7
X-Google-Smtp-Source: APXvYqw5cMIDLL9NgFGAlF/E0fKpuzAyyOpNrDp+ABiAIecGcepzvQBIHE1252bGWMaBHoLtILsc5w==
X-Received: by 2002:a1c:a98e:: with SMTP id s136mr9717036wme.140.1576202716814;
        Thu, 12 Dec 2019 18:05:16 -0800 (PST)
Received: from [172.30.89.135] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id m10sm8224474wrx.19.2019.12.12.18.05.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2019 18:05:15 -0800 (PST)
Subject: Re: [PATCH] media: imx7-mipi-csis: Add the missed
 v4l2_async_notifier_cleanup in remove
To:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Chuhong Yuan <hslester96@gmail.com>, devel@driverdev.osuosl.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        linux-kernel@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
References: <20191209085828.16183-1-hslester96@gmail.com>
 <20191212115134.GA1895@kadam>
 <20191212190858.nslwdcjpbjnrfvq2@arch-thunder.localdomain>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <def58acb-ae42-856a-f61d-645dcfbbe3f7@gmail.com>
Date:   Thu, 12 Dec 2019 18:05:11 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191212190858.nslwdcjpbjnrfvq2@arch-thunder.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 12/12/19 11:08 AM, Rui Miguel Silva wrote:
> Hi Dan,
> Thanks for the inputs.
> On Thu, Dec 12, 2019 at 02:51:34PM +0300, Dan Carpenter wrote:
>> On Mon, Dec 09, 2019 at 04:58:28PM +0800, Chuhong Yuan wrote:
>>> All drivers in imx call v4l2_async_notifier_cleanup() after
>>> unregistering the notifier except this driver.  This should be a
>>> miss and we need to add the call to fix it.
>>>
>>> Signed-off-by: Chuhong Yuan <hslester96@gmail.com> ---
>>> drivers/staging/media/imx/imx7-mipi-csis.c | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c
>>> b/drivers/staging/media/imx/imx7-mipi-csis.c index
>>> 99166afca071..2bfa85bb84e7 100644 ---
>>> a/drivers/staging/media/imx/imx7-mipi-csis.c +++
>>> b/drivers/staging/media/imx/imx7-mipi-csis.c @@ -1105,6 +1105,7 @@
>>> static int mipi_csis_remove(struct platform_device *pdev)
>>> mipi_csis_debugfs_exit(state);
>>> v4l2_async_unregister_subdev(&state->mipi_sd);
>>> v4l2_async_notifier_unregister(&state->subdev_notifier); +
>>> v4l2_async_notifier_cleanup(&state->subdev_notifier);
>>>   
>> In this case the "state->subdev_notifier" was never initialized or
>> used so both v4l2_async_notifier_unregister() and
>> v4l2_async_notifier_cleanup() are no-ops.
> I have applied this patch on top of Steve's series [0], since by the
> timeline I was expecting to be applied before this one, that series
> adds a bound notifier, even though, it is not named the same, eheh.
>
> That trigged me to think that this cleanup was correct since a
> notifier was initialized in probe.
>
> But as you say, it is a no-ops in the end.
>
> @Steve, that said, it looks that in [0], you will need to add some
> unregister and cleanup for the notifiers that you are adding in
> several places.

Well, turns out I had failed to notice that an async notifier was 
already included in 'struct imx7_csi' as 'subdev_notifier', even though 
it was unused. So I ended up creating a duplicate 'notifier'. I'll 
cleaning that up in v3 of [0].

Steve

> A patch to fix this will follow.
>
> ------
> Cheers,
>       Rui
>
>
>
> [0]: https://patchwork.kernel.org/project/linux-media/list/?series=207517
>
>> We should just delete "subdev_notifier".
>>
>> regards, dan carpenter
>>
>> _______________________________________________ devel mailing list
>> devel@linuxdriverproject.org
>> http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel

