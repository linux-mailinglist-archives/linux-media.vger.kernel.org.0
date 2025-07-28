Return-Path: <linux-media+bounces-38581-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 22817B13DE6
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 17:09:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 56CBD3B3FB9
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 15:08:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0770A2701DC;
	Mon, 28 Jul 2025 15:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YNugWOgT"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B20271445;
	Mon, 28 Jul 2025 15:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753715338; cv=none; b=qTQY+RJeVIoazOeQitjvNrVeQu+RlX/jB12cPn1JBtxPxs3/6BWWBi7ADsPNsCkNKjq1qzLr09rGlp/zo2kXl1T30O2OYhDsq/S+Fi5nDBgzOXCLr/NfieLyyR65hu59oKdcXALqqCmWV6KwVG6yQFju4KtjG93xGelFInFYpSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753715338; c=relaxed/simple;
	bh=CG3hzhVEa/YWkRQxQ4yvbM6yCNb/dYltNT7u/U0kDak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rrNIJKAeHVOen0cNBnLjzF2l79dJHK1WQ1MpKU1RaAIhHETtLz2xk4ZxI0TxJ92e05Z8P3ue2djRKkR6IOZQv0YCf6VyzIWU/2P2CTJTSRtlaFhl4/XWD1oXxOvsIoiQvj/eehvkMjcOl4NH9JMCQHj7MjwuOCq20JJs97XekKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YNugWOgT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id CE7BB3A4;
	Mon, 28 Jul 2025 17:08:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753715293;
	bh=CG3hzhVEa/YWkRQxQ4yvbM6yCNb/dYltNT7u/U0kDak=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YNugWOgTbR5wt43oF7MNQ96kaoSVa2dH7xXUKPO1Q4BYv6Idy2gU+u5yCBl6P10gw
	 izFG0CV5yKGsJtkBjf7ehbucNANLlI7W1K1QHlTgenOb+jDD2elcBkBWCIfVXRKG4Z
	 R+cuq+/gNzRiiWZBDnX53RcsLSIG5Z09fxynosNU=
Date: Mon, 28 Jul 2025 18:08:47 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 13/72] arm64: dts: renesas:
 aistarvision-mipi-adapter-2.1: Drop clock-frequency from camera sensor node
Message-ID: <20250728150847.GK787@pendragon.ideasonboard.com>
References: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
 <20250710174808.5361-14-laurent.pinchart@ideasonboard.com>
 <CAMuHMdV=kuBePu8iwfd6Z2naLYUvKM74G+UoDP9=PvD776SBmQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdV=kuBePu8iwfd6Z2naLYUvKM74G+UoDP9=PvD776SBmQ@mail.gmail.com>

On Mon, Jul 28, 2025 at 04:19:49PM +0200, Geert Uytterhoeven wrote:
> On Thu, 10 Jul 2025 at 19:49, Laurent Pinchart wrote:
> > The clock-frequency for camera sensors has been deprecated in favour of
> > the assigned-clocks and assigned-clock-rates properties. As the clock
> > source for the sensor is a fixed-frequency oscillator, simply drop the
> > clock-frequency.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Thanks for your patch!
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Doesn't this patch have a hard dependency on "[PATCH 66/72] media:
> i2c: ov5645: Use V4L2 legacy sensor clock helper", and thus shouldn't
> this patch be moved after the latter in this series?

Apparently it does. I'll move the DT changes to the end of the series.

-- 
Regards,

Laurent Pinchart

