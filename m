Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50894D970D
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2019 18:22:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406143AbfJPQWi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Oct 2019 12:22:38 -0400
Received: from pandora.armlinux.org.uk ([78.32.30.218]:59866 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727451AbfJPQWi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Oct 2019 12:22:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=mrJvn3liV+DZQU5EJ5RJHD7FS7q5mla25X7BFGETVL8=; b=YgsBjABZYZX1KmRFqvLFkXUsN
        RBzZl0s67H5XDBRxy3ej4NMVKuWvb60ijdPj/iyk8siXmgfIHvNKvB4C7N1QxBr7zsDbcJO+5oitu
        2zkj3pJ/cTjaGyFiwWD7fJDhuZN9KqikpxPZdB2NpM6vIiDDPP+NguiQW8qwUJC2eA9mcIIWQDu9R
        rSOsUqdsVfsRUPMP4oGZ0DXIoWDlynqbELDZchU9fU6615HxG6w15Av2sLUMSiaxO/ynf8JwkiCNd
        gEv+sZegWk55vEM24YIFx8bUsGFSgNw8HIP3Oxn78Ab8h6ucA6o/gUte2253/o+tga3h95hd7P5gy
        ocFQA9VBg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55454)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1iKm4H-0003Un-TL; Wed, 16 Oct 2019 17:22:34 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1iKm4G-0007Hf-VR; Wed, 16 Oct 2019 17:22:33 +0100
Date:   Wed, 16 Oct 2019 17:22:32 +0100
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Dariusz Marcinkiewicz <darekm@google.com>,
        dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCHv8 2/2] drm: tda998x: set the connector info
Message-ID: <20191016162232.GY25745@shell.armlinux.org.uk>
References: <20191016133916.21475-1-hverkuil-cisco@xs4all.nl>
 <20191016133916.21475-3-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191016133916.21475-3-hverkuil-cisco@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 16, 2019 at 03:39:16PM +0200, Hans Verkuil wrote:
> From: Dariusz Marcinkiewicz <darekm@google.com>
> 
> Fill in the cec_connector_info when calling cec_notifier_conn_register().
> 
> Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
> Tested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/gpu/drm/i2c/tda998x_drv.c | 31 ++++++++++++++++++-------------
>  1 file changed, 18 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/i2c/tda998x_drv.c
> index 8262b44b776e..b0620842fa3a 100644
> --- a/drivers/gpu/drm/i2c/tda998x_drv.c
> +++ b/drivers/gpu/drm/i2c/tda998x_drv.c
> @@ -1337,6 +1337,8 @@ static int tda998x_connector_init(struct tda998x_priv *priv,
>  				  struct drm_device *drm)
>  {
>  	struct drm_connector *connector = &priv->connector;
> +	struct cec_connector_info conn_info;
> +	struct cec_notifier *notifier;
>  	int ret;
>  
>  	connector->interlace_allowed = 1;
> @@ -1353,6 +1355,17 @@ static int tda998x_connector_init(struct tda998x_priv *priv,
>  	if (ret)
>  		return ret;
>  
> +	cec_fill_conn_info_from_drm(&conn_info, connector);
> +
> +	notifier = cec_notifier_conn_register(priv->cec_glue.parent,
> +					      NULL, &conn_info);
> +	if (!notifier)
> +		return -ENOMEM;
> +
> +	mutex_lock(&priv->cec_notify_mutex);
> +	priv->cec_notify = notifier;
> +	mutex_unlock(&priv->cec_notify_mutex);

As per my previous comments, this is a single-copy atomic operation.
Either priv->cec_notify is set or it isn't; there is no intermediate
value.  It can't be set to a value until cec_notifier_conn_register()
has completed.  So the lock doesn't help.

> +
>  	drm_connector_attach_encoder(&priv->connector,
>  				     priv->bridge.encoder);
>  
> @@ -1372,6 +1385,11 @@ static void tda998x_bridge_detach(struct drm_bridge *bridge)
>  {
>  	struct tda998x_priv *priv = bridge_to_tda998x_priv(bridge);
>  
> +	mutex_lock(&priv->cec_notify_mutex);
> +	cec_notifier_conn_unregister(priv->cec_notify);
> +	priv->cec_notify = NULL;
> +	mutex_unlock(&priv->cec_notify_mutex);

This is the only case where the lock makes sense - to ensure that any
of the cec_notifier_set_phys_addr*() functions aren't called
concurrently with it.  However, there's no locking around the instance
in tda998x_connector_get_modes(), so have you ensured that that
function can't be called concurrently?

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
