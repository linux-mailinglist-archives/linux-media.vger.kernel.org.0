Return-Path: <linux-media+bounces-38255-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D75B0F2A5
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 14:55:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9DD321C86637
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 12:56:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2317A2E7630;
	Wed, 23 Jul 2025 12:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fyXKyqao"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB70F29B8C0;
	Wed, 23 Jul 2025 12:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753275326; cv=none; b=n7LmafwWk9ewe5M6hyl713cb/EFqMbtqQfFxBbrT5qiYs2w7DBLJzBtUKoyQo6Ff4r0S2jZb/ragQNL8MFu+lCsYoaNNTu9QzQOwQdE4yv8l/gk+q8TUUBNZMwDlOKR2ECu5Oy3gK/dw8IS5fSBkoqjCttRjO+YH9gyloEbRr2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753275326; c=relaxed/simple;
	bh=p2ZhOmEScPOsAsGDCejzk4PERbGyjps7u8IIAuzDQxI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kJAW+sMrmHVIHmkXAbgeAojxe20Js8hiU8XToh9HmBekZ6LmPqFp3pA/dKDg35AYI7+Q3mKN4r4phjno7g/nNXYDiubrFCrvUiszl2j+ZUXjgH4F2iiqnUf4rccM9SG7tLzTYxXA1LzYsGqTSmbx37/MITKgci/uWdJkTDXAPM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fyXKyqao; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 859DAE92;
	Wed, 23 Jul 2025 14:54:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753275284;
	bh=p2ZhOmEScPOsAsGDCejzk4PERbGyjps7u8IIAuzDQxI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fyXKyqaoRVzbpOmpbNpPqJ3xg5g3T7qgoZmuWY7zfkmoDvp8qe87j3Q4DGLHrg/LF
	 8mA7G7pEaN+IeEWLbS0IU+yRuua1IyhukLHdKBuYvsB/pwVPSHr4E4gy82JmginlGd
	 lacLTiyrIDSaklnmJMBS4ynBeasWlzJ0PMO9/Sb0=
Date: Wed, 23 Jul 2025 15:55:20 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Hans de Goede <hansg@kernel.org>,
	James Cowgill <james.cowgill@blaize.com>,
	Yunke Cao <yunkec@google.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] media: Add devm-managed helper functions for media
 and V4L2 subsystems
Message-ID: <20250723125520.GB6719@pendragon.ideasonboard.com>
References: <20250723102515.64585-1-tarang.raval@siliconsignals.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250723102515.64585-1-tarang.raval@siliconsignals.io>

Hi Tarang,

On Wed, Jul 23, 2025 at 03:55:04PM +0530, Tarang Raval wrote:
> This patch series introduces devm-managed versions of several commonly used
> media and V4L2 initialization functions. These helpers simplify resource
> management by leveraging the devres infrastructure, ensuring automatic
> cleanup when the associated device is detached or the driver is unloaded.

I'll let Sakari review this, but overall, I don't think we want to take
this direction. Objects need to be refcounted instead of freed at remove
time. This patch series doesn't necessarily cause a regression as such,
but it will make it more difficult to fix life time management issues in
V4L2.

> Tested with IMX219 and OV2735 camera sensors on an i.MX8MP-based platform.
> 
> Tarang Raval (4):
>   media: mc: Add devm_media_entity_pads_init() helper
>   media: v4l: async: Add devm_v4l2_async_register_subdev_sensor() helper
>   media: v4l2: subdev: Add devm_v4l2_subdev_init_finalize() helper
>   media: v4l2-ctrls: Add devm_v4l2_ctrl_handler_init() helper
> 
>  drivers/media/mc/mc-entity.c              | 19 +++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-async.c      | 19 +++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-ctrls-core.c | 20 ++++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-subdev.c     | 18 ++++++++++++++++++
>  include/media/media-entity.h              | 20 ++++++++++++++++++++
>  include/media/v4l2-async.h                | 18 ++++++++++++++++++
>  include/media/v4l2-ctrls.h                | 19 +++++++++++++++++++
>  include/media/v4l2-subdev.h               | 17 +++++++++++++++++
>  8 files changed, 150 insertions(+)
> 

-- 
Regards,

Laurent Pinchart

