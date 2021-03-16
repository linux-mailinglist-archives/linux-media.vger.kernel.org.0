Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9014933D332
	for <lists+linux-media@lfdr.de>; Tue, 16 Mar 2021 12:38:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233385AbhCPLiH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Mar 2021 07:38:07 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:48789 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237341AbhCPLhh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Mar 2021 07:37:37 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id M80ul1aCB4ywlM80ylAm2I; Tue, 16 Mar 2021 12:37:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615894652; bh=aL3pUJkV+HExI5vO2vgkMwQGwfq6Cu0P4OvUQqPP0Zg=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=sWtsNEJVZtzKAK6R2PbeXyELwMtYaQsBjJTeSmuyd4oE9dZIB0KLWffNo84u0mO4O
         Z3jDklP9m7peGLU0MlUUZMrQp3z2PgrXQF7yM+YJuRc9X92KV0Wnb+Pmxw0mkVlCyy
         hUSo7dTsUCMoh2shycG2zl5yBum5GxxIU8vMzT9WsPVS3cJoVNkJuPlgNBzVWjlseS
         dNvHmEwYYLm7LrX/UbVfG1iLTwzTcQYqz5DRaixartfj1bcnI9gpSXh7v9HyzZten+
         nXVPv+U0uC/Id5D0sLxpUO4dHftRJGXCgK0plnv2McfQloMiYqWBp9C6nXQm794bWe
         hVhENGjQS3DSw==
Subject: Re: [PATCH v5 2/5] docs: Document colorimetry class
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20210209162425.3970393-1-stanimir.varbanov@linaro.org>
 <20210209162425.3970393-3-stanimir.varbanov@linaro.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <ce79ea9f-df67-8d71-c351-d2255c74d4ad@xs4all.nl>
Date:   Tue, 16 Mar 2021 12:37:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210209162425.3970393-3-stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfFCqM25jXuhmqiYskUZsqqnt1zqhdB4C6OJAD0e6rRZTNQrZe9t3Sbt8eSTSIleT7fjcxkK28h4fgnVFHVdH1Dd72BCKadanXcp6RzwjAJU8Gs5rdltI
 +eoId/qVjbNZxDlGgq82tz0s6IkqxyrYHtdNwaU0JE/91RAAzl4KpIxRJ4pyJhGYvtMgs+BZqvkQHFQEy4w4EYq0lsz2EKQ50CnU6YgUYA1Ulh8uk6uCPWo4
 J5ia7QaWfGejoF60WlBoxuF8sIxaw1FQchAMAS2rKbA/lQOesTxU+ZVTs9nNWXyncVj+fd5bFrFqwGxU4dT2itSjYUM1YDPKjdtal8reMtFh4/StqXEWml9e
 c2fLWv3Szgnh92SW0e3QC47nCHwDTX4KGVFYt3rfUykCJLrisRiLKRNybxtRaJmoOintl6Vb
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 09/02/2021 17:24, Stanimir Varbanov wrote:
> Add a document for ext control colorimetry class.
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  .../userspace-api/media/v4l/common.rst        |  1 +
>  .../media/v4l/ext-ctrls-colorimetry.rst       | 22 +++++++++++++++++++
>  .../media/v4l/vidioc-g-ext-ctrls.rst          |  4 ++++
>  3 files changed, 27 insertions(+)
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
> index 000000000000..862f78b41b32
> --- /dev/null
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-colorimetry.rst
> @@ -0,0 +1,22 @@
> +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> +
> +.. _colorimetry-controls:
> +
> +*****************************
> +Colorimetry Control Reference
> +*****************************
> +
> +The Colorimetry class includes controls for High Dynamic Range
> +imaging for representing colors in digital images and video. The
> +controls should be used for video and image encoding and decoding
> +as well as in HDMI receivers and transmitters.
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

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans
