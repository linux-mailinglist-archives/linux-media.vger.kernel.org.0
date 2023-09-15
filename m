Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09DAC7A1A37
	for <lists+linux-media@lfdr.de>; Fri, 15 Sep 2023 11:18:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232884AbjIOJSD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Sep 2023 05:18:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233179AbjIOJSC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Sep 2023 05:18:02 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 429ACC1
        for <linux-media@vger.kernel.org>; Fri, 15 Sep 2023 02:17:56 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9E5022C6;
        Fri, 15 Sep 2023 11:16:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694769381;
        bh=VdroMWg3/Xo3h0RjcjFrTBo3WlLJCR4uw1w1CAhED/A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ABY93FprCBKXwqR42PpICCgnVJ0+6LrATgcu9ypTR78JMlseocZwl8Fz5L9U5/qLR
         9y80cpRIgDUTT9pge7tgdN1CctZToic8uNukMEkASKNZVycz+IWzKky4udzqhZWtoq
         JgnO4G0BPWBMxhNAmrEkArA8dWU2ZdI0scfrfC6o=
Date:   Fri, 15 Sep 2023 12:18:09 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH 2/7] media: ccs: Fix driver quirk struct documentation
Message-ID: <20230915091809.GC14641@pendragon.ideasonboard.com>
References: <20230915072809.37886-1-sakari.ailus@linux.intel.com>
 <20230915072809.37886-3-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230915072809.37886-3-sakari.ailus@linux.intel.com>
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

On Fri, Sep 15, 2023 at 10:28:04AM +0300, Sakari Ailus wrote:
> Fix documentation for struct ccs_quirk, a device specific struct for
> managing deviations from the standard. The flags field was drifted away
> from where it should have been.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/ccs/ccs-quirk.h | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/ccs/ccs-quirk.h b/drivers/media/i2c/ccs/ccs-quirk.h
> index 5838fcda92fd..0b1a64958d71 100644
> --- a/drivers/media/i2c/ccs/ccs-quirk.h
> +++ b/drivers/media/i2c/ccs/ccs-quirk.h
> @@ -32,12 +32,10 @@ struct ccs_sensor;
>   *		@reg: Pointer to the register to access
>   *		@value: Register value, set by the caller on write, or
>   *			by the quirk on read
> - *
> - * @flags: Quirk flags
> - *
>   *		@return: 0 on success, -ENOIOCTLCMD if no register
>   *			 access may be done by the caller (default read
>   *			 value is zero), else negative error code on error
> + * @flags: Quirk flags
>   */
>  struct ccs_quirk {
>  	int (*limits)(struct ccs_sensor *sensor);

-- 
Regards,

Laurent Pinchart
