Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 763D9433F97
	for <lists+linux-media@lfdr.de>; Tue, 19 Oct 2021 22:07:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229790AbhJSUKD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Oct 2021 16:10:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231355AbhJSUKC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Oct 2021 16:10:02 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E80C0C061746
        for <linux-media@vger.kernel.org>; Tue, 19 Oct 2021 13:07:48 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id ls18so797830pjb.3
        for <linux-media@vger.kernel.org>; Tue, 19 Oct 2021 13:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rOSzyR3LcvMIFKU8t+GpRPCcHAAqmZ/MrQMb9/YXogw=;
        b=ICY6t/uCBa0EpJyDVDmyDs23+2gZUPhABenARclNqBixgJsQ71cxy35jlZJwk88Ij7
         Ta9vm/qZCVF8NUoE0bCitfSF24RizWI5P9WSpQ06AlFVe2ixW+cDOmx/KNQ2ftl8c4lp
         VWDTW2rcaSu/0zwfVCdml0O/VH+pImfriAkJxORHscEOL90pjnGlyYEDfRNs/Kmpo6fA
         78KxW5fFxHJwsBvK5eWujQEuBTmBjRRAt6hh0U4ESDAMMdOIADmroq0hea9wwSngW25d
         UXtzYx36Kptp4wsOHvZ0jSnwiQyeqmgn+6DJIgtiUNdfFImeGgIJgiara+0y9Mk/QnYW
         nAIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rOSzyR3LcvMIFKU8t+GpRPCcHAAqmZ/MrQMb9/YXogw=;
        b=PcItBgXwRA4zMis/6FwEo6eAo4u8xohHtK5wNjsCYswivPz7bWHXYYyoWISDGHP4ux
         OoEovnqJvc9Jzgk/2dx4mym8gvTQd62OXdi7xV842SVuvJLsieBCQ56+CYS5NpBaFG4H
         8+7HSRkeN678vSP0/4TXFLUp5HjQlO6rKyEdaFCBFtntn1rW9SfstyYWcRMOsKuwrjwN
         jtIMiB4cDn01ywmNY5D5dd4fAddXKhUNo7kw1NrF86dhOzfXHiR3eNZ8rnr0YQipnuXN
         pH2kNfbHxrnMBeJbXOJSvL2lTGOo2NJATBu9P5ZbA0vSadZaRkpQ/aKIty81Ooc+XFpR
         8IGg==
X-Gm-Message-State: AOAM530+xHqlMDzn+BLj3ONPzVWGD2uiI/P9HBuDrIZuGAfny6JjxkVc
        p1N3sNzmjHpYnLdSohpUzpspUpwskaE6a4iyislO0Q==
X-Google-Smtp-Source: ABdhPJyiCEKjH6cdIBibD/8bH6YHnPk+p16k0u+xKnXrTFkbLvKu9vF1dyQ4LjSkROJgCEukfehxYwYFzP6YyHGAUso=
X-Received: by 2002:a17:90b:4a8b:: with SMTP id lp11mr1144484pjb.46.1634674068031;
 Tue, 19 Oct 2021 13:07:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210210230800.30291-2-sakari.ailus@linux.intel.com>
 <20211007022527.2448652-1-rajatja@google.com> <YW3XwDxwBsJdFslA@paasikivi.fi.intel.com>
In-Reply-To: <YW3XwDxwBsJdFslA@paasikivi.fi.intel.com>
From:   Rajat Jain <rajatja@google.com>
Date:   Tue, 19 Oct 2021 13:07:11 -0700
Message-ID: <CACK8Z6FfhQ80=aGADb+VAfotr=cnZyeen1NEvc-Lfk4AE4xAbA@mail.gmail.com>
Subject: Re: ACPI: scan: Obtain device's desired enumeration power state
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Robert Moore <robert.moore@intel.com>,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-media@vger.kernel.org,
        devel@acpica.org, rajatxjain@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Sakari,

Thanks for the updated patchset.

On Mon, Oct 18, 2021 at 1:23 PM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Rajit,
>
> On Wed, Oct 06, 2021 at 07:25:27PM -0700, Rajat Jain wrote:
> >
> > Hello,
> >
> > Now that we have landed the ACPI object for _DSC in the spec:
> > https://lore.kernel.org/linux-acpi/CAJZ5v0gwDEjC9T7wfCqDr7R0q_ptz2nVU52_8i8noXHPEign1g@mail.gmail.com/T/
> >
> > I was wondering what is happening with the corresponding kernel patchset:
> > https://lore.kernel.org/linux-acpi/20210210230800.30291-1-sakari.ailus@linux.intel.com/T/#m24e9f51119cbe6eb39f31c097ea3941d00a0baeb
> >
> > I didn't see any pending comments, so is there a reason it did not land?
>
> Thanks for the ping.
>
> I've rebased the set and switched to _DSC so I believe it is ready to be
> merged now:
>
>         <URL:https://lore.kernel.org/linux-media/20211018121729.6357-1-sakari.ailus@linux.intel.com/T/#t>

I have 1 question. I see that these patches change the EEPROM and the
camera driver's probe routine to work around a device that is not
powered on (in D0 state). I2C core is also not powering it on now if
the ACPI says so. So how / when is the device actually getting powered
on now (being put in D0 state), after these patches?

Thanks,

Rajat

>
> I dropped the ov5670 patch from the set to avoid a conflict, I'll get this
> merged through the media tree when the rest have landed there.
>
> --
> Regards,
>
> Sakari Ailus
