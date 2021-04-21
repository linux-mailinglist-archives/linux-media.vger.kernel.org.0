Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 246CB366EBA
	for <lists+linux-media@lfdr.de>; Wed, 21 Apr 2021 17:05:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243799AbhDUPGT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Apr 2021 11:06:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243784AbhDUPGT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Apr 2021 11:06:19 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E07CBC06174A;
        Wed, 21 Apr 2021 08:05:45 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id o16so8199034plg.5;
        Wed, 21 Apr 2021 08:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=r/6P/78czMGOWvXynhkkL5aORB61zmrK7gWQX9iwSJI=;
        b=kXb+5Hr9OFnBDcgjzTb/gcVJTabEOFdI6jrvpVGEaGeyPACKTdIxIvOkEeBXChhwFu
         Eu4gVDMYCYp1I4Qz2jZtmnOXZSNVtU4D3gLwZMYbCri4esx0Ta00cjkH2fOpusrlnO/s
         10WQ2Dd1UZaqH/ecLY6E0jpzNmwyJcQEy1BHW9fcsO0V0id6wgNCjHch2ABp8BZOYKuI
         M7Q+GaKPH+4CKIn+hpICl2UoKJaZR/chSV+/rNualoApd6ZRw85mw2O4JJ97Iokfh0DC
         LKCdEicYglLMR+UTMujKbDDG/mD4t7EOLxeOrfJ8mJWOgOF8RVgRJd1sEsBwiHzj6mmi
         G/rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r/6P/78czMGOWvXynhkkL5aORB61zmrK7gWQX9iwSJI=;
        b=Xl8SKezU/oLTfe+WyZeRTmzPeaDvOr6FxvLIC24oVu2ERcMeMtRWUD5RDyILc3DOF1
         Cdw5U6ldRLVZYzYKR03iC0s2QLYFU19JVwYq1YkhdvffTMfSVa54FJpijLLRK2KKWzG2
         ytbkfK2+cOXiDrHZ9Dqu20nfpTimqCuQsjIAhyBYY1Y0W8HAHLPksOGfJbjrd32iaasi
         +0BptY/Eduvtf/76OxEG93u3sRgM99sYgMjKvA2vzqL7shnnZ/gDrxxkCws7TH8cHpG0
         Zc1wnMAVAJeCTgRryxLBzvF62rc2i34Ub5B2v/rEjlUdHvQ98I8jbCmqCXZcehJZI9b6
         CoGg==
X-Gm-Message-State: AOAM532NxXX4oe8SD1wd4aUlx6Pyz6OvOmC612Hf77Fhq8nBfOBN8jRc
        eqgiERmEmnjmIIQ1PZkQZ2f+E/gLIjwugPZGXmo=
X-Google-Smtp-Source: ABdhPJzqYGZPIbbvxGfguqe17tf6eTcJtin3HZBfyZy4pmYYHak5rq8/AuAThry9p1jBIFdkLp+nBbBmfeV5EtEiJro=
X-Received: by 2002:a17:902:264:b029:eb:3d3a:a09c with SMTP id
 91-20020a1709020264b02900eb3d3aa09cmr34461278plc.0.1619017545476; Wed, 21 Apr
 2021 08:05:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210404181409.1451026-1-andy.shevchenko@gmail.com> <20210421140340.GD3@paasikivi.fi.intel.com>
In-Reply-To: <20210421140340.GD3@paasikivi.fi.intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 21 Apr 2021 18:05:29 +0300
Message-ID: <CAHp75VcLXE6Bq_7d0DwPwL_EGoCy02dmWF=xZpSUfgkOYNEOew@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] media: ipu3-cio2: Fix referece counting when
 looping over ACPI devices
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Daniel Scally <djrscally@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Apr 21, 2021 at 5:04 PM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
> On Sun, Apr 04, 2021 at 09:14:09PM +0300, Andy Shevchenko wrote:
> > When we continue, due to device is disabled, loop we have to drop reference count.
> > When we have an array full of devices we have to also drop the reference count.
> > Note, in this case the cio2_bridge_unregister_sensors() is called by the caller.
>
> Please limit the commit message to 75 chars, at least if there's no reason
> to do otherwise.

OK.

> I can wrap it this time.

Thanks!

-- 
With Best Regards,
Andy Shevchenko
