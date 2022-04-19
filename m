Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E687D507B22
	for <lists+linux-media@lfdr.de>; Tue, 19 Apr 2022 22:44:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346285AbiDSUqr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Apr 2022 16:46:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238778AbiDSUqr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Apr 2022 16:46:47 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85E3141984
        for <linux-media@vger.kernel.org>; Tue, 19 Apr 2022 13:44:03 -0700 (PDT)
Received: from pendragon.ideasonboard.com (85-76-5-145-nat.elisa-mobile.fi [85.76.5.145])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A8B3025B;
        Tue, 19 Apr 2022 22:44:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1650401041;
        bh=XoKPI/JP9/RPk/3qzBDP3e9PBVnW/Im8xnpr6JU36ec=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=t999oDO4LRjwDg9B9iy70RQNqHmgZXotxGiY5unvIbIwPtZj6F7Q/dQhUCA4xlL4X
         r+ZocWCSwAno8bhqOB5IHIwBJ8oUKbwazqdw1vpmrkc68DkxIWHrgtBKoM11m6DM+r
         mJ88Mu+XQORL86S0Xc9ZlivU1N14uAHNM1G4RNBM=
Date:   Tue, 19 Apr 2022 23:43:28 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 1/1] staging: media: ipu3-imgu: Request specific firmware
 binary
Message-ID: <Yl8e8Pw3rfJ+lhDZ@pendragon.ideasonboard.com>
References: <20220413103739.622349-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220413103739.622349-1-sakari.ailus@linux.intel.com>
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

On Wed, Apr 13, 2022 at 01:37:39PM +0300, Sakari Ailus wrote:
> Primarily request a specific revision of the IPU3 firmware that the driver
> is known to work with,
> irci_irci_ecr-master_20161208_0213_20170112_1500.bin. Some distros only
> ship this while others provide a symlink called ipu3-fw.bin, which the
> driver only requested previously.

Are there distros that ship ipu3-fw.bin but not
irci_irci_ecr-master_20161208_0213_20170112_1500.bin ? If not, w could
avoid the fallback to IMGU_FW_NAME.

> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/staging/media/ipu3/ipu3-css-fw.c | 4 +++-
>  drivers/staging/media/ipu3/ipu3-css-fw.h | 4 +++-
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/ipu3/ipu3-css-fw.c b/drivers/staging/media/ipu3/ipu3-css-fw.c
> index 981693eed8155..2b659b0ccca14 100644
> --- a/drivers/staging/media/ipu3/ipu3-css-fw.c
> +++ b/drivers/staging/media/ipu3/ipu3-css-fw.c
> @@ -117,7 +117,9 @@ int imgu_css_fw_init(struct imgu_css *css)
>  	unsigned int i, j, binary_nr;
>  	int r;
>  
> -	r = request_firmware(&css->fw, IMGU_FW_NAME, css->dev);
> +	r = request_firmware(&css->fw, IMGU_FW_NAME_20161208, css->dev);
> +	if (r == -ENOENT)
> +		r = request_firmware(&css->fw, IMGU_FW_NAME, css->dev);
>  	if (r)
>  		return r;
>  
> diff --git a/drivers/staging/media/ipu3/ipu3-css-fw.h b/drivers/staging/media/ipu3/ipu3-css-fw.h
> index c0bc57fd678a7..f9403da757851 100644
> --- a/drivers/staging/media/ipu3/ipu3-css-fw.h
> +++ b/drivers/staging/media/ipu3/ipu3-css-fw.h
> @@ -6,7 +6,9 @@
>  
>  /******************* Firmware file definitions *******************/
>  
> -#define IMGU_FW_NAME			"intel/ipu3-fw.bin"
> +#define IMGU_FW_NAME		"intel/ipu3-fw.bin"
> +#define IMGU_FW_NAME_20161208	\
> +	"intel/irci_irci_ecr-master_20161208_0213_20170112_1500.bin"
>  
>  typedef u32 imgu_fw_ptr;
>  
> -- 
> 2.30.2
> 

-- 
Regards,

Laurent Pinchart
