Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACBEF1867CD
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 10:25:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730218AbgCPJZi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 05:25:38 -0400
Received: from gofer.mess.org ([88.97.38.141]:36433 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730056AbgCPJZh (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 05:25:37 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 4A01311A001; Mon, 16 Mar 2020 09:25:36 +0000 (GMT)
Date:   Mon, 16 Mar 2020 09:25:36 +0000
From:   Sean Young <sean@mess.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [RFC PATCH v4l-utils 0/1] Introduce the meson build system
Message-ID: <20200316092536.GA10923@gofer.mess.org>
References: <20200315205421.28797-1-ezequiel@collabora.com>
 <20200316085312.GN4732@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200316085312.GN4732@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

On Mon, Mar 16, 2020 at 10:53:12AM +0200, Laurent Pinchart wrote:
> On Sun, Mar 15, 2020 at 05:54:20PM -0300, Ezequiel Garcia wrote:
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
> I like the concept :-) Is there a plan to drop autotools support ?

I think it's great. I've toyed with meson in the past and liked it a lot.

Long term, supporting both meson and autotools might be a maintenance
burden.


Sean


> 
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
