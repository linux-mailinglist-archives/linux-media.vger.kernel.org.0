Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C550335E16
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2019 15:39:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727970AbfFENjr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jun 2019 09:39:47 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:45351 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727966AbfFENjr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 5 Jun 2019 09:39:47 -0400
Received: from [IPv6:2001:420:44c1:2579:c806:4d76:5b3c:eea9] ([IPv6:2001:420:44c1:2579:c806:4d76:5b3c:eea9])
        by smtp-cloud7.xs4all.net with ESMTPA
        id YW8ihmUzN3qlsYW8mhgRsz; Wed, 05 Jun 2019 15:39:44 +0200
Subject: Re: [PATCH v7 2/4] media: videodev2: add
 V4L2_FMT_FLAG_FIXED_RESOLUTION
To:     Maxime Jourdan <mjourdan@baylibre.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>
Cc:     Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org,
        Philipp Zabel <p.zabel@pengutronix.de>
References: <20190531093126.26956-1-mjourdan@baylibre.com>
 <20190531093126.26956-3-mjourdan@baylibre.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <9731b2db-efd4-87d0-c48d-87adec433747@xs4all.nl>
Date:   Wed, 5 Jun 2019 15:39:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190531093126.26956-3-mjourdan@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfL/7ZtmqqJer1hsK60jgZcgv+ioTMnBw2zhprc8Tz/bSylE8VX716nESUCWjidOuDf++DgPrGp2TlmKV5m4/D8Uig0rBNJDhyiYnBcNPYN0uSWQYEbqc
 iGPqk330/IS2JJurKbAu7zb5CiKZnIF0mh86cRmofiHBhEJpBAvfw+b2ZhBs0791Ti17gyoh1Kb1p+cj8jTcxar9xMevoSncdv+OcQj7vqP9QX3QDu1/V0fw
 Cjr+Ss9igdPPnCorYJa7CRHkI6LmnZ26jdOuCy2C6GkXKAf6SVG242m4NBWVYP0O4wS3q/QhCD+1UWVihM8BdbN/2RhSH4G9kgp/0oZGV2jvYX76BzgVgyQM
 1q1rGgIaYu252pObFB0QHBhd2nxcVRaflTFhSv6QNXOwWqdAiETXCVJ/B0HTr9Zb3/OltbHHB5mo7rrQFCdu4xf/8mCX8/0vgOTTUdDKpLfpCU08YO4blDdv
 NPpTQMBErTJOwzpD4/R0i6O6lfR0ZIdtbTcCA/VXx8Y+UVRAB9QwVtn9tGLSYyVWjHd7l+TzvFNZ1fbTVjPTIO5NewY9QQCybH3da4oeZ0GBkwCazm3iLiJB
 guYMTtfR7IUQGlSU2YYVcJJwj/gLClyKMlV6r5DU4Dhs+Kd2kVHTL950rjCC6IKKR7yKnEsKMoShErTrTGGsWxPZPexQf2CbHAjql8hY9QJT1rTSoMwjdDPD
 c0iwon8trQ0=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Maxime,

I am wondering if this flag shouldn't be inverted: you set
V4L2_FMT_FLAG_DYN_RESOLUTION if dynamic resolution is supported,
otherwise it isn't.

Can all the existing mainlined codec drivers handle midstream
resolution changes?

s5p-mfc, venus and mediatek can, but I see no SOURCE_CHANGE event in
the coda drivers, so I suspect that that can't handle this.

Philipp, what is the status of the coda driver for dynamic resolution
changes?

Another reason is that AFAIK all encoders are of the fixed resolution
type.

And a final reason is that usually flags should indicate the presence
of a feature, not the absence.

Regards,

	Hans

On 5/31/19 11:31 AM, Maxime Jourdan wrote:
> When a v4l2 driver exposes V4L2_EVENT_SOURCE_CHANGE, some (usually
> OUTPUT) formats may not be able to trigger this event.
> 
> For instance, MPEG2 on Amlogic hardware does not support resolution
> switching on the fly, and a decode session must operate at a set
> resolution defined before the decoding start.
> 
> Add a enum_fmt format flag to tag those specific formats.
> 
> Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
> ---
>  Documentation/media/uapi/v4l/vidioc-enum-fmt.rst | 6 ++++++
>  include/uapi/linux/videodev2.h                   | 5 +++--
>  2 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst b/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
> index 822d6730e7d2..b11448a1848b 100644
> --- a/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
> +++ b/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
> @@ -127,6 +127,12 @@ one until ``EINVAL`` is returned.
>        - This format is not native to the device but emulated through
>  	software (usually libv4l2), where possible try to use a native
>  	format instead for better performance.
> +    * - ``V4L2_FMT_FLAG_FIXED_RESOLUTION``
> +      - 0x0004
> +      - Dynamic resolution switching is not supported for this format,
> +        even if the event ``V4L2_EVENT_SOURCE_CHANGE`` is supported by
> +        the device.
> +
>  
>  
>  Return Value
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 1050a75fb7ef..9b0a7f82dd92 100644
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
> +#define V4L2_FMT_FLAG_FIXED_RESOLUTION	0x0004
>  
>  	/* Frame Size and frame rate enumeration */
>  /*
> 

