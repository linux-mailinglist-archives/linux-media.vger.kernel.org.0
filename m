Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED7CC7A107F
	for <lists+linux-media@lfdr.de>; Fri, 15 Sep 2023 00:05:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229715AbjINWFk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 18:05:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjINWFk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 18:05:40 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 347401BEF
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 15:05:36 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E56A316B7;
        Fri, 15 Sep 2023 00:04:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694729042;
        bh=o7RblErSaFedoLzjUGDY9vyca9KjcSKJoia9lXnBUoQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=S97SLd9C0FbSst+s7l1RN5xG4NFNLaQf7QXLlooyj2vzV5F1C3gDKyuwKi0l6XCQW
         eNYOMcVCMzQIXFR+VVj5eQeRzMZnLsgooLKEnAbDBKPxE7k9VSaoaUrBQlX+j4tFnz
         paQxVuN8NkW3JlxzUg1LYn5O7+zUcsbrZ0SJGbzY=
Date:   Fri, 15 Sep 2023 01:05:48 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 1/1] media: Documentation: Mention CCS tools
Message-ID: <20230914220548.GA11460@pendragon.ideasonboard.com>
References: <20230914220235.2014296-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230914220235.2014296-1-sakari.ailus@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Fri, Sep 15, 2023 at 01:02:35AM +0300, Sakari Ailus wrote:
> CCS tools is a useful set of programs and libraries for working with CCS
> static data. Do mention that in context of the CCS driver.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  Documentation/driver-api/media/drivers/ccs/ccs.rst | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/driver-api/media/drivers/ccs/ccs.rst b/Documentation/driver-api/media/drivers/ccs/ccs.rst
> index 7389204afcb8..07249f7d7863 100644
> --- a/Documentation/driver-api/media/drivers/ccs/ccs.rst
> +++ b/Documentation/driver-api/media/drivers/ccs/ccs.rst
> @@ -114,4 +114,12 @@ The PLL model implemented by the PLL calculator corresponds to MIPI CCS 1.1.
>  
>  .. kernel-doc:: drivers/media/i2c/ccs-pll.h
>  
> +CCS tools
> +=========
> +
> +`CCS tools <https://github.com/MIPI-Alliance/ccs-tools/>`_ is a set of
> +tools for working with CCS static data files. CCS tools includes a
> +definition of the human-readable CCS static data YAML format and includes a
> +program to convert it to a binary.

The text looks good to me, but how about moving it to the "CCS static
data" section above ?

> +
>  **Copyright** |copy| 2020 Intel Corporation

-- 
Regards,

Laurent Pinchart
