Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4284C6E96FA
	for <lists+linux-media@lfdr.de>; Thu, 20 Apr 2023 16:24:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232022AbjDTOYj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Apr 2023 10:24:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231638AbjDTOYh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Apr 2023 10:24:37 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE1EF3AA4
        for <linux-media@vger.kernel.org>; Thu, 20 Apr 2023 07:24:35 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B3B119DE;
        Thu, 20 Apr 2023 16:24:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1682000667;
        bh=bfnFoCylfrbkFsbNA3RoHuI7yPqdozAhrVxDyeudwrc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LFUHcfT2XVFbZgn3pq7+25+FmQbuqeWwYztmvfF8sHESQFmHAuFwtGebWWEYfHx2J
         z2wOyXR8FzVVBOlnaisZBNwTkiok0MdW4i+B3d5SdLnUtjrcU/muWNDBcLIwtQEAgs
         zSEFmPl5cxMvF2WMrKk/5YWUy+SdYVo+XwdQ6jjY=
Date:   Thu, 20 Apr 2023 17:24:47 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     bingbu.cao@intel.com
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        ilpo.jarvinen@linux.intel.com, tfiga@chromium.org,
        senozhatsky@chromium.org, hdegoede@redhat.com,
        bingbu.cao@linux.intel.com, tian.shu.qiu@intel.com,
        hongju.wang@intel.com, daniel.h.kang@intel.com
Subject: Re: [RFC PATCH 14/14] MAINTAINERS: add maintainers for Intel IPU6
 input system driver
Message-ID: <20230420142447.GC17497@pendragon.ideasonboard.com>
References: <20230413100429.919622-1-bingbu.cao@intel.com>
 <20230413100429.919622-15-bingbu.cao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230413100429.919622-15-bingbu.cao@intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bingbu,

Thank you for the patch.

On Thu, Apr 13, 2023 at 06:04:29PM +0800, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
> 
> Update MAINTAINERS file for Intel IPU6 input system driver.
> 
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  MAINTAINERS | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ec57c42ed544..22521c201c7b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10376,6 +10376,16 @@ F:	Documentation/admin-guide/media/ipu3_rcb.svg
>  F:	Documentation/userspace-api/media/v4l/pixfmt-meta-intel-ipu3.rst
>  F:	drivers/staging/media/ipu3/
>  
> +INTEL IPU6 INPUT SYSTEM DRIVER
> +M:	Sakari Ailus <sakari.ailus@linux.intel.com>
> +M:	Bingbu Cao <bingbu.cao@intel.com>
> +R:	Tianshu Qiu <tian.shu.qiu@intel.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +T:	git git://linuxtv.org/media_tree.git
> +F:	Documentation/admin-guide/media/ipu6-isys.rst
> +F:	drivers/media/pci/intel/ipu6/
> +
>  INTEL IXP4XX CRYPTO SUPPORT
>  M:	Corentin Labbe <clabbe@baylibre.com>
>  L:	linux-crypto@vger.kernel.org

-- 
Regards,

Laurent Pinchart
