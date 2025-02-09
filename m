Return-Path: <linux-media+bounces-25846-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 92097A2DE40
	for <lists+linux-media@lfdr.de>; Sun,  9 Feb 2025 15:20:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 38DDD165451
	for <lists+linux-media@lfdr.de>; Sun,  9 Feb 2025 14:20:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF29E1DE8B7;
	Sun,  9 Feb 2025 14:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="V6vdQCkK"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421BE7602D;
	Sun,  9 Feb 2025 14:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739110836; cv=pass; b=ll6aWNe+vwb1Ya9lYDIWjCX5Mj1mD009GMbh4xvl4wGcXjcQtd0m7OUO5FFk8VCy392Ix/pY8H96PxIrOUCvswVnrkT7AEmaukV5alEqtVY1m6gZQ5iImkDwmcygrNaJPUthAJThUlgjZ6Qk38utzwekg2iYSU9gdHIqeSRy6SQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739110836; c=relaxed/simple;
	bh=1Sug2c693Lgh4dH6IPfzlesBDu3aBWBU5UIUzgWe9LQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sn9rz3h/P4JVK5U9AioPo+AadH61odbW86w8H6kd6saL3rVVz4RAjGSHwr9O+yhZ18DqveOnms0X30hbjwVRps8e+iYitB+2sxIfgX2dncMwLEYoBhn/1geNqBTeY3DcZ0rfruYThkUDTvQWbeQX6GSDvlV12aszcw914Z63qNs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=V6vdQCkK; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4YrVGv3VgszyQx;
	Sun,  9 Feb 2025 16:20:23 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1739110823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3yreCpuFhLzNoChfFY5jECVucnlSVm8jP7X9qttv4G8=;
	b=V6vdQCkKseCwa50j6VImTWKdmTjhBRtgF7q5VdKhgLbBxgZoBAd78ALrRFYI46lTFAjeU6
	3BxzPZpETf1RYoKQahVZYmcnCDVBdt25P2YjP8ZlmJAnQmPufCWsPUGM9qOu2yIUSp4rvm
	0fqnK7m0Do5j5iz5ArnSz8itHxawP1Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1739110823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3yreCpuFhLzNoChfFY5jECVucnlSVm8jP7X9qttv4G8=;
	b=HSVO5rKM1PXqOQDV2SA3jfautp9Cyb3mVi5TeguWPCi/TJIiYGbya6HsgHLKbwQ7ceNG4w
	bBLtY6bYYox+LK7wDE9+/rPKrl6oN836xYSiFe3AXyQ06nrUSNa1ys4cwiIagZdeh0R2FA
	PzUGC6iVMb4OGxwMIC8RSxPC90IEp08=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1739110823; a=rsa-sha256; cv=none;
	b=cOJxH6ql3eXJdCGSe9evp7Mi4VVB52NLpHo8tM2DrApuI6Y7cz/r6hthITu0x24IWbK0Hp
	ZlewHA9zOgmq15TkvdQOnhVeCX2ZrBGVlOvjty7Oa5XXxV92fn7zCeDC+J/t4dU/4XHvQ4
	jE1oDoGXNNNby30mS06ifrAu7jGoEzk=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 00956634C96;
	Sun,  9 Feb 2025 16:20:22 +0200 (EET)
Date: Sun, 9 Feb 2025 14:20:22 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: git@apitzsch.eu
Cc: Daniel Scally <djrscally@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: dw9719: Add of_match table
Message-ID: <Z6i5puujYD5sJ64n@valkosipuli.retiisi.eu>
References: <20250208-dw9761dts-v2-1-c038f8a2fb94@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250208-dw9761dts-v2-1-c038f8a2fb94@apitzsch.eu>

Hi André,

On Sat, Feb 08, 2025 at 12:13:49PM +0100, André Apitzsch via B4 Relay wrote:
> From: André Apitzsch <git@apitzsch.eu>
> 
> Add of_match table for "dongwoon,dw9719" and "dongwoon,dw9761"
> compatible string. This fixes automatic driver loading when using a
> device-tree, and if built as a module like major linux distributions do.
> 
> Signed-off-by: André Apitzsch <git@apitzsch.eu>

How about the DT bindings?

The configuration should be documented, too. See e.g. for an example
Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml .

-- 
Regards,

Sakari Ailus

