Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7385835F187
	for <lists+linux-media@lfdr.de>; Wed, 14 Apr 2021 12:32:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233756AbhDNKdS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Apr 2021 06:33:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232235AbhDNKdO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Apr 2021 06:33:14 -0400
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com [IPv6:2607:f8b0:4864:20::929])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED9ECC061574;
        Wed, 14 Apr 2021 03:32:52 -0700 (PDT)
Received: by mail-ua1-x929.google.com with SMTP id m20so1361169uah.0;
        Wed, 14 Apr 2021 03:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=0kbTefn3hO3w0LCZUig7YuSy0EObSZ4OryEHcILQ9A8=;
        b=EON5qCJGlGgySMAwpVSNiZi5vJDi4vSPmQiTNkcs9RvjyjQ0RQtADbiSxQspUQVtsY
         NWSl7/mfZEWApqL6rGVwEF2dur93j/aUBMj26ItEEkd/QvngeWq1xla6aoMCECxlTZP1
         yMrlxbjA5FRt7MEmTDkik1cvbQQSeVZoGit+BTeGLL//ax8xUzyObE6ZcpV7E/b8KP8q
         NxyO0a8VFJ6wAnh6UUQPAiIenP2XZnUls2/WwJeSjPlcewMm/NcQvxzFi2IN8fmm8rIN
         /CPAznljsGs+4VpETAzDvhzxIHFCDNvB1QLuPByFkNXv9yyXHnFQ09+UlTEMRiIAZ+c5
         lAqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=0kbTefn3hO3w0LCZUig7YuSy0EObSZ4OryEHcILQ9A8=;
        b=oKZAp4+VuMJNzEhnOhJZ+nBjk6MLJS9sEaxCOfvwJ3Z2Kp6lhFCwI3Y3j7aYvBemu5
         kQE1pfDw3JhyeKJUEpHFwJov2skqJBWufgjqLhcQOSE6H9rSee58gUPNzUrN+qSVcxik
         QKSxoY2NFFiOrqtw6yrYEgwJmR3H9/sDPScI0v+5bW1l7RjZ2BooUYtgxFM5Ip71s+z1
         EIV78k02l4887/WgbommmCxKuH5vIO+MwXRRNouN0PrfM9AGgnV15Dhwdf2Mnav4a2cv
         qTRwENmMFK/4a0JfNGSzd28Jh5cXvh6jJziSOWOvUctJK8l/BSzBIenOVmkWmWqAgAaA
         CVyg==
X-Gm-Message-State: AOAM530bhZCF/GszR+Pj+OeL1NZUtP7kjcdWpIwT7dMpE9xG/lvJX4Ay
        hj8xYf3F6IO2vY4t/ZRPvBxk9gdWYamQs3NQbf7hvCrrUtk=
X-Google-Smtp-Source: ABdhPJwbOAKS5xtJYVCp0sD7mYUPaXP9YlaLojzNA8G+T1ApLsLJJ3kv5djhhQm74aq4lubGECB+FJqRFWWi+R58naA=
X-Received: by 2002:ab0:12a:: with SMTP id 39mr25549591uak.19.1618396372022;
 Wed, 14 Apr 2021 03:32:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210401144336.2495479-1-emil.l.velikov@gmail.com>
In-Reply-To: <20210401144336.2495479-1-emil.l.velikov@gmail.com>
From:   Emil Velikov <emil.l.velikov@gmail.com>
Date:   Wed, 14 Apr 2021 11:32:41 +0100
Message-ID: <CACvgo50-fKJk_EpY-G_SGes6-FUs=nAouzBmSN-CYgMTpoeN_w@mail.gmail.com>
Subject: Re: [PATCH v4 0/9] Microchip SAMA5D4 VPU support et al
To:     kernel@collabora.com, Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-media@vger.kernel.org,
        linux-rockchip <linux-rockchip@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi everyone,

On Thu, 1 Apr 2021 at 15:43, Emil Velikov <emil.l.velikov@gmail.com> wrote:
>
> Hi all,
>
> This is here is another small revision of the series adding support for
> the Microchip SAMA5D4 VPU, which it based on the Hantro G1.
>
> For more details, please see the v2 cover letter.
> https://lore.kernel.org/linux-media/20210311154055.3496076-1-emil.l.velikov@gmail.com
>
> Changes since v2:
>  - Added RB (thanks Eze)
>  - Added AB (thanks Nicolas)
>  - Reworked Hantro driver to support modules lacking irq/clk name
>    (thanks RobH and Eze)
>  - Dropped defconfig patches - merged separatelly (thanks Nicolas)
>
> Changes since v3:
>  - Include the fixed dt-binding patch
>  - Reinstante clk/irq names within the SAMA driver (Eze)
>  - Use num_{clk,irq} in Hantro, instead of WARN_ON/NULL checks (Eze)
>  - Drop Nicolas ack from a patch he never gave it to. (Eze)
>
> Note: patches 6/9, 7/9 and 9/9 need reviews. Everything else has been
> covered already.
>
Rob H reviewed patches 7/9 and 9/9 last week (thanks Rob), which only
leaves 6/9.

Is there anything I can do to move the series forward?

Thanks
Emil
