Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE3A6638C24
	for <lists+linux-media@lfdr.de>; Fri, 25 Nov 2022 15:28:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229653AbiKYO2g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Nov 2022 09:28:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229633AbiKYO2f (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Nov 2022 09:28:35 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A6E5EE2B;
        Fri, 25 Nov 2022 06:28:34 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 06351622F2;
        Fri, 25 Nov 2022 14:28:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9151BC433C1;
        Fri, 25 Nov 2022 14:28:31 +0000 (UTC)
Message-ID: <de7a776e-3fb2-3631-c301-847502fc1a39@xs4all.nl>
Date:   Fri, 25 Nov 2022 15:28:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v3 3/8] media: Documentation: v4l: Add TOF class controls
Content-Language: en-US
To:     Volodymyr Kharuk <vkh@melexis.com>, linux-media@vger.kernel.org
Cc:     Andrii Kyselov <ays@melexis.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        devicetree@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>
References: <cover.1669381013.git.vkh@melexis.com>
 <01cfeb602d52456bed08c89da356474474361e73.1669381013.git.vkh@melexis.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <01cfeb602d52456bed08c89da356474474361e73.1669381013.git.vkh@melexis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 25/11/2022 14:34, Volodymyr Kharuk wrote:
> Add description about V4L2_CID_TOF_PHASE_SEQ, V4L2_CID_TOF_FMOD
> and V4L2_CID_TOF_TINT.
> Also updated MAINTAINERS with new ext-ctrls-tof file.
> 
> Signed-off-by: Volodymyr Kharuk <vkh@melexis.com>
> ---
>  .../userspace-api/media/v4l/common.rst        |  1 +
>  .../userspace-api/media/v4l/ext-ctrls-tof.rst | 35 +++++++++++++++++++
>  MAINTAINERS                                   |  7 ++++
>  3 files changed, 43 insertions(+)
>  create mode 100644 Documentation/userspace-api/media/v4l/ext-ctrls-tof.rst
> 
> diff --git a/Documentation/userspace-api/media/v4l/common.rst b/Documentation/userspace-api/media/v4l/common.rst
> index ea0435182e44..1ea79e453066 100644
> --- a/Documentation/userspace-api/media/v4l/common.rst
> +++ b/Documentation/userspace-api/media/v4l/common.rst
> @@ -52,6 +52,7 @@ applicable to all devices.
>      ext-ctrls-fm-rx
>      ext-ctrls-detect
>      ext-ctrls-colorimetry
> +    ext-ctrls-tof
>      fourcc
>      format
>      planar-apis
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-tof.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-tof.rst
> new file mode 100644
> index 000000000000..8902cc7cd47b
> --- /dev/null
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-tof.rst
> @@ -0,0 +1,35 @@
> +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> +
> +.. _tof-controls:
> +
> +***************************************
> +Time of Flight Camera Control Reference
> +***************************************
> +
> +The Time of Flight class includes controls for digital features
> +of TOF camera.

You might want to extend this description a bit and give more info
about how they work. Perhaps a link to wikipedia or something
might help too.

> +
> +.. _tof-control-id:
> +
> +Time of Flight Camera Control IDs
> +=================================
> +
> +``V4L2_CID_TOF_CLASS (class)``
> +    The TOF class descriptor. Calling :ref:`VIDIOC_QUERYCTRL` for
> +    this control will return a description of this control class.
> +
> +``V4L2_CID_TOF_PHASE_SEQ (dynamic array u16)``
> +    Change the shift between illumination and sampling for each phase
> +    in degrees. A distance/confidence picture is obtained by merging
> +    3..8 captures of the same scene using different phase shifts(some

Space before (

> +    TOF sensors use different frequency modulation).

Either: use -> use a
Or:     modulation -> modulations

It's not clear right now whether "frequency modulation" is meant to be singular
or plural.

> +
> +    The maximum array size is driver specific.
> +
> +``V4L2_CID_TOF_FMOD (dynamic array u8)``
> +    The control sets the modulation frequency(in Mhz) per each phase.

Space before (

per each phase -> for each phase

> +    The maximum array size is driver specific.

What does the maximum array size signify? The number of phases?
It's not clear from the spec (and I have to admit I know very little
about TOF sensors).

> +
> +``V4L2_CID_TOF_TINT (dynamic array u16)``
> +    The control sets the integration time(in us) per each phase.

Add space before (

per each phase -> for each phase

> +    The maximum array size is driver specific.
> diff --git a/MAINTAINERS b/MAINTAINERS
> index aa1974054fce..a2bc2ce53056 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13111,6 +13111,13 @@ S:	Supported
>  W:	http://www.melexis.com
>  F:	drivers/iio/temperature/mlx90632.c
>  
> +MELEXIS MLX7502X DRIVER
> +M:	Volodymyr Kharuk <vkh@melexis.com>
> +L:	linux-media@vger.kernel.org
> +S:	Supported
> +W:	http://www.melexis.com
> +F:	Documentation/userspace-api/media/v4l/ext-ctrls-tof.rst
> +
>  MELFAS MIP4 TOUCHSCREEN DRIVER
>  M:	Sangwon Jee <jeesw@melfas.com>
>  S:	Supported

Regards,

	Hans
