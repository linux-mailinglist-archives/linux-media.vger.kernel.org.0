Return-Path: <linux-media+bounces-33013-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1052FABF35D
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 13:52:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F4053A7967
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 11:52:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BCF226460B;
	Wed, 21 May 2025 11:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.b="Upcp0xtd"
X-Original-To: linux-media@vger.kernel.org
Received: from dane.soverin.net (dane.soverin.net [185.233.34.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D84261595
	for <linux-media@vger.kernel.org>; Wed, 21 May 2025 11:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.34.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747828368; cv=none; b=eoplkWMy8xEIFr6fonvJNwh3KT+iBNNj4hE3PBhcGDrBBB3s9ZVQC+mJEsZG1utzyqtKPdODOs/V1++5hBK8Ci0jvLZiU3jzQDWCtrR4SyDyEJaNupgTWoFGaVyWS2lZm25eMxDFaiEbApYLLHCJUgvJh00EVSkArtoEYI98zGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747828368; c=relaxed/simple;
	bh=p2Z7BCMzBQMXO7w4pVLaSsK3+xb41h9suko3HG35dsU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mkrv1nu7IDhBUuCwfIAbQSijiwNdMKeknTSGXo70RhpLxhKlCTgOrB4orYj9z/B3Z7n85lg0nlNMwqJ9Q/s+OE+p0yPh+pLA3Z+88Cef2kIMY2ntOqcyffOHIVwZ2kE+y2xQBlvh8Ac0FSPd+crdFgpZaQiH7VANdoSC2rDnehg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jjverkuil.nl; spf=pass smtp.mailfrom=jjverkuil.nl; dkim=pass (2048-bit key) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.b=Upcp0xtd; arc=none smtp.client-ip=185.233.34.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jjverkuil.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jjverkuil.nl
Received: from smtp.freedom.nl (unknown [10.10.4.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by dane.soverin.net (Postfix) with ESMTPS id 4b2VCl70Z4z182x;
	Wed, 21 May 2025 11:52:35 +0000 (UTC)
Received: from smtp.freedom.nl (smtp.freedom.nl [10.10.4.107]) by freedom.nl (Postfix) with ESMTPSA id 4b2VCl1dzfz4c;
	Wed, 21 May 2025 11:52:35 +0000 (UTC)
Authentication-Results: smtp.freedom.nl;
	dkim=pass (2048-bit key; unprotected) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.a=rsa-sha256 header.s=soverin1 header.b=Upcp0xtd;
	dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jjverkuil.nl;
	s=soverin1; t=1747828355;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=G+Ws+Va3Vk3I7uqQexKWqwH+hX1ysdpUGWYkiEYImMY=;
	b=Upcp0xtdEoF95EZAsp1CoPKO0xGcL3WptAqapWhAwsDKCHPofU4GL57/JddJJI3+9AHWPM
	O/x34WZu4tPa1osMcMETfy0nI+8R0jwFslkrUzQpdUPbMB2qFJJ36nixOaqXoafvzTF7nu
	Q5YM3ex3T40Mysz7PHwGwN6vOWEiccxHDd9+o8kLr9M/8w/3pOacrJ76K6G109SSvcxYBf
	nmIomWbHwgw2si64ojuy/NDy0uPTwvxBgIJ54lFbNdF2+etoiekLOrJW0jNAClInPr837T
	Y02YL3Bo19pZqHU/jPsXkCJkp1G8dugbU9hIcPGVD/eXbwE3NHklFkVaqHQ8Mw==
X-CM-Envelope: MS4xfEP+o2UAk+KS7hRcDWQy/NY6GkZH32c4tXc+B/CRasiCqet+Iktyei1j8QHN1AP5oFw1TcsyOLxwlgr9252NCL3aQ5DGCnPUaUxMKskG97/XLHS+ZW+W qsoK90zXJy8/KXmnbwR/HpB3XBO1ckCb8D5YVNUYdZHaRVvMB90mK2JVH7jUEEXYw70KbiV1/3JyuM8+13kVtL8p8Xgs7BZpVwYIpdUtpykvhN0lQuaqMMpV kObeL6T/i+LD4d1MHK/GtKQpZNmn1RZreL2pWLWOLtj2Ppb4h5Pb4E08ksFvLgf8
X-CM-Analysis: v=2.4 cv=I7afRMgg c=1 sm=1 tr=0 ts=682dbe83 a=xVxOAnYOZqKVbrsbIgLjXQ==:117 a=xVxOAnYOZqKVbrsbIgLjXQ==:17 a=IkcTkHD0fZMA:10 a=QyXUC8HyAAAA:8 a=zkDc2X_-8vvzHvq_k9sA:9 a=QEXdDO2ut3YA:10
Message-ID: <03611b42-937a-4f85-b822-bd0f652e6ccc@jjverkuil.nl>
Date: Wed, 21 May 2025 13:52:35 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] media: v4l2-ctrls: Don't reset handler's error in
 v4l2_ctrl_handler_free()
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com
References: <20250508160852.1090549-1-sakari.ailus@linux.intel.com>
Content-Language: en-US, nl
From: Hans Verkuil <hans@jjverkuil.nl>
Autocrypt: addr=hans@jjverkuil.nl; keydata=
 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
In-Reply-To: <20250508160852.1090549-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spampanel-Class: ham

On 08/05/2025 18:08, Sakari Ailus wrote:
> It's a common pattern in drivers to free the control handler's resources
> and then return the handler's error code on drivers' error handling paths.
> Alas, the v4l2_ctrl_handler_free() function also zeroes the error field,
> effectively indicating successful return to the caller.
> 
> There's no apparent need to touch the error field while releasing the
> control handler's resources and cleaning up stale pointers. Not touching
> the handler's error field is a more certain way to address this problem
> than changing all the users, in which case the pattern would be likely to
> re-emerge in new drivers.
> 
> Do just that, don't touch the control handler's error field in
> v4l2_ctrl_handler_free().

I think with this change the control framework documentation should be
updated: Documentation/driver-api/media/v4l2-controls.rst

There is a code example on line 197 that can be converted to the new
approach.

Also document that the error field is not touched by v4l2_ctrl_handler_free()
in include/media/v4l2-ctrls.h.

> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> Hi all,
> 
> This is currently affecting the following drivers:
> 
> 	drivers/media/i2c/imx334.c
> 	drivers/media/i2c/imx335.c
> 	drivers/media/i2c/imx412.c
> 	drivers/media/i2c/ov2740.c
> 	drivers/media/i2c/ov5675.c
> 	drivers/media/i2c/ov9282.c
> 	drivers/media/pci/tw68/tw68-core.c
> 	drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
> 	drivers/media/platform/samsung/s3c-camif/camif-capture.c
> 	drivers/media/platform/verisilicon/hantro_drv.c
> 	drivers/media/test-drivers/visl/visl-core.c

also:

drivers/input/touchscreen/sur40.c
drivers/media/i2c/adv748x

In any case, this looks good to me.

Regards,

	Hans

> 
> The fact that one of them is a test driver tells a lot. :-)
> 
> The patch is untested. If we agree to do this, the patch should probably
> be cc'd to stable, too.
> 
> - Sakari
> 
>  drivers/media/v4l2-core/v4l2-ctrls-core.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> index 90d25329661e..932aedc26049 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> @@ -1661,7 +1661,6 @@ void v4l2_ctrl_handler_free(struct v4l2_ctrl_handler *hdl)
>  	kvfree(hdl->buckets);
>  	hdl->buckets = NULL;
>  	hdl->cached = NULL;
> -	hdl->error = 0;
>  	mutex_unlock(hdl->lock);
>  	mutex_destroy(&hdl->_lock);
>  }


