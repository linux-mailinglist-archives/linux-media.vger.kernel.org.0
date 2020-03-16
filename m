Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB2DF1867A9
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 10:17:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730190AbgCPJR0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 05:17:26 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:45155 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730069AbgCPJR0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 05:17:26 -0400
Received: from [192.168.2.10] ([46.9.234.233])
        by smtp-cloud7.xs4all.net with ESMTPA
        id Dls8jwqUGEE3qDlsBjdD33; Mon, 16 Mar 2020 10:17:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1584350244; bh=N5ifvUQGr+/Whqkxinbmf0fc8+z8LXfU44N7LRBgjB4=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=hOgZUB+W85UylGysOhA8saOxJ245Uqk4C8gMK1rEOQFdj1BOKYw7D0xBVVL4FZ0Yj
         zqKCBhuMhZUmpZV7HoPn9nedeiKDuPZt+nuFHB5mSFXRw4bM/q1EJWZDJg2vMQrlsf
         cTTBo/powhYKBh+Te3BexbAcR+HAhuA6sl4g2ZQgxERtSZ7EGWrmNZBL4+jWCjSiiu
         2Xr9ZNU+zNsc2IavfrEybCu9eGKyR4XWhlepneTOG7jU9Gctao2CbraYWKqvjRIqmf
         FsvzX8mPVHRgTmENHMnqivSxvZb9+aJAcV64FViXy5Ukbhnjb68saom1r+Azv1gM5E
         XAlaXRJrppIgw==
Subject: Re: [RFC PATCH v4l-utils 0/1] Introduce the meson build system
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org
Cc:     Sean Young <sean@mess.org>, Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20200315205421.28797-1-ezequiel@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <3479ebe3-1a62-f888-8b11-97ecd5b30cd2@xs4all.nl>
Date:   Mon, 16 Mar 2020 10:17:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200315205421.28797-1-ezequiel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfFNLO7rFFZ5Nqvohuq7HEurU6Uf80ryjvao94bXh46KAeiQP2sVKmHgrTllcUU4olPCdqBEKwmF/LXOjogOygvjl4z0NOiqfcT+/iHv3XRGjP6lVVJK4
 aSI3dp1cpJ60gDbaH754itfneI0QbD61YjsNZQk+qfUTbltbSQFnTNMHBcZzP++KvzRAgnwrberM+HUAGAOcrMi7ruS7EmH8NujD8R6JRGnTELmriG85Qc5D
 dWiW/SpoCIuj6RbHgTB4JOGAXJscgUwHGWIUrnyV+QyuxYneJbIii0JOCTE+azLuAE8ZMD2gdJIlIciwiF7/6A==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 3/15/20 9:54 PM, Ezequiel Garcia wrote:
> Here's a first step towards using meson:
> 
>     https://mesonbuild.com/
> 
> As you can see, this doesn't include all tools and libraries
> (are there any libv4l1 users?),

Probably yes.

 but otherwise tries to cover
> as much as possible.

Last week I added options to build 32 bit variants of v4l2-ctl and v4l2-compliance,
it will be interesting to see how meson does that.

I'm not opposed to changing over to meson, but then the old system has to be removed
either at the same time or in a second patch.

Regards,

	Hans

> 
> I'm sending this early patch, hoping to get some reviews
> and possibly some testing.
> 
> Let me know what you think.
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

