Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06C713A2B30
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 14:14:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230267AbhFJMQ1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 08:16:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229935AbhFJMQX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 08:16:23 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33E16C061574;
        Thu, 10 Jun 2021 05:14:27 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 487A6C6487; Thu, 10 Jun 2021 13:14:25 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1623327265; bh=VCd2WjTRQnKoY2fCzfIO2bs3Y/3iauQT+KXtkIwkbiQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tGxfWksSG1Sfd9zFYQDob4MbCHTnRYUa920c9hLJ8d8G8diiUAPiDtiLlhnjn60Gh
         uh+ew7ZMpLENkPnvTrdDbkrmm+KPW+5ouNsCRvrJfwSjLfu8TkRvvlo+fqJR/tz7w3
         oEMTELpnKNOk2/4yLxi78QTOYtjn8fQ78oidCG3f7EXZGmiEbeZX2CbfTSW85r7qUs
         CS5Bn8veFRzJ9+BriXLadoVo6ug2A/d7Ykg1Vxnwvalk/xZcKD61eAeZXAy7+OH99D
         ngbQk4s9bMp9aeGadDg8UWyNYvvtabTqHvXK0v1vYvWbKqrVcvXbfJ9zAQ3sRTKPqF
         zOH5I12bJL1fA==
Date:   Thu, 10 Jun 2021 13:14:25 +0100
From:   Sean Young <sean@mess.org>
To:     lijian_8010a29@163.com
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, lijian <lijian@yulong.com>
Subject: Re: [PATCH] media: rc: rc-main.c: deleted the repeated word
Message-ID: <20210610121425.GA32388@gofer.mess.org>
References: <20210610092725.68415-1-lijian_8010a29@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210610092725.68415-1-lijian_8010a29@163.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jun 10, 2021 at 05:27:25PM +0800, lijian_8010a29@163.com wrote:
> From: lijian <lijian@yulong.com>
> 
> deleted the repeated word 'the' in the comments.
> 
> Signed-off-by: lijian <lijian@yulong.com>

Thanks for this patch and the other patches; the patches look good. The kernel
does have a policy of wanting a full name. Now, please forgive my ignorance
but I can't tell if this your full name.

Thanks,

Sean

> ---
>  drivers/media/rc/rc-main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/rc/rc-main.c b/drivers/media/rc/rc-main.c
> index 8e88dc8ea6c5..b90438a71c80 100644
> --- a/drivers/media/rc/rc-main.c
> +++ b/drivers/media/rc/rc-main.c
> @@ -1940,7 +1940,7 @@ int rc_register_device(struct rc_dev *dev)
>  	kfree(path);
>  
>  	/*
> -	 * once the the input device is registered in rc_setup_rx_device,
> +	 * once the input device is registered in rc_setup_rx_device,
>  	 * userspace can open the input device and rc_open() will be called
>  	 * as a result. This results in driver code being allowed to submit
>  	 * keycodes with rc_keydown, so lirc must be registered first.
> -- 
> 2.25.1
> 
