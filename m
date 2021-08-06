Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CD9F3E251B
	for <lists+linux-media@lfdr.de>; Fri,  6 Aug 2021 10:17:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235416AbhHFIRi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Aug 2021 04:17:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243589AbhHFIQN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Aug 2021 04:16:13 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5252FC0617B0
        for <linux-media@vger.kernel.org>; Fri,  6 Aug 2021 01:15:21 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id p5so9983129wro.7
        for <linux-media@vger.kernel.org>; Fri, 06 Aug 2021 01:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9GSsX+gUTnnK3yC2mH3+KUGQCI/VNOB6+LcnG9ZEc1g=;
        b=N1HeMJ7+UlbRFmE+8LX9Om3blmBuja1pm5/Onc3O+xTWDGKGnM/uQZHycoJ49ZSXcF
         Cau8hBPQ1y2bFoDzjG6OeApnqdsaEWVRGOS2jus3kEbXyl/Ar6sanxPoNfqEpm3Cm8yM
         NZSrA/30GKETohWvMAeoKiZLl5ArNPeod/tnjhHG96vYrqqmkSR3/jpjqoDlF77/iN9b
         lmsNHXjjApkjzgjKEl/HBB9Rn++/KPTLq7yhvisTDf/dTV03EAmg4noqA40T3VK38els
         +Hi6l5B1/SFavBc3dFt2iZBsJeojviQ+jT5345Mx6O+EH6PIQJ2emhhJvcveKOJ6K3iR
         9zjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9GSsX+gUTnnK3yC2mH3+KUGQCI/VNOB6+LcnG9ZEc1g=;
        b=kI+fyf119TRP626rXj797B2gi8BUINboIRoRhtJJKQDvhPXilsIDVOSM82Nz03nZ9C
         VOAf5oNDtHupc6gSjPe2m9hc8prModol4X2yW5JqgAKvk6tk9F5Zk9KhkH9GHJn8uVpM
         q1DplalDUELJdjJu6ZiTrKQOnjqpitPi+kKSSUmqhDsQ2m4bO5XIJ37ZOfml+RRymAG9
         ieDjwrcpHjimkHozbXrszwnBRmoF31MGsH0sHjqfD33hpN9aRkeu/J5H7JsZo4ULV17W
         KUWAhBsU+f5clVM0fpbjCEdogTygbIYJ4sh55T/ne5DWGM712ZNMHNoiLZPSwLJuWjpP
         iB+g==
X-Gm-Message-State: AOAM532HesO4rwZ8iRs/0oLpvtz33AWjXhVsUaXTGFB4fDy+iR8Hb2Nk
        6qAQYV2awz12q2/8TAF8a9znA3XXLYH06MmGfI7s5A==
X-Google-Smtp-Source: ABdhPJwhmeGcU78YHif5em5ReiFzh10vIkScDG/aazHD4EXQpB9nAvJ5mKmF0R6kCM5DqBuBNahBVQxZKTZkgCCjGZI=
X-Received: by 2002:a05:6000:186f:: with SMTP id d15mr9117486wri.89.1628237719973;
 Fri, 06 Aug 2021 01:15:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210722121249.16483-1-david.plowman@raspberrypi.com>
 <20210722121249.16483-2-david.plowman@raspberrypi.com> <YQwCOBCFK9w4dvxl@pendragon.ideasonboard.com>
 <20210805154042.GE3@valkosipuli.retiisi.eu> <YQwIjW1BannEjBWg@pendragon.ideasonboard.com>
 <20210805180503.GF3@valkosipuli.retiisi.eu>
In-Reply-To: <20210805180503.GF3@valkosipuli.retiisi.eu>
From:   David Plowman <david.plowman@raspberrypi.com>
Date:   Fri, 6 Aug 2021 09:15:09 +0100
Message-ID: <CAHW6GYJpV0gyNVLFoFbmxRQfhzTaK2DFA7R5ah-+W3U8XpkK7A@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] media: v4l2-ctrls: Add V4L2_CID_NOTIFY_GAIN_XXX controls
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari, Laurent

Thanks for the various comments and discussion. It did prompt me to
have some second thoughts about some of the details here, as follows.

These controls are aimed specifically at sensors that do some kind of
on-board "demosaic / remosaic" process, for instance to produce
standard Bayer patterns from non-standard ones. As such the principal
requirement is for the sensor to know what "grey" looks like, which we
tell it by sending it the red and blue gains from the white balance
algorithm. (This obviously enables it to reduce colour aliasing during
the processing that it does.)

So perhaps the comparison here should be with the existing
V4L2_CID_RED/BLUE_BALANCE controls. I'm not sure that it really
matters exactly what the colours of the pixels on the sensor really
are, it's knowing what "grey" looks like that is important. Any new
controls could be quite cumbersome to use if you have to figure out
what the underlying pixel arrangement looks like, it certainly feels
much easier to refer simply to red/blue pixels, leaving the driver to
deal with its own internal idiosyncrasies.

Having said that, the particular sensor I have exposes a gain for each
of the four Bayer channels, even though I find myself ignoring the
green ones!!

Anyway, I certainly feel I could go either way on this one - do you
have any more thoughts on the matter?

Thanks and best regards

David

On Thu, 5 Aug 2021 at 19:05, Sakari Ailus <sakari.ailus@iki.fi> wrote:
>
> On Thu, Aug 05, 2021 at 06:49:33PM +0300, Laurent Pinchart wrote:
> > Hi Sakari,
> >
> > On Thu, Aug 05, 2021 at 06:40:42PM +0300, Sakari Ailus wrote:
> > > On Thu, Aug 05, 2021 at 06:22:32PM +0300, Laurent Pinchart wrote:
> > > > On Thu, Jul 22, 2021 at 01:12:48PM +0100, David Plowman wrote:
> > > > > We add new controls, one for each of the four usual Bayer channels:
> > > > >
> > > > > V4L2_CID_NOTIFY_GAIN_RED
> > > > > V4L2_CID_NOTIFY_GAIN_GREENR
> > > > > V4L2_CID_NOTIFY_GAIN_BLUE
> > > > > V4L2_CID_NOTIFY_GAIN_GREENB
> > > >
> > > > This will effectively limit the API to Bayer patterns. I wonder if we
> > > > should instead implement it as a single array control, with one element
> > > > per CFA component.
> > >
> > > There are other raw patterns, too. Supporting them would likely require one
> > > or a few more controls.
> > >
> > > That said, as the values change often it's more efficient to use a single
> > > control. But each colour combination (not each pattern) would require its
> > > own control in this case, eventually requiring more controls.
> >
> > I'm not sure to follow you. My idea is to define a single control, with
> > a number of elements that depends on the pattern being used, and the
> > order specified in the native sensor pattern. I don't think each colour
> > combination would then require its own control.
>
> Ah, I guess that would work, too. Then we'll need to define what kind of
> pixel orders are supported for that single control (and for which formats).
>
> --
> Sakari Ailus
