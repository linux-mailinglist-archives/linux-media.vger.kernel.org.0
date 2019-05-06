Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B946514808
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2019 12:01:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726145AbfEFKBK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 May 2019 06:01:10 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:36493 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725883AbfEFKBK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 6 May 2019 06:01:10 -0400
Received: from [IPv6:2001:983:e9a7:1:94cb:c5ca:b4e:5bdf] ([IPv6:2001:983:e9a7:1:94cb:c5ca:b4e:5bdf])
        by smtp-cloud9.xs4all.net with ESMTPA
        id NaQkhMRU0NExlNaQlhxwoc; Mon, 06 May 2019 12:01:07 +0200
Subject: Re: [PATCH v6 01/13] dt-bindings: connector: analog: add tv norms
 property
To:     Marco Felsch <m.felsch@pengutronix.de>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hans.verkuil@cisco.com,
        jacopo+renesas@jmondi.org, robh+dt@kernel.org
Cc:     laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@pengutronix.de,
        Rob Herring <robh@kernel.org>
References: <20190415124413.18456-1-m.felsch@pengutronix.de>
 <20190415124413.18456-2-m.felsch@pengutronix.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <9989034f-4794-adba-d89c-8330bbf7b27f@xs4all.nl>
Date:   Mon, 6 May 2019 12:01:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190415124413.18456-2-m.felsch@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfHVAwXQwGIyKPnPdPVut+WatJT53qt0kLayNNf75LohAtSjLxv7VMeWXwv8FQn756S66YL6P/pvgMFCZRYDrlT0xiDPvXbd/DegZVILI5uzoZmKUpnJi
 t2PCrsaKcnIligL047HwmyPvijQ//ofYrLuOTD/Juq3PGLfNiwnKVRjBFXhuB9ZIkbZziveILda9wY2FUxY8AVCIA2TnzaDzikvIE2BEWpESI+8p4eSwVRGS
 bBNqmjasNtxK8VEtaG7X8tT2zMr0UdzSggKdd7UXuqT7SQB/jM0R9gMf1vvYI3VVnqKj7Uno1qfRBcKxpYyazS4XqBfKeRASMygPu6OsHUQ5kXCGuLNbFQ8o
 vhlFGpLZI7XnDxbPGCApGERJtuTPLdBkXM5xfyZLTlLrufJsXMpDJmzSLGad7WlXu6IcrdVQKFHDJojBdn32dVkbJzh+Q5Y6IQ5s9EyyjAeTW5UQxVPb+qZF
 q8qzFLitsONmWCHMjiDKSLndBHhzLhomi6qMKifoot0yAsQZW5KDk4qkqZSh9/ePBOtUDcijWYBf9VTTR7/Znzo5Q3I7v9XOZOuVvAzS/6rCgKV3IjzBVr1I
 GX0drWwfEFhCxTpDgNJcuLPsMybEgxOEKkITnnvcZRECtw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 4/15/19 2:44 PM, Marco Felsch wrote:
> Some connectors no matter if in- or output supports only a limited
> range of tv norms. It doesn't matter if the hardware behind that
> connector supports more than the listed formats since the users are
> restriced by a label e.g. to plug only a camera into this connector
> which uses the PAL format.

For S-Video and Composite connectors there are really just two formats
to consider: 50 and 60 Hz. I.e. there is no difference between PAL
and SECAM. Only for tuners/modulators does this matter.

So it is a good idea to add TVNORM_525_60, TVNORM_625_50 to tvnorms.h.

In the various bindings examples I would recommend that you use
TVNORM_525_60 or TVNORM_625_50 rather than e.g. PAL_M since that's what
you would use in practice for Composite/S-Video.

Regards,

	Hans

> 
> This patch adds the capability to describe such limitation within the
> firmware. There are no format restrictions if the property isn't
> present, so it's completely backward compatible.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> [1] https://patchwork.kernel.org/cover/10794703/
> 
> v6:
> - tvnorms.h: use tabs instead of spaces
> - tvnorms.h: add TVNORM_PAL and TVNORM_SECAM
> - tvnorms.h: drop rarely used TVNORM_ATSC_* norms
> 
> v2-v4:
> - nothing since the patch was squashed from series [1] into this
>   series.
> 
>  .../display/connector/analog-tv-connector.txt |  4 ++
>  include/dt-bindings/media/tvnorms.h           | 56 +++++++++++++++++++
>  2 files changed, 60 insertions(+)
>  create mode 100644 include/dt-bindings/media/tvnorms.h
> 
> diff --git a/Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt b/Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt
> index 0c0970c210ab..346f8937a0b7 100644
> --- a/Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt
> +++ b/Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt
> @@ -6,6 +6,9 @@ Required properties:
>  
>  Optional properties:
>  - label: a symbolic name for the connector
> +- tvnorms: limit the supported tv norms on a connector to the given ones else
> +           all tv norms are allowed. Possible video standards are defined in
> +           include/dt-bindings/media/tvnorms.h.
>  
>  Required nodes:
>  - Video port for TV input
> @@ -16,6 +19,7 @@ Example
>  tv: connector {
>  	compatible = "composite-video-connector";
>  	label = "tv";
> +	tvnorms = <(TVNORM_PAL_M | TVNORM_NTSC_M)>;
>  
>  	port {
>  		tv_connector_in: endpoint {
> diff --git a/include/dt-bindings/media/tvnorms.h b/include/dt-bindings/media/tvnorms.h
> new file mode 100644
> index 000000000000..058ab8414145
> --- /dev/null
> +++ b/include/dt-bindings/media/tvnorms.h
> @@ -0,0 +1,56 @@
> +/* SPDX-License-Identifier: GPL-2.0-only or X11 */
> +/*
> + * Copyright 2019 Pengutronix, Marco Felsch <kernel@pengutronix.de>
> + */
> +
> +#ifndef _DT_BINDINGS_MEDIA_TVNORMS_H
> +#define _DT_BINDINGS_MEDIA_TVNORMS_H
> +
> +/* one bit for each */
> +#define TVNORM_PAL_B		0x00000001
> +#define TVNORM_PAL_B1		0x00000002
> +#define TVNORM_PAL_G		0x00000004
> +#define TVNORM_PAL_H		0x00000008
> +#define TVNORM_PAL_I		0x00000010
> +#define TVNORM_PAL_D		0x00000020
> +#define TVNORM_PAL_D1		0x00000040
> +#define TVNORM_PAL_K		0x00000080
> +
> +#define TVNORM_PAL		(TVNORM_PAL_B  | \
> +				 TVNORM_PAL_B1 | \
> +				 TVNORM_PAL_G  | \
> +				 TVNORM_PAL_H  | \
> +				 TVNORM_PAL_I  | \
> +				 TVNORM_PAL_D  | \
> +				 TVNORM_PAL_D1 | \
> +				 TVNORM_PAL_K)
> +
> +#define TVNORM_PAL_M		0x00000100
> +#define TVNORM_PAL_N		0x00000200
> +#define TVNORM_PAL_Nc		0x00000400
> +#define TVNORM_PAL_60		0x00000800
> +
> +#define TVNORM_NTSC_M		0x00001000	/* BTSC */
> +#define TVNORM_NTSC_M_JP	0x00002000	/* EIA-J */
> +#define TVNORM_NTSC_443		0x00004000
> +#define TVNORM_NTSC_M_KR	0x00008000	/* FM A2 */
> +
> +#define TVNORM_SECAM_B		0x00010000
> +#define TVNORM_SECAM_D		0x00020000
> +#define TVNORM_SECAM_G		0x00040000
> +#define TVNORM_SECAM_H		0x00080000
> +#define TVNORM_SECAM_K		0x00100000
> +#define TVNORM_SECAM_K1		0x00200000
> +#define TVNORM_SECAM_L		0x00400000
> +#define TVNORM_SECAM_LC		0x00800000
> +
> +#define TVNORM_SECAM		(TVNORM_SECAM_B  | \
> +				 TVNORM_SECAM_D  | \
> +				 TVNORM_SECAM_G  | \
> +				 TVNORM_SECAM_H  | \
> +				 TVNORM_SECAM_K  | \
> +				 TVNORM_SECAM_K1 | \
> +				 TVNORM_SECAM_L  | \
> +				 TVNORM_SECAM_LC)
> +
> +#endif /* _DT_BINDINGS_MEDIA_TVNORMS_H */
> 

