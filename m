Return-Path: <linux-media+bounces-8443-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F41FB895E1F
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 22:55:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AFA7428C1C1
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 20:55:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9849715E21F;
	Tue,  2 Apr 2024 20:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cELZSDB3"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644651E4AE;
	Tue,  2 Apr 2024 20:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712091204; cv=none; b=Av0lv40tVJUpsXzGVqU6XV+00vTcMQiDSjcnpRtKSZs4Jf5IzAJPL2ZnI5o6lMK10B7xblxVzJw3vU7lYU3IERgXLlQemodDdttcvi8azcbZExwk13mO9dxBFmIi0vuMvYtiQRmEPAHmjaekknJZ9kP7/kcHkmpV4EXNqyI4WN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712091204; c=relaxed/simple;
	bh=WppgNJ/DzpDuUDT9XQja7RmtEtoOgEF0AQPxet5ENT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=us0juYG8ymolbDUsqwI7PR77RJAoMtwNuMg0zL7Q9ePKnfZyZZprwYTKosyn8C/tvI4d9m7uHYS7c9uRYSM0nbqnJ9ejfwGynvSDGd91EmXCqgRxfBX5qxIeHEmN0XRWK5EOZojRntivV+oibnxklQCTy/qb/kDMRl1M/eNNhjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cELZSDB3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EBCEF1A2;
	Tue,  2 Apr 2024 22:52:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712091164;
	bh=WppgNJ/DzpDuUDT9XQja7RmtEtoOgEF0AQPxet5ENT0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cELZSDB3Ogfj2I6kuvdvVL5zy7zoj+PwzrEBddoSH90yyt4s1ne/CIofjMqHrnH7g
	 Zx7ePtUNJ8yjjVtag4piWjJpBcqbx/dLJh6h790jItLhQ0EV+amvL04oh56x02WLq3
	 bNMyizZwNtgrxiOpSt9j1tqHSoIbgoJlYlrI4jq0=
Date: Tue, 2 Apr 2024 23:53:10 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-media@vger.kernel.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Naushir Patuck <naush@raspberrypi.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	kernel-list@raspberrypi.com, linux-rpi-kernel@lists.infradead.org,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v9 00/10] media: Add driver for the Raspberry Pi <5 CSI-2
 receiver
Message-ID: <20240402205310.GC16740@pendragon.ideasonboard.com>
References: <20240402000424.4650-1-laurent.pinchart@ideasonboard.com>
 <20240402001111.GA4761@pendragon.ideasonboard.com>
 <0f5bc6e1-a8d8-4067-bd02-b3ec570f2936@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0f5bc6e1-a8d8-4067-bd02-b3ec570f2936@broadcom.com>

On Tue, Apr 02, 2024 at 01:46:44PM -0700, Florian Fainelli wrote:
> Hello Laurent,
> 
> On 4/1/24 17:11, Laurent Pinchart wrote:
> > Hi Florian,
> > 
> > I think patches 05/10 ("ARM: dts: bcm2835-rpi: Move duplicate
> > firmware-clocks to bcm2835-rpi.dtsi"), 07/10 ("ARM: dts: bcm2711-rpi:
> > Add pinctrl-based multiplexing for I2C0"), 08/10 ("ARM: dts:
> > bcm2711-rpi-cm4-io: Add RTC on I2C0") and 09/10 ("ARM: dts:
> > bcm2711-rpi-4-b: Add CAM1 regulator") are ready for you to merge. This
> > would help reducing further iterations of this series.
> 
> I could not locate the base commit this series was posted against 
> (58abf3672a73558149fa567eafff8d5b1cc0446b), so patch 5 unfortunately did 
> not apply cleanly due to v6.9-rc1 still having a "dma-ranges" property, 
> fixed that up and the rest applied fine.

The base is in the rpi/v6.9/unicam/next branch of
https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git.
This series applies on top of the 3 DT drive-by fixes I've sent
separately.

-- 
Regards,

Laurent Pinchart

