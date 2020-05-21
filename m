Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4144A1DC818
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2020 10:00:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727122AbgEUIAh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 May 2020 04:00:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727011AbgEUIAh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 May 2020 04:00:37 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2C7AC061A0E
        for <linux-media@vger.kernel.org>; Thu, 21 May 2020 01:00:36 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id x2so2961721pfx.7
        for <linux-media@vger.kernel.org>; Thu, 21 May 2020 01:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uSI1TzmynLMdYw4uoJY8RuqX2yPVX/cB6bYkZkYI33w=;
        b=d+8Sk2onlGPEDjrv5XN09uGGZBCeS9nU8gViV2Q/InDcQCwtJcVay7lKb6nRWAoFmq
         EXd3wfN+ZPqvb6Q/OBR7WpWdHCQ/A6t2U8SaNOAonY6AtktW6cOIsTD5Z0tNxJuLxQyX
         5PtJPBOJvSnTLbKqmHW0oVcSmE61WgkYzaNZN1bRnGTftinDmiCnUQyfRPCcArHTiKAY
         jlEWlG6pC3mqjjzmjXoKJ6s45/b7li/rBVwEPlwgaNww21M6L8SGow1Hm7Pon5BaPN72
         iqnw9G7K3T8jH1KDb6eHJeH2bRmIJT/MM6ao2lE6JxKMRPjVxGj2htH26XuAIp3nZIoC
         T2wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uSI1TzmynLMdYw4uoJY8RuqX2yPVX/cB6bYkZkYI33w=;
        b=N3SideMeMDuPo0YgppSWOLd+ybcHc3DEb/+3vU6iQHlXgQPNdY8P6RQGLUZTSF3gRC
         6+YExtEaZmD7CbRXSRJ6ZgBFZOugARrZoVMVJ2vcGagNre/Hu2GQgQovfO2stz3i6i11
         T5ILKDm58w01Ksx9dUJQ/rIrl4i3a+1Ez2ecoyT/iu8x20owrWBFRR1lAZxu4m26j0ov
         5774VvJH0lkWJijqPeaSirqnm7xEZQVLUkbrx7AuBL3vFXn4g4EOAXbaoLpI5k2HUPdT
         UzIvl2QL9RCHFN1vanOTnCiu4AAYu9gJtPV9N70vAwT2yZ+pRFYeda9ArEOpHZ+wTjC0
         tpnw==
X-Gm-Message-State: AOAM5319MLewqvfp5rdOQ2wap1C/hZQs2kmynjCdAwmrlekvCcY3v+bU
        7HiNrihqkJysZ5jfPV54lT1kp3yQMSdiS5Jq6h0=
X-Google-Smtp-Source: ABdhPJyysXlFqDV936jzcfp0iXYXXlv7Q/TWoYK/rltvK+b+sPa0aiSCbb27GzRaIAnY7ppBHdOgBxQpeNkNtSyp9m0=
X-Received: by 2002:a62:7f11:: with SMTP id a17mr8426547pfd.36.1590048036415;
 Thu, 21 May 2020 01:00:36 -0700 (PDT)
MIME-Version: 1.0
References: <12fbe3f5c6a16c5f3447adbc09fe27ceb2b16823.1589625807.git.mchehab+huawei@kernel.org>
 <20200517103659.GS17578@paasikivi.fi.intel.com> <20200520094400.5137e7f2@coco.lan>
 <20200520082608.GV20066@paasikivi.fi.intel.com> <20200520131830.3ff45919@coco.lan>
In-Reply-To: <20200520131830.3ff45919@coco.lan>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 21 May 2020 11:00:19 +0300
Message-ID: <CAHp75VduEGyzobm0hkXzWmFfZb-uMAEWG-wc89b7M7zVzZ_4LA@mail.gmail.com>
Subject: Re: [PATCH] media: ipu3: add a module to probe sensors via ACPI
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Krogerus, Heikki" <heikki.krogerus@linux.intel.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

+Cc: Heikki (swnode expert)

On Wed, May 20, 2020 at 2:19 PM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
> Em Wed, 20 May 2020 11:26:08 +0300
> Sakari Ailus <sakari.ailus@linux.intel.com> escreveu:

...

> As I said, the problem is not probing the sensor via ACPI, but, instead,
> to be able receive platform-specific data.

There is no problem with swnodes, except missing parts (*).
I have Skylake laptop with IPU3 and with half-baked ACPI tables, but
since we have drivers in place with fwnode support, we only need to
recreate fwnode graph in some board file to compensate the gap in
ACPI.

*) Missing part is graph support for swnodes. With that done it will
be feasible to achieve the rest.
I forgot if we have anything for this already done. Heikki?

-- 
With Best Regards,
Andy Shevchenko
