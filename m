Return-Path: <linux-media+bounces-24083-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C33769FC6D9
	for <lists+linux-media@lfdr.de>; Thu, 26 Dec 2024 00:07:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 41660162D72
	for <lists+linux-media@lfdr.de>; Wed, 25 Dec 2024 23:07:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAE9C192B70;
	Wed, 25 Dec 2024 23:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XW8wAh19"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425B41386C9
	for <linux-media@vger.kernel.org>; Wed, 25 Dec 2024 23:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735168015; cv=none; b=YUTyx9lhVvUuqPhfpB8hpRUB5LjUEDCYXmzm+yXJ/aKG7sf9TCGqx7r8a4ltpNzpndFfdd/qK5PROXc7FKhDw53ZB/A4afQ+Y/QPnZbnhuGGTyNrflAFljnUyfJKJYojZ85qsHvcP1IZF+j9WY00KfYNbpydipPFZu9nJyMmJv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735168015; c=relaxed/simple;
	bh=y+tQM4tjpCQzGYVg3LOG1iSfg+vPL2Yg2tfUER5UVDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j07eFWwo4EN2+wFtcO+59rCrniLvLoFMXRBVe0MWkfA74TECKWTWXmns8rA9kRv50XPhyeNkKRT7jUXWP7NqH7sl9wDWRlx3+yJz1OvhBmBZj3kqoxjbhr3ZulqoUFfnylWop2Hn2htcPIIT44HSdipNS9DuUgx3apRJslFe+eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XW8wAh19; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (179.218-130-109.adsl-dyn.isp.belgacom.be [109.130.218.179])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0E962E1;
	Thu, 26 Dec 2024 00:06:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1735167968;
	bh=y+tQM4tjpCQzGYVg3LOG1iSfg+vPL2Yg2tfUER5UVDI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XW8wAh19OxaklDS55/vtUZkP9p70w9kIxX2e6y3cG4XPxzzmASOPxmK4Iw36W/s6C
	 4HYREJKZNUjmdEL7hXVwXPURv5ug3NEjlUHnheIwzu8vai4NUftx2/MTtc6cQufMnM
	 UWLY+jvGz9RmQ/Y5A6WNQprm+7YjNwiZ9hgloBw8=
Date: Thu, 26 Dec 2024 01:06:49 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linuxtv-commits@linuxtv.org, Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: [GIT,PULL,FOR,v6.14] uvcvideo changes
Message-ID: <20241225230649.GA554@pendragon.ideasonboard.com>
References: <20241225153056.GA3523@pendragon.ideasonboard.com>
 <676c8a04.050a0220.20d632.9cf5@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <676c8a04.050a0220.20d632.9cf5@mx.google.com>

On Wed, Dec 25, 2024 at 02:41:08PM -0800, Patchwork Integration wrote:
> Dear Laurent Pinchart:
> 
> Thanks for your patches!
> 
> The CI had a great time going through them, and it could not find
> any issue.
> 
> For more details, check the full report at:
> https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/68621153/artifacts/report.htm .

I don't know if it's worth it, but I wonder if we could save some CPU
cycles and skip CI when the cover letter mentions a link to a successful
CI pipeline run. Clearly not high on the wish list, just something to
keep in mind.

> Best regards, and Happy Hacking!
> Media CI robot on behalf of the linux-media community.
> 
> ---
> Check the latest rules for contributing your patches at:
> https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html
> 
> If you believe that the CI is wrong, kindly open an issue at
> https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-all
> to this message.
> 

-- 
Regards,

Laurent Pinchart

