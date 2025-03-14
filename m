Return-Path: <linux-media+bounces-28198-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AF291A60DE9
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 10:52:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D03E418973E0
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 09:52:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 152701F17E9;
	Fri, 14 Mar 2025 09:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uyb2ldtz"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F791DE89E;
	Fri, 14 Mar 2025 09:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741945911; cv=none; b=NkGxVlOT2T2AC+L9ugtELtK0fx45RzaGn+n0vHljGfhGCiAeoSHVkRcoimKYad9/CgDMWQuA1DiI40gozFk8Ax/Uez3LFT10TL6n4IZ/k9v2cWMcA2D4NeNc+ESmHkZlWvxBN06TrfuBNeutYaARsHbSrHqCHM8UTn6f7xe5EnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741945911; c=relaxed/simple;
	bh=WpB2wH8Zin+yYdBUElyhYpBTcPdHwyyhajffqrlOWoU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QJ4Xx9sBG0/UgTc7/do702n+F3PN2wcVMxVjdT2fZHYQhS8JAoF+euZ00VKrwB48YQW1WDEHOYNo8+XIBnWWtcA1lcuR8VPF/1p6Xd/YFwcpPP6xzrWuE1EEKlDwEH073u7kZ5au840k1XYrF7xuhCxFRN+7P0j4qfBdDiEUfNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uyb2ldtz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DCB3C4CEE3;
	Fri, 14 Mar 2025 09:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741945911;
	bh=WpB2wH8Zin+yYdBUElyhYpBTcPdHwyyhajffqrlOWoU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Uyb2ldtzuogLO1GwtKSivq1GMlnydy8JV7m/HiEGhJvV9X8Alr2macKfazrpeIVxF
	 aoKQYezFDr+m2tHphlOoiIPW/gBucybq4FBjOfoY6KBRd7qYndJ2G63Z5seEIvqks3
	 sSevNXjTR5trP12tcqLCwaQnxI2WKIKHI2yKs4WW0gDN7XNNQL7VL4xfDSR0aU0kbG
	 SM5TPV9suth1jlPV1qabaIbU6PC1I3Bw4OB7NufDhRSkOi47RFvuCh7hwBz0vEFcjp
	 sGBHLJdmcQvG5rhy08Axw2g3Wzf9DBe1ijxQE1S5Ov+HNeXxCbZVh+Ys+D0s1cqHVI
	 omCrDDBpnkmzg==
Date: Fri, 14 Mar 2025 09:51:46 +0000
From: Lee Jones <lee@kernel.org>
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 2/8] media: v4l2-flash: add support for flash/stobe
 duration
Message-ID: <20250314095146.GB3890718@google.com>
References: <20250314-ov9282-flash-strobe-v2-0-14d7a281342d@linux.dev>
 <20250314-ov9282-flash-strobe-v2-2-14d7a281342d@linux.dev>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250314-ov9282-flash-strobe-v2-2-14d7a281342d@linux.dev>

On Fri, 14 Mar 2025, Richard Leitner wrote:

> Add support for the new V4L2_CID_FLASH_DURATION control to the v4l2
> led flash class.
> 
> Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> ---
>  drivers/leds/led-class-flash.c                 | 15 +++++++++++++++
>  include/linux/led-class-flash.h                | 16 ++++++++++++++++

This should be a separate patch.

Then Mauro and I will have to come up with a merge-plan for the series.

>  drivers/media/v4l2-core/v4l2-flash-led-class.c | 13 +++++++++++++
>  3 files changed, 44 insertions(+)

-- 
Lee Jones [李琼斯]

