Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E761E7521A
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2019 17:07:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388845AbfGYPHB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jul 2019 11:07:01 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:46629 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388736AbfGYPHA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jul 2019 11:07:00 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id qfKYhBBeleD5bqfKchiNiG; Thu, 25 Jul 2019 17:06:59 +0200
Subject: Re: [PATCH 0/6] V4L2 core I2C/SPI code cleanup
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hans.verkuil@cisco.com>
Cc:     kernel@collabora.com, linux-media@vger.kernel.org
References: <20190715210649.31681-1-ezequiel@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <ef30e70f-25c7-b223-a050-ba7f0bd037ff@xs4all.nl>
Date:   Thu, 25 Jul 2019 17:06:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190715210649.31681-1-ezequiel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfOqdiqKN1O4PStejC8/AYIZmOqY5A94VUB1NIZLjEXsALK0Bht+WvVjK5ctPU+rF/+g1peIzloI3S21WXZLuPFRLCSCf0ttH9O1fwRAcxZhlGtnjDrQ3
 KN0WzGhdaNNEQ0UFjXtN6bvkLAh0UgwYkosLrgY1mEqJe4WW6j+CSKC4rdPp7piP8gFnAPVqdUuxIu40nApugeJ/odNt3hEQZisVu4tM7egrWE/H9blU6n+w
 9ImMX6ImvQpmrZELkVi5IF32RNFZTkGmwtSIkgMPbHE=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 7/15/19 11:06 PM, Ezequiel Garcia wrote:
> Hi Mauro, Hans:
> 
> While reading v4l2-common.c, I came across a few ifdefs
> that could be cleaned-up with some minor reorganization.
> 
> Patch 1 is just cleaning the Makefile, removing ifeq/endif
> to make it more readable.
> 
> Patch 2 merges v4l2-common.ko into videodev.ko, which
> I think it's now possible. Let me know if having
> these two modules separated serves a purpose
> I'm missing.
> 
> The rest of the patches split the I2C and SPI helpers,
> so they can be conditionally built.
> 
> There are a few checkpatch.pl issues triggered here,
> all of them belonging to the already existing code.
> Let me know if you want me to clean that as well.
> 
> The entire series should not affect any functionality,
> but just clean-up the code a bit.

This series looks good, but since you are looking in this
area anyway, can you post a follow-up patch that replaces the
BUG_ON in v4l2-i2c.c and -spi.c with a WARN_ON?

Thanks!

	Hans

> 
> Thanks,
> Eze
> 
> Ezequiel Garcia (6):
>   media: v4l2-core: Cleanup Makefile
>   media: v4l2-core: Module re-organization
>   media: v4l2-core: move spi helpers out of v4l2-common.c
>   media: v4l2-core: move i2c helpers out of v4l2-common.c
>   media: v4l2-core: introduce a helper to unregister a SPI subdev
>   media: v4l2-core: introduce a helper to unregister a I2C subdev
> 
>  drivers/media/v4l2-core/Kconfig       |   5 +
>  drivers/media/v4l2-core/Makefile      |  15 +-
>  drivers/media/v4l2-core/v4l2-common.c | 210 --------------------------
>  drivers/media/v4l2-core/v4l2-device.c |  39 +----
>  drivers/media/v4l2-core/v4l2-i2c.c    | 167 ++++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-spi.c    |  73 +++++++++
>  include/media/v4l2-common.h           | 150 +++++++++++++-----
>  7 files changed, 366 insertions(+), 293 deletions(-)
>  create mode 100644 drivers/media/v4l2-core/v4l2-i2c.c
>  create mode 100644 drivers/media/v4l2-core/v4l2-spi.c
> 

