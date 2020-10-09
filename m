Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4535288E89
	for <lists+linux-media@lfdr.de>; Fri,  9 Oct 2020 18:16:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389516AbgJIQQh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Oct 2020 12:16:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389410AbgJIQQg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Oct 2020 12:16:36 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFA48C0613D2
        for <linux-media@vger.kernel.org>; Fri,  9 Oct 2020 09:16:36 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id x22so7246034pfo.12
        for <linux-media@vger.kernel.org>; Fri, 09 Oct 2020 09:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K8GlQi27VTagdFLU3oodDOFbmHri+PJqblTvfUAz7ic=;
        b=Z4zOvp12gXXivv+/PPCs8eGGAsd8Xp45BTVWhuuUuEByxgQIFuN2p4qLDAd6mMp2T+
         plcJ90bT3AvJv+y2iSJzJM/ZShDGhr2+UO665ncPS2IXIuPLYr/qjUZbM3MylC8Pb7X3
         gIFRDv/iOiwwu6p3eFIIDTk8TFnkIcvzteuFdjeQ6ww2lmwcq3JL1rHFl5TlUL6k34RG
         HFeyrwYPx0X1y7YYitkYt1TDIQ11+esVo7pAMa51BFluPSD4ORUhXIDQjY16SqaTFLBD
         swVXH3Lr0eYVgt+2Mra+PHZj5MFrwBj4elFLhGW39RVaQGltkRz+ToN/ACZIABV0j9Sr
         44xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K8GlQi27VTagdFLU3oodDOFbmHri+PJqblTvfUAz7ic=;
        b=prdQ1Chp28SwboJ0AnKWVCP6c+3HqH+pRuzSo9weZWSFmDSeC+h756TDD+LG2guwYQ
         HogNX9CLJXKtGBuYpsI5eF527slfUSroA0X4+2fBSvFb+mKwUdb/hQr9PtGA/fC8v7t/
         O4BDNe+9LrYXNyMel8fshCp1Mgrda5rLE8p6uzjpbjxjIQEOQfh/ky40i9FmParEUCMO
         GEVhdwkFXaJ4eAOPUIpnmpymi+bCMM4b5YrPeAhMKZcVXgV01dAZBNSJd5QYgTyr+z/a
         EN5kZKVu8x+QiGotkupKuvqPOL14tosAZ4WXPAzk/x1QAAyiWdoboFh7R5h499Ec8aKY
         2NVA==
X-Gm-Message-State: AOAM5331UpwBAfD6niTW2ZjTR3X/+18KadQMGc5lifMlBtQHpXqYSH0V
        F3BT3NlRMi+DooFmObY0aFj9VDG+ODg7t2vaI+adAVL0PGy5hg==
X-Google-Smtp-Source: ABdhPJwRWDGzteyl+Xsa38xYnHitYvghPUoEFp7tkUxv1zKUd1DinEkGXBljbkUKi8ghI+j6ed0PxULMczTwAV7+hv4=
X-Received: by 2002:a65:47c2:: with SMTP id f2mr3964139pgs.4.1602260196247;
 Fri, 09 Oct 2020 09:16:36 -0700 (PDT)
MIME-Version: 1.0
References: <20201008204747.26320-1-sakari.ailus@linux.intel.com> <20201008204747.26320-3-sakari.ailus@linux.intel.com>
In-Reply-To: <20201008204747.26320-3-sakari.ailus@linux.intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 9 Oct 2020 19:17:25 +0300
Message-ID: <CAHp75VeUWd0g7Yyd8wXOrPbwGHsKHS+=+UMPBdhcup4fUVsn+Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] ipu3-cio2: Serialise access to pad format
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 9, 2020 at 12:44 AM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Pad format can be accessed from user space. Serialise access to it.

...

>         /* Initialize miscellaneous variables */
>         mutex_init(&q->lock);
> +       mutex_init(&q->subdev_lock);

...

>         mutex_destroy(&q->lock);
> +       mutex_destroy(&q->subdev_lock);

A nit: perhaps reversed order?

>         mutex_destroy(&q->lock);
> +       mutex_destroy(&q->subdev_lock);

Ditto.

-- 
With Best Regards,
Andy Shevchenko
