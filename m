Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20CC624F804
	for <lists+linux-media@lfdr.de>; Mon, 24 Aug 2020 11:24:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726910AbgHXJYe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Aug 2020 05:24:34 -0400
Received: from retiisi.org.uk ([95.216.213.190]:42008 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726838AbgHXJYc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Aug 2020 05:24:32 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 3FF02634C87;
        Mon, 24 Aug 2020 12:23:04 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1kA8gy-0003Pz-1A; Mon, 24 Aug 2020 12:23:04 +0300
Date:   Mon, 24 Aug 2020 12:23:04 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: Re: [PATCH] media: ti-vpe: cal: Fix compilation on 32-bit ARM
Message-ID: <20200824092303.GP7145@valkosipuli.retiisi.org.uk>
References: <20200823050257.564-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200823050257.564-1-laurent.pinchart@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Aug 23, 2020 at 08:02:57AM +0300, Laurent Pinchart wrote:
> When compiled on 32-bit ARM, the CAL driver fails with the FIELD_PREP()
> macro complaining that the mask is not constant. While all callers of
> the inline cal_write_field() function pass a constant mask, the mask
> parameter itself is a variable, which likely doesn't please the
> compiler.
> 
> Fix it by replacing FIELD_PREP() with a manual implementation.
> 
> Fixes: 50797fb30b95 ("media: ti-vpe: cal: Turn reg_(read|write)_field() into inline functions")
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks!

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
