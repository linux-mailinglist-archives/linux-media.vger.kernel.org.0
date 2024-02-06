Return-Path: <linux-media+bounces-4761-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1046284B5F8
	for <lists+linux-media@lfdr.de>; Tue,  6 Feb 2024 14:08:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 28DD61C2266F
	for <lists+linux-media@lfdr.de>; Tue,  6 Feb 2024 13:08:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F30B12FF9F;
	Tue,  6 Feb 2024 13:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SdIuXqio"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D795C24A09
	for <linux-media@vger.kernel.org>; Tue,  6 Feb 2024 13:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707224928; cv=none; b=WzJyOU2L5Wzn5mTaQ4tjMlRkyui3/CmMUzxCBEvxJhuJWjT8IYC8+Kq657fpVvOk8AGhmQRmDr6KaDvaau4rq8eYX1Sf3J/3bQI3Yxl3IWGAWIk1uu2T1bp7M8SlfshT1CkuyCBj3N7zVtLN06HjHX77eRYOONMx1GaAqMCXWiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707224928; c=relaxed/simple;
	bh=67jLvYRqIxFDTAy9FEy20+/Ncq6v9OOdJ+OidSub/d0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BUXlYur3tUUPWCBGSzhNTLV4r4bKQ1qeqLh7+apjmL7VfhCNwZVL+msMuFDp+y+a6UfibSzCM/hdepymQzC+UyOMusE6yl9xrDpwy8ODHmRvVhD8Bq/Fs1z2MGSDjXCE/ouKUEIRbeB8wP58d0TABmHGj1Jq7gRMxLeH8SiYT/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SdIuXqio; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (85-76-34-85-nat.elisa-mobile.fi [85.76.34.85])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F008074A;
	Tue,  6 Feb 2024 14:07:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1707224835;
	bh=67jLvYRqIxFDTAy9FEy20+/Ncq6v9OOdJ+OidSub/d0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SdIuXqioAJraCoecy76LXa0JDo8DGW9efQNwxi2T8lfb74P2gBHivRpSCCGLJ1akB
	 +f9Ns/ntr+fQGtMBxgwCWThV+6tuTqpOyHtnYEB3AjbxWJx72+untbpclx3tprZ/+t
	 EkTde6GKHIxrurhEsyrYs4cxqc3jgqoGW+sz/hu8=
Date: Tue, 6 Feb 2024 15:08:38 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: linux-media@vger.kernel.org, hverkuil@xs4all.nl
Subject: Re: [GIT PULL FOR 6.9] Revert a faulty ov08x40 patch and re-apply a
 good one
Message-ID: <20240206130838.GD13235@pendragon.ideasonboard.com>
References: <ZcIg6YsKuLph6KV7@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZcIg6YsKuLph6KV7@valkosipuli.retiisi.eu>

On Tue, Feb 06, 2024 at 12:07:05PM +0000, Sakari Ailus wrote:
> Hi Mauro, Hans,
> 
> This PR reverts a faulty ov08x40 patch and re-applies the same with the bad
> DT binding and source changes removed.
> 
> Note that this HAS TO be merged before sending the current media stage tree
> further to Linus.
> 
> Thanks to Laurent for spotting the bad changes.

I spotted it thanks to sheer luck. The interesting question is to to
prevent this happening again.

> Please pull.
> 
> 
> The following changes since commit ee171dc5050212ea8677ed5cb777746cf00d72d9:
> 
>   media: nxp: imx8-isi: Factor out a variable (2024-02-05 14:29:35 +0100)
> 
> are available in the Git repository at:
> 
>   git://linuxtv.org/sailus/media_tree.git tags/for-6.9-3-signed
> 
> for you to fetch changes up to 4aeb29537d77d85bc7cb8c81b746b64e2c152763:
> 
>   media: ov08x40: Reduce start streaming time (2024-02-06 14:02:08 +0200)
> 
> ----------------------------------------------------------------
> Revert a bad ov08x40 patch and re-apply a good one
> 
> ----------------------------------------------------------------
> Jason Chen (1):
>       media: ov08x40: Reduce start streaming time
> 
> Sakari Ailus (1):
>       Revert "media: ov08x40: Reduce start streaming time"
> 
>  Documentation/devicetree/bindings/media/video-interfaces.yaml | 2 +-
>  arch/arm/boot/dts/ti/omap/omap3-n9.dts                        | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

-- 
Regards,

Laurent Pinchart

