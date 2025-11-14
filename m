Return-Path: <linux-media+bounces-47078-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B85CC5D20C
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 13:33:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AE1E54EFB02
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 12:24:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0BF7136358;
	Fri, 14 Nov 2025 12:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MrZGHd4q"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FF58632B
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 12:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763123013; cv=none; b=r2O7vNj33uKJVAXxpTQR1l47UWSUFzjnm8XFMEPIFtBNmYtEH8C8v0+aYC1oS7jwRDE3yBKRvfOLpi7vZfRWJW4+ujpUGH0q6hE3ZmmhJfAUkmmq9icgjnjbB1IZuaizSWq5tl2dehyWilYOQOM0ZBinAcihTpGdA7Zni+7kXdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763123013; c=relaxed/simple;
	bh=x73rOviazstGD57jcrh2aWL/vWhdNH3n2MAs2v1ya/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fzawWw6PlDbE07j3EQOy9xJbQJg4MXqT9mDBj46330r7KZHV+8Ut0t+1R7/uuKjaYc361TuNMdrDNXJrNS8pCMS5uBOa/Xw9u+BJOqDpo6rGokrU5gD+iZlqj1aW66axMMAH94prHzRS0cqHc+bjvLPdBP8+3qSMjmCtcn1wh4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MrZGHd4q; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-165-222.bb.dnainternet.fi [82.203.165.222])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 7E06F664;
	Fri, 14 Nov 2025 13:21:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1763122888;
	bh=x73rOviazstGD57jcrh2aWL/vWhdNH3n2MAs2v1ya/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MrZGHd4qgrhB50PFkiX3h8NWVc5ClNZGVqOaOtMPX2zZQwQhOPjRuY2Bv8jYprJ2o
	 Vqw25rW3Q74mOl5FhZHM0LEkQtuViLJu7uTwXBtWMopAiWt23pw+yM9VTemdCYBWg6
	 Oi91BU8eiyZ4BFuutryOvWh3ASBSoEWfTBseAIk8=
Date: Fri, 14 Nov 2025 14:23:16 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: hans@jjverkuil.nl, Sakari Ailus <sakari.ailus@linux.intel.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH 0/2] Mali-C55, v4l2-isp late fixes
Message-ID: <20251114122316.GH30434@pendragon.ideasonboard.com>
References: <20251114110213.523187-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251114110213.523187-1-jacopo.mondi@ideasonboard.com>

On Fri, Nov 14, 2025 at 12:02:10PM +0100, Jacopo Mondi wrote:
> As suggested by Hans, 2 patches to be applied on top of the Mali C55
> pull request.
> 
> The first addresses Hans' review comments on v4l2-isp and updates its users.
> The second one is a drive-by change that brings Mali in par with RkISP1 and
> C3 and asserts the size correctness of the ISP blocks handlers and type info.
> 
> Jacopo Mondi (2):
>   media: v4l2-isp: Rename block_info to block_type_info
>   media: mali-c55: Assert ISP blocks size correctness

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> 
>  .../platform/amlogic/c3/isp/c3-isp-params.c   |  9 ++++---
>  .../platform/arm/mali-c55/mali-c55-params.c   | 10 ++++---
>  .../platform/rockchip/rkisp1/rkisp1-params.c  |  9 ++++---
>  drivers/media/v4l2-core/v4l2-isp.c            | 16 ++++++------
>  include/media/v4l2-isp.h                      | 26 +++++++++----------
>  5 files changed, 38 insertions(+), 32 deletions(-)

-- 
Regards,

Laurent Pinchart

