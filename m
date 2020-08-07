Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E2C723E773
	for <lists+linux-media@lfdr.de>; Fri,  7 Aug 2020 08:51:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726370AbgHGGv3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Aug 2020 02:51:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725805AbgHGGv0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Aug 2020 02:51:26 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E4B1C061575
        for <linux-media@vger.kernel.org>; Thu,  6 Aug 2020 23:51:25 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id d6so953878ejr.5
        for <linux-media@vger.kernel.org>; Thu, 06 Aug 2020 23:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GEqwqYzm5hBTHtEMjhPr1RMlBJXotR2ShP/q7XiMds8=;
        b=K59azOHEihLKYtrXBJVdrZ9lhi1MRP4V4B+xsIG+UgkqMVo3Lkigc03xj3IsnpNAtz
         aJhPq1/rFY0tVuSGO4AElm7fKIdIwRNJzcWXUbCyGYZ8DAVto/qzsbBENy4k1EHiRFeR
         1YtgZwuRZLSWv8L58z6bY2Yf7qcnOQvWCU8G0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GEqwqYzm5hBTHtEMjhPr1RMlBJXotR2ShP/q7XiMds8=;
        b=TSj4/ppISaj7JQmFS34b/ndDL928abmzVIjuZKKq2akuHOc90HDvJw9mZYaVWKX6pq
         MjA9zX0bQ6MN9xtfmQAwwOoAVxwvDZX/FW7bvaC+iQXIgLHrxQ1+nhsdrN3Cu8zrkFW4
         xI0iTmocXjbHdHli4ZPez5+BfGoC8FFZ2n/o58WcbM0qgn/9AWn7FFdcn3ryKmo3gRUE
         G5+wUeb5mnH6g/gjpgRbjZ0lQ6qSySFvcSdT6NwvQ8rOQS2DQtAX5km/WQCgh9MppAeZ
         l5umW0KodnQ27N1pmKnxKa3ie+dSJUEFMJpB8AP+7US5NZcHsIQXSZU1IapGMoMM+EWM
         kAWA==
X-Gm-Message-State: AOAM530B6yrjlNX0XnGoqta0GHk4jJCYa262Nb/2atDhLd9WS+pgwTeW
        h2bqWhk9U2FRcvNKjzzMbBucLhmAor3DbLANofnFWw==
X-Google-Smtp-Source: ABdhPJycBsYihQ6WLQL2DbLBiaCDD4ezOrWrW6HMoL9l4LCvH6nKVPnySRZpJBF1oivhsog0Z9+pM75cdoeYDcnTiNQ=
X-Received: by 2002:a17:906:38c7:: with SMTP id r7mr8318245ejd.118.1596783083914;
 Thu, 06 Aug 2020 23:51:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200710144520.RESEND.1.Id0f52f486e277b5af30babac8ba6b09589962a68@changeid>
 <20200710070332.GA1175842@kroah.com> <CANMq1KDcKWgyYYP_m0-WV7602g7zUbU0PPkvwXxbSTF5vFfKGQ@mail.gmail.com>
 <CANMq1KC7CgUT+neoOUZbnr8MbDgqEikqt2vn8dxAS1rpX=C2aA@mail.gmail.com> <20200807062809.GB979264@kroah.com>
In-Reply-To: <20200807062809.GB979264@kroah.com>
From:   Nicolas Boichat <drinkcat@chromium.org>
Date:   Fri, 7 Aug 2020 14:51:12 +0800
Message-ID: <CANMq1KD_hJ_ST3du7dcSd8GBtdL4d-C1pWbxXz8Wu8w79-2fUg@mail.gmail.com>
Subject: Re: [RESEND PATCH] media: atomisp: Replace trace_printk by pr_info
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        devel@driverdev.osuosl.org, lkml <linux-kernel@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Aug 7, 2020 at 2:28 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Aug 07, 2020 at 09:50:23AM +0800, Nicolas Boichat wrote:
> > On Fri, Jul 24, 2020 at 8:41 PM Nicolas Boichat <drinkcat@chromium.org> wrote:
> > >
> > > On Fri, Jul 10, 2020 at 3:03 PM Greg Kroah-Hartman
> > > <gregkh@linuxfoundation.org> wrote:
> > > >
> > > > On Fri, Jul 10, 2020 at 02:45:29PM +0800, Nicolas Boichat wrote:
> > > > > trace_printk should not be used in production code, replace it
> > > > > call with pr_info.
> > > > >
> > > > > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> > > > > ---
> > > > > Sent this before as part of a series (whose 4th patch was a
> > > > > change that allows to detect such trace_printk), but maybe it's
> > > > > easier to get individual maintainer attention by splitting it.
> > > >
> > > > Mauro should take this soon:
> > > >
> > > > Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > >
> > > Mauro: did you get a chance to look at this? (and the other similar
> > > patch "media: camss: vfe: Use trace_printk for debugging only")
> >
> > Mauro: Another gentle ping. Thanks.
>
> It's the middle of the merge window, maintainers can't do anything until
> after 5.9-rc1 is out, sorry.

Huh, wait, looks like Mauro _did_ pick it (found it in this email
"[GIT PULL for v5.8-rc7] media fixes").

My bad then, I was expecting an ack ,-)

Thanks!

> greg k-h
