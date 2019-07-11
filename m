Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 181C7653AD
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2019 11:21:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727960AbfGKJVj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Jul 2019 05:21:39 -0400
Received: from mail-wm1-f49.google.com ([209.85.128.49]:53126 "EHLO
        mail-wm1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727595AbfGKJVi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Jul 2019 05:21:38 -0400
Received: by mail-wm1-f49.google.com with SMTP id s3so4920433wms.2
        for <linux-media@vger.kernel.org>; Thu, 11 Jul 2019 02:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=ANwc2D/PG9355YFS84Ptg823zGggaMsyK9HtWaJA3BA=;
        b=WgBmVeS0ZwsSiTCoiNGN3h+sTPkRc9RtSZxY2L/60eHZGcZzWcHt5Ou4PtpwLh9hg0
         DHAwKKEbtCFVXlAoaW72iZad1V5KWR8N3F0lHidgBF60SSLqTRJa5VvdEN24Sd1vIOBl
         3qj/Um0795ZiTlFXkg4iaOdHCJn+8qhvkDCZoVnnywI6JfYsPvjB3KJH0SDxWH0KA8S7
         Ab6OHLtLHRzDvVsl4gJAaD0WiRBYddQL1DMurixAezO9gTHj3Znt7wEA7R8O27cGpkOe
         GA9csL+NrFZU9VeUh2NymaU3WCjjchWbpRHOBAOIzA4Qummc7Zq75NMGWX4PNmli/M6j
         OfKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=ANwc2D/PG9355YFS84Ptg823zGggaMsyK9HtWaJA3BA=;
        b=f3+z4Q69/yD/A5DVZtC/A04biW3PRpK0xrnkH2trnYQ72KrOOGk5JFy9nVJFxF7wJ8
         vVkiC2NLoh1AmW/9r5fp8m/Su37572ChiMREmN4IFXz7sP63jsmyrP8Sw9NwwlMpuLAR
         8GB7F/z5fBvHWa16ihFsmSIhIXnPJzLcKpGU64mRVrlKDm+I27M/0bpVinmSQfZdT5jw
         yg/cylzV38TVlsbFrL4DDTx1aIWx929ZwQo1IjqHxnM+ZrU3gN7n7a9UD470jCw47Ugp
         5TdNFP044K/ML7gmhHXi9ckOiI58ykOPDk+LuclQvyYtIDri9EBe6BI1xXxXRFn9jjJP
         jW7Q==
X-Gm-Message-State: APjAAAWfQFwoCn2jaMFiO+5Yp+017t4hel+IVqY7ONpTcR5rdkADlTQb
        Y5rgEAJypw6fIIgrFbR+rcZCMiBOEMy9khX2N2ulZ5x3
X-Google-Smtp-Source: APXvYqxuaVuRHIa9722qRam5FLa9ukqyiuQVng5hV4RHQ9Heoy67P2Bsith2U2IAn09EKYpXnB4PNdXlH0Go94xhFpA=
X-Received: by 2002:a05:600c:21d4:: with SMTP id x20mr2885678wmj.61.1562836896316;
 Thu, 11 Jul 2019 02:21:36 -0700 (PDT)
MIME-Version: 1.0
From:   wens Tsai <wens213@gmail.com>
Date:   Thu, 11 Jul 2019 17:21:23 +0800
Message-ID: <CAGb2v65AHjF4oNBixiEb=yqHF_gZyz91K_65U7kUAPGd6_cOkg@mail.gmail.com>
Subject: Single- vs Multi-planar APIs for mem2mem devices
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

I noticed that recent codec driver additions, such as hantro, meson/vdec,
mtk, used the multi-planar API (mplane) instead of the single-planar API.

Is there a preference for moving towards mplane?

Also I noticed that v4l-utils has a plugin that seamlessly adapts mplane
devices to work with single-planar API calls, but there isn't one the
other way around. Would that be something worthwhile working on? To me
it seems having one central adapter is better than having applications
try to use both APIs, though some such as FFmpeg already do so.

My interest in this is trying to get Chromium's v4l2 video decode
accelerator to work on the Raspberry Pi 3 with their downstream kernel,
which has the bcm2835-v4l2 driver. It would also benefit other platforms
that have a stateful VPU, such as Amlogic (meson) or Mediatek SoCs.
Chromium's code uses MPLANE exclusively, and it's geared towards ChromeOS,
not standard Linux, but still it might be interesting to get it to work.

There's also the v4l2 slice video decode accelerator which uses the
request API which has the same issue, but lets not get ahead of ourselves.

Regards
ChenYu
