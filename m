Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 002C4424AAE
	for <lists+linux-media@lfdr.de>; Thu,  7 Oct 2021 01:47:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239856AbhJFXtp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Oct 2021 19:49:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239840AbhJFXto (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Oct 2021 19:49:44 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D7E7C061760;
        Wed,  6 Oct 2021 16:47:51 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D6E6E9DC;
        Thu,  7 Oct 2021 01:47:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1633564070;
        bh=Bj8VsTDeyyiwIBxV+2/7RUl4PMzTmAKX4hpsvEJDZGY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kq481s76qZfrN7HpvnlTtIF8qV+J5q63erSTC3Nkr0fWQJPAB/bhQJdTyG430Tk01
         4WTIj3hrsdIZOxM72fNBFSWrDiXpL5b9nCH/NugptDOARyi5opzt1bFGoM7MxDDjF0
         wV2lmdxWkBOVUb1NqnKeuYkPhGEYD3uD9Z+0an34=
Date:   Thu, 7 Oct 2021 02:47:41 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Pratyush Yadav <p.yadav@ti.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Benoit Parrot <bparrot@ti.com>,
        Maxime Ripard <mripard@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v4 09/11] media: dt-bindings: Make sure items in
 data-lanes are unique
Message-ID: <YV41nSK2BBunqdn/@pendragon.ideasonboard.com>
References: <20210915120240.21572-1-p.yadav@ti.com>
 <20210915120240.21572-10-p.yadav@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210915120240.21572-10-p.yadav@ti.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Pratyush,

Thank you for the patch.

On Wed, Sep 15, 2021 at 05:32:38PM +0530, Pratyush Yadav wrote:
> The data-lanes property maps the logical lane numbers to the physical
> lane numbers. The position of an entry is the logical lane number and
> its value is the physical lane number. Since one physical lane can only
> map to one logical lane, no number in the list should repeat. Add the
> uniqueItems constraint on the property to enforce this.
> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> 
> Changes in v4:
> - New in v4.
> 
>  Documentation/devicetree/bindings/media/video-interfaces.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/video-interfaces.yaml b/Documentation/devicetree/bindings/media/video-interfaces.yaml
> index 4391dce2caee..4bce93efae5f 100644
> --- a/Documentation/devicetree/bindings/media/video-interfaces.yaml
> +++ b/Documentation/devicetree/bindings/media/video-interfaces.yaml
> @@ -158,6 +158,7 @@ properties:
>      $ref: /schemas/types.yaml#/definitions/uint32-array
>      minItems: 1
>      maxItems: 8
> +    uniqueItems: true
>      items:
>        # Assume up to 9 physical lane indices
>        maximum: 8

-- 
Regards,

Laurent Pinchart
