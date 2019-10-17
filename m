Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3986CDA8E3
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2019 11:44:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393734AbfJQJoY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Oct 2019 05:44:24 -0400
Received: from pandora.armlinux.org.uk ([78.32.30.218]:43890 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727873AbfJQJoY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Oct 2019 05:44:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=brf7/wYGSzINPAgq1erOz4Su2wE5nM8MRw1gSveQ+qY=; b=ZpcvYUYQht++wPhWfQl5lRy+3
        QuLT+D1AH9sBsRl/UIWVKw1d4smvriWZ/XeH6KXyrGdMG+Zgnz6/sVgvEbqeWSaN0mA1ZWep32S6c
        /buaY1zS43KcIB6gHZAzh34ghPxuMFZTM3ITIDMxISxOrd/7/dJCZhqhcCfSHKoZRKBTJqepwcsbB
        CvN361qQuvG5LOozHWDQKogZzZuPzWM/ImLvoNmTgN8xZkSRqgxk39Y07v4SyOmKISy/aUZDhz01X
        lAlv6Bmj+HL9FNwGiNtzMdNL7L6CWr5B2mdzk+6EfTU5Jc2LcHlCFRiMNHFBEX7QncFbKBLlYS8pu
        UsA+rjd1A==;
Received: from shell.armlinux.org.uk ([2001:4d48:ad52:3201:5054:ff:fe00:4ec]:43844)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1iL2KR-000869-J1; Thu, 17 Oct 2019 10:44:19 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1iL2KL-00086j-8Y; Thu, 17 Oct 2019 10:44:13 +0100
Date:   Thu, 17 Oct 2019 10:44:13 +0100
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Dariusz Marcinkiewicz <darekm@google.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCHv8 2/2] drm: tda998x: set the connector info
Message-ID: <20191017094413.GB25745@shell.armlinux.org.uk>
References: <20191016133916.21475-1-hverkuil-cisco@xs4all.nl>
 <20191016133916.21475-3-hverkuil-cisco@xs4all.nl>
 <20191016162232.GY25745@shell.armlinux.org.uk>
 <CALFZZQEL_YFEJWw557p-uV14APthSoTn61tY59yXZEPioxPSfw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALFZZQEL_YFEJWw557p-uV14APthSoTn61tY59yXZEPioxPSfw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Oct 17, 2019 at 11:26:38AM +0200, Dariusz Marcinkiewicz wrote:
> Hi Russel.
> 
> On Wed, Oct 16, 2019 at 6:22 PM Russell King - ARM Linux admin
> <linux@armlinux.org.uk> wrote:
> >
> ...
> > > --- a/drivers/gpu/drm/i2c/tda998x_drv.c
> > > +++ b/drivers/gpu/drm/i2c/tda998x_drv.c
> > > @@ -1337,6 +1337,8 @@ static int tda998x_connector_init(struct tda998x_priv *priv,
> > >                                 struct drm_device *drm)
> > >  {
> > >       struct drm_connector *connector = &priv->connector;
> > > +     struct cec_connector_info conn_info;
> > > +     struct cec_notifier *notifier;
> > >       int ret;
> > >
> > >       connector->interlace_allowed = 1;
> > > @@ -1353,6 +1355,17 @@ static int tda998x_connector_init(struct tda998x_priv *priv,
> > >       if (ret)
> > >               return ret;
> > >
> > > +     cec_fill_conn_info_from_drm(&conn_info, connector);
> > > +
> > > +     notifier = cec_notifier_conn_register(priv->cec_glue.parent,
> > > +                                           NULL, &conn_info);
> > > +     if (!notifier)
> > > +             return -ENOMEM;
> > > +
> > > +     mutex_lock(&priv->cec_notify_mutex);
> > > +     priv->cec_notify = notifier;
> > > +     mutex_unlock(&priv->cec_notify_mutex);
> >
> > As per my previous comments, this is a single-copy atomic operation.
> > Either priv->cec_notify is set or it isn't; there is no intermediate
> > value.  It can't be set to a value until cec_notifier_conn_register()
> > has completed.  So the lock doesn't help.
> >
> ....
> > > +
> > >       drm_connector_attach_encoder(&priv->connector,
> > >                                    priv->bridge.encoder);
> > >
> > > @@ -1372,6 +1385,11 @@ static void tda998x_bridge_detach(struct drm_bridge *bridge)
> ...
> > > +     mutex_lock(&priv->cec_notify_mutex);
> > > +     cec_notifier_conn_unregister(priv->cec_notify);
> > > +     priv->cec_notify = NULL;
> > > +     mutex_unlock(&priv->cec_notify_mutex);
> >
> > This is the only case where the lock makes sense - to ensure that any
> > of the cec_notifier_set_phys_addr*() functions aren't called
> > concurrently with it.  However, there's no locking around the instance
> > in tda998x_connector_get_modes(), so have you ensured that that
> > function can't be called concurrently?
> >
> I assumed that tda998x_connector_get_modes does not need to be
> synchronized as it belongs to the connector that gets cleaned up here.
> But, on a closer look, I don't think that this assumption necessarily
> holds.
> 
> If this patch is to be merged, I can send an update that:
> - strips locking from tda998x_connector_init,
> - in tda998x_connector_get_modes calls cec_notifier* with the lock held.

Okay, I'd suggest a comment in the code describing precisely what the
lock is doing would be a good idea, as it may not be obvious in the
future.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
