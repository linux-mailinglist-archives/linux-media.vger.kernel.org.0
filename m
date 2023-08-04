Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A07E877022E
	for <lists+linux-media@lfdr.de>; Fri,  4 Aug 2023 15:48:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231375AbjHDNsY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Aug 2023 09:48:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231393AbjHDNsW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Aug 2023 09:48:22 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C8AC170F
        for <linux-media@vger.kernel.org>; Fri,  4 Aug 2023 06:48:21 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EAA102E4;
        Fri,  4 Aug 2023 15:47:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1691156835;
        bh=v2LZ0KJNV0puJsodvxtXlpCP3RvffV46bCpcbYuP3sk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GYCDeW3grhVfEb0tshEG320TtB7PtAiGmC1d1bfH9dwuEz+wG8oCK7grVGFta7Jvo
         PEklLGfQzKCSbdCj9QdXi3EFxvTRCXQYtIlH4UuSYH2ODNoE8Gh5x6tMvL3ypfRri/
         dmsWUtvzYSzX4tEiGaNQ6oU6u/SIvG5tOG4Atp00=
Date:   Fri, 4 Aug 2023 16:48:25 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, wentong.wu@intel.com
Subject: Re: [PATCH 1/1] media: ivsc: Improve Kconfig help text
Message-ID: <20230804134825.GF12951@pendragon.ideasonboard.com>
References: <20230804105226.3022473-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230804105226.3022473-1-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Fri, Aug 04, 2023 at 01:52:26PM +0300, Sakari Ailus wrote:
> Improve the Kconfig help text to convey the ACE is for changing camera
> sensor ownership and CSI for configuring the CSI-2 rx and tx.
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/pci/intel/ivsc/Kconfig | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ivsc/Kconfig b/drivers/media/pci/intel/ivsc/Kconfig
> index 9535ac10f4f7..e9d94dbb4305 100644
> --- a/drivers/media/pci/intel/ivsc/Kconfig
> +++ b/drivers/media/pci/intel/ivsc/Kconfig
> @@ -8,5 +8,9 @@ config INTEL_VSC
>  	  This adds support for Intel Visual Sensing Controller (IVSC).
>  
>  	  Enables the IVSC firmware services required for controlling
> -	  camera sensor ownership and CSI-2 link through Image Processing
> -	  Unit(IPU) driver of Intel.
> +	  camera sensor ownership between IVSC and host CPU (ACE) as well

What does ACE stand for ?

> +	  as configuring the CSI-2 link (CSI) towards the Image Processing
> +	  Unit (IPU) driver of Intel.

If I understand things correctly, this is about routing the data from
the sensor to the IVSC output towards the host. Is that right ? If so,
let's make that explicit.

> +
> +	  The modules will be called ivsc-csi and ivsc-ace.
> +

-- 
Regards,

Laurent Pinchart
