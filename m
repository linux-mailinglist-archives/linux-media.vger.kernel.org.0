Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3527A187126
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 18:30:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731590AbgCPRaS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 13:30:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:36744 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730437AbgCPRaS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 13:30:18 -0400
Received: from coco.lan (ip5f5ad4e9.dynamic.kabel-deutschland.de [95.90.212.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C05A7205ED;
        Mon, 16 Mar 2020 17:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584379817;
        bh=XzEfRGd9JhVf3bVVe/PR+Lre1rW9tPF0byvK87jMR38=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=T8KIIFvAfTnQ+bJYuEv9OZw9sc8wnqsaKydDqK6ysU2ngF0qtzEYwIUsdEkoy9D4o
         9Umar02bLRAHgGtyT6WUpRO/COW8bxHxozfFY7/mJUlRdyd/LaUkpnffZbK5y4/40R
         6XCAer1EuyoNdrW+N6J3qY6BPx7FZTT3NdiiNdHA=
Date:   Mon, 16 Mar 2020 18:30:11 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        Sean Young <sean@mess.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [RFC PATCH v4l-utils 0/1] Introduce the meson build system
Message-ID: <20200316183011.5b0c34ac@coco.lan>
In-Reply-To: <20200315205421.28797-1-ezequiel@collabora.com>
References: <20200315205421.28797-1-ezequiel@collabora.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Sun, 15 Mar 2020 17:54:20 -0300
Ezequiel Garcia <ezequiel@collabora.com> escreveu:

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

I fail to see why to change it. The autotools-based building system works,
and we don't have any bug reports related to it.

Also, we're all familiar to it.

Changing to a new system will not only be extra work from our side, in
order to learn how to use it, address any hidden bugs, etc, but also for
distro developers as they'll need to change the build dependencies on
their packages, as the building system will rely on different toolsets.



> 
> Thanks,
> 
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
> 



Thanks,
Mauro
