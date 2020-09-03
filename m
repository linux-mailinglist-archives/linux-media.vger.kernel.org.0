Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B35BB25BE0F
	for <lists+linux-media@lfdr.de>; Thu,  3 Sep 2020 11:05:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728089AbgICJFO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Sep 2020 05:05:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:55294 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726448AbgICJFO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Sep 2020 05:05:14 -0400
Received: from coco.lan (ip5f5ad5c3.dynamic.kabel-deutschland.de [95.90.213.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5A9A420709;
        Thu,  3 Sep 2020 09:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599123913;
        bh=5msA1CmDUNZg69tLz8pFJJct70UtAz65Z8gc9Hz522Q=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=vARd3doWYponZSo39/iKi+4VNVuDBqVDqZHKfZxm5KnfH9q2yzQouuWtjDwBwv3Mo
         5R6Uf76TdoB+PDWYTLMsEShH6G2r5QTgBUIE7ozJoZfJjQl16Uz4gsg/MTWv8fsdfa
         2N6X43s9q5DFrh91F3VVW/0Nmlw0ADX1eTcVu9Ao=
Date:   Thu, 3 Sep 2020 11:05:09 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Colin King <colin.king@canonical.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
        kernel-janitors@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH][next] staging: media: atomisp: fix memory leak of
 object flash
Message-ID: <20200903110509.4542cdad@coco.lan>
In-Reply-To: <CAHp75Vda5jRqmgsCV=Z5e5NdwHiebBy_Xdb6dq2D7L-mqqsC_g@mail.gmail.com>
References: <20200902165852.201155-1-colin.king@canonical.com>
        <CAHp75Vda5jRqmgsCV=Z5e5NdwHiebBy_Xdb6dq2D7L-mqqsC_g@mail.gmail.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 2 Sep 2020 21:15:31 +0300
Andy Shevchenko <andy.shevchenko@gmail.com> escreveu:

> On Wed, Sep 2, 2020 at 8:02 PM Colin King <colin.king@canonical.com> wrote:
> >
> > From: Colin Ian King <colin.king@canonical.com>
> >
> > In the case where the call to lm3554_platform_data_func returns an
> > error there is a memory leak on the error return path of object
> > flash.  Fix this by adding an error return path that will free
> > flash and rename labels fail2 to fail3 and fail1 to fail2.
> >  
> 
> Wouldn't be proper fix to move to devm_kmalloc() and return
> dev_err_probe() where appropriate?

Actually, we prefer not using devm_*() at media subsystem.

Once we started migrating alloc stuff to use it. We end needing
to revert those, as it caused side effects related to lifecycle
management: some object were de-allocating too late. Others
with multiple interfaces (USB, pci) had even worse troubles.

Thanks,
Mauro
