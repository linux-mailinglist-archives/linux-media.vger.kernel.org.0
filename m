Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2792BDA83F
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2019 11:27:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408481AbfJQJ0w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Oct 2019 05:26:52 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:42590 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732676AbfJQJ0w (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Oct 2019 05:26:52 -0400
Received: by mail-il1-f193.google.com with SMTP id o18so1336161ilo.9
        for <linux-media@vger.kernel.org>; Thu, 17 Oct 2019 02:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nRLZ7Rr8tp8Mq4v4Jt3Xijcjhr4FGUmBPYVDLUM8wn0=;
        b=HGC/4O8Icx41ulssxVeEOoYJau1t6GHm/Xrxotkr1aNIpeevmJ/nc+CyzyNoiyljOl
         AeRNDlFi9FDGc6cN2BxFCoGJC7Juqs5uhV48AyvpknCzZ5iQxCX37HbvpLOTnEsIAYXp
         L0o8/WzW+KZg6A/h4/H008AFz2TWdsBtS96L40VwzfhFlo/iLLNdqCNWmtmRAH7mbqrL
         XNpgQqrcFX/9bIUjZrgVNRsRCAyA7bMyfquLgAJAM9Luz9L21ZoIYWFiM12jKBxwZeRD
         NeLRxZColvSufT8G4IP2VjmZ4n8scmLAc/kyDX29fY8yWbJo2RD5o7fF/NhyKyLXxWaE
         evXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nRLZ7Rr8tp8Mq4v4Jt3Xijcjhr4FGUmBPYVDLUM8wn0=;
        b=ZY+1LrcnH2BzrcqLXUlvgvUEYVq0byDvn/6zfXrfIBUQQCtePW5pd/fuyE3mD+LVt0
         WL5h1Do+jVgKS9RnsSLy2piniR/IAmdoyWaHbB8xAZg5VwfTnJuwfcRGFz0MHyMzDpel
         dZeR/Uv7SwNL9oxNxHIxxNV6kqWzYrJnmmqwCv+dMZVChdG2gaAXZQpgihPx99Db+QDZ
         gxp0ip4SAw7JKmO/59FxLNhhVtupTfNjSXXrOr0McR9v+M0Q94WYu3ymtmgMsMdhm0Lt
         0lkHmNRpQAHoYJWVgDBhSc7ISdQEBh+oKY0kCutQXAPHWD6sUU0WOmaAkwDvPjtxABLs
         6v4g==
X-Gm-Message-State: APjAAAXatEk7U0N8jD0yHDF+S+B/9GBpd+GhuTyx3bdn2PmeFIm46oRA
        9CExhWTFjP4v8R7c9RcE6uR1ke8pHp7wKLfC6XO5nmwM
X-Google-Smtp-Source: APXvYqwvFnl1pJUCxBm3rg+u5BW+kRlRtJDNeCg3Rj2qz3EZm/jNzduKcJuBTKT6GmSwahOdkmLh6Y5KOuzDaf7WKdc=
X-Received: by 2002:a92:1507:: with SMTP id v7mr2313737ilk.37.1571304409584;
 Thu, 17 Oct 2019 02:26:49 -0700 (PDT)
MIME-Version: 1.0
References: <20191016133916.21475-1-hverkuil-cisco@xs4all.nl>
 <20191016133916.21475-3-hverkuil-cisco@xs4all.nl> <20191016162232.GY25745@shell.armlinux.org.uk>
In-Reply-To: <20191016162232.GY25745@shell.armlinux.org.uk>
From:   Dariusz Marcinkiewicz <darekm@google.com>
Date:   Thu, 17 Oct 2019 11:26:38 +0200
Message-ID: <CALFZZQEL_YFEJWw557p-uV14APthSoTn61tY59yXZEPioxPSfw@mail.gmail.com>
Subject: Re: [PATCHv8 2/2] drm: tda998x: set the connector info
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Russel.

On Wed, Oct 16, 2019 at 6:22 PM Russell King - ARM Linux admin
<linux@armlinux.org.uk> wrote:
>
...
> > --- a/drivers/gpu/drm/i2c/tda998x_drv.c
> > +++ b/drivers/gpu/drm/i2c/tda998x_drv.c
> > @@ -1337,6 +1337,8 @@ static int tda998x_connector_init(struct tda998x_priv *priv,
> >                                 struct drm_device *drm)
> >  {
> >       struct drm_connector *connector = &priv->connector;
> > +     struct cec_connector_info conn_info;
> > +     struct cec_notifier *notifier;
> >       int ret;
> >
> >       connector->interlace_allowed = 1;
> > @@ -1353,6 +1355,17 @@ static int tda998x_connector_init(struct tda998x_priv *priv,
> >       if (ret)
> >               return ret;
> >
> > +     cec_fill_conn_info_from_drm(&conn_info, connector);
> > +
> > +     notifier = cec_notifier_conn_register(priv->cec_glue.parent,
> > +                                           NULL, &conn_info);
> > +     if (!notifier)
> > +             return -ENOMEM;
> > +
> > +     mutex_lock(&priv->cec_notify_mutex);
> > +     priv->cec_notify = notifier;
> > +     mutex_unlock(&priv->cec_notify_mutex);
>
> As per my previous comments, this is a single-copy atomic operation.
> Either priv->cec_notify is set or it isn't; there is no intermediate
> value.  It can't be set to a value until cec_notifier_conn_register()
> has completed.  So the lock doesn't help.
>
....
> > +
> >       drm_connector_attach_encoder(&priv->connector,
> >                                    priv->bridge.encoder);
> >
> > @@ -1372,6 +1385,11 @@ static void tda998x_bridge_detach(struct drm_bridge *bridge)
...
> > +     mutex_lock(&priv->cec_notify_mutex);
> > +     cec_notifier_conn_unregister(priv->cec_notify);
> > +     priv->cec_notify = NULL;
> > +     mutex_unlock(&priv->cec_notify_mutex);
>
> This is the only case where the lock makes sense - to ensure that any
> of the cec_notifier_set_phys_addr*() functions aren't called
> concurrently with it.  However, there's no locking around the instance
> in tda998x_connector_get_modes(), so have you ensured that that
> function can't be called concurrently?
>
I assumed that tda998x_connector_get_modes does not need to be
synchronized as it belongs to the connector that gets cleaned up here.
But, on a closer look, I don't think that this assumption necessarily
holds.

If this patch is to be merged, I can send an update that:
- strips locking from tda998x_connector_init,
- in tda998x_connector_get_modes calls cec_notifier* with the lock held.

Thank you!
