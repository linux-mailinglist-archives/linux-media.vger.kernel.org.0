Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FF05E0670
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2019 16:30:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727303AbfJVOa4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Oct 2019 10:30:56 -0400
Received: from mail-il1-f174.google.com ([209.85.166.174]:40762 "EHLO
        mail-il1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726955AbfJVOa4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Oct 2019 10:30:56 -0400
Received: by mail-il1-f174.google.com with SMTP id d83so7138194ilk.7
        for <linux-media@vger.kernel.org>; Tue, 22 Oct 2019 07:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tbywtOTqIJ2u/IoqmskG3drPP9isrP6ysmiEtjh32Ks=;
        b=fg4XAwMG6oEjzEH0iuC6QAkEZuRvpsO27i4fF+6oRgooq1qUtWOxtdJaRNWG7jq/dn
         jIoPzFqXrJ7g314850EURH6Gp/A7tpMlNVJ1qUBDMACbq8D5zsUWbdzFBuIqC5lMo4u4
         zx+qBgcA8CF4DZnXoQ9TixzgIVA00Rr0e6z8IoNfnAM1QijqkSfRpbh5+6zHwknhlJ5d
         OJqPV0Y1tLzYRFUJrbFWm0B/Of4XS4nOthLHCGupHf8lru6D7xcBuZ1XWyLuWXTQEceK
         Cq1SwWSvu6R+uuiLdaFgttPLa1INIwObbeaM723mcQ3enfHugm4wlmT1LOjAAnSl+58h
         m4pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tbywtOTqIJ2u/IoqmskG3drPP9isrP6ysmiEtjh32Ks=;
        b=Sds1+gPwJEEorZUwHy666J3oqFQGc8I9sG6wYUNuXG88geSAmfWmZc2HyGwqNRHJJC
         /vpPZaXWQkFcy0SINJbR5VE7SxPa2sbHP8auEcIvqezi9laaUmP7V2+ev9gpYqS4j+ZM
         qNKOfUVAOdTmztD77BOGOdNpeH5XRBkkZCbbtSobFtfDx4uUURgzLPdQQF30Q08e3Q1c
         s29R8/vFaj9iFp5ZUjYrQxxZt7YqdGfPgCbRMhlFSVzbmK9pziz3IH0wwQAqiUY4U2Hr
         RzWMT8q+SePhRXRebVh3dMGCBZUgmeIbt8GzJpqy059gdsbK4SdVTelDtW85hQhBYI4N
         vyuA==
X-Gm-Message-State: APjAAAUdWSWZunfkpH6UTL6yvEHeJzOWDuxiWtQVrpFBoatiI8U0RYX6
        MsgbHuu/vTg8/VCi6U/AgEx+4srJLtbn/R3SFPE=
X-Google-Smtp-Source: APXvYqwW5VVea/nzdYUhhY90J4SPiGQwGy83HZJcm7u1Ae2HVqHi8DocDIrq2beIns9tw89H7VpSp9V+doGDzvIadXg=
X-Received: by 2002:a92:6a04:: with SMTP id f4mr32836703ilc.205.1571754653823;
 Tue, 22 Oct 2019 07:30:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAHCN7xLQkJ=4kh+a9jcMu6DXxET5BHxz6vV1GjHkEq5LcmiiRA@mail.gmail.com>
 <CAOMZO5C2O59PJAgAvNOVDP3=Nzzyp2fRRUDa2rnY7MbESXRmOA@mail.gmail.com> <be3c6bfe36f74a055e51e5cf723090205dd0df9e.camel@pengutronix.de>
In-Reply-To: <be3c6bfe36f74a055e51e5cf723090205dd0df9e.camel@pengutronix.de>
From:   Adam Ford <aford173@gmail.com>
Date:   Tue, 22 Oct 2019 09:30:41 -0500
Message-ID: <CAHCN7x+v1QXU=xWchYUu2iii-i3TX6VL2VAO=FS7UmwLBiCvNg@mail.gmail.com>
Subject: Re: i.MX6Q + ov5640 CSI-2 Framerate (on 5.4-rc3)
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Fabio Estevam <festevam@gmail.com>,
        linux-media <linux-media@vger.kernel.org>,
        Steve Longerbeam <slongerbeam@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 21, 2019 at 3:48 AM Philipp Zabel <p.zabel@pengutronix.de> wrote:
>
> Hi Adam, Fabio,
>
> On Fri, 2019-10-18 at 16:00 -0300, Fabio Estevam wrote:
> > Hi Adam,
> >
> > Adding Steve and Philipp in case they can help.
> >
> > On Tue, Oct 15, 2019 at 1:52 AM Adam Ford <aford173@gmail.com> wrote:
> > > I have an i.MX6Q with an ov5640 connected to the mipi-csi2 interface.
> > >
> > > I am routing ov5640 -> ipu1_csi0_mux -> ip1_csi0 -> ip1_csi0 capture.
> > >
> > > I am trying to go through the steps to attempt to get 60fps at
> > > 640x480, but the best I can appear to acheive is 30fps.
> > >
> > >
> > > v4l2-ctl --all
> > >
> > > Streaming Parameters Video Capture:
> > >         Capabilities     : timeperframe
> > >         Frames per second: 30.000 (30/1)
> > >         Read buffers     : 0
> > >
> > >  I have tried setting both the ov5640 and the ipu1_csi0 to 1/60 without success.
> > >
> > > Can someone tell me if it's even possible on this platform?  When I
> > > stream the video to the HDMI monitor, I am only using 3% of the ARM,
> > > so I don't think it's processor limited.
>
> That should be possible. The sensor and dual-lane CSI-2 link can support
> 1920x1080p30 or 1280x720p60, only the driver currently limits 60 fps
> capture to 640x480.

Is that an artificial limit? Looking through the driver, it appears to
do more and more automatic calcuations to determine pixel and frame
rate.  I wonder how hard it would be
>
> The format has to be propagated through the media control graph from the
> sensor to the capture device. Since the CSI-2 receiver and multiplexers
> are not frame rate aware, the CSI has to be told the correct frame
> interval at its input.
>
> What does your configuration look like? I'd expect something like:
>
> media-ctl --set-v4l2 "'ov5640 ?-00??':0[fmt:UYVY8_1X16/640x480@1/60]"
> media-ctl --set-v4l2 "'imx6-mipi-csi2':1[fmt:UYVY8_1X16/640x480]"
> media-ctl --set-v4l2 "'ipu1_csi0_mux':2[fmt:UYVY8_1X16/640x480]"
> media-ctl --set-v4l2 "'ipu1_csi0':0[fmt:UYVY8_1X16/640x480@1/60]"
> media-ctl --set-v4l2 "'ipu1_csi0':2[fmt:AYUV32/960x540@1/60]"

Thanks for the suggestion.  I was missing the entry for "'ipu1_csi0':0
 I only listed the "'ipu1_csi0':2

It's working now.

Sorry for the noise.

adam
>
> What is the output of "media-ctl --print-topology"?
>
> regards
> Philipp
>
