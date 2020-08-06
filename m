Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9256F23D820
	for <lists+linux-media@lfdr.de>; Thu,  6 Aug 2020 10:45:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728923AbgHFIpV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Aug 2020 04:45:21 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:33657 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727768AbgHFIpU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 Aug 2020 04:45:20 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 3bWXk7SPcuuXO3bWYknW9h; Thu, 06 Aug 2020 10:45:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1596703518; bh=S6mVY9Ie7xZPkb4dHa8bBC9Ou42RNWhyhX7m+9bBbPE=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=sQeqY0wlxAxbnhZeUzlIvL8CE05m+6q3KE3I3BSDbtPjD3hXbPajjtYqlsB7ivJUx
         0G+sq7bHYyt7yVWCdYxlZaGhq+pfEEyMKXY2rgV9Z7WDloXH7cgu7KzG5LAARtHg7e
         ZMLQmGQWS/afPgRZxN2RrqDas50bS6TI820fAE6YyXQz05lo2vATOD0akYy2mOI6Oc
         f8sdflD+pJkjDR+TS9wJOmW96In9vLKTZF5OA9/zBWZnoNpmt6eIHjXrXMwzo+JS63
         qIDiK5pKhgif88uAQ8TtYb0tiiA7SoXHYEYpS2gVXEytK1KMDl3iWj00dNxUV3fCtz
         VGbVqk6dX+eRg==
Subject: Re: [PATCH 2/4] media: docs: Describe targets for sensor properties
To:     Jacopo Mondi <jacopo@jmondi.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
        libcamera-devel@lists.libcamera.org
References: <20200805105721.15445-1-jacopo@jmondi.org>
 <20200805105721.15445-3-jacopo@jmondi.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <1896673c-ae91-84c3-9573-5da91fb00f41@xs4all.nl>
Date:   Thu, 6 Aug 2020 10:45:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200805105721.15445-3-jacopo@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfAYPW7M0u30eSlSWBanj1unuI0nDBAysDbAvnhGTsEL8oBy20GtlLUvh3fEUJ4NRNn3KZgFgEJEUpiAKBgvPKncr2QWTaRE6ERS763psWJ3JEcsMawLY
 8N4FNPgeWoL8Yxc7WsdrBxMKgspPFcgKlgmodgsy6kOe6v1FKi5e9m+ILQwgvSBUJFpNc/U66Q0SY3w0/WMQ4rG8c7rokzfpNPiNcglSqr4H4L0l+rNidRmx
 1PqiQwFqaK3wHThnksYuNBRmZXohZwzUvz5Tq61X6SZc0RcB00ctPFdI9AN9im0Y0qbp+T2kNn9+oK+kwAzNzH7D8E4iT9K4EAdg/UBvjMChvvWS1QrMN3rP
 bQ7gkjKMKzfF5/emXp4rGjcpVzo9IWlWuLFk0hqcemig/bouBfiOnlACD0NaX+IDPhwd/z2EJ2l81ClG8ajRC2gSibg8UsdYQM9AvAn6nWTafoqopLV5qCTs
 Qi1XpJBNRDFE0Q16YrG3ljM84IgoK4z+KSqDyuAIqPD+d1Kv4QA4grlFwZo=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 05/08/2020 12:57, Jacopo Mondi wrote:
> Provide a table to describe how the V4L2 selection targets can be used
> to access an image sensor pixel array properties.
> 
> Reference the table in the sub-device documentation.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  .../userspace-api/media/v4l/dev-subdev.rst    |  4 ++
>  .../media/v4l/v4l2-selection-targets.rst      | 49 +++++++++++++++++++
>  2 files changed, 53 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> index c47861dff9b9b..2f7da3832f458 100644
> --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> @@ -467,6 +467,10 @@ desired image resolution. If the sub-device driver supports that, userspace
>  can set the analog crop rectangle to select which portion of the pixel array
>  to read out.
>  
> +A description of each of the above mentioned targets when used to access the
> +image sensor pixel array properties is provided by
> +:ref:`v4l2-selection-targets-image-sensor-table`
> +
>  
>  Types of selection targets
>  --------------------------
> diff --git a/Documentation/userspace-api/media/v4l/v4l2-selection-targets.rst b/Documentation/userspace-api/media/v4l/v4l2-selection-targets.rst
> index 69f500093aa2a..632e6448b784e 100644
> --- a/Documentation/userspace-api/media/v4l/v4l2-selection-targets.rst
> +++ b/Documentation/userspace-api/media/v4l/v4l2-selection-targets.rst
> @@ -76,3 +76,52 @@ of the two interfaces they are used.
>  	modified by hardware.
>        - Yes
>        - No
> +
> +
> +.. _v4l2-selection-targets-image-sensor-table:
> +
> +********************************************
> +Selection Targets For Pixel Array Properties
> +********************************************
> +
> +The V4L2 selection API can be used to retrieve the size and disposition of the
> +pixel units that compose and image sensor pixel matrix when applied to a video
> +sub-device that represents an image sensor.
> +
> +A description of the properties associated with each of the sensor pixel array
> +areas is provided by the :ref:`v4l2-subdev-pixel-array-properties` section.
> +
> +.. tabularcolumns:: |p{6.0cm}|p{1.4cm}|p{7.4cm}|p(1.4cm)|
> +
> +.. flat-table:: Selection target definitions
> +    :header-rows:  1
> +    :stub-columns: 0
> +
> +    * - Target name
> +      - id
> +      - Definition
> +      - Read/Write
> +    * - ``V4L2_SEL_TGT_CROP``
> +      - 0x0000
> +      - The analog crop rectangle. Represents the portion of the active pixel
> +        array which is processed to produce images.
> +      - RW
> +    * - ``V4L2_SEL_TGT_CROP_DEFAULT``
> +      - 0x0001
> +      - The active pixel array rectangle. It includes only active pixels and
> +        excludes other ones such as optical black pixels. Its width and height
> +        represent the maximum image resolution an image sensor can produce.
> +      - RO
> +    * - ``V4L2_SEL_TGT_CROP_BOUNDS``
> +      - 0x0002
> +      - The readable portion of the physical pixel array matrix. It includes
> +        pixels that contains valid image data and calibration pixels such as the
> +        optical black ones.
> +      - RO
> +    * - ``V4L2_SEL_TGT_NATIVE_SIZE``
> +      - 0x0003
> +      - The physical pixel array size, including readable and not readable
> +        pixels. As pixels that cannot be read from application processor are not
> +        relevant for calibration purposes, this rectangle is useful to calculate
> +        the physical properties of the image sensor.
> +      - RO
> 

Hmm, this basically just duplicates the previous patch.

I think you are documenting things at the wrong place. What you documented in the
previous patch really belongs here since it is shared between the subdev API and the
regular V4L2 API. And in dev-subdev.rst you then refer to here.

Frankly, the selection API documentation is a mess. It's spread out over various sections:
The VIDIOC_G/S_SELECTION and VIDIOC_SUBDEV_G/S_SELECTION descriptions in the Function Reference,
section 8 ("Common definitions for V4L2 and V4L2 subdev interfaces"), 1.25 "Cropping, composing
and scaling – the SELECTION API" and 4.13.3.2-4.13.3.3 "Selections: cropping, scaling and composition".

In my view section 8 should be moved to section 1.25.2. Ideally 1.25 should be rewritten for both
the V4L2 and V4L2 subdev APIs, but that's a lot of work.

I would suggest that you add a first patch that moves section 8 to 1.25.2. Note that I don't like
the tables for the selection targets and flags: the 'Valid for V4L2/V4L2 subdevs' columns should
be removed and it should either be mentioned in the definition if a target/flag is invalid for
an API, or it should be put in a separate table.

And in 1.25.2 perhaps a new picture can be created for the specific sensor use-case that includes
the NATIVE_SIZE target.

Another pet peeve of mine is that section 8 splits the selection targets and flags into separate
subsections. I'd just keep it in one section.

Regards,

	Hans
