Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3464BEE71
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2019 11:28:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727154AbfIZJ2E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Sep 2019 05:28:04 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:43865 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726548AbfIZJ2D (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Sep 2019 05:28:03 -0400
Received: from [IPv6:2001:420:44c1:2577:ecda:45b4:8d5:2e68] ([IPv6:2001:420:44c1:2577:ecda:45b4:8d5:2e68])
        by smtp-cloud7.xs4all.net with ESMTPA
        id DQ3xiCp4k9D4hDQ43i4Jq7; Thu, 26 Sep 2019 11:28:01 +0200
Subject: Re: [PATCH v3 4/5] media: v4l2-ctrl: Add jpeg enc exif mode control
To:     Xia Jiang <xia.jiang@mediatek.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rick Chang <rick.chang@mediatek.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>, srv_heupstream@mediatek.com
References: <20190924074303.22713-1-xia.jiang@mediatek.com>
 <20190924074303.22713-5-xia.jiang@mediatek.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <fe60c5f8-f7d8-38c0-795a-c0337c13bbd5@xs4all.nl>
Date:   Thu, 26 Sep 2019 11:27:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190924074303.22713-5-xia.jiang@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfAtWdxV9ZS2f3vdFfi7Eu69K4omUcJCIU2QZ8wqSCWIcKzNCXuWnzYBrapQRCTL51N6opoaUJ8ASyCtihHWaYuaRA85rxwtvUguFOFh5YlMsQuG/ZyaF
 +aw2PaUdmp9AEEAfmz51gYMdeOsBydWmMMjujgCk+NMXvCr5ONuEjJ2Y0FyRcQ/QdOK8mT9bwF3MKBnJt6yFe27l1Ktsw9xKBKEX/wLhZ2Y0G7++FLeUT7Ji
 nh2Pld/BE9MCXBkXLVt83tYvG6I0jFOcySMJwLGzI8LG3xRg7PbCjAzitm7LR5q/S1KbD3xZYOu7ZXlfZYnUESDiFd+3iW2+6EN5digZnU9/IZzZpVFd+K8n
 wN74eFJ0/6zZ9aO3QK5Yy6wO7g/honwJyFHgQ8atKAb1sKhvbDOXiLvs9fg1FxUHyO1XvVS44ojoC0dt2HUOEX0B43MVokwui7K0ZVNzvrJo/vHtMGzWCa/+
 CMNi/2nlVk0rr37ODc5oBkIHI6dm0H8nHwUW7neecY/PaVjFjqffNR6Wpe/v8iruMrNQGAsGdYR6aMLydDbSEN30j9bihESvD6sg4HADNKhCSINzfgBU3M97
 wMKxzh4ZBHWyfP7LNXh4tl3rted+3ZeR0RTR9tkFCw7w64lR0LrB18y5fvOLQN4MIB7hzUGX/5OnChW/k4hDoACToWdp4iPZH6vwH2poKDLa/cr7ZcHWzd8S
 KQDSPMlRF/OwFlwITQnxFn/nqqeMeQ6brCjx2m4YduanMRwBj0mQLQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/24/19 9:43 AM, Xia Jiang wrote:
> Add jpeg enc CID definition for exif mode control.
> 
> Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
> ---
> v3: new add patch for V4L2_CID_JPEG_ENABLE_EXIF
> ---
>  Documentation/media/uapi/v4l/ext-ctrls-jpeg.rst | 10 ++++++++++
>  drivers/media/v4l2-core/v4l2-ctrls.c            |  1 +
>  include/uapi/linux/v4l2-controls.h              |  2 ++
>  3 files changed, 13 insertions(+)
> 
> diff --git a/Documentation/media/uapi/v4l/ext-ctrls-jpeg.rst b/Documentation/media/uapi/v4l/ext-ctrls-jpeg.rst
> index 60ce3f949319..d44a539e2eb4 100644
> --- a/Documentation/media/uapi/v4l/ext-ctrls-jpeg.rst
> +++ b/Documentation/media/uapi/v4l/ext-ctrls-jpeg.rst
> @@ -109,5 +109,15 @@ JPEG Control IDs
>  
>  
>  
> +``V4L2_CID_JPEG_ENABLE_EXIF (integer)``
> +    ``V4L2_CID_JPEG_ENABLE_EXIF (integer)`` control determines JPEG
> +    encoder mode. Its value of 0 means JPEG mode, 1 means EXIF mode. If
> +    EXIF mode is enabled, the JPEG encoder will not write out SOI marker
> +    (start from 0xffd8) but write out from DQT marker(start from
> +    0xffdb). Software program can fill the EXIF content above the DQT
> +    marker to finish one EXIF JPEG.

I'm trying to understand what happens if this is set to 1. It looks like
the only difference is that the SOI marker (first two bytes) is not present,
but the compressed image starts directly with the DQT marker, right?

If that's the case, then I think it would make a lot more sense to support
the V4L2_CID_JPEG_ACTIVE_MARKER control and add the SOI to the active markers.

Regards,

	Hans

> +
> +
> +
>  For more details about JPEG specification, refer to :ref:`itu-t81`,
>  :ref:`jfif`, :ref:`w3c-jpeg-jfif`.
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index 371537dd8cd3..c96c10480ebd 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -1025,6 +1025,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_JPEG_RESTART_INTERVAL:	return "Restart Interval";
>  	case V4L2_CID_JPEG_COMPRESSION_QUALITY:	return "Compression Quality";
>  	case V4L2_CID_JPEG_ACTIVE_MARKER:	return "Active Markers";
> +	case V4L2_CID_JPEG_ENABLE_EXIF:		return "Enable Exif";
>  
>  	/* Image source controls */
>  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index a2669b79b294..da619f43de65 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -1022,6 +1022,8 @@ enum v4l2_jpeg_chroma_subsampling {
>  #define	V4L2_JPEG_ACTIVE_MARKER_DQT		(1 << 17)
>  #define	V4L2_JPEG_ACTIVE_MARKER_DHT		(1 << 18)
>  
> +#define	V4L2_CID_JPEG_ENABLE_EXIF		(V4L2_CID_JPEG_CLASS_BASE + 5)
> +
>  
>  /* Image source controls */
>  #define V4L2_CID_IMAGE_SOURCE_CLASS_BASE	(V4L2_CTRL_CLASS_IMAGE_SOURCE | 0x900)
> 

