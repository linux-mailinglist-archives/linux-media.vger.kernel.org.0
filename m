Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91A9E3E28AF
	for <lists+linux-media@lfdr.de>; Fri,  6 Aug 2021 12:35:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245154AbhHFKfh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Aug 2021 06:35:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245129AbhHFKff (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Aug 2021 06:35:35 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C93BAC06179E
        for <linux-media@vger.kernel.org>; Fri,  6 Aug 2021 03:35:09 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id m28-20020a05600c3b1cb02902b5a8c22575so5569698wms.0
        for <linux-media@vger.kernel.org>; Fri, 06 Aug 2021 03:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BUCkjadlmjKZFUnw5Vqtby8GnagOFPOuERRvHUQNAsU=;
        b=aUv/rxCN0FbiqSFXVU5ULrYtsuguWLLrw9DRvWinN1SQYPbdHZMZxx/AtMQ6muirD1
         lbMAS7dT0Wgpr56FBKIHcjGWhW7/V/y/lGk8nS5vtC0eN7rwnyrS3cReKma/xOBLlbm9
         Ul0RDMl/63TaK3BAe2679XOQJdueBhRIaZIu7fUy2588/rs+vUzREJFF0If5zv84EW0l
         yyBUg7wr+kf5eLNIfBGisozjtXN1ldwD1JliUD6OQ4y24xYyLx3UcMqqQm/mO8NnIEvg
         tjuAs/v9k9df6Rg5bRZAZ8Ykk9+LIiEG/ofR4gK3ivms7tFdPTes26buBJnF/7dkfXSN
         JfSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BUCkjadlmjKZFUnw5Vqtby8GnagOFPOuERRvHUQNAsU=;
        b=PdTMcS0XEAjPh7CG0cR/O6lfqhVwd+9GNmtAOX4t6u6eiRU4JrYL/rY+uukl4vg2bT
         VWSi1AQcKrDX9tKWIoz3D9plu73Ky7By8ehWN17q68DLWwEQiamvaujSVrRQ4GqwT3ce
         ZSpKJzC8Z9jos6iregnFSoIyGqEUfTfnq5R+E8KwQkEWduZy5qqfFPfnnGsF+yX9jD3W
         mq+VB8Rt0+4+2NwO/avU2Rn52ADNq36n0AwhsOfqQLl/PKgS42nMpJZIPpOTjlhqzfFG
         R+BOSlANJJVJtZ7vbmrlXKnDHlXI9S8tqW27cZAWgIJ0CE2mbf22A+BCKvx0Jhbn/0Oi
         GilQ==
X-Gm-Message-State: AOAM532ztOvaClM8duud+e7OTnSJyiEAkHShapPZDpVYDQFB/lLoFXzu
        zAH9UCrnPsIviJp/4e7svR8Fr45aT6vmZGPtDOw/rA==
X-Google-Smtp-Source: ABdhPJwUm68KhHmviUWulg6sk+uVRPOnjOnncAmuL9E/Fle3sQn0DQSOcflpAlkw9X2xHDFjiJB+iyjRVX8FDz1Y5XM=
X-Received: by 2002:a7b:cf12:: with SMTP id l18mr19539542wmg.130.1628246108454;
 Fri, 06 Aug 2021 03:35:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210722121249.16483-1-david.plowman@raspberrypi.com>
 <20210722121249.16483-2-david.plowman@raspberrypi.com> <YQwCOBCFK9w4dvxl@pendragon.ideasonboard.com>
 <20210805154042.GE3@valkosipuli.retiisi.eu> <YQwIjW1BannEjBWg@pendragon.ideasonboard.com>
 <20210805180503.GF3@valkosipuli.retiisi.eu> <CAHW6GYJpV0gyNVLFoFbmxRQfhzTaK2DFA7R5ah-+W3U8XpkK7A@mail.gmail.com>
 <YQz0+AE29wW6phox@pendragon.ideasonboard.com>
In-Reply-To: <YQz0+AE29wW6phox@pendragon.ideasonboard.com>
From:   David Plowman <david.plowman@raspberrypi.com>
Date:   Fri, 6 Aug 2021 11:34:57 +0100
Message-ID: <CAHW6GYJNWSTmw7=rzFWpnEV0e=PqaPmV281okiMpY+Xc5RMy6g@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] media: v4l2-ctrls: Add V4L2_CID_NOTIFY_GAIN_XXX controls
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

Thanks for the reply. Yes, I agree that a fixed order (B, Gb, Gr, R)
is much easier to use, and I think that works well for the cases I'm
dealing with. I'll update the patch set accordingly and re-post it.

Best regards
David

On Fri, 6 Aug 2021 at 09:38, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi David,
>
> On Fri, Aug 06, 2021 at 09:15:09AM +0100, David Plowman wrote:
> > Hi Sakari, Laurent
> >
> > Thanks for the various comments and discussion. It did prompt me to
> > have some second thoughts about some of the details here, as follows.
> >
> > These controls are aimed specifically at sensors that do some kind of
> > on-board "demosaic / remosaic" process, for instance to produce
> > standard Bayer patterns from non-standard ones. As such the principal
> > requirement is for the sensor to know what "grey" looks like, which we
> > tell it by sending it the red and blue gains from the white balance
> > algorithm. (This obviously enables it to reduce colour aliasing during
> > the processing that it does.)
> >
> > So perhaps the comparison here should be with the existing
> > V4L2_CID_RED/BLUE_BALANCE controls. I'm not sure that it really
> > matters exactly what the colours of the pixels on the sensor really
> > are, it's knowing what "grey" looks like that is important. Any new
> > controls could be quite cumbersome to use if you have to figure out
> > what the underlying pixel arrangement looks like, it certainly feels
> > much easier to refer simply to red/blue pixels, leaving the driver to
> > deal with its own internal idiosyncrasies.
> >
> > Having said that, the particular sensor I have exposes a gain for each
> > of the four Bayer channels, even though I find myself ignoring the
> > green ones!!
> >
> > Anyway, I certainly feel I could go either way on this one - do you
> > have any more thoughts on the matter?
>
> With an array control, we would have to decide (and document) which
> components are stored in the array, and in which order. For Bayer
> sensors, that would be B, Gb, Gr and R. As for the order, there are
> three options:
>
> - fixed order (e.g. always B, Gb, Gr, R)
> - matching the sensor's CFA native order (always the same for a given
>   sensor, but varying between different sensors)
> - matching the currently configured format (the bayer pattern can change
>   when moving the crop rectangle by one pixels or when mirroring the
>   sensor readout)
>
> The last two options seem quite impractical to me. The first option, if
> we only consider Bayer sensors, is equivalent to the four controls your
> propose in the sense that the semantics is defined in the control
> specification and identical for all sensors, but with the advantage of
> bundling all four values together. It will also allow expanding this to
> other patterns if the need arise, which I think would be useful.
>
> If we were to redesign the red/blue gains, I'd go for a single array
> control today, with one value per CFA component.
>
> > On Thu, 5 Aug 2021 at 19:05, Sakari Ailus wrote:
> > > On Thu, Aug 05, 2021 at 06:49:33PM +0300, Laurent Pinchart wrote:
> > > > On Thu, Aug 05, 2021 at 06:40:42PM +0300, Sakari Ailus wrote:
> > > > > On Thu, Aug 05, 2021 at 06:22:32PM +0300, Laurent Pinchart wrote:
> > > > > > On Thu, Jul 22, 2021 at 01:12:48PM +0100, David Plowman wrote:
> > > > > > > We add new controls, one for each of the four usual Bayer channels:
> > > > > > >
> > > > > > > V4L2_CID_NOTIFY_GAIN_RED
> > > > > > > V4L2_CID_NOTIFY_GAIN_GREENR
> > > > > > > V4L2_CID_NOTIFY_GAIN_BLUE
> > > > > > > V4L2_CID_NOTIFY_GAIN_GREENB
> > > > > >
> > > > > > This will effectively limit the API to Bayer patterns. I wonder if we
> > > > > > should instead implement it as a single array control, with one element
> > > > > > per CFA component.
> > > > >
> > > > > There are other raw patterns, too. Supporting them would likely require one
> > > > > or a few more controls.
> > > > >
> > > > > That said, as the values change often it's more efficient to use a single
> > > > > control. But each colour combination (not each pattern) would require its
> > > > > own control in this case, eventually requiring more controls.
> > > >
> > > > I'm not sure to follow you. My idea is to define a single control, with
> > > > a number of elements that depends on the pattern being used, and the
> > > > order specified in the native sensor pattern. I don't think each colour
> > > > combination would then require its own control.
> > >
> > > Ah, I guess that would work, too. Then we'll need to define what kind of
> > > pixel orders are supported for that single control (and for which formats).
>
> --
> Regards,
>
> Laurent Pinchart
