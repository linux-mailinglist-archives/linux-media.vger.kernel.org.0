Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F11A8E0EA
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 00:40:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727815AbfHNWkn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Aug 2019 18:40:43 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57898 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725895AbfHNWkm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Aug 2019 18:40:42 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 27ED32B2;
        Thu, 15 Aug 2019 00:40:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1565822440;
        bh=pP48/D76g4ScH0kk0XJHtcKoUrGy09hdCLB/Efv1QiU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FyDcEDET6W4/tAkHMNA9RJuBnW0RvT250HZ6TRe//NvVCe034O/sPxVQZ1DYvdfRf
         gzYa1pDVK3RcT1ks5LNswXYnj8AClA46XRjYM1EbG+sY6drPCQxh4kjcJrovmdrzrN
         9hnkpYDI403yKnHHVopeAoGyXuF7FGEKPY8RWzus=
Date:   Thu, 15 Aug 2019 01:40:28 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [RFC 1/5] media: dt-bindings: Document 'location' property
Message-ID: <20190814224028.GC5015@pendragon.ideasonboard.com>
References: <20190814202815.32491-1-jacopo@jmondi.org>
 <20190814202815.32491-2-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190814202815.32491-2-jacopo@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Wed, Aug 14, 2019 at 10:28:11PM +0200, Jacopo Mondi wrote:
> Add the 'location' device property, used to specify the camera device
> mounting position. The property is particularly meaningful for mobile
> devices with a well defined usage orientation.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  Documentation/devicetree/bindings/media/video-interfaces.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/video-interfaces.txt b/Documentation/devicetree/bindings/media/video-interfaces.txt
> index f884ada0bffc..819077b2649c 100644
> --- a/Documentation/devicetree/bindings/media/video-interfaces.txt
> +++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
> @@ -89,6 +89,10 @@ Optional properties
>    but a number of degrees counter clockwise. Typical values are 0 and 180
>    (upside down).
> 
> +- location: The camera device mounting position, relative to the device
> +  usage orientation. Possible values are:

I would mention "camera sensor" explicitly here, as well as clearly
stating that the property applies to camera sensors only.

> +  0 - Front camera. The image sensor is mounted on the front side of the device.
> +  1 - Back camera. The image sensor is mounted on the back side of the device.

An additional paragraph explained what "device usage orientation" means
would be useful. In particular I would give examples for phones, tablets
and laptops.

> 
>  Optional endpoint properties
>  ----------------------------

-- 
Regards,

Laurent Pinchart
