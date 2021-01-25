Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7936A3048A7
	for <lists+linux-media@lfdr.de>; Tue, 26 Jan 2021 20:33:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388415AbhAZFoZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jan 2021 00:44:25 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:59297 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727355AbhAYKPG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Jan 2021 05:15:06 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 3yqClT3gRiWRg3yqFlfogV; Mon, 25 Jan 2021 11:11:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1611569487; bh=iHjqjC1dPct1fusIaq3KcBt0B0WlEHCalPEjGV1Ps7M=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=p3zqztYL2ccY2ClDM+4msMNkOFX+1M6x1CZMwLN4s534L0apVn8tpoKeU/nHCHMLT
         3K+QQgFvV5qUTiZkJmZA0r0kG9FxzlsJVzS+fsM3/xCQ6iEB3hqvbBOka8xRAgL6dr
         099EJ69oOevCeOhB2Z/rVSZRDBu00Y0tpdJ/4aFiZWnAFy8SWI395xii7Q6pshpJJn
         WoyJ2pkbgUqJl+2G+OXMw6dM9uCRibNqSeuK4B56DuF7Nf6G73jJf6qZTjV4putdUo
         A7E3Q3emJ70+/0gbVGOkBm9tj5gVxAp/nTKepQ+2xvBEOUOjBUqSq24mxLTodSnl+m
         GvX83ysYzpiBQ==
Subject: Re: [PATCH v4 2/5] docs: Document colorimetry class
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20210120092606.3987207-1-stanimir.varbanov@linaro.org>
 <20210120092606.3987207-3-stanimir.varbanov@linaro.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <ca570ca5-356d-1b89-8653-476d27375519@xs4all.nl>
Date:   Mon, 25 Jan 2021 11:11:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210120092606.3987207-3-stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfAcnFOLmq7LGmgbbdP/0yyr6VBQ9i/0oZ0u5hJVj+076zYK7C6jHVnd+YoxwGdQw4pklzUDaTGIle8v0p5+bPrGGHChXwB+1TauPPNN2cPLyt0ExOONG
 wmLEB4gm03w82zD/P4mPtBg2CNLeEwQReG1SvN1JsvRomfTS0L2LdpWpF0IbSnHcFBEtxhXNddBpfX7pCqZ5qo3kJXTmC55TOHdEx6uFwBCYE+u8RJ2w7hgZ
 dY3t51xewnASo34+YkSvqVbEjwSzh3Oy+nsEVubHCkn8T6PV2dn78IIfHRSQZM0ytXJdXkiqZVblE2PoP1LisvFjscUiqnFNABtSJaUc4EfuagToBPpTHOGe
 VgCWZRQ2pOeDVPZfoqsEP69le0hh2fv+5mtJUA99qiXPiYhtuphkYQOl8gGhof+LMWW2lGhK
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 20/01/2021 10:26, Stanimir Varbanov wrote:
> Add a document for ext control colorimetry class.
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  .../userspace-api/media/v4l/common.rst        |  1 +
>  .../media/v4l/ext-ctrls-colorimetry.rst       | 19 +++++++++++++++++++
>  .../media/v4l/vidioc-g-ext-ctrls.rst          |  4 ++++
>  3 files changed, 24 insertions(+)
>  create mode 100644 Documentation/userspace-api/media/v4l/ext-ctrls-colorimetry.rst
> 
> diff --git a/Documentation/userspace-api/media/v4l/common.rst b/Documentation/userspace-api/media/v4l/common.rst
> index 8c263c5a85d8..ea0435182e44 100644
> --- a/Documentation/userspace-api/media/v4l/common.rst
> +++ b/Documentation/userspace-api/media/v4l/common.rst
> @@ -51,6 +51,7 @@ applicable to all devices.
>      ext-ctrls-fm-tx
>      ext-ctrls-fm-rx
>      ext-ctrls-detect
> +    ext-ctrls-colorimetry
>      fourcc
>      format
>      planar-apis
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-colorimetry.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-colorimetry.rst
> new file mode 100644
> index 000000000000..6b0cd2054e84
> --- /dev/null
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-colorimetry.rst
> @@ -0,0 +1,19 @@
> +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> +
> +.. _colorimetry-controls:
> +
> +*****************************
> +Colorimetry Control Reference
> +*****************************
> +
> +Below are controls within the Colorimetry control class.

This needs a bit more work since it doesn't explain anything :-)

See how it is done in other ext-ctrls-*.rst files.

Regards,

	Hans

> +
> +Colorimetry Control IDs
> +-----------------------
> +
> +.. _colorimetry-control-id:
> +
> +``V4L2_CID_COLORIMETRY_CLASS (class)``
> +    The Colorimetry class descriptor. Calling
> +    :ref:`VIDIOC_QUERYCTRL` for this control will
> +    return a description of this control class.
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> index b9c62affbb5a..8a95ebdd499a 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> @@ -394,6 +394,10 @@ still cause this situation.
>        - 0xa40000
>        - The class containing stateless codec controls. These controls are
>  	described in :ref:`codec-stateless-controls`.
> +    * - ``V4L2_CTRL_CLASS_COLORIMETRY``
> +      - 0xa50000
> +      - The class containing colorimetry controls. These controls are
> +	described in :ref:`colorimetry-controls`.
>  
>  Return Value
>  ============
> 

