Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 630DB41B227
	for <lists+linux-media@lfdr.de>; Tue, 28 Sep 2021 16:31:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241219AbhI1OdD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Sep 2021 10:33:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241335AbhI1OdC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Sep 2021 10:33:02 -0400
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63C42C061745
        for <linux-media@vger.kernel.org>; Tue, 28 Sep 2021 07:31:23 -0700 (PDT)
Received: by mail-io1-xd2f.google.com with SMTP id y197so27543547iof.11
        for <linux-media@vger.kernel.org>; Tue, 28 Sep 2021 07:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UUTefOifPzK8o8IQCRkR0DGqgC4ds4bEaHBEw4Us9gM=;
        b=klHCR4wezPXbZVHVXJPAtwGkFI8TgDpC4VUMf1eNaT9oy5nuaAN4oSHNgzshbRb76W
         kv24jKFOhRbPykunrHkffhboAns2DFxu1gO3mvdRVc4G0Q2aXYbyk1EeE5zIUDCEq3+x
         gdh6EhmcI5WKpwUfjOxp7JGUMtCd+71yHBSJpxz90bwYEoKkRm4k/lEIc2KJnaqrE1MN
         qiJNuKQudTyBgMgFJ/Ft/agEst/sQh6LRJvtidNbIdHy1DA1o35RNZ2gYSTBlVxTxzXI
         YTgUzzlYUBkcfMEQRozLaQzQ1IyWIcfbRAoRJsdcDwXohGA7ovr/O1dT2Gd1BE2eLFVZ
         /vPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UUTefOifPzK8o8IQCRkR0DGqgC4ds4bEaHBEw4Us9gM=;
        b=hpRSO2y2osBCiSn0zTEhyFbw8/SM0joXaQBvRlAnGatwKNA81HBwPFvYDLrrKZR2LM
         MJWqt+GEAFRHiq6B8EHzcCBmn5RdPbUJXAIK9/sB4rUshBQBrR6wrfKgFyUVCBBQgQqR
         /d1aQAhWOpqd6iO48MWS7VT3Q8pDhyBWLcB1Kct6xqGctX54CKKEiagxT9S/WsyoqLkj
         2HPKZLfGfyBULDf6adSQE9Grmf3uAlds2pBDTt6G6GjG68epgHf1qfbQ6jiC+zrfsSfe
         QYK7s6PD5OLQP7mh2f+lEii0VO8xnfeP6iEOeq0C/sG7n2C/o5vL1wnMgovwZOBU3aeZ
         0JPg==
X-Gm-Message-State: AOAM532Y8xZ+jy8dAl5pKFCYiXTNBbqT7qb86tezKbyk0vQPYhtsSGtR
        5qDggjNlfylF0FTTt7FhU82fLV0KISDauuO2DieaMdY70Bo=
X-Google-Smtp-Source: ABdhPJxRkCpCpjBQ4HHidyStCyTZG1vBlKD/r+m3YN0avn1VD+M9wZcZuWuIZ43OZ1v/a7TmV3nQFUTo+TBEU1b8DvE=
X-Received: by 2002:a5d:9601:: with SMTP id w1mr4175670iol.209.1632839482836;
 Tue, 28 Sep 2021 07:31:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAHfbzRsFzunBDNPbQt=HUx+cBSHdBzzrJ-s4bjj+bEoB2sNvqw@mail.gmail.com>
 <20210928095023.ezrmeivie3yr7su5@uno.localdomain>
In-Reply-To: <20210928095023.ezrmeivie3yr7su5@uno.localdomain>
From:   Borut Lampe <nude.bird@gmail.com>
Date:   Tue, 28 Sep 2021 16:31:11 +0200
Message-ID: <CAHfbzRuRnwijtdaE_HgBYFf25tBm1xd=Qp5Dya14TpvaYfOGSQ@mail.gmail.com>
Subject: Re: OV5640 720p@60fps
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

I am using MIPI CSI-2 with the Qualcomm Camera Subsystem driver on a
custom 820 dragonboard.

Kind regards,
Borut

V V tor., 28. sep. 2021 ob 11:49 je oseba Jacopo Mondi
<jacopo@jmondi.org> napisala:
>
> Hi Borut,
>    which kind of setup are you working with, parallel or CSI-2 ?
>
> On Thu, Sep 23, 2021 at 12:37:01PM +0200, Borut Lampe wrote:
> > Hi,
> >
> > I noticed that for now only VGA resolution supports 60fps even though
> > the documentation says that 60fps is possible also for 1280x720.
> > Is there a reason this hasn't been implemented yet (e.g hardware
> > restraints)? Are there any plans to implement this? Can anyone give me
> > some pointers on what would have to be changed in the ov5640 driver to
> > achieve this (starting point would be linaro kernel qcomlt-4.14)?
> >
> > Kind regards,
> > Borut
