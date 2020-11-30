Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56E9A2C88F1
	for <lists+linux-media@lfdr.de>; Mon, 30 Nov 2020 17:07:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728309AbgK3QFv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Nov 2020 11:05:51 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:59736 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726376AbgK3QFv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Nov 2020 11:05:51 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8A450B26;
        Mon, 30 Nov 2020 17:05:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1606752308;
        bh=R3YZAWsAzHLLQsNSGkEkvAnv9GYITFP7tVg7VAeMYJg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ukBZ4UDf0pvm4SaqWyGZAJvxW2dfBefJG+2KANcPS8xICerY993eCbFVYDlzpjHjQ
         Cku3nt4o1PXIoyP3Jq4s4rjUz+8PTm16an9CBqq3U5cW2wvaPjvatLkmCg9VY9ETuf
         Lkejx//d210dxEje3qZVhQ8EJ6asCAlZQGyVtQOs=
Date:   Mon, 30 Nov 2020 18:05:00 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, devel@acpica.org, rjw@rjwysocki.net,
        lenb@kernel.org, gregkh@linuxfoundation.org,
        mika.westerberg@linux.intel.com, andriy.shevchenko@linux.intel.com,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        wsa@kernel.org, yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
        robert.moore@intel.com, erik.kaneda@intel.com, pmladek@suse.com,
        rostedt@goodmis.org, sergey.senozhatsky@gmail.com,
        linux@rasmusvillemoes.dk, kieran.bingham+renesas@ideasonboard.com,
        jacopo+renesas@jmondi.org,
        laurent.pinchart+renesas@ideasonboard.com,
        jorhand@linux.microsoft.com, kitakar@gmail.com,
        heikki.krogerus@linux.intel.com
Subject: Re: [PATCH 01/18] property: Return true in
 fwnode_device_is_available for node types that do not implement this
 operation
Message-ID: <20201130160500.GD14465@pendragon.ideasonboard.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-2-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201130133129.1024662-2-djrscally@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

Thank you for the patch.

On Mon, Nov 30, 2020 at 01:31:12PM +0000, Daniel Scally wrote:
> Some types of fwnode_handle do not implement the device_is_available()
> check, such as those created by software_nodes. There isn't really a
> meaningful way to check for the availability of a device that doesn't
> actually exist, so if the check isn't implemented just assume that the
> "device" is present.
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Daniel Scally <djrscally@gmail.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Changes since RFC v3:
> 
> 	patch introduced
> 
>  drivers/base/property.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/base/property.c b/drivers/base/property.c
> index 4c43d30145c6..a5ca2306796f 100644
> --- a/drivers/base/property.c
> +++ b/drivers/base/property.c
> @@ -785,9 +785,14 @@ EXPORT_SYMBOL_GPL(fwnode_handle_put);
>  /**
>   * fwnode_device_is_available - check if a device is available for use
>   * @fwnode: Pointer to the fwnode of the device.
> + *
> + * For fwnode node types that don't implement the .device_is_available()
> + * operation, this function returns true.
>   */
>  bool fwnode_device_is_available(const struct fwnode_handle *fwnode)
>  {
> +	if (!fwnode_has_op(fwnode, device_is_available))
> +		return true;
>  	return fwnode_call_bool_op(fwnode, device_is_available);
>  }
>  EXPORT_SYMBOL_GPL(fwnode_device_is_available);

-- 
Regards,

Laurent Pinchart
