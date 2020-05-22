Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82D301DE396
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2020 11:57:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728356AbgEVJ5n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 May 2020 05:57:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:51984 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728212AbgEVJ5m (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 May 2020 05:57:42 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4276320757;
        Fri, 22 May 2020 09:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590141462;
        bh=KEVEAMKui9dM46qWPS1eCS3vSufvNFJQBVZBx7XBZWU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=unuPe1AVm/sh5kCyf0Utk4Ztg8DISyKoqpwxCjbPWpho4RvaFHWyyNmyTXYV11dh3
         IOO6YCgKItBcYpne8i8GsbikIyWG3pgY2AgJQ+VmC9J8QhLRsZxi0InB+zHCLONkMW
         B+UTRHZlhspJvSXsnkwHBnutIefy8HtK0gZV5kE4=
Date:   Fri, 22 May 2020 11:57:36 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "Krogerus, Heikki" <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>
Subject: Re: [PATCH] media: ipu3: add a module to probe sensors via ACPI
Message-ID: <20200522115736.10cca8eb@coco.lan>
In-Reply-To: <CAHp75VduEGyzobm0hkXzWmFfZb-uMAEWG-wc89b7M7zVzZ_4LA@mail.gmail.com>
References: <12fbe3f5c6a16c5f3447adbc09fe27ceb2b16823.1589625807.git.mchehab+huawei@kernel.org>
        <20200517103659.GS17578@paasikivi.fi.intel.com>
        <20200520094400.5137e7f2@coco.lan>
        <20200520082608.GV20066@paasikivi.fi.intel.com>
        <20200520131830.3ff45919@coco.lan>
        <CAHp75VduEGyzobm0hkXzWmFfZb-uMAEWG-wc89b7M7zVzZ_4LA@mail.gmail.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 21 May 2020 11:00:19 +0300
Andy Shevchenko <andy.shevchenko@gmail.com> escreveu:

> +Cc: Heikki (swnode expert)
> 
> On Wed, May 20, 2020 at 2:19 PM Mauro Carvalho Chehab
> <mchehab+huawei@kernel.org> wrote:
> > Em Wed, 20 May 2020 11:26:08 +0300
> > Sakari Ailus <sakari.ailus@linux.intel.com> escreveu:  
> 
> ...
> 
> > As I said, the problem is not probing the sensor via ACPI, but, instead,
> > to be able receive platform-specific data.  
> 
> There is no problem with swnodes, except missing parts (*).
> I have Skylake laptop with IPU3 and with half-baked ACPI tables, but
> since we have drivers in place with fwnode support, we only need to
> recreate fwnode graph in some board file to compensate the gap in
> ACPI.
> 
> *) Missing part is graph support for swnodes. With that done it will
> be feasible to achieve the rest.
> I forgot if we have anything for this already done. Heikki?

Hmm... I guess I should try this approach. I never heard about swnodes
before. Do you have already some patch with the needed swnodes setup,
and the missing parts to recreate the fwnode graph?

Thanks,
Mauro
