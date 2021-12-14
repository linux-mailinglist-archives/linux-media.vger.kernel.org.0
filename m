Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DF54474D59
	for <lists+linux-media@lfdr.de>; Tue, 14 Dec 2021 22:50:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231402AbhLNVu1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Dec 2021 16:50:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231130AbhLNVu1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Dec 2021 16:50:27 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF1CCC061574
        for <linux-media@vger.kernel.org>; Tue, 14 Dec 2021 13:50:26 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 372B18C4;
        Tue, 14 Dec 2021 22:50:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1639518622;
        bh=52C3i2QePa+o3YzlRI28JWYWcIOPIQ5lcMc66Tn0caY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HRBqn3GHyonCFU+E1uwtWGEssgooG0RD0DjV29s1bTwL3IHQ/2gbB9h+jRlj3djcW
         TAE+ztSh1oIgS+VOdwqY3bw2yqqVEpkA5Sm9HIL2rKO96hAOYz/6PB26K7yEpiP7wU
         WPyYZ9LlkU/ueUKY++J6eyiYcLH1o+XDTu4npdjI=
Date:   Tue, 14 Dec 2021 23:50:19 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org,
        sakari.ailus@linux.intel.com, hanlinchen@chromium.org,
        tfiga@chromium.org, hdegoede@redhat.com,
        kieran.bingham@ideasonboard.com, hpa@redhat.com
Subject: Re: [PATCH 1/5] media: media.h: Add new media link type
Message-ID: <YbkRmyQp4SfWLeY1@pendragon.ideasonboard.com>
References: <20211213232849.40071-1-djrscally@gmail.com>
 <20211213232849.40071-2-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211213232849.40071-2-djrscally@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

Thank you for the patch.

On Mon, Dec 13, 2021 at 11:28:45PM +0000, Daniel Scally wrote:
> To describe in the kernel the connection between devices and their
> supporting peripherals (for example, a camera sensor and the vcm
> driving the focusing lens for it), add a new type of media link
> to introduce the concept of these ancillary links.
> 
> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> ---
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

This needs documentation in
Documentation/userspace-api/media/mediactl/media-types.rst and in
media-controller-model.rst. The latter should probably be a bit more
detailed to explain the use cases with at least one example.

>  
>  struct media_link_desc {
>  	struct media_pad_desc source;

-- 
Regards,

Laurent Pinchart
