Return-Path: <linux-media+bounces-37579-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 96483B0335B
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 01:02:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4D6DF7AABB9
	for <lists+linux-media@lfdr.de>; Sun, 13 Jul 2025 23:00:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03FFC1FBEB9;
	Sun, 13 Jul 2025 23:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QZUpkpAW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC5013D539;
	Sun, 13 Jul 2025 23:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752447712; cv=none; b=NNQzQn31VHVkqd4Yx+TQu3vITTUxvc3Uq3xNNoWuL4Kot4s9wHv2SvoGNf/1Ry3cq2kHhjuTqZ24w0hpZMeA/rvhaRB06ONBWK7xHm0WkjAqyZy/6NX7VFct8mPamJH7PPUKJHew2NwI/VZxf4fdH5xX4ksCZGyVGUirtvReJEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752447712; c=relaxed/simple;
	bh=mRgKMN3EqJwh6hWwS/0IL319ZiNNUtK5FNW6mAAIi4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pGiwaFr7B2PUDjwBFdXJKDyS8qBiLJi1kRwO1rugqakrCfekkxDK8gxHOpu1IradZv//Y1eucVG4sBVRuirUz8CnECFoQ8t7QG5Kpnl91N8AbBx12UbIcB0snXtL0STHkd0wnB/YY+lOEkfY2uL6w5WJoBvJo0OYpI37r/bd2CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QZUpkpAW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 1E384735;
	Mon, 14 Jul 2025 01:01:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752447670;
	bh=mRgKMN3EqJwh6hWwS/0IL319ZiNNUtK5FNW6mAAIi4Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QZUpkpAWa6q1sagxlIsoR8DM3Krjj+RkUkL7aGTAvb2ET8wHiAXTuxm+wBjT8USYF
	 knprDhkNuRWg5k5e+j1pfmuyu5oqCxkrxQ8jQCak41J8u59eLIUHw4vZSFfqEMIpTn
	 5hQv0n99Rt+H8rPnJudCh8CtiS/0EV+PcbqP44ZY=
Date: Mon, 14 Jul 2025 02:01:09 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Dr. David Alan Gilbert" <linux@treblig.org>
Cc: mchehab@kernel.org, michal.simek@amd.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: of xvip_enum_frame_size and xvip_get_format_by_code
Message-ID: <20250713230109.GA10401@pendragon.ideasonboard.com>
References: <aHPj_C6iGCEFDW98@gallifrey>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aHPj_C6iGCEFDW98@gallifrey>

On Sun, Jul 13, 2025 at 04:51:08PM +0000, Dr. David Alan Gilbert wrote:
> Hi,
>   I noticed in xilinx-cip.c there's xvip_enum_frame_size()
> which was added back in 2013 but seems unused in tree, however
> I had a dig and I found
>   https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/18841638/Xilinx+V4L2+TPG+driver
> has a commit:
>   https://github.com/Xilinx/linux-xlnx/commit/1c113b4aef14004152fefc0e8b8dbbcc2314566f#diff-bb594682a92148570df8826933cf8629
>   from 2014 that uses it - but it looks like that commit never went
> anywhere.
> 
> So is xvip_enum_frame_size() or not?
> I also see xvip_get_format_by_code() looks unused, but I don't
> see any uses of it, even digging in that wiki.

Those functions seem to have never been used in the mainline kernel.
They were likely added to support drivers that have not been upstreamed.
Both functions are used in the Xilinx BSP kernel.

-- 
Regards,

Laurent Pinchart

