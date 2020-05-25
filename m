Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B6E51E084E
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2020 09:59:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728477AbgEYH7X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 May 2020 03:59:23 -0400
Received: from mga18.intel.com ([134.134.136.126]:13128 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725809AbgEYH7X (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 May 2020 03:59:23 -0400
IronPort-SDR: /Mn2wvImWOP+FhV7cG4IdRSEVTPFtBf0dQ82/Gnu1blFmRUYGcRU6SjS24H7wZfRNXTFkpZZs8
 m7yvWGOhXqmw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2020 00:59:22 -0700
IronPort-SDR: JCflhIxsquaU9jhCHP8S8Po3dtELmDzOwNyYpv6d/pEWqukzelsjKP1kXl6JsOwTICJ595Zn0q
 sqklKAb4vz8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,432,1583222400"; 
   d="scan'208";a="375366423"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 25 May 2020 00:59:19 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 25 May 2020 10:59:18 +0300
Date:   Mon, 25 May 2020 10:59:18 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>
Subject: Re: [PATCH] media: ipu3: add a module to probe sensors via ACPI
Message-ID: <20200525075918.GE1910854@kuha.fi.intel.com>
References: <12fbe3f5c6a16c5f3447adbc09fe27ceb2b16823.1589625807.git.mchehab+huawei@kernel.org>
 <20200517103659.GS17578@paasikivi.fi.intel.com>
 <20200520094400.5137e7f2@coco.lan>
 <20200520082608.GV20066@paasikivi.fi.intel.com>
 <20200520131830.3ff45919@coco.lan>
 <CAHp75VduEGyzobm0hkXzWmFfZb-uMAEWG-wc89b7M7zVzZ_4LA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VduEGyzobm0hkXzWmFfZb-uMAEWG-wc89b7M7zVzZ_4LA@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, May 21, 2020 at 11:00:19AM +0300, Andy Shevchenko wrote:
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

I did implement the fwnode_graph* callbacks for swnodes, but I need to
rebase that patch on top of Dmitry's reference property changes.

thanks,

-- 
heikki
