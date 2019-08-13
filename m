Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A54518B89D
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2019 14:33:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728127AbfHMMdm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Aug 2019 08:33:42 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:39061 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727837AbfHMMdm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Aug 2019 08:33:42 -0400
Received: from [IPv6:2001:420:44c1:2579:155e:93d7:78eb:5531] ([IPv6:2001:420:44c1:2579:155e:93d7:78eb:5531])
        by smtp-cloud8.xs4all.net with ESMTPA
        id xVzdhLN7yqTdhxVzgh9hEe; Tue, 13 Aug 2019 14:33:40 +0200
Subject: Re: [PATCH 1/1] v4l: Documentation: Serial busses use parallel mbus
 codes
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
References: <20190813113011.1948-1-sakari.ailus@linux.intel.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <1131e096-98d9-1f27-8b86-431cc6d833c0@xs4all.nl>
Date:   Tue, 13 Aug 2019 14:33:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190813113011.1948-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfJBznI2gWrLRpx7VL+nW5bvAmDQZRJh7FBTpBb7Y/VM2W8gBAMRaq4XIn83j47yMy6HBhpRU39ctRQnCoATjuwJM+9GTBBmyi0gxUQyUhgosiBIp2tFa
 qFC2vSDSRhhH0uMc4JQWp4B/ezfFvxjMJSFlksw712vfmiMVGCBVrBv109K6SG03Ss/MORNboMpoDrWThnJDzHNpMuQhmAYVAT5GWkxlityNaqEOAxyKcZAc
 ne2OV9MH40wf2p40O6dYpyMiLkbhYQs8t/g0KDXyDCn54XPk6I+l8ZB5uaD4hiF5iVzcsVWAIisH0eex7p/XUHk1CH6j6t+opHXQ23ZZiWA=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/13/19 1:30 PM, Sakari Ailus wrote:
> When the support for serial busses was introduced in V4L2, it was decided
> to use the existing parallel bus media bus pixel codes to describe them.
> While this was a practical choice at the time, it necessitates choosing
> which one of the many parallel mbus pixel codes to use, for on the serial
> busses these formats are effectively all equivalent.
> 
> The practice has always been to use the pixel code that describes a bus
> that transfers a single sample per clock. Document this.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  Documentation/media/kapi/csi2.rst               | 7 +++++++
>  Documentation/media/uapi/v4l/subdev-formats.rst | 4 ++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/Documentation/media/kapi/csi2.rst b/Documentation/media/kapi/csi2.rst
> index a7e75e2eba85a..c67736a15c45b 100644
> --- a/Documentation/media/kapi/csi2.rst
> +++ b/Documentation/media/kapi/csi2.rst
> @@ -72,3 +72,10 @@ the transmitter up by using the
>  :c:type:`v4l2_subdev_core_ops`->s_power() callback. This may take
>  place either indirectly by using :c:func:`v4l2_pipeline_pm_use` or
>  directly.
> +
> +Formats
> +-------
> +
> +The media bus pixel codes document parallel formats. Should the pixel data be
> +transported over a serial bus, the media bus pixel code that describes a
> +parallel format that transfers a sample on a single clock cycle is used.
> diff --git a/Documentation/media/uapi/v4l/subdev-formats.rst b/Documentation/media/uapi/v4l/subdev-formats.rst
> index ab1a48a5ae80b..d6b8b86a6daad 100644
> --- a/Documentation/media/uapi/v4l/subdev-formats.rst
> +++ b/Documentation/media/uapi/v4l/subdev-formats.rst
> @@ -85,6 +85,10 @@ formats in memory (a raw Bayer image won't be magically converted to
>  JPEG just by storing it to memory), there is no one-to-one
>  correspondence between them.
>  
> +The media bus pixel codes document parallel formats. Should the pixel data be
> +transported over a serial bus, the media bus pixel code that describes a
> +parallel format that transfers a sample on a single clock cycle is used.

I would add an example here along the lines of using MEDIA_BUS_FMT_BGR888_1X24
instead of MEDIA_BUS_FMT_BGR888_3X8.

Possibly in csi2.rst as well.

Regards,

	Hans

> +
>  
>  Packed RGB Formats
>  ^^^^^^^^^^^^^^^^^^
> 

