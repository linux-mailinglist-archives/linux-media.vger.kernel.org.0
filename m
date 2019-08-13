Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 295638BB12
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2019 16:04:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728774AbfHMOEm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Aug 2019 10:04:42 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:48251 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727724AbfHMOEm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Aug 2019 10:04:42 -0400
Received: from [IPv6:2001:420:44c1:2579:155e:93d7:78eb:5531] ([IPv6:2001:420:44c1:2579:155e:93d7:78eb:5531])
        by smtp-cloud8.xs4all.net with ESMTPA
        id xXPhhM0AxqTdhxXPkhA5wv; Tue, 13 Aug 2019 16:04:40 +0200
Subject: Re: [PATCH v2 1/1] v4l: Documentation: Serial busses use parallel
 mbus codes
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
References: <20190813135520.5981-1-sakari.ailus@linux.intel.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <a71cf768-c083-7bbd-a0e9-1b86e4411934@xs4all.nl>
Date:   Tue, 13 Aug 2019 16:04:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190813135520.5981-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfIdjZFhT86mDMmzG6wt8mhWI8wVO6Xsth4vdLWPtNk8JzFE26Xn1p/H6/L9Qqb0oUavCCipRLaW9G7+voY/jaihn75+7Lq9tSVVNIDJ1pzrE3S8DPNCI
 d9w3WfDrRhET6dI8mOrJJVMjraccSw2LG9r13bofmJPocelE2WuG3cS5h7q+doDlR7K5uQf/CKfcPQhq6umBSv5Js+ok2PtXYbcc4RGTHxIdnQzhJMCDM9+F
 KTfn+W7vrehnu+riHzeCLdJQJoVi2HJW9Be94Qjv3ZikWzwVoQrdd+bKUHMZDM20GA9Ckmezf0The0n9rzDzmqt3catcgr1JE4tWF7fBfLQ=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/13/19 3:55 PM, Sakari Ailus wrote:
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

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans

> ---
> since v1:
> 
> - Add an example of mbus pixel codes on serial and parallel busses.
> 
>  Documentation/media/kapi/csi2.rst               | 7 +++++++
>  Documentation/media/uapi/v4l/subdev-formats.rst | 8 ++++++++
>  2 files changed, 15 insertions(+)
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
> index ab1a48a5ae80b..7b8e17c7b68b4 100644
> --- a/Documentation/media/uapi/v4l/subdev-formats.rst
> +++ b/Documentation/media/uapi/v4l/subdev-formats.rst
> @@ -85,6 +85,14 @@ formats in memory (a raw Bayer image won't be magically converted to
>  JPEG just by storing it to memory), there is no one-to-one
>  correspondence between them.
>  
> +The media bus pixel codes document parallel formats. Should the pixel data be
> +transported over a serial bus, the media bus pixel code that describes a
> +parallel format that transfers a sample on a single clock cycle is used. For
> +instance, both MEDIA_BUS_FMT_BGR888_1X24 and MEDIA_BUS_FMT_BGR888_3X8 are used
> +on parallel busses for transferring an 8 bits per sample BGR data, whereas on
> +serial busses the data in this format is only referred to using
> +MEDIA_BUS_FMT_BGR888_1X24. This is because there is effectively only a single
> +way to transport that format on the serial busses.
>  
>  Packed RGB Formats
>  ^^^^^^^^^^^^^^^^^^
> 

