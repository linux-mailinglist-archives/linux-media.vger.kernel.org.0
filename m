Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD7A04D379D
	for <lists+linux-media@lfdr.de>; Wed,  9 Mar 2022 18:45:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235979AbiCIRRh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Mar 2022 12:17:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237147AbiCIRRa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Mar 2022 12:17:30 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C75CD21CA
        for <linux-media@vger.kernel.org>; Wed,  9 Mar 2022 09:15:14 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 156BE8C4;
        Wed,  9 Mar 2022 18:15:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646846113;
        bh=zv8Tr35r8uQyqouLZt9iSeCUNL1ZIPFTJxH5hXY3Hb4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HJ3ewKlNPO6dTDaNjlFBHOstgfZIYR51esYKnb2SpVcYInwuXAEAKN1p4p9g7uETl
         rs7zl1lbhUtSuPWqQDCMkPWTndqZjsS3VU2KEwRPW3aWd88LlZg30/B/Nxwe7iKQNC
         tymYRfA2YroxX5dXUQTaRi0hiavAGhhGN505JSds=
Date:   Wed, 9 Mar 2022 19:14:58 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 1/1] media: Documentation: mc: Add
 media_device_{init,cleanup}
Message-ID: <Yijgknjnti4LgNqL@pendragon.ideasonboard.com>
References: <20220309171006.12327-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220309171006.12327-1-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Wed, Mar 09, 2022 at 07:10:06PM +0200, Sakari Ailus wrote:
> Document that drivers must first initialise a media device before
> registering it, and clean up once the media device is unregistered.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  Documentation/driver-api/media/mc-core.rst | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/driver-api/media/mc-core.rst b/Documentation/driver-api/media/mc-core.rst
> index 57b5bbba944e..02481a2513b9 100644
> --- a/Documentation/driver-api/media/mc-core.rst
> +++ b/Documentation/driver-api/media/mc-core.rst
> @@ -42,9 +42,16 @@ Allocation of the structure is handled by the media device driver, usually by
>  embedding the :c:type:`media_device` instance in a larger driver-specific
>  structure.
>  
> -Drivers register media device instances by calling
> -:c:func:`__media_device_register()` via the macro ``media_device_register()``
> -and unregistered by calling :c:func:`media_device_unregister()`.
> +Drivers initialise media device instances by calling
> +:c:func:`media_device_init()`. After initialising a media device instance, it is
> +registered by calling :c:func:`__media_device_register()` via the macro
> +``media_device_register()`` and unregistered by calling
> +:c:func:`media_device_unregister()`. An initialised media device must be
> +eventually cleaned up by calling :c:func:`media_device_cleanup()`.
> +
> +Note that it is not allowed to unregister a media device instance that was not
> +previously registered, or clean up a media device instance that was not
> +previously initialised.

Could we fix this, to simplify drivers ? This patch is fine as it
documents the current behaviour, so

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

but it will need to be updated. Bonus points if the update can go in a
v2 ;-)

>  Entities
>  ^^^^^^^^

-- 
Regards,

Laurent Pinchart
