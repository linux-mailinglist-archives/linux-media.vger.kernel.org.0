Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 708EA27A2E3
	for <lists+linux-media@lfdr.de>; Sun, 27 Sep 2020 21:44:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726280AbgI0Toi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 27 Sep 2020 15:44:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726239AbgI0Toi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 27 Sep 2020 15:44:38 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF146C0613CE
        for <linux-media@vger.kernel.org>; Sun, 27 Sep 2020 12:44:37 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id e23so5464928eja.3
        for <linux-media@vger.kernel.org>; Sun, 27 Sep 2020 12:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=7byhznMTDMGNZWyHHBM3w4db+dAkh5PJbFVolAq7xGs=;
        b=XL9bbz2OVNOBaK4lzhkkFWRXVTJdIeeEe3fV4JrdrDk5RMWSM5q4fm+HPV88TQDmjg
         Qaw7IU/gSAcEcL0J5tjDdo33ic7AMvm/hm8Zdtsc6G0cfhySFoGp65ZXaopI0oJ3iQsJ
         skGeiqApTPUpUkpd8ki9nVFrLM3W5S3/lUEVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=7byhznMTDMGNZWyHHBM3w4db+dAkh5PJbFVolAq7xGs=;
        b=t0TfivIo5C44bBPG7RBlbjDU2mkcCYTEAY1JhTFcadGtYSdbwDKk5+LfjQF3gZuRvR
         U7v3T5+J31gOZ98LlTor5J5teOKGj+jpyt0gsyhATnigcFiR4QM0NzdeTYEASIXh+2fS
         tNyM+0Dx0c83m3aD11/sUKML6LIfFWam2EpmEnrvejGkUGYQ8j7k8qdxO9gb/RxNEcyU
         aNYB1Yn9nk+CuJFdsgNDoOGyC8LXml52deGL1/cQ3rFeA8xNXnCSGrNQK7fbbM9M3HCd
         KCgovshCDDwbg8MSdYD8tlUylNBDb1aipY/EbWds//17VIdSzW5qkqinGhbZV9pQD28X
         rRcA==
X-Gm-Message-State: AOAM53105tXOhDiWFr8ecyXnkVwbnNNi9FNfgPDy8g3SF+YF5EKANtF6
        W2Q50+988RmNh8TVxrVYygQLKAIGDH8PJg==
X-Google-Smtp-Source: ABdhPJxy/dKN34hF5e46aWV9Ec7kVF1wMF42YMhoTJ+qLb0lNlj0i3N47svLHdFtRhF5SnEhG/lKHA==
X-Received: by 2002:a17:906:a88a:: with SMTP id ha10mr13295928ejb.532.1601235875997;
        Sun, 27 Sep 2020 12:44:35 -0700 (PDT)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com. [209.85.221.51])
        by smtp.gmail.com with ESMTPSA id a15sm7262384ejy.118.2020.09.27.12.44.34
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2020 12:44:35 -0700 (PDT)
Received: by mail-wr1-f51.google.com with SMTP id o5so9512152wrn.13
        for <linux-media@vger.kernel.org>; Sun, 27 Sep 2020 12:44:34 -0700 (PDT)
X-Received: by 2002:a5d:6552:: with SMTP id z18mr14720929wrv.32.1601235874347;
 Sun, 27 Sep 2020 12:44:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200903081550.6012-1-sakari.ailus@linux.intel.com>
 <f4b82baa-66b7-464e-fd39-66d2243a05ef@lucaceresoli.net> <20200911130104.GF26842@paasikivi.fi.intel.com>
 <6dea1206-cfaa-bfc5-d57e-4dcddadc03c7@lucaceresoli.net> <20200914094727.GM26842@paasikivi.fi.intel.com>
 <20200926123807.GA3781977@chromium.org> <20200927193900.GA30711@kunai>
In-Reply-To: <20200927193900.GA30711@kunai>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Sun, 27 Sep 2020 21:44:19 +0200
X-Gmail-Original-Message-ID: <CAAFQd5Be5sUQYtXapcSOu8CVffW2LuLog9qh71-+mxze9WYUVQ@mail.gmail.com>
Message-ID: <CAAFQd5Be5sUQYtXapcSOu8CVffW2LuLog9qh71-+mxze9WYUVQ@mail.gmail.com>
Subject: Re: [PATCH v8 0/6] Support running driver's probe for a device
 powered off
To:     Wolfram Sang <wsa@the-dreams.de>, Tomasz Figa <tfiga@chromium.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-acpi@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Mani, Rajmohan" <rajmohan.mani@intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Sep 27, 2020 at 9:39 PM Wolfram Sang <wsa@the-dreams.de> wrote:
>
>
> > I think we might be overly complicating things. IMHO the series as is
> > with the "i2c_" prefix removed from the flags introduced would be
> > reusable as is for any other subsystem that needs it. Of course, for
> > now, the handling of the flag would remain implemented only in the I2C
> > subsystem.
>
> Just to be clear: you are suggesting to remove "i2c" from the DSD
> binding "i2c-allow-low-power-probe". And you are not talking about
> moving I2C_DRV_FL_ALLOW_LOW_POWER_PROBE to struct device_driver? I
> recall the latter has been NACKed by gkh so far.
>

I'd also drop "I2C_" from "I2C_DRV_FL_ALLOW_LOW_POWER_PROBE", but all
the implementation would remain where it is in the code. IOW, I'm just
suggesting a naming change to avoid proliferating duplicate flags of
the same meaning across subsystems.
