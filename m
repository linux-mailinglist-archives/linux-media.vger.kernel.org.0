Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 304CB18665
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2019 09:53:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726174AbfEIHxF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 May 2019 03:53:05 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:39902 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725943AbfEIHxE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 May 2019 03:53:04 -0400
Received: by mail-lf1-f65.google.com with SMTP id f1so835304lfl.6
        for <linux-media@vger.kernel.org>; Thu, 09 May 2019 00:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O2pnzsjExgiU74Rp+J+FwN2xzCGKrR8arkSJatK/AQ4=;
        b=YfAyIBucDqDPZ8in/ZUpEbAnzAzQ7xF/zpbwhriOvlm+1mE4jIcPZjxSN7GLezV9HW
         a695Xs2OW7+3+g5t0GpZFcuajcY5sQd2vrpuQl5yYx/TK9dXKGMCX0L3d3HBBnXBIwM1
         dRYhWpGajHkOYyORUX4j1YC0lBvDPU744MHwaOqm7plJi7AE9PwiHOnFEJTlULpJjwri
         m2zTZdvOpTcEMwltGD6WYpBpWbDy5B5qa0TKU67zsxBOmsafUBd2de9KDUrh+l61p/Qy
         tU6UzGrh6j0daKxe2iKLGKkSIzloGoIiBk0x9LX4wtFmE6rDq2a8uj+zi9s4hWPAfAK2
         FBbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O2pnzsjExgiU74Rp+J+FwN2xzCGKrR8arkSJatK/AQ4=;
        b=TrVwFRWr4EF/5ANnB7TES6dAqoYvEAtRbcaGncD9SiRpwsSNbkLGmmdtKIRemaHMV2
         /YP4Eb/8eR8/Wv7z5xO3d3nZisR/vuCZfWBSASq/i1qXHx7SVcmUiee1UPQ549IuflU3
         RT9jzz+QyZEdr78vAgfJ2JUx+B5Dw/QP0AV3lQNBD/RVXjtxN+s8+5tdlIrJ/s+194YH
         I0UZx6w1rwUbCgxuXh5W2b2AINcfr1obsTIefqgGjhDeU/c1WCN4GHBYna+jmvwcPbQj
         KaR2J59dTe2L9e6v2qNEgfcTmyN6vf6hakNaphfwSwgGKF3E0esBfVVEQkYqRpJdm7u1
         dAZw==
X-Gm-Message-State: APjAAAXFwJ+NoDNEsBD+8Nu5WkkyoAzl7p7So0drCqf/sSlltObiSGGJ
        IGOBBu7Nah1rT17Yu3/rXijvcEukbtZ153v+v2PD3A==
X-Google-Smtp-Source: APXvYqwq1Im6IYosLNiB+eaRP06VZe08QebvUL+0fbRuxPkX440EK5jc9e1qGqw0+ci0gEoYmzJHQQp+QEp9HuVEJMc=
X-Received: by 2002:a19:f243:: with SMTP id d3mr1477009lfk.168.1557388382722;
 Thu, 09 May 2019 00:53:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190416083852.126786-1-darekm@google.com> <dcb189af-f67f-ede3-b4fb-de1da7b53ccb@xs4all.nl>
In-Reply-To: <dcb189af-f67f-ede3-b4fb-de1da7b53ccb@xs4all.nl>
From:   Dariusz Marcinkiewicz <darekm@google.com>
Date:   Thu, 9 May 2019 09:52:50 +0200
Message-ID: <CALFZZQEoiikyXmHJyEgEJTRNryTN8ScNK4P3bDCp-9v9GtvU8g@mail.gmail.com>
Subject: Re: [RFC PATCH v2] media: cec: expose HDMI connector to CEC dev mapping
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, hans.verkuil@cisco.com,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans.

On Wed, Apr 24, 2019 at 2:09 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> Hi Dariusz,
>
> This is getting close, so I think for the next version you can drop
> the RFC tag.
>
> Some comments:
>
...
> > +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
> > @@ -261,7 +261,7 @@ static int dw_hdmi_cec_probe(struct platform_device *pdev)
> >       cec->adap = cec_allocate_adapter(&dw_hdmi_cec_ops, cec, "dw_hdmi",
> >                                        CEC_CAP_LOG_ADDRS | CEC_CAP_TRANSMIT |
> >                                        CEC_CAP_RC | CEC_CAP_PASSTHROUGH,
> > -                                      CEC_MAX_LOG_ADDRS);
> > +                                      CEC_MAX_LOG_ADDRS, NULL);
>
> Hmm, the connector information is actually available through cec->hdmi.
>
> I think it would make sense to create a helper function that fills in
> struct cec_connector_info based on a struct drm_connector pointer.
> And add a function to drivers/gpu/drm/bridge/synopsys/dw-hdmi.c that
> dw-hdmi-cec.c can call that does the same.

Looking at the code here, is the connector info guaranteed to be
available at the time cec_allocate_adapter is called here?
drm_connector won't be initialized until dw_hdmi_bridge_attach is
called, which happens after the cec platform device is created.
...
> >       priv->adap = cec_allocate_adapter(&tda9950_cec_ops, priv, "tda9950",
> >                                         CEC_CAP_DEFAULTS,
> > -                                       CEC_MAX_LOG_ADDRS);
> > +                                       CEC_MAX_LOG_ADDRS,
> > +                                       NULL);
>
> Here too the drm_connector can be found via struct tda9950_glue.
> So it is easy to provide proper connector information.

The same concern as with the comment before.
...
> > +/**
> > + * struct cec_event_connector - tells if and which connector is associated
> > + * with the CEC adapter.
> > + * @card_no: drm card number, -1 if no connector
>
> If there is no connector, then type is NO_CONNECTOR. So this
> doesn't make sense. Wouldn't it be better to just use '__u32 card_no'?
>
Yes, removed (leftover from previous revision where there was no
connector type field).
This and remaining comments are (hopefully) resolved in the new
version of the patch, I've just sent.

Will add more docs in subsequent revs.

Thank you!
