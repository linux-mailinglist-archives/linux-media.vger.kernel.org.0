Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 422EA6687C4
	for <lists+linux-media@lfdr.de>; Fri, 13 Jan 2023 00:15:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232574AbjALXPy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Jan 2023 18:15:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232119AbjALXPv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Jan 2023 18:15:51 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB5081CB28
        for <linux-media@vger.kernel.org>; Thu, 12 Jan 2023 15:15:49 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A53FF327;
        Fri, 13 Jan 2023 00:15:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673565347;
        bh=6YSDcfI6alUvNZNK1c1b3FrBf0uS5DqEWs1CaYLnCl0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=r+IJa2+y/won67Ai3VsNFVBYLzffhFqjZ+kc+wRVwLI9MXUC8t51Ix2JEHu0rlrWb
         GtNhoFMkdldOdmAS+4uXZWylIOhAwTLcEFDdEmExq77q4lUX/vRk9QlLi//VJENFdO
         Gy6irbq9fS9vAjiJQziru4QtRgvgln+0F56nuiOw=
Date:   Fri, 13 Jan 2023 01:15:47 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        William Manley <will@williammanley.net>
Subject: Re: [PATCH] media: uvcvideo: Add GUID for BGRA/X 8:8:8:8
Message-ID: <Y8CUo17laYyY9/c2@pendragon.ideasonboard.com>
References: <20230110195331.175103-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230110195331.175103-1-marex@denx.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marek,

Thank you for the patch.

On Tue, Jan 10, 2023 at 08:53:31PM +0100, Marek Vasut wrote:
> The Cypress EZUSB FX3 UVC example can be configured to report pixel
> format "e436eb7e-524f-11ce-9f53-0020af0ba770". This is its GUID for
> BGRA/X 8:8:8:8.
> 
> The UVC 1.5 spec [1] only defines GUIDs for YUY2, NV12, M420 and I420.
> This seems to be an extension documented in the Microsoft Windows Media
> Format SDK[2]. This Media Format SDK defines this GUID as corresponding
> to `MEDIASUBTYPE_RGB32`.
> 
> Note that in my case, the FX3 UVC can output either channel order,
> BGR or RGB or any other mix for that matter. Since Linux commit
> 1b8dc32286a1a ("[media] uvcvideo: Add GUID for BGR 8:8:8")
> defined a GUID for `MEDIASUBTYPE_RGB24` channel order as BGR, keep
> this change consistent and define `MEDIASUBTYPE_RGB32` as BGR as well.

I'd like to see documentation of the MEDIASUBTYPE_RGB32 format that
indicates the components order precisely. While there's a high chance it
maps to a BGR (in the V4L2 nomenclature) format, there would still be
two different options for the A or X component.

> [1]: https://www.usb.org/document-library/video-class-v15-document-set
> [2]: https://learn.microsoft.com/en-us/windows/win32/wmformat/media-type-identifiers
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: William Manley <will@williammanley.net>
> ---
>  include/media/v4l2-uvc.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/include/media/v4l2-uvc.h b/include/media/v4l2-uvc.h
> index f83e31661333b..c10e9086338be 100644
> --- a/include/media/v4l2-uvc.h
> +++ b/include/media/v4l2-uvc.h
> @@ -99,6 +99,9 @@
>  #define UVC_GUID_FORMAT_BGR3 \
>  	{ 0x7d, 0xeb, 0x36, 0xe4, 0x4f, 0x52, 0xce, 0x11, \
>  	 0x9f, 0x53, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70}
> +#define UVC_GUID_FORMAT_BGR4 \
> +	{ 0x7e, 0xeb, 0x36, 0xe4, 0x4f, 0x52, 0xce, 0x11, \
> +	 0x9f, 0x53, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70}
>  #define UVC_GUID_FORMAT_M420 \
>  	{ 'M',  '4',  '2',  '0', 0x00, 0x00, 0x10, 0x00, \
>  	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
> @@ -266,6 +269,11 @@ static struct uvc_format_desc uvc_fmts[] = {
>  		.guid		= UVC_GUID_FORMAT_BGR3,
>  		.fcc		= V4L2_PIX_FMT_BGR24,
>  	},
> +	{
> +		.name		= "BGRA/X 8:8:8:8 (BGR4)",
> +		.guid		= UVC_GUID_FORMAT_BGR4,
> +		.fcc		= V4L2_PIX_FMT_BGR32,
> +	},
>  	{
>  		.name		= "H.264",
>  		.guid		= UVC_GUID_FORMAT_H264,

-- 
Regards,

Laurent Pinchart
