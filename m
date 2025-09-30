Return-Path: <linux-media+bounces-43417-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CBCBAC5E1
	for <lists+linux-media@lfdr.de>; Tue, 30 Sep 2025 11:53:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 378B8163523
	for <lists+linux-media@lfdr.de>; Tue, 30 Sep 2025 09:53:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A1A62F5A2D;
	Tue, 30 Sep 2025 09:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XqgP9J7j"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D902F39B4;
	Tue, 30 Sep 2025 09:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759226028; cv=none; b=c6+VMhkJIRC0abJWtLKre6iPPBt6S3M9HLQsyQUQ5qkqYYFYXCepQG4vuBrlO26XyRLneKKnAhDrRrrpC31uI+n8AuK3xOF6Vg00+Tg1UzGho+7WBCdyKRrmYTCynR70/57EBQRSr7LlucrJVhRVSRuT1G7ps/HJ7eM4iGMtYgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759226028; c=relaxed/simple;
	bh=+1+bgW1z4wOHbD9FgqcdV990p4ZQHAphmfT13vG2Hu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bnrfR4VgriGHOgv2Jq30niyN5+S8vknP53Q+YJp0ur91xi+UpRQNzz8nxsXSwaULayCy1f4PbXgls+Ud4Ndkp+idCrtkqHe8+0bJgIFZF1hXYB4OD7fc++BpRQZQQbDP3T6I3gYkbzlRIdCo8OlBSfS7JsOHb736gHiS7jxQp3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XqgP9J7j; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0B69642B;
	Tue, 30 Sep 2025 11:52:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759225935;
	bh=+1+bgW1z4wOHbD9FgqcdV990p4ZQHAphmfT13vG2Hu0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XqgP9J7jW2PATRQAfmomeMRpYnAl95gk/0YYRoCl0iWyQoy+Et2EJZHsOG6+rO7rO
	 zAUB84+P40dlK/QfStwAtcXz8sB+cltvWyLiiVxQF7HxUwFRfbXC6m3yF3aF+BSAOm
	 fksVDHIk0J6NifdmR2Mpq9ERxyiGE3GoXiKbder8=
Date: Tue, 30 Sep 2025 11:53:39 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Anthony McGivern <Anthony.McGivern@arm.com>
Cc: "jacopo.mondi@ideasonboard.com" <jacopo.mondi@ideasonboard.com>, 
	"bcm-kernel-feedback-list@broadcom.com" <bcm-kernel-feedback-list@broadcom.com>, "florian.fainelli@broadcom.com" <florian.fainelli@broadcom.com>, 
	"hverkuil@kernel.org" <hverkuil@kernel.org>, "kernel-list@raspberrypi.com" <kernel-list@raspberrypi.com>, 
	"Kieran Bingham (kieran.bingham@ideasonboard.com)" <kieran.bingham@ideasonboard.com>, 
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"linux-rpi-kernel@lists.infradead.org" <linux-rpi-kernel@lists.infradead.org>, "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>, 
	"mchehab@kernel.org" <mchehab@kernel.org>, 
	"nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>, "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>, 
	"tfiga@chromium.org" <tfiga@chromium.org>, 
	"tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v2 12/27] media: v4l2-subdev: Introduce v4l2 subdev
 context
Message-ID: <pdxsi4fskze6mvgro5foa3jvmrvl3ihmksnzukonoihkb5xum5@kph26jtiayda>
References: <DU0PR08MB8836559555E586FCD5AE1CBA811FA@DU0PR08MB8836.eurprd08.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DU0PR08MB8836559555E586FCD5AE1CBA811FA@DU0PR08MB8836.eurprd08.prod.outlook.com>

Hi Anthony

On Thu, Sep 25, 2025 at 09:26:56AM +0000, Anthony McGivern wrote:
>
> Hi Jacopo,
>
> On Thu, Jul 24, 2025 at 16:10:19 +0200, Jacopo Mondi write:
> > Introduce a new type in v4l2 subdev that represents a v4l2 subdevice
> > contex. It extends 'struct media_entity_context' and is intended to be
> > extended by drivers that can store driver-specific information
> > in their derived types.
> >
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>
> I am interested in how the sub-device context will handle the Streams API? Looking at the commits the v4l2_subdev_enable/disable_streams functions still appear to operate on the main sub-device only. I take it we would have additional context-aware functions here that can fetch the subdev state from the sub-device context, though I imagine some fields will have to be moved into the context such as s_stream_enabled, or even enabled_pads for non stream-aware drivers?
>

mmm good question, I admit I might have not considered that part yet.

Streams API should go in a soon as Sakari's long awaited series hits
mainline, and I will certainly need to rebase soon, so I'll probably
get back to this.

Have you any idea about how this should be designed ?

Thanks
  j

> Anthony

