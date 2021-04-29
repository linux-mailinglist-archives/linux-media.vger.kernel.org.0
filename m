Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8951736E5C0
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 09:16:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237247AbhD2HRd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Apr 2021 03:17:33 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:33311 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237128AbhD2HRc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Apr 2021 03:17:32 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id c0ublp8LfiDzSc0uflkOHR; Thu, 29 Apr 2021 09:16:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1619680605; bh=xnnCKfyaJF/eAf+XEZujExVF4AzU7qrZb69GBTxgIEg=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=wsclS3CMRp2+5ueH/aaPIVYdhexV0rultZnjXTgu6xoe+fEAJhXJa8lyOTEK6nwHg
         G8ZdfBVfbchlRru5O/Q3C1EwlizqAnlqlK/72aVlsl1YhrEIsByJMjdsSBbRtsNlPh
         8sCEGmWCb6UP9Qp89p1LesWZaNPxmnt7jR2NRS2Emfnjdet+CE+AYsjN77xFJHoRG4
         ITiqKhwtHRzYUjQfAxXJHkTX2257RjB07q3kEBLpba6uHQ9Vi534Ab47yps2QeCvps
         bre6RqtzTNEqsvBiBpPeiIdo60d3VBZkPfcH0uJ6JwOzG6wYAMbVQ+WJlahV1pGirB
         PZ1k9cm6D/opg==
Subject: Re: [PATCH v4 04/15] media: add Mediatek's MM21 format
To:     Alexandre Courbot <acourbot@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Yunfei Dong <yunfei.dong@mediatek.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org
References: <20210427111526.1772293-1-acourbot@chromium.org>
 <20210427111526.1772293-5-acourbot@chromium.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <25f9bfc5-7e69-20cc-7078-8783bba2f877@xs4all.nl>
Date:   Thu, 29 Apr 2021 09:16:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210427111526.1772293-5-acourbot@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfEjD42wv31KGxQzYuQpkZN3n+BoYeNWkPjTUn1ucJATssoAXLUWM7q0ypLRz+BKn1G02eTkdC+wuEYSoJ64rvGv2sJzFfpmT5jae5uqrLqWeGrI5leBn
 8/L1IZVhwJQlnjhvDc8qYadwWEm8AvuUDp/rB22FkDdU0aBH0vJx9Hy/USDlIrSciCSVhJMiaG6Ia5QERb2duaZbOhbaC6JR8pBHqxbu4tEDI+jOeP5zOTQu
 CK1rKHHPJ9QA5PoVsoVdOWMAYgLH7QwIbAtSsb7eO3f/bZ5qU5yuWjVXSfjTmZf70Hin6JQGXay4/NNIwt21H8r0sbNcX+vWb1e3yaoo7+t/SsOYGZC0M85I
 P/bhVlD8lXg6hTw02/Eo45Pnc1Iuuc1fKHo/X2p/amfv3+SsWcK86Xj0b12yYn5+MXiOdO2c02ZzDfmV5Dh7xI61iCcmOh/dtoo+KYqyVxefl7I/91tdhmrU
 UPglvFXIR/vL+Mjrg2TeXh0ETenpPprLH1gkAQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 27/04/2021 13:15, Alexandre Courbot wrote:
> Add Mediatek's non-compressed 8 bit block video mode. This format is
> produced by the MT8183 codec and can be converted to a non-proprietary
> format by the MDP3 component.
> 
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> ---
>  Documentation/userspace-api/media/v4l/pixfmt-reserved.rst | 7 +++++++
>  drivers/media/v4l2-core/v4l2-ioctl.c                      | 1 +
>  include/uapi/linux/videodev2.h                            | 1 +
>  3 files changed, 9 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
> index 0b879c0da713..42357b0b3535 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
> @@ -246,6 +246,13 @@ please make a proposal on the linux-media mailing list.
>  	It is an opaque intermediate format and the MDP hardware must be
>  	used to convert ``V4L2_PIX_FMT_MT21C`` to ``V4L2_PIX_FMT_NV12M``,
>  	``V4L2_PIX_FMT_YUV420M`` or ``V4L2_PIX_FMT_YVU420``.
> +    * .. _V4L2-PIX-FMT-MM21:
> +
> +      - ``V4L2_PIX_FMT_MM21``
> +      - 'MM21'
> +      - Non-compressed, tiled two-planar format used by Mediatek MT8183.
> +	This is an opaque intermediate format and the MDP3 hardware can be
> +	used to convert it to other formats.
>      * .. _V4L2-PIX-FMT-SUNXI-TILED-NV12:
>  
>        - ``V4L2_PIX_FMT_SUNXI_TILED_NV12``
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 6a5d1c6d11d6..608e3ddc0f42 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1385,6 +1385,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  	case V4L2_PIX_FMT_TM6000:	descr = "A/V + VBI Mux Packet"; break;
>  	case V4L2_PIX_FMT_CIT_YYVYUY:	descr = "GSPCA CIT YYVYUY"; break;
>  	case V4L2_PIX_FMT_KONICA420:	descr = "GSPCA KONICA420"; break;
> +	case V4L2_PIX_FMT_MM21:		descr = "Mediatek 8-bit block format"; break;

block format -> Block Format

(to be consistent with the other descriptions)

Regards,

	Hans

>  	case V4L2_PIX_FMT_HSV24:	descr = "24-bit HSV 8-8-8"; break;
>  	case V4L2_PIX_FMT_HSV32:	descr = "32-bit XHSV 8-8-8-8"; break;
>  	case V4L2_SDR_FMT_CU8:		descr = "Complex U8"; break;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 311a01cc5775..db04e37da1a8 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -733,6 +733,7 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_Y12I     v4l2_fourcc('Y', '1', '2', 'I') /* Greyscale 12-bit L/R interleaved */
>  #define V4L2_PIX_FMT_Z16      v4l2_fourcc('Z', '1', '6', ' ') /* Depth data 16-bit */
>  #define V4L2_PIX_FMT_MT21C    v4l2_fourcc('M', 'T', '2', '1') /* Mediatek compressed block mode  */
> +#define V4L2_PIX_FMT_MM21     v4l2_fourcc('M', 'M', '2', '1') /* Mediatek 8-bit block mode, two non-contiguous planes */
>  #define V4L2_PIX_FMT_INZI     v4l2_fourcc('I', 'N', 'Z', 'I') /* Intel Planar Greyscale 10-bit and Depth 16-bit */
>  #define V4L2_PIX_FMT_SUNXI_TILED_NV12 v4l2_fourcc('S', 'T', '1', '2') /* Sunxi Tiled NV12 Format */
>  #define V4L2_PIX_FMT_CNF4     v4l2_fourcc('C', 'N', 'F', '4') /* Intel 4-bit packed depth confidence information */
> 

