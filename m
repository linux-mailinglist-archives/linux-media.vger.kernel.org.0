Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D16C3E5AC2
	for <lists+linux-media@lfdr.de>; Tue, 10 Aug 2021 15:11:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239339AbhHJNL5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Aug 2021 09:11:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236764AbhHJNL5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Aug 2021 09:11:57 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91300C0613D3
        for <linux-media@vger.kernel.org>; Tue, 10 Aug 2021 06:11:35 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id l11so9272769plk.6
        for <linux-media@vger.kernel.org>; Tue, 10 Aug 2021 06:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eRkEgKmSLFpsRUzXtz3uMwWZerVVa6t1FVR/O2SlnO0=;
        b=TJhC0YE+fKZz+0/cEYrizaPWbFV2VYNOE6x6riNk9G5+Tq8u00Ja3FufWgacchQOaT
         FZFspV23pCoTjyUNXyS/FbCWYVv2ve+cMeDOmXatwY8IsLPZMGpFRhs7P9b0q8P7uO4f
         2UUQPlENEO83GSI1ejYw154w2UMROxCK7uG0oe418l42YueUWFyCwdyEABEasAjMhbcq
         GzVf+EtGVnr4hdFO3w0qf6XQ3i3WMIzbfDD13NXADjZeY+QEH1W2bU2jHJlpkI2qHik6
         Q4uUoYmnAgDh31ZABbKvDdgeAv2cNBgNEV6JLVP+F6cQce+FAQWM4XzVlhhk8lht2IGf
         7ZBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eRkEgKmSLFpsRUzXtz3uMwWZerVVa6t1FVR/O2SlnO0=;
        b=FXPOL2lfsuAMrRia7BYB/kvbL0Rh3eG58zRbG20K8pKrJEhyLy6hjOmpB3KU9IIr0J
         UKFwcI7z7ihXiF0fpLZuaM30HgTMVKNodDKdgWBwpJBcLgILrbBmdrwXdDc66KzBmaWN
         Nm30n8wUULUU1zTFI3lxFM0XVbCgshyybxvlU2jtAe2SACsGeS6K4YXg0/MCWvkXbIuX
         MorJ/pGubD2IDgRSRUMTV8gP8t9FRasckJYvEhYM9hEbB8bWCz9HPYGUzjiIlFGql13C
         xEsNcTtTno6VXN6nAT4Rr3m+GwBp/bq+/9KM95ttaN6S5+S7vGOrcS/89zecF21ZKppR
         pXjA==
X-Gm-Message-State: AOAM533runNBskS7RUjgWoGpLbfb4phulZ8gAfRChp1520E3BLNCrszs
        U+XB6RzazoOQQDS8r+StRL6WVC4xfh2buQdJgZE=
X-Google-Smtp-Source: ABdhPJxHQDJk2RqH3Q5wADeIq7NlekQj+lMbZr0m542cHgQFkaAh8sC1ZP3PIn2DEW7rE602njF2o44JhTqUQw50pqU=
X-Received: by 2002:a63:40c1:: with SMTP id n184mr85556pga.74.1628601095038;
 Tue, 10 Aug 2021 06:11:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210809225845.916430-1-djrscally@gmail.com> <20210809225845.916430-9-djrscally@gmail.com>
In-Reply-To: <20210809225845.916430-9-djrscally@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 10 Aug 2021 16:10:58 +0300
Message-ID: <CAHp75VeW0x=_B0AkYHYYFUsV-xaxiLOEQepmeK73rFw_kj03Ew@mail.gmail.com>
Subject: Re: [PATCH v2 08/12] media: i2c: Add hblank control to ov8865
To:     Daniel Scally <djrscally@gmail.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        kevin.lhopital@bootlin.com, Yang Li <yang.lee@linux.alibaba.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        kieran.bingham@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Aug 10, 2021 at 1:59 AM Daniel Scally <djrscally@gmail.com> wrote:
>
> Add a V4L2_CID_HBLANK control to the ov8865 driver. This is read only
> with timing control intended to be done via vblanking alone.

...

> +       hblank = mode->hts < mode->output_size_x ? 0 : mode->hts - mode->output_size_x;

In both cases can be

       hblank = max(mode->output_size_x, mode->hts) - mode->output_size_x;

or max_t() in case types are different (but in this case the code
might be uglier).

> +       ctrls->hblank = v4l2_ctrl_new_std(handler, ops, V4L2_CID_HBLANK, hblank,
> +                                         hblank, 1, hblank);

> +

Redundant blank line (pun is not intended :).

> +       if (ctrls->hblank)
> +               ctrls->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;

...

> +       hblank = mode->hts < mode->output_size_x ? 0 : mode->hts - mode->output_size_x;

See above.

-- 
With Best Regards,
Andy Shevchenko
