Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C89B1C56E
	for <lists+linux-media@lfdr.de>; Tue, 14 May 2019 10:54:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726475AbfENIyZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 May 2019 04:54:25 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:47971 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725916AbfENIyY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 May 2019 04:54:24 -0400
Received: from [IPv6:2001:420:44c1:2579:859d:cefd:f7a7:d8be] ([IPv6:2001:420:44c1:2579:859d:cefd:f7a7:d8be])
        by smtp-cloud9.xs4all.net with ESMTPA
        id QTCThNgNTsDWyQTCXhnyVt; Tue, 14 May 2019 10:54:22 +0200
Subject: Re: [PATCH v2] media/doc: Allow sizeimage to be set by v4l clients
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190412155915.16849-1-stanimir.varbanov@linaro.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <a1807c37-99cf-d1fa-bcb9-67af2935abaf@xs4all.nl>
Date:   Tue, 14 May 2019 10:54:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190412155915.16849-1-stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfAgHoK2WGMk8wobjzwGKH8h2qhPqPdWqnic4oyaXyYXoeyoRnnLK/2ARQjpyQ0xK95h8xK8IxF4BxwZrXbykNh+Z/HyS6oJ80GXvwBJ8LvBnV8Fw8XHF
 ACq78qH8Y0dRpNHTfaxSdsYrf6/81duxZvrBRrvKbGitnonfy0N/vQt0CZr1UzBlaL1OI07Tnd+BqHQkJ9KdxqLU7tRShMsibjdCk1rOi0AW69oODpX2f0wp
 FHs8oSQrapUvigEDFBBLgmjBygAqXSvgWcnhkC/mbFC2q02Ox7Vk/URo+wAfHzLMKIqD8K+H/sdBjtWaev97wVyp9KmMvYWDHsSTCpMU6mYxbpqvYIrV4zEj
 ZodYpnwiM6h0uohbDMAtI/lqKBwtLDE0nP2Yo4oWMiLtwI6UU2TqqCWDlTmlP49TPFRbYYgX64ShzBEQBXYnBjbkqD2PVQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Stanimir,

On 4/12/19 5:59 PM, Stanimir Varbanov wrote:
> This changes v4l2_pix_format and v4l2_plane_pix_format sizeimage
> field description to allow v4l clients to set bigger image size
> in case of variable length compressed data.

I've been reconsidering this change. The sizeimage value in the format
is the minimum size a buffer should have in order to store the data of
an image of the width and height as described in the format.

But there is nothing that prevents userspace from calling VIDIOC_CREATEBUFS
instead of VIDIOC_REQBUFS to allocate larger buffers.

So do we really need this change?

The more I think about this, the more uncomfortable I become with this change.

Regards,

	Hans

> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  Documentation/media/uapi/v4l/pixfmt-v4l2-mplane.rst | 13 ++++++++++++-
>  Documentation/media/uapi/v4l/pixfmt-v4l2.rst        | 11 ++++++++++-
>  2 files changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/media/uapi/v4l/pixfmt-v4l2-mplane.rst b/Documentation/media/uapi/v4l/pixfmt-v4l2-mplane.rst
> index 5688c816e334..005428a8121e 100644
> --- a/Documentation/media/uapi/v4l/pixfmt-v4l2-mplane.rst
> +++ b/Documentation/media/uapi/v4l/pixfmt-v4l2-mplane.rst
> @@ -31,7 +31,18 @@ describing all planes of that format.
>  
>      * - __u32
>        - ``sizeimage``
> -      - Maximum size in bytes required for image data in this plane.
> +      - Maximum size in bytes required for image data in this plane,
> +	set by the driver. When the image consists of variable length
> +	compressed data this is the number of bytes required by the
> +	codec to support the worst-case compression scenario.
> +
> +	For uncompressed images the driver will set the value. For
> +	variable length compressed data clients are allowed to set
> +	the sizeimage field, but the driver may ignore it and set the
> +	value itself, or it may modify the provided value based on
> +	alignment requirements or minimum/maximum size requirements.
> +	If the client wants to leave this to the driver, then it should
> +	set sizeimage to 0.
>      * - __u32
>        - ``bytesperline``
>        - Distance in bytes between the leftmost pixels in two adjacent
> diff --git a/Documentation/media/uapi/v4l/pixfmt-v4l2.rst b/Documentation/media/uapi/v4l/pixfmt-v4l2.rst
> index 71eebfc6d853..0f7771151db9 100644
> --- a/Documentation/media/uapi/v4l/pixfmt-v4l2.rst
> +++ b/Documentation/media/uapi/v4l/pixfmt-v4l2.rst
> @@ -89,7 +89,16 @@ Single-planar format structure
>        - Size in bytes of the buffer to hold a complete image, set by the
>  	driver. Usually this is ``bytesperline`` times ``height``. When
>  	the image consists of variable length compressed data this is the
> -	maximum number of bytes required to hold an image.
> +	number of bytes required by the codec to support the worst-case
> +	compression scenario.
> +
> +	For uncompressed images the driver will set the value. For
> +	variable length compressed data clients are allowed to set
> +	the sizeimage field, but the driver may ignore it and set the
> +	value itself, or it may modify the provided value based on
> +	alignment requirements or minimum/maximum size requirements.
> +	If the client wants to leave this to the driver, then it should
> +	set sizeimage to 0.
>      * - __u32
>        - ``colorspace``
>        - Image colorspace, from enum :c:type:`v4l2_colorspace`.
> 

