Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B1862C19D
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2019 10:48:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726438AbfE1Ir7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 May 2019 04:47:59 -0400
Received: from retiisi.org.uk ([95.216.213.190]:41476 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725943AbfE1Ir7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 May 2019 04:47:59 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 85E1F634C7B;
        Tue, 28 May 2019 11:47:55 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.89)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1hVXlz-0000JM-Dh; Tue, 28 May 2019 11:47:55 +0300
Date:   Tue, 28 May 2019 11:47:55 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH] media-ioc-enum-links.rst: fix incorrect reserved field
 documentation
Message-ID: <20190528084755.2r6zhrzh4r6lbg3p@valkosipuli.retiisi.org.uk>
References: <db111993-2071-3023-56c2-1bffc83eb994@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db111993-2071-3023-56c2-1bffc83eb994@xs4all.nl>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, May 27, 2019 at 11:11:32AM +0200, Hans Verkuil wrote:
> The reserved field array for struct media_link_desc has length 2, not 4.
> 
> And the reserved field array of struct media_links_enum was never documented
> at all.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

> ---
> diff --git a/Documentation/media/uapi/mediactl/media-ioc-enum-links.rst b/Documentation/media/uapi/mediactl/media-ioc-enum-links.rst
> index a982f16e55a4..b827ebc398f8 100644
> --- a/Documentation/media/uapi/mediactl/media-ioc-enum-links.rst
> +++ b/Documentation/media/uapi/mediactl/media-ioc-enum-links.rst
> @@ -84,6 +84,11 @@ returned during the enumeration process.
>         -  Pointer to a links array allocated by the application. Ignored if
>  	  NULL.
> 
> +    *  -  __u32
> +       -  ``reserved[4]``
> +       -  Reserved for future extensions. Drivers and applications must set
> +          the array to zero.
> +
> 
>  .. c:type:: media_pad_desc
> 
> @@ -135,7 +140,7 @@ returned during the enumeration process.
>         -  Link flags, see :ref:`media-link-flag` for more details.
> 
>      *  -  __u32
> -       -  ``reserved[4]``
> +       -  ``reserved[2]``
>         -  Reserved for future extensions. Drivers and applications must set
>            the array to zero.
> 

-- 
Sakari Ailus
