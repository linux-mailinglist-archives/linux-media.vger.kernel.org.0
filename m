Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 491A3CB833
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2019 12:27:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727587AbfJDK1D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Oct 2019 06:27:03 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:44737 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726669AbfJDK1D (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 4 Oct 2019 06:27:03 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id GKnaiwF1OjZ8vGKnditMxf; Fri, 04 Oct 2019 12:27:01 +0200
Subject: Re: [PATCH v9 6/8] Documentation: media: Describe
 V4L2_CID_UNIT_CELL_SIZE
To:     Ricardo Ribalda Delgado <ribalda@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20191001112421.2778-1-ribalda@kernel.org>
 <20191001112421.2778-7-ribalda@kernel.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <8ccd040e-dc1b-7664-c245-5e016c51a50d@xs4all.nl>
Date:   Fri, 4 Oct 2019 12:26:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191001112421.2778-7-ribalda@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfKkaalmlHCWFt8RgFuRR0e3v8E46lmaXVgOHzLFtuwjbs5LzpgiCfoJfolGOdtSRszzcO0+v9klZF+XENnkLRfEyZiyOst8gLvm9uKfnsmX25dJ6dIqy
 NYIRH9jre/rY5rKHhaYsppbkatNSChHpzlRQH/Jt5POmZMLaYxOImSZtt9I0anmP5VaFbRYGes2RYDH34i2jDY+rK0ZY/8LtZyt2QH/IAKuP0a8D1giZmN6h
 OF146p/FPJwwLag88IBJDuieXZ+4fSy/x9HKtXBc6HXtwgoGEhIHwgVYO0AiWmMwNXZQpOZ8jMIQwdtLyzudhw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/1/19 1:24 PM, Ricardo Ribalda Delgado wrote:
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
> index 2c3ab5796d76..033672dcb43d 100644
> --- a/Documentation/media/uapi/v4l/ext-ctrls-image-source.rst
> +++ b/Documentation/media/uapi/v4l/ext-ctrls-image-source.rst
> @@ -55,3 +55,12 @@ Image Source Control IDs
>  
>  ``V4L2_CID_TEST_PATTERN_GREENB (integer)``
>      Test pattern green (next to blue) colour component.
> +
> +``V4L2_CID_UNIT_CELL_SIZE (struct)``
> +    This control returns the unit cell size in nanometres. The struct

typo: nanometers

> +    :c:type:`v4l2_area` provides the width and the height in separated

separate

> +    fields to take into consideration asymmetric pixels and/or hardware
> +    binning.
> +    The unit cell consists of the whole area of the pixel, sensitive and
> +    non-sensitive.
> +    This control is required for automatic calibration sensors/cameras.

add 'of' after 'calibration'.

Regards,

	Hans

> 

