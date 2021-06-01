Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80E14397160
	for <lists+linux-media@lfdr.de>; Tue,  1 Jun 2021 12:25:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233682AbhFAK06 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Jun 2021 06:26:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233218AbhFAK0u (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Jun 2021 06:26:50 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9330FC061763;
        Tue,  1 Jun 2021 03:25:09 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 8AF69C638E; Tue,  1 Jun 2021 11:25:06 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1622543106; bh=q+hwvC5rYkGr1gD06LtI/+vC8d9uPNtAdb1sp16Hnv8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=O+B6icXR3Qqr/mYjMkol3qK27XdmbnRtUAA4uiyCrdtC/w1H74cr5y/s7JvuKnQKA
         KfcLXUN0V1AhpoWpvR8ktsWdPK9XAxmvaSrc9ZZqEeBrznzaVu89OViy+l6NIfawRU
         epmRcK2V8/iVq8almwUXIPv91F9qp7/8Ifeu6PCGPK3moc5bsApaQykmBrJGVWYSRF
         1J1YYFIjSdJFnXRTyIDC2/IOFx3btZs120OFCb/SguiAcGdPD27zqRFWnz2rRk+uwh
         G+GfYBZcwfictU8+zh0ie3nDUgDMhyNQ+e3A6/hJZyP+ydI0ml9qPWhPDk8nzQzeHJ
         k8JcOUgRfU8mQ==
Date:   Tue, 1 Jun 2021 11:25:06 +0100
From:   Sean Young <sean@mess.org>
To:     Tong Tiangen <tongtiangen@huawei.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] media: rc: Fix a typo in lirc_ioctl
Message-ID: <20210601102506.GA13203@gofer.mess.org>
References: <20210601100235.69935-1-tongtiangen@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210601100235.69935-1-tongtiangen@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jun 01, 2021 at 06:02:35PM +0800, Tong Tiangen wrote:
> Fix a typo in lirc_ioctl, apparently min_timeout should be used
> in this case.
> 
> Fixes: e589333f346b ("V4L/DVB: IR: extend interfaces to support more device settings")
> Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
> ---
>  drivers/media/rc/lirc_dev.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/rc/lirc_dev.c b/drivers/media/rc/lirc_dev.c
> index 116daf90c858..abbeae2ccd4a 100644
> --- a/drivers/media/rc/lirc_dev.c
> +++ b/drivers/media/rc/lirc_dev.c
> @@ -534,7 +534,7 @@ static long lirc_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>  
>  	/* Generic timeout support */
>  	case LIRC_GET_MIN_TIMEOUT:
> -		if (!dev->max_timeout)
> +		if (!dev->min_timeout)

So maybe this isn't the clearest piece of code, but all rc drivers set
either both of min_timeout & max_timeout, or neither. Having a max_timeout
without a min_timeout does not make any sense.

Changing this to min_timeout gives the impression min_timeout can be set
without max_timeout, which is not the case. This should at least commented.

Thanks

Sean

>  			ret = -ENOTTY;
>  		else
>  			val = dev->min_timeout;
> -- 
> 2.18.0.huawei.25
