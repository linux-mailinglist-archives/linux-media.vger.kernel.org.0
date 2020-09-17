Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3394926DE76
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 16:41:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727562AbgIQOky (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Sep 2020 10:40:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727446AbgIQOiV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Sep 2020 10:38:21 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF61EC06178B;
        Thu, 17 Sep 2020 07:36:21 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id z19so1323512pfn.8;
        Thu, 17 Sep 2020 07:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Q8jrz6uWJjZDV5osg8THNEfIWCpsd8KCJUTVbj5qsm0=;
        b=SNst3m0v1mqRhl2zQtDQSsgxFQI03f/4abAenMcrtiZa3F20Ldtk5p950SXqNvzohh
         9eG7P3yvILc/52txWdh3OUJ23SaQr7B5/TFalX4QW9btcWzWNkVSoOcdHcnW6DrmgKNU
         gBHF/78VXjeadWrs7z+rVXCzFWo9JyRcmdUQIlV9ewnOiJVWPzAB86Woqm+b7a9L30HX
         yod5fx91qCtk1/19XDlTTtK+dbmTSmpye6G6yCiIH/hrbLlZeezGLwlprIXR1e68ZPpu
         aTG2Og7+W1/iBbLSszbja1sVSYHDParWBDC5SUV82ySP8+g9DtFLlgYQbj4PyDXTBqy+
         UZzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q8jrz6uWJjZDV5osg8THNEfIWCpsd8KCJUTVbj5qsm0=;
        b=UgEmvqy9JSjJGxrMQBr5ecGiX8Ova0pMQlX/1YUlO9MRRtUGdZrRYULeIH3un5+L9q
         24rTvqzyW6Tp0Xw6Y3sEpZueVk1kPCTXRK9atnyKRMtLd3ad5m24C0BZu4psXHy5tBps
         EZ45IFTpbA6P2fm/w1v/8JTs9nSASAb349VqkPRPILSYdEqPlxgB1thZUoUCv+z/LApJ
         n9mlynA+MLEfh2eU16syC1YBG92F2pCeXleslx7lu1YEgWw9GC3mB9Vi/lMwfapK6Ggx
         rO34/0BDrV+C9phEg7Rs3Zx/PagiK5kRQTvMKpbhHNAjBq9JUF0Bmc8ZPn8Kz7B9Z4xB
         eUZA==
X-Gm-Message-State: AOAM533infkbZIQPAmAhGvPkBF9aVRCrm3iy83AgTx8LYMOY8J4iryfa
        iTRoJFWAyTv4jfGv7lbv6hcB4rYL5XOcqADJn9bTF+jgSVSTWw==
X-Google-Smtp-Source: ABdhPJwoGicLiaC6w05McLgvuCi15yGa4WMG7a4CIxJz55Pw3FYa5lbkadDow5+1sPXEbSjRU9z7QiGiI86iOFyWa9s=
X-Received: by 2002:a63:c543:: with SMTP id g3mr23214145pgd.203.1600353381129;
 Thu, 17 Sep 2020 07:36:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200916213618.8003-1-djrscally@gmail.com> <20200917075356.GA3333802@kroah.com>
 <d97fb93f-5258-b654-3063-863e81ae7298@gmail.com> <53787a36-4473-9336-6719-270930db2735@ideasonboard.com>
 <CAHp75VcjSZC7BG9ckFTogTK0xXog9tev8i3w=P0iN4JRQY05XQ@mail.gmail.com> <f48ec4c5-0674-2e43-cbd8-f5dcc4bf5b15@ideasonboard.com>
In-Reply-To: <f48ec4c5-0674-2e43-cbd8-f5dcc4bf5b15@ideasonboard.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 17 Sep 2020 17:36:03 +0300
Message-ID: <CAHp75VcsDVe8RzPT9pWE1v7rX6yCysmV5tNR9q09UR_sHDfBaA@mail.gmail.com>
Subject: Re: [RFC PATCH] Add bridge driver to connect sensors to CIO2 device
 via software nodes on ACPI platforms
To:     kieran.bingham@ideasonboard.com
Cc:     Dan Scally <djrscally@gmail.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh@kernel.org>,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
        jorhand@linux.microsoft.com,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tsuchiya Yuto <kitakar@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 17, 2020 at 5:19 PM Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
> On 17/09/2020 15:08, Andy Shevchenko wrote:

...

> Ayee, ok so we have 'half' the driver for IPU3 out of staging.

Correct. And your below analysis is correct.

> From my understanding, the IPU3 consists of two components, the CIO2
> (CSI2 capture), and the IMGU (the ISP).
>
> - drivers/media/pci/intel/ipu3
>
> This is indeed the CIO2 component (config VIDEO_IPU3_CIO2), and that is
> the part that this bridge relates to, so in fact this cio2-bridge should
> probably go there indeed. No need to go through staging.
>
> The files remaining at:
>
> - drivers/staging/media/ipu3
>
> are in fact also for the IPU3 but the ISP component (VIDEO_IPU3_IMGU).
>
> I'm sorry for the confusion, I knew that the ISP was still in staging, I
> hadn't realised the CSI2 receiver (CIO2) was not.
>
> >> Hopefully with more users of the IPU3 brought in by this cio2-bridge,
> >> that will help gather momentum to get the IPU3 developments required
> >> completed and moved into drivers/media.

-- 
With Best Regards,
Andy Shevchenko
