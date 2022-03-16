Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B0A04DAD4D
	for <lists+linux-media@lfdr.de>; Wed, 16 Mar 2022 10:15:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233852AbiCPJQp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Mar 2022 05:16:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243385AbiCPJQj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Mar 2022 05:16:39 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF7C35DE73
        for <linux-media@vger.kernel.org>; Wed, 16 Mar 2022 02:15:24 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C07F5A67;
        Wed, 16 Mar 2022 10:15:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647422123;
        bh=bMKYMZmy8ivzPJNiu40rAIvxg9YHyNI//oATxdZd9q0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DdtBRXBFXUDvsJO5vQ685jKm+p2cWhK5UY1OMmzZUPUUNeRUwLUgCIMGkfMFbv0qN
         yHsICVc6n2TGkLGv/gYLQeUmBHZNypmEijj8WqoN1F2xsXnoZhZ7CUgindmMYMXqG+
         5Nx01akmixQWytvVAzYihpptajvY3rD+9VxDp5SQ=
Date:   Wed, 16 Mar 2022 11:15:05 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl
Subject: Re: [PATCH v3 2/5] mc: media_device_init() initialises a
 media_device, not media_entity
Message-ID: <YjGqmegqL0sWwtFz@pendragon.ideasonboard.com>
References: <20220309163112.11708-1-sakari.ailus@linux.intel.com>
 <20220309163112.11708-3-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220309163112.11708-3-sakari.ailus@linux.intel.com>
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

On Wed, Mar 09, 2022 at 06:31:09PM +0200, Sakari Ailus wrote:
> The documentation for media_device_init() had several references to
> (struct) media_entity where it should have referred to struct media_device
> instead. Fix this.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  include/media/media-device.h | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/include/media/media-device.h b/include/media/media-device.h
> index 7d5b212792a5..bc015d2cf541 100644
> --- a/include/media/media-device.h
> +++ b/include/media/media-device.h
> @@ -249,28 +249,28 @@ void media_device_cleanup(struct media_device *mdev);
>   * The caller is responsible for initializing the &media_device structure
>   * before registration. The following fields of &media_device must be set:
>   *
> - *  - &media_entity.dev must point to the parent device (usually a &pci_dev,
> + *  - &media_device.dev must point to the parent device (usually a &pci_dev,
>   *    &usb_interface or &platform_device instance).
>   *
> - *  - &media_entity.model must be filled with the device model name as a
> + *  - &media_device.model must be filled with the device model name as a
>   *    NUL-terminated UTF-8 string. The device/model revision must not be
>   *    stored in this field.
>   *
>   * The following fields are optional:
>   *
> - *  - &media_entity.serial is a unique serial number stored as a
> + *  - &media_device.serial is a unique serial number stored as a
>   *    NUL-terminated ASCII string. The field is big enough to store a GUID
>   *    in text form. If the hardware doesn't provide a unique serial number
>   *    this field must be left empty.
>   *
> - *  - &media_entity.bus_info represents the location of the device in the
> + *  - &media_device.bus_info represents the location of the device in the
>   *    system as a NUL-terminated ASCII string. For PCI/PCIe devices
> - *    &media_entity.bus_info must be set to "PCI:" (or "PCIe:") followed by
> + *    &media_device.bus_info must be set to "PCI:" (or "PCIe:") followed by
>   *    the value of pci_name(). For USB devices,the usb_make_path() function
>   *    must be used. This field is used by applications to distinguish between
>   *    otherwise identical devices that don't provide a serial number.
>   *
> - *  - &media_entity.hw_revision is the hardware device revision in a
> + *  - &media_device.hw_revision is the hardware device revision in a
>   *    driver-specific format. When possible the revision should be formatted
>   *    with the KERNEL_VERSION() macro.
>   *

-- 
Regards,

Laurent Pinchart
