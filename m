Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CAF36A4472
	for <lists+linux-media@lfdr.de>; Mon, 27 Feb 2023 15:33:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229524AbjB0Ody (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Feb 2023 09:33:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjB0Odx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Feb 2023 09:33:53 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA2E3E399
        for <linux-media@vger.kernel.org>; Mon, 27 Feb 2023 06:33:51 -0800 (PST)
Received: from pendragon.ideasonboard.com (85-76-78-34-nat.elisa-mobile.fi [85.76.78.34])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7A0EA56A;
        Mon, 27 Feb 2023 15:33:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1677508430;
        bh=q+dLmZzVhG5apCWEalyw/jYscyAiETKSk/I3vJsqd+o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DuDcoW0Iso1aiW3pEtMFiMs1g/0iHM+D7vp3MpT870y6/0fO/LvyMxFHmoCzU8ygm
         5LMpkPdxEP+BkicRQ7iSdI0IuuISyZSaEhglqFGFt7YVatNQzfh2DvPAHuYf5WwY5n
         vkqecOKy5MWwNNi81J9MpyKU1hzeH5vPPkhWAvpQ=
Date:   Mon, 27 Feb 2023 16:33:48 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [GIT PULL FOR v6.3] NXP i.MX8 ISI driver
Message-ID: <Y/y+ziovWDC6KaAR@pendragon.ideasonboard.com>
References: <Y9zZLJobSYuMwP9o@pendragon.ideasonboard.com>
 <CAHCN7xKOvmThMn3mgD_jjRrJvaszgiQdbwDbU+m+zWEZNsgn2Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHCN7xKOvmThMn3mgD_jjRrJvaszgiQdbwDbU+m+zWEZNsgn2Q@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Adam,

On Mon, Feb 27, 2023 at 07:44:24AM -0600, Adam Ford wrote:
> On Fri, Feb 3, 2023 at 4:03 AM Laurent Pinchart wrote:
> >
> > Hi Mauro,
> >
> > The following changes since commit 7120d6bfd6d0b26b49958f429701996f2d3e2c2a:
> >
> >   media: tm6000: remove deprecated driver (2023-01-22 09:57:19 +0100)
> >
> > are available in the Git repository at:
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git tags/media-imx-isi-next-20230203
> >
> > for you to fetch changes up to e8126b9f0ee306e784dfa20f5390b97d573986ae:
> >
> >   media: nxp: Add i.MX8 ISI driver (2023-02-03 11:15:18 +0200)
> 
> Please forgive my ignorance.  I've been trying to follow this, but I
> am not sure where this goes after the merge request is complete.
> Can someone point me to the right repo?

Patches first get merged to the master branch of [1], then of [2].

[1] git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
[2] git://linuxtv.org/media_tree.git

> > This is a new driver for the NXP i.MX8 ISI, found in multiple i.MX8 SoCs
> > including the i.MX8MP (which I have used for testing) and i.MX8MN. The
> > driver uses the V4L2 streams API that you have merged in the media
> > staging tree, so I've based the pull request on the latest master branch
> > of that tree.
> >
> > As the streams API is going to land in v6.3, I think it would be nice to
> > also have one user of the API in the same kernel version. Note that the
> > API isn't exposed to userspace by default, doing so requires flipping a
> > variable in v4l2-subdev.c, so we'll have a few kernel releases to test
> > and stabilize everything with multiple drivers (not that I expect
> > issues, as we've extensively tested that API over the course of multiple
> > years in at least 6 different drivers - which we'll work on upstreaming
> > of course, some of them have already been posted for review).
> >
> > ----------------------------------------------------------------
> > NXP i.MX8 ISI driver
> >
> > ----------------------------------------------------------------
> > Laurent Pinchart (2):
> >       dt-bindings: media: Add i.MX8 ISI DT bindings
> >       media: nxp: Add i.MX8 ISI driver
> >
> >  .../devicetree/bindings/media/nxp,imx8-isi.yaml    |  173 +++
> >  MAINTAINERS                                        |    7 +
> >  drivers/media/platform/nxp/Kconfig                 |    2 +
> >  drivers/media/platform/nxp/Makefile                |    1 +
> >  drivers/media/platform/nxp/imx8-isi/Kconfig        |   22 +
> >  drivers/media/platform/nxp/imx8-isi/Makefile       |    8 +
> >  .../media/platform/nxp/imx8-isi/imx8-isi-core.c    |  645 +++++++++
> >  .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  395 +++++
> >  .../platform/nxp/imx8-isi/imx8-isi-crossbar.c      |  529 +++++++
> >  .../media/platform/nxp/imx8-isi/imx8-isi-debug.c   |  109 ++
> >  drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c  |  651 +++++++++
> >  drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c |  858 +++++++++++
> >  .../media/platform/nxp/imx8-isi/imx8-isi-pipe.c    |  867 +++++++++++
> >  .../media/platform/nxp/imx8-isi/imx8-isi-regs.h    |  418 ++++++
> >  .../media/platform/nxp/imx8-isi/imx8-isi-video.c   | 1512 ++++++++++++++++++++
> >  15 files changed, 6197 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> >  create mode 100644 drivers/media/platform/nxp/imx8-isi/Kconfig
> >  create mode 100644 drivers/media/platform/nxp/imx8-isi/Makefile
> >  create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> >  create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> >  create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> >  create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-debug.c
> >  create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> >  create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> >  create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> >  create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> >  create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c

-- 
Regards,

Laurent Pinchart
