Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC328170335
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2020 16:54:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728593AbgBZPyt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Feb 2020 10:54:49 -0500
Received: from retiisi.org.uk ([95.216.213.190]:46276 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728470AbgBZPyt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Feb 2020 10:54:49 -0500
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id A291C634C89;
        Wed, 26 Feb 2020 17:53:35 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1j6z0C-0002Kp-8z; Wed, 26 Feb 2020 17:53:36 +0200
Date:   Wed, 26 Feb 2020 17:53:36 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        kernel@collabora.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v2] media: Split v4l2_pipeline_pm_use into
 v4l2_pipeline_pm_{get, put}
Message-ID: <20200226155336.GO5023@valkosipuli.retiisi.org.uk>
References: <20200124203543.22890-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200124203543.22890-1-ezequiel@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

On Fri, Jan 24, 2020 at 05:35:43PM -0300, Ezequiel Garcia wrote:
> Currently, v4l2_pipeline_pm_use() prototype is:
> 
>   int v4l2_pipeline_pm_use(struct media_entity *entity, int use)
> 
> Where the 'use' argument shall only be set to '1' for enable/power-on,
> or to '0' for disable/power-off. The integer return is specified
> as only meaningful when 'use' is set to '1'.
> 
> Let's enforce this semantic by splitting the function in two:
> v4l2_pipeline_pm_get and v4l2_pipeline_pm_put. This is done
> for several reasons.
> 
> It makes the API easier to use (or harder to misuse).
> It removes the constraint on the values the 'use' argument
> shall take. Also, it removes the need to constraint
> the return value, by making v4l2_pipeline_pm_put void return.
> 
> And last, it's more consistent with other kernel APIs, such
> as the runtime pm APIs, which makes the code more symmetric.

Indeed. These functions only exist because not all sensor etc. drivers have
been converted to runtime PM yet. New drivers no longer implement s_power
callbacks.

I don't object the patch as such, but I think you could also add a note
that relying on the s_power callback is deprecated. This probably should be
a separate patch.

-- 
Regards,

Sakari Ailus
