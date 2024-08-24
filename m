Return-Path: <linux-media+bounces-16715-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A8595E066
	for <lists+linux-media@lfdr.de>; Sun, 25 Aug 2024 01:34:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 57E94B21611
	for <lists+linux-media@lfdr.de>; Sat, 24 Aug 2024 23:34:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F63A143C65;
	Sat, 24 Aug 2024 23:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bES2fFSX"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D44239FE5
	for <linux-media@vger.kernel.org>; Sat, 24 Aug 2024 23:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724542468; cv=none; b=ltbmlHMCBfqHrBgSzLL4bwv/ulFRfJL6Jw44F13rJQCyFNa0fup/5wWbvcTildGfRrCjNEb5cBDcTCceQWlyKpuDhvICuX+aJ4lGo/uO6G3k8/mV+neglLJthykq1zXTq8tTaE9u3TZxwNprz6Leomi37XgPTZojnm5Lj4UJ4Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724542468; c=relaxed/simple;
	bh=opoy/I9FaCThhtedpmK3IiOOichfr384mpWAOvQm8X4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=APHKlLNN486VVjxB9V/8i8uqMRRMNNAT2M++VKUT4U2ioXN3teNf5c6FY0s181v5EWiYlSa93wHPVSh0NveGHTMDfGWfZokWYxmNDbPvZbJji6Hzx0WnyVGHOiZhKdt5vngRFLXYw7kAkKQPLU+KAQaD2t80jtXIJTF0XgmyMMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bES2fFSX; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5B5AC5A4;
	Sun, 25 Aug 2024 01:33:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724542400;
	bh=opoy/I9FaCThhtedpmK3IiOOichfr384mpWAOvQm8X4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bES2fFSXQLVhQg/VDf/k3wIuo8pWrWfzoVX+M9zLgG18vzMPfnZ079GdKGPV1oH2d
	 qHLciYrFSYRs5LSciSZAvqKxqxrrtwr85Kg6ysbkTjJth3SLXY9zqh5xCFlk3KqrIW
	 dph90/IFXSV+sPh2lBYgLUCkdJnHgZxAiM8wriKg=
Date: Sun, 25 Aug 2024 02:34:22 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [GIT PULL FOR v6.12] Miscellaneous IMX patches
Message-ID: <20240824233422.GA10401@pendragon.ideasonboard.com>
References: <20240824233233.GB9543@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240824233233.GB9543@pendragon.ideasonboard.com>

On Sun, Aug 25, 2024 at 02:32:34AM +0300, Laurent Pinchart wrote:
> Hello Mauro, Hans,
> 
> The following changes since commit a043ea54bbb975ca9239c69fd17f430488d33522:
> 
>   Merge tag 'next-media-rkisp1-20240814' of git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git (2024-08-14 17:18:47 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git tags/next-media-imx-20240825
> 
> for you to fetch changes up to 4fb5babe965768daf497503f4082e74abd1c0fed:
> 
>   media: imx8mq-mipi-csi2: Switch to RUNTIME/SYSTEM_SLEEP_PM_OPS() (2024-08-23 16:55:30 +0300)
> 
> CI has passed: https://gitlab.freedesktop.org/linux-media/users/pinchartl/-/pipelines/1256967.

I forgot to update the master branch before pushing the tag, so there
are warnings from checkpatch, but they're not caused by patches in this
pull request.

> ----------------------------------------------------------------
> Improvements to i.MX media drivers:
> 
> - Switch to RUNTIME/SYSTEM_SLEEP_PM_OPS() for better compile testing of
>   the imx-mipi-csis and imx8mq-mipi-csi2 drivers
> - Improve real time behaviour of imx-mipi-csis by avoiding logging while
>   holding a spin lock
> 
> ----------------------------------------------------------------
> Fabio Estevam (2):
>       media: imx-mipi-csis: Switch to RUNTIME_PM_OPS()
>       media: imx8mq-mipi-csi2: Switch to RUNTIME/SYSTEM_SLEEP_PM_OPS()
> 
> Matthias Fend (1):
>       media: imx-mipi-csis: avoid logging while holding spinlock
> 
>  drivers/media/platform/nxp/imx-mipi-csis.c    | 19 +++++++++++--------
>  drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 17 ++++++++---------
>  2 files changed, 19 insertions(+), 17 deletions(-)

-- 
Regards,

Laurent Pinchart

