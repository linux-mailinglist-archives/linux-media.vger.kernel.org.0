Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62E512C3E99
	for <lists+linux-media@lfdr.de>; Wed, 25 Nov 2020 12:00:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726034AbgKYK5z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Nov 2020 05:57:55 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:37897 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725836AbgKYK5y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Nov 2020 05:57:54 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id hsUekIvThN7XghsUhkVqgp; Wed, 25 Nov 2020 11:57:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1606301872; bh=y5z7/tFBmv+ZGDeU30eDwnxUg1FyFsmx3IxfaEZw6Ms=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=GBPqn/j4szPbWZv/BlPRZX3G/ZukbODfCSZ1reuLbxHGb1ZwErEOksuk5saI+RAsp
         QBJ2L4+0DQvC3m05BLyPJdqy3TpNFt1xV+U6zvMbYqQEvCvhAqz8BIM+Iiv6u/czwg
         Hie8hAe9lgbylbU6trQ2WX2N1AZhcx6hitXaLPQ4J45dh9B0Z7vFXVOGr9MouSPCws
         zK8ipOkYWrD7jaI3Ez8W6x8hk92jybj5S/NTJ8yawozZr9kCJRUWeFczwwwAg11eYw
         RG1ul55e3tTJNI2dDSDW/vxh4pS1Fru9CIqtbOjEDE2qNrFtxLoDGMwuGZ7WsYkRuk
         1nUWl28LJYRmA==
Subject: Re: [PATCH v4 13/13] media: docs: Move the H264 stateless codec uAPI
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kernel@collabora.com, Jonas Karlman <jonas@kwiboo.se>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>
References: <20201123144000.81310-1-ezequiel@collabora.com>
 <20201123144000.81310-14-ezequiel@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <b43ae660-c32e-8e51-a101-da3cd032e546@xs4all.nl>
Date:   Wed, 25 Nov 2020 11:57:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201123144000.81310-14-ezequiel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfNlNWy0h3yC4n495xuBxxNrVRyEzcZXfzN3wQx3ApOzgLDEuoSFAdheUAPrEOPg1rOTIOKRcRvHKkJq842qomun+a69fvomm4CT+pZ11jkLft6BL27Wt
 9VI/hSmmCyXzj2lGkUIjCAsyALSRTft77osNo3dQ+FtalN2mySwcROSWlqKor8c5btfKD8qH5g3EeWwNRS3BQKRldnQ2U3droXkatKnUCSCWKT8XLyn6We6K
 6IzaAbCiBG7+arbWvZBfJqD4H1l/70UvXIOMGcavz4DkdCIpnqbfopF6F8Bx37E8ExXLNl0BwJIUiHAHFWoaJm9taTQ5xIut7MR4SyYLWQJ1sUql5RcMoe0o
 GMdy9QOmoAXZPgoQ6gq+/M/jRdZeDL0V7PQMMnARfQvAoF9l0FLkaC+cXStXUkP0IKuTVBnsFK98rJ9PlSJFHWS0iwy3w6ct8woWLCgH0V9W9VcDifaDZWF7
 FH+hXNGqsj1Vk/Ez1Y3HKX3sAYfMo9s/67z+BWmRsYi9F+mFlHC27DZThw4=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 23/11/2020 15:40, Ezequiel Garcia wrote:
> Now that we've destaged the H264 stateless codec controls,
> and with all the pieces in place, update the documentation
> and move it to its own section.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  .../userspace-api/media/v4l/common.rst        |   1 +
>  .../media/v4l/ext-ctrls-codec-stateless.rst   | 674 +++++++++++++++++
>  .../media/v4l/ext-ctrls-codec.rst             | 692 ------------------
>  .../media/v4l/extended-controls.rst           |   3 +-
>  .../media/v4l/pixfmt-compressed.rst           |  21 +-
>  5 files changed, 685 insertions(+), 706 deletions(-)
>  create mode 100644 Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
> 
> diff --git a/Documentation/userspace-api/media/v4l/common.rst b/Documentation/userspace-api/media/v4l/common.rst
> index d84aeb703165..8c263c5a85d8 100644
> --- a/Documentation/userspace-api/media/v4l/common.rst
> +++ b/Documentation/userspace-api/media/v4l/common.rst
> @@ -44,6 +44,7 @@ applicable to all devices.
>      ext-ctrls-image-source
>      ext-ctrls-image-process
>      ext-ctrls-codec
> +    ext-ctrls-codec-stateless
>      ext-ctrls-jpeg
>      ext-ctrls-dv
>      ext-ctrls-rf-tuner
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
> new file mode 100644
> index 000000000000..ab433afe625f
> --- /dev/null
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
> @@ -0,0 +1,674 @@
> +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> +
> +.. _codec-stateless-controls:
> +
> +*********************************
> +Stateless Codec Control Reference
> +*********************************
> +
> +The Stateless Codec control class is intended to support
> +stateless decoder and encoders (i.e. hardware accelerators).
> +
> +These drivers are typically supported by the :ref:`stateless_decoder`,
> +and deal with parsed pixel formats such as V4L2_PIX_FMT_H264_SLICE.
> +
> +Stateless Codec Control ID
> +==========================
> +
> +.. _codec-stateless-control-id:
> +
> +``V4L2_CID_CODEC_STATELESS_CLASS (class)``
> +    The Codec class descriptor.

Codec ->  Stateless Codec

Regards,

	Hans
