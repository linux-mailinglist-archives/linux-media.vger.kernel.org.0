Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23E903F1625
	for <lists+linux-media@lfdr.de>; Thu, 19 Aug 2021 11:29:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229745AbhHSJ3r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Aug 2021 05:29:47 -0400
Received: from gofer.mess.org ([88.97.38.141]:59659 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237121AbhHSJ3q (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Aug 2021 05:29:46 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 487A9C6387; Thu, 19 Aug 2021 10:29:08 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1629365348; bh=C7uwMyjNl0bCdSvI6aq7gTWSSa6uWvk+cUiKBGZpHg4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GvfM9NXG2LQZt+wtwGIxNejOD7eyolHHGIDHnXXZvctciq+5rxaijyFbHqYyyXZbK
         SNg1MAcyJd/K0sB2OX5xKr8BmRWWLrHN1qlprnq8ixRkgRilC4+O8EvUSYrNDQIsjE
         s2ZDLz2XAb1VHBP4k066mLMdolQJUoTAssAhwCFslybkJzfOeCHzaqFCai7oRHTfPu
         QfxuCJUI2jBylquF0HnXJcxe4R98BZWXMvkCfwhSLeIWHS1XIkRxaQpBhp5DHu0KMg
         tzC+anveJVeHCUMSO5CVV/xiiZ2ryV7axJhU2C2/hsrpZVJAsZRcpQ1v/KGfK78MYD
         3XbMN2x5Qf3Lw==
Date:   Thu, 19 Aug 2021 10:29:08 +0100
From:   Sean Young <sean@mess.org>
To:     Pavel Skripkin <paskripkin@gmail.com>
Cc:     mkrufky@linuxtv.org, mchehab@kernel.org, crope@iki.fi,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        syzbot+5ca0bf339f13c4243001@syzkaller.appspotmail.com
Subject: Re: [PATCH] media: mxl111sf: change mutex_init() location
Message-ID: <20210819092908.GA27679@gofer.mess.org>
References: <20210730213829.2909-1-paskripkin@gmail.com>
 <20210815083755.GA1827@gofer.mess.org>
 <7ee99788-d9a5-0a38-ed02-51d9b42ebc11@gmail.com>
 <80648833-5f5a-0811-a281-0dba87938d3c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <80648833-5f5a-0811-a281-0dba87938d3c@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Aug 15, 2021 at 12:06:16PM +0300, Pavel Skripkin wrote:
> On 8/15/21 11:49 AM, Pavel Skripkin wrote:
> > On 8/15/21 11:37 AM, Sean Young wrote:
> > > On Sat, Jul 31, 2021 at 12:38:29AM +0300, Pavel Skripkin wrote:
> > > > Syzbot reported, that mxl111sf_ctrl_msg() uses uninitialized
> > > > mutex. The problem was in wrong mutex_init() location.
> > > > 
> > > > Previous mutex_init(&state->msg_lock) call was in ->init() function, but
> > > > dvb_usbv2_init() has this order of calls:
> > > > 
> > > > 	dvb_usbv2_init()
> > > > 	  dvb_usbv2_adapter_init()
> > > > 	    dvb_usbv2_adapter_frontend_init()
> > > > 	      props->frontend_attach()
> > > > 
> > > > 	  props->init()
> > > > 
> > > > Since mxl111sf_frontend_attach_atsc_mh() calls mxl111sf_ctrl_msg()
> > > > internally we need to initialize state->msg_lock in it to make lockdep
> > > > happy.
> > > 
> > > What about the other frontends like mxl111sf_frontend_attach_dvbt? They
> > > no longer initialize the mutex.
> > > 
> > Good point. I see, that all other frontends also call
> > mxl111sf_ctrl_msg() inside ->frontend_attach() call.
> > 
> > I think, that fixing dvb-usb core is not good idea, so, I will add
> > mutex_init() call inside all frontends, which use mxl111sf_init().
> > 
> > What do you think about it?
> > 
> > 
> 
> 
> Something like this should work. Helper is just to not copy-paste code
> parts. Build tested against v5.14-rc5

How about creating a dvb_usb_device_properties probe function and
initializing the mutex init there?


Sean

> 
> 
> diff --git a/drivers/media/usb/dvb-usb-v2/mxl111sf.c
> b/drivers/media/usb/dvb-usb-v2/mxl111sf.c
> index 7865fa0a8295..db1ad3815cd5 100644
> --- a/drivers/media/usb/dvb-usb-v2/mxl111sf.c
> +++ b/drivers/media/usb/dvb-usb-v2/mxl111sf.c
> @@ -49,6 +49,13 @@ MODULE_PARM_DESC(rfswitch, "force rf switch position
> (0=auto, 1=ext, 2=int).");
> 
>  DVB_DEFINE_MOD_OPT_ADAPTER_NR(adapter_nr);
> 
> +static inline void mxl111sf_init_msg_mutex(struct dvb_usb_adapter *adap)
> +{
> +	struct mxl111sf_state *state = d_to_priv(adap_to_d(adap));
> +
> +	mutex_init(&state->msg_lock);
> +}
> +
>  int mxl111sf_ctrl_msg(struct mxl111sf_state *state,
>  		      u8 cmd, u8 *wbuf, int wlen, u8 *rbuf, int rlen)
>  {
> @@ -931,8 +938,6 @@ static int mxl111sf_init(struct dvb_usb_device *d)
>  		  .len = sizeof(eeprom), .buf = eeprom },
>  	};
> 
> -	mutex_init(&state->msg_lock);
> -
>  	ret = get_chip_info(state);
>  	if (mxl_fail(ret))
>  		pr_err("failed to get chip info during probe");
> @@ -963,16 +968,19 @@ static int mxl111sf_init(struct dvb_usb_device *d)
> 
>  static int mxl111sf_frontend_attach_dvbt(struct dvb_usb_adapter *adap)
>  {
> +	mxl111sf_init_msg_mutex(adap);
>  	return mxl111sf_attach_demod(adap, 0);
>  }
> 
>  static int mxl111sf_frontend_attach_atsc(struct dvb_usb_adapter *adap)
>  {
> +	mxl111sf_init_msg_mutex(adap);
>  	return mxl111sf_lgdt3305_frontend_attach(adap, 0);
>  }
> 
>  static int mxl111sf_frontend_attach_mh(struct dvb_usb_adapter *adap)
>  {
> +	mxl111sf_init_msg_mutex(adap);
>  	return mxl111sf_lg2160_frontend_attach(adap, 0);
>  }
> 
> @@ -981,6 +989,7 @@ static int mxl111sf_frontend_attach_atsc_mh(struct
> dvb_usb_adapter *adap)
>  	int ret;
>  	pr_debug("%s\n", __func__);
> 
> +	mxl111sf_init_msg_mutex(adap);
>  	ret = mxl111sf_lgdt3305_frontend_attach(adap, 0);
>  	if (ret < 0)
>  		return ret;
> @@ -1001,6 +1010,7 @@ static int mxl111sf_frontend_attach_mercury(struct
> dvb_usb_adapter *adap)
>  	int ret;
>  	pr_debug("%s\n", __func__);
> 
> +	mxl111sf_init_msg_mutex(adap);
>  	ret = mxl111sf_lgdt3305_frontend_attach(adap, 0);
>  	if (ret < 0)
>  		return ret;
> @@ -1021,6 +1031,7 @@ static int mxl111sf_frontend_attach_mercury_mh(struct
> dvb_usb_adapter *adap)
>  	int ret;
>  	pr_debug("%s\n", __func__);
> 
> +	mxl111sf_init_msg_mutex(adap);
>  	ret = mxl111sf_attach_demod(adap, 0);
>  	if (ret < 0)
>  		return ret;
> 
> 
> 
> With regards,
> Pavel Skripkin
