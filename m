Return-Path: <linux-media+bounces-10285-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF9B8B4EC3
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2024 01:20:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7A7A0B20F05
	for <lists+linux-media@lfdr.de>; Sun, 28 Apr 2024 23:20:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54F37168C4;
	Sun, 28 Apr 2024 23:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RPaeOv3B"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B26A389
	for <linux-media@vger.kernel.org>; Sun, 28 Apr 2024 23:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714346444; cv=none; b=sOIGEsrmiX1fC8DKRvlAEo4VIEETGjwKXU3QGZw+fP4MVTaU4PUhWH77AJY9GbkU0IuF5cvJLi1+kj3MaTywgPokkGw8vu2iVsKOhEjX+L20hzepBQ0WDh7xBOhz3WR9ktRzEbfIzDV/1RtO6U3EOW/K0kTyEYpGfiSh6FIkR9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714346444; c=relaxed/simple;
	bh=OGiGBzGEV4sIkkE1+JI2jw537RpanRYO9WVtuCvJ6BE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gz4farjpV3W/zcFhCyRjsijjkGJc8lsSp60CIm3zTSfRWnKDMhCfvzcWvOi+JwBDq8LlGKx/MGbIG+QcqND4yoGpS9dX1CkabXB5WuaGdwlBMnAmuBuAb5ve5DYVI8vXaw8qBwEguHBdW8/JPNDQ4GRjZwsNHi6CWw24WTG8mQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RPaeOv3B; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [109.130.69.237])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6C7A9720;
	Mon, 29 Apr 2024 01:19:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714346380;
	bh=OGiGBzGEV4sIkkE1+JI2jw537RpanRYO9WVtuCvJ6BE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RPaeOv3BpNBVol3q9VGY8pm3lkTlXoBM52Fs1mZrzEpspaVL2ls+IZIQqmEjwFGny
	 W1zOrS1u30b96fDmWtHEMsls0r9D9EcicafFR6VmCft1dWbXMpcxpGLW+OzrJjvRuO
	 4ATwg7/r/vOLZfeaACARr8BiYGqhwy3Tp4LXG008=
Date: Mon, 29 Apr 2024 02:20:28 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hverkuil@xs4all.nl,
	Wentong Wu <wentong.wu@intel.com>
Subject: Re: [PATCH v2 0/3] Use INTEGER64 type for MEI CSI LINK_FREQ control
Message-ID: <20240428232028.GD4950@pendragon.ideasonboard.com>
References: <20240426145538.654212-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240426145538.654212-1-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patches.

On Fri, Apr 26, 2024 at 05:55:35PM +0300, Sakari Ailus wrote:
> Hi folks,
> 
> An integer menu isn't a useful control type for conveying the frequency
> depending on an external device to the receiver. Instead, in the MEI CSI
> driver, just obtain the link frequency from the upsteam sub-device and
> pass it on to the receiver.
> 
> The v4l2_get_link_freq() is changed to add support for this and it's
> documented as well.

Using a control for this seems to be a bit of a hack :-S Wouldn't it fit
more nicely in the .get_mbus_config() operation ? That would avoid
exposing this to userspace, and would also have the nice advantage that
the value could be queried per pad.

> since v1:
> 
> - Add a new 64-bit integer control V4L2_CID_CUR_LINK_FREQ instead of
>   re-using V4L2_CID_LINK_FREQ.
> 
> Sakari Ailus (3):
>   media: Documentation: v4l: Add CUR_LINK_FREQ control
>   media: v4l: Support obtaining link frequency from CUR_LINK_FREQ
>     control
>   media: ivsc: csi: Fix link frequency control behaviour
> 
>  .../media/v4l/ext-ctrls-image-process.rst     |  4 ++++
>  drivers/media/pci/intel/ivsc/mei_csi.c        | 24 ++++++-------------
>  drivers/media/v4l2-core/v4l2-common.c         |  6 ++++-
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  5 ++++
>  include/uapi/linux/v4l2-controls.h            |  1 +
>  5 files changed, 22 insertions(+), 18 deletions(-)
> 
> 
> base-commit: 6612d1ae37b52d37d1d515d7c5110b9f3afe94d2

-- 
Regards,

Laurent Pinchart

