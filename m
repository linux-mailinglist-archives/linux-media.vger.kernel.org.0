Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39D4B33D329
	for <lists+linux-media@lfdr.de>; Tue, 16 Mar 2021 12:36:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233869AbhCPLf7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Mar 2021 07:35:59 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:35097 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237315AbhCPLfv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Mar 2021 07:35:51 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id M7zEl1Zf44ywlM7zIlAlme; Tue, 16 Mar 2021 12:35:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615894548; bh=NQGZRkIj9jSeeETDnCrg5G1MdUAhBmYCYcT6Q1xXTQg=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=gLzHCbczBu+/QNCerJ3JJVQM4jpzF9lI1pEZ/OdoT4FLJb0yBY+S60k/6kROPYqPk
         BO7UILxyub57JeexzRadHs3P28VufaRgIfCtr2mC02Unyohbdi9QafHE8bGQxygLeJ
         DcPpu2l5j1scMOMd+khOimFWUUu7OhbG30X3p0rWaAky3I6fIf9fFbSVPfiA+/1ioK
         dyZZuX6Kcfffjt9bFIqik411xauDpptkvWjZ5WB5n3g52NR5SNK7NHzDe+YapO0/17
         yGhu9US1HfCjiN83M+r4D5my9O2BeoFax39u6rUVxn/FARKtXxqBFWZaGyrMA65dSE
         WguixTZyt6Fog==
Subject: Re: [PATCH v5 1/5] v4l: Add new Colorimetry Class
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20210209162425.3970393-1-stanimir.varbanov@linaro.org>
 <20210209162425.3970393-2-stanimir.varbanov@linaro.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <e456ca77-7a47-de09-d5c9-41e38b362857@xs4all.nl>
Date:   Tue, 16 Mar 2021 12:35:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210209162425.3970393-2-stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfPfKfoJqaVO1aDly7VB/NT3EcZHKO8fd9VXJYM0mdjgpYY7t384wzRFKgRenNG1w/Y21PxqypytgjEIuRkLpK9wgv4ezsiLQA3Ugj+2mejkIMjeM2kxL
 LMJeC90Ce9S6e182BmMSAJk6HU/INx9LlqanlhOb6WkDPRt1jUZGYz3/4QOk4KHfLBb0yKTEPzHhnDNHnLNVJNVqDbovWUBqiagQQHR8LNj57YiRESgYAt2f
 GgntxSWXTOub76n9GDlJZLZxdMFz7+VvAn3I2E3qJolCYEGzfCeI5SEMljRDbPZMuxhLRZEMJQcXDFhYSuPM6tSSm5cUYRiYOVLEiF5jWAddFlgp1mnaWQ5e
 8vDAHmojU+8P8A9nuaB87kQVr21ydE7jGdTCyKv4VEPlbpAIdUb07QtjYUUEsYWhwAEvOJAO
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 09/02/2021 17:24, Stanimir Varbanov wrote:
> Add Colorimetry control class for colorimetry controls
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  drivers/media/v4l2-core/v4l2-ctrls.c | 7 ++++++-
>  include/uapi/linux/v4l2-controls.h   | 4 ++++
>  2 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index 016cf6204cbb..335cf354f51b 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -1201,6 +1201,10 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_STATELESS_H264_SLICE_PARAMS:		return "H264 Slice Parameters";
>  	case V4L2_CID_STATELESS_H264_DECODE_PARAMS:		return "H264 Decode Parameters";
>  	case V4L2_CID_STATELESS_FWHT_PARAMS:			return "FWHT Stateless Parameters";
> +
> +	/* Colorimetry controls */
> +	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
> +	case V4L2_CID_COLORIMETRY_CLASS:	return "Colorimetry Controls";
>  	default:
>  		return NULL;
>  	}
> @@ -1389,8 +1393,9 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  	case V4L2_CID_RF_TUNER_CLASS:
>  	case V4L2_CID_DETECT_CLASS:
>  	case V4L2_CID_CODEC_STATELESS_CLASS:
> +	case V4L2_CID_COLORIMETRY_CLASS:
>  		*type = V4L2_CTRL_TYPE_CTRL_CLASS;
> -		/* You can neither read not write these */
> +		/* You can neither read nor write these */
>  		*flags |= V4L2_CTRL_FLAG_READ_ONLY | V4L2_CTRL_FLAG_WRITE_ONLY;
>  		*min = *max = *step = *def = 0;
>  		break;
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 039c0d7add1b..a41039559193 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -66,6 +66,7 @@
>  #define V4L2_CTRL_CLASS_RF_TUNER	0x00a20000	/* RF tuner controls */
>  #define V4L2_CTRL_CLASS_DETECT		0x00a30000	/* Detection controls */
>  #define V4L2_CTRL_CLASS_CODEC_STATELESS 0x00a40000	/* Stateless codecs controls */
> +#define V4L2_CTRL_CLASS_COLORIMETRY	0x00a50000	/* Colorimetry controls */
>  
>  /* User-class control IDs */
>  
> @@ -1657,6 +1658,9 @@ struct v4l2_ctrl_fwht_params {
>  	__u32 quantization;
>  };
>  
> +#define V4L2_CID_COLORIMETRY_CLASS_BASE	(V4L2_CTRL_CLASS_COLORIMETRY | 0x900)
> +#define V4L2_CID_COLORIMETRY_CLASS	(V4L2_CTRL_CLASS_COLORIMETRY | 1)
> +
>  /* MPEG-compression definitions kept for backwards compatibility */
>  #ifndef __KERNEL__
>  #define V4L2_CTRL_CLASS_MPEG            V4L2_CTRL_CLASS_CODEC
> 

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans
