Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 255391020DC
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2019 10:38:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726573AbfKSJi5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Nov 2019 04:38:57 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:48545 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725280AbfKSJi5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Nov 2019 04:38:57 -0500
Received: from [IPv6:2001:983:e9a7:1:9879:d2e2:f0e2:9c7]
 ([IPv6:2001:983:e9a7:1:9879:d2e2:f0e2:9c7])
        by smtp-cloud7.xs4all.net with ESMTPA
        id WzyIiCDRncs92WzyJiyMQH; Tue, 19 Nov 2019 10:38:55 +0100
Subject: Re: [PATCH v3] v4l2-ctl:Add Support for Touch
To:     Vandana BN <bnvandana@gmail.com>, linux-media@vger.kernel.org
References: <20191113112336.31324-1-bnvandana@gmail.com>
 <20191115132148.18729-1-bnvandana@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <31f4c184-8890-cd93-8c37-36a66a71f5a3@xs4all.nl>
Date:   Tue, 19 Nov 2019 10:38:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191115132148.18729-1-bnvandana@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfOpmvufcu8Fw9Poo8OH4uFDzJw+Xis4W7WW4NzuxI2po3uMe0hEg6ItbmnkDqr1HO2WkszEKUkeWxRmXa5SokNdqwdW3VJdReIZh3nikVCduDTZefNM0
 Z/x/WRA95qRFxbOt3e88Q6yk6pUzxZQn9biodCD6MDwShPME+xRgNP52+fYrCPPRFrgOcEVQuNUIz3h1q4lcnjoI3wzSMhXqqfSaliO6oX/+eAZCYUWZSWlf
 7JrBIQFNU7mLmQGQCaTgQu+SqVLTz74yBDu1EpIg+5Kga1U9PFRo+9D5SIsx3YwUDw0WrR7GMt20WQOPFeWRtw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/15/19 2:21 PM, Vandana BN wrote:
> Add support to verify V4L2_TCH_FMT_TU16 format touch inputs.

Out of date commit msg: it's FMT_DELTA_TD16 that's supported.

> 
> Signed-off-by: Vandana BN <bnvandana@gmail.com>
> ---
>  utils/v4l2-ctl/v4l2-ctl-streaming.cpp |  4 ++++
>  utils/v4l2-ctl/v4l2-ctl-vidcap.cpp    | 22 ++++++++++++++++++++++
>  utils/v4l2-ctl/v4l2-ctl.h             |  1 +
>  3 files changed, 27 insertions(+)
> 
> diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
> index 184bfd64..191a18c5 100644
> --- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
> +++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
> @@ -595,6 +595,10 @@ static void print_concise_buffer(FILE *f, cv4l_buffer &buf, cv4l_fmt &fmt,
>  	if (v4l_type_is_meta(buf.g_type()) && buf.g_bytesused(0) &&
>  	    !(buf.g_flags() & V4L2_BUF_FLAG_ERROR))
>  		print_meta_buffer(f, buf, fmt, q);
> +
> +	if ((capabilities & V4L2_CAP_TOUCH) && buf.g_bytesused(0) &&
> +	    !(buf.g_flags() & V4L2_BUF_FLAG_ERROR))

Do the width/height check here instead of in print_touch_buffer.

> +		print_touch_buffer(f, buf, fmt, q);
>  }
>  
>  static void stream_buf_caps(cv4l_fd &fd, unsigned buftype)
> diff --git a/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp b/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
> index 3a29251a..af96afdc 100644
> --- a/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
> +++ b/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
> @@ -358,3 +358,25 @@ void vidcap_list(cv4l_fd &fd)
>  		}
>  	}
>  }
> +
> +void print_touch_buffer(FILE *f, cv4l_buffer &buf, cv4l_fmt &fmt, cv4l_queue &q)
> +{
> +	__s16 *vbuf = NULL;
> +	__u32 x, y, index;
> +
> +	switch (fmt.g_pixelformat()) {
> +	case V4L2_TCH_FMT_DELTA_TD16:
> +		vbuf = (__s16*)q.g_dataptr(buf.g_index(), 0);
> +		fprintf(f, "TD16:\n");

Rather than doing this before showing the pattern, it is better to
have this as a prefix at the start of each line. It's more compact.

> +		if (fmt.g_width() < 64 ||  fmt.g_height() < 64) {
> +			for (y = 0; y < fmt.g_height(); y++) {
> +				for (x = 0; x < fmt.g_width() ; x++) {

Space before ;

You can drop the index variable by just adding ', vbuf++' after the y++
and using *vbuf instead of vbuf[index]. You also need to use le16toh
since the vbuf contents is little endian.

Regards,

	Hans

> +					index = x + fmt.g_width() * y;
> +					fprintf(f, "%-3d ", vbuf[index]);
> +				}
> +				fprintf(f, "\n");
> +			}
> +		}
> +		break;
> +	}
> +}
> diff --git a/utils/v4l2-ctl/v4l2-ctl.h b/utils/v4l2-ctl/v4l2-ctl.h
> index b0f65e9b..b31be7f5 100644
> --- a/utils/v4l2-ctl/v4l2-ctl.h
> +++ b/utils/v4l2-ctl/v4l2-ctl.h
> @@ -373,6 +373,7 @@ int vidcap_get_and_update_fmt(cv4l_fd &_fd, struct v4l2_format &vfmt);
>  void vidcap_set(cv4l_fd &fd);
>  void vidcap_get(cv4l_fd &fd);
>  void vidcap_list(cv4l_fd &fd);
> +void print_touch_buffer(FILE *f, cv4l_buffer &buf, cv4l_fmt &fmt, cv4l_queue &q);
>  
>  // v4l2-ctl-vidout.cpp
>  void vidout_usage(void);
> 

