Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9911F4A7BAB
	for <lists+linux-media@lfdr.de>; Thu,  3 Feb 2022 00:25:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244893AbiBBXZa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Feb 2022 18:25:30 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:37190 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229764AbiBBXZ3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Feb 2022 18:25:29 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7BE2049C;
        Thu,  3 Feb 2022 00:25:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1643844327;
        bh=2RnGRtWIEbphzDn7PAsZusOTl0r/GybEkms85H1ZZQE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vg4P8s6qHMV9kOTUmICJlnBpWEZVvZ9QxYBw4zu2/MEQZ2+vncf/TChBZ3fOINF4+
         +2yOnvdLbryHvsUO+Dk+KicuwJgLNwFncupzuZmI18QAaaJuT+p5eRS/1wf0bzUhAq
         Y2axZG1ZU6qaHqmgRlJC26mrBnaHlizxRhX28isQ=
Date:   Thu, 3 Feb 2022 01:25:04 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org,
        sakari.ailus@linux.intel.com, hanlinchen@chromium.org,
        tfiga@chromium.org, hdegoede@redhat.com,
        kieran.bingham@ideasonboard.com, hpa@redhat.com
Subject: Re: [PATCH v2 3/6] media: docs: Add entries documenting ancillary
 links
Message-ID: <YfsS0LOqZQvW0Ehp@pendragon.ideasonboard.com>
References: <20220130235821.48076-1-djrscally@gmail.com>
 <20220130235821.48076-4-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220130235821.48076-4-djrscally@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dan,

Thank you for the patch.

On Sun, Jan 30, 2022 at 11:58:18PM +0000, Daniel Scally wrote:
> Add some elements to the uAPI documentation to explain the new link
> type, their purpose and some aspects of their current implementation.
> 
> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> ---
> Changes since v1:
> 
> 	- New patch
> 
>  .../media/mediactl/media-controller-model.rst            | 6 ++++++
>  .../userspace-api/media/mediactl/media-types.rst         | 9 ++++++++-
>  2 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/userspace-api/media/mediactl/media-controller-model.rst b/Documentation/userspace-api/media/mediactl/media-controller-model.rst
> index 222cb99debb5..f77cb9d952e5 100644
> --- a/Documentation/userspace-api/media/mediactl/media-controller-model.rst
> +++ b/Documentation/userspace-api/media/mediactl/media-controller-model.rst
> @@ -33,3 +33,9 @@ are:
>  
>  -  An **interface link** is a point-to-point bidirectional control
>     connection between a Linux Kernel interface and an entity.
> +
> +- An **ancillary link** is a point-to-point connection describing a physical
> +  relationship between two entities. For example this could represent the
> +  fact that a particular camera sensor and lens controller form a single
> +  physical module, meaning this lens controller drives the lens for this
> +  camera sensor.
> \ No newline at end of file
> diff --git a/Documentation/userspace-api/media/mediactl/media-types.rst b/Documentation/userspace-api/media/mediactl/media-types.rst
> index 0a26397bd01d..d69bae359e5b 100644
> --- a/Documentation/userspace-api/media/mediactl/media-types.rst
> +++ b/Documentation/userspace-api/media/mediactl/media-types.rst
> @@ -413,7 +413,7 @@ must be set for every pad.
>  
>      *  -  ``MEDIA_LNK_FL_LINK_TYPE``
>         -  This is a bitmask that defines the type of the link. Currently,
> -	  two types of links are supported:
> +	  three types of links are supported:

Let's avoid having to patch this every time:

       -  This is a bitmask that defines the type of the link. The following
	  types of links are supported:

>  
>  	  .. _MEDIA-LNK-FL-DATA-LINK:
>  
> @@ -423,3 +423,10 @@ must be set for every pad.
>  
>  	  ``MEDIA_LNK_FL_INTERFACE_LINK`` if the link is between an
>  	  interface and an entity
> +
> +	  .. _MEDIA-LNK-FL-ANCILLARY-LINK:
> +
> +	  ``MEDIA_LNK_FL_ANCILLARY_LINK`` if the link is between two
> +	  different entities. This at present implies both MEDIA_LNK_FL_ENABLED
> +	  and MEDIA_LNK_FL_IMMUTABLE, however applications should not rely on
> +	  that being the case in the future.

Let's describe what the link represents:

	  ``MEDIA_LNK_FL_ANCILLARY_LINK`` for links that represent a physical
	  relationship between two entities.

You could also update the previous items similarly:

	  ``MEDIA_LNK_FL_DATA_LINK`` for links thatrepresent a data connection
	  between two pads.

 	  ``MEDIA_LNK_FL_INTERFACE_LINK`` for links that associate an entity
	  and its interface.

Let's also not tell that it impllies ENABLED and IMMUTABLE if
applications shouldn't rely on this:

	  The link may or may not be immutable, applications must not assume
	  either case as always being true.

-- 
Regards,

Laurent Pinchart
