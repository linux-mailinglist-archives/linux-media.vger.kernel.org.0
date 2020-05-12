Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B245F1CF23B
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2020 12:21:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726891AbgELKVO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 May 2020 06:21:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728371AbgELKVK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 May 2020 06:21:10 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DA5DC061A0C
        for <linux-media@vger.kernel.org>; Tue, 12 May 2020 03:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description;
        bh=rSG+cUnRJhwuyMR9GLvjCfRqLNGKytvtdr+QTgP4tXo=; b=QY1DJLm3bue4Gza+2NFjAWF4IY
        Dq84pn2JxN5UJLb93cmXquftep8w1evbQ1FkoG2PqNXFgPaU/DrhYffpUjM6Qd5XcfW/ScMAHl4Cr
        HwaKepy7Ve4N5s7nAIiWe5f3JI/z6Npa92RROgzG59nATEFh9NHm4yj+WnKM074ir7t38RLKF2/8k
        ko4v/mv/dfZRGajFRyB+9PWDVNWwGDVlPEcOWeUGYDDxXywCC/Y+xysvEQchovGpvmIQHzyLv9rqA
        rCdIykhlvQpIxJLPKYuU2uIC9JA6VcUYU2Ju+rDcbbS9OePpGNaS1q/Fpk026kscF8YkIwYK9q82Y
        grBkButA==;
Received: from ip5f5ad5c5.dynamic.kabel-deutschland.de ([95.90.213.197] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jYS25-0003Ro-1L; Tue, 12 May 2020 10:21:05 +0000
Date:   Tue, 12 May 2020 12:20:56 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Patrik Gfeller <patrik.gfeller@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: atomisp kernel driver(s)
Message-ID: <20200512122056.6ae3580f@coco.lan>
In-Reply-To: <CAHp75VeeQ61nUCDr3Fr=mrhxKvVRZ6gWJet+QX+c7jXjTwEhtg@mail.gmail.com>
References: <f3348096-1fb3-5368-ba66-f42a300bde8e@gmail.com>
        <CAHp75Vf9M7=Gf=mCgdBgt0-aR+kBOjtE3pvJyEya2OGmqbr6XA@mail.gmail.com>
        <20200502190414.7ede79b6@coco.lan>
        <CAHp75VeeQ61nUCDr3Fr=mrhxKvVRZ6gWJet+QX+c7jXjTwEhtg@mail.gmail.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Sat, 2 May 2020 20:33:14 +0300
Andy Shevchenko <andy.shevchenko@gmail.com> escreveu:

> On Sat, May 2, 2020 at 8:04 PM Mauro Carvalho Chehab <mchehab@kernel.org> wrote:
> > Em Sat, 2 May 2020 19:08:36 +0300
> > Andy Shevchenko <andy.shevchenko@gmail.com> escreveu:

> > Yeah, the current issue sounds simple to solve, but I need to understand
> > how an ACPI-based device would be calling regulator_register(). Using
> > regulators with ACPI is new to me. I suspect that this should be done
> > by ./arch/x86/platform/intel-mid, with of course doesn't have the needed
> > bits for this board. Also, there is a dummy regulator driver for atomisp
> > based boards (drivers/platform/x86/intel_atomisp2_pm.c). This one could
> > be causing some issues too.
> >
> > The atomisp driver uses regulator_get() to turn on the sensors.  
> 
> It should use PMIC to get them.

It took a while to make it right, but at least for PMIC TI, this is now
working with this patch:

	https://git.linuxtv.org/mchehab/experimental.git/commit/?h=atomisp_v2.1&id=6c026db444d097d6df99597e07eb3575242e680e

It turns that I needed to pick some missing bits from Yocto's tree,
as the driver at staging was missing the parts for non-regulator PMICs.

I suspect that the original idea there were to use the regulator
framework for all power management (with IMHO, makes a lot of sense).

I also had to enable the PMIC ACPI OpRegion with:

	CONFIG_CHT_DC_TI_PMIC_OPREGION=y

And fix the PMIC region for PMIC TI.

I didn't test the other types of PMIC supported by the driver.
So, maybe some additional adjustments might be needed for
other types.

Thanks,
Mauro
