Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23441186707
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 09:53:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730277AbgCPIx2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 04:53:28 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33874 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730309AbgCPIxT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 04:53:19 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7991FA3B;
        Mon, 16 Mar 2020 09:53:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584348797;
        bh=gj/vjmUaeHcV420VnIExk2fEnjReYdUmB1uPbcdWZ0U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qNvT5O9TW/66rFRLalOUxCV/GsVWFj9V6zIBfwX5/NVpuJ8DJvpEJevGuXn2BcBxf
         VTlWq40kD01u0R9pI4ZQTFENw0GkM/KNVEWbCBXS4+NfjeOZL7EsCJXSmbacJ6rWvh
         cWMxiRLEQ0A24jekl2d2XiO0TBPlnp4EgXdJtRlg=
Date:   Mon, 16 Mar 2020 10:53:12 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        Sean Young <sean@mess.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [RFC PATCH v4l-utils 0/1] Introduce the meson build system
Message-ID: <20200316085312.GN4732@pendragon.ideasonboard.com>
References: <20200315205421.28797-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200315205421.28797-1-ezequiel@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

On Sun, Mar 15, 2020 at 05:54:20PM -0300, Ezequiel Garcia wrote:
> Here's a first step towards using meson:
> 
>     https://mesonbuild.com/
> 
> As you can see, this doesn't include all tools and libraries
> (are there any libv4l1 users?), but otherwise tries to cover
> as much as possible.
> 
> I'm sending this early patch, hoping to get some reviews
> and possibly some testing.
> 
> Let me know what you think.

I like the concept :-) Is there a plan to drop autotools support ?

> Ezequiel Garcia (1):
>   Add support for meson building
> 
>  gen-version.sh                      |  36 ++++++++++
>  lib/libdvbv5/meson.build            |  87 ++++++++++++++++++++++
>  lib/libv4l2/meson.build             |  43 +++++++++++
>  lib/libv4lconvert/meson.build       |  79 ++++++++++++++++++++
>  lib/meson.build                     |   6 ++
>  meson.build                         | 108 ++++++++++++++++++++++++++++
>  meson_options.txt                   |  19 +++++
>  utils/cec-compliance/meson.build    |  39 ++++++++++
>  utils/cec-ctl/meson.build           |  33 +++++++++
>  utils/cec-follower/meson.build      |  35 +++++++++
>  utils/gen_media_bus_format_codes.sh |   7 ++
>  utils/gen_media_bus_format_names.sh |   7 ++
>  utils/ir-ctl/meson.build            |  30 ++++++++
>  utils/libcecutil/meson.build        |  46 ++++++++++++
>  utils/media-ctl/meson.build         |  35 +++++++++
>  utils/meson.build                   |  32 +++++++++
>  utils/v4l2-compliance/meson.build   |  52 ++++++++++++++
>  utils/v4l2-ctl/meson.build          |  65 +++++++++++++++++
>  version.h.in                        |   1 +
>  19 files changed, 760 insertions(+)
>  create mode 100755 gen-version.sh
>  create mode 100644 lib/libdvbv5/meson.build
>  create mode 100644 lib/libv4l2/meson.build
>  create mode 100644 lib/libv4lconvert/meson.build
>  create mode 100644 lib/meson.build
>  create mode 100644 meson.build
>  create mode 100644 meson_options.txt
>  create mode 100644 utils/cec-compliance/meson.build
>  create mode 100644 utils/cec-ctl/meson.build
>  create mode 100644 utils/cec-follower/meson.build
>  create mode 100644 utils/gen_media_bus_format_codes.sh
>  create mode 100644 utils/gen_media_bus_format_names.sh
>  create mode 100644 utils/ir-ctl/meson.build
>  create mode 100644 utils/libcecutil/meson.build
>  create mode 100644 utils/media-ctl/meson.build
>  create mode 100644 utils/meson.build
>  create mode 100644 utils/v4l2-compliance/meson.build
>  create mode 100644 utils/v4l2-ctl/meson.build
>  create mode 100644 version.h.in

-- 
Regards,

Laurent Pinchart
