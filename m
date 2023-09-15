Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63A847A17CC
	for <lists+linux-media@lfdr.de>; Fri, 15 Sep 2023 09:51:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232778AbjIOHvn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Sep 2023 03:51:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232125AbjIOHvm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Sep 2023 03:51:42 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 255BCA1
        for <linux-media@vger.kernel.org>; Fri, 15 Sep 2023 00:51:37 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 680739A8;
        Fri, 15 Sep 2023 09:50:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694764201;
        bh=XWSvwz3t9fPW0zRnRMhU0DUF8Et1ZkEGlytYDI63jes=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=I0cqE0Fuk2yKykxFYvMkerbMCjyaU7rOdBQEqWm7iGJXRTSgcWajzGHWaI9rww36T
         cVrCOyEu885NesCLFG7xSmz/Fn8JIJt0qAse0oUBx5tFuoz601PJQW66CtG5bn167i
         ZwGRdZv03EUSdEIrou5pNBVnBuJ+lH51H31wUY+8=
Date:   Fri, 15 Sep 2023 10:51:48 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH v2 1/1] media: Documentation: Mention CCS tools
Message-ID: <20230915075148.GA14641@pendragon.ideasonboard.com>
References: <20230914224258.2016489-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230914224258.2016489-1-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Fri, Sep 15, 2023 at 01:42:58AM +0300, Sakari Ailus wrote:
> CCS tools is a useful set of programs and libraries for working with CCS
> static data. Do mention that in context of the CCS driver.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> since v1:
> 
> - Move the CCS tools section up, under CCS static data.
> 
>  Documentation/driver-api/media/drivers/ccs/ccs.rst | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/driver-api/media/drivers/ccs/ccs.rst b/Documentation/driver-api/media/drivers/ccs/ccs.rst
> index 7389204afcb8..0468b9413a31 100644
> --- a/Documentation/driver-api/media/drivers/ccs/ccs.rst
> +++ b/Documentation/driver-api/media/drivers/ccs/ccs.rst
> @@ -78,6 +78,14 @@ For SMIA (non-++) compliant devices the static data file name is
>  vvvv or vv denotes MIPI and SMIA manufacturer IDs respectively, mmmm model ID
>  and rrrr or rr revision number.
>  
> +CCS tools
> +~~~~~~~~~
> +
> +`CCS tools <https://github.com/MIPI-Alliance/ccs-tools/>`_ is a set of
> +tools for working with CCS static data files. CCS tools includes a
> +definition of the human-readable CCS static data YAML format and includes a
> +program to convert it to a binary.
> +
>  Register definition generator
>  -----------------------------
>  

-- 
Regards,

Laurent Pinchart
