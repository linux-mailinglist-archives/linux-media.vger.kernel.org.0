Return-Path: <linux-media+bounces-8341-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BC602894B1F
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 08:05:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ECC1A1C21EE0
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 06:05:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D41918633;
	Tue,  2 Apr 2024 06:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CWqvNarl"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9157718050;
	Tue,  2 Apr 2024 06:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712037920; cv=none; b=NUKZXPVghbi1G3RfGhFmRqaL+r3ykGf8cRut+flxTxEFdI2NbvH1agxfCm9uTSRjoIUr8Abo5GGApm0rq1fXFLaUjiRO0J0OyXDZlJviCIB4IYrwt5W2rORqIvKIEnU4uKN6jIZkAQkjJj4aZg3mGo6Za9+k8Glhhqs2HvW1tlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712037920; c=relaxed/simple;
	bh=R2rxvXbohJO3k0/+9Md9Em0PuyiGD+6RBr/SKELtoVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bxc+omZRcQFkU9UDIGFhc8bUmGwd3SGId5Y6FTb94y76scNREZqA/qUrxk2vMe8GypYGPzYNSzfRG+7XnQUETK5NEOFJ3rJPQryDC+jlLUYtjzKTxeAt3Z1tGSv7mEGi6dVKFQYBizVa8T6LDNW8nkX1Ya1AAkCCSg93a54bRZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CWqvNarl; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3C5932A5;
	Tue,  2 Apr 2024 08:04:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712037880;
	bh=R2rxvXbohJO3k0/+9Md9Em0PuyiGD+6RBr/SKELtoVM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CWqvNarlMuvyCOMKmKhPvbCYA6ZGq6UK/RzEZJsTAlXbT4YJKuFycpaQ6iqFLmRyX
	 xR/fYZBOD4ZnyBIs6EYCJ0uzBe+ezRPkjxQALU9XYy2bhM55eBpJdAwC8IAmxV8ezF
	 tBNhOgTKoRA+cT4c4KLxsWN/24Vzzu8qKasmAXdc=
Date: Tue, 2 Apr 2024 09:05:07 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Naushir Patuck <naush@raspberrypi.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	kernel-list@raspberrypi.com, linux-rpi-kernel@lists.infradead.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v7 09/15] media: bcm2835-unicam: Add support for
 CCP2/CSI2 camera interface
Message-ID: <20240402060507.GA4703@pendragon.ideasonboard.com>
References: <20240324220854.15010-1-laurent.pinchart@ideasonboard.com>
 <20240324220854.15010-10-laurent.pinchart@ideasonboard.com>
 <b4506224-b75a-49d8-8651-a48f39149d52@ideasonboard.com>
 <20240401135216.GF8623@pendragon.ideasonboard.com>
 <cdcf9848-eee9-44a7-b033-315b1514740d@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cdcf9848-eee9-44a7-b033-315b1514740d@ideasonboard.com>

On Tue, Apr 02, 2024 at 09:00:43AM +0300, Tomi Valkeinen wrote:
> On 01/04/2024 16:52, Laurent Pinchart wrote:
> > On Wed, Mar 27, 2024 at 01:21:09PM +0200, Tomi Valkeinen wrote:
> >> On 25/03/2024 00:08, Laurent Pinchart wrote:
> >>> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> >>>
> >>> Add a driver for the Unicam camera receiver block on BCM283x processors.
> >>> It is represented as two video device nodes: unicam-image and
> >>> unicam-embedded which are connected to an internal subdev (named
> >>> unicam-subdev) in order to manage streams routing.
> >>
> >> Shouldn't this driver call get_frame_desc somewhere to get the VC and DT
> >> for the streams?
> > 
> > Generally speaking, yes. In practice, configuring the DT from the frame
> > descriptor is probably not very useful, as CSI-2 sources that transmit
> > image data using a DT that doesn't correspond to the media bus code are
> > not very common and I don't expect this to be needed for unicam.
> 
> Perhaps, but if the driver gets the DT from the frame descriptor, then 
> the driver doesn't need to have tables for the DTs.
> 
> Although when I did this with the RPi CFE driver, I also implemented a 
> fallback mechanism for the cases when there is no get_frame_desc, and so 
> I still had to keep the DT tables...

I did the same in v9. The DT value in the existing format info table
also serves for CCP2 support, which isn't supported by
.get_frame_desc(). Even if it was, CCP2 doesn't have an explicit DT
concept (as far as I can tell), but the hardware requires the DT value
to still be programmed.

-- 
Regards,

Laurent Pinchart

