Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FBB55FC26
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2019 19:02:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727094AbfGDRCo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jul 2019 13:02:44 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:53550 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725865AbfGDRCo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Jul 2019 13:02:44 -0400
Received: from [IPv6:2804:431:c7f5:f63c:d711:794d:1c68:5ed3] (unknown [IPv6:2804:431:c7f5:f63c:d711:794d:1c68:5ed3])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tonyk)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 7DE0E28B065;
        Thu,  4 Jul 2019 18:02:34 +0100 (BST)
Subject: Re: [PATCH v7 02/14] media: doc: add document for rkisp1 meta buffer
 format
To:     Helen Koike <helen.koike@collabora.com>,
        linux-rockchip@lists.infradead.org
Cc:     devicetree@vger.kernel.org, eddie.cai.linux@gmail.com,
        mchehab@kernel.org, heiko@sntech.de, jacob2.chen@rock-chips.com,
        jeffy.chen@rock-chips.com, zyc@rock-chips.com,
        linux-kernel@vger.kernel.org, tfiga@chromium.org,
        hans.verkuil@cisco.com, laurent.pinchart@ideasonboard.com,
        sakari.ailus@linux.intel.com, kernel@collabora.com,
        ezequiel@collabora.com, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, zhengsq@rock-chips.com,
        Jacob Chen <jacob-chen@rock-chips.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Guennadi Liakhovetski <g.liakhovetski@gmx.de>
References: <20190703190910.32633-1-helen.koike@collabora.com>
 <20190703190910.32633-3-helen.koike@collabora.com>
From:   =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@collabora.com>
Message-ID: <73414230-8e9a-a1f3-c121-fdd5b87cb5b2@collabora.com>
Date:   Thu, 4 Jul 2019 14:01:50 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190703190910.32633-3-helen.koike@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Helen,

On 7/3/19 4:08 PM, Helen Koike wrote:
> From: Jacob Chen <jacob2.chen@rock-chips.com>
>
> This commit add document for rkisp1 meta buffer format
>
> Signed-off-by: Jacob Chen <jacob-chen@rock-chips.com>
> Acked-by: Hans Verkuil <hans.verkuil@cisco.com>
> [update for upstream]
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
>
> ---
>
> Changes in v7:
> - s/correspond/corresponding
> - s/use/uses
> - s/docuemnt/document
>
>  Documentation/media/uapi/v4l/meta-formats.rst |  2 ++
>  .../uapi/v4l/pixfmt-meta-rkisp1-params.rst    | 20 +++++++++++++++++++
>  .../uapi/v4l/pixfmt-meta-rkisp1-stat.rst      | 18 +++++++++++++++++
>  3 files changed, 40 insertions(+)
>  create mode 100644 Documentation/media/uapi/v4l/pixfmt-meta-rkisp1-params.rst
>  create mode 100644 Documentation/media/uapi/v4l/pixfmt-meta-rkisp1-stat.rst
>
> diff --git a/Documentation/media/uapi/v4l/meta-formats.rst b/Documentation/media/uapi/v4l/meta-formats.rst
> index b10ca9ee3968..5de621fea3cc 100644
> --- a/Documentation/media/uapi/v4l/meta-formats.rst
> +++ b/Documentation/media/uapi/v4l/meta-formats.rst
> @@ -24,3 +24,5 @@ These formats are used for the :ref:`metadata` interface only.
>      pixfmt-meta-uvc
>      pixfmt-meta-vsp1-hgo
>      pixfmt-meta-vsp1-hgt
> +    pixfmt-meta-rkisp1-params
> +    pixfmt-meta-rkisp1-stat
> diff --git a/Documentation/media/uapi/v4l/pixfmt-meta-rkisp1-params.rst b/Documentation/media/uapi/v4l/pixfmt-meta-rkisp1-params.rst
> new file mode 100644
> index 000000000000..61b81331f820
> --- /dev/null
> +++ b/Documentation/media/uapi/v4l/pixfmt-meta-rkisp1-params.rst
> @@ -0,0 +1,20 @@
You can add a license information here, like this:
.. SPDX-License-Identifier: GPL-2.0
> +.. -*- coding: utf-8; mode: rst -*-
I believe it's not a good idea to include Emacs configuration in the
source [1].
> +
> +.. _v4l2-meta-fmt-rkisp1-params:
> +
> +*******************************
> +V4L2_META_FMT_RK_ISP1_PARAMS
> +*******************************
There's 3 extra `*`, keep the length of marks just as the length of the
text.
Also, for titles, you should use `=` [2] instead of `*`, like this:
=====
Title
=====
> +
> +Rockchip ISP1 Parameters Data
> +
> +Description
> +===========
> +
> +This format describes input parameters for the Rockchip ISP1.
> +
> +It uses c-struct :c:type:`rkisp1_isp_params_cfg`, which is defined in
> +the ``linux/rkisp1-config.h`` header file, see it for details.
Since the struct is already using kernel-doc syntax, you can including
in this file using something like this:
.. kernel-doc:: include/uapi/linux/rkisp1-config.h
   :functions: rkisp1_isp_params_cfg
> +
> +The parameters consist of multiple modules.
> +The module won't be updated if the corresponding bit was not set in module_*_update.
> diff --git a/Documentation/media/uapi/v4l/pixfmt-meta-rkisp1-stat.rst b/Documentation/media/uapi/v4l/pixfmt-meta-rkisp1-stat.rst
> new file mode 100644
> index 000000000000..5496e1d42273
> --- /dev/null
> +++ b/Documentation/media/uapi/v4l/pixfmt-meta-rkisp1-stat.rst
The previous feedback also applies to this file.
> @@ -0,0 +1,18 @@
> +.. -*- coding: utf-8; mode: rst -*-
> +
> +.. _v4l2-meta-fmt-rkisp1-stat:
> +
> +*******************************
> +V4L2_META_FMT_RK_ISP1_STAT_3A
> +*******************************
> +
> +Rockchip ISP1 Statistics Data
> +
> +Description
> +===========
> +
> +This format describes image color statistics information generated by the Rockchip
> +ISP1.
> +
> +It uses c-struct :c:type:`rkisp1_stat_buffer`, which is defined in
> +the ``linux/cifisp_stat.h`` header file, see it for details.
Regards,
    André

[1]
https://www.kernel.org/doc/html/latest/process/coding-style.html#editor-modelines-and-other-cruft
[2]
https://www.kernel.org/doc/html/latest/doc-guide/sphinx.html#specific-guidelines-for-the-kernel-documentation

