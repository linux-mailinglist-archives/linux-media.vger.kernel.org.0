Return-Path: <linux-media+bounces-9654-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF038A7E27
	for <lists+linux-media@lfdr.de>; Wed, 17 Apr 2024 10:24:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 510511C21AFD
	for <lists+linux-media@lfdr.de>; Wed, 17 Apr 2024 08:24:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB80F7F479;
	Wed, 17 Apr 2024 08:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BahzZkh5"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E8C7D405;
	Wed, 17 Apr 2024 08:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713342271; cv=none; b=ZMZJ04VAEXujZtPIJv9kwBKsEC7NM05yn620qDlCJNog8zVLGPzC7xjtDg7Ku25YDToyklO6lo6U5hpn1vqyTx6ty/+818CYRcfOoxuEZ6jjFHBnw6EifJUwPY14hewoqs9YHSvLrvbSAYhPhw8GSCiVbVkVpMhV41eplJx2IiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713342271; c=relaxed/simple;
	bh=iDH0wPp8RuBNMMZYQphzWYhg0PnpKVzTZbt4Js0BeD4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X6BG+oRpOENe7W2IXwCYEZkXk2SGcWPcW4AGWiKbsrZ7xeAwzRFunqUUZGyhd8MSACLfz7V+KiWFgEejLwurCTGHEHbLmew6BG0lxCTt0k9FRDhVPx2t6RjLCMJx6VALvDmP8sfe5QVGs8XbqnthFLiY9IX63t2CHdoqawWOWbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BahzZkh5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (ptr-212-224-238-3.dyn.orange.be [212.224.238.3])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 50D71DD9;
	Wed, 17 Apr 2024 10:23:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713342214;
	bh=iDH0wPp8RuBNMMZYQphzWYhg0PnpKVzTZbt4Js0BeD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BahzZkh5qUP9h3c1DOjkObB2oJESB+JviGJflioInWzrWSBVydEBfoFwYG0woifHX
	 arZ8DMP/k3FKj6bMzgxvEmFDGCvvktQ2Jp+gKBAuhPlLhQziFgXV4xx67RthgwUt+9
	 +7nVoBqfzp0tcTyftkZU7o1Ogi4aSQ3QfalxkgyM=
Date: Wed, 17 Apr 2024 11:24:13 +0300
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
Subject: Re: [PATCH v9 06/10] ARM: dts: bcm2835: Add Unicam CSI nodes
Message-ID: <20240417082413.GK12561@pendragon.ideasonboard.com>
References: <20240402000424.4650-1-laurent.pinchart@ideasonboard.com>
 <20240402000424.4650-7-laurent.pinchart@ideasonboard.com>
 <c3f1773a-b65b-4ccc-a684-e5e57b325777@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c3f1773a-b65b-4ccc-a684-e5e57b325777@broadcom.com>

Hi Florian,

On Tue, Apr 16, 2024 at 08:18:30PM -0700, Florian Fainelli wrote:
> On 4/1/2024 5:04 PM, Laurent Pinchart wrote:
> > From: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
> > 
> > Add both MIPI CSI-2 nodes in the bcm283x tree and take care of the
> > Raspberry Pi / BCM2711 specific in the related files.
> > 
> > Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> 
> Should I be taking this patch for the upcoming merge window as well or 
> do you anticipate more changes to be needed? AFAICT the binding has been 
> approved by Rob, so we should be good to go with the basic node proposed 
> here?

We're trying to land the Unicam driver in the next merge window, but it
may slip to v6.11. From my point of view the bindings are stable, so
merging the DT integration is fine with me, as long as the DT
maintainers are fine if the bindings end up being merged one kernel
release later.

-- 
Regards,

Laurent Pinchart

