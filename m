Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3795C464593
	for <lists+linux-media@lfdr.de>; Wed,  1 Dec 2021 04:46:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230222AbhLADt6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Nov 2021 22:49:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229886AbhLADt5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Nov 2021 22:49:57 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA674C061574
        for <linux-media@vger.kernel.org>; Tue, 30 Nov 2021 19:46:37 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1EAE0A15;
        Wed,  1 Dec 2021 04:46:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1638330396;
        bh=1AQ+yEF9voug/f2qpxgVPlPUV6XMBP5877BgyLk6DZo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IRvhrI9CbLd/NyYhFcyyshMC1604obbrlRUeQJoZr21kbrAoWeYT3Vmg8ZrgyyFs1
         cJ8zsx1KRFoqZQBLE50mpvW8UTHE2X21Ed5prR/e/+KK5oFFPY3k8ulj7A6H7HhcW6
         le5ntZyF3IbjqCc20qb/FRbyNi1u7fMzNgN9Njsc=
Date:   Wed, 1 Dec 2021 05:46:11 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH v1 0/4] v4l-utils: support multiplexed streams
Message-ID: <YabwAzSJlAlYqFhb@pendragon.ideasonboard.com>
References: <20211130141815.892354-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211130141815.892354-1-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Tue, Nov 30, 2021 at 04:18:11PM +0200, Tomi Valkeinen wrote:
> Hi,
> 
> This series adds support to multiplexed streams.
> 
> v4l2-ctl and media-ctl are updated to allow configuring routes and
> setting configs per stream.
> 
> v4l2-compliance is updated to always set the new stream field, and to do
> some testing for multiplexed subdevs.

What device(s) have you tested this with ?

> Tomi Valkeinen (4):
>   v4l2-utils: update Linux headers for multiplexed streams
>   v4l2-ctl: Add routing and streams support
>   media-ctl: add support for routes and streams
>   v4l2-ctl/compliance: add routing and streams multiplexed streams
> 
>  include/linux/v4l2-subdev.h                 |  88 +++++-
>  utils/common/v4l2-info.cpp                  |   2 +
>  utils/media-ctl/libmediactl.c               |  41 +++
>  utils/media-ctl/libv4l2subdev.c             | 256 +++++++++++++++--
>  utils/media-ctl/media-ctl.c                 | 113 ++++++--
>  utils/media-ctl/mediactl.h                  |  16 ++
>  utils/media-ctl/options.c                   |  15 +-
>  utils/media-ctl/options.h                   |   1 +
>  utils/media-ctl/v4l2subdev.h                |  58 +++-
>  utils/v4l2-compliance/v4l2-compliance.cpp   | 124 +++++++--
>  utils/v4l2-compliance/v4l2-compliance.h     |   8 +-
>  utils/v4l2-compliance/v4l2-test-subdevs.cpp |  43 ++-
>  utils/v4l2-ctl/v4l2-ctl-subdev.cpp          | 289 +++++++++++++++++---
>  utils/v4l2-ctl/v4l2-ctl.cpp                 |   2 +
>  utils/v4l2-ctl/v4l2-ctl.h                   |   2 +
>  15 files changed, 928 insertions(+), 130 deletions(-)

-- 
Regards,

Laurent Pinchart
