Return-Path: <linux-media+bounces-37807-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFCBB06657
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 20:56:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC0E717EBFD
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 18:56:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1263C2BE7AC;
	Tue, 15 Jul 2025 18:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bTNaMOOS"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEEA17BA1;
	Tue, 15 Jul 2025 18:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752605755; cv=none; b=AapKDiO6x499RHqexS/omnLQWeuO4VifbAM25yMubxRYRaCMMBePvSy61DqIuTkp0fGDnMKSk5/534E9wFIEqvL/VD8q/PonVdmc8w27ikFWBl+OiL9IO0JugccO9x8Pizxcl1gkVbPV0wdFkTSyb/zW54evir+pDY8Gl01dtRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752605755; c=relaxed/simple;
	bh=Q2MmTxPttrYwSbqFlJJnGw1CxKSnIIiq5Yk0wLXIyqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HcATgc6RYrD6fW+8fvdO1GwHgPD7UQ6YIxeZyY+PSWthtcrnpsCx9n6zvTPzbPtUMZ5vY0ty9ApcwKcttez61ZkbXJ6+A+4VcnOQvYL9uLBUU8TsR+Zmns8jDld41LbsJ4lRA4lvOS32XXJ7BZ0VzzveBBRQkD5PZrOW4L0p5Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bTNaMOOS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 9541E78E;
	Tue, 15 Jul 2025 20:55:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752605719;
	bh=Q2MmTxPttrYwSbqFlJJnGw1CxKSnIIiq5Yk0wLXIyqw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bTNaMOOS1fVf864B9+ylYBpm4vJzrDckfHRTaF/vyat/jImb5zqBQjYO5bEXLeBKc
	 Tp1H8BAwPk7gx1Nz3aGDHlxiF6C++jePYvlQt1rGs6ckaGlK2QD7NsSFaCr2eX6ynw
	 u6ZVxtMAZliVROdASG7BrQSfPTsX3ekWrw5WNZlU=
Date: Tue, 15 Jul 2025 21:55:50 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mathis Foerst <mathis.foerst@mt.com>
Cc: linux-kernel@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, manuel.traut@mt.com,
	mathis.foerst@zuehlke.com
Subject: Re: [PATCH v8 0/2] MT9M114 driver bugfix and improvements
Message-ID: <20250715185550.GA19299@pendragon.ideasonboard.com>
References: <20250714075927.511610-1-mathis.foerst@mt.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250714075927.511610-1-mathis.foerst@mt.com>

Hi Mathis,

Thank you for the patches.

The series is fully reviewed. It's unfortuantely a bit too late for
v6.17, I expect Sakari will pick it up for v6.18.

On Mon, Jul 14, 2025 at 09:59:25AM +0200, Mathis Foerst wrote:
> Hi,
> 
> this patch series contains the following bugfix and improvements
> for the MT9M114 camera driver:
> 
> Changelog:
> 
> v7 -> v8:
> - Add missing braces in 1.
> - Fix formatting issues as suggested in review.
> 
> v6 -> v7:
> - Remove already picked patches 1, 2, 3 and 6.
> - Remove patch 4 as suggested in review.
> - Fix formatting issues
> - Return -EBUSY from mt9m114_pa_set_selection if the cropping size changes
>   while in streaming state.
> 
> v5 -> v6:
> - Add 'Reviewed-By:' tags. Sorry for forgetting this in the previous versions
> 
> v4 -> v5:
> - Apply reformatings and small refactorings as suggested in review comments
> - Split PATCH 4 into two parts: One for applying HFLIP / VFLIP while 
>   streaming, one for applying set_selection while streaming.
> - Add condition to apply set_selection immediately only if the size of the
>   cropping rectangle does not change in PATCH 5
> - Use device_property_read_u32 instead of of_property_read_u32 in PATCH 7
> 
> v3 -> v4:
> - Rename DT binding from "onnn,slew-rate" to "slew-rate" in PATCH 1 and 6 as
>   requested in the review comment.
> 
> v2 -> v3:
> - Dropped PATCH 2 ("media: mt9m114: Add get_mbus_config").
>   Based on the comments, this issure won't be fixed in the MT9M114
>   driver but in "imx-media-csi.c" in a separate patch.
> - Renumbered patches accordingly.
> - Fix the incomplete renaming of the DT property from 'pad-slew-rate'
>   to 'onnn,slew-rate' in PATCH 1 and 6.
> - Fix checkpatch formatting suggestions in PATCH 2 and 6.
> 
> v1 -> v2:
> - Fix the subjects of the patches
> - Dropped PATCH 1 ("Add bypass-pll DT-binding") as it can be automatically
>   detected if the PLL should be bypassed.
> - Renumbered patches accordingly
> - Switch to uint32, add default value and clarify documentation in PATCH 1
> - Add 'Fixes' and 'Cc' tags as suggested in PATCH 6
> 
> Link to v1 discussion:
> https://lore.kernel.org/linux-media/20250226153929.274562-1-mathis.foerst@mt.com/
> Link to v2 discussion:
> https://lore.kernel.org/linux-media/20250304103647.34235-1-mathis.foerst@mt.com/
> Link to v3 discussion:
> https://lore.kernel.org/linux-media/20250305101453.708270-1-mathis.foerst@mt.com/
> Link to v4 discussion:
> https://lore.kernel.org/linux-media/20250307093140.370061-1-mathis.foerst@mt.com/
> 
> Bugfixes:
> - Fix a deadlock when using the V4L2 pad-ops get/set_frame_interval
> 
> New Features:
> - Bypass the internal PLL if EXTCLK matches the configured link_frequency
> - Make the slew-rate of the output pads configurable via DT
> - Allow to change the cropping configuration while the sensor is in streaming 
>   state
> 
> Thanks,
> Mathis
> 
> Mathis Foerst (2):
>   media: mt9m114: Allow set_selection while streaming
>   media: mt9m114: Set pad-slew-rate
> 
>  drivers/media/i2c/mt9m114.c | 69 ++++++++++++++++++++++++++++---------
>  1 file changed, 53 insertions(+), 16 deletions(-)
> 
> 
> base-commit: a8598c7de1bcd94461ca54c972efa9b4ea501fb9

-- 
Regards,

Laurent Pinchart

