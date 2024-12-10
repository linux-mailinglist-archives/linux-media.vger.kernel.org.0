Return-Path: <linux-media+bounces-23062-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C079EB203
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 14:35:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21F262811D6
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 13:35:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84EDA1AA1C6;
	Tue, 10 Dec 2024 13:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="SlQ/id5d"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B4023DEB6;
	Tue, 10 Dec 2024 13:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733837750; cv=pass; b=h9MzbKTNS6LkOxGcfaJ7l+jZHohPAShn+5JXXwDQb7+FPl7D7atOXUKWWmGMzK38q0vZd4IpTo7vaMCmLD3FTQuTFgcp0Lvr1QPKCblz9N6vKT7aIBKPR9ViWVkEYWxqgyc9S2WRJgGgQCHAldLd+nJvUa25LhsehX4SOObg+E8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733837750; c=relaxed/simple;
	bh=t5sG9BvKzQF+6KKzdapCOjebiVq4LKTYmKMf1k5AFKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JXCPNKlL/Yvi+bp2NHJFl7FSxf6DZGEAF3GIxywlRMGAkDQoZJs3u52H2Gin9sHDNUX4yMyAy+L38zkQifA1OrCGsdcvUhPX8bjmMPx4nzCF7q8IRKz1vGUEFHVjdagfgNjVylnZrzQGjAsH+xPMvtByar1gcbxwFIdkkflnZNU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=SlQ/id5d; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4Y709Q0WwxzyTW;
	Tue, 10 Dec 2024 15:35:37 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1733837738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LSV8eL4SlUrCerozsKMYo3rboGRFa/MNUGUGK/YYrFs=;
	b=SlQ/id5d8UaiFBkZWBfWrf+eBGn9RFw99qdKO/xDiw0AsLha01DEFf/DMhKfbKAw72MWiv
	3B5tBTrr0Xd4jJ8+FPkFSwbaeMzqkhuThfKELiLXqdlWxRoOCE8LzQFkCtxk3TExJNqhO9
	cxirrPYHwUf0J+ODwPAjf/49sEZoRr0=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1733837738; a=rsa-sha256; cv=none;
	b=xN6Kh4VCqq5KLM3QzcUvioQodE5RlUFQKuzhk8agEsNjsfKirvwcxktmMcxqAtP6Ez6rEF
	bsJ5KXxblVW6smi3+Mlk1pUKZx5YSlRpLIt3wt79bVpzItrhz8GABup1e231I+QJU6cHlp
	PMcdp0ZRuQflYgQnSpFVmxd+6/xnstM=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1733837738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LSV8eL4SlUrCerozsKMYo3rboGRFa/MNUGUGK/YYrFs=;
	b=lOoGUe/qpg6aNmROXVtUJ0Uy2JjiR+60aMgP+LkXDwDfr+p4oiD+3mbowzSf3ID0tZBH5M
	fL3FTb3/2eZ6KSUEHXnpB/cfbts0b2B5xwr/YZD/Y7It93OzoGea9T2F7O+r854BpDiJJ1
	3YeHlnUTHcQERy8oWV9Xn9ADroi+n/0=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id A6EF2634C96;
	Tue, 10 Dec 2024 15:35:35 +0200 (EET)
Date: Tue, 10 Dec 2024 13:35:35 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Alexandru Ardelean <aardelean@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	laurent.pinchart@ideasonboard.com, manivannan.sadhasivam@linaro.org,
	sakari.ailus@linux.intel.com, mchehab@kernel.org,
	kieran.bingham@ideasonboard.com, naush@raspberrypi.com
Subject: Re: [PATCH v2] drivers: media: imx296: Add standby delay during probe
Message-ID: <Z1hDpzB6LOZYH8vA@valkosipuli.retiisi.eu>
References: <20241115142021.574402-1-aardelean@baylibre.com>
 <20241115180717.10820-1-aardelean@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241115180717.10820-1-aardelean@baylibre.com>

Hi Alexandru,

On Fri, Nov 15, 2024 at 08:07:17PM +0200, Alexandru Ardelean wrote:
> From: Naushir Patuck <naush@raspberrypi.com>
> 
> Add a 2-5ms delay when coming out of standby and before reading the
> sensor info register durning probe, as instructed by the datasheet. This
> standby delay is already present when the sensor starts streaming.
> 
> During a cold-boot, reading the IMX296_SENSOR_INFO register would often
> return a value of 0x0000, if this delay is not present before.
> 
> Fixes: cb33db2b6ccfe ("media: i2c: IMX296 camera sensor driver")
> Tested-by: Alexandru Ardelean <aardelean@baylibre.com>
> Signed-off-by: Naushir Patuck <naush@raspberrypi.com>

Thanks for the patch.

You always need to Cc: stable if you have a Fixes: tag nowadays. I'll add
it this time.

-- 
Sakari Ailus

