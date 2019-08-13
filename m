Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47B668B6F1
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2019 13:32:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726826AbfHMLcS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Aug 2019 07:32:18 -0400
Received: from pandora.armlinux.org.uk ([78.32.30.218]:35430 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725981AbfHMLcR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Aug 2019 07:32:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=8Cz0dhG8JlSQ8zGF79vjEHYxjSQnz3txKDT7QLmjLxw=; b=xiBNoaBz67Ngmks68l8gE5aH5
        zIsOBxAGr5sqkC5CdQ/z8Vbf11g0UU9hxKAeoBC2XdOqEHVza2pPKPC2gRpHrzSmVa5P0zsE63NYq
        uj74WAySYdSqhaW4PJyoDlO+cO/H/2Tt7y1+5yYLkDO1+PdWHQ/iBYmG6VI8nb9Y9swI2R+DBrTSZ
        yLoL91CwrTeOXy6Om9ZrLhDxUzrFTo3JF3mTUnHjj6diabS0izAT44mUggMhBcPnb4V4h54o5C1bP
        J+ozu2+DthD3z8XjCqcqEv1nQOfCorWHYk/0eWjzlz41yMWHMQDMtZeKMh5Jx3CvcdrUhL3dxH7xB
        OBABDGFWA==;
Received: from shell.armlinux.org.uk ([2002:4e20:1eda:1:5054:ff:fe00:4ec]:51944)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1hxV2D-0008RU-Hh; Tue, 13 Aug 2019 12:32:13 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1hxV29-0007Sy-BL; Tue, 13 Aug 2019 12:32:09 +0100
Date:   Tue, 13 Aug 2019 12:32:09 +0100
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Dariusz Marcinkiewicz <darekm@google.com>
Cc:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        hverkuil-cisco@xs4all.nl, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Allison Randal <allison@lohutok.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Kees Cook <keescook@chromium.org>,
        Colin Ian King <colin.king@canonical.com>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 3/8] tda9950: use cec_notifier_cec_adap_(un)register
Message-ID: <20190813113209.GF13294@shell.armlinux.org.uk>
References: <20190813110300.83025-1-darekm@google.com>
 <20190813110300.83025-4-darekm@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190813110300.83025-4-darekm@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Aug 13, 2019 at 01:02:35PM +0200, Dariusz Marcinkiewicz wrote:
> Use the new cec_notifier_cec_adap_(un)register() functions to
> (un)register the notifier for the CEC adapter.
> 
> Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Tested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/gpu/drm/i2c/tda9950.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i2c/tda9950.c b/drivers/gpu/drm/i2c/tda9950.c
> index 8039fc0d83db4..a5a75bdeb7a5f 100644
> --- a/drivers/gpu/drm/i2c/tda9950.c
> +++ b/drivers/gpu/drm/i2c/tda9950.c
> @@ -420,7 +420,8 @@ static int tda9950_probe(struct i2c_client *client,
>  		priv->hdmi = glue->parent;
>  
>  	priv->adap = cec_allocate_adapter(&tda9950_cec_ops, priv, "tda9950",
> -					  CEC_CAP_DEFAULTS,
> +					  CEC_CAP_DEFAULTS |
> +					  CEC_CAP_CONNECTOR_INFO,
>  					  CEC_MAX_LOG_ADDRS);
>  	if (IS_ERR(priv->adap))
>  		return PTR_ERR(priv->adap);
> @@ -457,13 +458,14 @@ static int tda9950_probe(struct i2c_client *client,
>  	if (ret < 0)
>  		return ret;
>  
> -	priv->notify = cec_notifier_get(priv->hdmi);
> +	priv->notify = cec_notifier_cec_adap_register(priv->hdmi, NULL,
> +						      priv->adap);
>  	if (!priv->notify)
>  		return -ENOMEM;
>  
>  	ret = cec_register_adapter(priv->adap, priv->hdmi);
>  	if (ret < 0) {
> -		cec_notifier_put(priv->notify);
> +		cec_notifier_cec_adap_unregister(priv->notify);
>  		return ret;
>  	}
>  
> @@ -473,8 +475,6 @@ static int tda9950_probe(struct i2c_client *client,
>  	 */
>  	devm_remove_action(dev, tda9950_cec_del, priv);
>  
> -	cec_register_cec_notifier(priv->adap, priv->notify);
> -
>  	return 0;
>  }
>  
> @@ -482,8 +482,8 @@ static int tda9950_remove(struct i2c_client *client)
>  {
>  	struct tda9950_priv *priv = i2c_get_clientdata(client);
>  
> +	cec_notifier_cec_adap_unregister(priv->notify);
>  	cec_unregister_adapter(priv->adap);
> -	cec_notifier_put(priv->notify);

It looks weird to have an unexpectedly different ordering of
unregistration from the registration path - normally, unregistration
is the reverse order of initialisation.

In the initialisation path, it seems that we register the notifier
and _then_ the adapter.  Here, we unregister the notifier and then
the adapter rather than what would normally be expected.  Why is
this?  I suspect there will be drivers created that do this the
"normal" way round, so if this is a requirement, it needs to be made
plainly obvious.

>  
>  	return 0;
>  }
> -- 
> 2.23.0.rc1.153.gdeed80330f-goog
> 
> 

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
