Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9C2031D6F2
	for <lists+linux-media@lfdr.de>; Wed, 17 Feb 2021 10:24:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231719AbhBQJYk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Feb 2021 04:24:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:52204 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231667AbhBQJYk (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Feb 2021 04:24:40 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9CD2664E33;
        Wed, 17 Feb 2021 09:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1613553839;
        bh=FD7WhxzDm+JDUfR6hgpEBF+USlSpiOrjLGWZu2X98cI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jF0NlVSCU9pO4orJwFctgDl16Qz2q2xtNLtJz1DaP0buysksSPJFRfQZaeyvNHuJC
         bWg6BJByx2Um/j+t1QKHcL4nCqILFeEcl0KBWCZ0NTtWvCyVZbQCHShrxjkS/D1663
         kEFHpQqChcLhQHnuNstCKZ+Z5w5oZm7MHbJhrH2I=
Date:   Wed, 17 Feb 2021 10:23:56 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        peng.fan@nxp.com, kernel@collabora.com, devel@driverdev.osuosl.org,
        Anson.Huang@nxp.com, krzk@kernel.org,
        linux-rockchip@lists.infradead.org, wens@csie.org,
        linux-imx@nxp.com, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@pengutronix.de,
        s.hauer@pengutronix.de, mripard@kernel.org, robh+dt@kernel.org,
        mchehab@kernel.org, ezequiel@collabora.com,
        linux-arm-kernel@lists.infradead.org, aisheng.dong@nxp.com,
        jernej.skrabec@siol.net, adrian.ratiu@collabora.com,
        linux-kernel@vger.kernel.org, paul.kocialkowski@bootlin.com,
        p.zabel@pengutronix.de, shawnguo@kernel.org, shengjiu.wang@nxp.com
Subject: Re: [PATCH v1 00/18] Add HANTRO G2/HEVC decoder support for IMX8MQ
Message-ID: <YCzgrGr8JpUYcQ+L@kroah.com>
References: <20210217080306.157876-1-benjamin.gaignard@collabora.com>
 <YCzO7SRmBKzGeMUS@kroah.com>
 <04dfae0b-92e5-e02d-c687-ba4d28b7aaf2@collabora.com>
 <YCzVmRVL79KMkxXQ@kroah.com>
 <63b62e9e-b95f-59a4-b830-c56d2cb9e4f8@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <63b62e9e-b95f-59a4-b830-c56d2cb9e4f8@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Feb 17, 2021 at 10:10:35AM +0100, Hans Verkuil wrote:
> On 17/02/2021 09:36, Greg KH wrote:
> > On Wed, Feb 17, 2021 at 09:28:09AM +0100, Benjamin Gaignard wrote:
> >>
> >> Le 17/02/2021 à 09:08, Greg KH a écrit :
> >>> On Wed, Feb 17, 2021 at 09:02:48AM +0100, Benjamin Gaignard wrote:
> >>>> The IMX8MQ got two VPUs but until now only G1 has been enabled.
> >>>> This series aim to add the second VPU (aka G2) and provide basic
> >>>> HEVC decoding support.
> >>> Why are you adding this directly to drivers/staging/media/ and not
> >>> drivers/media/?  Why can't this just go to the main location and not
> >>> live in staging?
> >>
> >> G2/HEVC is added inside the already exiting Hantro driver, it is "just"
> >> an other codec from Hantro driver point of view.
> >> In addition of that v4l2-hevc uAPI is still unstable.
> >> One goal of this series is to have one more consumer of this v4l2-hevc
> >> uAPI so maybe we can claim it to be stable enough to move away from staging
> >> and then do the same for Hantro driver. That would be a great achievement !
> > 
> > I know I do not like seeing new additions/features/whatever being added
> > to staging drivers as that encourages people to do new stuff on them
> > without doing the real work needed to get them out of staging.
> 
> In order to support a specific codec (MPEG-2, H.264, HEVC, VP8, etc.) for
> stateless codec hardware like the hantro, V4L2 controls need to be defined.
> The contents of these controls is derived directly from the underlying codec
> standards, but it is quite difficult to get this right with the first attempt,
> since these standards are very complex.
> 
> So we went for the strategy of keeping these drivers in staging to make it
> easy to work on, while keeping the APIs for each codec private (i.e., they are
> not exposed in include/uapi/linux).
> 
> Once we have sufficient confidence in the API for a specific codec we move
> it to uapi and thus fix the API. We also renumber the control IDs at that
> time to avoid any confusion between the staging version and the final version.
> 
> We did that for H.264 and I hope we can soon do the same for MPEG-2 and VP8.
> 
> HEVC is definitely not ready for that yet.
> 
> The key phrase is 'sufficient confidence': one requirement is that it is supported
> by at least two drivers to be reasonably certain the API doesn't contain any HW
> specific stuff, and it passes test suites and review by codec experts.
> 
> All this is actively being worked on, so this is very much alive, but it is
> complex and time consuming.
> 
> > So what is preventing the existing driver from getting out of staging
> > now?
> 
> Once MPEG-2 and VP8 are finalized it is probably time to move these drivers
> out of staging, while still keeping the HEVC API part private.
> 
> > 
> > And how are you all creating new userspace apis for staging drivers to
> > the v4l layer?  What happens when you export something new and then
> > userspace starts to rely on it and then you change it?
> 
> Nothing is exported. So if userspace want to use it they have to manually
> copy headers from include/media to their application.
> 
> > 
> > Anyway, the media staging drivers are on their own, I don't touch them,
> > it just feels odd to me...
> 
> It's an unusual situation. But putting the drivers in staging and keeping
> the codec API headers private turns out to be the most effective way to
> develop this.

Ah, ok, thanks for the explaination, makes sense.

good luck!

greg k-h
