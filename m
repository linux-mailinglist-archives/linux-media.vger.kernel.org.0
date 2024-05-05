Return-Path: <linux-media+bounces-10804-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 129CF8BC3B8
	for <lists+linux-media@lfdr.de>; Sun,  5 May 2024 22:37:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 51CDDB21A06
	for <lists+linux-media@lfdr.de>; Sun,  5 May 2024 20:37:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7E6D6D1B5;
	Sun,  5 May 2024 20:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BOdXmn8r"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29AB1E895
	for <linux-media@vger.kernel.org>; Sun,  5 May 2024 20:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714941421; cv=none; b=fXQMvgI6jqx2s9cnmYRBwM7HCZLWEyAIp5y2dxxNphn4Rg9C+N/ajvXaDw84xLi75/38JzgdJt20gCU6dIDuAzbomcBtPgREhzpq+7xnCCvgOqidSgdhURTUmq0ntFqP7Evln51FF1w325bKSu4NJ4JYlC4PlvGBn3VTglojtXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714941421; c=relaxed/simple;
	bh=Mtzd4Os7fBWTVS5NQSYKifeZdKgfAvJOvhTDzhrmaes=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ajmhSMUihSA3vk/IFOREXmYZWhQz4xVmebh6OSSTTim+VmVrDRtTPhFRNu+b7zClq+qR5MB9MbF3KyzVf2A6YkcjnudkegnSIJzOnzUxyPyb2ClR7VOTrgum57Gb9C8h72o32Q6OREf4gurjc/I3wnV+j8QlhQA5GJoDVXcE9uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BOdXmn8r; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0135363B;
	Sun,  5 May 2024 22:36:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714941415;
	bh=Mtzd4Os7fBWTVS5NQSYKifeZdKgfAvJOvhTDzhrmaes=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BOdXmn8rT7VtQgLkqbqxUkrkVNsa6PXF123fvhjy816FgU8p4YqszTJw+Od/IdEt3
	 s0BDJHVSrSMALQH8CZe6UU8Ue3Wl1PKoPUoy1nG04LdHMxu5mECqAbFewbf2HhlYFW
	 43psCCzXjn/VEOjeNPNjGjePpYPjtevNM/EPKpcM=
Date: Sun, 5 May 2024 23:36:48 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v1 0/9] media: vimc improvements
Message-ID: <20240505203648.GA25270@pendragon.ideasonboard.com>
References: <20240424235741.17093-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240424235741.17093-1-laurent.pinchart@ideasonboard.com>

Hello,

On Thu, Apr 25, 2024 at 02:57:32AM +0300, Laurent Pinchart wrote:
> Hello,
> 
> This patch series cleans up and improves the vimc driver, with the end
> goal of converting it to the V4L2 subdev active state API. The goal of
> this exercise is to make the API used by a virtual test driver, to
> increase test coverage.
> 
> The series starts with 4 random cleanups, to avoid unnecessary
> iterations (1/9), constify structures (2/9 and 3/9) and rename a
> weirdly-named enum (4/9). Patch 5/9 then centralizes the subdev
> internal_ops initialization to prepare for the switch to the active
> state API. The remaining patches (6/9 to 9/9) convert the vimc entities
> to the new API one by one.
> 
> The result has been tested using the libcamera unit tests, which make
> extensive use of the vimc driver, as well as with v4l2-compliance. The
> latter reports 4 errors, but they occur already with the latest stage
> master branch.

Any comment about this patch series ? Shuah, do you plan to give it a
look ? If you don't have much time for vimc these days that's OK, I can
work with Kieran to get the patches reviewed.

On a related note, I would like to modify the MC pipeline of the vimc
driver to make it look more like a real ISP. This would help with unit
testing and compliance testing in libcamera. I briefly discussed this
with Hans on IRC who had no objection. If anyone has any issue or
concern with this plan, I would appreciate if you could let me know.

> Laurent Pinchart (9):
>   media: vimc: Don't iterate over single pad
>   media: vimc: Constify vimc_ent_type structures
>   media: vimc: Constify the ent_config array
>   media: vimc: scaler: Rename vic_sca_pad enum to vimc_scaler_pad
>   media: vimc: Centralize subdev internal_ops initialization
>   media: vimc: Initialize subdev active state
>   media: vimc: sensor: Use subdev active state
>   media: vimc: debayer: Use subdev active state
>   media: vimc: scaler: Use subdev active state
> 
>  .../media/test-drivers/vimc/vimc-capture.c    |   2 +-
>  drivers/media/test-drivers/vimc/vimc-common.c |  25 ++-
>  drivers/media/test-drivers/vimc/vimc-common.h |  14 +-
>  drivers/media/test-drivers/vimc/vimc-core.c   |   2 +-
>  .../media/test-drivers/vimc/vimc-debayer.c    | 197 ++++++++----------
>  drivers/media/test-drivers/vimc/vimc-lens.c   |   5 +-
>  drivers/media/test-drivers/vimc/vimc-scaler.c | 134 +++++-------
>  drivers/media/test-drivers/vimc/vimc-sensor.c | 125 +++++------
>  8 files changed, 236 insertions(+), 268 deletions(-)
> 
> 
> base-commit: e42a204f0519a2540f1507ac2798be2aeaa76bee

-- 
Regards,

Laurent Pinchart

