Return-Path: <linux-media+bounces-6256-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA33D86EB17
	for <lists+linux-media@lfdr.de>; Fri,  1 Mar 2024 22:23:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E3B4284307
	for <lists+linux-media@lfdr.de>; Fri,  1 Mar 2024 21:23:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAEB357878;
	Fri,  1 Mar 2024 21:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V68D5UZs"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B35C5733F;
	Fri,  1 Mar 2024 21:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709328219; cv=none; b=OLZUufb+6DZVMirCpC4UNsdW88PyVXy4oXk6ib/CBW4pMObSDJEXVPBqnQvrUqqas8YrFQCiPlwFO0sYh8JhpcJHsV3firH6KxONDpzotcHeh3saTfX0WAMWnmK02K1oUVRoVddMaN5taGjSLbx4MuyGG04/rn/VlX/jBgMFaTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709328219; c=relaxed/simple;
	bh=GX2qzQwDr7Zhypt11xhh2AlwjHUUCEBLsUYK1wQPLR8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FclcH2QZETv63ohgMHD+hbonsoxS4JRbu/QXAR3mRvQEup4zoIshYPk/SDdFnzIodhnVYpC6AN0vD71f6RwH+OMSoW1XOVomK07Ao8/ta1K4b/YBToKJFWK3ZD5sW/kgpMtvKCiKKzaqMIV6ll3yO7JUMEnKIc0hQKihgOxfsR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V68D5UZs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D4F2C433F1;
	Fri,  1 Mar 2024 21:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709328218;
	bh=GX2qzQwDr7Zhypt11xhh2AlwjHUUCEBLsUYK1wQPLR8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V68D5UZsGtv8HaqYrPm3tYqzsQxdB+Sh4lvGksAWx/x5d6fI7t1v58TLG4IVy5vAN
	 oWuXzQL8Y3ar3GrCKRMAzCJhViEEkCvZkOWXOssWCPjocUdW3mNnEKWm+UKzzkOgRk
	 EnXt9NAFcmYbk4ZRkyKi0GuzQZM9yDErEEWE5Rzf7h6NLyDp97ETr3kWSpZLGVRjwV
	 n9vQGVQHQ3KUUZuljiRcJ4T265FypxsWsbY52eQ5KOhN1/jCvXfcAFRFlXbICBQUtx
	 H8UQzLdPSzb1iK4FoDMhunOR2vp0iFp1POsoyg9IfIlPB7nkk5UDww+baQnvu/nVNk
	 wLhE8soUNdogg==
Date: Fri, 1 Mar 2024 15:23:36 -0600
From: Rob Herring <robh@kernel.org>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: devicetree@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	David Plowman <david.plowman@raspberrypi.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>,
	Naushir Patuck <naush@raspberrypi.com>
Subject: Re: [PATCH v2 7/9] media: dt-bindings: Add bindings for Raspberry Pi
 PiSP Back End
Message-ID: <170932821578.3062059.18150159256247255021.robh@kernel.org>
References: <20240223163012.300763-1-jacopo.mondi@ideasonboard.com>
 <20240223163012.300763-8-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240223163012.300763-8-jacopo.mondi@ideasonboard.com>


On Fri, 23 Feb 2024 17:30:09 +0100, Jacopo Mondi wrote:
> Add bindings for the Raspberry Pi PiSP Back End memory-to-memory image
> signal processor.
> 
> Datasheet:
> https://datasheets.raspberrypi.com/camera/raspberry-pi-image-signal-processor-specification.pdf
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  .../bindings/media/raspberrypi,pispbe.yaml    | 63 +++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>


