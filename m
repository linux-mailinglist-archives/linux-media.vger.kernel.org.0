Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF76B18712D
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 18:32:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731537AbgCPRcI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 13:32:08 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:38770 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731136AbgCPRcI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 13:32:08 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2568A5F;
        Mon, 16 Mar 2020 18:32:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584379926;
        bh=pYlB95hTxRoxCjr3lHhXamhP/MCOsP6dN4CwnIz/AzU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QaAJB2yz1rUZoiXg+t+MJZ/ur/S+NzqgnF8G1sqTRE+8NRGDS3uzVtdegQdoA9VN3
         JVt7/h5AHHbmTxUxuXS2jmLgSVa1JvDrD4SRvUoS5q3IiNLNPCSHM+cU0SDxFpCr2g
         NHZ2ZUVs9l0jf4wh7Pk3a5gMjVB1UYja4JpoDA3g=
Date:   Mon, 16 Mar 2020 19:32:01 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        Sean Young <sean@mess.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [RFC PATCH v4l-utils 0/1] Introduce the meson build system
Message-ID: <20200316173201.GR4732@pendragon.ideasonboard.com>
References: <20200315205421.28797-1-ezequiel@collabora.com>
 <20200316183011.5b0c34ac@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200316183011.5b0c34ac@coco.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

On Mon, Mar 16, 2020 at 06:30:11PM +0100, Mauro Carvalho Chehab wrote:
> Em Sun, 15 Mar 2020 17:54:20 -0300 Ezequiel Garcia escreveu:
> > Here's a first step towards using meson:
> > 
> >     https://mesonbuild.com/
> > 
> > As you can see, this doesn't include all tools and libraries
> > (are there any libv4l1 users?), but otherwise tries to cover
> > as much as possible.
> >
> > I'm sending this early patch, hoping to get some reviews
> > and possibly some testing.
> > 
> > Let me know what you think.
> 
> I fail to see why to change it. The autotools-based building system works,
> and we don't have any bug reports related to it.
> 
> Also, we're all familiar to it.
> 
> Changing to a new system will not only be extra work from our side, in
> order to learn how to use it, address any hidden bugs, etc, but also for
> distro developers as they'll need to change the build dependencies on
> their packages, as the building system will rely on different toolsets.

Changes imply additional work as we need to get used to them, but we
need to think about the long term consequences too. meson is much
simpler to use than autotools, I think we will benefit from it in the
longer term.

> > Ezequiel Garcia (1):
> >   Add support for meson building
> > 
> >  gen-version.sh                      |  36 ++++++++++
> >  lib/libdvbv5/meson.build            |  87 ++++++++++++++++++++++
> >  lib/libv4l2/meson.build             |  43 +++++++++++
> >  lib/libv4lconvert/meson.build       |  79 ++++++++++++++++++++
> >  lib/meson.build                     |   6 ++
> >  meson.build                         | 108 ++++++++++++++++++++++++++++
> >  meson_options.txt                   |  19 +++++
> >  utils/cec-compliance/meson.build    |  39 ++++++++++
> >  utils/cec-ctl/meson.build           |  33 +++++++++
> >  utils/cec-follower/meson.build      |  35 +++++++++
> >  utils/gen_media_bus_format_codes.sh |   7 ++
> >  utils/gen_media_bus_format_names.sh |   7 ++
> >  utils/ir-ctl/meson.build            |  30 ++++++++
> >  utils/libcecutil/meson.build        |  46 ++++++++++++
> >  utils/media-ctl/meson.build         |  35 +++++++++
> >  utils/meson.build                   |  32 +++++++++
> >  utils/v4l2-compliance/meson.build   |  52 ++++++++++++++
> >  utils/v4l2-ctl/meson.build          |  65 +++++++++++++++++
> >  version.h.in                        |   1 +
> >  19 files changed, 760 insertions(+)
> >  create mode 100755 gen-version.sh
> >  create mode 100644 lib/libdvbv5/meson.build
> >  create mode 100644 lib/libv4l2/meson.build
> >  create mode 100644 lib/libv4lconvert/meson.build
> >  create mode 100644 lib/meson.build
> >  create mode 100644 meson.build
> >  create mode 100644 meson_options.txt
> >  create mode 100644 utils/cec-compliance/meson.build
> >  create mode 100644 utils/cec-ctl/meson.build
> >  create mode 100644 utils/cec-follower/meson.build
> >  create mode 100644 utils/gen_media_bus_format_codes.sh
> >  create mode 100644 utils/gen_media_bus_format_names.sh
> >  create mode 100644 utils/ir-ctl/meson.build
> >  create mode 100644 utils/libcecutil/meson.build
> >  create mode 100644 utils/media-ctl/meson.build
> >  create mode 100644 utils/meson.build
> >  create mode 100644 utils/v4l2-compliance/meson.build
> >  create mode 100644 utils/v4l2-ctl/meson.build
> >  create mode 100644 version.h.in

-- 
Regards,

Laurent Pinchart
