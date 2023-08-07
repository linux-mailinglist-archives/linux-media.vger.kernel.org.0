Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5E8D771DC5
	for <lists+linux-media@lfdr.de>; Mon,  7 Aug 2023 12:09:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230495AbjHGKJt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Aug 2023 06:09:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230294AbjHGKJt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Aug 2023 06:09:49 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0755D10F1
        for <linux-media@vger.kernel.org>; Mon,  7 Aug 2023 03:09:47 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3FB002C6;
        Mon,  7 Aug 2023 12:08:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1691402919;
        bh=r7n5d8aQgUNNQvScA/F/aKOfTnT3JKxcZ9aAJ3LCwd0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lwyUJFiiIBNTdI6HWqbGCAvVMShKo+buafbl4Lc7r9x3owDeiv4s5FLt/4P0SDXpK
         F9dyhxCFPyxWT46fdOCov9aAXEmSstIUgOKpi1LTTSSv6UQbxN49kSksZ35pBTevN1
         wOz43d//pjrZP/0m8NVNBId8UcbG8OSgXDkuwG0s=
Date:   Mon, 7 Aug 2023 13:09:51 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, wentong.wu@intel.com
Subject: Re: [PATCH v2 1/1] media: ivsc: Improve Kconfig help text
Message-ID: <20230807100951.GK12951@pendragon.ideasonboard.com>
References: <20230807074059.3028144-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230807074059.3028144-1-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Mon, Aug 07, 2023 at 10:40:59AM +0300, Sakari Ailus wrote:
> Improve the Kconfig help text to convey the ACE is for changing camera
> sensor ownership and CSI for configuring the CSI-2 rx and tx.
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> since v1:
> 
> - Reworded most of the help text.
> 
>  drivers/media/pci/intel/ivsc/Kconfig | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ivsc/Kconfig b/drivers/media/pci/intel/ivsc/Kconfig
> index 9535ac10f4f7..ec4ade92f583 100644
> --- a/drivers/media/pci/intel/ivsc/Kconfig
> +++ b/drivers/media/pci/intel/ivsc/Kconfig
> @@ -7,6 +7,12 @@ config INTEL_VSC
>  	help
>  	  This adds support for Intel Visual Sensing Controller (IVSC).
>  
> -	  Enables the IVSC firmware services required for controlling
> -	  camera sensor ownership and CSI-2 link through Image Processing
> -	  Unit(IPU) driver of Intel.
> +	  The IVSC support is split into two devices, ACE (Algorithm
> +	  Context Engine) and CSI (Camera Serial Interface), each of which
> +	  have their own drivers. The ACE is used to select the ownership
> +	  of the sensor between the IVSC and the host CPU while the CSI is
> +	  used to both select the routing destination for the data the
> +	  sensor transmits over the CSI-2 bus between the IVSC and the
> +	  host CPU and to configure the CSI-2 bus itself.
> +
> +	  The modules will be called ivsc-ace and ivsc-csi.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Side question though: as those two modules are always used together,
could they be squashed into a single module ?

-- 
Regards,

Laurent Pinchart
