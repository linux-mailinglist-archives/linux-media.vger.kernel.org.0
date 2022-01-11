Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17ED048A6C7
	for <lists+linux-media@lfdr.de>; Tue, 11 Jan 2022 05:28:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347828AbiAKE2A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Jan 2022 23:28:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233134AbiAKE15 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Jan 2022 23:27:57 -0500
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3FE7C06173F
        for <linux-media@vger.kernel.org>; Mon, 10 Jan 2022 20:27:57 -0800 (PST)
Received: by mail-qv1-xf2d.google.com with SMTP id fq10so17245061qvb.10
        for <linux-media@vger.kernel.org>; Mon, 10 Jan 2022 20:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AlGeFwK4OuDTZTH9mvLpYhycEuSUJZzhvsLCU1k7b3k=;
        b=RZqYJU7bd0M6/PEt3H7N/hlcTg0QEx0p5t3r9RfxDm0uK2lrB+VC/M7evW2sdO/KCa
         Tas16WNlLl9uY13BtHEp8vB+gzHiY0KYa1+9C29kZk5HX6ONWZxpmij0y3Hfs/cQUoMe
         2yxc24ItGdNQs7viESXx96aGMfNtd5mXdZNtA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AlGeFwK4OuDTZTH9mvLpYhycEuSUJZzhvsLCU1k7b3k=;
        b=UG7RjQY2cH97K6lrZBCnkOmDu+Q35WKuUge0wO7GkYRs7uA6riegp6caLm48X1fYGs
         k+toAgjTx5LZCAZuuLLBy2Kw3OKoX5UThlq6qEH3DBu3pteezcq077fTaIddd2iAUL7t
         GvDZkpw8kfRkbG2BwD2C3GP09mo7lkgC0ASDXPdjcD+N9aBhL3vgrTWGLYpNrkweLfBf
         ET9QGPfaIhv3+rHvOMM4ivBcZbGAgL564jDG/OaUZX3B2h/Ccq2oDl2q3EYNzk5xzdcB
         EzllGYKWum4XLe+Ke14NGWRq7JoXOe256fyPX8Nc9hXU/hZH9qRb+EI9oTNjIgrw/zjN
         WW9w==
X-Gm-Message-State: AOAM532qvFO7KbhogC8b5hC8GzRhdTPt+JwT8Fg4M9sRnkBZObR5BQuj
        +lnV2XJ9+KTI/Q5F/dSA/0576mj+S2zKVQ==
X-Google-Smtp-Source: ABdhPJyaJHpOAnQ/YGqVmcGhgHd2W7b6MZO45jAKCjEzbX7HbvmRNAeNmlh+LqgxFnwyCihenp4wOg==
X-Received: by 2002:ad4:5cef:: with SMTP id iv15mr2478281qvb.86.1641875276324;
        Mon, 10 Jan 2022 20:27:56 -0800 (PST)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id y8sm6072767qtx.74.2022.01.10.20.27.55
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jan 2022 20:27:55 -0800 (PST)
Received: by mail-yb1-f179.google.com with SMTP id g81so16618383ybg.10
        for <linux-media@vger.kernel.org>; Mon, 10 Jan 2022 20:27:55 -0800 (PST)
X-Received: by 2002:a5b:845:: with SMTP id v5mr3926180ybq.84.1641875274794;
 Mon, 10 Jan 2022 20:27:54 -0800 (PST)
MIME-Version: 1.0
References: <1640768259-18070-1-git-send-email-bingbu.cao@intel.com>
 <YcwtTaenpE1OK0TP@paasikivi.fi.intel.com> <DM8PR11MB565373D28B23D9D36C0560EE99449@DM8PR11MB5653.namprd11.prod.outlook.com>
 <YdwZUqoXnTmlveF6@paasikivi.fi.intel.com>
In-Reply-To: <YdwZUqoXnTmlveF6@paasikivi.fi.intel.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 11 Jan 2022 13:27:40 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CqEcLOvKsOchB29KzazAUh+hK2HWbqq+67fOhS4ydqEA@mail.gmail.com>
Message-ID: <CAAFQd5CqEcLOvKsOchB29KzazAUh+hK2HWbqq+67fOhS4ydqEA@mail.gmail.com>
Subject: Re: [PATCH] media: ov5675: use group write to update digital gain
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     "Cao, Bingbu" <bingbu.cao@intel.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "Tu, ShawnX" <shawnx.tu@intel.com>,
        "senozhatsky@chromium.org" <senozhatsky@chromium.org>,
        "bingbu.cao@linux.intel.com" <bingbu.cao@linux.intel.com>,
        "Yeh, Andy" <andy.yeh@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Mon, Jan 10, 2022 at 8:32 PM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> On Wed, Dec 29, 2021 at 10:00:43AM +0000, Cao, Bingbu wrote:
> > Hi Sakari,
> >
> > Thanks for your review.
> >
> > ________________________
> > BRs,
> > Bingbu Cao
> >
> > > -----Original Message-----
> > > From: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > Sent: Wednesday, December 29, 2021 5:42 PM
> > > To: Cao, Bingbu <bingbu.cao@intel.com>
> > > Cc: linux-media@vger.kernel.org; Tu, ShawnX <shawnx.tu@intel.com>;
> > > senozhatsky@chromium.org; tfiga@chromium.org; bingbu.cao@linux.intel.com;
> > > Yeh, Andy <andy.yeh@intel.com>
> > > Subject: Re: [PATCH] media: ov5675: use group write to update digital
> > > gain
> > >
> > > Hi Bingbu,
> > >
> > > On Wed, Dec 29, 2021 at 04:57:39PM +0800, Bingbu Cao wrote:
> > > > MWB gain register are used to set gain for each mwb channel mannually.
> > > > However, it will involve some artifacts at low light environment as
> > > > gain cannot be applied to each channel synchronously. Update the
> > > > driver to use group write for digital gain to make the sure RGB
> > > > digital gain be applied together at frame boundary.
> > >
> > > How about the analogue gain and exposure time?
> > >
> > > Shouldn't they be applied similarly as well? Adding two more writes
> > > increases the probability of missing a frame there.
> >
> > We did not meet issue related to analog gain as the it was applied by only
> > 1 reg write, it looks like same issue we found on ov8856, changing to set
> > digital gain by only 1 global gain write will fix the problem.
>
> That device is different in its support for global digital gain. This patch
> sets the gain for each component separately.

That's not what the patch does. The existing code programs the 3
per-component registers separately. This patch made it happen under
one write group. It doesn't increase the likelihood of the frame
having wrong parameters - given the same timeline, before this patch,
the frame would just have an even worse, partial gain setting, while
with this patch it can either have the old or new gain.

Best regards,
Tomasz

>
> Adding more writes on a given frame increases the probability of slipping
> to the following frame. Doing the exposure and gain updates in the same
> group write would alleviate that a little.
>
> >
> > >
> > > This is of course a trick since the control framework doesn't really
> > > support this, but I think this support should be added.
> > >
> > > --
> > > Regards,
> > >
> > > Sakari Ailus
>
> --
> Sakari Ailus
