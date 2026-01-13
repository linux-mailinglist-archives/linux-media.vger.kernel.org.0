Return-Path: <linux-media+bounces-50558-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 856E8D18F71
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 13:56:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0005930B1189
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 12:44:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3427E38FF06;
	Tue, 13 Jan 2026 12:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MvoQjfoM"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E0538FEE7;
	Tue, 13 Jan 2026 12:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768308199; cv=none; b=iK4fQWBMqNbtQOAkBwxdB6QQRrtXii6SPTJcFMrpnEIfLVoQIOfj4zLjm4ibDW1XKl0+ERe8o6XZCgkobmGCzv7ib8IkUZflhHZ0xlUSe22RDCk6EMF2NSB8n+3Td49II9imJ+Y08CcbHXTJcWYOPaXZD8hGDCzrxeK+ySGAJFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768308199; c=relaxed/simple;
	bh=KYV8YUs5/Ts/mDUYvEvjy/TQD/MsX71OSRUwlnJyqyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uqW+D+xvA7a6SKiSk6X5h0t8WiNbx1ZOajRGYehUVcZ5WQbEu9kos9twCqd+CXovo4VqE+FgXHnnsbLBRqgOVOQhdWITGvf/8Pkw6Wvr1Kmvi28AAqSqZBN9fLnnkqaXVpp1P4Sd2VDZGWFeOeMACWKi4CzeDQc9VODkHtYWSjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MvoQjfoM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A6B0D50A;
	Tue, 13 Jan 2026 13:42:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768308169;
	bh=KYV8YUs5/Ts/mDUYvEvjy/TQD/MsX71OSRUwlnJyqyA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MvoQjfoMAuW42PrbiPmd5ZYWUxT6Gyn6/bVatkUXrnjNeO9JH7btqh09ItPAuCBn8
	 ZI41nMZB02+dNIXiEr06ztnzg4bXbNNNumY4zS/P/9LHPEgAar1sfyfbJfDzc0g/8T
	 scDF7AABrY3Qf3MsB2Wf+v1OXY4hUFm9L/BZSLDo=
Date: Tue, 13 Jan 2026 13:43:12 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	"jempty.liang" <imntjempty@163.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	dan.scally@ideasonboard.com, mchehab@kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: mali-c55: Fix NULL dev stream alert for tpg
 sub-device
Message-ID: <aWY8__K4nVs0bEWT@zed>
References: <20260113075722.143238-1-imntjempty@163.com>
 <aWYHPKMVFu_QC1Ow@zed>
 <aWYhGQcDVRDTyvxj@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aWYhGQcDVRDTyvxj@kekkonen.localdomain>

Hi Sakari

On Tue, Jan 13, 2026 at 12:40:25PM +0200, Sakari Ailus wrote:
> Hi Jacopo,
>
> On Tue, Jan 13, 2026 at 09:55:10AM +0100, Jacopo Mondi wrote:
> > I wonder if v4l2_device_register_subdev() shouldn't WARN or if return
> > an error if sd->dev is not initialized. Laurent, Sakari: opinions ?
>
> I might even return an error but I wonder what would break. Perhaps indeed
> could start with a warning?

I would start with:

--- a/drivers/media/v4l2-core/v4l2-device.c
+++ b/drivers/media/v4l2-core/v4l2-device.c
@@ -117,6 +117,13 @@ int __v4l2_device_register_subdev(struct v4l2_device *v4l2_dev,
        if (!v4l2_dev || !sd || sd->v4l2_dev || !sd->name[0])
                return -EINVAL;

+       /*
+        * Initializing sd->dev is mandatory. Warn for now to give faulty
+        * drivers a bit of time to update before actually returning an error.
+        */
+       WARN_ON(!sd->dev);
+
        /*
         * The reason to acquire the module here is to avoid unloading
         * a module of sub-device which is registered to a media

Would you like a patch ?

>
> --
> Sakari Ailus

