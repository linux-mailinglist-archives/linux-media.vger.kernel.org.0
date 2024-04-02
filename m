Return-Path: <linux-media+bounces-8406-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A499E895818
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 17:23:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4B8D1C226B8
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 15:23:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21F0712F362;
	Tue,  2 Apr 2024 15:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="PpEGrgFV"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B991292D1
	for <linux-media@vger.kernel.org>; Tue,  2 Apr 2024 15:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712071391; cv=pass; b=k6Yb93HNZTwaCGF/vetZk3uyHNlAsceZprMJ2d5DElXWnN5QqhIrTnh+NyhuNwywS48W1y32oeAwHz4cRsW5VVZ76gGRba8c82maR8cn74/eXSij8P73Ya8hN8FQrUxPSHRJDOhaOsfn8XAD0e4CrtK4YcjC/n7jAKfb1FxFV3s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712071391; c=relaxed/simple;
	bh=koCTeswnnV2Y/Q4Q2Wmteh9L8HkVFL68wipjDLfmkxo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qFEHEnfaO4+EZxwpcnR8m5OZeQ7lmwbV244SGt0os3leWcWle9ggi61dnYiT8CcFf2SbewU8zajD/Z3lFxyIG5S5gwlP438XiDF45RUC49oj6R2nYxoH0IJzVZQbugxBWBUfTHlXLio/GYEihI1G0xZ3d2g7P5C8gjaC0De4WrY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=PpEGrgFV; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (80-248-247-191.cust.suomicom.net [80.248.247.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4V8BTj2r0xzyTX;
	Tue,  2 Apr 2024 18:23:04 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1712071386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Nmdx+tj23Am8N84MaQ3gp0/h1SJhYyukcifKx4Pg04g=;
	b=PpEGrgFVdzi9jckSK9A1NTgiYmj8TP4hbCWs9NiZrwJIvepm9sdKlV/ZyH6fk+S7sljlIP
	mgIdP/zn3mDwsZTsniI8CuatfIlyNR64uXQINei6l4XE+1rj2mRRUtgnMIVAUemSJWLksD
	Egd159s69CK99EaED7auj6kIkVmLsE0=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1712071386; a=rsa-sha256; cv=none;
	b=e4QAq20VM8JweifGvxMl2zj629nk3G2iQjPMr+95DCoUjKWaFRQmWCWKeAzrkifvPtMLme
	b8+vbM62xW5bHBA9xIcbYoXgqlhReTbKMZ+cqSJLjqAMRA0gOb5kJHYRXTekViI6eQdBxU
	Sa91wjBWJY8YAGMgOfMclS1D9EqMNE0=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1712071386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Nmdx+tj23Am8N84MaQ3gp0/h1SJhYyukcifKx4Pg04g=;
	b=QaKZi+D2mkFykb6g5SmjgpA5ZlqWbw1i5aZDzQXkFtJmafU2UET0cjBKLphyjkCVTQvBGK
	cPsmNFSCE4erVtcMFc2Ix8Vhae+gxo/Z4G4tuH7zCtFwVPr1GYU8l7w0xY3OcvMuLgk27n
	34AK1XXiBIi/F+mISU1tmxkDbufnAdQ=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 2B724634C93;
	Tue,  2 Apr 2024 18:23:04 +0300 (EEST)
Date: Tue, 2 Apr 2024 15:23:03 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH] media: v4l2-subdev: Fix stream handling for crop API
Message-ID: <Zgwi14Z7tciTBlIG@valkosipuli.retiisi.eu>
References: <20240401233725.2401-1-laurent.pinchart@ideasonboard.com>
 <Zgu_xhcadm2F1Rxl@valkosipuli.retiisi.eu>
 <20240402084407.GC10288@pendragon.ideasonboard.com>
 <ZgvF1wi2UpkUTC9-@valkosipuli.retiisi.eu>
 <d5f3af05-77e7-4647-877a-ffddfd9a2623@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d5f3af05-77e7-4647-877a-ffddfd9a2623@ideasonboard.com>

Moi,

On Tue, Apr 02, 2024 at 12:11:30PM +0300, Tomi Valkeinen wrote:
> On 02/04/2024 11:46, Sakari Ailus wrote:
> > On Tue, Apr 02, 2024 at 11:44:07AM +0300, Laurent Pinchart wrote:
> > > On Tue, Apr 02, 2024 at 08:20:22AM +0000, Sakari Ailus wrote:
> > > > Moi,
> > > > 
> > > > On Tue, Apr 02, 2024 at 02:37:25AM +0300, Laurent Pinchart wrote:
> > > > > When support for streams was added to the V4L2 subdev API, the
> > > > > v4l2_subdev_crop structure was extended with a stream field, but the
> > > > > field was not handled in the core code that translates the
> > > > > VIDIOC_SUBDEV_[GS]_CROP ioctls to the selection API. Fix it.
> > > > 
> > > > The field is indeed in the UAPI headers. But do we want to support the CROP
> > > > IOCTL for streams? Shouldn't the callers be using the [GS]_SELECTION
> > > > instead?
> > > 
> > > They should, but if the field is there, we should support it :-) The
> > > alternative is to remove it. It will cause failures in v4l2-compliance
> > > that we'll need to handle though.
> > 
> > I'd prefer to stick to selections here, this is new functionality so
> > [GS]_CROP support isn't required. I don't have a strong opinion on the
> > matter though.
> 
> Maybe it's easier to just support the stream field, instead of making
> [GS]_CROP the odd case which looks like it should support streams, but then
> doesn't...

It's an old IOCTL already replaced by the [GS]_SELECTION. I mainly write
kernel space software but overall I think it's better if we can provide a
single API for controlling cropping instead of two with similar
functionality, of which the user then should choose from.

It should be also documented in this context if we choose support
[GS]_CROP.

So I believe we have less work to do and have a better result if we just
drop the stream field there. :-) 

-- 
Terveisin,

Sakari Ailus

