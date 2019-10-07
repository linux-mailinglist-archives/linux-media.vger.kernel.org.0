Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C834ACE116
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 14:01:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727639AbfJGMBB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 08:01:01 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:36047 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727572AbfJGMBB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 7 Oct 2019 08:01:01 -0400
Received: from [IPv6:2001:983:e9a7:1:3d61:cdd2:8085:cc8] ([IPv6:2001:983:e9a7:1:3d61:cdd2:8085:cc8])
        by smtp-cloud7.xs4all.net with ESMTPA
        id HRhBiMLJojZ8vHRhDi6Z66; Mon, 07 Oct 2019 14:00:59 +0200
Subject: Re: [PATCH v10 6/8] Documentation: media: Describe
 V4L2_CID_UNIT_CELL_SIZE
To:     Ricardo Ribalda Delgado <ribalda@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20191007113502.11746-1-ribalda@kernel.org>
 <20191007113502.11746-7-ribalda@kernel.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <494e3061-985d-8b8e-7728-9e72442ad9f7@xs4all.nl>
Date:   Mon, 7 Oct 2019 14:00:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191007113502.11746-7-ribalda@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfJzmiJoY/+jN1X0fUHb4t8zhxe/1lKrvBjm2qZ72n0BdLjI8a8LNlHmcviAWTHyhSMA7TcwTh07iPmXYGv4UOhvsYRCr0RnE71fdzyjfJH/Ch3f5vkFN
 uMa7SYrk2ouQTBW+N9hZ+Ij5vg8McYYk0+c+Yuk6gBNUBFcjWt2rV9/h8yELoIIQXxgzKG/iH1Iij2L6JCuWh+Vsu+1eS5LGdpyZ7yhjoIO88L3pBb0ADdMM
 t4CT+A4pr0QxmiD550E/0xopB+zxZfvLuNhwq2On5iAQof/8xlWihs3+eLkX8r1yfxL+uRvBqnROr541j+7hqV/o0QDxcjOjCxwTLdhjt/UFzg3FHtVgjW9k
 717TojC50Z3MlOEjllr6HL6b8+oKmnvYQtQYHSwPQxbwj7I1a6U1zIcFMuip/6Cfh93HvHy5
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/7/19 1:35 PM, Ricardo Ribalda Delgado wrote:
> New control to pass to userspace the width/height of a pixel. Which is
> needed for calibration and lens selection.
> 
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
> ---
>  Documentation/media/uapi/v4l/ext-ctrls-image-source.rst | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/media/uapi/v4l/ext-ctrls-image-source.rst b/Documentation/media/uapi/v4l/ext-ctrls-image-source.rst
> index 2c3ab5796d76..6388668855d0 100644
> --- a/Documentation/media/uapi/v4l/ext-ctrls-image-source.rst
> +++ b/Documentation/media/uapi/v4l/ext-ctrls-image-source.rst
> @@ -55,3 +55,12 @@ Image Source Control IDs
>  
>  ``V4L2_CID_TEST_PATTERN_GREENB (integer)``
>      Test pattern green (next to blue) colour component.
> +
> +``V4L2_CID_UNIT_CELL_SIZE (struct)``
> +    This control returns the unit cell size in nanometers. The struct
> +    :c:type:`v4l2_area` provides the width and the height in separate
> +    fields to take into consideration asymmetric pixels and/or hardware
> +    binning.

This still states that this control takes binning into account. I understood that
we decided not to do that?

Regards,

	Hans

> +    The unit cell consists of the whole area of the pixel, sensitive and
> +    non-sensitive.
> +    This control is required for automatic calibration of sensors/cameras.
> 

