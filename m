Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73D5C3C580
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2019 10:01:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404034AbfFKIBB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jun 2019 04:01:01 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:55975 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2403815AbfFKIBA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jun 2019 04:01:00 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud8.xs4all.net with ESMTPA
        id abi7hfQ0w41bFabiBhCnwY; Tue, 11 Jun 2019 10:00:58 +0200
Subject: Re: [RFC PATCH 1/5] media: videodev2: add
 V4L2_FMT_FLAG_DYN_RESOLUTION
To:     Maxime Jourdan <mjourdan@baylibre.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kamil Debski <kamil@wypas.org>,
        Jeongtae Park <jtp.park@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>
References: <20190609143820.4662-1-mjourdan@baylibre.com>
 <20190609143820.4662-2-mjourdan@baylibre.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <30498ffd-4597-abe4-78be-102d138f13a8@xs4all.nl>
Date:   Tue, 11 Jun 2019 10:00:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190609143820.4662-2-mjourdan@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfGJEqu1jKie4C5u6QEMZLiW0+M+MuRnLjC4nfVl7gyjQCMzWCBTNuyTFpZz37xRUSC7EgJaH3gMKkslqFR8GagC3wOQHNaGiVIzS/cR5d9Lvv66X/Msi
 0NLVKDk/WEo1vUnKTF2ztPOMl3jXI6aAVrq2RORxuf+ZGB0pjK+ch6Vt39u7ztC9CgljiriKhFT9BOHrfO+BfXk2+3f6Rjq29d5/yi1LAQAMrYyxQdsOvJeg
 A9g+dQQa0l7gr/u+WeayC401opOavfhD/ceBh6vZ8tHFeq7JMKgoDDG3jcsHKbxCt0liYaxg1RrvEoAWOpm9GU/06Wa1Ane/E5Gd9/gzbpfnegKPHFwbde1L
 k1yElASPcxdZ61t3m2BTWEtULWEmOt4ScLEhWF7D/USq2K+wEeCnywDZ0Zc4sRxBvFgzNtKr7f7Ra5tEtEjZYHciIp9oRcZ4sNO8A40kHWh/KpUhoZ0JhNcI
 205S1OKXoud3ongcxl8RnKYI+Pmx7Iy2uiRjCBd3mi503+2WPxbkbX+U9ZWGwS5P6IYKcT1GkWQXN2pLafQ/bwxwY62I8pm9QArxj/sMcdfF7Duy2HPQUUuT
 eMM=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/9/19 4:38 PM, Maxime Jourdan wrote:
> Add a enum_fmt format flag to specifically tag coded formats where
> dynamic resolution switching is supported by the device.
> 
> This is useful for some codec drivers that can't support dynamic

can't -> can

> resolution switching for all their listed coded formats. It allows
> userspace to know whether it should extract the video parameters itself,
> or if it can rely on the device to send V4L2_EVENT_SOURCE_CHANGE when
> such changes are detected.
> 
> Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
> ---
>  Documentation/media/uapi/v4l/vidioc-enum-fmt.rst | 7 +++++++
>  include/uapi/linux/videodev2.h                   | 5 +++--
>  2 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst b/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
> index 822d6730e7d2..92ddd4ddbce2 100644
> --- a/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
> +++ b/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
> @@ -127,6 +127,13 @@ one until ``EINVAL`` is returned.
>        - This format is not native to the device but emulated through
>  	software (usually libv4l2), where possible try to use a native
>  	format instead for better performance.
> +    * - ``V4L2_FMT_FLAG_DYN_RESOLUTION``
> +      - 0x0004
> +      - Dynamic resolution switching is supported by the device for this
> +	coded format. It will notify the user via the event

I'd say 'compressed bitstream format (aka coded format)'.

Also mention that this flag can only be used in combination with the
COMPRESSED flag, since this applies to compressed formats only.

Regards,

	Hans

> +	``V4L2_EVENT_SOURCE_CHANGE`` when changes in the video parameters
> +	are detected.
> +
>  
>  
>  Return Value
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 1050a75fb7ef..834550e20ee7 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -768,8 +768,9 @@ struct v4l2_fmtdesc {
>  	__u32		    reserved[4];
>  };
>  
> -#define V4L2_FMT_FLAG_COMPRESSED 0x0001
> -#define V4L2_FMT_FLAG_EMULATED   0x0002
> +#define V4L2_FMT_FLAG_COMPRESSED	0x0001
> +#define V4L2_FMT_FLAG_EMULATED		0x0002
> +#define V4L2_FMT_FLAG_DYN_RESOLUTION	0x0004
>  
>  	/* Frame Size and frame rate enumeration */
>  /*
> 

