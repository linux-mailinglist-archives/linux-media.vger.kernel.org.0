Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE6861CF322
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2020 13:12:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727859AbgELLM3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 May 2020 07:12:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726891AbgELLM3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 May 2020 07:12:29 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C3F8C061A0C
        for <linux-media@vger.kernel.org>; Tue, 12 May 2020 04:12:29 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id l73so417217pjb.1
        for <linux-media@vger.kernel.org>; Tue, 12 May 2020 04:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UV6qWfi+CnGfnhv+b/120syaGM/R/MQMc6hlsr7kEvE=;
        b=Qjums1cesRHqgmH+UANyzPwo+0mgHwddUVaJqPueor97CABoV+D6zGOD7UaURrscyz
         ZRYui4jNF2Z8TiCbKeqSVVecmmdkGvugwP0BQSwVSQxENJPGk3W5GV9RCLWNYlLeWtbR
         ze7pbMjogsn07ekedJvDFvC0wjzuFQZv6yXBW7LX+jq1IXkxM1E2AlmaIJvClQ0vzEDJ
         DaSUzYbCbEQizs/FlueBnznfuOr71cvT2aQS7bAG+j6IF9paXJXybWujIpz+nYCpY3LB
         0FgnLnFEubCKwvhpJ7gc2pFKgYBGLfgZCNI/jQ5zxO4rQ479jAnXGxHGXJsVxUQ2CJzI
         JdRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UV6qWfi+CnGfnhv+b/120syaGM/R/MQMc6hlsr7kEvE=;
        b=eZpHqDLLSeVBSGFbTMMKmZXdNjenANU92KvwQNdwC6YIs2P5T4AsvW8NPLK3bwEnfm
         XGXv3eBmc4FxuM71BUvCntuVZ6PBxwrSGWHvXEp0iH0RHEh45Lo09IAeqPxIUorNTEQW
         fEPvfniTuELAQ3ZZ+RMDLnzJ65Sd6V8K13hoQl37B3HNC/j1Byj1O6N/anO4HRn+S+QB
         SMqJRXHkFHZvq4aCBFlNeh/91NcmJu4QRGAaiHVgGO6AJ2y60HrsrxUzUAZn8/dXXxTY
         DKxuAurCBcE2DSTvbDiw6SjmhBu/6OqUr7b0HundWGoERiyLTY0MaUyUsWq/y4759bxZ
         R5sQ==
X-Gm-Message-State: AGi0Pub38g1EcH3k+AIac5RIOtNlbmuFugr+rq2zsOD6t8hDS6AMzlIr
        Lzzdz2dds9x+pKZQZOErNGS6Ov1yc3ZJZNqI8lg=
X-Google-Smtp-Source: APiQypLdMaLApF1jZC4guiJ+xc/kq+cCDuRknERRjxkYvNdVtx18ZqR9tTAvnGiIxDxacWkhSCqrClpMptn4Ctm+n40=
X-Received: by 2002:a17:90b:94a:: with SMTP id dw10mr28592405pjb.228.1589281948582;
 Tue, 12 May 2020 04:12:28 -0700 (PDT)
MIME-Version: 1.0
References: <f3348096-1fb3-5368-ba66-f42a300bde8e@gmail.com>
 <CAHp75Vf9M7=Gf=mCgdBgt0-aR+kBOjtE3pvJyEya2OGmqbr6XA@mail.gmail.com>
 <20200502190414.7ede79b6@coco.lan> <CAHp75VeeQ61nUCDr3Fr=mrhxKvVRZ6gWJet+QX+c7jXjTwEhtg@mail.gmail.com>
 <20200512122056.6ae3580f@coco.lan>
In-Reply-To: <20200512122056.6ae3580f@coco.lan>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 12 May 2020 14:12:21 +0300
Message-ID: <CAHp75VdjdZCFq=uk0M9QG0tNf+wfD6iFzZvmzBWTWNVpgUpfxQ@mail.gmail.com>
Subject: Re: atomisp kernel driver(s)
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Patrik Gfeller <patrik.gfeller@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, May 12, 2020 at 1:21 PM Mauro Carvalho Chehab
<mchehab@kernel.org> wrote:
>
> Em Sat, 2 May 2020 20:33:14 +0300
> Andy Shevchenko <andy.shevchenko@gmail.com> escreveu:
>
> > On Sat, May 2, 2020 at 8:04 PM Mauro Carvalho Chehab <mchehab@kernel.org> wrote:
> > > Em Sat, 2 May 2020 19:08:36 +0300
> > > Andy Shevchenko <andy.shevchenko@gmail.com> escreveu:
>
> > > Yeah, the current issue sounds simple to solve, but I need to understand
> > > how an ACPI-based device would be calling regulator_register(). Using
> > > regulators with ACPI is new to me. I suspect that this should be done
> > > by ./arch/x86/platform/intel-mid, with of course doesn't have the needed
> > > bits for this board. Also, there is a dummy regulator driver for atomisp
> > > based boards (drivers/platform/x86/intel_atomisp2_pm.c). This one could
> > > be causing some issues too.
> > >
> > > The atomisp driver uses regulator_get() to turn on the sensors.
> >
> > It should use PMIC to get them.
>
> It took a while to make it right, but at least for PMIC TI, this is now
> working with this patch:
>
>         https://git.linuxtv.org/mchehab/experimental.git/commit/?h=atomisp_v2.1&id=6c026db444d097d6df99597e07eb3575242e680e
>
> It turns that I needed to pick some missing bits from Yocto's tree,
> as the driver at staging was missing the parts for non-regulator PMICs.
>
> I suspect that the original idea there were to use the regulator
> framework for all power management (with IMHO, makes a lot of sense).
>
> I also had to enable the PMIC ACPI OpRegion with:
>
>         CONFIG_CHT_DC_TI_PMIC_OPREGION=y
>
> And fix the PMIC region for PMIC TI.
>
> I didn't test the other types of PMIC supported by the driver.
> So, maybe some additional adjustments might be needed for
> other types.

Thanks! It makes sense.

Btw, https://git.linuxtv.org/mchehab/experimental.git/commit/?h=atomisp_v2.1&id=65608aa8d34ea274600ab2cf6f0cf54ee86d8fd1
is incorrect approach. Look closer what PCI does in case when
pcim_enable_device() has been called.


-- 
With Best Regards,
Andy Shevchenko
