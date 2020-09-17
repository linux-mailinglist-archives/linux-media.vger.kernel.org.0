Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6315426DEA3
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 16:46:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727356AbgIQOqS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Sep 2020 10:46:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727476AbgIQOW7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Sep 2020 10:22:59 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CD29C061224;
        Thu, 17 Sep 2020 07:14:19 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id w7so1296654pfi.4;
        Thu, 17 Sep 2020 07:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4unBKDTxzRQRPQZlJUn6A2Soath9XJxD61TMB7PnRfc=;
        b=GFS3galhGl4pGXPAIFLaGVY3InSJNn9hCDP3n2QvcYIax+EGhdNUkMF7zkwhdzReoH
         cb3O56eEVi8dIF+YPK/zBXhJ9V5DtYg2RgBY1deepye5Gm2NNXsYfFh92WhGB/acfIXW
         UD8asOTuv+0Ndipo5Uy3hghSHxuqylYjw8tyAsP5vQdWlUBM28Dk3hFpOdGfDNxBAzJO
         7/JmyDR7aKS2qouff8Lo1aq64RHqhmyHFoohyWZVCFGxSr1dMNAKhlnmfnHHLRxcetyH
         ww3vWCzYf5ZgObokCoVQGFdalgDY6f64rE0Vsy9+UUgrLXUCnd3/f0rG8tP+vbDIhfKx
         vRUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4unBKDTxzRQRPQZlJUn6A2Soath9XJxD61TMB7PnRfc=;
        b=FIf4zn4J3oTrpek6sV6oOGKC5Th7sBQX588iVxSZjwXLasu1UXF4Bc0d+YjLsIj8T1
         msKxzj63WoDbqSjedRwQcvUEaVpCxdWIkhHdJJAGUXtnrcXQRxKaIbtOLssd5UqZUGg5
         gtQPHGsrZ5erBBRRd4lbc54PEeNA6EnkaKvuDblse+2Fu/5KDqYKBJ6VoX0W+A3tQy6t
         /KuaX9Kmv/Dsq7z4f4WdWc/8DZAyq0LOKqG691qqBVIUgYAB6T9kVgHwzItD9K2Z0Cct
         8bejZ+YTpiTLzoc9MNcV1cfgqqir2KFnowCrjq03M4QAbRXVtJQAWp0SzSVUx2eBH9D9
         Z3nQ==
X-Gm-Message-State: AOAM5325ba0L9DhsbA5LOPYykpYxybeR1j9Y83KDFpEen0Pw4x0FSoCa
        wEO1l/UAx5d1WeShiatzJ51rs7IRMV25+L0jTpc=
X-Google-Smtp-Source: ABdhPJy5qeqotttBdV66/aTb7EtTkcWg7OUAGeLKW75rGS3vVMXitZ6o4V8b0Zq8/QxW2yHX8Om9DwlIoFrEfBI51K4=
X-Received: by 2002:a63:ec4c:: with SMTP id r12mr22049725pgj.74.1600352058607;
 Thu, 17 Sep 2020 07:14:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200916213618.8003-1-djrscally@gmail.com> <20200917103343.GW26842@paasikivi.fi.intel.com>
 <8133a57d-ab4c-dccd-4325-9b10e7805648@gmail.com> <20200917124514.GK3956970@smile.fi.intel.com>
 <fea9d85a-7be9-0270-bd59-8e479a836ae6@gmail.com>
In-Reply-To: <fea9d85a-7be9-0270-bd59-8e479a836ae6@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 17 Sep 2020 17:14:00 +0300
Message-ID: <CAHp75VcWZMThc6BPNiqvvEUVUbShV-7+Xn11E6J7UwMLfnszpg@mail.gmail.com>
Subject: Re: [RFC PATCH] Add bridge driver to connect sensors to CIO2 device
 via software nodes on ACPI platforms
To:     Dan Scally <djrscally@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
        jorhand@linux.microsoft.com, Tsuchiya Yuto <kitakar@gmail.com>,
        kieran.bingham@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 17, 2020 at 4:53 PM Dan Scally <djrscally@gmail.com> wrote:
>
> Hi Andy, thanks for input (as always)

You're welcome! I'm really impressed by your activity in this area.

> On 17/09/2020 13:45, Andy Shevchenko wrote:
> > On Thu, Sep 17, 2020 at 11:52:28AM +0100, Dan Scally wrote:
> >> On 17/09/2020 11:33, Sakari Ailus wrote:

To the point of placement, I think this should go under
drivers/platform/x86 (Adding Hans and Mark, who can express their
opinions).

...

> > Ah, I think you misinterpreted the meaning of above. The above is a switch how
> > camera device appears either as PCI or an ACPI. So, it effectively means you
> > should *not* have any relation for this HID until you find a platform where the
> > device is for real enumerated via ACPI.
> >
> Ah, ok. So that was never going to work. Thanks. That does raise another
> question; we have had some testers report failure, which turns out to be
> because on their platforms the definition of their cameras in ACPI is
> never translated into an i2c_client so the cio2-bridge doesn't bind.
> Those have a similar conditional in the _STA method, see CAM1 in this
> DSDT for example:
> https://raw.githubusercontent.com/linux-surface/acpidumps/master/surface_go/dsdt.dsl.
> Is there anything we can do to enable those cameras to be discovered too?

It means that this

...

> >>>> +#define PROPERTY_ENTRY_NULL                       \
> >>>> +((const struct property_entry) { })
> >>> Alignment. Same appears to apply to other macros (please indent).
> >> Yep
> >>>> +#define SOFTWARE_NODE_NULL                        \
> >>>> +((const struct software_node) { })
> > Why?!
> >
> It felt ugly to have the other definitions be macros and not this one,
> but I can change it.

My point is that those macros are simply redundant. The point is to
have a terminator record (all 0:s in the last entry of an array) which
is usually being achieved by allocating memory with kcalloc() which
does implicitly this for you.

-- 
With Best Regards,
Andy Shevchenko
