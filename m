Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B62D545A847
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 17:37:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239122AbhKWQkh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Nov 2021 11:40:37 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:45856 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239083AbhKWQkN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Nov 2021 11:40:13 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id 5E5ED1F42E68
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
        t=1637685421; bh=daLlUwwNiWxjyGD9q5YosR2QXIU4H+EhNkLeXPcw3AE=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=G4Z1I8lixs87F0ianK1zbYPYVeiBnYksWWed/JJdLhzfz9Cd8k4R7g600a4jgqT6e
         CEJQNsDcOsTXbCNiW2JoBfjJGggrDNF7rnf0+QzIsHUypEAERKqCf6Z53jkzRO+9FE
         JM2P6zCOUxqL4wlqrOj2CZdpKdm4KZgyOwfAt0RVJ65pN016UYDqXMW/8CtrjbUw9f
         VFm53j2Tz51kP+1zCh6QM+dGE541/YFf7aTkx2eG69oREeEwP765jox5HopYmz9n+x
         NIF5qlSs7WZKB3E4alMSpNAvZk0E7VCq1iTq9e3FVB5PsDtDh1yXiahcY9O907fa5R
         KT9ke1sko2Fmw==
Subject: Re: [PATCH 1/7] media: hantro: add support for reset lines
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Jernej Skrabec <jernej.skrabec@gmail.com>,
        linux-media@vger.kernel.org, ezequiel@vanguardiasur.com.ar,
        nicolas.dufresne@collabora.com, mchehab@kernel.org,
        robh+dt@kernel.org, mripard@kernel.org, wens@csie.org,
        p.zabel@pengutronix.de, gregkh@linuxfoundation.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-staging@lists.linux.dev
References: <20211122184702.768341-1-jernej.skrabec@gmail.com>
 <20211122184702.768341-2-jernej.skrabec@gmail.com>
 <08e80e9e-f646-72e4-e4d4-f8e6310228f1@collabora.com>
 <20211123145933.GD6514@kadam>
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Message-ID: <c474e2b5-8900-a7ca-620d-e03a284cf0fb@collabora.com>
Date:   Tue, 23 Nov 2021 17:36:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211123145933.GD6514@kadam>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dan, hi Jernej,

W dniu 23.11.2021 o 15:59, Dan Carpenter pisze:
> On Tue, Nov 23, 2021 at 12:09:03PM +0100, Andrzej Pietrasiewicz wrote:
>>> diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
>>> index ab2467998d29..8c3de31f51b3 100644
>>> --- a/drivers/staging/media/hantro/hantro_drv.c
>>> +++ b/drivers/staging/media/hantro/hantro_drv.c
>>> @@ -905,6 +905,10 @@ static int hantro_probe(struct platform_device *pdev)
>>>    			return PTR_ERR(vpu->clocks[0].clk);
>>>    	}
>>> +	vpu->resets = devm_reset_control_array_get(&pdev->dev, false, true);
>>> +	if (IS_ERR(vpu->resets))
>>> +		return PTR_ERR(vpu->resets);
>>> +
>>>    	num_bases = vpu->variant->num_regs ?: 1;
>>>    	vpu->reg_bases = devm_kcalloc(&pdev->dev, num_bases,
>>>    				      sizeof(*vpu->reg_bases), GFP_KERNEL);
>>> @@ -978,10 +982,16 @@ static int hantro_probe(struct platform_device *pdev)
>>>    	pm_runtime_use_autosuspend(vpu->dev);
>>>    	pm_runtime_enable(vpu->dev);
>          ^^^^^^^^^^^^^^^^^^^^^^^^^^^
> It looks like this is the pm stuff that we have to unwind on error
> 
>>> +	ret = reset_control_deassert(vpu->resets);
>>> +	if (ret) {
>>> +		dev_err(&pdev->dev, "Failed to deassert resets\n");
>>> +		return ret;
>                  ^^^^^^^^^^
> So this return should be a goto undo_pm_stuff
> 
> 
>>> +	}
>>> +
>>>    	ret = clk_bulk_prepare(vpu->variant->num_clocks, vpu->clocks);
>>>    	if (ret) {
>>>    		dev_err(&pdev->dev, "Failed to prepare clocks\n");
>>> -		return ret;
> 
> And this return should also have been a goto so it's a bug in the
> original code.

So we probably want a separate patch addressing that first, and then
the series proper on top of that.

Regards,

Andrzej

> 
>>> +		goto err_rst_assert;
>>
>> Before your patch is applied if clk_bulk_prepare() fails, we
>> simply return on the spot. After the patch is applied not only
>> do you...
>>
>>>    	}
>>>    	ret = v4l2_device_register(&pdev->dev, &vpu->v4l2_dev);
>>> @@ -1037,6 +1047,8 @@ static int hantro_probe(struct platform_device *pdev)
>>>    	v4l2_device_unregister(&vpu->v4l2_dev);
>>>    err_clk_unprepare:
>>>    	clk_bulk_unprepare(vpu->variant->num_clocks, vpu->clocks);
>>> +err_rst_assert:
>>> +	reset_control_assert(vpu->resets);
>>
>> ...revert the effect of reset_control_deassert(), you also...
>>
>>>    	pm_runtime_dont_use_autosuspend(vpu->dev);
>>>    	pm_runtime_disable(vpu->dev);
>>
>> ... do pm_*() stuff. Is there any reason why this is needed?
> 
> So, yes, it's needed, but you're correct to spot that it's not
> consistent.
> 
> regards,
> dan carpenter
> 

