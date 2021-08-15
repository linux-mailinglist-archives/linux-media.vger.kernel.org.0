Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2D223EC82A
	for <lists+linux-media@lfdr.de>; Sun, 15 Aug 2021 10:38:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236957AbhHOIi3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Aug 2021 04:38:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236425AbhHOIi3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Aug 2021 04:38:29 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C8FDC061764;
        Sun, 15 Aug 2021 01:37:59 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id BD718C642D; Sun, 15 Aug 2021 09:37:55 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1629016675; bh=WfiDsDMU3zWLAUc7/J7cMoyoqPlpogGZjRE4h+UE3HQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MXO9+4JZg2sqWDDeTWo2bGFeawLXLi2TiMjmxhi6S2bz9bMeHWve+CgCWf748qWLZ
         rLOOcUS6Xf3Uil1B87WhNN8yhj0ud/MAzV/ldPWWFZB5bfWcMkPgpMu+VCf0oLFSaT
         tWCPWPT26a0XCROMPNPUn11c8Foiffme8bYpWBYi4cVpPT0Xzywg6WEPjzsPq0lfNN
         mFDu66MUZ42ROG2P35eM0KHH5LdQmrqbcmMl54r2V2q5je+o8LBDuBjKYazp/jzy1P
         xMo/A1UmQxuS30y6cR/MveIY8t3h3DPvMNbhsCCI5u5JyHy9oBZFWPUp6eosi/VyPG
         jGd7UcAgI0ejg==
Date:   Sun, 15 Aug 2021 09:37:55 +0100
From:   Sean Young <sean@mess.org>
To:     Pavel Skripkin <paskripkin@gmail.com>
Cc:     mkrufky@linuxtv.org, mchehab@kernel.org, crope@iki.fi,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        syzbot+5ca0bf339f13c4243001@syzkaller.appspotmail.com
Subject: Re: [PATCH] media: mxl111sf: change mutex_init() location
Message-ID: <20210815083755.GA1827@gofer.mess.org>
References: <20210730213829.2909-1-paskripkin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210730213829.2909-1-paskripkin@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Jul 31, 2021 at 12:38:29AM +0300, Pavel Skripkin wrote:
> Syzbot reported, that mxl111sf_ctrl_msg() uses uninitialized
> mutex. The problem was in wrong mutex_init() location.
> 
> Previous mutex_init(&state->msg_lock) call was in ->init() function, but
> dvb_usbv2_init() has this order of calls:
> 
> 	dvb_usbv2_init()
> 	  dvb_usbv2_adapter_init()
> 	    dvb_usbv2_adapter_frontend_init()
> 	      props->frontend_attach()
> 
> 	  props->init()
> 
> Since mxl111sf_frontend_attach_atsc_mh() calls mxl111sf_ctrl_msg()
> internally we need to initialize state->msg_lock in it to make lockdep
> happy.

What about the other frontends like mxl111sf_frontend_attach_dvbt? They
no longer initialize the mutex.

Thanks

Sean

> 
> Reported-and-tested-by: syzbot+5ca0bf339f13c4243001@syzkaller.appspotmail.com
> Fixes: 8572211842af ("[media] mxl111sf: convert to new DVB USB")
> Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
> ---
>  drivers/media/usb/dvb-usb-v2/mxl111sf.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/usb/dvb-usb-v2/mxl111sf.c b/drivers/media/usb/dvb-usb-v2/mxl111sf.c
> index 7865fa0a8295..2e5663ffa7ce 100644
> --- a/drivers/media/usb/dvb-usb-v2/mxl111sf.c
> +++ b/drivers/media/usb/dvb-usb-v2/mxl111sf.c
> @@ -931,8 +931,6 @@ static int mxl111sf_init(struct dvb_usb_device *d)
>  		  .len = sizeof(eeprom), .buf = eeprom },
>  	};
>  
> -	mutex_init(&state->msg_lock);
> -
>  	ret = get_chip_info(state);
>  	if (mxl_fail(ret))
>  		pr_err("failed to get chip info during probe");
> @@ -979,8 +977,12 @@ static int mxl111sf_frontend_attach_mh(struct dvb_usb_adapter *adap)
>  static int mxl111sf_frontend_attach_atsc_mh(struct dvb_usb_adapter *adap)
>  {
>  	int ret;
> +	struct mxl111sf_state *state = d_to_priv(adap_to_d(adap));
> +
>  	pr_debug("%s\n", __func__);
>  
> +	mutex_init(&state->msg_lock);
> +
>  	ret = mxl111sf_lgdt3305_frontend_attach(adap, 0);
>  	if (ret < 0)
>  		return ret;
> -- 
> 2.32.0
