Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 949344A7B90
	for <lists+linux-media@lfdr.de>; Thu,  3 Feb 2022 00:15:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347979AbiBBXPs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Feb 2022 18:15:48 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:36898 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236305AbiBBXPs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Feb 2022 18:15:48 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0B75B49C;
        Thu,  3 Feb 2022 00:15:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1643843747;
        bh=AYRpR73QY2e/AQLiWfzpyBaCApS8oGaOCfqjTTtth7s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QdHFKNpo7bi6tbPStbB6ZE7ODXa5c8YMsJZepyyG+BymGjSPL/bk8E5y38Pdl1qby
         YQ0J7Frc+ieTL+RxTLQfQbLZZQLoiaUiPqJLl1A/MbCNqydXt7dAFQkEQ+MK4u+a7r
         fTzPCFlQcQBmkIDax4/qpg4pX7DtQJNZUG2bY5Qo=
Date:   Thu, 3 Feb 2022 01:15:24 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org,
        sakari.ailus@linux.intel.com, hanlinchen@chromium.org,
        tfiga@chromium.org, hdegoede@redhat.com,
        kieran.bingham@ideasonboard.com, hpa@redhat.com
Subject: Re: [PATCH v2 2/6] media: media.h: Add new media link type
Message-ID: <YfsQjHHVQovjcfhy@pendragon.ideasonboard.com>
References: <20220130235821.48076-1-djrscally@gmail.com>
 <20220130235821.48076-3-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220130235821.48076-3-djrscally@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dan,

Thank you for the patch.

On Sun, Jan 30, 2022 at 11:58:17PM +0000, Daniel Scally wrote:
> To describe in the kernel the connection between devices and their
> supporting peripherals (for example, a camera sensor and the vcm
> driving the focusing lens for it), add a new type of media link
> to introduce the concept of these ancillary links.
> 
> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> ---
> Changes since v1:
> 
> 	- None
> 
> changes since the rfc:
> 
> 	- Split out into its own patch (mostly so it can be followed by patch
> 	#3, which corrects some media-core code that is otherwise broken by the
> 	new links)
> 
>  include/uapi/linux/media.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/uapi/linux/media.h b/include/uapi/linux/media.h
> index 200fa8462b90..afbae7213d35 100644
> --- a/include/uapi/linux/media.h
> +++ b/include/uapi/linux/media.h
> @@ -226,6 +226,7 @@ struct media_pad_desc {
>  #define MEDIA_LNK_FL_LINK_TYPE			(0xf << 28)
>  #  define MEDIA_LNK_FL_DATA_LINK		(0 << 28)
>  #  define MEDIA_LNK_FL_INTERFACE_LINK		(1 << 28)
> +#  define MEDIA_LNK_FL_ANCILLARY_LINK		(2 << 28)

I'd squash this with 3/6. Apart from that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  
>  struct media_link_desc {
>  	struct media_pad_desc source;

-- 
Regards,

Laurent Pinchart
