Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1AFA4673A3E
	for <lists+linux-media@lfdr.de>; Thu, 19 Jan 2023 14:31:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229916AbjASNbY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Jan 2023 08:31:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229712AbjASNbY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Jan 2023 08:31:24 -0500
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 020BC78AB1
        for <linux-media@vger.kernel.org>; Thu, 19 Jan 2023 05:31:23 -0800 (PST)
Received: by mail-yb1-xb31.google.com with SMTP id 66so2477757yba.4
        for <linux-media@vger.kernel.org>; Thu, 19 Jan 2023 05:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yCqPKnSa7WozhuTI0rKqXlgcivKBLrizV645POVS478=;
        b=db7e5U5L08xVk+LSrK+0Kzj2SoihxS7LOo1B9e7WOS2L+qKfJwkApXLkv/jZ78/G4H
         IxqD/5L3tUGUwSXT/PlYvrRWcXFJQtmwaZ87c9sThcKO68mhz8X6oLhWLdcUFiOU92gl
         PrYEbE44mJj16MmmijES1wJSe5H5wNjUyxUk4L1BBnDtXvDeFy7FNOwRAQxRsNnx2ug9
         x5kxH4b+8T6jpqZVva65untJEfUlHIdFw6Ve5kC0Cqa/lP6v3pSkQwyaSa93O+SLcAtj
         byulHgj3QUqnPkTvDeNeBt1lME23sk2JxOVWIcb64lVVsgkUaZEyLZNkmF9zxOya7tAL
         XcqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yCqPKnSa7WozhuTI0rKqXlgcivKBLrizV645POVS478=;
        b=PIN3uCrZSvwJXuHJjnHQEQc1zCgupfRZAnLzXNpyEngDWoq9W4uIOpLQ3TD9hPnuEV
         /7xZuGZes7swIxN4zOHwU6q6oZZ8/WolHv2L8GDOnuxoMJuzdmbyJpFKv7KLHVfS1+sR
         XTCa/5VchnYqH7oUpRs/8BMC4RxyKnolAEUaNozmvwE7Xe9reE/MlJdhQmJSrSDq/kYt
         6LK0sZbH8E38j/dDpodSDBXfEk6zWFuMRbk29ODiGnMVkzKCXEDUnq9j6FQux3A4Hv7L
         h0GK7rpWz2HK7qj2DqIJHCXXuy4LrhnCeTooOXM2a3b4WxnXQGsZjqqUyd/FUC2qHyYL
         QevA==
X-Gm-Message-State: AFqh2kpxGm/Z04tJWadvgwkBBqxCeIR9CMkz+X8QwS7IQO4Rcg8jDuNs
        HnKWs5QDzfVyYNM7MWb4hK8aXSuSme9k8Gj+Ze0hVQ==
X-Google-Smtp-Source: AMrXdXu0SAHmeBGFvcM/lvwMo9hMvjdUbZWFyuQeTWjeUppruJ9ehZC0zWYFLLPApsAUyfmneXtDjaVH+rYR5GfcM3k=
X-Received: by 2002:a25:bd14:0:b0:73f:fb7d:400 with SMTP id
 f20-20020a25bd14000000b0073ffb7d0400mr1646414ybk.352.1674135082149; Thu, 19
 Jan 2023 05:31:22 -0800 (PST)
MIME-Version: 1.0
References: <20230118115810.21979-1-umang.jain@ideasonboard.com> <b1a26368-3753-0d32-434b-e220dd9c06b4@i2se.com>
In-Reply-To: <b1a26368-3753-0d32-434b-e220dd9c06b4@i2se.com>
From:   Phil Elwell <phil@raspberrypi.com>
Date:   Thu, 19 Jan 2023 13:31:12 +0000
Message-ID: <CAMEGJJ1=dix7gWvV3Jxef-M-ExFZRTASQCr+6sn_dGsEQ=deYQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] Drop custom logging
To:     Stefan Wahren <stefan.wahren@i2se.com>
Cc:     Umang Jain <umang.jain@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-rpi-kernel@lists.infradead.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        Adrien Thierry <athierry@redhat.com>,
        Dan Carpenter <error27@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,


On Wed, 18 Jan 2023 at 17:55, Stefan Wahren <stefan.wahren@i2se.com> wrote:
>
> Hi Umang,
>
> [add Phil]
>
> Am 18.01.23 um 12:58 schrieb Umang Jain:
> > Drop custom logging from the vchiq interface.
> > Mostly of them are replaced with dev_dbg and friends
> > and/or pr_info and friends.
> >
> > The debugfs log levels (in 4/4) are mapped to kernel
> > logs levels (coming from include/linux/kern_levels.h)
> > Would like some thoughts on it as I am not sure (hence
> > marking this is RFC)
> >
> >  From drivers/staging/vc04_services/interface/TODO:
> >
> > """
> > * Cleanup logging mechanism
> >
> > The driver should probably be using the standard kernel logging mechanisms
> > such as dev_info, dev_dbg, and friends.
>
> i don't have any experience with vchiq logging/debug. So i'm not sure if
> it's acceptable to lose the second log level dimension (like
> vchiq_arm_log_level) completely. Complex drivers like brcmfmac have a
> debug mask to avoid log spamming [1]. Maybe this is a compromise.
>
> Btw some loglevel locations has already been messed up during
> refactoring :-(
>
> [1] - drivers/net/wireless/broadcom/brcm80211/brcmfmac/debug.h
>
> > """
> >
> > Umang Jain (4):
> >    staging: vc04_services: vchiq_core: Drop custom logging
> >    staging: vc04_services: vchiq_arm: Drop custom logging
> >    staging: vc04_services: Drop custom logging
> >    staging: vc04_services: Drop remnants of custom logging
> >
> >   .../interface/vchiq_arm/vchiq_arm.c           | 151 +++---
> >   .../interface/vchiq_arm/vchiq_connected.c     |   5 +-
> >   .../interface/vchiq_arm/vchiq_core.c          | 479 ++++++++----------
> >   .../interface/vchiq_arm/vchiq_core.h          |  39 --
> >   .../interface/vchiq_arm/vchiq_debugfs.c       |  26 +-
> >   .../interface/vchiq_arm/vchiq_dev.c           |  78 ++-
> >   6 files changed, 329 insertions(+), 449 deletions(-)
> >

Thanks for the nudge - this patch set hasn't yet made its way through
the sluggish rpi-kernel moderation.

I understand the desire to remove the custom logging. I don't welcome
the loss of flexibility that comes with such a strategy, but I'm not
going to argue about it. What's harder to understand is the state that
this patchset leaves VCHIQ logging in. From what I can see, the
per-service logging control has gone, but the code still contains
macros that hint at something useful. Similarly, the debugfs support
is completely vestigial, giving the appearance of control while
actually achieving nothing.

Phil
