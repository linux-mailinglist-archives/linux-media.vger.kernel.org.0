Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EB7B7BA25A
	for <lists+linux-media@lfdr.de>; Thu,  5 Oct 2023 17:31:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233640AbjJEPbR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Oct 2023 11:31:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232045AbjJEPai (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Oct 2023 11:30:38 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0D991FEDA
        for <linux-media@vger.kernel.org>; Thu,  5 Oct 2023 07:48:11 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05810C116A7;
        Thu,  5 Oct 2023 10:00:24 +0000 (UTC)
Message-ID: <97cf7b3e-bb42-4e51-89d8-9fa6caaeddb1@xs4all.nl>
Date:   Thu, 5 Oct 2023 12:00:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/28] media: v4l: Support line-based metadata capture
Content-Language: en-US, nl
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>
References: <20231003115237.76828-1-sakari.ailus@linux.intel.com>
 <20231003115237.76828-6-sakari.ailus@linux.intel.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 xsFNBFQ84W0BEAC7EF1iL4s3tY8cRTVkJT/297h0Hz0ypA+ByVM4CdU9sN6ua/YoFlr9k0K4
 BFUlg7JzJoUuRbKxkYb8mmqOe722j7N3HO8+ofnio5cAP5W0WwDpM0kM84BeHU0aPSTsWiGR
 yw55SOK2JBSq7hueotWLfJLobMWhQii0Zd83hGT9SIt9uHaHjgwmtTH7MSTIiaY6N14nw2Ud
 C6Uykc1va0Wqqc2ov5ihgk/2k2SKa02ookQI3e79laOrbZl5BOXNKR9LguuOZdX4XYR3Zi6/
 BsJ7pVCK9xkiVf8svlEl94IHb+sa1KrlgGv3fn5xgzDw8Z222TfFceDL/2EzUyTdWc4GaPMC
 E/c1B4UOle6ZHg02+I8tZicjzj5+yffv1lB5A1btG+AmoZrgf0X2O1B96fqgHx8w9PIpVERN
 YsmkfxvhfP3MO3oHh8UY1OLKdlKamMneCLk2up1Zlli347KMjHAVjBAiy8qOguKF9k7HOjif
 JCLYTkggrRiEiE1xg4tblBNj8WGyKH+u/hwwwBqCd/Px2HvhAsJQ7DwuuB3vBAp845BJYUU3
 06kRihFqbO0vEt4QmcQDcbWINeZ2zX5TK7QQ91ldHdqJn6MhXulPKcM8tCkdD8YNXXKyKqNl
 UVqXnarz8m2JCbHgjEkUlAJCNd6m3pfESLZwSWsLYL49R5yxIwARAQABzSFIYW5zIFZlcmt1
 aWwgPGh2ZXJrdWlsQHhzNGFsbC5ubD7CwZUEEwECACgFAlQ84W0CGwMFCRLMAwAGCwkIBwMC
 BhUIAgkKCwQWAgMBAh4BAheAACEJEL0tYUhmFDtMFiEEBSzee8IVBTtonxvKvS1hSGYUO0wT
 7w//frEmPBAwu3OdvAk9VDkH7X+7RcFpiuUcJxs3Xl6jpaA+SdwtZra6W1uMrs2RW8eXXiq/
 80HXJtYnal1Y8MKUBoUVhT/+5+KcMyfVQK3VFRHnNxCmC9HZV+qdyxAGwIscUd4hSlweuU6L
 6tI7Dls6NzKRSTFbbGNZCRgl8OrF01TBH+CZrcFIoDgpcJA5Pw84mxo+wd2BZjPA4TNyq1od
 +slSRbDqFug1EqQaMVtUOdgaUgdlmjV0+GfBHoyCGedDE0knv+tRb8v5gNgv7M3hJO3Nrl+O
 OJVoiW0G6OWVyq92NNCKJeDy8XCB1yHCKpBd4evO2bkJNV9xcgHtLrVqozqxZAiCRKN1elWF
 1fyG8KNquqItYedUr+wZZacqW+uzpVr9pZmUqpVCk9s92fzTzDZcGAxnyqkaO2QTgdhPJT2m
 wpG2UwIKzzi13tmwakY7OAbXm76bGWVZCO3QTHVnNV8ku9wgeMc/ZGSLUT8hMDZlwEsW7u/D
 qt+NlTKiOIQsSW7u7h3SFm7sMQo03X/taK9PJhS2BhhgnXg8mOa6U+yNaJy+eU0Lf5hEUiDC
 vDOI5x++LD3pdrJVr/6ZB0Qg3/YzZ0dk+phQ+KlP6HyeO4LG662toMbFbeLcBjcC/ceEclII
 90QNEFSZKM6NVloM+NaZRYVO3ApxWkFu+1mrVTXOwU0EVDzhbQEQANzLiI6gHkIhBQKeQaYs
 p2SSqF9c++9LOy5x6nbQ4s0X3oTKaMGfBZuiKkkU6NnHCSa0Az5ScRWLaRGu1PzjgcVwzl5O
 sDawR1BtOG/XoPRNB2351PRp++W8TWo2viYYY0uJHKFHML+ku9q0P+NkdTzFGJLP+hn7x0RT
 DMbhKTHO3H2xJz5TXNE9zTJuIfGAz3ShDpijvzYieY330BzZYfpgvCllDVM5E4XgfF4F/N90
 wWKu50fMA01ufwu+99GEwTFVG2az5T9SXd7vfSgRSkzXy7hcnxj4IhOfM6Ts85/BjMeIpeqy
 TDdsuetBgX9DMMWxMWl7BLeiMzMGrfkJ4tvlof0sVjurXibTibZyfyGR2ricg8iTbHyFaAzX
 2uFVoZaPxrp7udDfQ96sfz0hesF9Zi8d7NnNnMYbUmUtaS083L/l2EDKvCIkhSjd48XF+aO8
 VhrCfbXWpGRaLcY/gxi2TXRYG9xCa7PINgz9SyO34sL6TeFPSZn4bPQV5O1j85Dj4jBecB1k
 z2arzwlWWKMZUbR04HTeAuuvYvCKEMnfW3ABzdonh70QdqJbpQGfAF2p4/iCETKWuqefiOYn
 pR8PqoQA1DYv3t7y9DIN5Jw/8Oj5wOeEybw6vTMB0rrnx+JaXvxeHSlFzHiD6il/ChDDkJ9J
 /ejCHUQIl40wLSDRABEBAAHCwXwEGAECAA8FAlQ84W0CGwwFCRLMAwAAIQkQvS1hSGYUO0wW
 IQQFLN57whUFO2ifG8q9LWFIZhQ7TA1WD/9yxJvQrpf6LcNrr8uMlQWCg2iz2q1LGt1Itkuu
 KaavEF9nqHmoqhSfZeAIKAPn6xuYbGxXDrpN7dXCOH92fscLodZqZtK5FtbLvO572EPfxneY
 UT7JzDc/5LT9cFFugTMOhq1BG62vUm/F6V91+unyp4dRlyryAeqEuISykhvjZCVHk/woaMZv
 c1Dm4Uvkv0Ilelt3Pb9J7zhcx6sm5T7v16VceF96jG61bnJ2GFS+QZerZp3PY27XgtPxRxYj
 AmFUeF486PHx/2Yi4u1rQpIpC5inPxIgR1+ZFvQrAV36SvLFfuMhyCAxV6WBlQc85ArOiQZB
 Wm7L0repwr7zEJFEkdy8C81WRhMdPvHkAIh3RoY1SGcdB7rB3wCzfYkAuCBqaF7Zgfw8xkad
 KEiQTexRbM1sc/I8ACpla3N26SfQwrfg6V7TIoweP0RwDrcf5PVvwSWsRQp2LxFCkwnCXOra
 gYmkrmv0duG1FStpY+IIQn1TOkuXrciTVfZY1cZD0aVxwlxXBnUNZZNslldvXFtndxR0SFat
 sflovhDxKyhFwXOP0Rv8H378/+14TaykknRBIKEc0+lcr+EMOSUR5eg4aURb8Gc3Uc7fgQ6q
 UssTXzHPyj1hAyDpfu8DzAwlh4kKFTodxSsKAjI45SLjadSc94/5Gy8645Y1KgBzBPTH7Q==
In-Reply-To: <20231003115237.76828-6-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 03/10/2023 13:52, Sakari Ailus wrote:
> many camera sensors, among other devices, transmit embedded data and image
> data for each CSI-2 frame. This embedded data typically contains register
> configuration of the sensor that has been used to capture the image data
> of the same frame.
> 
> The embedded data is received by the CSI-2 receiver and has the same
> properties as the image data, including that it is line based: it has
> width, height and bytesperline (stride).
> 
> Add these fields to struct v4l2_meta_format and document them.
> 
> Also add V4L2_FMT_FLAG_META_LINE_BASED to tell a given format is
> line-based i.e. these fields of struct v4l2_meta_format are valid for it.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  .../userspace-api/media/v4l/dev-meta.rst          | 15 +++++++++++++++
>  .../userspace-api/media/v4l/vidioc-enum-fmt.rst   |  7 +++++++
>  .../media/videodev2.h.rst.exceptions              |  1 +
>  drivers/media/v4l2-core/v4l2-ioctl.c              |  5 +++--
>  include/uapi/linux/videodev2.h                    | 10 ++++++++++
>  5 files changed, 36 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/dev-meta.rst b/Documentation/userspace-api/media/v4l/dev-meta.rst
> index 0e7e1ee1471a..4dfd79e0a705 100644
> --- a/Documentation/userspace-api/media/v4l/dev-meta.rst
> +++ b/Documentation/userspace-api/media/v4l/dev-meta.rst
> @@ -65,3 +65,18 @@ to 0.
>        - ``buffersize``
>        - Maximum buffer size in bytes required for data. The value is set by the
>          driver.
> +    * - __u32
> +      - ``width``
> +      - Width of a line of metadata in Data units. Valid when
> +	:c:type`v4l2_fmtdesc` flag ``V4L2_FMT_FLAG_META_LINE_BASED`` is set,
> +	otherwise zero. See :c:func:`VIDIOC_ENUM_FMT`.
> +    * - __u32
> +      - ``height``
> +      - Number of rows of metadata. Valid when :c:type`v4l2_fmtdesc` flag
> +	``V4L2_FMT_FLAG_META_LINE_BASED`` is set, otherwise zero. See
> +	:c:func:`VIDIOC_ENUM_FMT`.
> +    * - __u32
> +      - ``bytesperline``
> +      - Offset in bytes between the beginning of two consecutive lines. Valid
> +	when :c:type`v4l2_fmtdesc` flag ``V4L2_FMT_FLAG_META_LINE_BASED`` is
> +	set, otherwise zero. See :c:func:`VIDIOC_ENUM_FMT`.
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
> index 000c154b0f98..a79abf4428c8 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
> @@ -227,6 +227,13 @@ the ``mbus_code`` field is handled differently:
>  	The application can ask to configure the quantization of the capture
>  	device when calling the :ref:`VIDIOC_S_FMT <VIDIOC_G_FMT>` ioctl with
>  	:ref:`V4L2_PIX_FMT_FLAG_SET_CSC <v4l2-pix-fmt-flag-set-csc>` set.
> +    * - ``V4L2_FMT_FLAG_META_LINE_BASED``
> +      - 0x0200
> +      - The metadata format is line-based. In this case the ``width``,
> +	``height`` and ``bytesperline`` fields of :c:type:`v4l2_meta_format` are
> +	valid. The buffer consists of ``height`` lines, each having ``width``
> +	Data units of data and offset (in bytes) between the beginning of each

offset -> the offset

Would 'stride' be a better name for this? The v4l2_pix_format documentation for
this field says: "Distance in bytes between the leftmost pixels in two adjacent lines."

> +	two consecutive lines is ``bytesperline``.
>  
>  Return Value
>  ============
> diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> index 3e58aac4ef0b..bdc628e8c1d6 100644
> --- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> +++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> @@ -215,6 +215,7 @@ replace define V4L2_FMT_FLAG_CSC_XFER_FUNC fmtdesc-flags
>  replace define V4L2_FMT_FLAG_CSC_YCBCR_ENC fmtdesc-flags
>  replace define V4L2_FMT_FLAG_CSC_HSV_ENC fmtdesc-flags
>  replace define V4L2_FMT_FLAG_CSC_QUANTIZATION fmtdesc-flags
> +replace define V4L2_FMT_FLAG_META_LINE_BASED fmtdesc-flags
>  
>  # V4L2 timecode types
>  replace define V4L2_TC_TYPE_24FPS timecode-type
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index ce4b3929ff5f..fb453b7d0c91 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -343,8 +343,9 @@ static void v4l_print_format(const void *arg, bool write_only)
>  	case V4L2_BUF_TYPE_META_OUTPUT:
>  		meta = &p->fmt.meta;
>  		pixelformat = meta->dataformat;
> -		pr_cont(", dataformat=%p4cc, buffersize=%u\n",
> -			&pixelformat, meta->buffersize);
> +		pr_cont(", dataformat=%p4cc, buffersize=%u, width=%u, height=%u, bytesperline=%u\n",
> +			&pixelformat, meta->buffersize, meta->width,
> +			meta->height, meta->bytesperline);
>  		break;
>  	}
>  }
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 2b16b06ad278..7b0781a20dbe 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -877,6 +877,7 @@ struct v4l2_fmtdesc {
>  #define V4L2_FMT_FLAG_CSC_YCBCR_ENC		0x0080
>  #define V4L2_FMT_FLAG_CSC_HSV_ENC		V4L2_FMT_FLAG_CSC_YCBCR_ENC
>  #define V4L2_FMT_FLAG_CSC_QUANTIZATION		0x0100
> +#define V4L2_FMT_FLAG_META_LINE_BASED		0x0200
>  
>  	/* Frame Size and frame rate enumeration */
>  /*
> @@ -2420,10 +2421,19 @@ struct v4l2_sdr_format {
>   * struct v4l2_meta_format - metadata format definition
>   * @dataformat:		little endian four character code (fourcc)
>   * @buffersize:		maximum size in bytes required for data
> + * @width:		number of data units of data per line (valid for line

I'd drop "of data".

> + *			based formats only, see format documentation)
> + * @height:		number of lines of data per buffer (valid for line based

Ditto.

> + *			formats only)
> + * @bytesperline:	offset between the beginnings of two adjacent lines in
> + *			bytes (valid for line based formats only)

I would use 'distance' instead of 'offset'.

>   */
>  struct v4l2_meta_format {
>  	__u32				dataformat;
>  	__u32				buffersize;
> +	__u32				width;
> +	__u32				height;
> +	__u32				bytesperline;
>  } __attribute__ ((packed));
>  
>  /**

Regards,

	Hans
