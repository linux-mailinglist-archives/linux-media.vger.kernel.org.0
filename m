Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B3BF2BA5E0
	for <lists+linux-media@lfdr.de>; Fri, 20 Nov 2020 10:20:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727736AbgKTJUI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Nov 2020 04:20:08 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:45575 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727430AbgKTJUH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Nov 2020 04:20:07 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id g2aGk0uJblmd2g2aJkPeq9; Fri, 20 Nov 2020 10:20:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1605864004; bh=MRPzXUPzuSisLQ8dEoLBCQIMxYL23k7r8iO2AzZOc0w=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=s4IBQnk5G0fr8X1nmeosdFoOjBg1yHnjrk/xWuRhJQGRu5vYzo6aghIKkWfH5E4+g
         NJThhkTxuOL8r+AEzw5WBtdLLPrGDUlYE47axkEjh9oYEq7srl7nsdvcP8tGLFUjFk
         vmcMj7+fBNBMrqRQN2v2JVxcApk9OZTWp7GOvE/gAbOp4ZceYUBSEoAt3A6MgXjd4h
         BMmETIpXe5vqwpZdRMdxpkeMEMzM+gxIMYEcFMhhMMfHGmeYWlIYQpZD/5TXQTI25G
         /3lhiFarnLPprfRYMrrmwRh+5BL72OJEdyTSDM0uEl70H2ur9Y2a2yYHdn7m5LCxXW
         UumYjtNZCuTSg==
Subject: Re: [PATCH v3 04/13] media: Rename stateful codec control macros
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kernel@collabora.com, Jonas Karlman <jonas@kwiboo.se>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>
References: <20201118184700.331213-1-ezequiel@collabora.com>
 <20201118184700.331213-5-ezequiel@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <34641a16-73d1-3e7c-8dc6-dfb24e0a3a2d@xs4all.nl>
Date:   Fri, 20 Nov 2020 10:20:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201118184700.331213-5-ezequiel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfNmAym+M9hRwi4anQCf8XZVn05qwNmgAiohUOl/ZQm8WDOaV8txwMqxNrnofgscnbWyT4br4L96BkgYWhifcpiHQZ47PWwuySJuan4SHW43Tr0IeztaE
 fDVUr793LX0RQR/Thm0xOyf7uq4Y5bfWHri4RbBWwORq6TkHysSbkc2VOlwHPWrRPxg/1QV+fit9YhcZe9zewK+RKCVIcGc2Ac64zUr0hc5wuhYy7JvYJuEu
 D3DsYSI03f8tsJbLll6dGypZM43+6Yo9Rr/F5dLwqcBgMVsS4hlwdRFyyQ/q7fTAdzv5l7uPhWhojZppGf6hSASndMyd6/qNu8vsLc+QpPa5B1xDK/XzgJkk
 yRK55rQpYfvbNB4HGiCpO2IwXp/cjbm75s/Giemew4B6pxILYloAwPCilTNJzjjI+8pgrwX/Pj0XopqAiepPtQrQa1QIka8OvE5gcWeLXjSPl43gD4MUHG8m
 aTyoyV3z66JUqM2VfdyhGRfjfT3k2OQYK26sL0mqCYP0taCYvzlFNsz665k=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 18/11/2020 19:46, Ezequiel Garcia wrote:
> For historical reasons, stateful codec controls are named
> as {}_MPEG_{}. While we can't at this point sanely
> change all control IDs (such as V4L2_CID_MPEG_VIDEO_VP8_FRAME_HEADER),
> we can least change the more meaningful macros such as classes
> macros.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  .../userspace-api/media/v4l/dev-mem2mem.rst   |   2 +-
>  .../media/v4l/ext-ctrls-codec.rst             |   4 +-
>  .../media/v4l/extended-controls.rst           |   8 +-
>  .../media/v4l/vidioc-g-ext-ctrls.rst          |   6 +-
>  drivers/media/common/cx2341x.c                |   4 +-
>  drivers/media/platform/s5p-mfc/s5p_mfc_dec.c  |   2 +-
>  drivers/media/platform/s5p-mfc/s5p_mfc_enc.c  |   2 +-
>  drivers/media/v4l2-core/v4l2-ctrls.c          |   4 +-
>  include/media/fwht-ctrls.h                    |   2 +-
>  include/media/h264-ctrls.h                    |  16 +-
>  include/media/hevc-ctrls.h                    |  10 +-
>  include/media/mpeg2-ctrls.h                   |   4 +-
>  include/media/vp8-ctrls.h                     |   2 +-
>  include/uapi/linux/v4l2-controls.h            | 409 +++++++++---------
>  14 files changed, 242 insertions(+), 233 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/dev-mem2mem.rst b/Documentation/userspace-api/media/v4l/dev-mem2mem.rst
> index d8db46886555..7041bb3d5b8d 100644
> --- a/Documentation/userspace-api/media/v4l/dev-mem2mem.rst
> +++ b/Documentation/userspace-api/media/v4l/dev-mem2mem.rst
> @@ -32,7 +32,7 @@ file handle is visible through another file handle).
>  One of the most common memory-to-memory device is the codec. Codecs
>  are more complicated than most and require additional setup for
>  their codec parameters. This is done through codec controls.
> -See :ref:`mpeg-controls`. More details on how to use codec memory-to-memory
> +See :ref:`codec-controls`. More details on how to use codec memory-to-memory
>  devices are given in the following sections.
>  
>  .. toctree::
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index ce728c757eaf..b31c52d9b1da 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -1,6 +1,6 @@
>  .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
>  
> -.. _mpeg-controls:
> +.. _codec-controls:
>  
>  ***********************
>  Codec Control Reference
> @@ -26,7 +26,7 @@ Generic Codec Controls
>  Codec Control IDs
>  -----------------
>  
> -``V4L2_CID_MPEG_CLASS (class)``
> +``V4L2_CID_CODEC_CLASS (class)``
>      The Codec class descriptor. Calling
>      :ref:`VIDIOC_QUERYCTRL` for this control will
>      return a description of this control class. This description can be
> diff --git a/Documentation/userspace-api/media/v4l/extended-controls.rst b/Documentation/userspace-api/media/v4l/extended-controls.rst
> index 70301538d222..abec5ced748a 100644
> --- a/Documentation/userspace-api/media/v4l/extended-controls.rst
> +++ b/Documentation/userspace-api/media/v4l/extended-controls.rst
> @@ -55,8 +55,8 @@ controls in that array and a control class. Control classes are used to
>  group similar controls into a single class. For example, control class
>  ``V4L2_CTRL_CLASS_USER`` contains all user controls (i. e. all controls
>  that can also be set using the old :ref:`VIDIOC_S_CTRL <VIDIOC_G_CTRL>`
> -ioctl). Control class ``V4L2_CTRL_CLASS_MPEG`` contains all controls
> -relating to MPEG encoding, etc.
> +ioctl). Control class ``V4L2_CTRL_CLASS_CODEC`` contains all controls
> +relating to stateful codecs.

Not entirely true. Controls like V4L2_CID_MPEG_VIDEO_H264_PROFILE are valid
for both. Perhaps something like this would be better:

...contains controls relating to codecs. See :ref:... for controls specific
to stateless codecs.

>  
>  All controls in the control array must belong to the specified control
>  class. An error is returned if this is not the case.

Regards,

	Hans
