Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50C6622458F
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 23:03:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726830AbgGQVDN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jul 2020 17:03:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726393AbgGQVDN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jul 2020 17:03:13 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ED6FC0619D2;
        Fri, 17 Jul 2020 14:03:13 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C666171D;
        Fri, 17 Jul 2020 23:03:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1595019792;
        bh=hI7v7Ov33NFPbSjT9jErBZWE6iVtec2cdO+MKep6yHI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=G5spNQOlJAh9KpSET9n33sZ5LDKK4m3eR4ClyeFYZJ715KMMfu7icQI5Qz6ZY/QV7
         rbCNoVScvcTZmgbhMvdZT3eZFIxhIh98rKQxF9YCnYFU7wLEZx9Nk82A7lyaBfzlWD
         ZqGnSeBCKC0U2FKJEVeylzYhXdGbydopD46b1Eh4=
Date:   Sat, 18 Jul 2020 00:03:03 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        slongerbeam@gmail.com, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 12/13] MAINTAINERS: ov5640: Add bindings file
Message-ID: <20200717210303.GN5961@pendragon.ideasonboard.com>
References: <20200717132859.237120-1-jacopo+renesas@jmondi.org>
 <20200717132859.237120-13-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200717132859.237120-13-jacopo+renesas@jmondi.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Fri, Jul 17, 2020 at 03:28:58PM +0200, Jacopo Mondi wrote:
> Add the newly introduced bindings file to the list of files
> associated with the ov5640 driver in the MAINTAINERS file.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

I'd squash this with patch 01/13.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2730af1265ea..fc2a2129d18e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12604,6 +12604,7 @@ M:	Steve Longerbeam <slongerbeam@gmail.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  T:	git git://linuxtv.org/media_tree.git
> +F:	Documentation/devicetree/bindings/media/i2c/ov5640.yaml
>  F:	drivers/media/i2c/ov5640.c
>  
>  OMNIVISION OV5647 SENSOR DRIVER

-- 
Regards,

Laurent Pinchart
