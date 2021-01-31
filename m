Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83892309D49
	for <lists+linux-media@lfdr.de>; Sun, 31 Jan 2021 16:13:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232445AbhAaPIM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 31 Jan 2021 10:08:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231180AbhAaPFt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 31 Jan 2021 10:05:49 -0500
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7247C061573;
        Sun, 31 Jan 2021 07:04:58 -0800 (PST)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id AA422C6357; Sun, 31 Jan 2021 15:04:56 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1612105496; bh=d4JxLPLb7QEMGGaZmAC9Qj9a1O3NSuHHwtJaFZNe/S0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VEUOuZBt7t8frDe9KRUOxvqiiVfpmthfoiNRjx7wXSH2XcPSAcBAF03asiw5kA5RD
         1/iOYrkSnl2f7oLwno7zoaKbKpHcL2xGvI25B2CXeeacf/pUHwzi00WVMrVmhKLwMu
         yJ5eBo7Bfs5Ci8+uBgg7163/c1X29vfMviyiO5eI3UW4z7W4SbkY9igvTSqv4kOFVq
         ahi/x90PvpONcdiHNyAg2NOFzPSk1RL+DZ6z3yYLEmnOYn0LPjTuSsQ3BpHjyBM9DN
         FkpcQ3uX2HNf9iSVvMiDbixIfMzeqQSN0nNILP6FMpRU6uyYxVbsNkIpBgJ4kwWfTA
         GFPnLnO9vg5rQ==
Date:   Sun, 31 Jan 2021 15:04:56 +0000
From:   Sean Young <sean@mess.org>
To:     Robert Foss <robert.foss@linaro.org>
Cc:     Takashi Iwai <tiwai@suse.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Stefan Seyfried <seife+kernel@b1-systems.com>
Subject: Re: [PATCH 2/2] media: dvb-usb: Fix use-after-free access
Message-ID: <20210131150456.GB4886@gofer.mess.org>
References: <20210120102057.21143-1-tiwai@suse.de>
 <20210120102057.21143-3-tiwai@suse.de>
 <CAG3jFyuTJ5sj_YYYfFO0LAFN-RM4QdmLV7w4ng9pb9eJkO4FiQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAG3jFyuTJ5sj_YYYfFO0LAFN-RM4QdmLV7w4ng9pb9eJkO4FiQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Takashi,

On Fri, Jan 22, 2021 at 04:47:44PM +0100, Robert Foss wrote:
> Hey Takashi,
> 
> This patch is generating a checkpatch warning, but I think it is
> spurious and can be ignored.

The checkpatch warning isn't superious and should really be corrected.

> 
> Other than that, this looks good to me.
> Reviewed-by: Robert Foss <robert.foss@linaro.org>
> 
> On Wed, 20 Jan 2021 at 12:51, Takashi Iwai <tiwai@suse.de> wrote:
> >
> > dvb_usb_device_init() copies the properties to the own data, so that
> > the callers can release the original properties later (as done in the
> > commit 299c7007e936 "media: dw2102: Fix memleak on sequence of
> > probes").  However, it also stores dev->desc pointer that is a
> > reference to the original properties data.  Since dev->desc is
> > referred later, it may result in use-after-free, in the worst case,
> > leading to a kernel Oops as reported.
> >
> > This patch addresses the problem by allocating and copying the
> > properties at first, then get the desc from the copied properties.
> >
> > Reported-and-tested-by: Stefan Seyfried <seife+kernel@b1-systems.com>
> > BugLink: http://bugzilla.opensuse.org/show_bug.cgi?id=1181104
> > Cc: <stable@vger.kernel.org>
> > Signed-off-by: Takashi Iwai <tiwai@suse.de>

Thank you for your patch. Unfortunately, it depends on the first patch
in the series, which I think has problems (see email about this).

Thanks

Sean


> > ---
> >  drivers/media/usb/dvb-usb/dvb-usb-init.c | 23 +++++++++++++----------
> >  1 file changed, 13 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/media/usb/dvb-usb/dvb-usb-init.c b/drivers/media/usb/dvb-usb/dvb-usb-init.c
> > index 5befec87f26a..07ff9b4d2f34 100644
> > --- a/drivers/media/usb/dvb-usb/dvb-usb-init.c
> > +++ b/drivers/media/usb/dvb-usb/dvb-usb-init.c
> > @@ -255,27 +255,30 @@ int dvb_usb_device_init(struct usb_interface *intf,
> >         if (du != NULL)
> >                 *du = NULL;
> >
> > -       if ((desc = dvb_usb_find_device(udev, props, &cold)) == NULL) {
> > +       d = kzalloc(sizeof(struct dvb_usb_device), GFP_KERNEL);
> > +       if (!d) {
> > +               err("no memory for 'struct dvb_usb_device'");
> > +               return -ENOMEM;
> > +       }
> > +
> > +       memcpy(&d->props, props, sizeof(struct dvb_usb_device_properties));
> > +
> > +       desc = dvb_usb_find_device(udev, &d->props, &cold);
> > +       if (!desc) {
> >                 deb_err("something went very wrong, device was not found in current device list - let's see what comes next.\n");
> > -               return -ENODEV;
> > +               ret = -ENODEV;
> > +               goto error;
> >         }
> >
> >         if (cold) {
> >                 info("found a '%s' in cold state, will try to load a firmware", desc->name);
> >                 ret = dvb_usb_download_firmware(udev, props);
> >                 if (!props->no_reconnect || ret != 0)
> > -                       return ret;
> > +                       goto error;
> >         }
> >
> >         info("found a '%s' in warm state.", desc->name);
> > -       d = kzalloc(sizeof(struct dvb_usb_device), GFP_KERNEL);
> > -       if (d == NULL) {
> > -               err("no memory for 'struct dvb_usb_device'");
> > -               return -ENOMEM;
> > -       }
> > -
> >         d->udev = udev;
> > -       memcpy(&d->props, props, sizeof(struct dvb_usb_device_properties));
> >         d->desc = desc;
> >         d->owner = owner;
> >
> > --
> > 2.26.2
> >
