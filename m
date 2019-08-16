Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90E559008A
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2019 13:11:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727097AbfHPLLw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Aug 2019 07:11:52 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:49275 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727018AbfHPLLw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Aug 2019 07:11:52 -0400
Received: from [IPv6:2001:420:44c1:2579:f038:4b04:f67a:276f] ([IPv6:2001:420:44c1:2579:f038:4b04:f67a:276f])
        by smtp-cloud7.xs4all.net with ESMTPA
        id ya94hmyKfThuuya97hKA0u; Fri, 16 Aug 2019 13:11:49 +0200
Subject: Re: [PATCH v7 01/13] dt-bindings: connector: analog: add tv norms
 property
To:     Marco Felsch <m.felsch@pengutronix.de>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hans.verkuil@cisco.com,
        jacopo+renesas@jmondi.org, robh+dt@kernel.org,
        laurent.pinchart@ideasonboard.com
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de, Rob Herring <robh@kernel.org>
References: <20190815115747.24018-1-m.felsch@pengutronix.de>
 <20190815115747.24018-2-m.felsch@pengutronix.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <76aeaa4e-4a29-5abe-1af6-fc82958e9530@xs4all.nl>
Date:   Fri, 16 Aug 2019 13:11:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190815115747.24018-2-m.felsch@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfLo7ook/50DwPHRT6z8ItBfZUrDMLAMnQnWNv9p5NYPZfrmjyzUOlsT2i1LJx9dW+4g1loJIL4BbpOfu9JBjfcOx8dYXXibfLJeIDJeDQqRAvHbv2l5L
 20Bnwex0JuY5jV6HqSLY1STH3c4m5qWsrxRSf3sFfpOE0EuAf2BHcKgrXOaxBICFC/4aEESD0sZVX8299Y4L2+dkpF5u483BP8UkN+uYP0K0cTaTUOsyn3wV
 E4KfEF5YSefJDiun7CE/cMhI/6iwMwTVukmMo2RdX4ecixJ1JpAv9nhN1zw9V+ofY3OcaJ/swpD0dAM5rciag7NN5HZaCcSj1CDo0QNypweKHD5/FIyKlwR2
 Bj2npWLX3ne+IUF3YKcQZJkY1/DwfqCHDdtC5I8kUIWowRvcUwTf5CluRcjc4ZTY4bWTSnrv3TKrS9X4P5IhYYw7eFDr2zGSZoV9gjewBE22ptbWmXTZy9A/
 r1sYLQA29Q3qaTIFeOgmSck1tWECLGXy+MXqKjuasu9+XoelnDIjcEooDKQ2exTDynQkleg6TzXxmA/5vKuJO9pVPg9b6jR0i1Ge1/sqaH8SDM96vsXgarlh
 VV9OfiKxTnqo5jxiOibm2KNPBJpQ5HCXttvWbqPa0YlD4Np5VK7qzBfb8sNTHcj16wc=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/15/19 1:57 PM, Marco Felsch wrote:
> Some connectors no matter if in- or output supports only a limited
> range of tv norms. It doesn't matter if the hardware behind that
> connector supports more than the listed formats since the users are
> restriced by a label e.g. to plug only a camera into this connector
> which uses the PAL format.
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
> v7:
> I kept Robs r b tag because I only changed the example and extended
> TVNORM_* macros.
> 
> - fix some style issues
> - add TVNORM_NTSC, TVNORM_525_60 and TVNORM_625_50
> 
> v6:
> - tvnorms.h: use tabs instead of spaces
> - tvnorms.h: add TVNORM_PAL and TVNORM_SECAM
> - tvnorms.h: drop rarely used TVNORM_ATSC_* norms
> 
> v2-v4:
> - nothing since the patch was squashed from series [1] into this
>   series.
> ---
>  .../display/connector/analog-tv-connector.txt |  4 ++
>  include/dt-bindings/media/tvnorms.h           | 72 +++++++++++++++++++
>  2 files changed, 76 insertions(+)
>  create mode 100644 include/dt-bindings/media/tvnorms.h
> 
> diff --git a/Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt b/Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt
> index 0c0970c210ab..434e8aa0398b 100644
> --- a/Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt
> +++ b/Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt
> @@ -6,6 +6,9 @@ Required properties:
>  
>  Optional properties:
>  - label: a symbolic name for the connector
> +- tvnorms: limit the supported tv norms on a connector to the given ones else

tv -> TV

> +           all tv norms are allowed. Possible video standards are defined in

tv -> TV

And a more high-level question: I think tvnorm is a very vague name. It's a term
used in media, but what does 'norm' mean anyway? 'tv_standards' or 'video_standards'
would be a lot more descriptive.

'tvnorm' is, I think, a term used only internally in the media subsystem for no
clear reason. In the V4L2 spec it talks about 'video standard'.

Sorry for being so late with raising this issue.

> +           include/dt-bindings/media/tvnorms.h.
>  
>  Required nodes:
>  - Video port for TV input
> @@ -16,6 +19,7 @@ Example
>  tv: connector {
>  	compatible = "composite-video-connector";
>  	label = "tv";
> +	tvnorms = <(TVNORM_PAL | TVNORM_NTSC)>;
>  
>  	port {
>  		tv_connector_in: endpoint {
> diff --git a/include/dt-bindings/media/tvnorms.h b/include/dt-bindings/media/tvnorms.h
> new file mode 100644
> index 000000000000..e1275673c4d6
> --- /dev/null
> +++ b/include/dt-bindings/media/tvnorms.h
> @@ -0,0 +1,72 @@
> +/* SPDX-License-Identifier: GPL-2.0-only or X11 */
> +/*
> + * Copyright 2019 Pengutronix, Marco Felsch <kernel@pengutronix.de>
> + */
> +
> +#ifndef _DT_BINDINGS_MEDIA_TVNORMS_H
> +#define _DT_BINDINGS_MEDIA_TVNORMS_H
> +
> +/* One bit for each standard */

I would add a comment here and in videodev2.h where you mention that
the two headers should remain in sync.

> +#define TVNORM_PAL_B		0x00000001
> +#define TVNORM_PAL_B1		0x00000002
> +#define TVNORM_PAL_G		0x00000004
> +#define TVNORM_PAL_H		0x00000008
> +#define TVNORM_PAL_I		0x00000010
> +#define TVNORM_PAL_D		0x00000020
> +#define TVNORM_PAL_D1		0x00000040
> +#define TVNORM_PAL_K		0x00000080
> +
> +#define TVNORM_PAL		(TVNORM_PAL_B		| \
> +				 TVNORM_PAL_B1		| \
> +				 TVNORM_PAL_G		| \
> +				 TVNORM_PAL_H		| \
> +				 TVNORM_PAL_I		| \
> +				 TVNORM_PAL_D		| \
> +				 TVNORM_PAL_D1		| \
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
> +#define TVNORM_NTSC		(TVNORM_NTSC_M		|\
> +				 TVNORM_NTSC_M_JP	|\

Add space before \

> +				 TVNORM_NTSC_M_KR)
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
> +#define TVNORM_SECAM		(TVNORM_SECAM_B		| \
> +				 TVNORM_SECAM_D		| \
> +				 TVNORM_SECAM_G		| \
> +				 TVNORM_SECAM_H		| \
> +				 TVNORM_SECAM_K		| \
> +				 TVNORM_SECAM_K1	| \
> +				 TVNORM_SECAM_L		| \
> +				 TVNORM_SECAM_LC)
> +
> +/* Standards for Countries with 60Hz Line frequency */
> +#define TVNORM_525_60		(TVNORM_PAL_M		| \
> +				 TVNORM_PAL_60		| \
> +				 TVNORM_NTSC		| \
> +				 TVNORM_NTSC_443)
> +
> +/* Standards for Countries with 50Hz Line frequency */
> +#define TVNORM_625_50		(TVNORM_PAL		|\
> +				 TVNORM_PAL_N		|\
> +				 TVNORM_PAL_Nc		|\

Add space before \

> +				 TVNORM_SECAM)
> +
> +#endif /* _DT_BINDINGS_MEDIA_TVNORMS_H */
> 

I was also wondering if this header shouldn't be in include/dt-bindings/display/
since the bindings are also described in 'display'.

Regards,

	Hans
