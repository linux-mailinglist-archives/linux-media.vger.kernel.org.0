Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6115C170317
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2020 16:49:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728377AbgBZPtU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Feb 2020 10:49:20 -0500
Received: from retiisi.org.uk ([95.216.213.190]:46210 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728244AbgBZPtU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Feb 2020 10:49:20 -0500
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 24F67634C87;
        Wed, 26 Feb 2020 17:48:07 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1j6yut-0002Ki-NW; Wed, 26 Feb 2020 17:48:07 +0200
Date:   Wed, 26 Feb 2020 17:48:07 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Eugen Hristev <eugen.hristev@microchip.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: v4l2-core: fix entity initialization in
 device_register_subdev
Message-ID: <20200226154807.GN5023@valkosipuli.retiisi.org.uk>
References: <20200226152816.31557-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200226152816.31557-1-eugen.hristev@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Feb 26, 2020 at 05:28:16PM +0200, Eugen Hristev wrote:
> The entity variable was being initialized in the wrong place, before the
> parameters have been checked.
> To solve this, completely removed the entity variable and replaced it
> with the initialization value : &sd->entity.
> This will avoid dereferencing 'sd' pointer before it's being checked if
> it's NULL.
> 
> Fixes: 61f5db549dde ("[media] v4l: Make v4l2_subdev inherit from media_entity")
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>

Thanks!

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
