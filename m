Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E84EE4D31FE
	for <lists+linux-media@lfdr.de>; Wed,  9 Mar 2022 16:43:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232409AbiCIPo0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Mar 2022 10:44:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231629AbiCIPoZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Mar 2022 10:44:25 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA1EEB46
        for <linux-media@vger.kernel.org>; Wed,  9 Mar 2022 07:43:26 -0800 (PST)
Received: from [IPV6:2a01:e0a:169:7140:3734:287e:1a7f:9772] (unknown [IPv6:2a01:e0a:169:7140:3734:287e:1a7f:9772])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3E9D3A50;
        Wed,  9 Mar 2022 16:43:25 +0100 (CET)
Message-ID: <98056b10-32da-4a17-6235-ccb6101db2aa@gmail.com>
Date:   Wed, 9 Mar 2022 16:43:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 2/5] media: media.h: Add new media link type
Content-Language: en-US
To:     Daniel Scally <djrscally@gmail.com>, linux-media@vger.kernel.org,
        libcamera-devel@lists.libcamera.org
Cc:     sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        hanlinchen@chromium.org, tfiga@chromium.org, hdegoede@redhat.com,
        kieran.bingham@ideasonboard.com, hpa@redhat.com
References: <20220302220304.1327896-1-djrscally@gmail.com>
 <20220302220304.1327896-3-djrscally@gmail.com>
From:   Jean-Michel Hautbois <jeanmichel.hautbois@gmail.com>
In-Reply-To: <20220302220304.1327896-3-djrscally@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.7 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
        FORGED_GMAIL_RCVD,FREEMAIL_FROM,NICE_REPLY_A,NML_ADSP_CUSTOM_MED,
        SPF_HELO_PASS,SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi !

Thanks for the patch !

On 02/03/2022 23:03, Daniel Scally wrote:
> To describe in the kernel the connection between devices and their
> supporting peripherals (for example, a camera sensor and the vcm
> driving the focusing lens for it), add a new type of media link
> to introduce the concept of these ancillary links.
> 
> Add some elements to the uAPI documentation to explain the new link
> type, their purpose and some aspects of their current implementation.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Daniel Scally <djrscally@gmail.com>

Reviewed-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
> ---
> 
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
>   .../media/mediactl/media-controller-model.rst   |  6 ++++++
>   .../media/mediactl/media-types.rst              | 17 ++++++++++++-----
>   include/uapi/linux/media.h                      |  1 +
>   3 files changed, 19 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/mediactl/media-controller-model.rst b/Documentation/userspace-api/media/mediactl/media-controller-model.rst
> index 222cb99debb5..78bfdfb2a322 100644
> --- a/Documentation/userspace-api/media/mediactl/media-controller-model.rst
> +++ b/Documentation/userspace-api/media/mediactl/media-controller-model.rst
> @@ -33,3 +33,9 @@ are:
>   
>   -  An **interface link** is a point-to-point bidirectional control
>      connection between a Linux Kernel interface and an entity.
> +
> +- An **ancillary link** is a point-to-point connection denoting that two
> +  entities form a single logical unit. For example this could represent the
> +  fact that a particular camera sensor and lens controller form a single
> +  physical module, meaning this lens controller drives the lens for this
> +  camera sensor.
> \ No newline at end of file
> diff --git a/Documentation/userspace-api/media/mediactl/media-types.rst b/Documentation/userspace-api/media/mediactl/media-types.rst
> index 0a26397bd01d..60747251d409 100644
> --- a/Documentation/userspace-api/media/mediactl/media-types.rst
> +++ b/Documentation/userspace-api/media/mediactl/media-types.rst
> @@ -412,14 +412,21 @@ must be set for every pad.
>   	  is set by drivers and is read-only for applications.
>   
>       *  -  ``MEDIA_LNK_FL_LINK_TYPE``
> -       -  This is a bitmask that defines the type of the link. Currently,
> -	  two types of links are supported:
> +       -  This is a bitmask that defines the type of the link. The following
> +	  link types are currently supported:
>   
>   	  .. _MEDIA-LNK-FL-DATA-LINK:
>   
> -	  ``MEDIA_LNK_FL_DATA_LINK`` if the link is between two pads
> +	  ``MEDIA_LNK_FL_DATA_LINK`` for links that represent a data connection
> +     between two pads.
>   
>   	  .. _MEDIA-LNK-FL-INTERFACE-LINK:
>   
> -	  ``MEDIA_LNK_FL_INTERFACE_LINK`` if the link is between an
> -	  interface and an entity
> +	  ``MEDIA_LNK_FL_INTERFACE_LINK`` for links that associate an entity to its
> +     interface.
> +
> +	  .. _MEDIA-LNK-FL-ANCILLARY-LINK:
> +
> +	  ``MEDIA_LNK_FL_ANCILLARY_LINK`` for links that represent a physical
> +     relationship between two entities. The link may or may not be ummutable, so
> +     applications must not assume either case.
> \ No newline at end of file
> diff --git a/include/uapi/linux/media.h b/include/uapi/linux/media.h
> index 200fa8462b90..afbae7213d35 100644
> --- a/include/uapi/linux/media.h
> +++ b/include/uapi/linux/media.h
> @@ -226,6 +226,7 @@ struct media_pad_desc {
>   #define MEDIA_LNK_FL_LINK_TYPE			(0xf << 28)
>   #  define MEDIA_LNK_FL_DATA_LINK		(0 << 28)
>   #  define MEDIA_LNK_FL_INTERFACE_LINK		(1 << 28)
> +#  define MEDIA_LNK_FL_ANCILLARY_LINK		(2 << 28)
>   
>   struct media_link_desc {
>   	struct media_pad_desc source;

