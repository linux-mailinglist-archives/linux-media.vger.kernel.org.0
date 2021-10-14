Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E462A42D74D
	for <lists+linux-media@lfdr.de>; Thu, 14 Oct 2021 12:44:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230010AbhJNKqQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Oct 2021 06:46:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230179AbhJNKqO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Oct 2021 06:46:14 -0400
Received: from lb1-smtp-cloud7.xs4all.net (lb1-smtp-cloud7.xs4all.net [IPv6:2001:888:0:108::1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35E7CC06174E;
        Thu, 14 Oct 2021 03:44:07 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id ayDPmQPhbk3b0ayDSmY3Ty; Thu, 14 Oct 2021 12:44:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1634208245; bh=Dt8iAsZoQbw+8ztTOanG0dZjIgdazqKPNyrFEWlXSAo=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=CscLD0yhzYBivtuJi9JzxJ8iVPewKECq0WcJuySx3GePtwVqHf/cIL+Zdwgn4oI3i
         sYXEwr6ree/FyFl0Rpzaq0Jdh98EuiUIk/unBi2komD2mDoH/7BbO5HxlmAnxtGmWP
         2ASede8JQ+2vZQDNhNBkflwo8KUkSsYmIBTTqZtiUGnSse6nWIAt33TPHAY0rg+C+s
         1K4QRScMbkaNLNkkR+Ni0DCDrPDL1StFI/zEb2cQlvSCj4EeGY2xjdqZieL9eLrE40
         kJzlz9CdlwyJnCSXFwXCvtexjAXNrsyU/8IC9LhVYrf/eX+TqmdWqGcoxYm1efkk0K
         IfcaeMD412YmQ==
Subject: Re: [PATCH v4 6/8] media: v4l2-ctrls: Add RGB color effects control
To:     dillon.minfei@gmail.com, mchehab@kernel.org,
        mchehab+huawei@kernel.org, ezequiel@collabora.com,
        gnurou@gmail.com, pihsun@chromium.org, mcoquelin.stm32@gmail.com,
        alexandre.torgue@foss.st.com, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org, gabriel.fernandez@st.com,
        gabriel.fernandez@foss.st.com
Cc:     patrice.chotard@foss.st.com, hugues.fruchet@foss.st.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <1634207106-7632-1-git-send-email-dillon.minfei@gmail.com>
 <1634207106-7632-7-git-send-email-dillon.minfei@gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <2b0739f1-85e4-6b19-ff30-2587f0c622c2@xs4all.nl>
Date:   Thu, 14 Oct 2021 12:43:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1634207106-7632-7-git-send-email-dillon.minfei@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfLm9P3T6gisMurhxbTbtwilnuvn+fth/0nEoVTcsP99TVI7gG5PxBsYra7dYnlthC/vw6/Bfgz4tnqzCJI6pH9zx4r+HldAC/aOi5ZePTYhgB0kfEp0R
 9W19AxhP2nRumLM26GQKKnk08cjtZCjlooLKPmkZqSgEFjk2Zz+FloLi/13Ta+uU3OdamoOxIZpyjpT0t12LLYYLYPmRTLYZYgT6VU1Sk4AdZg00mGU8aDk4
 15Rn1tUF3+oJQr/KFaJzacg9pd5cnCRpALriMc/rFRNayQX1FgYvsn3RU6ocl7Y7QbfzRu708KqOQX/8sV4RE9UEt23WFIJQNUCwypY0wuTkj6SWkW5abHmn
 mcYhlHvYMdHcRAniz/qXjH5VKHHftbi634FOouvDlpaU3KvGkt3MHKMCCbQivRvQixEOn+e66QB5CimJbtRHxHXRzAJEJZAl12IORraKHScMPK3XO1hAc6j7
 NnCr52ymK+pLn140Y2FVwCqfWGQSTHJsnGyLS23zTlWOD/eCaOeChZ2Jb692hGjG4GnLT1ZebUsq5ef4yfGvdQRXilehG1ucGAmWRg9tzbT4qTDKgVEw4r+U
 U1XGDSRz+4B0WFniaWfU0p3GzGLY7yvhPw+z+4mnty6gQR1FA89f6Wu/AnqU18TROthxB3AyzxRxRR3HQqDxIzvPAVaNwvd++b3Tm0FO/WYeurERvEP+eesN
 JWpZugRNqVdzC1c8R6IZDs9+XcxSwZeufMgdHX5RGwERKTOa7L/43o4pZ3Sk1dDxuLI31HCHNY3hPSHw1hWUJFs60dnS0qZk5w7KUy9TCwrYfTjA0NfpHlh1
 gEujQA7AHr+5KyZUefeNSYLelMC1FiKZl9h+wrxAPa/k9t/gIOi0GMIlJFOleLJ7AOeFr97SZVLjA+q5Xkh0taXy8hhR3tCX48lxmC4zxqnVOTPHbLDN9Oq8
 ygrbvyo59ehV80SeipDmmItq/Y8=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 14/10/2021 12:25, dillon.minfei@gmail.com wrote:
> From: Dillon Min <dillon.minfei@gmail.com>
> 
> Add V4L2_COLORFX_SET_RGB color effects control, V4L2_CID_COLORFX_RGB
> for RGB color setting.
> 
> Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
> ---
> v4:
> - replace V4L2_COLORFX_SET_ARGB, V4L2_CID_COLORFX_ARGB to
>   V4L2_COLORFX_SET_RGB, V4L2_CID_COLORFX_RGB since Alpha paramter not used
>   in current. thanks Hans.
> 
>  Documentation/userspace-api/media/v4l/control.rst | 9 +++++++++
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c         | 2 ++
>  include/uapi/linux/v4l2-controls.h                | 4 +++-
>  3 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/control.rst b/Documentation/userspace-api/media/v4l/control.rst
> index f8d0b923da20..3eec65174260 100644
> --- a/Documentation/userspace-api/media/v4l/control.rst
> +++ b/Documentation/userspace-api/media/v4l/control.rst
> @@ -242,8 +242,17 @@ Control IDs
>      * - ``V4L2_COLORFX_SET_CBCR``
>        - The Cb and Cr chroma components are replaced by fixed coefficients
>  	determined by ``V4L2_CID_COLORFX_CBCR`` control.
> +    * - ``V4L2_COLORFX_SET_RGB``
> +      - The RGB components are replaced by the fixed RGB components determined
> +        by ``V4L2_CID_COLORFX_RGB`` control.
>  
>  
> +``V4L2_CID_COLORFX_RGB`` ``(integer)``
> +    Determines the Red, Green, and Blue coefficients for
> +    ``V4L2_COLORFX_SET_RGB`` color effect.
> +    Bits [7:0] of the supplied 32 bit value are interpreted as Blue component,
> +    bits [15:8] as Green component, bits [23:16] as Red component, and
> +    bits [31:24] must be zero.
>  
>  ``V4L2_CID_COLORFX_CBCR`` ``(integer)``
>      Determines the Cb and Cr coefficients for ``V4L2_COLORFX_SET_CBCR``
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> index 421300e13a41..f4bd90170105 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> @@ -785,6 +785,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_MIN_BUFFERS_FOR_OUTPUT:	return "Min Number of Output Buffers";
>  	case V4L2_CID_ALPHA_COMPONENT:		return "Alpha Component";
>  	case V4L2_CID_COLORFX_CBCR:		return "Color Effects, CbCr";
> +	case V4L2_CID_COLORFX_RGB:		return "Color Effects, RGB";
>  
>  	/*
>  	 * Codec controls
> @@ -1392,6 +1393,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  		*min = *max = *step = *def = 0;
>  		break;
>  	case V4L2_CID_BG_COLOR:
> +	case V4L2_CID_COLORFX_RGB:
>  		*type = V4L2_CTRL_TYPE_INTEGER;
>  		*step = 1;
>  		*min = 0;

Can you make another small change here? Please change:

	*max = 0xFFFFFF;

to:

	*max = 0xffffff;

to keep in line with the coding standard for hex values.

Also, can you add a separate patch that adds an entry here for V4L2_CID_COLORFX_CBCR
that sets *max to 0xffff? I noticed that that was missing. While adding V4L2_CID_COLORFX_RGB
it's good to fix V4L2_CID_COLORFX_CBCR as well.

Regards,

	Hans

> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 5532b5f68493..9aa3fd368383 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -128,6 +128,7 @@ enum v4l2_colorfx {
>  	V4L2_COLORFX_SOLARIZATION		= 13,
>  	V4L2_COLORFX_ANTIQUE			= 14,
>  	V4L2_COLORFX_SET_CBCR			= 15,
> +	V4L2_COLORFX_SET_RGB			= 16,
>  };
>  #define V4L2_CID_AUTOBRIGHTNESS			(V4L2_CID_BASE+32)
>  #define V4L2_CID_BAND_STOP_FILTER		(V4L2_CID_BASE+33)
> @@ -145,9 +146,10 @@ enum v4l2_colorfx {
>  
>  #define V4L2_CID_ALPHA_COMPONENT		(V4L2_CID_BASE+41)
>  #define V4L2_CID_COLORFX_CBCR			(V4L2_CID_BASE+42)
> +#define V4L2_CID_COLORFX_RGB			(V4L2_CID_BASE+43)
>  
>  /* last CID + 1 */
> -#define V4L2_CID_LASTP1                         (V4L2_CID_BASE+43)
> +#define V4L2_CID_LASTP1                         (V4L2_CID_BASE+44)
>  
>  /* USER-class private control IDs */
>  
> 

