Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55658A1556
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2019 12:02:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727021AbfH2KCV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Aug 2019 06:02:21 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:47169 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726982AbfH2KCV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Aug 2019 06:02:21 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 3HFwiQgnkDqPe3HFziNNIW; Thu, 29 Aug 2019 12:02:19 +0200
Subject: Re: [PATCH v9 01/13] dt-bindings: connector: analog: add sdtv
 standards property
To:     Marco Felsch <m.felsch@pengutronix.de>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hans.verkuil@cisco.com,
        jacopo+renesas@jmondi.org, robh+dt@kernel.org,
        laurent.pinchart@ideasonboard.com
Cc:     devicetree@vger.kernel.org, kernel@pengutronix.de,
        linux-media@vger.kernel.org
References: <20190822080556.17109-1-m.felsch@pengutronix.de>
 <20190822080556.17109-2-m.felsch@pengutronix.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <23fa2569-970e-ebf9-2116-90027123566e@xs4all.nl>
Date:   Thu, 29 Aug 2019 12:02:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190822080556.17109-2-m.felsch@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfJccuShkVuUtd5wMcXLAcIAYaWgW/fyRUSq7sJ/UFajGxF1JOwhaM8PH+rgnIYqXKzkfuOYKgy6a6y4980lFq5QQvl59LqzmAZxEzb/EyKBDl9Cn0GIU
 gouh7yZDL8skHhaylKJWV8VFcxg8XF5sU8L34NiIq9J4rJ7uR5TRV9ldQHHhL+B4tzBD2wC8PtTLligfYYiYIWqcXI10iLMefaJe3JDnJqBxYsx7hG73+CMd
 YmfFArnR8oMhOV0pk93UFA7xKHkO5IEwQQJgPyh5VayjHaY4KLQktF+r/oaeltwa+p77hCXn2q0CclBvlWJbpPangwTLPJiTGpynMADiD57a0NK3kAE5L2PK
 tiR60KKx7HzI/nWH0mNBJY1Eg1CYxNwH+T/SGGelx7MjQC5gN1bnJQWbDNKS3ldl3VT4bsAAJyBFAOD+eNCGiSMSHQkZs4X7vGEoc8+N2NyZ623wwc84dmwF
 YIUFsrrtNoSytrmsyQosg5iFLqBtaECcMM2JKg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/22/19 10:05 AM, Marco Felsch wrote:
> Some connectors no matter if in- or output supports only a limited
> range of sdtv standards. It doesn't matter if the hardware behind that
> connector supports more than the listed formats since the users are
> restriced by a label e.g. to plug only a camera into this connector
> which uses the PAL format.
> 
> This patch adds the capability to describe such limitation within the
> firmware. There are no format restrictions if the property isn't
> present, so it's completely backward compatible.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
> [1] https://patchwork.kernel.org/cover/10794703/
> 
> v8:
> Hi Rob,
> 
> I dropped your r b tag becuase of the changes I made in this version.
> Please can you have look on it again? Luckily this would be the last
> time ;-)
> 
> - move definition to include/dt-bindings/display
> - rename tvnorms.h to sdtv-standards.h
> - TVORMS_* -> SDTV_STD_*
> - add sync comments
> - adapt commit message
> - fix bindings documentation
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
>  .../display/connector/analog-tv-connector.txt |  6 ++
>  include/dt-bindings/display/sdtv-standards.h  | 76 +++++++++++++++++++
>  include/uapi/linux/videodev2.h                |  4 +
>  3 files changed, 86 insertions(+)
>  create mode 100644 include/dt-bindings/display/sdtv-standards.h
> 
> diff --git a/Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt b/Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt
> index 0c0970c210ab..883bcb2604c7 100644
> --- a/Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt
> +++ b/Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt
> @@ -6,16 +6,22 @@ Required properties:
>  
>  Optional properties:
>  - label: a symbolic name for the connector
> +- sdtv-standards: limit the supported TV standards on a connector to the given
> +                  ones. If not specified all TV standards are allowed.
> +                  Possible TV standards are defined in
> +                  include/dt-bindings/display/sdtv-standards.h.
>  
>  Required nodes:
>  - Video port for TV input
>  
>  Example
>  -------
> +#include <dt-bindings/display/sdtv-standards.h>
>  
>  tv: connector {
>  	compatible = "composite-video-connector";
>  	label = "tv";
> +	sdtv-standards = <(SDTV_STD_PAL | SDTV_STD_NTSC)>;
>  
>  	port {
>  		tv_connector_in: endpoint {
> diff --git a/include/dt-bindings/display/sdtv-standards.h b/include/dt-bindings/display/sdtv-standards.h
> new file mode 100644
> index 000000000000..bb6966505a6c
> --- /dev/null
> +++ b/include/dt-bindings/display/sdtv-standards.h
> @@ -0,0 +1,76 @@
> +/* SPDX-License-Identifier: GPL-2.0-only or X11 */
> +/*
> + * Copyright 2019 Pengutronix, Marco Felsch <kernel@pengutronix.de>
> + */
> +
> +#ifndef _DT_BINDINGS_DISPLAY_SDTV_STDS_H
> +#define _DT_BINDINGS_DISPLAY_SDTV_STDS_H
> +
> +/*
> + * Attention: Keep the TV_STD_* bit definitions in sync with

TV_STD -> SDTV_STD

> + * include/uapi/linux/videodev2.h V4L2_STD_* bit definitions.
> + */
> +/* One bit for each standard */
> +#define SDTV_STD_PAL_B		0x00000001
> +#define SDTV_STD_PAL_B1		0x00000002
> +#define SDTV_STD_PAL_G		0x00000004
> +#define SDTV_STD_PAL_H		0x00000008
> +#define SDTV_STD_PAL_I		0x00000010
> +#define SDTV_STD_PAL_D		0x00000020
> +#define SDTV_STD_PAL_D1		0x00000040
> +#define SDTV_STD_PAL_K		0x00000080
> +
> +#define SDTV_STD_PAL		(SDTV_STD_PAL_B		| \
> +				 SDTV_STD_PAL_B1	| \
> +				 SDTV_STD_PAL_G		| \
> +				 SDTV_STD_PAL_H		| \
> +				 SDTV_STD_PAL_I		| \
> +				 SDTV_STD_PAL_D		| \
> +				 SDTV_STD_PAL_D1	| \
> +				 SDTV_STD_PAL_K)
> +
> +#define SDTV_STD_PAL_M		0x00000100
> +#define SDTV_STD_PAL_N		0x00000200
> +#define SDTV_STD_PAL_Nc		0x00000400
> +#define SDTV_STD_PAL_60		0x00000800
> +
> +#define SDTV_STD_NTSC_M		0x00001000	/* BTSC */
> +#define SDTV_STD_NTSC_M_JP	0x00002000	/* EIA-J */
> +#define SDTV_STD_NTSC_443	0x00004000
> +#define SDTV_STD_NTSC_M_KR	0x00008000	/* FM A2 */
> +
> +#define SDTV_STD_NTSC		(SDTV_STD_NTSC_M	| \
> +				 SDTV_STD_NTSC_M_JP	| \
> +				 SDTV_STD_NTSC_M_KR)
> +
> +#define SDTV_STD_SECAM_B	0x00010000
> +#define SDTV_STD_SECAM_D	0x00020000
> +#define SDTV_STD_SECAM_G	0x00040000
> +#define SDTV_STD_SECAM_H	0x00080000
> +#define SDTV_STD_SECAM_K	0x00100000
> +#define SDTV_STD_SECAM_K1	0x00200000
> +#define SDTV_STD_SECAM_L	0x00400000
> +#define SDTV_STD_SECAM_LC	0x00800000
> +
> +#define SDTV_STD_SECAM		(SDTV_STD_SECAM_B	| \
> +				 SDTV_STD_SECAM_D	| \
> +				 SDTV_STD_SECAM_G	| \
> +				 SDTV_STD_SECAM_H	| \
> +				 SDTV_STD_SECAM_K	| \
> +				 SDTV_STD_SECAM_K1	| \
> +				 SDTV_STD_SECAM_L	| \
> +				 SDTV_STD_SECAM_LC)
> +
> +/* Standards for Countries with 60Hz Line frequency */
> +#define SDTV_STD_525_60		(SDTV_STD_PAL_M		| \
> +				 SDTV_STD_PAL_60	| \
> +				 SDTV_STD_NTSC		| \
> +				 SDTV_STD_NTSC_443)
> +
> +/* Standards for Countries with 50Hz Line frequency */
> +#define SDTV_STD_625_50		(SDTV_STD_PAL		| \
> +				 SDTV_STD_PAL_N		| \
> +				 SDTV_STD_PAL_Nc	| \
> +				 SDTV_STD_SECAM)
> +
> +#endif /* _DT_BINDINGS_DISPLAY_SDTV_STDS_H */
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 530638dffd93..c358cc34fc34 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -1208,6 +1208,10 @@ struct v4l2_selection {
>  
>  typedef __u64 v4l2_std_id;
>  
> +/*
> + * Attention: Keep the V4L2_STD_* bit definitions in sync with
> + * include/dt-bindings/display/sdtv-standards.h TV_STD_* bit definitions.

TV_STD -> SDTV_STD

> + */
>  /* one bit for each */
>  #define V4L2_STD_PAL_B          ((v4l2_std_id)0x00000001)
>  #define V4L2_STD_PAL_B1         ((v4l2_std_id)0x00000002)
> 

I really like this. Nice.

Regards,

	Hans
