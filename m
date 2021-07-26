Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C30D63D5924
	for <lists+linux-media@lfdr.de>; Mon, 26 Jul 2021 14:04:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233805AbhGZLX4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Jul 2021 07:23:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233633AbhGZLXz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Jul 2021 07:23:55 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13932C061757;
        Mon, 26 Jul 2021 05:04:24 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id m2-20020a17090a71c2b0290175cf22899cso13913406pjs.2;
        Mon, 26 Jul 2021 05:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JVdZO5V6c4EAgsG39mx8zi3yZzxbgeyM1WPn5K59/Sc=;
        b=lkc4oYfhww8dfrAWVnDIlKhBq+RbRRGENn8qA8uze0wxH0Q1zjFvUWTjQa7ME2dtrw
         plC13G2RKfgFB0pNkjxzidOiNNjOnRQV5npgfRGF+kKIeOjxRl6hVzbyQY4HxhZ4KPyb
         JiKZ2hE6rdl8hI7GwEETCf74EN7zX4qhovP6Cyg+H8qZcYmHqF436IZuSQBV1CCBsyTO
         lmJGp7CyuMoaYLq1mbOWaK5IindaDMGUIz2oJJYm8dBx7JsyKrvBZ90Hoaf7frfEOIsX
         uhy74K8Nc6XFVvC/aS8guX+KPV35is5ACelgaubf71pgRo14Je+vtqlXdAJUaUu9oZal
         1jgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JVdZO5V6c4EAgsG39mx8zi3yZzxbgeyM1WPn5K59/Sc=;
        b=nqYinqVHaNhgaLlLVXZBgKbTAA2OIEaGtrlFWl3HTZ2Kl4PzXTeqz9ojvxFeDo4Hq4
         VFJuPJMQ4FmweCDFusdP/8YHRjaCCiZS4+qYE6l9zeyVFTr/FEZsk2f1ZfjrdfFvOulb
         2FHd2oW1C4qrlMhF2QRGq5rPk2fXftKEOIIEgYuLjMT79S6LR63g1WMabo1vYjZLQxPl
         INKGaNqMMBSayYJbqZtlZKzJFf0UQP0embNkmaDfgxUfEShLNt9FTXDKFtjLjqD4jtoL
         e72OHnw+wH0Kcto1JcOpNWtc92mdfC5qOUCEYpoGpY3knyTc0L70vhkkKSiFV3tuQVT0
         1e/g==
X-Gm-Message-State: AOAM530bDVg8qKCIVK6A6+AMFdOCzS86FCfoFiRszybzZKpWzD9yotuC
        p6h7/eMsl0Q2K7v1I8h8l1LkSwt47LXBE0y3gCE=
X-Google-Smtp-Source: ABdhPJxf+U3F8XsZWL2qh2FLZBf7csbGu+ksTIgXODuFpYyf2Re9m7gGYJIS+cMth0biNGXVfjui0CxT0WN5XS6eUI8=
X-Received: by 2002:aa7:800b:0:b029:330:455f:57a8 with SMTP id
 j11-20020aa7800b0000b0290330455f57a8mr17461184pfi.7.1627301063593; Mon, 26
 Jul 2021 05:04:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210726084055.54887-1-andriy.shevchenko@linux.intel.com>
 <20210726114433.GB3@paasikivi.fi.intel.com> <CAHp75VfodVoyDkO4iEGcHw0TWm2g-QbjwXqoCpCr_fj_BXT9jw@mail.gmail.com>
 <20210726120121.GD3@paasikivi.fi.intel.com>
In-Reply-To: <20210726120121.GD3@paasikivi.fi.intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 26 Jul 2021 15:03:43 +0300
Message-ID: <CAHp75VePdb2KTdhz3necAAOF6Q44zJ_MTO7F4mzKTx7b6bu-Vg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] media: ipu3-cio2: Drop reference on error path in cio2_bridge_connect_sensor()
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jens Axboe <axboe@kernel.dk>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jul 26, 2021 at 3:01 PM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
> On Mon, Jul 26, 2021 at 02:55:51PM +0300, Andy Shevchenko wrote:
> > On Mon, Jul 26, 2021 at 2:47 PM Sakari Ailus
> > <sakari.ailus@linux.intel.com> wrote:
> > > On Mon, Jul 26, 2021 at 11:40:55AM +0300, Andy Shevchenko wrote:
> >
> > ...
> >
> > > >  err_free_swnodes:
> > > >       software_node_unregister_nodes(sensor->swnodes);
> > > >  err_put_adev:
> > > > -     acpi_dev_put(sensor->adev);
> > > > +     acpi_dev_put(adev);
> > >
> > > adev is assigned to sensor->adev before goto so the two have the same
> > > value. I have no problem with the patch though.
> >
> > Are we reading the same version? Or am I missing something?
>
> I'm looking at the one in media-tree master.

Maintainers with a push access may FF merge the v5.14-rc3 as far as I
can tell and then you will see the difference.

-- 
With Best Regards,
Andy Shevchenko
