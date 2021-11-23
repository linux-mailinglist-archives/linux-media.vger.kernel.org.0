Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EF4B459C56
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 07:25:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229678AbhKWG2L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Nov 2021 01:28:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230036AbhKWG2I (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Nov 2021 01:28:08 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42C68C061574
        for <linux-media@vger.kernel.org>; Mon, 22 Nov 2021 22:25:01 -0800 (PST)
Received: from [IPV6:2a01:e0a:169:7140:3c3b:9149:b:8aa9] (unknown [IPv6:2a01:e0a:169:7140:3c3b:9149:b:8aa9])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C442BA1B;
        Tue, 23 Nov 2021 07:24:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1637648699;
        bh=7hUCcD0cTUVyXi8ByOrk+ivCQF4J1JEALy4Ux+22t2U=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=gzwuCvwS8KlA3Dw19EGKHIdG4C67zOFe/I7egCqUtbaf/pTezr2nBwRLhHHe6jcUS
         G4LwQ/k8lKQr/Ur/BvsDsaArwt3fugPpVo8HretiNzowKxf8lo/H/sYrSt1S3UNNCp
         O9RZRgfJvD+AGL5xOrRMiZriVkjEkMjNGbJgyDmc=
Message-ID: <cf50f239-f36a-0791-78af-2cb152ad3e8c@ideasonboard.com>
Date:   Tue, 23 Nov 2021 07:24:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v6 1/3] media: ipu3-cio2: Toggle sensor streaming in pm
 runtime ops
Content-Language: en-US
To:     Daniel Scally <djrscally@gmail.com>, linux-media@vger.kernel.org
Cc:     sakari.ailus@linux.intel.com, andriy.shevchenko@linux.intel.com,
        laurent.pinchart@ideasonboard.com, yong.zhi@intel.com,
        bingbu.cao@intel.com, kieran.bingham@ideasonboard.com,
        hdegoede@redhat.com
References: <20211122235613.41682-1-djrscally@gmail.com>
 <20211122235613.41682-2-djrscally@gmail.com>
From:   Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
In-Reply-To: <20211122235613.41682-2-djrscally@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

On 23/11/2021 00:56, Daniel Scally wrote:
> The .suspend() and .resume() runtime_pm operations for the ipu3-cio2
> driver currently do not handle the sensor's stream. Setting .s_stream() on
> or off for the sensor subdev means that sensors will pause and resume the
> stream at the appropriate time even if their drivers don't implement those
> operations.
> 
> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> Signed-off-by: Daniel Scally <djrscally@gmail.com>
Tested-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
Reviewed-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
> ---
> Changes since v5:
> 
> 	- None
> 
>   drivers/media/pci/intel/ipu3/ipu3-cio2-main.c | 17 ++++++++++++++++-
>   1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> index 356ea966cf8d..e2874fee9530 100644
> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> @@ -1966,12 +1966,19 @@ static int __maybe_unused cio2_suspend(struct device *dev)
>   	struct pci_dev *pci_dev = to_pci_dev(dev);
>   	struct cio2_device *cio2 = pci_get_drvdata(pci_dev);
>   	struct cio2_queue *q = cio2->cur_queue;
> +	int r;
>   
>   	dev_dbg(dev, "cio2 suspend\n");
>   	if (!cio2->streaming)
>   		return 0;
>   
>   	/* Stop stream */
> +	r = v4l2_subdev_call(q->sensor, video, s_stream, 0);
> +	if (r) {
> +		dev_err(dev, "failed to stop sensor streaming\n");
> +		return r;
> +	}
> +
>   	cio2_hw_exit(cio2, q);
>   	synchronize_irq(pci_dev->irq);
>   
> @@ -2005,8 +2012,16 @@ static int __maybe_unused cio2_resume(struct device *dev)
>   	}
>   
>   	r = cio2_hw_init(cio2, q);
> -	if (r)
> +	if (r) {
>   		dev_err(dev, "fail to init cio2 hw\n");
> +		return r;
> +	}
> +
> +	r = v4l2_subdev_call(q->sensor, video, s_stream, 1);
> +	if (r) {
> +		dev_err(dev, "fail to start sensor streaming\n");
> +		cio2_hw_exit(cio2, q);
> +	}
>   
>   	return r;
>   }
> 
