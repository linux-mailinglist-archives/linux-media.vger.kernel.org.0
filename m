Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A02C24FC0A
	for <lists+linux-media@lfdr.de>; Mon, 24 Aug 2020 12:55:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726473AbgHXKzc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Aug 2020 06:55:32 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:53652 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727110AbgHXKzG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Aug 2020 06:55:06 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 11AE9279;
        Mon, 24 Aug 2020 12:54:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1598266482;
        bh=u1+SIobE8V3Iio4tt3LrtLGU6xPiVxKagnkpOhkuwaU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ltY7pv8ITXFgrDpU8KZoRibzKXB6xUA+Mkp3TI4nJFbgxywIlnn+qm4O4jS6ho9uK
         +d6vtCcde9CfMlryT55dsHUPTKNpVJ1kR/viQHSleR+QIP/ueWV/wOD+ZkhHztQklZ
         M8ByPcAh97KyrDNN9sFOXgjqV6lFsgWM+GwfBkpg=
Date:   Mon, 24 Aug 2020 13:54:22 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     linux-media@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: Re: [PATCH] media: ti-vpe: cal: Fix compilation on 32-bit ARM
Message-ID: <20200824105422.GB6002@pendragon.ideasonboard.com>
References: <20200823050257.564-1-laurent.pinchart@ideasonboard.com>
 <20200824092303.GP7145@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200824092303.GP7145@valkosipuli.retiisi.org.uk>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Aug 24, 2020 at 12:23:04PM +0300, Sakari Ailus wrote:
> On Sun, Aug 23, 2020 at 08:02:57AM +0300, Laurent Pinchart wrote:
> > When compiled on 32-bit ARM, the CAL driver fails with the FIELD_PREP()
> > macro complaining that the mask is not constant. While all callers of
> > the inline cal_write_field() function pass a constant mask, the mask
> > parameter itself is a variable, which likely doesn't please the
> > compiler.
> > 
> > Fix it by replacing FIELD_PREP() with a manual implementation.
> > 
> > Fixes: 50797fb30b95 ("media: ti-vpe: cal: Turn reg_(read|write)_field() into inline functions")
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Thanks!
> 
> Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

And I forgot to add

Reported-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Tomi, will you handle this patch ? Could you add the tags ?

-- 
Regards,

Laurent Pinchart
