Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 506753D58E7
	for <lists+linux-media@lfdr.de>; Mon, 26 Jul 2021 13:56:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233699AbhGZLQD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Jul 2021 07:16:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233522AbhGZLQC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Jul 2021 07:16:02 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E48D6C061757;
        Mon, 26 Jul 2021 04:56:31 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id ds11-20020a17090b08cbb0290172f971883bso19384861pjb.1;
        Mon, 26 Jul 2021 04:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PbbzWcpYBTWD8pafcbVi2cFejyUPRq39M5M0EHS4Dg0=;
        b=cozcUjL+HRNvWvvKneNaNsodJGc+rKZ1MOYHrvMmbYIQWXViGaWp+1t5Ri0cO/ZdPU
         K9NOq15Riz8LelL1SJAhHIxfPLMc78Lktr+ySPnxlYoT3Kko0yVotG9XOUDmtMaxWxIE
         4ssIwgfUiXIxbB5IVLVP872Vj6BhF/KMYU2lARMP/AnrQp9f84r+MSKVIp3czHDcklkn
         0clZRJ9vDopeaBTVQ/RvKreXBG3RhPREWC/ziRCmq60e2dbh0x8pqDIxAZ6AjZmenTue
         NsFE3BUQjqpS/SCtFL76FjugYx77I9d0GsB7yEkSqb2gi6ZSgQUlNTtXfMK+zAW3sBut
         +C7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PbbzWcpYBTWD8pafcbVi2cFejyUPRq39M5M0EHS4Dg0=;
        b=H8y+M4U8KW+6ERAzam/Om2Hmcm/iZlIi7lLtRTvpsNoc9OHpxals1luR6ywRcKNJ7T
         6Eq7kUGLZtS2hAxXdTd+l3MQE0Iuoct1+QL6ESsXFefKDuzRtbcsisM47VMyMyQ+ExWh
         O9ijQAxh4uRmdKm4V7TwVEiBW6bkFnL7bwdD8dF/lrnf3z9Tdu0Q4vOIsgRS5BBihIQ1
         NXBvwT1OLDxsJ775EKxs2Of5Chz17ddKiYfwhSacLmtOs51OX0VaTLbaNW1lV5+qcJJO
         FzmtHydLSdqQGVRX6/LkuLr+by3KM+qUqH6swSgUZH0duDZqqI/PfJUfmgNjETnixY5K
         ZAug==
X-Gm-Message-State: AOAM530LfzmSGCMxMQjMulmgNZh6PCZ/mElzWMwm1NNp8T8ImGzug5H+
        uj86lXdqWjBg8Ma3UrW/85A3LUCV/OK7HhFgwgwy4S5dk0CFfQ==
X-Google-Smtp-Source: ABdhPJw4TJKwNk8SI64zhDuFBsYLBnmzKV6aVlLiGhlT9JP4HVxLFa4prGRaHHhdYPU7Aqf86bJI1kXaDFu+NBqX1ZQ=
X-Received: by 2002:a17:90a:af90:: with SMTP id w16mr26551844pjq.129.1627300591476;
 Mon, 26 Jul 2021 04:56:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210726084055.54887-1-andriy.shevchenko@linux.intel.com> <20210726114433.GB3@paasikivi.fi.intel.com>
In-Reply-To: <20210726114433.GB3@paasikivi.fi.intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 26 Jul 2021 14:55:51 +0300
Message-ID: <CAHp75VfodVoyDkO4iEGcHw0TWm2g-QbjwXqoCpCr_fj_BXT9jw@mail.gmail.com>
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

On Mon, Jul 26, 2021 at 2:47 PM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
> On Mon, Jul 26, 2021 at 11:40:55AM +0300, Andy Shevchenko wrote:

...

> >  err_free_swnodes:
> >       software_node_unregister_nodes(sensor->swnodes);
> >  err_put_adev:
> > -     acpi_dev_put(sensor->adev);
> > +     acpi_dev_put(adev);
>
> adev is assigned to sensor->adev before goto so the two have the same
> value. I have no problem with the patch though.

Are we reading the same version? Or am I missing something?

-- 
With Best Regards,
Andy Shevchenko
