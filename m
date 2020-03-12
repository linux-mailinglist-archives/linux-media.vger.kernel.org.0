Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7E0E1829C1
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2020 08:31:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388027AbgCLHbQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Mar 2020 03:31:16 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:54443 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387930AbgCLHbQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Mar 2020 03:31:16 -0400
Received: from [192.168.2.10] ([46.9.234.233])
        by smtp-cloud9.xs4all.net with ESMTPA
        id CIJBjX5Kt9Im2CIJFjigM2; Thu, 12 Mar 2020 08:31:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1583998273; bh=ckO9wc/0YsnvmvvoxJ4Iuhz855VOuIfWEB/AEfwSExM=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=XE0WGkCN8kCZzEgryF1ANA9vfFSoHWNAWFFcKdjGo+XSEeCM5HkTkp2/xXNL9j/l/
         RALQOOJJe0sE+aPDiY8aXZ879cE3SSt69lSv6tUB3uhA1WS78x7skMEs4g+A68n5fR
         2Od80X96zj7zODJJQ5ByknTf1jmRWqUSkhyxA1vk8LXNtFUw06DWqs8+KkZsjLXIQh
         ue6cZCF/J15WpxQnNpfnMiXvkgFo1J3CsSmCMephbijiCLf3KQLny9nZYmkJkAdvaS
         mo6/w/TDHsDcgyM4Zx1Hnk0j8GGrDwu+9NbSyw//PbntZAfxxDiAt0TgBCG+/v+vdc
         wFIg8VDGYYlrQ==
Subject: Re: [PATCH v2 21/22] media: docs: add an uAPI chapter for
 driver-specific stuff
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-media@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Ramesh Shanmugasundaram <rashanmu@gmail.com>,
        linux-arm-kernel@lists.infradead.org
References: <cover.1583847556.git.mchehab+huawei@kernel.org>
 <eb09422f4292b1462978abc02acf41e7630c698c.1583847557.git.mchehab+huawei@kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <7a6dc292-8051-3141-6fef-ca7b86984a10@xs4all.nl>
Date:   Thu, 12 Mar 2020 08:31:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <eb09422f4292b1462978abc02acf41e7630c698c.1583847557.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfPsT7R25rji2KSvoTUFDgjK2likkS8HQkuW9Q6huTlQdskhYF+A1hF1Mir7rt7lWB82zwyPkQcJlIdi5UFrrnYkLSO4Uf/YK4HQChkaPmXVsVUGCu2GQ
 jOLL1Rgx/a3hvlc4l7525YrkR2k/IifKmY7XLR0/oAy8L82k4C0XauHZQsnjfOzdfi1SrnklG7MTy9OpJRgiNL4qRbL1axwyz1E2QupnNvaBo6xmQBSZaCNh
 E2UYz3ZrETcFW3LGTJDPo/mjRQX0OLBdY1PpTEz3fN7lvF/2/BooMliYQxhBs87i0p1WJLL/ujZTAlFtp2rbgRQtrvVylWkCgaBFhx944kGtQwpwO1JSaYOR
 o9PE8D9rJ3LJOT3/iyCjCDX7XiTYkt6yz18tcoIQqzwh4/0LuK9vyyrwgOpVzUMwRjbjMQ4OlO2HGm5a6s2TgXFHFUFpZV96weXChLkEhfaKwqx/57MvNYpR
 mAhoaaXc9X2MRHtl70gACjIdHOE4Em3U81dF8Xi+YhURMmRZazPUQoiDH3nsmHBYDsWU5dYXE/QmTiHqWWhEVOSIe8bUMN8WW4DQDw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 3/10/20 2:43 PM, Mauro Carvalho Chehab wrote:
> There are some uAPI stuff that are driver-specific. Add them
> to the main media uAPI body.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/media/index.rst                              | 2 --
>  .../media/drivers}/cx2341x-uapi.rst                        | 0
>  .../media/drivers}/imx-uapi.rst                            | 0
>  .../v4l-drivers => userspace-api/media/drivers}/index.rst  | 7 +++----
>  .../media/drivers}/max2175.rst                             | 0
>  .../media/drivers}/meye-uapi.rst                           | 0
>  .../media/drivers}/omap3isp-uapi.rst                       | 0
>  .../media/drivers}/uvcvideo.rst                            | 0
>  Documentation/userspace-api/media/index.rst                | 2 ++
>  Documentation/userspace-api/media/v4l/dev-sliced-vbi.rst   | 2 +-
>  Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst  | 2 +-
>  Documentation/userspace-api/media/v4l/pixfmt-reserved.rst  | 2 +-
>  MAINTAINERS                                                | 4 ++--
>  drivers/media/i2c/max2175.c                                | 6 +++---
>  14 files changed, 13 insertions(+), 14 deletions(-)
>  rename Documentation/{media/v4l-drivers => userspace-api/media/drivers}/cx2341x-uapi.rst (100%)
>  rename Documentation/{media/v4l-drivers => userspace-api/media/drivers}/imx-uapi.rst (100%)
>  rename Documentation/{media/v4l-drivers => userspace-api/media/drivers}/index.rst (97%)
>  rename Documentation/{media/v4l-drivers => userspace-api/media/drivers}/max2175.rst (100%)
>  rename Documentation/{media/v4l-drivers => userspace-api/media/drivers}/meye-uapi.rst (100%)
>  rename Documentation/{media/v4l-drivers => userspace-api/media/drivers}/omap3isp-uapi.rst (100%)
>  rename Documentation/{media/v4l-drivers => userspace-api/media/drivers}/uvcvideo.rst (100%)
> 
> diff --git a/Documentation/media/index.rst b/Documentation/media/index.rst
> index a5cd600e0b04..e93fd88881af 100644
> --- a/Documentation/media/index.rst
> +++ b/Documentation/media/index.rst
> @@ -15,8 +15,6 @@ Linux Media Subsystem Documentation
>     ../userspace-api/media/index
>     ../driver-api/media/index
>  
> -   v4l-drivers/index
> -
>  .. only:: html and subproject
>  
>     Indices
> diff --git a/Documentation/media/v4l-drivers/cx2341x-uapi.rst b/Documentation/userspace-api/media/drivers/cx2341x-uapi.rst
> similarity index 100%
> rename from Documentation/media/v4l-drivers/cx2341x-uapi.rst
> rename to Documentation/userspace-api/media/drivers/cx2341x-uapi.rst
> diff --git a/Documentation/media/v4l-drivers/imx-uapi.rst b/Documentation/userspace-api/media/drivers/imx-uapi.rst
> similarity index 100%
> rename from Documentation/media/v4l-drivers/imx-uapi.rst
> rename to Documentation/userspace-api/media/drivers/imx-uapi.rst
> diff --git a/Documentation/media/v4l-drivers/index.rst b/Documentation/userspace-api/media/drivers/index.rst
> similarity index 97%
> rename from Documentation/media/v4l-drivers/index.rst
> rename to Documentation/userspace-api/media/drivers/index.rst
> index ee7faff88a33..05a82f8c0c99 100644
> --- a/Documentation/media/v4l-drivers/index.rst
> +++ b/Documentation/userspace-api/media/drivers/index.rst
> @@ -2,7 +2,7 @@
>  
>  .. include:: <isonum.txt>
>  
> -.. _v4l-drivers:
> +.. _v4l-drivers_uapi:
>  
>  ################################################
>  Video4Linux (V4L)  driver-specific documentation
> @@ -31,10 +31,9 @@ For more details see the file COPYING in the source distribution of Linux.
>  	:maxdepth: 5
>  	:numbered:
>  
> -	max2175
> -	uvcvideo
> -
>  	cx2341x-uapi
>  	imx-uapi
> +	max2175
>  	meye-uapi
>  	omap3isp-uapi
> +	uvcvideo
> diff --git a/Documentation/media/v4l-drivers/max2175.rst b/Documentation/userspace-api/media/drivers/max2175.rst
> similarity index 100%
> rename from Documentation/media/v4l-drivers/max2175.rst
> rename to Documentation/userspace-api/media/drivers/max2175.rst
> diff --git a/Documentation/media/v4l-drivers/meye-uapi.rst b/Documentation/userspace-api/media/drivers/meye-uapi.rst
> similarity index 100%
> rename from Documentation/media/v4l-drivers/meye-uapi.rst
> rename to Documentation/userspace-api/media/drivers/meye-uapi.rst
> diff --git a/Documentation/media/v4l-drivers/omap3isp-uapi.rst b/Documentation/userspace-api/media/drivers/omap3isp-uapi.rst
> similarity index 100%
> rename from Documentation/media/v4l-drivers/omap3isp-uapi.rst
> rename to Documentation/userspace-api/media/drivers/omap3isp-uapi.rst
> diff --git a/Documentation/media/v4l-drivers/uvcvideo.rst b/Documentation/userspace-api/media/drivers/uvcvideo.rst
> similarity index 100%
> rename from Documentation/media/v4l-drivers/uvcvideo.rst
> rename to Documentation/userspace-api/media/drivers/uvcvideo.rst
> diff --git a/Documentation/userspace-api/media/index.rst b/Documentation/userspace-api/media/index.rst
> index 614310f82395..bcfdd1a5caa0 100644
> --- a/Documentation/userspace-api/media/index.rst
> +++ b/Documentation/userspace-api/media/index.rst
> @@ -31,3 +31,5 @@ entitled "GNU Free Documentation License".
>      cec/cec-api
>      gen-errors
>      fdl-appendix
> +
> +    drivers/index
> diff --git a/Documentation/userspace-api/media/v4l/dev-sliced-vbi.rst b/Documentation/userspace-api/media/v4l/dev-sliced-vbi.rst
> index 751c6590e774..dd0b6646beb5 100644
> --- a/Documentation/userspace-api/media/v4l/dev-sliced-vbi.rst
> +++ b/Documentation/userspace-api/media/v4l/dev-sliced-vbi.rst
> @@ -438,7 +438,7 @@ MPEG stream.
>  *Historical context*: This format specification originates from a
>  custom, embedded, sliced VBI data format used by the ``ivtv`` driver.
>  This format has already been informally specified in the kernel sources
> -in the file ``Documentation/media/v4l-drivers/cx2341x-uapi.rst`` . The
> +in the file ``Documentation/userspace-api/media/drivers/cx2341x-uapi.rst`` . The
>  maximum size of the payload and other aspects of this format are driven
>  by the CX23415 MPEG decoder's capabilities and limitations with respect
>  to extracting, decoding, and displaying sliced VBI data embedded within
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index f81016c97a0d..9b48338fb783 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -116,7 +116,7 @@ enum v4l2_mpeg_stream_vbi_fmt -
>      * - ``V4L2_MPEG_STREAM_VBI_FMT_IVTV``
>        - VBI in private packets, IVTV format (documented in the kernel
>  	sources in the file
> -	``Documentation/media/v4l-drivers/cx2341x-uapi.rst``)
> +	``Documentation/userspace-api/media/drivers/cx2341x-uapi.rst``)

This chunk (and several others like this one) does not appear to belong to
this patch. It looks like they really should be merged with patch 19 instead.

Regards,

	Hans

>  
>  
>  
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
> index dbdcf6c9f072..59b9e7238f90 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
> @@ -58,7 +58,7 @@ please make a proposal on the linux-media mailing list.
>        - YUV 4:2:0 format used by the IVTV driver.
>  
>  	The format is documented in the kernel sources in the file
> -	``Documentation/media/v4l-drivers/cx2341x-uapi.rst``
> +	``Documentation/userspace-api/media/drivers/cx2341x-uapi.rst``
>      * .. _V4L2-PIX-FMT-CPIA1:
>  
>        - ``V4L2_PIX_FMT_CPIA1``
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cf4fd454e053..a883c2e53b86 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10135,7 +10135,7 @@ L:	linux-media@vger.kernel.org
>  T:	git git://linuxtv.org/media_tree.git
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/media/i2c/max2175.txt
> -F:	Documentation/media/v4l-drivers/max2175.rst
> +F:	Documentation/userspace-api/media/drivers/max2175.rst
>  F:	drivers/media/i2c/max2175*
>  F:	include/uapi/linux/max2175.h
>  
> @@ -11251,7 +11251,7 @@ F:	kernel/module.c
>  MOTION EYE VAIO PICTUREBOOK CAMERA DRIVER
>  W:	http://popies.net/meye/
>  S:	Orphan
> -F:	Documentation/media/v4l-drivers/meye*
> +F:	Documentation/userspace-api/media/drivers/meye*
>  F:	drivers/media/pci/meye/
>  F:	include/uapi/linux/meye.h
>  
> diff --git a/drivers/media/i2c/max2175.c b/drivers/media/i2c/max2175.c
> index 506a30e69ced..03b4ed3a61b8 100644
> --- a/drivers/media/i2c/max2175.c
> +++ b/drivers/media/i2c/max2175.c
> @@ -1194,7 +1194,7 @@ static const struct v4l2_ctrl_ops max2175_ctrl_ops = {
>  
>  /*
>   * I2S output enable/disable configuration. This is a private control.
> - * Refer to Documentation/media/v4l-drivers/max2175.rst for more details.
> + * Refer to Documentation/userspace-api/media/drivers/max2175.rst for more details.
>   */
>  static const struct v4l2_ctrl_config max2175_i2s_en = {
>  	.ops = &max2175_ctrl_ops,
> @@ -1210,7 +1210,7 @@ static const struct v4l2_ctrl_config max2175_i2s_en = {
>  
>  /*
>   * HSLS value control LO freq adjacent location configuration.
> - * Refer to Documentation/media/v4l-drivers/max2175.rst for more details.
> + * Refer to Documentation/userspace-api/media/drivers/max2175.rst for more details.
>   */
>  static const struct v4l2_ctrl_config max2175_hsls = {
>  	.ops = &max2175_ctrl_ops,
> @@ -1226,7 +1226,7 @@ static const struct v4l2_ctrl_config max2175_hsls = {
>  /*
>   * Rx modes below are a set of preset configurations that decides the tuner's
>   * sck and sample rate of transmission. They are separate for EU & NA regions.
> - * Refer to Documentation/media/v4l-drivers/max2175.rst for more details.
> + * Refer to Documentation/userspace-api/media/drivers/max2175.rst for more details.
>   */
>  static const char * const max2175_ctrl_eu_rx_modes[] = {
>  	[MAX2175_EU_FM_1_2]	= "EU FM 1.2",
> 

