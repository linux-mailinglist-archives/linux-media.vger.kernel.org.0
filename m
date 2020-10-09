Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D106E2886B2
	for <lists+linux-media@lfdr.de>; Fri,  9 Oct 2020 12:16:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732041AbgJIKQO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Oct 2020 06:16:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731273AbgJIKQO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Oct 2020 06:16:14 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65649C0613D2
        for <linux-media@vger.kernel.org>; Fri,  9 Oct 2020 03:16:14 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id r21so3452795pgj.5
        for <linux-media@vger.kernel.org>; Fri, 09 Oct 2020 03:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9ab5lmdWlLCUcWNKHV9Z9IjlXgIqecBe4GxhvLXwCjI=;
        b=E+kYQZdkB1EC1nvkHvW0jwFShyMyS6xY30kRlnDQ6+PlamfkiYfLCZ1fYcBr1BOYx9
         x0xogLTC2JzRVNKJjK6b9I/wq+wQaj6S6Dz3WkCUEXZuCmo3Yzx1GIKBkgPJuPdTrTq3
         eLThjnAdk3hc5VmRcPunV2TNXrhB/y2RClS197BR50Pe+daUSPfga3m49FrXoJjBGNPk
         1ulcm1ZJ0V9kO8uy2ELJvyQgKFm/UyVP2B6RIDvXWrO+2k11Cpsfw55n5k1/U46QghBJ
         tTFYepA6ynBK5rkkzdF6Qj6V5tmtL0hfGmpYL1/7K5Mj2M8cIF6o6hwnxihH+QXnE2Nk
         pTxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9ab5lmdWlLCUcWNKHV9Z9IjlXgIqecBe4GxhvLXwCjI=;
        b=GVktx5JXgeEJqzvtoZcmTK9TZQcm5og7taXhxAovBmF9O2wftSNAuG0FY2Z5JTTeEm
         OdJFQ+7GmxlEcOHbV8Dqph7RqQkqnk8eshn/oJNyOP6i2qICXCq9sPt+xdJDwaMhy6PA
         EH5wNIOkf+fdToAl8qtDlM2x+mFCQ/cW1R92Dyem7vxc4abPHHJdpgVutVuIUH1qxB5D
         aVZRkYL5BqeWb9GgCd1t/IIPrg9odrRu9swIO7aKKvdpcD6SuRj9+q/RF3rQyaLURVV2
         d8Dyt8kA4naheESxz5vBD5HAjaZmMf+kzExtjyLt3RapmjR1SA81dI7KjpomfW2iKUsy
         0JvQ==
X-Gm-Message-State: AOAM533jMB5zNQjdOcuMGT1Lsm9xXwY0xG6Zs+pPk6HjRJDvFwC9QxxG
        IZ8s1paZw97DDxlZ3aHR5x/f12MMBZ8VQG2PdEM=
X-Google-Smtp-Source: ABdhPJw0iGW49rmvtbceeMtJW/zckYLZcc+bX+eDHqjtH3iXWAPSwtWxav+h4JM05mAFBUbiyibzfHdJ610v/l66Le8=
X-Received: by 2002:aa7:81d5:0:b029:142:2501:39fa with SMTP id
 c21-20020aa781d50000b0290142250139famr11829495pfn.73.1602238573940; Fri, 09
 Oct 2020 03:16:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200817160734.12402-1-andriy.shevchenko@linux.intel.com>
 <20200817160734.12402-8-andriy.shevchenko@linux.intel.com> <20201009011825.GJ12857@pendragon.ideasonboard.com>
In-Reply-To: <20201009011825.GJ12857@pendragon.ideasonboard.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 9 Oct 2020 13:17:03 +0300
Message-ID: <CAHp75Ve+Y++sdKNgz=drYyHkg7Wa4oadCPj-RQwC0OsuFSHXjQ@mail.gmail.com>
Subject: Re: [PATCH v2 08/10] media: ipu3-cio2: Drop bogus check and error message
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 9, 2020 at 4:22 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Mon, Aug 17, 2020 at 07:07:31PM +0300, Andy Shevchenko wrote:
> > pcim_iomap_table() won't fail if previous pcim_iomap_regions() hasn't.
> > Since we check pcim_iomap_regions() for failure the check close to
> > pcim_iomap_table() is bogus and not needed.

> > +     cio2->base = pcim_iomap_table(pci_dev)[CIO2_PCI_BAR];
>
> pcim_iomap_table() can return NULL if devres_alloc() runs out of memory.

True. And this is checked by pcim_iomap_regions(). So, dup check is
not necessary.

-- 
With Best Regards,
Andy Shevchenko
